Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r27sm52393613wrc.55.2019.10.14.04.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 04:07:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C50081FFCF;
	Mon, 14 Oct 2019 11:49:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	aaron@os.amperecomputing.com,
	peter.puhov@futurewei.com,
	robert.foley@futurewei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v5 44/55] tests/tcg: enable plugin testing
Date: Mon, 14 Oct 2019 11:49:37 +0100
Message-Id: <20191014104948.4291-45-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014104948.4291-1-alex.bennee@linaro.org>
References: <20191014104948.4291-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SmbRVa0bEy6Y

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
v5
  - fix for the latest changes to check-tcg
  - extend timeout for plugin tests
  - add special runner for semihosting with plugin
  - fix naming of test in call output
  - add special plugin aware runners for semihosting
---
 tests/Makefile.include                | 11 ++++++++-
 tests/tcg/Makefile.target             | 35 +++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target     |  6 +++++
 tests/tcg/arm/Makefile.softmmu-target |  1 +
 tests/tcg/arm/Makefile.target         |  6 +++++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3543451ed3..646a704e65 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1052,6 +1052,15 @@ check-softfloat:
 		"SKIPPED for non-TCG builds")
 endif
 
+# Plugins
+ifeq ($(CONFIG_PLUGIN),y)
+.PHONY: plugins
+plugins:
+	$(call quiet-command,\
+		$(MAKE) $(SUBDIR_MAKEFLAGS) -C tests/plugin V="$(V)", \
+		"BUILD", "plugins")
+endif
+
 # Per guest TCG tests
 
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGET_DIRS))
@@ -1062,7 +1071,7 @@ RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGET_DIRS))
 $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
 	$(eval -include $(SRC_PATH)/tests/tcg/Makefile.prereqs))
 
-build-tcg-tests-%:
+build-tcg-tests-%: $(if $(CONFIG_PLUGIN),plugins)
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
 		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
 		SRC_PATH=$(SRC_PATH) \
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 9664613002..d25fc64300 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -123,11 +123,38 @@ all: $(TESTS) $(EXTRA_TESTS)
 #
 
 RUN_TESTS=$(patsubst %,run-%, $(TESTS))
+
+# If plugins exist also include those in the tests
+ifeq ($(CONFIG_PLUGIN),y)
+PLUGIN_DIR=../../plugin
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
+		$(eval run-plugin-$(t)-with-$(p): TIMEOUT=30) \
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
+	"$* on $(TARGET_NAME)")
 else
 run-%: %
 	$(call run-test, $<, \
@@ -135,6 +162,14 @@ run-%: %
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
+	  "$* on $(TARGET_NAME)")
 endif
 
 gdb-%: %
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 509f1afa93..96d2321045 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -26,4 +26,10 @@ AARCH64_TESTS += semihosting
 run-semihosting: semihosting
 	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
+run-plugin-semihosting-with-%:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+		-plugin $(PLUGIN_DIR)/$(call extract-plugin,$@) \
+		 $(call strip-plugin,$<) 2> $<.err, \
+		"$< on $(TARGET_NAME) with $*")
+
 TESTS += $(AARCH64_TESTS)
diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 231e9a57b4..3fe237ba39 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -23,3 +23,4 @@ LDFLAGS+=-nostdlib -N -static
 test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
+run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 3ddff85240..0765f37ff0 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -34,6 +34,12 @@ ARM_TESTS += semihosting
 run-semihosting: semihosting
 	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
+run-plugin-semihosting-with-%:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+		-plugin $(PLUGIN_DIR)/$(call extract-plugin,$@) \
+		 $(call strip-plugin,$<) 2> $<.err, \
+		"$< on $(TARGET_NAME) with $*")
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.20.1
