Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31175C982CC
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:33:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6rbK-0002WA-0s; Wed, 16 Sep 2026 11:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ran-0002CG-Q8
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raj-0001RT-ES
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48431648f33so942444f8f.0
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789572630; x=1790177430; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Dj+ZspCM6J9NNrIvMuGuEdHfeVjGm1hpFjFQh39bi48=;
 b=LvMkNhcSsqjm/obujurN98k8jRgrhCBw4+SM/TlEwbRWvcR6ziIBbPZq8m6NHX8zvO
 COe4Y2N63JHK7eE44IS0I3P8oRxzEUM7N95OcMB9JmFLs+f2eoNqiqe939KpnHiLAlA2
 euDJFt2QYk4hd+SaE0556R+PFGj5Mjw3ZHhbB0zqcQBts92wg2ycRyVyjzjZYLSpyHKV
 AGHwy4VcwhNNArB57Lj0m6FDcZLSCiq81HLDB13YSucaYY1aDODaU2HquztzJu5BnsiU
 DqegkymJHxKJynRdul2mCNXBiuKdoKQR6j1IejVHJgOl7W28JHfRtJgE8yo/5yMOmNQ3
 elmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789572630; x=1790177430;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Dj+ZspCM6J9NNrIvMuGuEdHfeVjGm1hpFjFQh39bi48=;
 b=dOvDAUq3y5AsF90kHUOxJ6cybnYXOyml1nuYP3X3kRmnyFpMeiVCeryRUYSucT5jV0
 9fWeevJB30GY/niTiaInBPCIsq1ZUNgCKh+s4zEluITsERyilD4PNC3+x4z7OAMwQ4hr
 GAe1d6fsYJCN5ucQg4gjR2ENqKQmx+tiImu/jDOJR8GQPBM1ujoxALIewZ3fUuzbITRd
 74tTrYK3n5QlqLFY6V90ua2FKQktLWjctP7gFbFMdbPrYwfDkqGqk5M3vierl40wAMxG
 h8xvaDbYz1UTG3d6yj0JteXDJGOrPRHKkHHHSe9clfs1Zu7aZm5wjB/ssj+xi+3XV/2e
 T8jQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByv2QfAzPWlRgBhSTkMSa1JBe0rCfozjs2k5VBCGZocdH/2CZXSDa2HK+tnp8UqqBm19Or4rEtXGQ==@nongnu.org
X-Gm-Message-State: AFuF++m+E5qrSop5989PbZnfpYHmtRj3IYIO0qctvfBbiycEOtBWT9Uo
 D9H+dbl14kjdwJ5TIDyu2P+KMUJBjNnGCgAJbr21lhIUWLFHPYOKYFHNOSyBq2vIcgc=
X-Gm-Gg: AYBFou10jky56PwkYsuc8gt3qmPFCGGv7Fq6kArtFELFc1gkTE+9ygvm8v3jpNpX9gX
 qpOrOjxI2RqBf9LQsQXZ6VvV3JBLswRe27BbhGoi6yTa1KGBtYp6g3kg7j7DjfD1QcKQKlJ+KRC
 Dcgm1Yjc7BL5UUFKBkaKGOhAKmxJwt41sHFfj+Mzo0qH0n9lfEKFMgtqvQXQ8WNdR7NNzu/gjXV
 qaDRq7ki0RkrmUlga9lv26DMfItXQC+fAhDt+Ow9EamQEY9uw40GEUcqSK9Z+jDZ8iMYmA96Qll
 ozneUWFma+TQNr6kEfnDxGExhHnqFY0sPQmzBqcFl8huZAqs65jjneAaQlEFYbcKHWo8kEXwhZo
 mCD4H6D3d5qVODeVGqUBtugt0oZe41Uu2mPJEQoYMMblA+5iKDJw1/PWSNg0gkZY9AcBT3NiWzA
 ViCjHkmIx1fYJmsA2MArYnW1h101D+bUO8gnxQm4Hybt9mA4Bt5/SKGTZ/4CR9/7rHqQvWces=
X-Received: by 2002:a05:6000:46c6:b0:487:5:9cae with SMTP id
 ffacd0b85a97d-48705b9108emr8827727f8f.16.1789572630195; 
 Wed, 16 Sep 2026 08:30:30 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1fa7dsm8078982f8f.8.2026.09.16.08.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:30:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4A65B61982;
 Wed, 16 Sep 2026 16:30:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>, Brad Smith <brad@comstyle.com>,
 Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 10/19] tests/docker: add container registry to configure
 and use
Date: Wed, 16 Sep 2026 16:30:03 +0100
Message-ID: <20260916153013.2134555-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916153013.2134555-1-alex.bennee@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Previously we had the default baked into Makefile.include but as the
meson container logic will also benefit from it we update the configure
machinery.

For now we allow direct make invocations to override but for the
normal case it is in one place now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fixed conflicts from the revert.
v3
  - regen meson-buildoptions.sh
v4
  - merge conflicts
---
 configure                     | 8 ++++++++
 scripts/meson-buildoptions.sh | 3 +++
 tests/docker/Makefile.include | 4 +---
 tests/tcg/meson.build         | 6 ++++++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 67967cd294c..b0e1e694a6c 100755
--- a/configure
+++ b/configure
@@ -173,6 +173,7 @@ fi
 
 # default parameters
 container_command=""
+container_registry="registry.gitlab.com/qemu-project/qemu"
 cpu=""
 cross_compile="no"
 cross_prefix=""
@@ -736,6 +737,9 @@ for opt do
   --container-command=*) container_command="$optarg"
                          meson_option_add -Dcontainer_command="$optarg"
   ;;
+  --container-registry=*) container_registry="$optarg"
+                          meson_option_add -Dcontainer_registry="$optarg"
+  ;;
   --rust-target-triple=*) rust_target_triple="$optarg"
   ;;
   --gdb=*) meson_option_add -Dgdb="$optarg"
@@ -870,6 +874,7 @@ Advanced options (experts only):
   --cpu=CPU                Build for host CPU [$cpu]
   --disable-containers     don't use containers for cross-building
   --container-command=CMD  which container command to use [autodetect]
+  --container-registry=URL which container registry to cache from [$container_registry]
   --gdb=GDB-path           gdb to use for gdbstub tests [autodetect]
   --wasm64-32bit-address-limit Restrict wasm64 address space to 32-bit (default
                                is to use the whole 64-bit range).
@@ -1732,6 +1737,9 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
+if test -n "$container_registry"; then
+  echo "DOCKER_DEFAULT_REGISTRY=$container_registry" >> $config_host_mak
+fi
 if test "$default_targets" = "yes"; then
   echo "CONFIG_DEFAULT_TARGETS=y" >> $config_host_mak
 fi
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
index 904a5a02242..87e5614fc83 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -104,6 +104,9 @@ tcg_tests_summary += {'container command': container_command}
 if get_option('container_registry') != ''
   tcg_tests_summary += {'container registry': get_option('container_registry')}
 endif
+if get_option('container_registry') != ''
+  tcg_tests_summary += {'container registry': get_option('container_registry')}
+endif
 
 # plugins come first, as we need to build the list
 test_plugins = {}
@@ -239,6 +242,9 @@ foreach target, plan: tcg_tests
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


