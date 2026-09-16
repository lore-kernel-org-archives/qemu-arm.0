Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742DC88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 08:56:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6lOx-0007tA-Gc; Wed, 16 Sep 2026 04:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOv-0007qr-90
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:57 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOt-000527-EA
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:57 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d3931so4693235e9.3
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789548834; x=1790153634; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s+iJgOTicDwCjhm5qp3QC56yC+WLMH8ocrsmN4EU6Dc=;
 b=AUzmV9ebxXh1l0K2ayujBtx9mIPrHunjG7er+5Vph55bMHgic5z9N8GLdbKEDfY96O
 rldyp81FFSUPTToE5tN30rNnMAlTQrm4Y0EYUSYEbygXZBOnG8PvIkq1jWcB4bCZsmfN
 uQqN7izq3dLf0IRNxCfIKzuB12q8usPoTRGBIADIS7IoN7F9Vh1ANRyq9JuQsfg/FnmL
 wB0KiEdMRFn4KI0eGWYQwx6g3FKGq5AI4WZIXGmH+vtv6EK/ZRkskGf3jM73H2BKo95K
 hJfWxb78ZD1YXrc4AXwb1j9PvJ0eOhuKFQf2G+Q7LavJLPzI14TOWLSKDmaAhzJQalcJ
 pfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789548834; x=1790153634;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=s+iJgOTicDwCjhm5qp3QC56yC+WLMH8ocrsmN4EU6Dc=;
 b=j4e9uviEfO895DK+R6SKbf+B6QTHmiuQgG7rVKIFugXUlKYVy9OewwI6GgNiiFsmgk
 XfLWKM1hfRw8JQl0RN69VVw4Obp7lNXreNy+Ja22Mi+9TDpPCKc+xOHxfcNi62JBCiYB
 DmBWA2lJkjxQym3Qlt9bk6zzZ68J8BmZNyKVBTPNOoJr+wxO7GKRQrRnwJwDiviDSgQ9
 S9VrYU3J3NcikV0G9yeeKQGN7nR2uB97MFq8EZMH6oOGAljDZKOCofzjnHJG9tGkll/y
 GOzHYYjWI/MhhPrpEeQkR5m7R72i4q7Ynpj+pE3EZgo0zsnGnxPviQ27IQXubX4uEbG2
 Ehyw==
X-Forwarded-Encrypted: i=1;
 AKwUvByO7/EaTX4pyJvTFf6FKeMlRFO6tb/xHzdaR1xtjr1MKMxTU+GP4D/TqRrO1gNCgg9m0ITi1SVTXg==@nongnu.org
X-Gm-Message-State: AFuF++kvbpDvJL4GRgSRBLEAdyu+ksBfKX1nSMjGcEUqxHQI4dlIBSdU
 m+4xshbo2iXdDKF8fwW+wHBWeQvtMYx/th0nDtIIQN6OMhN2rws2b3DcbXoPkUipa3M=
X-Gm-Gg: AYBFou0z87DX4IdKH6WfYkjcBnAZqoxUPaJY67pbkryyDuphNesp1Xe0VJlorG6janb
 zr4niqJaEgqYfPg7kgjqEsQ+OFm8QWaa44SJoQd4hAZLWfTwIFDz2gq0CCcn53G+KCqWUauzjjd
 e7nANW7bO3xB3pgFmmqiEN4f36sBxxpjoBB3ieTmhcdHJSHPx9iKZQQsagsibeZBKztsP3ecn4Q
 jDaQAQDfIvY9ppBfgGb4/bKORf165jkkoU/Xf/xDCGBVyNJPZZui3jC8iK/zU/cUbak7k6cy5+c
 4d3fgVeMDcdJavagPJVe4YvdiGIZrwHxgH8oOq38nU8d5Zph9VSlDnFEhTxxUR7zWypkp19ImDJ
 nYGBHII4sv5eMP8BnHo0PeA80sU8wndZUHpo0JEAMZZHrSABMkKkgsHzjUWpu11uftdb/aiJD1d
 3kBEkPKnDXrtteOBHAiziearv2jKXp4o3YMS4H6SDLpFzY4gr9p5VUWrMIaAkdK7VzVTvtDWk=
X-Received: by 2002:a05:600c:6819:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-49eb7345eaamr18406305e9.31.1789548833953; 
 Wed, 16 Sep 2026 01:53:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83d10940sm56452505e9.1.2026.09.16.01.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 01:53:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2D5BC61982;
 Wed, 16 Sep 2026 09:53:43 +0100 (BST)
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
Subject: [PATCH v3 16/17] scripts/make2mtest: add docker dependencies for
 check-tcg-% targets
Date: Wed, 16 Sep 2026 09:53:39 +0100
Message-ID: <20260916085341.1692742-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916085341.1692742-1-alex.bennee@linaro.org>
References: <20260916085341.1692742-1-alex.bennee@linaro.org>
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

This should trigger the building of the docker image when the user
calls "make check-tcg" or one of the arch specific targets such as
"make check-tcg-m68k-linux-user".

We still keep the internal meson dependency so individual tests can
launched and the docker build verified.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/mtest2make.py | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 383ea68b16d..ab894d90d47 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -14,6 +14,7 @@ class Suite(object):
     def __init__(self):
         self.deps = set()
         self.speeds = set()
+        self.docker_deps = set()
 
     def names(self, base):
         return [f'{base}-{speed}' for speed in self.speeds]
@@ -40,7 +41,22 @@ def names(self, base):
 
 introspect = json.load(sys.stdin)
 
-def process_tests(test, targets, suites):
+targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
+           for t in introspect['targets']}
+
+# collect the docker images uses by the tests. This is totally a hacky
+# heuristic that fishes the images out of the test custom commands by
+# looking for the qemu/image pattern.
+targets_docker = {}
+for t in introspect['targets']:
+    for src in t.get('target_sources', []):
+        for arg in src.get('compiler', []):
+            if arg.startswith('qemu/'):
+                img = arg.split('/', 1)[1]
+                targets_docker[t['id']] = f'docker-image-{img}'
+                break
+
+def process_tests(test, targets, targets_docker, suites):
     executable = test['cmd'][0]
     try:
         executable = os.path.relpath(executable)
@@ -51,6 +67,8 @@ def process_tests(test, targets, suites):
     deps = itertools.chain.from_iterable(deps)
     deps = list(deps)
 
+    docker_deps = [targets_docker[x] for x in test['depends'] if x in targets_docker]
+
     test_suites = test['suite'] or ['default']
     for s in test_suites:
         # The suite name in the introspection info is "PROJECT" or "PROJECT:SUITE"
@@ -59,6 +77,7 @@ def process_tests(test, targets, suites):
             if s == 'slow' or s == 'thorough':
                 continue
         suites[s].deps.update(deps)
+        suites[s].docker_deps.update(docker_deps)
         if s.endswith('-slow'):
             s = s[:-5]
             suites[s].speeds.add('slow')
@@ -81,6 +100,9 @@ def emit_prolog(suites, prefix):
     print(f'all-{prefix}-xml = {all_xml}')
     print(f'.PHONY: {prefix} do-meson-{prefix} {prefix}-report.junit.xml $(all-{prefix}-targets) $(all-{prefix}-xml)')
     print(f'ninja-cmd-goals += $(foreach s, $(.{prefix}.mtest-suites), $(.{prefix}-$s.deps))')
+    print(f'docker-cmd-goals += $(foreach s, $(.{prefix}.mtest-suites), $(.{prefix}-$s.docker-deps))')
+    print(f'docker-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.docker-goals.$g))')
+    print(f'run-ninja: $(sort $(docker-cmd-goals))')
     print(f'{prefix}-build: run-ninja')
     print(f'{prefix} $(all-{prefix}-targets): do-meson-{prefix}')
     print(f'do-meson-{prefix}: run-ninja; $(if $(MAKE.n),,+)$(MESON) test $(.{prefix}.mtestargs)')
@@ -93,6 +115,10 @@ def emit_suite(name, suite, prefix):
     print()
     print(f'.{prefix}-{tgtname}.deps = {deps}')
     print(f'.ninja-goals.check-build += $(.{prefix}-{tgtname}.deps)')
+    if suite.docker_deps:
+        docker_deps = ' '.join(sorted(suite.docker_deps))
+        print(f'.{prefix}-{tgtname}.docker-deps = {docker_deps}')
+        print(f'.docker-goals.check-build += $(.{prefix}-{tgtname}.docker-deps)')
 
     names = ' '.join(sorted(suite.names(name)))
     targets = f'{prefix}-{tgtname} {prefix}-report-{tgtname}.junit.xml'
@@ -105,19 +131,16 @@ def emit_suite(name, suite, prefix):
     print(f".{prefix}.mtest-suites += {name} $(call .speed.$(SPEED), {names})")
     print(f'endif')
 
-targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
-           for t in introspect['targets']}
-
 testsuites = defaultdict(Suite)
 for test in introspect['tests']:
-    process_tests(test, targets, testsuites)
+    process_tests(test, targets, targets_docker, testsuites)
 emit_prolog(testsuites, 'check')
 for name, suite in testsuites.items():
     emit_suite(name, suite, 'check')
 
 benchsuites = defaultdict(Suite)
 for test in introspect['benchmarks']:
-    process_tests(test, targets, benchsuites)
+    process_tests(test, targets, targets_docker, benchsuites)
 emit_prolog(benchsuites, 'bench')
 for name, suite in benchsuites.items():
     emit_suite(name, suite, 'bench')
-- 
2.47.3


