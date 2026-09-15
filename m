Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB27C88E7D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:19:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ZbU-0008Ah-He; Tue, 15 Sep 2026 16:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZl-0006tI-EA
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:22 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZc-0003JC-4D
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:15 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f633ecdeso95316f8f.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503370; x=1790108170; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HlUNZ7JGzsbO42Hhk0mF6bv3uGqsFUKiR49vVBrXMEE=;
 b=B0L9h0rpR+7/AQexC/N9ZgVOTca6A0wXwqeej/Owp/5MThmLCC2KBvEJAqAAcDK1xS
 MoGMemZHwYc4/nuUpto2JBgkNY3uLky2fKERxUFGLwEvf4kMI77eToVYorpwfQnh6omT
 g8Nhk+RlHIRaFwvuhDRuIJ8pqWFbJCMqLKJHA/nf1tHeIFcH1qhpSs4Xbi1GakVOus5R
 y2NsqN04QfJUa0QGTCUZhUPqShyIeUUd/9aa6TjSq/cGorld7/tq5ff11spbxpacFc4x
 atBM5uC09TSgF2Mbu26WZyxYFUhaK0rAQ00Hpk9YAUgQ0h78AqVS2vW6n8SSVVy9H3/1
 mE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503370; x=1790108170;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HlUNZ7JGzsbO42Hhk0mF6bv3uGqsFUKiR49vVBrXMEE=;
 b=B2ZBXXXoBZSCR5lqDhOGngSR7KiXBnLLCUl1RuAWhzaFHy747v1qQa0wFTBEv0+lrm
 hSBvcFu+Mu72mebWeMdiWhn0mhJdUb+LRjxK6fBXjZzPSzRkWkVdmNJYWUPfYgDJgylo
 4aqiP5elD5ie43Xm/t7qRYJBRBV9Zu4IWUwLqS//+fE44I5POPrk5zgqdFBzbSnwXcku
 LbAvEJ3wSxSHgzmlMprkjdONWfCDuSQYSEQaRos6t8NRT9bMGsEHDUi/CC7cGd+EPxBY
 ufJZ0+WPn9amGGn2JBxVfXSzOrS6dwR/QQcmMf9TvEz+F21Ja2Ea+I/4p+Y5GU73BYod
 PjQQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByZz45gVhDujS5pxV8jNUVbGwiQbbfCUR/4kr9Eh7RKSs3tzhn/37+Iw6PIea/kS52cPRDe3TSeGg==@nongnu.org
X-Gm-Message-State: AFuF++kvPTZYKl8WJriLYM2bycN/EtezNQnPgyVo17yfUdcv+Ehr01JY
 eQWBXU5pf8ULGgY5ka5H7hqJVuXh0pILe62BLXjaH5jB+mrF93p63zKJPDLtDiO6zEo=
X-Gm-Gg: AYBFou0j557EF2G9PpsWUl4HRpgp9txF3KJC0zONEGnIbReFWEZppMmQV4aSgzh/jEq
 LdT922mJg8DoaxXNhRNRZDmTqu2kCRFFE80vNjom26WQLauwKba/JPppsaFMdJbKyueuG208yHk
 VvYtcgueIZXG4oRrEK5+aUEDw9io+uP91Qkkjc52mcP6Byl+9Z1LD7ENHnaXgziZkF3Hzvp22Du
 IECDTT5OPDSDXePHQSrGt8q0Zxl8aEGKcPTog4TT3Ry35hXnMt8Qai01CGsZhsVHWMlobslSOIN
 O4TA07pxq4X4Nu/TJhu6feubsomohBebTz5cRdMgj7UF9ysksU4TL3QycrIoaEUV5aaGYkJ3efH
 KV+P5YZxx8dO7Q7IsqY00+3lRlocSItd7OpRNCgM0pNq24ypFNGjFpBIuQpssj6AJ4KteSfK9dh
 364luafuOE7pHhYAf0UWiHHonSgCt9CVUTxsfZ87aH0L+3pj/AmmZ5JZKHUdkp01Nh3cT5Ifs=
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id
 ffacd0b85a97d-4870cf25729mr91263f8f.22.1789503370529; 
 Tue, 15 Sep 2026 13:16:10 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1fad3sm1215976f8f.12.2026.09.15.13.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 084B061926;
 Tue, 15 Sep 2026 21:16:03 +0100 (BST)
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
Subject: [PATCH v2 13/15] tests/docker: swap --quiet for --verbose
Date: Tue, 15 Sep 2026 21:15:58 +0100
Message-ID: <20260915201601.1207839-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915201601.1207839-1-alex.bennee@linaro.org>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
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

Running the docker build in meson spams the output so default to quiet
and make --verbose the options. If we want to expose verbosity in
meson we can deal with that later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 10 +++++-----
 tests/docker/docker.py        | 22 ++++++++++++----------
 tests/lcitool/libvirt-ci      |  2 +-
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 74bf471f171..85825d74dfb 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -72,13 +72,13 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 			DEB_TYPE=$(DEB_TYPE) 					\
 			$(if $(DEB_URL),DEB_URL=$(DEB_URL),)			\
 			$(DOCKER_SCRIPT) build -t qemu/debian-$* -f $< 		\
-			$(if $(DOCKER_V),,--quiet) $(if $(NOCACHE),--no-cache) 	\
+			$(if $(DOCKER_V),--verbose) $(if $(NOCACHE),--no-cache) \
 			$(if $(NOUSER),,--add-current-user) 			\
 			$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))	\
 			$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)), \
 			"BUILD","binfmt debian-$* (debootstrapped)"),		\
 		$(call quiet-command,						\
-			$(DOCKER_SCRIPT) check --quiet qemu/debian-$* $< || 	\
+			$(DOCKER_SCRIPT) check qemu/debian-$* $< || 		\
 			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
 			"CHECK", "debian-$* exists"))
 
@@ -103,17 +103,17 @@ debian-toolchain-run = \
 	$(if $(NOCACHE)$(NOFETCH),					\
 		$(call quiet-command,					\
 			$(DOCKER_SCRIPT) build -t qemu/$1 -f $< 	\
-			$(if $(DOCKER_V),,--quiet) 			\
+			$(if $(DOCKER_V),--verbose) 			\
 			$(if $(NOCACHE),--no-cache)			\
 			--registry $(DOCKER_REGISTRY) --extra-files	\
 			$(DOCKER_FILES_DIR)/$1.d/build-toolchain.sh,	\
 			"BUILD", $1),				        \
 		$(call quiet-command,					\
-			$(DOCKER_SCRIPT) fetch $(if $(DOCKER_V),,--quiet) \
+			$(DOCKER_SCRIPT) fetch $(if $(DOCKER_V),--verbose) \
 				qemu/$1 $(DOCKER_REGISTRY),		\
 			"FETCH", $1)					\
 		$(call quiet-command,					\
-			$(DOCKER_SCRIPT) update $(if $(DOCKER_V),,--quiet) \
+			$(DOCKER_SCRIPT) update $(if $(DOCKER_V),--verbose) \
 				qemu/$1 				\
 				$(if $(NOUSER),,--add-current-user) 	\
 			"PREPARE", $1))
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d7eb4cf6811..10cb4cbde11 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -312,8 +312,8 @@ class SubCommand(object):
     name = None  # Subcommand name
 
     def shared_args(self, parser):
-        parser.add_argument("--quiet", action="store_true",
-                            help="Run quietly unless an error occurred")
+        parser.add_argument("--verbose", "-v", action="store_true",
+                            help="Run verbosely (default is quiet)")
 
     def args(self, parser):
         """Setup argument parser"""
@@ -341,7 +341,8 @@ def args(self, parser):
                             -- to avoid confusion about its flags""")
 
     def run(self, args, argv):
-        return Docker(args.command).run(args.cmd, args.keep, quiet=args.quiet,
+        return Docker(args.command).run(args.cmd, args.keep,
+                                        quiet=not args.verbose,
                                         as_user=args.run_as_current_user)
 
 
@@ -390,7 +391,7 @@ def run(self, args, argv):
         # Is there a .pre file to run in the build context?
         docker_pre = os.path.splitext(args.dockerfile)[0]+".pre"
         if os.path.exists(docker_pre):
-            stdout = DEVNULL if args.quiet else None
+            stdout = None if args.verbose else DEVNULL
             rc = subprocess.call(os.path.realpath(docker_pre),
                                  cwd=docker_dir, stdout=stdout)
             if rc == 3:
@@ -416,7 +417,7 @@ def run(self, args, argv):
                  for k, v in os.environ.items()
                  if k.lower() in FILTERED_ENV_NAMES]
         dkr.build_image(tag, docker_dir, args.dockerfile,
-                        quiet=args.quiet, user=args.user,
+                        quiet=not args.verbose, user=args.user,
                         argv=argv, registry=args.registry)
 
         rmtree(docker_dir)
@@ -435,9 +436,9 @@ def args(self, parser):
 
     def run(self, args, argv):
         dkr = Docker(args.command)
-        dkr.command(cmd="pull", quiet=args.quiet,
+        dkr.command(cmd="pull", quiet=not args.verbose,
                     argv=["%s/%s" % (args.registry, args.tag)])
-        dkr.command(cmd="tag", quiet=args.quiet,
+        dkr.command(cmd="tag", quiet=not args.verbose,
                     argv=["%s/%s" % (args.registry, args.tag), args.tag])
 
 
@@ -513,7 +514,7 @@ def run(self, args, argv):
 
         # Run the build with our tarball context
         dkr = Docker(args.command)
-        dkr.update_image(args.tag, tmp, quiet=args.quiet)
+        dkr.update_image(args.tag, tmp, quiet=not args.verbose)
 
         return 0
 
@@ -532,7 +533,8 @@ class ImagesCommand(SubCommand):
     name = "images"
 
     def run(self, args, argv):
-        return Docker(args.command).command("images", argv, args.quiet)
+        return Docker(args.command).command("images", argv,
+                                            quiet=not args.verbose)
 
 
 class ProbeCommand(SubCommand):
@@ -574,7 +576,7 @@ def run(self, args, argv):
                 cmd += ["-v", "%s:%s:ro,z" % (p, p)]
         cmd += [args.image, args.cc]
         cmd += argv
-        return Docker(args.command).run(cmd, False, quiet=args.quiet,
+        return Docker(args.command).run(cmd, False, quiet=not args.verbose,
                                         as_user=True)
 
 
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 76b5dd5b5c8..5176e136ab1 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 76b5dd5b5c84511e2e799c2b3d6a2a9b9f6a081d
+Subproject commit 5176e136ab11e275eb9f57c3d5c80e77af6507cb
-- 
2.47.3


