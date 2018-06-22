Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g129-v6sm2088364wmf.5.2018.06.22.07.12.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:10 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id B463B3E0A25;
	Fri, 22 Jun 2018 15:12:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 08/22] risugen: Initialize sve predicates with random data
Date: Fri, 22 Jun 2018 15:11:51 +0100
Message-Id: <20180622141205.16306-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fOpaP6GJnbp0

From: Richard Henderson <richard.henderson@linaro.org>

Using ptrue makes most of the uses of predicates trivial.
Therefore, initialize them to something interesting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risugen_arm.pm | 48 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/risugen_arm.pm b/risugen_arm.pm
index bb3ee90..83e521d 100644
--- a/risugen_arm.pm
+++ b/risugen_arm.pm
@@ -174,6 +174,24 @@ sub write_sxt32($$)
     insn32(0x93407c00 | $rn << 5 | $rd);
 }
 
+sub write_add_rri($$$)
+{
+    my ($rd, $rn, $i) = @_;
+    my $sh;
+
+    die "write_add_rri: invalid operation for this arch.\n" if (!$is_aarch64);
+
+    if ($i >= 0 && $i < 0x1000) {
+        $sh = 0;
+    } elsif (($i & 0xfff) || $i >= 0x1000000) {
+        die "invalid immediate for this arch,\n";
+    } else {
+        $sh = 1;
+        $i >>= 12;
+    }
+    insn32(0x91000000 | ($rd << 0) | ($rn << 5) | ($i << 10) | ($sh << 22));
+}
+
 sub write_sub_rrr($$$)
 {
     my ($rd, $rn, $rm) = @_;
@@ -477,33 +495,35 @@ sub write_random_aarch64_svedata()
     # Load SVE registers
     my $align = 16;
     my $vq = 16;                             # quadwords per vector
-    my $datalen = (32 * $vq * 16) + $align;
-
-    write_pc_adr(0, (3 * 4) + ($align - 1)); # insn 1
-    write_align_reg(0, $align);              # insn 2
-    write_jump_fwd($datalen);                # insn 3
+    my $veclen = 32 * $vq * 16;
+    my $predlen = 16 * $vq * 2;
+    my $datalen = $veclen + $predlen;
 
-    # align safety
-    for (my $i = 0; $i < ($align / 4); $i++) {
-        # align with nops
-        insn32(0xd503201f);
-    };
+    write_pc_adr(0, 2 * 4);     # insn 1
+    write_jump_fwd($datalen);   # insn 2
 
     for (my $rt = 0; $rt <= 31; $rt++) {
         for (my $q = 0; $q < $vq; $q++) {
             write_random_fpreg_var(4); # quad
         }
     }
-
-    # Reset all the predicate registers to all true
-    for (my $p = 0; $p < 16; $p++) {
-        insn32(0x2518e3e0 | $p);
+    for (my $rt = 0; $rt <= 15; $rt++) {
+        for (my $q = 0; $q < $vq; $q++) {
+            insn16(rand(0xffff));
+        }
     }
 
     for (my $rt = 0; $rt <= 31; $rt++) {
         # ldr z$rt, [x0, #$rt, mul vl]
         insn32(0x85804000 + $rt + (($rt & 7) << 10) + (($rt & 0x18) << 13));
     }
+
+    write_add_rri(0, 0, $veclen);
+
+    for (my $rt = 0; $rt <= 15; $rt++) {
+        # ldr p$rt, [x0, #$pt, mul vl]
+        insn32(0x85800000 + $rt + (($rt & 7) << 10) + (($rt & 0x18) << 13));
+    }
 }
 
 sub write_random_aarch64_regdata($$)
-- 
2.17.1
