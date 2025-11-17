Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D858CCEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 11:56:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxq9-0000TT-01; Mon, 17 Nov 2025 06:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpf-0008S5-V5
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:44 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpX-0005kZ-VW
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:43 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4775638d819so23925465e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 03:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763380534; x=1763985334; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TkBjjycuEHq7s63eouJrlIMTBjvbHE+kUgoNjQOl88I=;
 b=tBVHRdKTZC5bb1y0bj9z/1+XbsyA1FvLksE4JFJiMVHdxcl8+JNZ6eZzBr8QYZp6O1
 LeQBcKSJ8ay/tbG4K6kbVqXVqzd0GG2TL7nFeReOweiC9NbHSW2BLFjdRR/AEY6SSncE
 a0/BDhv4pHxNKQ7Ec6O5hq/vReGxEnEkmJu96KCwdcZFHEZwodcRU45oy9xtx0ZIx7CK
 1wuLPI6Faq0u6RiHCOchInm4Ww/lLtzTvQ8surt7xWER94eKam7C8u0WdC4w2NgbSdwV
 2EDA2DumMMYo8scQNu26UhFMaELh7PyU7nIDFIxmb/FHMmeCZS5WjfPongbQRdan5ec8
 77IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380534; x=1763985334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TkBjjycuEHq7s63eouJrlIMTBjvbHE+kUgoNjQOl88I=;
 b=nR+Y08snUONvPwpQJHCWgkPF0kaxSPS/Mj/hBH8KDpj4Pw1R9Cm8kVAtfAiOEpi73h
 D4Qvpx5MWXYH9WPnY+UgPrsryV/sID62VpR6Cqdnu/znPC+CLQgkaHU/5Ao+4x2cO5Rz
 xApmRzgLa3GshTk4NHu4oRvzDZ8DrL95xDT3CVk4h+km9S5bc6mVa+Y6pBvZTznAVBPR
 6wJYETUhdP2BnLoGkQACRo/k9MAEhxVRDjodq2FToBPyXB5lu6Lr8Jcv5ffWHMfO33um
 UK+PoevN2DveCUrfYyAPUD3YYnHfjdi58DhsXbM/sG1RrS09d43pLTUpoRQ4/RhEdode
 30eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtwcg1O+VhpAw+StjdfEgHSwc5Qk0WiB+SYMD1gIw6iFbFTRNqd1R4yadkrB6w3QDeN3MNjZUzmw==@nongnu.org
X-Gm-Message-State: AOJu0Yxwc+dR5n4gTTBFvstwGEZ7YpkEEsrVSaeXdep6EXP94lXIFf8f
 sBQafUaOODRjs6576sODg+gZTqS6z13vJDa6zIQ+pJXoz9uu6iiA9q7rTLUjTzlabuA=
X-Gm-Gg: ASbGncvWbBJ/2q/fEfshLU/+K+FYvG4Pqoxj+M56doCmIcZqiDk78gbZwO0rp3be1Av
 I0aoTJ/+0YttbygJmGjWh14hcatKY3apaPmJieLhnNP7V7a+7hs/HeFYMkRhQiVuus9D7mXtnwb
 V5rbUAvMxByex1jAoLw5O4gbzhYyyJrtuyntDf4g4jO8sXOCww4b7qu6MMtNCJabDGRsCAjbK3R
 u5Pxih6VmhJjhXy/D7CWO+c/qzy3xuZJC3Fs8NlNaDuP6eZCwd35t51AtdjApECyJC9H0KN6pS1
 BQgRWObBcn5dubXS1p3GLYlxmutkc6cdqJqCo9KjbgDeBixg2fFuHZl/VwtinDBWuOupeO0l+De
 jRCKzzTMCeOz4m1ov3qBSnqXgHEgWyHw3RyYKPUBqd1Y/ezgWOomTJal2c4HcuRbSzo3soxtFMU
 3L
X-Google-Smtp-Source: AGHT+IEkU+aIogpO7d9dF5Xsyays0qnG9yDmKpr2QhbmQCEdeMh5d7DXHaxMTwqHSCTkFXZnvC43AQ==
X-Received: by 2002:a05:600c:c177:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-4778fe683d6mr105748855e9.13.1763380534468; 
 Mon, 17 Nov 2025 03:55:34 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e2bcf9sm305417615e9.3.2025.11.17.03.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:55:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C01065FC43;
 Mon, 17 Nov 2025 11:55:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 15/18] gitlab: suppress custom runners being triggered by
 schedule
Date: Mon, 17 Nov 2025 11:55:20 +0000
Message-ID: <20251117115523.3993105-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117115523.3993105-1-alex.bennee@linaro.org>
References: <20251117115523.3993105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Otherwise the mere presence of the RUNNER env vars is enough to
trigger the jobs.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20251113102525.1255370-16-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners/debian-13-ppc64le.yml    | 2 +-
 .gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml | 2 +-
 .gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml b/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
index e088c3b67b7..40b1f408f90 100644
--- a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
+++ b/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
@@ -11,7 +11,7 @@
     - ppc64le
   rules:
     - if: '$CI_PROJECT_NAMESPACE == $QEMU_CI_UPSTREAM && $CI_COMMIT_BRANCH =~ /^staging/'
-    - if: "$PPC64LE_RUNNER_AVAILABLE"
+    - if: '$PPC64LE_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule"'
   before_script:
     - source scripts/ci/gitlab-ci-section
     - section_start setup "Pre-script setup"
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
index 6f950baee0d..c8adb8171c0 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
@@ -11,7 +11,7 @@
     - aarch64
   rules:
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-    - if: "$AARCH64_RUNNER_AVAILABLE"
+    - if: '$AARCH64_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule"'
   before_script:
     - source scripts/ci/gitlab-ci-section
     - section_start setup "Pre-script setup"
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
index 2fc940e127c..fb093d05b5d 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
@@ -11,7 +11,7 @@
     - s390x
   rules:
     - if: '$CI_PROJECT_NAMESPACE == $QEMU_CI_UPSTREAM && $CI_COMMIT_BRANCH =~ /^staging/'
-    - if: "$S390X_RUNNER_AVAILABLE"
+    - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule"'
   before_script:
     - source scripts/ci/gitlab-ci-section
     - section_start setup "Pre-script setup"
-- 
2.47.3


