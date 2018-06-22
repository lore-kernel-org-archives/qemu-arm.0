Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h8-v6sm1284797wmb.32.2018.06.22.07.12.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:10 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id BFFC03E0AC0;
	Fri, 22 Jun 2018 15:12:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 09/22] risugen: use fewer insns for aarch64 immediate load
Date: Fri, 22 Jun 2018 15:11:52 +0100
Message-Id: <20180622141205.16306-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iyFFSSY8jQTa

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risugen_arm.pm | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/risugen_arm.pm b/risugen_arm.pm
index 83e521d..485e94e 100644
--- a/risugen_arm.pm
+++ b/risugen_arm.pm
@@ -261,15 +261,13 @@ sub write_mov_rr($$)
 
 sub write_mov_ri16($$$)
 {
-    # Write 16 bits of immediate to register, using either MOVW or MOVT
+    # Write 16 bits of immediate to register.
     my ($rd, $imm, $is_movt) = @_;
-    die "write_mov_ri16: immediate $imm out of range\n" if (($imm & 0xffff0000) != 0);
 
-    if ($is_aarch64) {
-        # Use MOVZ 0x52800000. is_movt means MOVK of high bits */
-        insn32(0xd2800000 | ($is_movt << 29) | ($is_movt ? 16 << 17 : 0) | ($imm << 5) | $rd);
+    die "write_mov_ri16: invalid operation for this arch.\n" if ($is_aarch64);
+    die "write_mov_ri16: immediate $imm out of range\n" if (($imm & 0xffff0000) != 0);
 
-    } elsif ($is_thumb) {
+    if ($is_thumb) {
         # enc T3
         my ($imm4, $i, $imm3, $imm8) = (($imm & 0xf000) >> 12,
                                         ($imm & 0x0800) >> 11,
@@ -287,16 +285,24 @@ sub write_mov_ri16($$$)
 
 sub write_mov_ri($$)
 {
-    # We always use a MOVW/MOVT pair, for simplicity.
-    # on aarch64, we use a MOVZ/MOVK pair.
     my ($rd, $imm) = @_;
-    write_mov_ri16($rd, ($imm & 0xffff), 0);
     my $highhalf = ($imm >> 16) & 0xffff;
-    write_mov_ri16($rd, $highhalf, 1) if $highhalf;
 
-    if ($is_aarch64 && $imm < 0) {
-        # sign extend to allow small negative imm constants
-        write_sxt32($rd, $rd);
+    if ($is_aarch64) {
+        if ($imm < 0) {
+            # MOVN
+            insn32(0x92800000 | ((~$imm & 0xffff) << 5) | $rd);
+            # MOVK, LSL 16
+            insn32(0xf2a00000 | ($highhalf << 5) | $rd) if $highhalf != 0xffff;
+        } else {
+            # MOVZ
+            insn32(0x52800000 | (($imm & 0xffff) << 5) | $rd);
+            # MOVK, LSL 16
+            insn32(0xf2a00000 | ($highhalf << 5) | $rd) if $highhalf != 0;
+        }
+    } else {
+        write_mov_ri16($rd, ($imm & 0xffff), 0);
+        write_mov_ri16($rd, $highhalf, 1) if $highhalf;
     }
 }
 
-- 
2.17.1
