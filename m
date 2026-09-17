Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B26CC88E72
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:58:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FQF-0008Q6-Jn; Thu, 17 Sep 2026 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPP-0007jW-Ry
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:29 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPN-0000pW-Vx
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:27 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so6065335e9.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664184; x=1790268984; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KnL6IKhM3dX41QqD22hf7RzeQ5QC61WVqJNh+BsXAJU=;
 b=zp5P1AfWH44Iy6wm9js6reEaV7xNv6pYV6mgtGOdI0uoRWXpJPEZEAIwAqRYhU8+Ga
 Bnkzi50EzYQ/0aNjBHa0FixgRBJ3sK/rH4NxUjtKJNUz/pkbZBj+MAJ+L8frrzxty6tq
 gfv6jgkF3azVivk6DOB+i2FuX1YhFRHzxBJ4hJRGqqcSbiuFh6R5bYJE5nAlKkhLAxCn
 bshB8octaEAl4pjZ9p9yUOzDRXM3l7+PabJpCGh5O7MKEuxQuqTB5zqJuxIR5HAP1geX
 AnEgta1LUm4vCiWFm/tS3LmH2gLIA+Ml851vfgodI850DCIjX6CkxSO2qLrABnKsj+5e
 xvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664184; x=1790268984;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KnL6IKhM3dX41QqD22hf7RzeQ5QC61WVqJNh+BsXAJU=;
 b=lWg1jMh8IxQS07v9ueyDuOTSHKeo8yllAmdxrCdXJ4DKAsdnRVdaDPaRrBOuIhPjww
 598WHVev54q9rT5DAUxjTZCFpqXFjfsCgpnXsFjlaQL44EHSNmOKJdgrKE9PUNA0Frip
 OZNdFJZmF6UvCW78F5iQsDxYaL9c3ZeNL3a5/gl2hQHezQJm6EE/NNF+uFwD66+LScHJ
 BURrGV4ysdgwd1i+YPLkC36uSNl6ZfOpmhzBKqtWWS04ufzUAnsMPrvDdva4HLv3D9EP
 Dl4119Ryi3GIuELDUKl8Lt95SYFT+5+cCiiOPh7KWpHhZ1qW0NJZGD09sHU1IOK+h1+L
 B4cg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6DCbV0EknHzRQTtxufQqbNpE8kb0KAoa/WS77WpFUsnkLO4Bqq5v4xzaIM8Bn9xi6ise9EcAkLQ==@nongnu.org
X-Gm-Message-State: AFuF++mK8TFKxaFzxafVNyEvQ65q1mt+NO0P2samJ0rPXgJ6ODt0eT1l
 WWtTliQsS+gpzjbXAvFE8zb7WwtjSqpSekBywCIImu5myiyxZ+VoF/8MZdjBLZVayhE=
X-Gm-Gg: AYBFou34nwIBG7hG0SgqSGi7yEdJ4GQLavr/tNuSJfnpdxOvFX3xK/1uG0A3rwj09zd
 hZqTOCh8IUNYno8HtiXy1tJdKrvZ0M3RIr0cnkTKLRHr9Yaa6GUhhWXvNk6on9/m7876wtKZxZ2
 3WPK7MPHrZpMmbNlVqhjBO6tHNWhJODBIRyz5qJmO/d6pT6/uaB1+L4kC+W3ZEZHUalVMuIMl9+
 /jHHh++KrHC/Qr1MujE9om35rYIliPhpBg6Hqp0ySgZebo2ejp701o7wlgAd8x2u/U6Hcdr1+VO
 +GJJTwaf4j/HiMNeqO2DmBN/f37SHrLpaJy1QT1Tq7CvyH7SxnaDWLnxHWqko0Hl917nyeUHQ29
 cz9xZByuEKCOU02YyQmgymeZ7fpRkERyL/aougqu5U0bY4rzmBporSeDcratACIYg2vTSI0Q8lD
 UOfbdCm3J52FKpw/a1ZAUiizF7MvWAUMfebS4jXL30Y83MQCurSS8LeXw5RTiSmtlOnbSAz9EIe
 izafr6+ow==
X-Received: by 2002:a05:600c:83c9:b0:49e:7caa:e7b2 with SMTP id
 5b1f17b1804b1-49eb733800amr77113715e9.29.1789664184110; 
 Thu, 17 Sep 2026 09:56:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd22dbf2sm82500085e9.10.2026.09.17.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7387D5FC99;
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
Subject: [PATCH v5 12/17] tests/docker: add specific command to parser
Date: Thu, 17 Sep 2026 17:55:56 +0100
Message-ID: <20260917165602.3405537-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
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

A future change will want to use additional flags which clash with
docker/podman command lines. Currently they would get snarfed up by
argparser. Make the pass-through commands explicit to avoid this.

Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/coverity-scan/run-coverity-scan | 2 +-
 tests/docker/docker.py                  | 5 ++++-
 tests/tcg/meson.build                   | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 2f9ccd5e44b..0e1361606e0 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -381,7 +381,7 @@ if [ "$DOCKER" = yes ]; then
     # Arrange for this docker run to get access to the sources with -v.
     # We pass through all the configuration from the outer script to the inner.
     export COVERITY_EMAIL COVERITY_BUILD_CMD
-    tests/docker/docker.py run -it --env COVERITY_EMAIL --env COVERITY_BUILD_CMD \
+    tests/docker/docker.py run -- -it --env COVERITY_EMAIL --env COVERITY_BUILD_CMD \
            -v "$SECRETDIR:/work" coverity-scanner \
            ./run-coverity-scan --version "$VERSION" \
            --description "$DESCRIPTION" $ARGS --tokenfile /work/token \
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index a2e97061240..d7eb4cf6811 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -336,9 +336,12 @@ def args(self, parser):
                             help="Don't remove image when command completes")
         parser.add_argument("--run-as-current-user", action="store_true",
                             help="Run container using the current user's uid")
+        parser.add_argument('cmd', nargs='*',
+                            help="""The command to run. You should precede with
+                            -- to avoid confusion about its flags""")
 
     def run(self, args, argv):
-        return Docker(args.command).run(argv, args.keep, quiet=args.quiet,
+        return Docker(args.command).run(args.cmd, args.keep, quiet=args.quiet,
                                         as_user=args.run_as_current_user)
 
 
diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 482de73ac72..053ef147df0 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -275,7 +275,7 @@ foreach target, plan: tcg_tests
       mount = meson.project_source_root()
       mount = mount + ':' + mount
       here = meson.project_build_root()
-      cc = [docker_wrapper, 'run', '--run-as-current-user',
+      cc = [docker_wrapper, 'run', '--run-as-current-user', '--',
             '-w', here, '-v', mount,
             'qemu/' + cc_dockerfile, plan['cc']]
       has_cc = true
-- 
2.47.3


