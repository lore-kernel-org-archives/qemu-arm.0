Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h132sm21608023wmf.9.2016.02.22.07.59.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Feb 2016 07:59:59 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id F15A93E033F;
	Mon, 22 Feb 2016 15:59:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: rth@twiddle.net,
	crosthwaitepeter@gmail.com,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	dgilbert@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v7 7/9] target-arm: dfilter support for in_asm
Date: Mon, 22 Feb 2016 15:59:45 +0000
Message-Id: <1456156787-17509-8-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456156787-17509-1-git-send-email-alex.bennee@linaro.org>
References: <1456156787-17509-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CoVJJMwOn1HQ

Each individual architecture needs to use the qemu_log_in_addr_range()
feature for enabling in_asm output as it is part of the frontend.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

---
v5
  - no longer wrapping tcg_gen_insn_start (was tcg_gen_debug)
  - reword to handle only in_asm
  - added r-b tag
---
 target-arm/translate-a64.c | 3 ++-
 target-arm/translate.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 7f65aea..e65263c 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11213,7 +11213,8 @@ done_generating:
     gen_tb_end(tb, num_insns);
 
 #ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
+        qemu_log_in_addr_range(pc_start)) {
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
diff --git a/target-arm/translate.c b/target-arm/translate.c
index e69145d..665e9ab 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11640,7 +11640,8 @@ done_generating:
     gen_tb_end(tb, num_insns);
 
 #ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
+        qemu_log_in_addr_range(pc_start)) {
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
-- 
2.7.1
