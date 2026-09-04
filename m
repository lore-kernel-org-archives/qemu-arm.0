Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFC7C61DD6
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 12:49:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2TJO-0006CO-CT; Fri, 04 Sep 2026 08:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2TJL-0006B8-5o
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 08:46:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2TJH-0006tX-MA
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 08:46:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48584dc164fso914773f8f.0
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788525982; x=1789130782; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3dgVuutlV7hrgQvHehoq33u4nkPWd6zJN4Tj9pV47lc=;
 b=XzLoBBhDbgd32U4e9QcVkm/KHj2QccZ2HRtjVP+o41gefahFR6IL8eOLkJQIKtKDEp
 5idbjOjY9VlqjIb6HNmDwQ6fHsxZsQDswmxinMrGxQC857a9lad+2N3wVT8VZT3eKlBm
 NfcgTljbZJISn+CoPYOvjEU4eoOpgRDpcgRNkC8lGRxUuwovtYs2Zb/BsivFahGVS+ON
 Y53ItSy08kUuPUTqPwBP4oDsjSMfqdcWh1zLkq/ZhVNk3kjE20PPYA6OnZW4NReHuO6C
 m5Bay5yd5tK7siGoph0m4Bn/AEEm7IRB9XPAJPQ41vZFQajKU/uJ46Ny89ReOj+Z9L/L
 jN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788525982; x=1789130782;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3dgVuutlV7hrgQvHehoq33u4nkPWd6zJN4Tj9pV47lc=;
 b=ceEHzcM/toMw/o4wakQIv+6FOoF8hZuTOzLF57kvDpGe7fop2WNTndoqYywjA8qKqF
 QwsiodXjx1BqLUztURI1Z8VB0uXN7cpdbSHiwdugmYEShc0FT8D1VAcOOXMSb0I4fdGl
 nQrgmoQMwo5y4qoU0KQTy99jd33i0fbT6LH1OBiePx0WD/qcffzbJ/nfe1H880mW1eyP
 G7dXVZ5ngcjena6Q0sDV9wBghJ2F0aibHdV/3Sf1IQqB37FF8miPuk2nckbqaOZB5cB7
 ST9KAZHUtjNkk/5FQo65xBZPSFfwG/gl+5/sUIoV/PBlO6zwpuy5MPI1yqLoWeVELxOQ
 pbeg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzUkHhBZdUvw9T96MyzLxpQlOFvA1lXBruRKoM/S3c7Ql6k7Bl2UoO1CsRPrRsWNTJK0gECKTuIhA==@nongnu.org
X-Gm-Message-State: AFuF++nJS5cWJU8qnLS7HpF+pLSi7zwEb/8AScpuvTCIN9kHWZQbJq98
 JGXavWQGunFJZVD0zHD46R3TKbzXGzRpPHC3YS5grdLc6GAWYC0JZTGJOYKfPkRYVI0=
X-Gm-Gg: AYBFou2WIeK8KZeoejAXX9B3kloWpfQbUQ2e+uf4M1vtYotpeC8iBZ6lYdN9qfa8lwK
 PXWWjOVCU401MMbsGS1nxGNcToD1fwYxDc+U+qFM2HkMNDZBwRXWR+VysXHsfEQ+yN82bW5UT0d
 ncAYCXMY9a6J+51xcV5nzlmrFOdxOVScg8nIN+IhNIWB63yRtu3jzwxO5y77aaxC0wfnDynNv01
 7OGghpwKeC6VKmMJXrmkDxIL59wpTxd9dG3sKVqf0MIyK508S1OgSQ5kvhd4nThDhiyYDzb3+vm
 /MUJwlYBE8Pf8Y2votsQj8Tf10P+FUnZ5oHVQqWI5dprD3zfLKhk4yfQDe6277kdOTghkEEymvW
 ziiaIt2683xpXgRlmOnADwWEOWS7Eh6oubTTYU3+OsXD/epoQ1Xt+EH0tUO9L4h5HEUgNFnI1Ud
 lLPGJjAtA9LUgw5GwsF7417csiMN0cy+PI4pRXq8neGjBhrLPq21ujnL8/RIGT
X-Received: by 2002:a05:6000:2408:b0:485:8a46:7067 with SMTP id
 ffacd0b85a97d-4858a467280mr4974369f8f.57.1788525982082; 
 Fri, 04 Sep 2026 05:46:22 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm6033442f8f.32.2026.09.04.05.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:46:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0FEE261929;
 Fri, 04 Sep 2026 13:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aniket Sahu <asahu1x@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 047/105] tests/tcg/arm: user tests
Date: Fri,  4 Sep 2026 13:45:01 +0100
Message-ID: <20260904124604.2207440-48-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904124604.2207440-1-alex.bennee@linaro.org>
References: <20260904124604.2207440-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Tested-by: Aniket Sahu <asahu1x@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260827221506.91574-48-pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
deleted file mode 100644
index 613bbf0939a..00000000000
--- a/tests/tcg/arm/Makefile.target
+++ /dev/null
@@ -1,87 +0,0 @@
-# -*- Mode: makefile -*-
-#
-# ARM - included from tests/tcg/Makefile
-#
-
-ARM_SRC=$(SRC_PATH)/tests/tcg/arm
-
-# Set search path for all sources
-VPATH 		+= $(ARM_SRC)
-
-config-cc.mak: Makefile
-	$(quiet-@)( \
-	    $(call cc-option,-fno-integrated-as, CROSS_CC_HAS_FNIA)) 3> config-cc.mak
--include config-cc.mak
-
-float_madds: CFLAGS+=-mfpu=neon-vfpv4
-
-# Basic Hello World
-ARM_TESTS = hello-arm
-hello-arm: CFLAGS+=-marm -ffreestanding -fno-stack-protector
-hello-arm: LDFLAGS+=-nostdlib
-
-# Float-convert Tests
-ARM_TESTS += fcvt
-fcvt: LDFLAGS += -lm
-fcvt: CFLAGS += -march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
-run-fcvt: fcvt
-	$(call run-test,fcvt,$(QEMU) $<)
-	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
-
-# PC alignment test
-ARM_TESTS += pcalign-a32
-pcalign-a32: CFLAGS+=-marm
-
-ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
-
-# Semihosting smoke test for linux-user
-semihosting: CFLAGS += -mthumb
-
-ARM_TESTS += semihosting-arm
-semihosting-arm: CFLAGS += -marm -I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
-semihosting-arm: semihosting.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-
-run-semihosting-arm: semihosting-arm
-	$(call run-test,$<,$(QEMU) $< 2> $<.err)
-
-ARM_TESTS += semiconsole-arm
-
-semiconsole: CFLAGS += -mthumb
-
-semiconsole-arm: CFLAGS += -marm -I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
-semiconsole-arm: semihosting.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-
-run-semiconsole-arm: semiconsole-arm
-	$(call skip-test, $<, "MANUAL ONLY")
-
-endif
-
-ARM_TESTS += commpage
-
-# Vector SHA1
-# Work around compiler false-positive warning, as we do for the 'sha1' test
-sha1-vector: CFLAGS=-O3 -Wno-stringop-overread
-sha1-vector: sha1.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-run-sha1-vector: sha1-vector run-sha1
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
-	$(call diff-out, sha1-vector, sha1.out)
-
-ARM_TESTS += sha1-vector
-
-# Vector versions of sha512 (-O3 triggers vectorisation)
-sha512-vector: CFLAGS=-O3
-sha512-vector: sha512.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-
-ARM_TESTS += sha512-vector
-
-ifeq ($(CONFIG_PLUGIN),y)
-# Require emitting arm32 instructions, otherwise the vCPU might accidentally
-# try to execute Thumb instructions in arm32 mode after qemu_plugin_set_pc()
-test-plugin-set-pc: CFLAGS+=-marm
-endif
-
-TESTS += $(ARM_TESTS)
diff --git a/tests/tcg/arm/meson.build b/tests/tcg/arm/meson.build
new file mode 100644
index 00000000000..08a863699fb
--- /dev/null
+++ b/tests/tcg/arm/meson.build
@@ -0,0 +1,78 @@
+cc = 'arm-linux-gnueabihf-gcc'
+cc_dockerfile = 'debian-all-test-cross'
+cc_docker_host_arch = ['aarch64', 'x86_64']
+
+tests = []
+
+# Multi arch tests
+multi_src = []
+foreach t: tcg_tests['multiarch-linux-user']['tests']
+  foreach src, setup: t
+    new_cflags = []
+    if 'cflags' in setup
+      new_cflags = setup['cflags']
+    endif
+    if fs.stem(src) == 'float_madds'
+      new_cflags += ['-mfpu=neon-vfpv4']
+    elif fs.stem(src) == 'test-plugin-set-pc'
+      # Require emitting arm32 insns, otherwise the vCPU might accidentally
+      # try to execute Thumb insns in arm32 mode after qemu_plugin_set_pc()
+      new_cflags += ['-marm']
+    endif
+    if src not in multi_src
+      setup += {'cflags': new_cflags}
+      multi_src += src
+    endif
+    tests += {src: setup}
+  endforeach
+endforeach
+
+tests += {
+  'commpage.c': {},
+  'hello-arm.c': {
+    'cflags': ['-marm', '-nostdlib', '-ffreestanding', '-fno-stack-protector'],
+  },
+  'fcvt.c': {
+    'cflags': ['-lm', '-march=armv8.2-a+fp16', '-mfpu=neon-fp-armv8'],
+    'expected_output': 'fcvt.ref',
+  },
+  'pcalign-a32.c': {'cflags': ['-marm']},
+}
+
+# Vector SHA1
+# Work around compiler false-positive warning, as we do for the 'sha1' test
+tests += {'../multiarch/sha1.c': {
+            'exe_name': 'sha1-vector',
+            'cflags': ['-O3', '-Wno-stringop-overread'],
+            'expected_output': '../multiarch/sha1.ref',
+         }}
+
+# Vector versions of sha512 (-O3 triggers vectorisation)
+tests += {'../multiarch/sha512.c': {
+            'exe_name': 'sha512-vector',
+            'cflags': ['-O3'],
+         }}
+
+# Semihosting tests
+semihosting_cflags = ['-marm', '-mthumb', '-I', meson.current_source_dir()]
+tests += {
+  '../multiarch/arm-compat-semi/semiconsole.c': {
+    'cflags': semihosting_cflags,
+    'wrapper': [prog_run_with_input, 'X'],
+  },
+  '../multiarch/arm-compat-semi/semihosting.c': {'cflags': semihosting_cflags},
+}
+
+if 'qemu-arm' in emulators
+  tcg_tests += {
+    'arm-linux-user': {
+      'cc': cc,
+      'cc_dockerfile': cc_dockerfile,
+      'cc_docker_host_arch': cc_docker_host_arch,
+      'folder': 'arm',
+      'gdb_arch': 'arm',
+      'qemu': emulators['qemu-arm'],
+      'tests': tests,
+    }
+  }
+endif
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index e0789d9c1eb..17f48bebf98 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -139,6 +139,7 @@ endforeach
 subdir('aarch64')
 subdir('aarch64_be')
 subdir('alpha')
+subdir('arm')
 
 image_targets = {}
 exe_targets = []
-- 
2.47.3


