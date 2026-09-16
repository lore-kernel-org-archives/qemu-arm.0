Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A10C982C4
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:32:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6rbE-0002Ri-83; Wed, 16 Sep 2026 11:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raf-00028b-Dp
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:30 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6rac-0001Og-LK
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:28 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso7986535e9.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789572625; x=1790177425; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ia1iqu2U+qZi5N8AovWb2KY0ZeNa8fN7byR+SUBWsVY=;
 b=MWH8/Cm9/067adQ9Y0PkLl1yqbuBnd+xWsGngW3q6uruQkB9MlDUrotOwFwP2QcYuK
 L8Z9N14Ih0RVnXsPg7OcmXePoASWrISqDB9edJG1kPQUZZX/PcBfh2fQ3N0gZjasBgAl
 aml1m9if2LD07iUTfWIFt4heA0AsDyfa72LtwXZBqhMaJyTyLmdIDYE5IKDfMrwWDtxV
 D6uX7AukmaVYU5N3bIEKTm25slLx8Zmoyhyu6SzOl3hoZyaDc5FoQBoqM5nEiAaBlHZI
 tU4+IeIThW95cNMKeuD6CAFvoN9rM5zzleMgkDuOYTAqwwbJShsb9Cd77NBoebu4c8dt
 SF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789572625; x=1790177425;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ia1iqu2U+qZi5N8AovWb2KY0ZeNa8fN7byR+SUBWsVY=;
 b=bIpCy542KwY2sn7rkGJ8VsSJ8tbGkgk2L8YhBZvBPAQk23d6wpObU8G4EfratKgUP7
 5SnAb06QRwCSt6CDPOQdh2KKvgyY9tGznw2LEtjwjpygm07gYNl1Ux2qUaxVYVmM8ZGb
 2+6fBYHviGAu7acxdljfjEleyeenjGwGSn6tdOBH2IF1bPdd8K2752xyH5i3uZuQsO8t
 53mcXV207VrFkTu/7HuNl9j35+91t3F9T8nfhWYwqHRm7WQSNNn89ripOy42dPsmT5NJ
 44lxoV7O1QO6L+gTjaYYYjpTyHvax7XLzE5DdiC4/m2fO2HMHZSKCXgFI0RSxzVDxRxa
 hi/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1OqZlXBbkgG7mum3zcbmQNK+naCbloIRkHQHVup/7RfdCFhoMWCNsbNVs20LsnZ8QzfmlP8rtOw==@nongnu.org
X-Gm-Message-State: AFuF++l9LEWxNHJvqeOrE5kS2GjIm3KPgLi4YfriP+IUtdfwVYsyFhcX
 qeOWt/I3xbkyzSmz0EMPuaN5IgJ9uJ/hE1WyPFsL9ybTgWnnjXB/8EAUCRYGMhaT8SY=
X-Gm-Gg: AYBFou0KsPYpOfoClsLYF8E8t1+DZ1DA7EDwrbTWVAOCJnk5UGCcCjqwB7opOYeXt8g
 JFGGVYCf1sfZmvzQx46E+/L+wquTLCfdV4+2WV3194540QumyuoFKpnZ/dIOfkwiReFq/kZ7tdE
 c3QKUf9Abkrwbw/hpPOuurj0qCoMX/txP9F3+XavyKYLriaEl4n3QfUgF3xM26/U2NDBtSs4NOQ
 m3O9koqLY1ZFgVxxOBxTiBoISja1KzrjreU4KHP+Lj+T5HGZUTYlW96bxUbMr9RIHZz9JxpkWMQ
 3mfGEpXbHCtpOQR4a9Ew7fSAvZpkYODQZ2wxZ/kfA6Gaa/+OYAoD8BphCOKcL0Rpj7kv7/EdcfM
 h6+CeHsCcP3/ePdRScS1zrV28ISUl5oYtAIt1Y9GU46iZ3zo1HfxOJPz0RvY4wEqu/aZRL5XYo5
 l0rn62NP/Anyi/qOz8sQbSAoOz++vSbrT4RSYgSTmn57rZdpHDwXi4MwDLkk2r/jfoQw29nvkZ
X-Received: by 2002:a05:600c:4686:b0:499:8b13:3a98 with SMTP id
 5b1f17b1804b1-49eac46396bmr36048685e9.4.1789572624964; 
 Wed, 16 Sep 2026 08:30:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e847fcbdfsm51416285e9.4.2026.09.16.08.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:30:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1659361929;
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
Subject: [PATCH v4 08/19] tests/tcg: use --add-current-user when building
 containers
Date: Wed, 16 Sep 2026 16:30:01 +0100
Message-ID: <20260916153013.2134555-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916153013.2134555-1-alex.bennee@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
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

As the meson tcg build routes the container builds through docker.py
we can also clean up its hack which involved appending a RUN line to
the dockerfile. All the dockerfiles that care will work with the
--build-arg.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 13 ++++++-------
 tests/tcg/meson.build  |  3 ++-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 315fa2ff848..6090a9dc957 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -297,13 +297,6 @@ def build_image(self, tag, docker_dir, dockerfile,
                                              dir=docker_dir, suffix=".docker")
         tmp_df.write(dockerfile)
 
-        if user:
-            uid = os.getuid()
-            uname = getpass.getuser()
-            tmp_df.write("\n")
-            tmp_df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
-                         (uname, uid, uname))
-
         tmp_df.write("\n")
         tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s\n" % (checksum))
         for f, c in extra_files_cksum:
@@ -315,6 +308,12 @@ def build_image(self, tag, docker_dir, dockerfile,
         if self._buildkit:
             build_args += ["--build-arg", "BUILDKIT_INLINE_CACHE=1"]
 
+        if user:
+            uid = os.getuid()
+            uname = getpass.getuser()
+            build_args += ["--build-arg", "USER=%s" % uname,
+                           "--build-arg", "UID=%s" % uid]
+
         if registry is not None:
             pull_args = ["pull", "%s/%s" % (registry, tag)]
             self._do(pull_args, quiet=quiet)
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index d2a837f103d..d317f0ee310 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -237,7 +237,8 @@ foreach target, plan: tcg_tests
     image_name = 'image-' + cc_dockerfile
     has_docker = docker_host_arch_supported and docker_supported
     if cc_dockerfile not in image_targets and has_docker
-      cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', 'qemu/' + cc_dockerfile]
+      cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', 'qemu/' + cc_dockerfile,
+             '--add-current-user']
       t = custom_target(image_name, command: cmd,
                         build_by_default: false,
                         output: 'no_output_' + image_name)
-- 
2.47.3


