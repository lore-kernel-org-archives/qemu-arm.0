Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD20BCCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:12:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jJx-0004ZR-UO; Fri, 03 Oct 2025 13:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIa-0002jE-CK
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:29 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGq-0006LB-7d
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:27 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b553412a19bso1837067a12.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511315; x=1760116115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Udj6PKMWss3gAj/aDsAeuXVpPjUstV9aXJRzk0zFyVA=;
 b=OMDfDVBKkGjCEgLZh7ELf01ZRok9qZfkXbEaSJ3RrFzPGgS3+HeoAcBbM858oXEdwn
 SUlu/MIng8I7P6nP3S+FbxQ9sPRgG2iOLXnFzMxExTUbO/uXdQGdIL3CjlKgtkAIVsfM
 FyOD3ElU8NojT5Z+oJX9//0WlhXBeHrGF/MJJo/X1qRiNT/JlpeOYWLQODeh6uYKuWZ+
 qVtfl7Umih6PJiFJbAEWMwd1nJ+bDSZgZ46/cRme872StC2o6+2m752QXWjRQC4N9PHw
 NPiyolKiaM8Kiha3y7UkjdqCxK13eiuP3GddFKyROFScQlRYL+AvmSxxkxQX+0XAebOi
 C/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511315; x=1760116115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Udj6PKMWss3gAj/aDsAeuXVpPjUstV9aXJRzk0zFyVA=;
 b=SWNqEzoamDFxCTC2fTKaZu2Gh2hiPSRlgt1T9n1liZrjOrc0cKxBdWplUReulvb3C2
 p6pLRAH5V20Q3s2o9w5iV3Y2tFzzgydHfGq1vTQ0hoV5hRWOjP9+Wl+7TxxPDiKmK8xW
 WxuKEQGFX9boTD3zIoy0i2/HI3ojbyzolJJS56Y9m0sNMAdiWNzBiOwxKOEBjGa546EI
 M+Vbp8qe92aVqu5vpat6hoH8fjcwczhE3qjVvA3ttrdXWHNqg9k/ShNUaPqSQIU0yaJl
 3h045Zc6ETRPPzkhqaY5VuyCHNFLdefob0CJfpXXmjsHPkXsFLUzbA0D4G2yqPmiPYQV
 beKQ==
X-Gm-Message-State: AOJu0YxI4Y2WfYSVlHfkITt5c7HNx+KYNb77gRWvGjLnXvYE6I/ZTYEz
 l1J3nWHBwVPiUizYXysyA86WidtSLzW4kbsd8AC2YuCnoTdmeE3oQ4Q49IaycrEU4vo=
X-Gm-Gg: ASbGncvruy+lTN3/Oio4f7rM4D3L7+7a76wH1PGgbJH/81ZiDcrfVz1PGi1r0cnbojV
 mMJ/lmf+MigvvqtatV10xUOzghk2OV18/+UMtJIsI9Ta/ctubPdJlXHJ193O7XQQBLBErEXXMJq
 N3Y6105D+XjYTPbWNbRqGAfJkxT5qobHJ0g+l0OleJSOFxM29eFIxqjjqd39aWi0yeJlT4uPpaq
 0rtvOC5tVNV5UsT3NMqiIndKRtjiv5mJVqbn+pYlBoULJhCxmxbLlIqLT6yF57VwDDQ3rqKqiUz
 o6JFJHdUiBD0zoOVg3xG2RKObMi2QvIGapP2C9LoP+zwQgAW8E8QbXz7B1Vkr1UjDGqr3Ng55SZ
 M8piOJKeA8J/rn54t/oZ5Jg3IA07dqup1OuU0aSj7NO+mp6+88BJHk1My
X-Google-Smtp-Source: AGHT+IHh+H6EHwbEgaDfxeRjMYrAkc+apM7slvgcMy5DvKqCdkZMBkryth9/MUiOJFWaCXBdP6hXHQ==
X-Received: by 2002:a17:902:e883:b0:24e:81d2:cfda with SMTP id
 d9443c01a7336-28e9a3068d5mr41436235ad.0.1759511314860; 
 Fri, 03 Oct 2025 10:08:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 38/73] target/arm: Add arm_hcr_el2_nvx_eff
Date: Fri,  3 Oct 2025 10:07:25 -0700
Message-ID: <20251003170800.997167-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Implement the pseudocode function EffectiveHCR_EL2_NVx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1f9042c7ef..5adb8bb33a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2229,6 +2229,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  */
 uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, ARMSecuritySpace space);
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
+uint64_t arm_hcr_el2_nvx_eff(CPUARMState *env);
 uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ffb6ab63ed..4d66143f46 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3903,6 +3903,16 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return arm_hcr_el2_eff_secstate(env, arm_security_space_below_el3(env));
 }
 
+uint64_t arm_hcr_el2_nvx_eff(CPUARMState *env)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+
+    if (!(hcr & HCR_NV)) {
+        return 0; /* CONSTRAINED UNPREDICTABLE wrt NV1 */
+    }
+    return hcr & (HCR_NV2 | HCR_NV1 | HCR_NV);
+}
+
 /*
  * Corresponds to ARM pseudocode function ELIsInHost().
  */
-- 
2.43.0


