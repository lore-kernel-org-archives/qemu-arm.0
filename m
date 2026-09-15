Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF40DC88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:20:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ZbP-0007gd-By; Tue, 15 Sep 2026 16:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZZ-0006s6-W9
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:13 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZW-0003H6-Nb
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:09 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso1924845e9.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503365; x=1790108165; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zaMYvSZ2k0eHaB8BN//yVzz35zyXadmvTP++fUkW3Ps=;
 b=EzeupwjNMzuTXORwDlhfhGr2w85IXYfIy9zoQm5SRHvSPDZacEawX6x/tdmyU9rSgQ
 tumF9KPGmwLVdqzmllmKWlSuLDgVxil8Vh10xLfl7ydFzMDx3tuDalRUDKNeyR1iNlv0
 9Uqlzzr8YTezF0lP+gzWh1aR3ign0CXdUVN6G7rWNBHsThc0Bpv6ZdnL6wE2vYR3Sz65
 IhIZLdANgELVw8VoJY8Lm15CCYdmbahtBr5YHiwjSvr/jIC3PAziL1dWbKDQPwF6rgmu
 p5OLEkXqw86VRluPzm3sHde1HZbUpAKn6TnebvhI/KHvFlLUmb78VhEYhBliJGaaRPCA
 Swvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503365; x=1790108165;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zaMYvSZ2k0eHaB8BN//yVzz35zyXadmvTP++fUkW3Ps=;
 b=dHCFSZUKe4erV9dwab3UA/UKKFLEDrRoNbjnAUweok6cRe/5j8u5GE8G/pDWmqaeXC
 TXreGJJ7oY0MSzY5E6CBB5x1Rx99FRN2l4M+di0ImU2FnWfH9MdVIAQyqfyAwj2Y0BGW
 ogkoZLf99J5tyK/R1LQMM24N4wFuNvXR8VIs15vx1vapZZz5Ddg4JKcwTPacHLlsbzhM
 FTOdHUNJgDTiCbngptP8KNMFIfc1RtmW25VjDRR0EZo6ovlQaB7lTcAHK6+NELY3bgOa
 4MtAt39sq98AHcQ/bB/b/OdZ2gwwJddf4R6EdxLsUOeFdGJml7VuqdpaSUnic0VdZKTh
 nc4w==
X-Forwarded-Encrypted: i=1;
 AKwUvByy7uHPV2BR/H9Sfcku7ATaGCdoPFGTXwdgtSsktZ6o8Ghpwt/iDKbqf5cyWCMC1+EM7DFzEXRRpg==@nongnu.org
X-Gm-Message-State: AFuF++lGzCKm3CenpnSBt1LKZpzmQpxPGiO8IEuCaKU8qcQ7d+a2sx61
 V1YZwezMuo0fwB4nbwbuf+locUsY6JlRyBXt64g/e4+pktyTqIGEp0hzqXK+NIip7g4=
X-Gm-Gg: AYBFou1562VPOs5ayLFXHu4aNzfLD40a+OZt+RZYbAnstDeSIg6pB+oLogJZAZ7YNxQ
 dWdsKhWZ6L+y6BzvokeogpU/VMt/KJJTjbL8q522YUlsUBSI54Ns1L07KIXkN/v8J1QwB2/cmFw
 9hjlWrYPuTM51Jp12io2r0M5rany50qasEIJcF5YMh5SV5B/L/6Tmi5pGDGEKmKlsbmy4k05yKV
 wMOTJ6PA9A/ddPPz+mrrnDLzfmhF+lY4FLT6IKxtmEorIiRqs+M9Gl/NNurUdWxhr+41SUbxtOD
 A4hmPoyAawZMLEqauJGKPG2ND4/KIc7K9y2yvjo4p4OC9GiNw92rb5GQBmK56mjPJRCq+WtJa4p
 s+sfKK86vMAM4McnFlRbjePEao6tNl/wAj7K8B3C93qt4VtcY3C69kMrR2MGSytpx7ODAi/+bZc
 8iY2leXQGRxQ+YyV8prPk4f+8BsbiZKpevSvYzLgMYjXGUVA3IWOKex4dI8jTf87ajhDC+Zkmbx
 wfnXtqiLQ==
X-Received: by 2002:a05:600c:4e90:b0:49e:73e7:888c with SMTP id
 5b1f17b1804b1-49e7a65ce45mr116957105e9.4.1789503364637; 
 Tue, 15 Sep 2026 13:16:04 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83da071asm16254455e9.8.2026.09.15.13.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EAEF16178D;
 Tue, 15 Sep 2026 21:16:01 +0100 (BST)
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
Subject: [PATCH v2 03/15] Revert "tests/tcg/meson.build: implement ./configure
 containers options"
Date: Tue, 15 Sep 2026 21:15:48 +0100
Message-ID: <20260915201601.1207839-4-alex.bennee@linaro.org>
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

We want to keep the container configuration inside configure for the
firmware builds.

This reverts commit 522b299ca4316d8cad57f9496ffcba87dcc20719.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
[AJB: untangle changes since]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure             | 11 ++++++++---
 meson_options.txt     |  4 ----
 tests/tcg/meson.build | 25 ++++---------------------
 3 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index aa98cf39584..cec6f18f857 100755
--- a/configure
+++ b/configure
@@ -172,6 +172,7 @@ fi
 # some defaults, based on the host environment
 
 # default parameters
+container_command=""
 cpu=""
 cross_compile="no"
 cross_prefix=""
@@ -259,6 +260,7 @@ ninja=""
 python=
 download="enabled"
 skip_meson=no
+use_containers="yes"
 rust="disabled"
 rust_target_triple=""
 
@@ -725,11 +727,11 @@ for opt do
   ;;
   --disable-plugins) plugins="no"
   ;;
-  --enable-containers) # enabled by default
+  --enable-containers) use_containers="yes"
   ;;
-  --disable-containers) meson_option_add -Dcontainers=false
+  --disable-containers) use_containers="no"
   ;;
-  --container-command=*) meson_option_add -Dcontainer_command="$optarg"
+  --container-command=*) container_command="$optarg"
   ;;
   --rust-target-triple=*) rust_target_triple="$optarg"
   ;;
@@ -1716,6 +1718,9 @@ echo all: >> $config_host_mak
 
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
+if test "$container_command" != ""; then
+    echo "CONTAINER_COMMAND=$container_command" >> $config_host_mak
+fi
 echo "SUBDIRS=$subdirs" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
 echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
diff --git a/meson_options.txt b/meson_options.txt
index 66d3689d14c..218d003a80b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -389,7 +389,3 @@ option('rust', type: 'feature', value: 'disabled',
        description: 'Rust support')
 option('strict_rust_lints', type: 'boolean', value: false,
        description: 'Enable stricter set of Rust warnings')
-option('containers', type: 'boolean', value: true,
-       description: 'use containers to cross compile tcg tests')
-option('container_command', type: 'string',
-       description: 'command to build/run containers')
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index ce208e686ff..e966774c8c2 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -79,28 +79,11 @@ if gdb.found()
 endif
 tcg_tests_summary += {'gdb': gdb}
 
-docker_supported = false
-container_command = false
-if get_option('containers')
-  if get_option('container_command') != ''
-    # make sure command is working
-    container_command = get_option('container_command')
-    cmd = container_command.split()
-    run_command([cmd, 'info'], check: true)
-    docker_supported = true
-    docker_wrapper = [docker_wrapper, '--command',
-                      container_command]
-  else
-    docker_probe = run_command(docker_wrapper, 'probe', check: false)
-    docker_supported = docker_probe.returncode() == 0
-    if docker_supported
-      container_command = docker_probe.stdout().strip()
-      docker_wrapper = [docker_wrapper, '--command',
-                        container_command]
-    endif
-  endif
+docker_probe = run_command(docker_wrapper, 'probe', check: false)
+docker_supported = docker_probe.returncode() == 0
+if docker_supported
+  docker_wrapper = [docker_wrapper, '--command', docker_probe.stdout().strip()]
 endif
-tcg_tests_summary += {'container command': container_command}
 
 # plugins come first, as we need to build the list
 test_plugins = {}
-- 
2.47.3


