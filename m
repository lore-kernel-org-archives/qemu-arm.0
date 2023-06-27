Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bca55000000b003f4248dcfcbsm14145540wml.30.2023.06.27.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:07:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5968A1FFC0;
	Tue, 27 Jun 2023 17:07:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Leonardo Bras <leobras@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Juan Quintela <quintela@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v3 05/36] tests/tcg: add mechanism to handle plugin arguments
Date: Tue, 27 Jun 2023 17:06:29 +0100
Message-Id: <20230627160700.2955547-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160700.2955547-1-alex.bennee@linaro.org>
References: <20230627160700.2955547-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ewoELYGxs/Ir

We recently missed a regression that should have been picked up by
check-tcg. This was because the libmem plugin is effectively a NOP if
the user doesn't specify the type to use.

Rather than changing the default behaviour add an additional expansion
so we can take this into account in future.

Message-Id: <20230623122100.1640995-6-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile.target | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 72876cc84e..2462c26000 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -169,13 +169,17 @@ extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
 
 RUN_TESTS+=$(EXTRA_RUNS)
 
+# Some plugins need additional arguments above the default to fully
+# exercise things. We can define them on a per-test basis here.
+run-plugin-%-with-libmem.so: PLUGIN_ARGS=$(COMMA)inline=true$(COMMA)callback=true
+
 ifeq ($(filter %-softmmu, $(TARGET)),)
 run-%: %
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 
 run-plugin-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
-		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
+		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@)$(PLUGIN_ARGS) \
 		-d plugin -D $*.pout \
 		 $(call strip-plugin,$<))
 else
@@ -189,7 +193,7 @@ run-plugin-%:
 	$(call run-test, $@, \
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
-	   	  -plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
+	   	  -plugin $(PLUGIN_LIB)/$(call extract-plugin,$@)$(PLUGIN_ARGS) \
 	    	  -d plugin -D $*.pout \
 		  $(QEMU_OPTS) $(call strip-plugin,$<))
 endif
-- 
2.39.2
