Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E07CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 11:57:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxqB-0000bk-HA; Mon, 17 Nov 2025 06:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxph-0008UW-Dh
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpY-0005kz-Ky
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso10304935e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763380535; x=1763985335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3pYOtdKaKrPFAimEhy7V/pG75wSc1pOZKlDkYM18UA=;
 b=DWrMEYiI2Cqjuo//ipbbHbNlp5vCewXxCxYnWp/BdpeNFLNdXFHhGLY/zCNojyR0nu
 laM0xwFv58fo8xSbiNhHgkl+/NN6WkB4JZ6VJyfG7opV2KdGSl9wtyEk6bpYTbW7X/WE
 ilIMG5JJMOBMgfW/RIfBbbpirhKf0Pxht64kUCo5zpHBhL4eE5Mos4ypalqnXt20bodO
 rmtzxzSeBnpua0n+zn3j1SO2yrtA4m6ZTcDAgE4VnxnWac5DavfPCqx70bcZvbfld15G
 bVpbr0Qe0/OwpYevJx3FaJodnv+Dz979O1RW7rHA4SsKynj/g6X0skIkKF/dh6c0ZP27
 4HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380535; x=1763985335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a3pYOtdKaKrPFAimEhy7V/pG75wSc1pOZKlDkYM18UA=;
 b=AryJiphaHTLLpcpbotfjF7bBn/wtppFIuvExZClxZhi2+eBLaafwGrt8FAQucyxqmD
 v+3CbZT6NTfrizmvgV9tPfbmWeSF4As/U58nIKgWZs+Bytwfs+ul7ueUJlxAcgwfuBtZ
 3UOONVzji8nBxjxlQmDfVFS6a4+nVNd2xaxU380MXEx9eSjVHyG4S0Za8O000dTIEHGa
 XQ9sKQRweDnPu9dOj3XHj/2FdrXzJtt09ko+k9PFgkKuh4I1QiiUj+yO4YsuFYR3XVxz
 tr06ssbXO2yIRL2j5OqzbOM88C/OYRrvfsjcbC3Zoxq1i2r75G58+uDHFzMuadLQgg1d
 Rhwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX9o4FYM+N70pAzE6dEiP5kHs454vnnCoEVnwG3toUhBuQRlchcB/+Bp10MiSdsYbL43cuzfDjDA==@nongnu.org
X-Gm-Message-State: AOJu0YxtFuwvhiveAcnMn3i+SL+YuMZsp0CKKk2vsPBM3Byke2ubSsQA
 UDj/E0u3vzYSpUsrtqbpFGN6D/aP0Sa4HdZpMCRKnacno2B3d6KX2YdGvLrAQt1bNvA=
X-Gm-Gg: ASbGncvNv8sbmPVQsdJs4eDZZLH/lp/T5vQW979fnqIWCefvoNs0WIRoQTIP68WIng/
 LaYxuvljF+KYdCdIHrh9IjIn89m9KEc1FgB+q0Tf/sC+8P8xPoRe3634NlUsTwbHDJIowHtALr7
 J9gl49RyYMhTPK8v/Psd9PF2rKGJHlRLtOBhlcgLtEFFmlEjAjAjrM8drAYf9Kg0t8XpqQxQobY
 qhKO2qWsUIwlXzqH0PHZ1RTYDKpunqNFbuj4zH9mPU7Bz/uhQvPbADZUAHqSqjJPjkovSOGDZuw
 wKEeUmhM9HA3OObF+XctZC7lvCaePSCfdiiGhYv8fpd330+enCFTjXIZjMKm+C+C73FpNohrmGd
 DJGDABDRb0U+nVeFsCAN9v1BQe320UkUywcZHG6a/RcvYegvCNzqe1Rw3pdDWgV12qxcF/6tUn+
 v7sSkfzJdKYrE=
X-Google-Smtp-Source: AGHT+IFPObyP1qmpRlhPFrxbPUmQg/Oim+PDvtVpSsLBwtGhbLuMJlchGncd+fVtMm/dNjRns8Oy8g==
X-Received: by 2002:a05:600c:5598:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-477a71cd913mr8930675e9.11.1763380535056; 
 Mon, 17 Nov 2025 03:55:35 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e35b7esm311851085e9.4.2025.11.17.03.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:55:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D9E51609CA;
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
 Zhao Liu <zhao1.liu@intel.com>, qemu-s390x@nongnu.org
Subject: [PATCH v3 16/18] gitlab: make custom runners need QEMU_CI to run
Date: Mon, 17 Nov 2025 11:55:21 +0000
Message-ID: <20251117115523.3993105-17-alex.bennee@linaro.org>
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

In addition to not being triggered by schedule we should follow the
same rules about QEMU_CI. One day we may figure out how to fold the
custom runner rules into the .base_job_template but today is not that
day.

Message-ID: <20251113102525.1255370-17-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - re-jigged to ensure staging still runs
---
 .gitlab-ci.d/custom-runners/debian-13-ppc64le.yml    | 4 ++++
 .gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml | 4 ++++
 .gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml   | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml b/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
index 40b1f408f90..23b188dc72b 100644
--- a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
+++ b/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
@@ -11,6 +11,10 @@
     - ppc64le
   rules:
     - if: '$CI_PROJECT_NAMESPACE == $QEMU_CI_UPSTREAM && $CI_COMMIT_BRANCH =~ /^staging/'
+    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != $QEMU_CI_UPSTREAM'
+      when: never
+    - if: '$PPC64LE_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule" && $QEMU_CI == "1"'
+      when: manual
     - if: '$PPC64LE_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule"'
   before_script:
     - source scripts/ci/gitlab-ci-section
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
index c8adb8171c0..98d99193457 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
@@ -11,6 +11,10 @@
     - aarch64
   rules:
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != $QEMU_CI_UPSTREAM'
+      when: never
+    - if: '$AARCH64_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule" && $QEMU_CI == "1"'
+      when: manual
     - if: '$AARCH64_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule"'
   before_script:
     - source scripts/ci/gitlab-ci-section
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
index fb093d05b5d..efa8252d948 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
@@ -11,6 +11,10 @@
     - s390x
   rules:
     - if: '$CI_PROJECT_NAMESPACE == $QEMU_CI_UPSTREAM && $CI_COMMIT_BRANCH =~ /^staging/'
+    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != $QEMU_CI_UPSTREAM'
+      when: never
+    - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule" && $QEMU_CI == "1"'
+      when: manual
     - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule"'
   before_script:
     - source scripts/ci/gitlab-ci-section
-- 
2.47.3


