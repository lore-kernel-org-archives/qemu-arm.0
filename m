Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B7C56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 16:41:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws18K-0006nU-HR; Thu, 06 Aug 2026 12:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18G-0006ln-Hg
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18E-0000J9-L9
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso26484335ad.2
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786034385; x=1786639185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9souE4OOFgzb+Le50Q6/XxsF/ebUlnPUASrQPmUYzGw=;
 b=sEnv0sTeC+TZLuDyCa2wyeiKwYCsC4i5LqECfSgR4riWFJfHfBnRC+Se3B+milM4Dw
 pv0oDVGIbm3Plk1MVaSOMsqCq+YoV2G1c2dEDSo/kPVvAsf7iG56MK/vg1thbfITdgJw
 JYHglUEBd6pxiZF4yCUUkuAOnIqp9tfseglNVRu036ygcdEG5wgEJCxj+IOUEtbhNdjN
 a0YszB3gFGneF7wtQYuJoBXMVVHZvzDqfIUIVx3aj1frrQZF89/0q1MRr2gMbiMQJJKr
 yJ1xIepQZ7ouSb+nCwn58tOuhQ0vorNcw798co+Wkc3x95CZnlg4tslRDwn8f0XLFAWG
 MrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786034385; x=1786639185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9souE4OOFgzb+Le50Q6/XxsF/ebUlnPUASrQPmUYzGw=;
 b=Rkz//dX87oG8X1OhIRoUUH1aaa3cAQ3pezFiHaUaF/efZttaQYqd1O3GFogy3N1gJj
 lxZsf/v6cPxqASlmfWx+x03QBEjeGZikgcU1aXRhIYwXncAfFzp8l9zBxtKknAZ1LOgy
 M+jPGNfOSkGD2vxOR7JyZHuTra27LpkTHb59/Nua+k1C8p5q5V0S1lGJq3HQisu8zwRJ
 yG5A5s95z5y/rXM1GsOeuVXCcQ24P7GkLqx7v/cj5/oNKJSG4Ys84psVzu+JQNoiE52a
 sSNjfApCPyETs7Xh416Qr/APXaFB65rFK7qHZ/k8WqUqJI3pO6/gi9AD7L0cwFupc8aJ
 +beQ==
X-Gm-Message-State: AOJu0YyG72JxGTXg7qCXJMNYvgRl/OFY0F6S49Ewzbn5S0qZKEfFvLio
 j9rzopQiPqNxJtcRyS2Mng948zGxyG2KsP15b8DBzdgHJorkhVQn/Y6CPCt493jpC+tgK/YSwT3
 RatmH
X-Gm-Gg: AR+sD12MkndMt5O96eE9WYmydWcTn0OZB5bgnGZBBg0mXqwxUgC1vv4HN6dB8xgV3Xk
 R5OW9HWqgHYpPCyco4VBQG/YqJXAaoDqdmltFUq8KNV6OR5H9YQOt71wpdA2GGU0TEabR27fip2
 axAVE2Dy3oR1rDz86z8yAnUymALUI228oFelPK1fn6KoB2XQUNlpmnLBBrMuYntekJhzuspGTah
 vGBSW49CatwAdnL7glhUm92NNtZcIBL62wSAUV8e/elmE3xSugFoHlLpmPVr+1jCKvg0JbtiO4X
 BE7zYaGeyGucoCIKvu27kCRsPpE7ECUl7WSlKfmF0vrTPT/4IzsktVpO0FJXNW6ox5LnpLazxGJ
 da/riViHTXL4GtL9MyKM3k2KXTJLthhS/7UgrpAzBDdnyq8wGLvIWvKQ/euHKNxoIkANDTkgb0W
 HfQw7i3kQktVokgz9cpShxKbB3ZjQYcfD7LfCvs7Y+rvvrwWUeKhUfQqPMetvkXqn/VlmBn9hD7
 8Xl4mkCojAqkRCfd5bD
X-Received: by 2002:a17:903:1a83:b0:2cc:307c:51fc with SMTP id
 d9443c01a7336-2d106e81d72mr34324545ad.21.1786034385131; 
 Thu, 06 Aug 2026 09:39:45 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d0aa4ec8c7sm34280735ad.80.2026.08.06.09.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 09:39:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/7] target/arm: Introduce cpu types max-v8 and max-v9
Date: Thu,  6 Aug 2026 09:39:37 -0700
Message-ID: <20260806163939.328201-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806163939.328201-1-richard.henderson@linaro.org>
References: <20260806163939.328201-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Introduce the names and allow them with the virt
and sbsa-ref machine types.  So far, the cpu types
both exactly match "max".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c      | 2 ++
 hw/arm/virt.c          | 2 ++
 target/arm/tcg/cpu64.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 484b90053e..56d08f605c 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -913,6 +913,8 @@ static void sbsa_ref_class_init(ObjectClass *oc, const void *data)
         ARM_CPU_TYPE_NAME("neoverse-v1"),
         ARM_CPU_TYPE_NAME("neoverse-n2"),
         ARM_CPU_TYPE_NAME("max"),
+        ARM_CPU_TYPE_NAME("max-v8"),
+        ARM_CPU_TYPE_NAME("max-v9"),
         NULL,
     };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 219597cabd..34cab9017c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4143,6 +4143,8 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v8")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v9")));
     }
     if (target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 2c0b7c1be4..556fa9fa3c 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1462,6 +1462,8 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "neoverse-v1",        .initfn = aarch64_neoverse_v1_initfn },
     { .name = "neoverse-n2",        .initfn = aarch64_neoverse_n2_initfn },
+    { .name = "max-v8",             .initfn = aarch64_max_tcg_initfn },
+    { .name = "max-v9",             .initfn = aarch64_max_tcg_initfn },
 };
 
 static void aarch64_cpu_register_types(void)
-- 
2.43.0


