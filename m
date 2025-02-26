Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b591sm23363995e9.6.2025.02.26.06.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6417560593;
	Wed, 26 Feb 2025 14:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 15/25] plugins/api: use qemu_target_page_mask() to get value
Date: Wed, 26 Feb 2025 14:03:33 +0000
Message-Id: <20250226140343.3907080-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oqTtc6fXhZt3

Requiring TARGET_PAGE_MASK to be defined gets in the way of building
this unit once. qemu_target_page_mask() will tell us what it is.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250225110844.3296991-2-alex.bennee@linaro.org>

---
v2
  - use the proper qemu_target_page_mask() api
---
 plugins/api.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/plugins/api.c b/plugins/api.c
index cf8cdf076a..fa4d495277 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -43,6 +43,7 @@
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
+#include "exec/target_page.h"
 #include "exec/translation-block.h"
 #include "exec/translator.h"
 #include "disas/disas.h"
@@ -287,7 +288,7 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn)
 void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn)
 {
     const DisasContextBase *db = tcg_ctx->plugin_db;
-    vaddr page0_last = db->pc_first | ~TARGET_PAGE_MASK;
+    vaddr page0_last = db->pc_first | ~qemu_target_page_mask();
 
     if (db->fake_insn) {
         return NULL;
-- 
2.39.5
