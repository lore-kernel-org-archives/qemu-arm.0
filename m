Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B755CAC5AA
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:54:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lfb-0004Ax-4x; Mon, 22 Sep 2025 14:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lf9-0003WQ-D6
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:23 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lf4-0004wd-0Y
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:22 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b523fb676efso4105013a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567195; x=1759171995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3lppChNLDhQriahywEGch8lhsfYgg6UozfYzfSbm90=;
 b=CwCFgxFbrrRNLRbCi2GspvL5Rivxi+8e50PT1Y4UFZidTEzoVdKmDCTCZaTo295Phn
 m8dXMZrDArrIi27M5XwxJjToPfG3a7MjCBAs30U68lspgGmR4U3p7HCZP2SpoLO9Xg/J
 kpH0bOO5WanBnCqqKNLJZdKliF4XnLgKP9wCgEHd8qyATWnLSPFXPXeyPxjRqLICIiFc
 rwhkMCOBKAxGMon+T0orQ+eWz5z3wiFq7EgdQRy/SHEpJ16N7ParqZdAS6zLEhq89ber
 cHT7zztQe4nCsxhKaLTmFOThAApmFQlH73J7Jr8nSp/W+XdWBimrQU2OcAvEyggl/D3/
 yKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567195; x=1759171995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3lppChNLDhQriahywEGch8lhsfYgg6UozfYzfSbm90=;
 b=Dov2/fHRlJcvdyLSkVpwpvZzBkpK65DzA5gTnmcWXwND8snuaUSlnI6uXy6q0y8n1m
 Kzu/sh/ighS9Yw8yP9fs3VEODKTGG3EynAFjyWvsEGsLahVpbDwwn3z0l8yTQ3nfmNNz
 yINHeDZeqtRo5RI7YBMsR2Jqus7BLSfvERtAd3YWU6GIUC54ENoMqR8i93/oi6lsHkHT
 6iTi4DumNh5Gpj4EgzTnps7XwqsvDm9GXvhFXiAH2685yab9HUgBCbDRF2rc06ktj6PM
 LscpHBdEh4r7wLfX8L7AvXN5T/sf6iJK7P1svrhAJaQQsIasicNmiepSpbpiJDRJOb5v
 ax7Q==
X-Gm-Message-State: AOJu0YzXk7LbzC5s52z7aDHaUziyO2r/naLKi0Mn+H/Utay9etevdRzj
 Pt6igoUhE0pwcKloAf2imU/FYBYhlY6uG+y7v3k2qhT+74mp+ILnMplT9iQUDwLpUPY=
X-Gm-Gg: ASbGnctaLNv+ZwGTnqFyLn+yB+E3ShB6YxsLtmHq3vmmrzcWfRg4MQTiUeVMObGT9am
 bLgmAR64nLW+3BtRpJ44vkb/4UEdYCxDIOdrPL1kosBbtgyBjVVhPbBpEcDSUZCCyzV0en7oV2W
 etM04u/xwTm3+35Iuz9NjA3l+B0YXY0m5Hxm4W+Eh/v7RgopYE7Kh0MmUABM47o2NRp8XCVN+nb
 w9IlbVNxV1wGxf4JNGBlqS/4OMx378pnm+WRQe4fC4penSFMwlTlU+C9MTV41afx6Md10ZPwOeh
 8T4TBTcwZEJtD4kS1lZEthKSfNVZ/qDZPRE//47gz4Gm3RfoPAM2Z7GL2VoLmplgykWaWEG7Bo6
 2gyouxhrhkgvBh52vRhbqvBbC1qXF
X-Google-Smtp-Source: AGHT+IF5f23Xjj5Et5bObngPcLqjWFuArJxPciSo1NR3ZyuUf2vxBEuGkqWStZo1Y3YVfmfM6Hja1A==
X-Received: by 2002:a17:902:f645:b0:269:b2e5:ee48 with SMTP id
 d9443c01a7336-269ba52e56emr198628995ad.52.1758567195640; 
 Mon, 22 Sep 2025 11:53:15 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 43/76] target/arm: Split out access_nv1_with_nvx
Date: Mon, 22 Sep 2025 11:48:51 -0700
Message-ID: <20250922184924.2754205-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b5ae0c543..5519484186 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3419,15 +3419,16 @@ static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static CPAccessResult access_nv1_with_nvx(uint64_t hcr_nv)
+{
+    return hcr_nv == (HCR_NV | HCR_NV1) ? CP_ACCESS_TRAP_EL2 : CP_ACCESS_OK;
+}
+
 static CPAccessResult access_nv1(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (arm_current_el(env) == 1) {
-        uint64_t hcr_nv = arm_hcr_el2_nvx_eff(env);
-
-        if (hcr_nv == (HCR_NV | HCR_NV1)) {
-            return CP_ACCESS_TRAP_EL2;
-        }
+        return access_nv1_with_nvx(arm_hcr_el2_nvx_eff(env));
     }
     return CP_ACCESS_OK;
 }
-- 
2.43.0


