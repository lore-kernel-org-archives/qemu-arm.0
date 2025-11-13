Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BCECD5BB8
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 10:28:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJUWX-0008De-Q0; Thu, 13 Nov 2025 05:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWT-00082g-R6
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:49 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWJ-0007Lr-Bc
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:49 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso123971166b.3
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763029538; x=1763634338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZJjQ8xbtyy50brabWvBBfeBEDXh6eM2B5I6bn9S5Wg=;
 b=IeucfDuNJW54IszDIf5E7o46zvbzQGVU3qdxt3vpwUpyZ3bCtkt/7L8+WV6tJOifhQ
 XzxRY334UR9z4qxyoTs0B6LMRmqH94umzzqtKZhy2XA2BapJSF3I7161WVaZsFtuy6Od
 I3VID757sq2HkuAkIWVoqS2agH704T2r5ne3hOz879EOoLTdv3bEXbUp8upL4gkepDe9
 0pRz3NQc7GNdciDHIAzUUJ3IRhUCLKlzLCyG+YFv3QJml6cWW/WR7PxD7eSzEjiLwpNy
 ZaEH79DIWZFN86Qj74S8Jd7Dn7fnaOVGkvTiZUIdyiO8jl/vtZNieiBgxGGJDP32IhtI
 izyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763029538; x=1763634338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YZJjQ8xbtyy50brabWvBBfeBEDXh6eM2B5I6bn9S5Wg=;
 b=SKTuudsJLyeVagULC6DKyvuxysUgjPdYsJx6fzhivbENTPyreBPf7AMRaZ6K+rJrWO
 35jflHW7TNKpFPvistKxKZR/V/SnnB+/Q5ljpefaa02fsoJQP63+SKTUIQ3LP+q01jn/
 yqo3FyUpPWRGbBr/+7bgD8hYx/aAHh8y5BYXbW8Ub5ptdjlutU7WVCp52i2M1r2vLwyU
 iCQ09DJxGQU8zAy85S1tqOY8rZx7klwf353WgRu8p/Bx0cg4rf5uRZRoW2FpY8BbhXu2
 oAIYGL2BSTiboMvm6KT8kNyI14mHtwIVLMoApQvlKxiRuJtl2vtdTE4oK1G9x0kR4TOp
 X0dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe0Bd+EQXtMJW0SEnKv3XiBs0R554XTAsws4GzORpDf2NrG05BLZfJhZnTDiNwPiPWEMxK/3CucA==@nongnu.org
X-Gm-Message-State: AOJu0YwcVWldbQLgI6SMddN/ie6GEBIGezUYm+r+7mSvSPHg8rK6AVRa
 ne29dV2gXIzgcIy1WoeJChA8lPgY0PskxL5MhK50JOxt2dRU0A4b3+GxnaXEztGMuuo=
X-Gm-Gg: ASbGncsmYFNYaRLn0E6UkfIKNVa/JsWy46IRPyBWjY363t+oYA1PwgM19PvkH5zKC76
 C6ahiyv0JNlNd5DdfDLIX/rNwJIcnAVXLeEtJAGTqaOjSnEg4rv/kTEHX7qAbLspR7LSWGOs6p5
 JuUU2D/EFYUhbl57XNDz2bf4lgBKjNPWOcs3RqrcT6kzTVf512tqnviBo6gFmuPfrGeHh3Y0r8O
 VDidDkUPlibsPb6QGmWSiyMpDswhWH9yP/eTJqV8z9LALm6BV++oCC/UzN4mNtzzpnQYoYE6ppO
 V9BA3GGEm7AdROTfEMk0heMtq+Yp/sIOHXogYWJhfP9crF34tYvufp8VveL1dcTiDmdyC78dM24
 iSl3fXuI17SbmlynZWQLdJ3RM61muz1xaQq6FmVHQDRM3FLJ1y30lUhG7ScgpIcdThKpQfyJcIB
 xa
X-Google-Smtp-Source: AGHT+IGzT6EMAq3RcMozh/Tmgzv1nA0h12tlMj0OoeFD1ZGMXCJhNOnkglbF51sCv2Cak8S438NGbg==
X-Received: by 2002:a17:907:1c25:b0:b73:278a:a49c with SMTP id
 a640c23a62f3a-b7331960ca8mr631363666b.2.1763029537293; 
 Thu, 13 Nov 2025 02:25:37 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad41f1sm135518666b.23.2025.11.13.02.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:25:35 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3EA415F7DF;
 Thu, 13 Nov 2025 10:25:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 David Woodhouse <dwmw2@infradead.org>, Ed Maste <emaste@freebsd.org>
Subject: [PATCH v2 13/18] gitlab: use template for ubuntu-24.04-s390x jobs
Date: Thu, 13 Nov 2025 10:25:19 +0000
Message-ID: <20251113102525.1255370-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113102525.1255370-1-alex.bennee@linaro.org>
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

Most of the test is pure boilerplate so to save ourselves from
repetition move all the main bits into a minimal copy of
native_build_job_template but without the caching.

We keep all the current allow_fail, manual and configure setups but do
take the opportunity to replace the inline nproc calls to using a
common JOBS variable.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - keep when: manual on the relevant jobs
---
 .../custom-runners/ubuntu-24.04-s390x.yml     | 185 +++++++-----------
 1 file changed, 70 insertions(+), 115 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
index 45dbee17880..32e12188873 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
@@ -2,129 +2,84 @@
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
+  when: manual
 
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
+  when: manual
 
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
+  when: manual
 
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
+  when: manual
-- 
2.47.3


