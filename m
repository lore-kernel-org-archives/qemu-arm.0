Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2170195lfq;
        Fri, 18 Dec 2020 02:51:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyb0IMyrARqzFMwjQkSfyiUxgd+1nkXuyNNKuGzZSUUIRk8zKiFM9iFuzcFTRD0y4UDQBKB
X-Received: by 2002:a25:2e07:: with SMTP id u7mr5233794ybu.393.1608288706701;
        Fri, 18 Dec 2020 02:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288706; cv=none;
        d=google.com; s=arc-20160816;
        b=IQHPHODXofYLgyYLZt6zWLyH1JqhP0PS+kqFf9qS4L7nvbj2es2OMcNEFfaoJIkUtq
         Vs3IJ7L7Rb1CaLxSdGFKzGBOuLnvY2sSWHQcWlrWPHlmDMOTqapkws/m/pVtIefog8bG
         N9j5etX4UAkt7jFzwcZy12rRCIRPVweWFEI09IfZtj2TuLl7hqY5xamhtuPWD8dGQnZA
         XJ0LWpMt96UqKM4NZjzfvRUzEXsb4di2WeKOEc1K1fkbYTMUh9IJyuu27PDESlikTJ5G
         s6cSqrTxtwHnjShXoXMPQZakEdxN35OboJ+Mls8QY6qXLm5yhqm7eJVgJg8dxHPOh3vq
         HREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rDJK70FQhkMINSf9d9a2Jct+IrMHOAzfSQtQqXG2RT8=;
        b=0dyW9zpM5gcaHI4ONIc5Vn/+yFPF1jg69yFPWYjBOjZtuDI8WC9BDIg+ZYMmkhYpr5
         ug27fKxbdq8s5KxUkm4e/bqzSGeEwVZNFQQ/5nDXEdaBXHpqh1WitoP/RWlfN9pFzdYR
         DkGXNrJa+71QIExg7wkp9QQrGV/0UbufpRVTn+VuUXuEwXbIfmDOBDIpROB5O0WRTJfp
         1dTCYph7h1CHnCUvEMitfR8ufNAqHMw+hs31DL3ZHjn2pJIieATDhlMii+wXAKP0xYuu
         PMoYD1KZd5VPP/09wPwyilkwMdOkx2W5NutkXQeJ4RPrVDTImuvtJul7I699x4Y2Xovo
         kXng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e141si8891302ybb.120.2020.12.18.02.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:51:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDMQ-0006du-2M
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9b-000768-1n; Fri, 18 Dec 2020 05:38:31 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55288
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9Y-0003Jl-4J; Fri, 18 Dec 2020 05:38:30 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7821860804;
 Fri, 18 Dec 2020 11:38:04 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 18/18] target/arm: refactor vae1_tlbmask()
Date: Fri, 18 Dec 2020 12:37:59 +0200
Message-Id: <20201218103759.19929-18-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
X-TUID: qEw91NIW21tl

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a96daca233..df195c314c 100644
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
2.29.2

