Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F32DC88E42
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 18:17:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4jIs-00044X-4U; Thu, 10 Sep 2026 14:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x4jIp-0003xl-Nx
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 14:15:15 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x4jIn-00074B-07
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 14:15:15 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso1350175e9.0
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789064111; x=1789668911; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T5Xuw/KQ0j+V1bZw5QEINYzzMk8dJ72+D9GtgNKZY48=;
 b=bmikMRSUJ/6y+omp15H94d/+ptfYN7CIcQaVSVb/V156JovA0sobhkTDBKfgdHQdjf
 F8HGz0CyG2O3+GZGH0gCFj/iKbWzVPtfEzPnFEEjufii6Cs4BlqkrwAgg5THNdHbc7YO
 gMMxGM4Rx6K93PDESxzci/8rIaCUmQAbR+kdd8wn7bmdd0ZbpueWFRP9fwgAW0uZ5FlC
 Y6J4fbhuIplYI0ChqyBaiRLXK/5NAVV9RtWSuJS/WFm0g0+BLVeqbGN71RCsOs5QIZrx
 rRHNMdpOjlqJXZ/vk/Al9lzHiRP+rpUKbYu1y561JNUNNvRbFRUfRr7SoQrUJF9ke/TL
 xq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789064111; x=1789668911;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T5Xuw/KQ0j+V1bZw5QEINYzzMk8dJ72+D9GtgNKZY48=;
 b=ZJHCVByaRdtdDdDA04Nx8BrJF+JFjEIMJI/VtguJ1Opw5/iflKapZhZPF3Wuo/FSnq
 +tifxhAnkVmBAAaiEs9bGzgwr4bSpHJlzotP5+O+Zn2i0biGan2blaAs3C6He6RNA8RK
 S9KtDoARsg3SQu0gfyYvzimoc9SdAI0XWza8wAas5iqjvJORq9sYIkHXu2tvTypHoEtt
 e7x0mCBApsvgDwJB1B77zQHBu/jFOxZt9gIzF9vo+rIj268r8e6wTeMy42fPh9mMMseq
 PbqQKtAmBk7h4Pu9grJCzhzlmzv6We7RupaWxYYTlPiSBgeGAzJZoNKMQccW3lP8gq0W
 cWVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKE8JBWd2QYVg7uwF+0HRrqRoWXxN236tUb61zrXA7VNm5QpbG/4NNx3fi+uCtdDNelPlXUb3BDQ==@nongnu.org
X-Gm-Message-State: AFuF++muKo8xmJB26A7I9m1xEXpf7ezWC4zVKRAJW2CpbO7rJyvnJums
 gANNV0RCFvsc+ejiAeodJwgABHTP7Zlxs3gyOlC5bn+86GCW1PiXAeyCEOUwTfABwDQ=
X-Gm-Gg: AYBFou3SAU431uptP9wBY9mNq7vxBIhTb6aMH7CBFBxm5XF+nLSOsQofI4LDHWCpNTl
 y08IVbJetFGu/wHHjpaqQ3FJ+BWXw2IRS+tnXWcW6ut8aYZ8kK2skdTDu1Uhyor/QBpLL9h/jy8
 gz/BYkzZXiwhYRSDXVb3VTyefchwdo8gpeELM3yBhSesS5bOvFcmAt06ZiePJva1LFioPUoMFJI
 GaOatfPEnug0vb4HCt0aTJoqbpjJZC8eD6BlJEtQ42f2G4FFgMKN8fm9H6nN6uW1uf60FXJLDWI
 XZopxGoJd5oAGXapZkzX2095V/xi7aQLZZsyhYGRs5zEsQNsl4DZnAztEZL5O0zN031eJWTMDVG
 Hyp83tIRJ6xlz9Vo4jlHalwrFYg7N313e4P9R7VESGW2koqronoqMq4GpD0t6VIZrMo2736VTex
 XdIw9wSzXyxKDYzakDFMaCcZcCGoIaEOrvU53bgXP2oLrCFc2IfHSXhPl2Ruyc5zf5FUT/4g0+X
 U3gSNLiJA==
X-Received: by 2002:a05:600c:8712:b0:49c:ee36:10fc with SMTP id
 5b1f17b1804b1-49e619acbfemr3156425e9.8.1789064111449; 
 Thu, 10 Sep 2026 11:15:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb33fd3bsm208083f8f.19.2026.09.10.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:15:10 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 84A0D5FCE5;
 Thu, 10 Sep 2026 19:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 5/9] tests/docker: add container registry to configure and use
Date: Thu, 10 Sep 2026 19:15:00 +0100
Message-ID: <20260910181504.1010916-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910181504.1010916-1-alex.bennee@linaro.org>
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 configure                     | 8 ++++++++
 meson_options.txt             | 3 +++
 tests/docker/Makefile.include | 4 +---
 tests/tcg/meson.build         | 6 ++++++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index aaa41fe47aa..7d6b11ddd35 100755
--- a/configure
+++ b/configure
@@ -172,6 +172,7 @@ fi
 # some defaults, based on the host environment
 
 # default parameters
+container_registry="registry.gitlab.com/qemu-project/qemu"
 cpu=""
 cross_compile="no"
 cross_prefix=""
@@ -728,6 +729,9 @@ for opt do
   ;;
   --container-command=*) meson_option_add -Dcontainer_command="$optarg"
   ;;
+  --container-registry=*) container_registry="$optarg"
+                          meson_option_add -Dcontainer_registry="$optarg"
+  ;;
   --rust-target-triple=*) rust_target_triple="$optarg"
   ;;
   --gdb=*) meson_option_add -Dgdb="$optarg"
@@ -862,6 +866,7 @@ Advanced options (experts only):
   --cpu=CPU                Build for host CPU [$cpu]
   --disable-containers     don't use containers for cross-building
   --container-command=CMD  which container command to use [autodetect]
+  --container-registry=URL which container registry to cache from [$container_registry]
   --gdb=GDB-path           gdb to use for gdbstub tests [autodetect]
   --wasm64-32bit-address-limit Restrict wasm64 address space to 32-bit (default
                                is to use the whole 64-bit range).
@@ -1318,6 +1323,9 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
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
index 292625af08a..030231492e1 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -391,6 +391,9 @@ option('containers', type: 'boolean', value: true,
        description: 'use containers to cross compile tcg tests')
 option('container_command', type: 'string',
        description: 'command to build/run containers')
+option('container_registry', type: 'string',
+       value: 'registry.gitlab.com/qemu-project/qemu',
+       description: 'container registry to cache from')
 
 option('tcg_tests_cross_cc_aarch64', type: 'string',
        description: 'cc for aarch64 tcg tests')
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
index 814f2f8cd8c..22157a47c96 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -101,6 +101,9 @@ if get_option('containers')
   endif
 endif
 tcg_tests_summary += {'container command': container_command}
+if get_option('container_registry') != ''
+  tcg_tests_summary += {'container registry': get_option('container_registry')}
+endif
 
 # plugins come first, as we need to build the list
 test_plugins = {}
@@ -257,6 +260,9 @@ foreach target, plan: tcg_tests
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


