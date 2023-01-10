Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c511300b003d9862ec435sm3763112wms.20.2023.01.10.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 081B21FFCE;
	Tue, 10 Jan 2023 17:39:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Ed Maste <emaste@freebsd.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Emilio Cota <cota@braap.org>
Subject: [PATCH 25/26] tcg: exclude lookup_tb_ptr from helper instrumentation
Date: Tue, 10 Jan 2023 17:39:21 +0000
Message-Id: <20230110173922.265055-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DJhBSsfNCetV

From: Emilio Cota <cota@braap.org>

It is internal to TCG and therefore we know it does not
access guest memory.

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108164731.61469-4-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/tcg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index da91779890..ee67eefc0c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1652,8 +1652,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     op = tcg_op_alloc(INDEX_op_call, total_args);
 
 #ifdef CONFIG_PLUGIN
-    /* detect non-plugin helpers */
-    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_", 7))) {
+    /* flag helpers that are not internal to TCG */
+    if (tcg_ctx->plugin_insn &&
+        strncmp(info->name, "plugin_", 7) &&
+        strcmp(info->name, "lookup_tb_ptr")) {
         tcg_ctx->plugin_insn->calls_helpers = true;
     }
 #endif
-- 
2.34.1
