Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1e87587basm253720166b.66.2025.03.04.14.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:29:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 657FD5FC87;
	Tue,  4 Mar 2025 22:24:41 +0000 (GMT)
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
Subject: [PATCH v2 20/32] plugins/api: use qemu_target_page_mask() to get value
Date: Tue,  4 Mar 2025 22:24:27 +0000
Message-Id: <20250304222439.2035603-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2OeA78NBaJVb

Requiring TARGET_PAGE_MASK to be defined gets in the way of building
this unit once. qemu_target_page_mask() will tell us what it is.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250226140343.3907080-16-alex.bennee@linaro.org>

---
v2
  - use the proper qemu_target_page_mask() api
---
 plugins/api.c                       | 3 ++-
 tests/tcg/hexagon/Makefile.target   | 2 +-
 tests/tcg/multiarch/Makefile.target | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

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
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 4dfc39bc98..e5182c01d8 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -18,7 +18,7 @@
 # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
 EXTRA_RUNS =
 
-CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal -Wno-unknown-warning-option
+CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
 CFLAGS += -fno-unroll-loops -fno-stack-protector
 
 HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index c769a7d69d..45c9cfe18c 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -51,7 +51,7 @@ sigreturn-sigmask: LDFLAGS+=-pthread
 # Since this is just a standard piece of library code we've borrowed for a
 # TCG test case, suppress the warning rather than trying to modify the
 # code to work around the compiler.
-sha1: CFLAGS+=-Wno-stringop-overread
+sha1: CFLAGS+=-Wno-stringop-overread -Wno-unknown-warning-option
 
 # The vma-pthread seems very sensitive on gitlab and we currently
 # don't know if its exposing a real bug or the test is flaky.
-- 
2.39.5
