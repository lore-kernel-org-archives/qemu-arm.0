Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a7-20020adfe5c7000000b0030c6751a49dsm1371386wrn.115.2023.06.27.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:09:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BBD271FFC4;
	Tue, 27 Jun 2023 17:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 08/36] tests/qtests: clean-up and fix leak in generic_fuzz
Date: Tue, 27 Jun 2023 17:09:15 +0100
Message-Id: <20230627160943.2956928-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Be/BZJXT24pV

An update to the clang tooling detects more issues with the code
including a memory leak from the g_string_new() allocation. Clean up
the code to avoid the allocation and use ARRAY_SIZE while we are at
it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/fuzz/generic_fuzz.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index c525d22951..d0a59f7475 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -954,17 +954,10 @@ static void register_generic_fuzz_targets(void)
             .crossover = generic_fuzz_crossover
     });
 
-    GString *name;
-    const generic_fuzz_config *config;
-
-    for (int i = 0;
-         i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
-         i++) {
+    for (int i = 0; i < ARRAY_SIZE(predefined_configs); i++) {
         config = predefined_configs + i;
-        name = g_string_new("generic-fuzz");
-        g_string_append_printf(name, "-%s", config->name);
         fuzz_add_target(&(FuzzTarget){
-                .name = name->str,
+                .name = g_strconcat("generic-fuzz-", config->name, NULL),
                 .description = "Predefined generic-fuzz config.",
                 .get_init_cmdline = generic_fuzz_predefined_config_cmdline,
                 .pre_fuzz = generic_pre_fuzz,
-- 
2.39.2
