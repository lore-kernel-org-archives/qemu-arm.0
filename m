Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122CACCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:24:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs5L-0004KY-He; Tue, 11 Nov 2025 12:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzz-0005q8-BL
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:43 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzr-0003yN-Aw
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:42 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so6968119a12.0
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881454; x=1763486254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glL4PMebuiMgidhmY2a2TZVCW1BYHHEcevF9p4vs0SA=;
 b=HUvUQXUIB+QCzG1b9jm6TstAQTHBY0jlYh5gWkbiwTyE77Rr7NePt13QoaiQDEopEW
 rKIHi1CgjH+TSdmBBOluPev4jnJGJpb2J1WX7PYjjdfJ5mjm8dEySjBxWYv4VB/OuDNN
 aBlblTk8xOvvS0UWu83X+A1vr8qwWqdCqsbmbTv3GVAMP748v3/IZWl2LM3AV5jWR09X
 J0+SJRVy7FEaVzjJgJKKra4a2fRFJSCHEnMygff/tVS27Rs80PgiE60ymqzBqDNgRyjr
 J3Su/NtS6Ue2KPKcgGf0w40bOsaOkbz3VwCzg2/slJZfOLhqST5s28OCDuqtLdEe580/
 tkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881454; x=1763486254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=glL4PMebuiMgidhmY2a2TZVCW1BYHHEcevF9p4vs0SA=;
 b=GkpHIsUr/5Cy7417ucGPe2KGuv9UE22tTHJPa35mjwAyklKRbKZBsoO3LqIqGSgd1o
 r6A8TfrWBH4pkuL1TbISVtevuC44P990HLZ6oKeJAZd0BVk7nVXMmErD9VKbGttI0Z47
 OF9+u5MlIc9jreiAeLcRm5VExfihvD7gqBWtgPFQ3zX6vRkMuKkzDqsmnEd0Js6Fwv8o
 2RUWemYhrw3g5+EF/Raicc55OSznNjL9Wuji6cOweu3LJGHtJUNn33SMorbgZcT5OPAQ
 Yk5UqSasD8cISi+S7lsujSL7Fk8rjNxYu07lU35PYz3D2rcMb6PDeFkxTnu6ibRVswrq
 wAZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTD0bS9qvQPi/6HgegFuqNLpLgaRLzdrviVZVNpVOkI+lAq6oTvRJkfIft/feRNkPdtJM6/TK5Tg==@nongnu.org
X-Gm-Message-State: AOJu0YyZ1TBu8emGpeEwh2yZFtDgHDlUNLJdaAaNC4y+vrSzwHiDdU5n
 i7n1yJnUjqyHZwK5ULGpCnY2uBPIxLoHkuQqlEXGMKx7oyj+2uzwq4LEIzkwEDMue80=
X-Gm-Gg: ASbGnctRTfLtPkvnKZxB6snpqSdQFclz3iIN04urOj8jo5/bcYzSgubbQhHa/382h5S
 SVS6hosfU8M9wOyILEJWZVSkCkSmNA+d6ASk+OBJ9eAssIe7+F+38aBpWuoLJVKAx34jJLFqDd5
 U3X8Oa7Ic6goyv0rjjxqYrdLd0hB/U4ebCMuQAsyfsN7WsoO3oQR16UoRcW5sASo71veMg24rcl
 vaGzlxYCTXy48x35WZnsuPMnCl2bpLQ/6zB4urbpMQa+8Irr39DrPJjmsTFTbZrUIX/Srva3qCs
 OCvgEOVbEcXWzsQVr76jnGGQ6hL2kHyP6P/E0ChYsXpks2Um5xJp7Ug8ZnXJSyc3PtqA6kINzPm
 Rke3UnboL60wui7+FsbtH8YjXxop2HS0SaMzmowt0knRNE2NSRLPIAKQratzkEC5kkWFngYNnVW
 Qb
X-Google-Smtp-Source: AGHT+IFqWFJG51QU8oKjZfr6lOD9E7rJY++PQ95IH/ortVzcdzRVhxUjVr/tj1WDORjQY32KeAOkGg==
X-Received: by 2002:a05:6402:3508:b0:641:1f6c:bccf with SMTP id
 4fb4d7f45d1cf-6415dc1ebd7mr11564501a12.16.1762881453569; 
 Tue, 11 Nov 2025 09:17:33 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862cd7sm13899519a12.30.2025.11.11.09.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C537B60DC4;
 Tue, 11 Nov 2025 17:17:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 13/16] gitlab: use template for ubuntu-24.04-s390x jobs
Date: Tue, 11 Nov 2025 17:17:20 +0000
Message-ID: <20251111171724.78201-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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

Most of the test is pure boilerplate so to save ourselves from
repetition move all the main bits into a minimal copy of
native_build_job_template but without the caching.

We keep all the current allow_fail and configure setups but do take
the opportunity to replace the inline nproc calls to using a common
JOBS variable.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../custom-runners/ubuntu-24.04-s390x.yml     | 181 +++++++-----------
 1 file changed, 66 insertions(+), 115 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
index 45dbee17880..ef8db2750ac 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
@@ -2,129 +2,80 @@
 # setup by the scripts/ci/setup/ubuntu/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 24.04"
 
+.ubuntu_s390x_template:
+  extends: .custom_runner_template
+  needs: []
+  stage: build
+  tags:
+    - ubuntu_24.04
+    - s390x
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+    - if: "$S390X_RUNNER_AVAILABLE"
+  before_script:
+    - source scripts/ci/gitlab-ci-section
+    - section_start setup "Pre-script setup"
+    - JOBS=$(expr $(nproc) - 1)
+    - section_end setup
+  script:
+    - mkdir build
+    - cd build
+    - section_start configure "Running configure"
+    - ../configure $CONFIGURE_ARGS ||
+        { cat config.log meson-logs/meson-log.txt; exit 1; }
+    - section_end configure
+    - section_start build "Building QEMU"
+    - make --output-sync -j"$JOBS"
+    - section_end build
+    - section_start test "Running tests"
+    - if test -n "$MAKE_CHECK_ARGS";
+      then
+        make -j"$JOBS" $MAKE_CHECK_ARGS ;
+      fi
+    - section_end test
+
 ubuntu-24.04-s390x-all-linux:
- extends: .custom_runner_template
- needs: []
- stage: build
- tags:
- - ubuntu_24.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
- script:
- - mkdir build
- - cd build
- - ../configure --enable-debug --disable-system --disable-tools --disable-docs
-   || { cat config.log meson-logs/meson-log.txt; exit 1; }
- - make --output-sync -j`nproc`
- - make --output-sync check-tcg
- - make --output-sync -j`nproc` check
+  extends: .ubuntu_s390x_template
+  needs: []
+  variables:
+    CONFIGURE_ARGS: --enable-debug --disable-system --disable-tools --disable-docs
+    MAKE_CHECK_ARGS: check-tcg check
 
 ubuntu-24.04-s390x-all-system:
- extends: .custom_runner_template
- needs: []
- stage: build
- tags:
- - ubuntu_24.04
- - s390x
- timeout: 75m
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-user
-   || { cat config.log meson-logs/meson-log.txt; exit 1; }
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check
+  extends: .ubuntu_s390x_template
+  needs: []
+  variables:
+    CONFIGURE_ARGS: --disable-user
+    MAKE_CHECK_ARGS: check
+  allow_failure: true
 
 ubuntu-24.04-s390x-alldbg:
- extends: .custom_runner_template
- needs: []
- stage: build
- tags:
- - ubuntu_24.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --enable-debug
-   || { cat config.log meson-logs/meson-log.txt; exit 1; }
- - make clean
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check
+  extends: .ubuntu_s390x_template
+  needs: []
+  variables:
+    CONFIGURE_ARGS: --enable-debug
+    MAKE_CHECK_ARGS: check
+  allow_failure: true
 
 ubuntu-24.04-s390x-clang:
- extends: .custom_runner_template
- needs: []
- stage: build
- tags:
- - ubuntu_24.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --cc=clang --cxx=clang++ --enable-ubsan
-   || { cat config.log meson-logs/meson-log.txt; exit 1; }
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check
+  extends: .ubuntu_s390x_template
+  needs: []
+  variables:
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-ubsan
+    MAKE_CHECK_ARGS: check
+  allow_failure: true
 
 ubuntu-24.04-s390x-tci:
- needs: []
- stage: build
- tags:
- - ubuntu_24.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --enable-tcg-interpreter
-   || { cat config.log meson-logs/meson-log.txt; exit 1; }
- - make --output-sync -j`nproc`
+  extends: .ubuntu_s390x_template
+  needs: []
+  variables:
+    CONFIGURE_ARGS: --enable-tcg-interpreter
+  allow_failure: true
 
 ubuntu-24.04-s390x-notcg:
- extends: .custom_runner_template
- needs: []
- stage: build
- tags:
- - ubuntu_24.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-tcg
-   || { cat config.log meson-logs/meson-log.txt; exit 1; }
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check
+  extends: .ubuntu_s390x_template
+  needs: []
+  variables:
+    CONFIGURE_ARGS: --disable-tcg
+    MAKE_CHECK_ARGS: check
+  allow_failure: true
-- 
2.47.3


