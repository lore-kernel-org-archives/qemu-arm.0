Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t15sm9442318wrx.84.2019.07.05.09.04.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 09:04:24 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DDC011FF92;
	Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Jon Doron <arilou@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH  v1 5/5] gdbstub: revert to previous set_reg behaviour
Date: Fri,  5 Jul 2019 17:04:21 +0100
Message-Id: <20190705160421.19015-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705160421.19015-1-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3NwCBD5ZqtIB

The refactoring of handle_set_reg missed the fact we previously had
responded with an empty packet when we were not using XML based
protocols. This broke the fallback behaviour for architectures that
don't have registers defined in QEMU's gdb-xml directory.

Revert to the previous behaviour and clean up the commentary for what
is going on.

Fixes: 62b3320bddd
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Jon Doron <arilou@gmail.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 gdbstub.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index ea3349d1aa..b6df7ee25a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1669,12 +1669,23 @@ static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, "E22");
 }
 
+/*
+ * handle_set/get_reg
+ *
+ * Older gdb are really dumb, and don't use 'G/g' if 'P/p' is available.
+ * This works, but can be very slow. Anything new enough to understand
+ * XML also knows how to use this properly. However to use this we
+ * need to define a local XML file as well as be talking to a
+ * reasonably modern gdb. Responding with an empty packet will cause
+ * the remote gdb to fallback to older methods.
+ */
+
 static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     int reg_size;
 
     if (!gdb_has_xml) {
-        put_packet(gdb_ctx->s, "E00");
+        put_packet(gdb_ctx->s, "");
         return;
     }
 
@@ -1694,11 +1705,6 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     int reg_size;
 
-    /*
-     * Older gdb are really dumb, and don't use 'g' if 'p' is avaialable.
-     * This works, but can be very slow.  Anything new enough to
-     * understand XML also knows how to use this properly.
-     */
     if (!gdb_has_xml) {
         put_packet(gdb_ctx->s, "");
         return;
-- 
2.20.1
