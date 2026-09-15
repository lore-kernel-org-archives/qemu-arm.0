Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA96BC88E7D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:17:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ZaC-0006yG-KM; Tue, 15 Sep 2026 16:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZd-0006sP-Kx
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:18 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZZ-0003I2-CL
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:13 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e66390995so1241585e9.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503368; x=1790108168; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NZWPhlLkOuk9iA3jYBR1D22Zr4Gwpb30arbfNP6pIW0=;
 b=wo0PEaay6p9X0UKERY/hIioL2N7Vqps45XVR61wuzQCtfs24sDhYfoxVQFjuWqJ4KG
 HEbj4x/hQxJLav0wyXoosR/DMVlEbo+bWXE77vaCcfDENN0m84GlTUEViyd7MGx4sDI9
 0AQLeUmaOtA+z7j+OFMU0ie0er1rb+nPQGMQF333SHuZBdmTsRgmLk/MyjmKSbgvEOY/
 3W7MJ/KhMym1WFhEI5oFpxcgUgh+MQUNoSCOIdj4Z84TD+AcJIgIk73UwMWMFpXidWad
 Vm/KOfSVjBtyeubWwCP45ytpcMwfg5IOJge8JGhNWI/qYzLkrNLZvudzKpNybJ1QpaXa
 cDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503368; x=1790108168;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NZWPhlLkOuk9iA3jYBR1D22Zr4Gwpb30arbfNP6pIW0=;
 b=ExkDz5VEweqqNo+7jUBBoS7iX79mI2xk+utJKj3dYJu/dyASGIaQxr/ofgLA4Z2Yr/
 P/QyaetrpDPm/8zUbDOeZVMcxBtrymF4LbghXwkkDARO0Tg2HwO2aCOn0R3C9sCQnmb+
 +ipG+Xn8E4L2HrD+//B5KRAsPC7oltCWgT/fBRgTfhuYZEhW0L3Th7BnMggkbQVlqmiW
 kFzCmY3QjSYM88tstRTRJwO44ow0xlVj1Hll6IEfMXlFJy5ZF6vER32/1RvkYH6Y4ZpZ
 ijt7hcRT23ycmLEv3hjKL9fuQqf+67su6tv3pJCzpzdiM8/1jSZK7i3DxM4zLXa3o3bi
 Ajkw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwg+8BYDUia4dSDZnf3i8nhvjQkSKpQ5g6ohCj2WgEA1najKUrSLazbpToGAoWN/KIfR7UVUlfDvQ==@nongnu.org
X-Gm-Message-State: AFuF++kXqnOxxk8Ud+dXTOfHkD4jK7bSnzT13N//DrKQF0gA3DK3wXmT
 IQK/TEJgY1PBpXnz9m8iI6lVLRfY2GvXDvtmWIaZ3OgxnwkD/K+DVZu6Rv6EaLvY+Hc=
X-Gm-Gg: AYBFou0e+HY9R0GqbpEUiUz3k3mxeNWdIzzIxD2Np7AtSBEr60eknbefsJvA1zvYvc4
 1REDePnQSpxMP45wfoHmmfqnzfexxGP0v7hjZDjUwCY19FNk/tCOGa5ky1238NNRrmP10/Ob9AR
 V5xIvYNFTVjxjQ615+h+i1+y3J1EP69wgRWtY7ycHWAjJ1XqwBbIJdNXST5IYwUh3xH3kp2vEMs
 10BtUlq836aYPi2konTqvER8wYFD23ZbpPs1x3/HyA5BxIJgVIJvaTywcRkll3B5DPVvkiZcBgs
 zmJl1Sypp4FocX0W1Rs7WTgHGT1aPqNkh6Iu/hrjXhoEHwrPzNO60LwVrg1xAzXT+I3r0Bc9Zel
 s4GvnMQ0Ek9URg+xZ+kUbR0RLYJoEi7SG7x5jQOUmRVCXoDUq0TccIXBlwkI0oKedUK/TqNC+aI
 xA4Pgoh3XZ8sIvp6yVv4h0vIOwi/TXRbioVmm6To6RfA0mYAceqpZOqSzTqHUWJAhZcC2PgG+FS
 YJ78ZgCCw==
X-Received: by 2002:a05:600c:871b:b0:49e:69e3:884d with SMTP id
 5b1f17b1804b1-49e7a63770cmr102539025e9.4.1789503367895; 
 Tue, 15 Sep 2026 13:16:07 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83db9102sm15986175e9.12.2026.09.15.13.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 96235618D5;
 Tue, 15 Sep 2026 21:16:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 09/15] tests/docker: add container registry to configure
 and use
Date: Tue, 15 Sep 2026 21:15:54 +0100
Message-ID: <20260915201601.1207839-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915201601.1207839-1-alex.bennee@linaro.org>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Previously we had the default baked into Makefile.include but as the
meson container logic will also benefit from it we update the configure
machinery.

For now we allow direct make invocations to override but for the
normal case it is in one place now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fixed conflicts from the revert.
---
 configure                     | 8 ++++++++
 meson_options.txt             | 4 ++++
 tests/docker/Makefile.include | 4 +---
 tests/tcg/meson.build         | 6 ++++++
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index c89f3c61f7f..fc85555c48e 100755
--- a/configure
+++ b/configure
@@ -173,6 +173,7 @@ fi
 
 # default parameters
 container_command=""
+container_registry="registry.gitlab.com/qemu-project/qemu"
 cpu=""
 cross_compile="no"
 cross_prefix=""
@@ -733,6 +734,9 @@ for opt do
   ;;
   --container-command=*) container_command="$optarg"
   ;;
+  --container-registry=*) container_registry="$optarg"
+                          meson_option_add -Dcontainer_registry="$optarg"
+  ;;
   --rust-target-triple=*) rust_target_triple="$optarg"
   ;;
   --gdb=*) meson_option_add -Dgdb="$optarg"
@@ -867,6 +871,7 @@ Advanced options (experts only):
   --cpu=CPU                Build for host CPU [$cpu]
   --disable-containers     don't use containers for cross-building
   --container-command=CMD  which container command to use [autodetect]
+  --container-registry=URL which container registry to cache from [$container_registry]
   --gdb=GDB-path           gdb to use for gdbstub tests [autodetect]
   --wasm64-32bit-address-limit Restrict wasm64 address space to 32-bit (default
                                is to use the whole 64-bit range).
@@ -1729,6 +1734,9 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
+if test -n "$container_registry"; then
+  echo "DOCKER_DEFAULT_REGISTRY=$container_registry" >> $config_host_mak
+fi
 if test "$default_targets" = "yes"; then
   echo "CONFIG_DEFAULT_TARGETS=y" >> $config_host_mak
 fi
diff --git a/meson_options.txt b/meson_options.txt
index 218d003a80b..5a080b2360c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -389,3 +389,7 @@ option('rust', type: 'feature', value: 'disabled',
        description: 'Rust support')
 option('strict_rust_lints', type: 'boolean', value: false,
        description: 'Enable stricter set of Rust warnings')
+
+option('container_registry', type: 'string',
+       value: 'registry.gitlab.com/qemu-project/qemu',
+       description: 'container registry to cache from')
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0adddb6a5c6..74bf471f171 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -11,9 +11,7 @@ USER = $(if $(NOUSER),,$(shell id -un))
 UID = $(if $(NOUSER),,$(shell id -u))
 
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
-ifeq ($(HOST_ARCH),x86_64)
-DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
-endif
+DOCKER_DEFAULT_REGISTRY ?= registry.gitlab.com/qemu-project/qemu
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
 CONTAINER_COMMAND ?= $(shell $(SRC_PATH)/tests/docker/docker.py probe)
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 28a8e7a0558..fce70f8e56f 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -84,6 +84,9 @@ docker_supported = docker_probe.returncode() == 0
 if docker_supported
   docker_wrapper = [docker_wrapper, '--command', docker_probe.stdout().strip()]
 endif
+if get_option('container_registry') != ''
+  tcg_tests_summary += {'container registry': get_option('container_registry')}
+endif
 
 # plugins come first, as we need to build the list
 test_plugins = {}
@@ -219,6 +222,9 @@ foreach target, plan: tcg_tests
     if cc_dockerfile not in image_targets and has_docker
       cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', 'qemu/' + cc_dockerfile,
              '--add-current-user']
+      if get_option('container_registry') != ''
+        cmd += ['--registry', get_option('container_registry')]
+      endif
       t = custom_target(image_name, command: cmd,
                         build_by_default: false,
                         output: 'no_output_' + image_name)
-- 
2.47.3


