Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p125sm21042637wmd.16.2016.03.15.07.30.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2016 07:30:31 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 054203E04BD;
	Tue, 15 Mar 2016 14:30:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: rth@twiddle.net,
	crosthwaitepeter@gmail.com,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 7/9] target-arm: dfilter support for in_asm
Date: Tue, 15 Mar 2016 14:30:22 +0000
Message-Id: <1458052224-9316-9-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1458052224-9316-1-git-send-email-alex.bennee@linaro.org>
References: <1458052224-9316-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5YUfnzTk/MU9

Each individual architecture needs to use the qemu_log_in_addr_range()
feature for enabling in_asm output as it is part of the frontend.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Richard Henderson  <rth@twiddle.net>

---
v5
  - no longer wrapping tcg_gen_insn_start (was tcg_gen_debug)
  - reword to handle only in_asm
  - added r-b tag
v8
  - added r-b tag
---
 target-arm/translate-a64.c | 3 ++-
 target-arm/translate.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index f0c73df..b13cff7 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11225,7 +11225,8 @@ done_generating:
     gen_tb_end(tb, num_insns);
 
 #ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
+        qemu_log_in_addr_range(pc_start)) {
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 025c7a5..78df0b6 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11718,7 +11718,8 @@ done_generating:
     gen_tb_end(tb, num_insns);
 
 #ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
+        qemu_log_in_addr_range(pc_start)) {
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
-- 
2.7.2
