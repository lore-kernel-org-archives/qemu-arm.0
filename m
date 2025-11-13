Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92417CD5BBC
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 10:29:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJUWZ-0008I3-PX; Thu, 13 Nov 2025 05:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWV-00085V-3c
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:51 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWJ-0007MI-Ja
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:50 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b735b89501fso15136966b.0
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763029538; x=1763634338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ookYlMgqelv1akkEQQg8dNQyfrcFRJWhuosml8n/iQE=;
 b=O1QOPGcAH39RFJfVQSbVnf4SB01xUIrFcIqmNSKdN4AsX2zgL22d04XJqKIo94vfzs
 enrSQqnMU4VCR4gMB140xfbLePOYq1G2yU0b1KHKPaGblmebFGfT+4T8WYZoQhsm+toT
 Sn52pnOODrsduK593eri7bqv2lo7I90jrrVbXKF3fHu4BsKrzRlYVrsejoC9VOm+ydhn
 d51OyfEqhWgenQhiJ6RgqBW4Kxx/Vlf2ecwiSkZ+QgGHYkJYvm+C7in+y1gfyzthGDS2
 Lvhwn/whodUoVN7i+f/c9Fc/qZLtR67CrQ3NQI1lXjdZpRGEu6hvTY3YkBxeIIqNVQid
 5UvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763029538; x=1763634338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ookYlMgqelv1akkEQQg8dNQyfrcFRJWhuosml8n/iQE=;
 b=U6XNppjubAqM7L9jyAfiWvEC2QOIXgQJzClmijPuX4QUKetpMoMc//9Pf/unmEJ28H
 P7OgdANQWVgWEZn+Z2mt5JyMJLca7fY0n4t9LQBnOgizFO87yUkH/pZrgYAGNIxOgegN
 /Wi8sFAstBQKFCXKCbm+Tfg2L9jyb6CwwrA7/wRFTXzgsVZMa1EY4yZ7i/4O+wgvC7Kg
 1RhLtsdEC9a1LJSmHz7dfy/uRgD9P0n4MbRHFLqP2T20eiq+1sjHYSaRUjxX3i6GnXsq
 rjxYcolRwG0rH8c3i5m0S1G4n1JT+jMM0RvWCaHTaze6wtYsXzkk0GP/evM+L4prx0Ea
 7dEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Z8DyqNjv92ocY9dzkHivVxL+j3xCFLYdQwQ5HuMhf8GOyHEhHWlxS1O29dR4KEgWNoVjdHXX6g==@nongnu.org
X-Gm-Message-State: AOJu0YxjAp4Lv2F6bg1bjHRoR7y22NowmT9NROb5gt0mJFxlp03yTu4E
 VXCZIMeLhpm/vXzsGKgul3R3jDoqNP8ke3tG8Y3t3O9eQEU9NxYGQrmD5QQ3s6Z2HvE=
X-Gm-Gg: ASbGncvIVv47ieX1VxFhl3vaJu+8O5XW17j3A5yAELllD6SzUIm4CZIFPr+tWs0JeTt
 ZampqMLmDCtKpyMDRnjEyoUZSKg1+uiwI+jq0VDcSjM4aMUMpbykACJ8MiqJeJYUSyS+V4hBW/V
 P2Eyf5f7xxwSZjPAB0ETJiKjPlEh5F5+Dr8pMKSPgVi7g+BAH6/MvmATnw7q3cKj8MN3dLVOVMt
 F+2O7TyucSQ7r8gkqqjbubtKn9f/Ka9uIAGbr9uv/B2U7O4dxoFl0UsrLVoM8mb5jySHzP1O6BZ
 wqPVCeDChELcU/lky/uerIyGI6PwBJ2mHiGoPJ1ucEaxXcIMko5C+80Fy6ypa44X197PAGOQwOu
 x/2vHhqBZYD4gMSfUJXJm31AnRXMw+UNddjqCC+qkR16pitAnQBOSPdCjWZr3XC03IIvxy+uAc/
 X5
X-Google-Smtp-Source: AGHT+IGN5rn3IkITx8pU1gBFIPR+aCxJh/HcSkRUTXui4DXx/wg0EFxNep2T6leo1ZgNotjn3qcj5A==
X-Received: by 2002:a17:906:730f:b0:b6d:5363:88a9 with SMTP id
 a640c23a62f3a-b733196865dmr595103066b.9.1763029537912; 
 Thu, 13 Nov 2025 02:25:37 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad43dfsm135287366b.20.2025.11.13.02.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:25:35 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7057A60DA8;
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
 David Woodhouse <dwmw2@infradead.org>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 15/18] gitlab: suppress custom runners being triggered by
 schedule
Date: Thu, 13 Nov 2025 10:25:21 +0000
Message-ID: <20251113102525.1255370-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113102525.1255370-1-alex.bennee@linaro.org>
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners/debian-13-ppc64le.yml    | 2 +-
 .gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml | 2 +-
 .gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml b/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
index 80706c7a956..6492d013de8 100644
--- a/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
+++ b/.gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
@@ -11,7 +11,7 @@
     - ppc64le
   rules:
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
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
index 32e12188873..fcb49ae884d 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-s390x.yml
@@ -11,7 +11,7 @@
     - s390x
   rules:
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-    - if: "$S390X_RUNNER_AVAILABLE"
+    - if: '$S390X_RUNNER_AVAILABLE && $CI_PIPELINE_SOURCE != "schedule"'
   before_script:
     - source scripts/ci/gitlab-ci-section
     - section_start setup "Pre-script setup"
-- 
2.47.3


