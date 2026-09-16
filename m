Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B2C88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 08:55:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6lOw-0007rv-3D; Wed, 16 Sep 2026 04:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOo-0007kz-Ib
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:52 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOk-0004yS-GW
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:49 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so4495325e9.0
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789548823; x=1790153623; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ry2sd1z4lQEPz/cq12Fj5YfxjJ6T7+6xlmSJ+36c4vQ=;
 b=Su3DbH+YMF9MHUtwWRK9okXHUcedxttmBQp62bz5K7iUsnARpHU038beDNhem3i/u7
 b294vzLFsNeb6Opv0VHAVMvq1rbtDxZzMJ7ikiTqrzaWvWKf70Ll8l5BfD5vpgKlsIbt
 minZyG1ox6wOMy1Z6u+nPrkA0JoDoPIKQl+08NGhs5Z64g0+PnMLqSgRO/4rp2T3lJai
 sCGGZKXFe09kwNpnlt3A6TZ6CUeSbA4U58zwEsdpYTGJOfYOaqrZi4MJuuVubUUhGiVR
 rcUx02ak3z0ZsBTf27sGSv8FxO33VXG2le1xjFOtvSSN0LjSXQTy7AjquL8+UWAAfrLL
 P3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789548823; x=1790153623;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ry2sd1z4lQEPz/cq12Fj5YfxjJ6T7+6xlmSJ+36c4vQ=;
 b=PjnGf7v3FQMTZn6OEsSqbQkzy3/fsQRKbFXav4Gm3kfc9uFHH3HS+CuwjzIZxYVQK0
 hv0RfXmVRrXofMPQTEx7jxTKWZo7G36sHMm6Oi9O6Jr377n3dacreLnKQ3I1hoYP0C87
 rk3GCxCHJXvdPet1u+d2Jfs4XecCbejr+9GOXjCIJ2asfUOohXCF482Uvj8pXzdk6CBE
 967RKdYWRSjiywLf044/sto3Sx5x80H2VHdAd+fyHTNeq+85YyJJlNAO9Vy5EeSmIOgK
 bYjBH51NiRj4dxeN1JV/AtXeAGWb6EroNSU5M/r9j6vHktpn0NdqIJa+X4BVHHJ4MB+W
 LFsA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjOLJC8g8nR0NaFCJAZVoeY/lBe6mmBZSk9kxC3Efcn2szaMX1MJqgWdoTwW1XhVjiR3F2gQr7nA==@nongnu.org
X-Gm-Message-State: AFuF++nSIyq5UF3CUxLQ9k4gnj71/u76ztufnHMzWR5UFQs6m3KuauyD
 hCZYYRdw9M0Z3VaTO+JWo+UGAXA++U2L3gRl5RnwV2iYsYqnCNUn7vMki4O1GPBgocY=
X-Gm-Gg: AYBFou1S3q0/Pakeh0Chq4xzZeJgHugOXdU36vLWa7rFxL+pP6Ff4dsZKY5nJMOVaXs
 Fle3+3U9q3/UdM1DJaHVCa7mhWir5IgGsIBUl73iLWwDMkXPioKdWYg1ayZu5QoQ0A83jhPvWX0
 dFPSTxMWfgYzJztw56KaOGUmfY8fObXUu18gbmrzDOiFROXAy8UAjhCrfU9l9JX/CfISAxXncD4
 HVRxYWYi1xZkNCxQ02JV259IzLLjEOALxRmCmRr8KxkjO5ULwdKgsgmYe6SHFlUETRJdsbjdYbv
 N2o5iIhmQtOtvwT5IoIDuGeq5HJj52yVNz8dEGJ2mgPfAUkI+b1vg9ETOahitdv2xcJKYargB7+
 2gcFWKv2zjF2Lya2KrtijuLMsDwIGJiq4SO7rbaloOfU0HvHd3SNLgvgqqMVQ+hKQFG96yD+hQI
 U2Dt+71W0iO8xlcj8lpw26wh5W+pEGfHt/z/spnBGgir4LOErSpjPaoXTbhOK8KZ7UJq4Ixgo=
X-Received: by 2002:a05:600c:6208:b0:49e:660a:935e with SMTP id
 5b1f17b1804b1-49eb7340978mr18023765e9.29.1789548823390; 
 Wed, 16 Sep 2026 01:53:43 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf462cesm5652880f8f.37.2026.09.16.01.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 01:53:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B9A286178D;
 Wed, 16 Sep 2026 09:53:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Warner Losh <imp@bsdimp.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v3 03/17] Revert "tests/tcg/meson.build: implement ./configure
 containers options"
Date: Wed, 16 Sep 2026 09:53:26 +0100
Message-ID: <20260916085341.1692742-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916085341.1692742-1-alex.bennee@linaro.org>
References: <20260916085341.1692742-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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

We want to keep the container configuration inside configure for the
firmware builds.

This reverts commit 522b299ca4316d8cad57f9496ffcba87dcc20719.

Tested-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
[AJB: untangle changes since]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure             | 11 +++++++----
 meson_options.txt     |  4 ----
 tests/tcg/meson.build | 25 ++++---------------------
 3 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/configure b/configure
index bedde58b8cf..25d26376f12 100755
--- a/configure
+++ b/configure
@@ -260,7 +260,7 @@ ninja=""
 python=
 download="enabled"
 skip_meson=no
-use_containers=""
+use_containers="yes"
 rust="disabled"
 rust_target_triple=""
 
@@ -727,11 +727,11 @@ for opt do
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
@@ -1718,6 +1718,9 @@ echo all: >> $config_host_mak
 
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


