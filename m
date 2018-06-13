Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p6-v6sm4253243wrq.19.2018.06.13.05.56.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id AC9403E1228;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 10/22] risugen: add reg_plus_imm_pl and reg_plus_imm_vl address helpers
Date: Wed, 13 Jun 2018 13:55:49 +0100
Message-Id: <20180613125601.14371-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i8wYzgdXtWgN

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risugen_arm.pm | 126 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/risugen_arm.pm b/risugen_arm.pm
index 485e94e..696bf5f 100644
--- a/risugen_arm.pm
+++ b/risugen_arm.pm
@@ -306,6 +306,52 @@ sub write_mov_ri($$)
     }
 }
 
+sub write_addpl_rri($$$)
+{
+    my ($rd, $rn, $imm) = @_;
+    die "write_addpl: invalid operation for this arch.\n" if (!$is_aarch64);
+
+    insn32(0x04605000 | ($rn << 16) | (($imm & 0x3f) << 5) | $rd);
+}
+
+sub write_addvl_rri($$$)
+{
+    my ($rd, $rn, $imm) = @_;
+    die "write_addvl: invalid operation for this arch.\n" if (!$is_aarch64);
+
+    insn32(0x04205000 | ($rn << 16) | (($imm & 0x3f) << 5) | $rd);
+}
+
+sub write_rdvl_ri($$)
+{
+    my ($rd, $imm) = @_;
+    die "write_rdvl: invalid operation for this arch.\n" if (!$is_aarch64);
+
+    insn32(0x04bf5000 | (($imm & 0x3f) << 5) | $rd);
+}
+
+sub write_madd_rrrr($$$$)
+{
+    my ($rd, $rn, $rm, $ra) = @_;
+    die "write_madd: invalid operation for this arch.\n" if (!$is_aarch64);
+
+    insn32(0x9b000000 | ($rm << 16) | ($ra << 10) | ($rn << 5) | $rd);
+}
+
+sub write_msub_rrrr($$$$)
+{
+    my ($rd, $rn, $rm, $ra) = @_;
+    die "write_msub: invalid operation for this arch.\n" if (!$is_aarch64);
+
+    insn32(0x9b008000 | ($rm << 16) | ($ra << 10) | ($rn << 5) | $rd);
+}
+
+sub write_mul_rrr($$$)
+{
+    my ($rd, $rn, $rm) = @_;
+    write_madd_rrrr($rd, $rn, $rm, 31);
+}
+
 # write random fp value of passed precision (1=single, 2=double, 4=quad)
 sub write_random_fpreg_var($)
 {
@@ -767,6 +813,86 @@ sub reg_plus_imm($$@)
     return $base;
 }
 
+sub reg_plus_imm_pl($$@)
+{
+    # Handle reg + immediate addressing mode
+    my ($base, $imm, @trashed) = @_;
+    if ($imm == 0) {
+        return reg($base, @trashed);
+    }
+    write_get_offset();
+
+    # Now r0 is the address we want to do the access to,
+    # so set the basereg by doing the inverse of the
+    # addressing mode calculation, ie base = r0 - imm
+    #
+    # Note that addpl has a 6-bit immediate, but ldr has a 9-bit
+    # immediate, so we need to be able to support larger immediates.
+
+    if (-$imm >= -32 && -$imm <= 31) {
+        write_addpl_rri($base, 0, -$imm);
+    } else {
+        # We borrow r1 and r2 as a temporaries (not a problem
+        # as long as we don't leave anything in a register
+        # which depends on the location of the memory block)
+        write_mov_ri(1, 0);
+        write_mov_ri(2, $imm);
+        write_addpl_rri(1, 1, 1);
+        write_msub_rrrr($base, 1, 2, 0);
+    }
+    if (grep $_ == $base, @trashed) {
+        return -1;
+    }
+    return $base;
+}
+
+sub reg_plus_imm_vl($$@)
+{
+    # The usual address formulation is
+    #   elements = VL DIV esize
+    #   mbytes = msize DIV 8
+    #   addr = base + imm * elements * mbytes
+    # Here we compute
+    #   scale = log2(esize / msize)
+    #   base + (imm * VL) >> scale
+    my ($base, $imm, $scale, @trashed) = @_;
+    if ($imm == 0) {
+        return reg($base, @trashed);
+    }
+    write_get_offset();
+
+    # Now r0 is the address we want to do the access to,
+    # so set the basereg by doing the inverse of the
+    # addressing mode calculation, ie base = r0 - imm
+    #
+    # Note that rdvl/addvl have a 6-bit immediate, but ldr has a 9-bit
+    # immediate, so we need to be able to support larger immediates.
+
+    use integer;
+    my $mul = 1 << $scale;
+    my $imm_div = $imm / $mul;
+
+    if ($imm == $imm_div * $mul && -$imm_div >= -32 && -$imm_div <= 31) {
+        write_addvl_rri($base, 0, -$imm_div);
+    } elsif ($imm >= -32 && $imm <= 31) {
+        write_rdvl_ri(1, $imm);
+        write_sub_rrrs($base, 0, 1, $SHIFT_ASR, $scale);
+    } else {
+        write_rdvl_ri(1, 1);
+        write_mov_ri(2, $imm);
+        if ($scale == 0) {
+            write_msub_rrrr($base, 1, 2, 0);
+        } else {
+            write_mul_rrr(1, 1, 2);
+            write_sub_rrrs($base, 0, 1, $SHIFT_ASR, $scale);
+        }
+    }
+    if (grep $_ == $base, @trashed) {
+        return -1;
+    }
+    return $base;
+}
+
 sub reg_minus_imm($$@)
 {
     my ($base, $imm, @trashed) = @_;
-- 
2.17.1
