Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f6a3769bsm164672266b.14.2025.03.04.14.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 561CF625E8;
	Tue,  4 Mar 2025 22:24:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 29/32] plugins/api: build only once
Date: Tue,  4 Mar 2025 22:24:36 +0000
Message-Id: <20250304222439.2035603-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cSRdB3AOuQvf

Now all the softmmu/user-mode stuff has been split out we can build
this compilation unit only once.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250225110844.3296991-11-alex.bennee@linaro.org>
---
 plugins/api.c       | 11 -----------
 plugins/meson.build |  3 +--
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/plugins/api.c b/plugins/api.c
index 832bf6ee5e..604ce06802 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -46,17 +46,6 @@
 #include "exec/translator.h"
 #include "disas/disas.h"
 #include "plugin.h"
-#ifndef CONFIG_USER_ONLY
-#include "qapi/error.h"
-#include "migration/blocker.h"
-#include "qemu/plugin-memory.h"
-#include "hw/boards.h"
-#else
-#include "qemu.h"
-#ifdef CONFIG_LINUX
-#include "loader.h"
-#endif
-#endif
 
 /* Uninstall and Reset handlers */
 
diff --git a/plugins/meson.build b/plugins/meson.build
index 942b59e904..d27220d5ff 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -61,9 +61,8 @@ endif
 user_ss.add(files('user.c', 'api-user.c'))
 system_ss.add(files('system.c', 'api-system.c'))
 
-common_ss.add(files('loader.c'))
+common_ss.add(files('loader.c', 'api.c'))
 
 specific_ss.add(files(
   'core.c',
-  'api.c',
 ))
-- 
2.39.5
