Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4668C88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 08:55:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6lP1-00084C-Q3; Wed, 16 Sep 2026 04:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOu-0007qX-Sf
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:56 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOt-00051y-4l
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:56 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e6598dd44so3587045e9.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789548833; x=1790153633; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zGF8Zru9UFaw3tvZdLkb/lAyT4SI/GstcoOfFvkorMM=;
 b=hM3nhAZlhmyD1XbsO8EjiHjAjN3N2iQbI5O+kZxEi9eFQyJ6HauwFohQxy+j4wvKel
 XcGjboziWH/ZkT7TTKa6Iji2s2/1a734nv+zn7w8gKRFZTprkCWDnn08wu+KLSQDmNXD
 BkaHqSGfutfofqttYWybIfSmiMfqmGho0mlkp65gfVrXs/KGemDk+lFAgFySAB4/Zc9S
 ETz640PSNs4toNUF6OJZTY1L406VsexqVTnt0BKMSgl3rwHkoP96aDTg9yzZe1CCyNo4
 slWdN458Vp6er5qqW2t3RfcwXwfETEs2N6VGkCMhAgb3nEuqWAvjC50jJIJqjtMMfoyx
 LyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789548833; x=1790153633;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zGF8Zru9UFaw3tvZdLkb/lAyT4SI/GstcoOfFvkorMM=;
 b=sdKOkutGFVneCys7rDlG1TRP6121vayaMT65+BqKqXUYvCAszxZCMxq1Ul0p15fald
 PbHnM6MkZdWa1TDo7I98XWKOKkj2nDlxXu2wuVWbPkPnqK8wIqIa0IX+PxbbYla+/LRr
 KrVdY66F/n8FP7yWiztDMGvW1/k2oQS1CVcpMPHfZO86CxCVF0q0DGmpMr9aUUGSCAiH
 mopxEAgP1nY8YZik+/SFtHT7KnptVJygjx0gxahzvWKxzsWIt/w1qmfjEIV1FHESVAIW
 B0tY0O7e3PF3vpPQwrZOyUoAEHB2yVyYtPv4+I5w+4m/4x/KkplEkxeJFnmnHSBcUxb7
 JApg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwzFyhm1gbqQs3bnrVywqiAIZNynJ/H9pRFq0nGFgN4WHjFAa3aHqSmIipJYF3vHVgX97GeW5Kg3A==@nongnu.org
X-Gm-Message-State: AFuF++kensjGnUsfl016LBVfpzjHm2MzU/RWeUntH8h0v8oIlNwMiFp9
 DD6vaqnUn+0Gx43fhsujpgaB4TYH/kZeHcOqjy3apHIyrPNuBw9hZHfvgHOHqg/i+cU=
X-Gm-Gg: AYBFou0ZcDtsBhbClk7UOVz2+0nPouuOlLUIy47Ca70FgFauK18W+qjcW1ieIXwowY/
 g3MREDXxdB6m4aoflcyq0/7l7SBF6noGHpSPC2u31RBmtF9oyyMg4ZomH7ZptA+OqfJhpPXmVQa
 hPYHJY97jq9hoVaFbWekar68DaDQ7m5seje2ofQ6WRmMN1+VzPpyPYMlrMBtJk5dp1sYcRrvfzu
 KaN7BQMpgp8LI62uaj2/Rg6RB0vLL3P6IP+OJu/+e/wHkJclj5BX7gWfLcn3hpUcx3q5MaBPlNb
 aM+LpRlPTCAolyXoaQ+ITXUPn2dKo/uuHqJcMpCzq6mz82l6pfxRO/x447gmhekcYjUm/crGMDk
 xuYxiA6LmWsCE2/cjGzSbESoN/bQHgLpUxhXMuvVW9gZ6XbTPHKw46uV2cViOMMvOFzqFGnYSRI
 ct69j2kxreT1SzWOpoWyVdOumoZIzbZKYOnkOYSv02EuwU9+MYhkPDlLYNfvIvrqdEmMJxdBc=
X-Received: by 2002:a05:600c:1909:b0:49e:6249:268b with SMTP id
 5b1f17b1804b1-49eb733983bmr16836425e9.32.1789548832615; 
 Wed, 16 Sep 2026 01:53:52 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ed292fc12sm41530355e9.15.2026.09.16.01.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 01:53:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B776F6191C;
 Wed, 16 Sep 2026 09:53:42 +0100 (BST)
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
Subject: [PATCH v3 12/17] tests/docker: add specific command to parser
Date: Wed, 16 Sep 2026 09:53:35 +0100
Message-ID: <20260916085341.1692742-13-alex.bennee@linaro.org>
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

A future change will want to use additional flags which clash with
docker/podman command lines. Currently they would get snarfed up by
argparser. Make the pass-through commands explicit to avoid this.

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
index fce70f8e56f..17974e4d15c 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -237,7 +237,7 @@ foreach target, plan: tcg_tests
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


