Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74962C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:13:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwSE-00062O-Rx; Sun, 27 Jul 2025 04:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPq-0004SP-Qs
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPo-0004uf-G8
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2349f096605so41202975ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603647; x=1754208447; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WR7r+Hh17fQ0ME4q6Jovo/isLIn3L83iyAvcPtqKwiQ=;
 b=UTCbTJMOr6KISlFIU4i4RWufSMuLgT7hR7VyotV0lSV1ygvAokyAWKOv678JdUfpPl
 5qU/tuXGjIfyXkqwQmje7gyf3DhAo/ylwKipf+zTdRv78ASMZmvASHO7uVppVlmBd/rQ
 z1bNPvy50n5rdA9x87taXmkpWjkM7pgcu/kDrRVM7B3oz0ihzrhNAFk/jL8nw61vnAxi
 ksFaE/65wr9iYFHFEgtRP2fDHPhQbc7OdetIuhQlhXgCVF/KGDv0TB1vS0MH1vs/9jPh
 kGSQdGsB8Wfb9Wj+Kgt9NVA+8Ec0DbJ5p7+DSWcRFD2mdL1vgBYwFVmwIjhYPglcEIFm
 VfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603647; x=1754208447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WR7r+Hh17fQ0ME4q6Jovo/isLIn3L83iyAvcPtqKwiQ=;
 b=iZqmjulyYjCsqbjJ4/3fqLXldKxp2u/c9o7Exm9D1vk9vdOt98DPNYrvAEC2LB53ZO
 15wXSIZnPU3ngqnqqSgA87AY7QkDA/Ied4XOIQlGSXtP/mxKPME4wFCtigTjRSiZ1qfz
 vz/g+4vLAtfx/OM2bUIIHKsPmBbQuDqaUlvMXWd94z0bGUgjcPB7GGenMQoAd2YIpgLs
 aKqEsMDwDN4ycOc3OEC3EI/+rxOPs0PFPKkPt3E7Cyl9hfjKN4xxTABddvGwOCdRr3Kk
 ENgDd6B57f4dBud0M74hDa4qozsqs/l63W8iAIQEyCI6btnpaHTbQlGL5Wyv9vZs5DvR
 eK0w==
X-Gm-Message-State: AOJu0YzRfwWrjrspNlk8EufW/q0QYbF5c/qrWkYQbKfFVK7OOGKMIbN3
 Ggs5vR8X+lQtKgJ+sGSnskXTdOmn4i5tCGGAJJi39uY4MGA7rW424odSqe/5bZAaTB0=
X-Gm-Gg: ASbGncum+ttq2ICQ+h5MpUlW7yP9HoYhiB8Ux9I/MaW6GmCMNoUrhtVm/xNTCKcmQBA
 wbZOXeIExXG1Gpj9TIHwJfbSVk3Br5mE54Fmwb2RjP//Jhf9fHmCcpjTavNnc9XBrRBX4GVDDdo
 Ptwhk9fhz89CpMl+gj3utxgJtDMoFUkHYk3KEbhyz7Hvzd0mhvKg9phF64xYHOCqjTkskXuF4Uf
 meZv217t2OIjuM8hRJ90o7liglcQvT0K9znrWZePliUvw/Ud418KemjRxaMHhfD8pbYaG3CIrBR
 laAh4ld/+9eUnODAX9GDNlJ3FXtQgiSrL+k2kwFoLTDPGom6gEc+iNzeceqvlZE6LC21TefVzwM
 Y16IciISFLsP2i8kmWxs3piwm+SfOzJVm3hufPx/AUdR4Nf1aHNIkWSK32xzWbnnT/rbC8T63rZ
 JDU0rhPmfQgg==
X-Google-Smtp-Source: AGHT+IH72wYXaufke0LU8TNswAbPJxGaBVoBKpbQ5s40qTUYYqEXcaFdM9cXKUSB3NrSFVmh/0HLkQ==
X-Received: by 2002:a17:903:f87:b0:237:e818:30f2 with SMTP id
 d9443c01a7336-23fb31e4605mr129353225ad.50.1753603646977; 
 Sun, 27 Jul 2025 01:07:26 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 75/82] target/arm: Enable GCSPR_EL0 for read in user-mode
Date: Sat, 26 Jul 2025 22:02:47 -1000
Message-ID: <20250727080254.83840-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ec63297165..284d1870ec 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -317,6 +317,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->cp15.mdscr_el1 |= 1 << 12;
         /* Enable FEAT_MOPS */
         env->cp15.sctlr_el[1] |= SCTLR_MSCEN;
+        /* For Linux, GCSPR_EL0 is always readable. */
+        if (cpu_isar_feature(aa64_gcs, cpu)) {
+            env->cp15.gcscr_el[0] = GCSCRE0_NTR;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.43.0


