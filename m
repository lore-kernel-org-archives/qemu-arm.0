Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d5705000000b002bdbde1d3absm2334399wrv.78.2023.01.24.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 895FB1FFD3;
	Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Emilio Cota <cota@braap.org>
Subject: [PATCH v2 33/35] tcg: exclude non-memory effecting helpers from instrumentation
Date: Tue, 24 Jan 2023 18:01:25 +0000
Message-Id: <20230124180127.1881110-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ulCo61ungRVk

From: Emilio Cota <cota@braap.org>

There are actually a whole bunch of helpers that don't affect memory
that we shouldn't instrument. They are helpfully identified by the
TCG_CALL_NO_SIDE_EFFECTS flag which marks out lookup_tb_ptr as well as
a lot of the maths helpers. To avoid the string compare we introduce a
new flag for plugin internals so we skip that too.

Related: #1381
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108164731.61469-4-cota@braap.org>
[AJB: updated to skip all no SE plugins, add flag for plugin helper]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use TCG_CALL_NO_SIDE_EFFECTS as suggested by rth
  - add flag for plugin specific helpers
---
 accel/tcg/plugin-helpers.h | 4 ++--
 include/tcg/tcg.h          | 2 ++
 tcg/tcg.c                  | 6 ++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
index 9829abe4a9..8e685e0654 100644
--- a/accel/tcg/plugin-helpers.h
+++ b/accel/tcg/plugin-helpers.h
@@ -1,4 +1,4 @@
 #ifdef CONFIG_PLUGIN
-DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
-DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i64, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, ptr)
+DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, i32, i64, ptr)
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6f497172f8..8dc291d030 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -405,6 +405,8 @@ typedef TCGv_ptr TCGv_env;
 #define TCG_CALL_NO_SIDE_EFFECTS    0x0004
 /* Helper is G_NORETURN.  */
 #define TCG_CALL_NO_RETURN          0x0008
+/* Helper is part of Plugins.  */
+#define TCG_CALL_PLUGIN             0x0010
 
 /* convenience version of most used call flags */
 #define TCG_CALL_NO_RWG         TCG_CALL_NO_READ_GLOBALS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d502327be2..fd557d55d3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1674,8 +1674,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     op = tcg_op_alloc(INDEX_op_call, total_args);
 
 #ifdef CONFIG_PLUGIN
-    /* detect non-plugin helpers */
-    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_", 7))) {
+    /* Flag helpers that may affect guest state */
+    if (tcg_ctx->plugin_insn &&
+        !(info->flags & TCG_CALL_PLUGIN) &&
+        !(info->flags & TCG_CALL_NO_SIDE_EFFECTS)) {
         tcg_ctx->plugin_insn->calls_helpers = true;
     }
 #endif
-- 
2.34.1
