Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8121FCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:12:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v40Lg-00081U-CO; Wed, 01 Oct 2025 13:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40Ld-00080L-Je
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:38 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40L5-00035b-2C
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ee12332f3dso38552f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759338594; x=1759943394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9q3z/1wqcIz8qlpnprlD0QnXnU/UnVBlzWb9HVJGW4U=;
 b=DbgCg/lfd+B9iBtOFNGg3bwIKTcYLG7bQ+86TDRXJQYRoFGWd/VNtByQ0aHBMZj4U5
 F5Uw7eKXYDEWplVPHKIydopeGShaLMZMqafn3jVPEd7fy3XizVQCc7iKcQRclAR/45W7
 pTYEot3FU5No+RMSzn5P2H6M3mNlYRnaKRhJkGRuMCcLN18eQJ3OcTRmiL8OjT9LSiuZ
 ViK2jDTiUtw+5ScuGqa1JXCxFRWa4ZHbHI+TPKkmXmw1AdiPQjD32E8rtJyrk95nUbyV
 kFlDfSZXw+ruSh9XyxnEX8Q+jQlNXjbyKePQpJavzv0KDeSeg6AhiBZeyI8iq1LOhIbB
 07Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759338594; x=1759943394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9q3z/1wqcIz8qlpnprlD0QnXnU/UnVBlzWb9HVJGW4U=;
 b=ArkFPjx4JN2AzsheKlPRsz7z1LQrOqArQD68PsE9O0qnptRusvozp7/I8YdQrpgprW
 7qhFtjQizcNYakgJPYLVxpFsq3xOSxzpNk9f8v8Q8WhUbmMHQDG0HSGcTT/y/X6D+Pop
 vUNHeqU5JHpgsWTVyGPykvfXi74tiBiTP68m/UQh+p4CoqHLn6nalthk2+tImW+Unqpm
 pyLo90yMlwrzmPptN6hyTV/v/Wdb7ZaWo4wcjovvaXwXkY9C1P5L++5fIoQ37Bbz3d0O
 MsCTgYcYpsI64vGf2ije71wsuL6lNzcq+VdJ9UWRliRTcsu1JwbsSptttOA5cphu4WYI
 +XpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ4DX/Dw2qAHoMSeYWZ5o0VF7RTRzjUX1JF+mRiArNDQeQqqlr5E+JtQuTSH3tjY4Bn97VmJeP6Q==@nongnu.org
X-Gm-Message-State: AOJu0YxY7Rw3TwuozDB9e0kveYWpLpqczWBYg4YRnAHZ+WsfTjd1XEhN
 Cpz/FxvV4Iv2h3HscnPhzjjBFqxRTCo/r72y3Ud3/rUc2KKLb4kI0FrGqtFiV9niggc=
X-Gm-Gg: ASbGncvY+/XFpTnjpWRTkiADBO0WahK+g+jfAk6PR25aHqp+dAeQgpTRJVzgJYf5aKM
 gOLZVFeFpG0dyyhj24rSCV/pQz9T1LteV2Jg7rukgS2dj9FjRhoWc/fJXa+fRLehAj5ib4A0JY5
 mel4rcCBEe0X4WinA4dfXpc7arLxce0ts1LloQyE58nEBx6a+9qg3tYa86uTNOfgLyZ+smN2Irn
 +vH89kg7b5P5rOo3ZycxwIiJDmabO+q6sBZ8T8MMgrGBIcCnZwGYsfNMMqE8ey+ysJrIVzKdrZ8
 jkwgPJ+GWvUdLAGdcpLuav9U7Yz0OQtxQ2CmTbyTkuxFpjqRyEYMCfoeMcS+Gx0hDWrHb3hJ17v
 lFv6Di7sByLGGIGT19k8w6OntpNH4cjQZvMtGwCQZCYuBUd0=
X-Google-Smtp-Source: AGHT+IFe0HdfqdQAnYRLclHF/PZ2hF50bPesVb2o8adK2+9Jo33HnGweb4WBoXCaEfXqndKW1vRTvQ==
X-Received: by 2002:a05:6000:4007:b0:400:4507:474 with SMTP id
 ffacd0b85a97d-425577f3872mr2848055f8f.18.1759338593859; 
 Wed, 01 Oct 2025 10:09:53 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6921b7dsm27575851f8f.42.2025.10.01.10.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 10:09:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 139CC5F841;
 Wed, 01 Oct 2025 18:09:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/7] gitlab: move custom runners to Ubuntu 24.04
Date: Wed,  1 Oct 2025 18:09:46 +0100
Message-ID: <20251001170947.2769296-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001170947.2769296-1-alex.bennee@linaro.org>
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml               |  6 ++--
 ...4-aarch32.yml => ubuntu-24.04-aarch32.yml} |  8 ++---
 ...4-aarch64.yml => ubuntu-24.04-aarch64.yml} | 32 +++++++++----------
 ...22.04-s390x.yml => ubuntu-24.04-s390x.yml} | 28 ++++++++--------
 4 files changed, 37 insertions(+), 37 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch32.yml => ubuntu-24.04-aarch32.yml} (78%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch64.yml => ubuntu-24.04-aarch64.yml} (89%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-s390x.yml => ubuntu-24.04-s390x.yml} (88%)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 2d493f70f7a..3eb8216d571 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -29,6 +29,6 @@
       junit: build/meson-logs/*.junit.xml
 
 include:
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml'
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml'
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml
similarity index 78%
rename from .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml
index 8727687e2b4..75029c9187e 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml
@@ -1,13 +1,13 @@
-# All ubuntu-22.04 jobs should run successfully in an environment
+# All ubuntu-24.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/ubuntu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 22.04"
+# "Install basic packages to build QEMU on Ubuntu 24.04"
 
-ubuntu-22.04-aarch32-all:
+ubuntu-24.04-aarch32-all:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch32
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
similarity index 89%
rename from .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
index ca2f1404710..d26c7827f45 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
@@ -1,13 +1,13 @@
-# All ubuntu-22.04 jobs should run successfully in an environment
+# All ubuntu-24.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/ubuntu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 22.04"
+# "Install basic packages to build QEMU on Ubuntu 24.04"
 
-ubuntu-22.04-aarch64-all-linux-static:
+ubuntu-24.04-aarch64-all-linux-static:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -23,12 +23,12 @@ ubuntu-22.04-aarch64-all-linux-static:
  - make check-tcg
  - make --output-sync -j`nproc --ignore=40` check
 
-ubuntu-22.04-aarch64-all:
+ubuntu-24.04-aarch64-all:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -45,12 +45,12 @@ ubuntu-22.04-aarch64-all:
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
 
-ubuntu-22.04-aarch64-without-defaults:
+ubuntu-24.04-aarch64-without-defaults:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -67,12 +67,12 @@ ubuntu-22.04-aarch64-without-defaults:
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
 
-ubuntu-22.04-aarch64-alldbg:
+ubuntu-24.04-aarch64-alldbg:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -86,12 +86,12 @@ ubuntu-22.04-aarch64-alldbg:
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
 
-ubuntu-22.04-aarch64-clang:
+ubuntu-24.04-aarch64-clang:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -108,11 +108,11 @@ ubuntu-22.04-aarch64-clang:
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
 
-ubuntu-22.04-aarch64-tci:
+ubuntu-24.04-aarch64-tci:
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -128,12 +128,12 @@ ubuntu-22.04-aarch64-tci:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
 
-ubuntu-22.04-aarch64-notcg:
+ubuntu-24.04-aarch64-notcg:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
similarity index 88%
rename from .gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
index e62ff1763fa..45dbee17880 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
@@ -1,13 +1,13 @@
-# All ubuntu-22.04 jobs should run successfully in an environment
+# All ubuntu-24.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/ubuntu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 22.04"
+# "Install basic packages to build QEMU on Ubuntu 24.04"
 
-ubuntu-22.04-s390x-all-linux:
+ubuntu-24.04-s390x-all-linux:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -21,12 +21,12 @@ ubuntu-22.04-s390x-all-linux:
  - make --output-sync check-tcg
  - make --output-sync -j`nproc` check
 
-ubuntu-22.04-s390x-all-system:
+ubuntu-24.04-s390x-all-system:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - s390x
  timeout: 75m
  rules:
@@ -42,12 +42,12 @@ ubuntu-22.04-s390x-all-system:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
 
-ubuntu-22.04-s390x-alldbg:
+ubuntu-24.04-s390x-alldbg:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -65,12 +65,12 @@ ubuntu-22.04-s390x-alldbg:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
 
-ubuntu-22.04-s390x-clang:
+ubuntu-24.04-s390x-clang:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -87,11 +87,11 @@ ubuntu-22.04-s390x-clang:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
 
-ubuntu-22.04-s390x-tci:
+ubuntu-24.04-s390x-tci:
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -107,12 +107,12 @@ ubuntu-22.04-s390x-tci:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
 
-ubuntu-22.04-s390x-notcg:
+ubuntu-24.04-s390x-notcg:
  extends: .custom_runner_template
  needs: []
  stage: build
  tags:
- - ubuntu_22.04
+ - ubuntu_24.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-- 
2.47.3


