Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3455868lfq;
        Tue, 12 Jan 2021 03:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEoOVNURTU3/T5V+VTcSw2cEmD2LR1Atlly+qNYb0gfi9pJojE+7ODHY9gVLORI127NXOW
X-Received: by 2002:a25:3d84:: with SMTP id k126mr5917491yba.162.1610450231995;
        Tue, 12 Jan 2021 03:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610450231; cv=none;
        d=google.com; s=arc-20160816;
        b=r8s/y2wgpTeZIki4JVzhjFlP8PY8vaXMzXMRD4zBqgXLshGM5mFWkBiA9lNlnc9svJ
         U52vRFdQiveHpk5twAiYDEkkCF8B5gaOdjru5OgACEYZm+TPX7LDKdJjDZgggZQHMYBf
         Xznezk8TdSzwO37L07N4CIObNgxSOtKvKkxH1pA2tbP0jZtnB/UM5CHgZA3FhaL7JY3i
         n6t8X7LfAgIkm6J5nVYOYICRkYEVwbH1QQXJypiCr7vtPhQAovUhMedOfDvsyq+UBTrV
         93aBe2q+FqdV5DAk9PBFcr44nXLa29um6pNpSWKJPiqPX4+iWR9GwaqxIPImoR8cldAe
         IeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=0E3JtLu6aTHNunoP1emWTT8+3hMmWAtT/kTV2+Tcg38=;
        b=aaFl15qpig4WZTKqV8D3RkZ4dwbjwJFPqAu8C0RF3Oz9yIKPwa7xEVSvgdjV+tMUSr
         22ZERtYJDerKljuguKeK78cCJrI5j1wQJhEKduw3T1x53CYmyF4PIeCSTQ17Eq7fngT/
         kpfrq1ohRWRqAj3lbWoyJpodyjIzN+DN2B1A+bWtlYdP+rJM2UvTb8w+0jndzcr4/jKy
         rhkBdH08knUwVOx367cm9uMTqthghk0qcOZd4Lh2JQAIuQaReH/AGVT0A4XBsMd6GrYk
         0LHZNdrHpEg5r6owQarrHoGkEqDIC5JkBNhiZGjEzdbqY1Y7GmT9ySWdmKRmFzYvGwni
         cx6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si3226810ybg.367.2021.01.12.03.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:17:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHfj-0005b5-Ck
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBV-0003vp-MD; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56718
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBR-0003Sv-0g; Tue, 12 Jan 2021 05:45:56 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 67CCB60808;
 Tue, 12 Jan 2021 11:45:16 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 19/19] target/arm: refactor vae1_tlbmask()
Date: Tue, 12 Jan 2021 12:45:11 +0200
Message-Id: <20210112104511.36576-19-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N6DUHsPZkVg5

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 32fc72d9ed..c07850c7ca 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4469,26 +4469,23 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 static int vae1_tlbmask(CPUARMState *env)
 {
     uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
 
     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        uint16_t mask = ARMMMUIdxBit_E20_2 |
-                        ARMMMUIdxBit_E20_2_PAN |
-                        ARMMMUIdxBit_E20_0;
-
-        if (arm_is_secure_below_el3(env)) {
-            mask >>= ARM_MMU_IDX_A_NS;
-        }
-
-        return mask;
-    } else if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
     } else {
-        return ARMMMUIdxBit_E10_1 |
+        mask = ARMMMUIdxBit_E10_1 |
                ARMMMUIdxBit_E10_1_PAN |
                ARMMMUIdxBit_E10_0;
     }
+
+    if (arm_is_secure_below_el3(env)) {
+        mask >>= ARM_MMU_IDX_A_NS;
+    }
+
+    return mask;
 }
 
 /* Return 56 if TBI is enabled, 64 otherwise. */
-- 
2.30.0

