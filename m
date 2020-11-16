Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3350534lfb;
        Sun, 15 Nov 2020 18:49:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcefzv3CEbnT7H5x04zsO0vE+GF2SN23kY26UvUfFEn6Fsc5f5MQEujef60J80kNFtqRca
X-Received: by 2002:a25:4dd5:: with SMTP id a204mr18007030ybb.191.1605494967147;
        Sun, 15 Nov 2020 18:49:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605494967; cv=none;
        d=google.com; s=arc-20160816;
        b=WAXEEiyYlXHBQTYGhgeF0Wn4z1/v/4EYv0JyuUmmdUgy5+qJTtyj72a4aeZPI9CP65
         wuq2px+XD3+byBE55HNvNxnSfqyZvKmM2wf+hYHsRPXACSh5DHqWcT0MrQ7OR/Ttw+O1
         ZYCCopkNuI0qdQYJfbT549ebqgu4TzqBRPDFgtSiUAcrWqPjbm64Yt1xC51okd0ItkHf
         SEz/oei16y2eYBl3PaQQPEdqIzGCIWLw3M0ONLLq0+rmWScxXzTSFvmw7oLiutMlDfD5
         NPpn7IN591DWV+aoEwp8prRFwLeTIdvnySImJIbtHqX1etlV4JA7teZN6/DLCWZnsL3T
         8mvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fB50RNfINbiBiT1AmmySBxtnWhey8amwFcrkaolDaJ8=;
        b=xbe55Oje6RIR0sabwlnPNuGDtrtBK0gPvPVH79OxhBVoPBBm8Xu6yB25A51KRHbw3z
         7csCA6DrVrOvn4ZZGhOl5B+nrWUuRtJYa4+kSfoSdHdpI8SlUmn3plftVlMf0oXwo8Nu
         c/kLe3qsRKIjMv2knRGM0/oyfApCrFqHbqi5RsjT0hT/UTY7CH3q6L4yuS5GsNTEiqRq
         bSq5sV8CMthxjjyafCBp8CHm2KwqZE14pBOFD6BfpEei6kiQyys2FW1l3ToXI8wbCrXm
         c/T0GFlnmVrR8It2e11yNvWCgJQsA2HPUsdmoJxZaHZEK5UH1C1Ia0dBU2M2SVCZEOAD
         X1Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si4415303ybm.415.2020.11.15.18.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Nov 2020 18:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keUa6-0006y1-FF
	for alex.bennee@linaro.org; Sun, 15 Nov 2020 21:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZk-0006YI-8T; Sun, 15 Nov 2020 21:49:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZg-0002sT-MM; Sun, 15 Nov 2020 21:49:03 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZD6M5ZFpz6xHl;
 Mon, 16 Nov 2020 10:48:43 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 10:48:46 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 2/7] hw/intc/arm_gicv3_kvm: silence the compiler warnings
Date: Mon, 16 Nov 2020 10:48:05 +0800
Message-ID: <20201116024810.2415819-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:14:23
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 qemu-arm@nongnu.org, ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XLPK6X8gqquY

When using -Wimplicit-fallthrough in our CFLAGS on GCC9, the compiler showed warning:
hw/intc/arm_gicv3_kvm.c: In function ‘kvm_arm_gicv3_put’:
hw/intc/arm_gicv3_kvm.c:484:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:485:9: note: here
         default:
         ^~~~~~~
hw/intc/arm_gicv3_kvm.c:495:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:496:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:498:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:499:9: note: here
         default:
         ^~~~~~~

hw/intc/arm_gicv3_kvm.c: In function ‘kvm_arm_gicv3_get’:
hw/intc/arm_gicv3_kvm.c:634:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G0][2] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:635:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:637:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G0][1] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:638:9: note: here
         default:
         ^~~~~~~
hw/intc/arm_gicv3_kvm.c:648:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G1NS][2] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:649:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:651:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G1NS][1] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:652:9: note: here
         default:
         ^~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/intc/arm_gicv3_kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 187eb054e0..d040a5d1e9 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -478,9 +478,11 @@ static void kvm_arm_gicv3_put(GICv3State *s)
             kvm_gicc_access(s, ICC_AP0R_EL1(3), ncpu, &reg64, true);
             reg64 = c->icc_apr[GICV3_G0][2];
             kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, true);
+            /* fall through */
         case 6:
             reg64 = c->icc_apr[GICV3_G0][1];
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, true);
+            /* fall through */
         default:
             reg64 = c->icc_apr[GICV3_G0][0];
             kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, true);
@@ -492,9 +494,11 @@ static void kvm_arm_gicv3_put(GICv3State *s)
             kvm_gicc_access(s, ICC_AP1R_EL1(3), ncpu, &reg64, true);
             reg64 = c->icc_apr[GICV3_G1NS][2];
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, true);
+            /* fall through */
         case 6:
             reg64 = c->icc_apr[GICV3_G1NS][1];
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, true);
+            /* fall through */
         default:
             reg64 = c->icc_apr[GICV3_G1NS][0];
             kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, true);
@@ -631,9 +635,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
             c->icc_apr[GICV3_G0][3] = reg64;
             kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][2] = reg64;
+            /* fall through */
         case 6:
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][1] = reg64;
+            /* fall through */
         default:
             kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][0] = reg64;
@@ -645,9 +651,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
             c->icc_apr[GICV3_G1NS][3] = reg64;
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][2] = reg64;
+            /* fall through */
         case 6:
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][1] = reg64;
+            /* fall through */
         default:
             kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][0] = reg64;
-- 
2.27.0

