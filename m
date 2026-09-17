Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2612C982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:57:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FQM-00009Z-07; Thu, 17 Sep 2026 12:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPV-0007lX-9h
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:34 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPT-0000lB-AL
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:33 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso8530095e9.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664180; x=1790268980; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AKp+lB8e4qtR89JuIFgqF/5ZND10Eb22WPiLefCflLY=;
 b=mmNKKeNaxfLKpQttNGn2M9w+FcgqChu2etlartvFL7vlhCyAUp5dnI+xsYjFknk8/f
 KtRaOh3cDwCo+O80ngxj0bMzZdnnUJ0M/kZic7d8KswV4ggaBFO1NlAe+uBjEbvqUFux
 pkup/x2XoZshTlEH7e4flLUYtnanpc3LO3b93CEZdb12BX3Q/gs3QQvhUukifoFnbMs+
 fv635v1ublnXukTgt8OIq6v0qi0o1+mA6GZxZECo4aDoURu6m1e4dDD9i7oVpGKnqNZX
 QQRA8+XFN15hvkSn8KRZkHjYSs7PvuRPUvf+PhpI9ppbaSz1kUAlwENuxyAL9dNr4LsT
 +oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664180; x=1790268980;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AKp+lB8e4qtR89JuIFgqF/5ZND10Eb22WPiLefCflLY=;
 b=vrwn/zTc3rcs+8zHDxN4BTW14SN/VrzcfgryCFD/cJzdNvPRmyXNPqHJUQmnq/3rsR
 3IM/uRtmuBDX9P9Gqv0c4kivjXL5rRIoxTI5tD6Cywu/02cMTewT/inlOEbUvTDo7Rsj
 IcX7Jd9ses/lh+t4ldNHCNjcGRHbnojAyCzbvgCfR5sjXK1yOR/f6RON9zpO4zOwOQbH
 XhM4UViUVk59ALLiJXfMh42IJ6n9qUpgTJ4wAhHZfyrCz0nYsi9FzaLQaTLmgP/E8SpC
 vVPz11iXiF/Cz/w8hZhGmrNTHIdef89HLMGgSjaKo3DqORiEKDKmdO1J9c+oy58+zBZm
 jJZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKhLY7YJ60Wyozpa5Kq6sIKl2QhZ2BTg3+XVImCIRf/uqoL2Gs3+DSx52X++PxEhYz996SDLcZJw==@nongnu.org
X-Gm-Message-State: AFuF++lzxlrODASxwrDyHrpuNNbwzaqP1nr0DbfETxVonp2iof5Ps2tP
 PeyQmSRibqeUiRSLVjJHM5QcqsUWmroqf8hJxqq9C3XdBBDA/Vu3cr8hkp36P2o8Bs4=
X-Gm-Gg: AYBFou2DOXSTQhI8KAWsDEwG9il0f+QhyRuIXvIDxv4ZI+dUkUXj0TZQSqi6rNefC9/
 7oai/iPR6ZHHWxBfoAb6Uk0DjoPA168kDXRHLMnTnHqsxq9FcJnYG257O4np06JB1yoQbpKp+tU
 r9h1AAP0dOOYR056rutBt6j9rhMsQc/as80CwLjnzPy7SeSJBrGDIiZZwG3zWkcLkne9vpqFpqK
 WZ10851DqL9JvIJW9S0vXW2cEaiBjHaLQeZiMzdiETy+jmnfE9+NSP7JUPsB2H0L68vxOlRY+nM
 t+y/VcvB/06Uc4rLSZs74oHSZPdOUTlMBrAtqw3SqFZRCo2yyH2KW7MigqzYhnILTRsoCqHPXLF
 B6z8Q3eAcNkE64VHcPlnsvOIRdqb+YKStv/bfQ3TRnY6W4gTrwTWYJbaL7IlKQVAo3v4Px8d+rL
 7RRSuTeJ1nj32eZDcaJj6Mj30auh4gQ3tYs+fwqrHo+r+wQAut5/0y3yHqEpWxLbFEktY9/00=
X-Received: by 2002:a05:600c:46cb:b0:49c:eb16:9fd with SMTP id
 5b1f17b1804b1-49eac463764mr93495885e9.3.1789664179803; 
 Thu, 17 Sep 2026 09:56:19 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1f98csm16550796f8f.11.2026.09.17.09.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 216155FC28;
 Thu, 17 Sep 2026 17:56:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v5 09/17] tests/docker: add container registry to configure
 and use
Date: Thu, 17 Sep 2026 17:55:53 +0100
Message-ID: <20260917165602.3405537-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fixed conflicts from the revert.
v3
  - regen meson-buildoptions.sh
v4
  - merge conflicts
v5
  - fix strays on rebase
  - update meson_options.txt
---
 configure                     | 7 +++++++
 meson_options.txt             | 3 +++
 scripts/meson-buildoptions.sh | 3 +++
 tests/docker/Makefile.include | 4 +---
 tests/tcg/meson.build         | 6 ++++++
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 667fc7ca19b..af14a9c23ef 100755
--- a/configure
+++ b/configure
@@ -172,6 +172,7 @@ fi
 # some defaults, based on the host environment
 
 # default parameters
+container_registry="registry.gitlab.com/qemu-project/qemu"
 cpu=""
 cross_compile="no"
 cross_prefix=""
@@ -732,6 +733,9 @@ for opt do
   --container-command=*) container_command="$optarg"
                          meson_option_add -Dcontainer_command="$optarg"
   ;;
+  --container-registry=*) container_registry="$optarg"
+                          meson_option_add -Dcontainer_registry="$optarg"
+  ;;
   --rust-target-triple=*) rust_target_triple="$optarg"
   ;;
   --gdb=*) meson_option_add -Dgdb="$optarg"
@@ -1728,6 +1732,9 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
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
index e3570a418aa..6c2de6296f7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -393,6 +393,9 @@ option('containers', type: 'boolean', value: true,
        description: 'use containers to cross compile tcg tests')
 option('container_command', type: 'string',
        description: 'command to build/run containers')
+option('container_registry', type: 'string',
+       value: 'registry.gitlab.com/qemu-project/qemu',
+       description: 'container registry to cache from')
 
 option('tcg_tests_cross_cc_aarch64', type: 'string',
        description: 'cc for aarch64 tcg tests')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index ba3c9de216b..0cb1d48c982 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -10,6 +10,9 @@ meson_options_help() {
   printf "%s\n" '  --block-drv-rw-whitelist=VALUE'
   printf "%s\n" '                           set block driver read-write whitelist (by default'
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
+  printf "%s\n" '  --container-registry=VALUE'
+  printf "%s\n" '                           container registry to cache from'
+  printf "%s\n" '                           [registry.gitlab.com/qemu-project/qemu]'
   printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --disable-debug-info     Enable debug symbols and other information'
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
index 5819fdf0bf3..482de73ac72 100644
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


