Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87BDCD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:07:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYup-0003x4-9x; Fri, 19 Jun 2026 09:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYun-0003uq-In
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:45 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYuk-0003PD-0M
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:45 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c07a6527453so239836166b.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874340; x=1782479140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SE+r4wGFd7f55RWtkYqXbt9/MkUiYQSeM/Vm+Litt3k=;
 b=NpNxy9in3sEultNtVNsnxkYIhnoxAyCUM3Z7k1EyyNUzfuh3pbakoca+0b+smB+Pwh
 mfmOPEd/myxbmQfm7Jljw5QftLNqjJ2/IhJgikefcTc7LbXCQiGMfurXh8FIjZamflmK
 O8lK8rWOHyxh97t0ogXyOBNMleezN8pBJEDEyHwfBT/nqFmuyveJAyiJyXTyd2YhT0/7
 DlLGQAVpPODWd2L/j2cN3KJ+I/rWh6cty04HXIYvQtgct5f6Rmeb+PX8he2tMYxPCoKL
 p4pCzNQYZrO7PPWpg2Z7ZOUf+9aAGIOOjwLTAC8+1emNHv2Xc2kdpBuhlYq+qnKFApKu
 6QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874340; x=1782479140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SE+r4wGFd7f55RWtkYqXbt9/MkUiYQSeM/Vm+Litt3k=;
 b=hNGOE6p6B2NOBrEapa5ra8JlAZdb9iTQX4PBC+qHx34F1VZyk9e9K6E8YGUiYq2srn
 YUHlEESTINL4fDimnW5+53mf7syZPc7hPJ8a+aR1M30+GZ1ru4iQ/kKqooc9Md2ue4VO
 RTaim3vs1wApH2NznsBHAxoBYmvW9BLoxA3w9W4WYMkAfnhgCrNA+oBG4hlLky+lMeKp
 z9pn8/L58HBijc4/drI27IETMVehPO09RhVMxSe3xlYxjFmy9/+WRhdDSCgQ6fPijRwY
 eiE1bF69Pmkf5ih3vW/plQhH1k6HavVQhfrhEeBmcB3KWGRogPMmKNgE4d04NRfExUaV
 S7ng==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yavf12gseC4kB/1X7/Ssd0f+pJaYXc9gOlmxHcdWoCapWVxH/b8wbRw0qNs6XieB75Vg/CUG5gA==@nongnu.org
X-Gm-Message-State: AOJu0Yzrr9kRhfunBDwDb0hig22oiXjyTuUoab8pijMcjceEEkcySvNG
 JcOLiGuc9l8fMdhLAg0NU4/TrLDhB5hzKbOR2ze8Ml5bwNed/qlDpKcI5LpnGFL5Tsc=
X-Gm-Gg: AfdE7cktxBDSI/vLUfAoXH/+lLJDk22shGJ8p0Hmpe8ZYDwF1b9MZgel2HER6Xsvwuq
 J4RIyN7bxEs/ckZH5xteXVtg9/t9SBHEPBARmkxPZLJawj7DnsXzXl4zlPYO4jYKxZ2R0wNFJOy
 41CZTGP2DCJrwxCAhbsydkbX4lo0GLGfKd82g4s6gyVQx3YVkSR3cR/MoiJrh2M+4PN8gN6IA7T
 wwd1Wnfsyh0jjQ+LnjCFZz+x5yty9Ve5lHVFB0QhtNlU96Wf+b7cn0iKxPZ6ZOdGc0mdS17GQSR
 EJydk8ErKHLPxKZEXWm8kLOtSdEHNuKQAdkxCrae4LOaPWoyNmYUR0akA6GL3nAy7NqHbC421fH
 9/BXVvpLDfV3Kh4utOTOZoI9YgXfhKfec1sCTALyCuzsl0nmqOxGukQf1ZzaG2d2/FXsyEJTcI0
 NLbhro/P2HmxZtAntMn/g6l7w=
X-Received: by 2002:a17:907:94c2:b0:c05:84b7:550d with SMTP id
 a640c23a62f3a-c097ceba8f0mr182145466b.43.1781874340116; 
 Fri, 19 Jun 2026 06:05:40 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650b67a253sm8064924f8f.23.2026.06.19.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A1FC85F94E;
 Fri, 19 Jun 2026 14:05:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kane Chen <kane_chen@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v8 4/7] target/arm: ensure we create the wxft_timer for all
 modes
Date: Fri, 19 Jun 2026 14:05:33 +0100
Message-ID: <20260619130537.820184-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619130537.820184-1-alex.bennee@linaro.org>
References: <20260619130537.820184-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

We don't want to just use it for timeouts as we will calculate which
will comes first. Remove the wxft feature test in favour of the
broader architecture checks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v8
  - new commit
---
 target/arm/cpu.h | 2 +-
 target/arm/cpu.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 31a5567c951..8aa7437a397 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -966,7 +966,7 @@ struct ArchCPU {
      * pmu_op_finish() - it does not need other handling during migration
      */
     QEMUTimer *pmu_timer;
-    /* Timer used for WFxT timeouts */
+    /* Timer used for WFxT timeouts OR event stream events */
     QEMUTimer *wfxt_timer;
 
     /* GPIO outputs for generic timer */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 597e0626e7f..61945b6e6cc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2269,7 +2269,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (tcg_enabled() && cpu_isar_feature(aa64_wfxt, cpu)) {
+    /*
+     * We use the wfxt_timer for timeouts and event stream so we
+     * enable from V6K up. There is no event stream on M-profile.
+     */
+    if (tcg_enabled() &&
+        (arm_feature(env, ARM_FEATURE_V6K) ||
+         arm_feature(env, ARM_FEATURE_V7) ||
+         arm_feature(env, ARM_FEATURE_V8))) {
         cpu->wfxt_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                        arm_wfxt_timer_cb, cpu);
     }
-- 
2.47.3


