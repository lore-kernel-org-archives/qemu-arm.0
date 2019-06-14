Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x129sm5473118wmg.44.2019.06.14.10.18.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 10:18:29 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3B87D1FFC1;
	Fri, 14 Jun 2019 18:12:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v3 42/50] tests/tcg: enable plugin testing
Date: Fri, 14 Jun 2019 18:11:52 +0100
Message-Id: <20190614171200.21078-43-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uI4pcyPQqACT

If CONFIG_PLUGINS is enabled then lets enable testing for all our TCG
targets. This is a simple smoke test that ensure we don't crash or
otherwise barf out by running each plugin against each test.

There is a minor knock on effect for additional runners which need
specialised QEMU_OPTS which will also need to declare a plugin version
of the runner. If this gets onerous we might need to add another
helper.

Checking the results of the plugins is left for a later exercise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include                | 10 +++++++-
 tests/tcg/Makefile                    | 34 +++++++++++++++++++++++++++
 tests/tcg/arm/Makefile.softmmu-target |  1 +
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index db750dd6d0..04b0460262 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1047,6 +1047,14 @@ check-softfloat:
 		"SKIPPED for non-TCG builds")
 endif
 
+# Plugins
+ifeq ($(CONFIG_PLUGIN),y)
+plugins:
+	$(call quiet-command,\
+		$(MAKE) $(SUBDIR_MAKEFLAGS) -C tests/plugin V="$(V)", \
+		"BUILD", "plugins")
+endif
+
 # Per guest TCG tests
 
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGET_DIRS))
@@ -1061,7 +1069,7 @@ $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
 		$(eval build-tcg-tests-$(PROBE_TARGET): $(DOCKER_PREREQ))))
 endif
 
-build-tcg-tests-%:
+build-tcg-tests-%: $(if $(CONFIG_PLUGIN),plugins)
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $* V="$(V)" \
 		SKIP_DOCKER_BUILD=1 TARGET_DIR="$*/" guest-tests, \
 		"BUILD", "TCG tests for $*")
diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 6fa63cc8d5..9474ab2900 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -116,11 +116,37 @@ all: $(TESTS)
 #
 
 RUN_TESTS=$(patsubst %,run-%, $(TESTS))
+
+# If plugins exist also include those in the tests
+ifeq ($(CONFIG_PLUGIN),y)
+PLUGIN_DIR=../../tests/plugin
+VPATH+=$(PLUGIN_DIR)
+PLUGINS=$(notdir $(wildcard $(PLUGIN_DIR)/*.so))
+
+# We need to ensure expand the run-plugin-TEST-with-PLUGIN
+# pre-requistes manually here as we can't use stems to handle it. We
+# also add some special helpers the run-plugin- rules can use bellow.
+
+$(foreach p,$(PLUGINS), \
+	$(foreach t,$(TESTS),\
+		$(eval run-plugin-$(t)-with-$(p): $t $p) \
+		$(eval RUN_TESTS+=run-plugin-$(t)-with-$(p))))
+endif
+
+strip-plugin = $(wordlist 1, 1, $(subst -with-, ,$1))
+extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
+
 RUN_TESTS+=$(EXTRA_RUNS)
 
 ifdef CONFIG_USER_ONLY
 run-%: %
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+
+run-plugin-%:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+		-plugin $(PLUGIN_DIR)/$(call extract-plugin,$@) \
+		 $(call strip-plugin,$<), \
+	"$< on $(TARGET_NAME)")
 else
 run-%: %
 	$(call run-test, $<, \
@@ -128,6 +154,14 @@ run-%: %
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
 	   	  $(QEMU_OPTS) $<, \
 	  "$< on $(TARGET_NAME)")
+
+run-plugin-%:
+	$(call run-test, $@, \
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
+	   	  -plugin $(PLUGIN_DIR)/$(call extract-plugin,$@) \
+	   	  $(QEMU_OPTS) $(call strip-plugin,$<), \
+	  "$< on $(TARGET_NAME)")
 endif
 
 gdb-%: %
diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 49d48d8a1c..cd628306b3 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -25,5 +25,6 @@ LDFLAGS+=-nostdlib -N -static
 test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
+run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
 
 endif
-- 
2.20.1
