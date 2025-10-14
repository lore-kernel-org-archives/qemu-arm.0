Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852BECCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:21:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lK2-0002gm-KH; Tue, 14 Oct 2025 16:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lK0-0002fr-WB
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ9-0005Nk-33
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:36 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b5515eaefceso4987947a12.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472456; x=1761077256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSnDOhind8ZKnhqaEP5AqE4yrhsCwnVK+1ojrTTr64k=;
 b=Fu7remyGmW6yfJGRhZrI7emjMnYqkZVsQsh22fC+OhkLGUT7gnT/h/aUDXzZA3eh51
 Q85rxYhnmjsEt2d7e2iLPfjpW7wabvc8jjnA3/7Eh2NrY4nGg/H5wk8+IL65Z9h9v56C
 VFFA1yOsy04+OW0ODt1uTBcN4exItlYFWAKmhpzTjHHeHGbSdbtgM7v7XlJ0tfNFnap1
 4ytO4fJA2YdL6dIsws7dQeZcuudRZ2OVd9caS69MuZL3ehDzBaK29I1Vq8UMhaV4gihy
 3GPCODxXiUkPeyinIhxtir62estOWXThqgSAFIpnccYpgLvqOiFpUD5Q9ssOwerhvcuB
 Lb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472456; x=1761077256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSnDOhind8ZKnhqaEP5AqE4yrhsCwnVK+1ojrTTr64k=;
 b=bhxcK0hjy0a8Z4bDg9b8jMKCy1Wxi4nJ9zdc4eQbmLv1Y2bxBexhPhB6DM/tXRbvd3
 ThvAxDNO4BXPKJ4JBCozwEDw5ZAic7CzmCy+W9AMbgHZFpkAM8hnT5tko4DjWWw2yGA9
 Y5t4DvmkSMBhFs7BET9rNmecTbi5x3pxho7LUzyM4iDLvw/73N1He2EBuys5czb9+uBG
 fF3INtYznZ1cvSmQj8BDnECwVFTpstpPizpZGkNj4KdVXT71HKkkUV7EoEAjbTdV8jpK
 OTiv99X8h6jEuE8qY06PyhJU8IVXkFc4A7yK+qiR8XngJzzwGxg6kUkSYShI3tsHko4v
 Smcg==
X-Gm-Message-State: AOJu0Yw1QDKU5Uxvlf3ioxZ2/TpWdFOI/yg3OFmqexySTEKjt+UJH7SK
 1sgSXzwm+h6AUiXTwL3TpBxiyVi4DkiDT+sw6FTmz4MOb8/SjHSXQ8FCZVMsPA7CF4ZznWHvU2N
 OUcNV/iQ=
X-Gm-Gg: ASbGncv7T9+tfM9s7ZnqAFi433lHtJck4zKJPCaIycVl/J2nWFRzn9Z96sP/LnKfibj
 tmiJNjsP/GcIPVU3rAVYo3tqsaVo9WbcuEhh9t84SMXp0NVtOFqecCW8VMwmb/VzqSUXpmuQoWU
 +AW+L1TGdoEIhNtK3kEQpjS0pYVNhyD9izRyefWI5Di29027I7oI9wTpwRIHgmgr7oBHRIViPrb
 iMSRTcrk9TCHZ4HFzIUsmC2MpMWUVVwbUOnupgAbn8sbMQx5NNJsqPaPpxnN2p203BFKtw0oHYT
 QVOYwuAgHlcd4zY2yQ4ib115BAZH9W5FY5jOhRUHNdQldiYQq5jq5RqWTVN9dkDnQ8D3RrqB0FE
 m/q59+KEdFxnLsCjzEO96WccdMLm5Fy+X4D54iZ6xaMGSKTrJzCqMA+vB3J+Qfw==
X-Google-Smtp-Source: AGHT+IGbld38GjPclS18zrmaf+l/YXNWYpnfLVXJrqTlgQZMMctkxuCHUpwNFQKFWniGQZEQnY6osg==
X-Received: by 2002:a17:903:1547:b0:26d:f589:9cd7 with SMTP id
 d9443c01a7336-29027373c2bmr356992095ad.15.1760472456344; 
 Tue, 14 Oct 2025 13:07:36 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 24/37] target/arm: Use flush_if_asid_change in
 vmsa_ttbr_write
Date: Tue, 14 Oct 2025 13:07:05 -0700
Message-ID: <20251014200718.422022-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Only flush the subset of tlbs that are affected by the ttbr
register to which we are writing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c6d290ce7c..2b55e219c2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2943,11 +2943,20 @@ static void flush_if_asid_change(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    /* If the ASID changes (with a 64-bit write), we must flush the TLB.  */
-    if (cpreg_field_type(ri) == MO_64 &&
-        extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
-        ARMCPU *cpu = env_archcpu(env);
-        tlb_flush(CPU(cpu));
+    /*
+     * If the ASID changes (with a 64-bit write), we must flush the TLB.
+     * The non-secure ttbr registers affect the EL1 regime;
+     * the secure ttbr registers affect the AA32 EL3 regime.
+     */
+    if (cpreg_field_type(ri) == MO_64) {
+        flush_if_asid_change(env, ri, value,
+                             ri->secure & ARM_CP_SECSTATE_S
+                             ? (ARMMMUIdxBit_E30_0 |
+                                ARMMMUIdxBit_E30_3_PAN |
+                                ARMMMUIdxBit_E3)
+                             : (ARMMMUIdxBit_E10_1 |
+                                ARMMMUIdxBit_E10_1_PAN |
+                                ARMMMUIdxBit_E10_0));
     }
     raw_write(env, ri, value);
 }
-- 
2.43.0


