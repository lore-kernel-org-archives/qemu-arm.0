Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf7a9306a3sm397112466b.90.2025.03.04.14.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:34:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 702AB625FA;
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
Subject: [PATCH v2 30/32] plugins/core: make a single build unit
Date: Tue,  4 Mar 2025 22:24:37 +0000
Message-Id: <20250304222439.2035603-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NeZjbKVvagBY

Trim through the includes and remove everything not needed for the
core. Only include tcg-op-common.h to remove the need to
TARGET_LONG_BITS and move the build unit into the common set.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c      | 10 +---------
 plugins/meson.build |  5 +----
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index bb105e8e68..eb9281fe54 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -12,22 +12,14 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #include "qemu/osdep.h"
-#include "qemu/error-report.h"
-#include "qemu/config-file.h"
-#include "qapi/error.h"
 #include "qemu/lockable.h"
 #include "qemu/option.h"
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
 #include "qemu/rcu_queue.h"
-#include "qemu/xxhash.h"
 #include "qemu/rcu.h"
-#include "hw/core/cpu.h"
-
-#include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-#include "tcg/tcg.h"
-#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-common.h"
 #include "plugin.h"
 
 struct qemu_plugin_cb {
diff --git a/plugins/meson.build b/plugins/meson.build
index d27220d5ff..3be8245a69 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -61,8 +61,5 @@ endif
 user_ss.add(files('user.c', 'api-user.c'))
 system_ss.add(files('system.c', 'api-system.c'))
 
-common_ss.add(files('loader.c', 'api.c'))
+common_ss.add(files('loader.c', 'api.c', 'core.c'))
 
-specific_ss.add(files(
-  'core.c',
-))
-- 
2.39.5
