Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k26-20020a7bc41a000000b003f080b2f9f4sm11751894wmi.27.2023.06.26.14.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 14:59:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B91EB1FFC3;
	Mon, 26 Jun 2023 22:59:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 08/26] tests/qtests: clean-up and fix leak in generic_fuzz
Date: Mon, 26 Jun 2023 22:59:08 +0100
Message-Id: <20230626215926.2522656-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215926.2522656-1-alex.bennee@linaro.org>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VmaKyZKO/rZO

An update to the clang tooling detects more issues with the code
including a memory leak from the g_string_new() allocation. Clean up
the code with g_autoptr and use ARRAY_SIZE while we are at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/fuzz/generic_fuzz.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index c525d22951..a4841181cc 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
             .crossover = generic_fuzz_crossover
     });
 
-    GString *name;
+    g_autoptr(GString) name = g_string_new("");
     const generic_fuzz_config *config;
 
-    for (int i = 0;
-         i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
-         i++) {
+    for (int i = 0; i < ARRAY_SIZE(predefined_configs); i++) {
         config = predefined_configs + i;
-        name = g_string_new("generic-fuzz");
-        g_string_append_printf(name, "-%s", config->name);
+        g_string_printf(name, "generic-fuzz-%s", config->name);
         fuzz_add_target(&(FuzzTarget){
-                .name = name->str,
+                .name = g_strdup(name->str),
                 .description = "Predefined generic-fuzz config.",
                 .get_init_cmdline = generic_fuzz_predefined_config_cmdline,
                 .pre_fuzz = generic_pre_fuzz,
-- 
2.39.2
