Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1984585ejb;
        Wed, 21 Feb 2024 07:20:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXch82vHlgYzxs3fUpwCRNj9rqLMZVqAAL5k6K1WXRoJLPc2Ps62OvJ1CjiWgtwWeagR/SqE3v3EXJCdxmDU6Nk5NQ7oXry
X-Google-Smtp-Source: AGHT+IErVEbeD0QNIbimlaCQO1VDr5u7iDLxK+iouLm72UbfMjp2tGrRtUbKbetuTBytuFqHxO1L
X-Received: by 2002:a0c:e4c4:0:b0:68f:5cf1:ffdc with SMTP id g4-20020a0ce4c4000000b0068f5cf1ffdcmr8978891qvm.51.1708528808011;
        Wed, 21 Feb 2024 07:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528807; cv=none;
        d=google.com; s=arc-20160816;
        b=0qXBzepb5xgO03ZV2j2ehU1Mlr0/32SPHprhOWJu7+MtM7Nti69Y/unIYvc0xiggTP
         m1TqFv14rS4E8qrPQ95ARW0OBKA4qKH7kyc/sk07TpsL5OFoToM/KmOU+z0h3Ni0evao
         Jp1Cfb8y61d1jO79bheU86yfbj5wAZfODJVvatIBiuKHCJtLdjxEdt/E1FrDJI5tyy3C
         O8lWmzTAbTuRw7t4b/Z3dcl6mk3/7NkyR3lbim0pSihRfsksJhHWI+d6eCZEI+xuD1Ix
         aW/hZO/2ve+rSbpyPgnVj4nYPD46Urri2AM2cH3N4TqvY0H0o1tgUD+mi75YaZKpWusu
         Kb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=kC+6QdCdfd209nAosFfX77b5Yg19bKRBEfPH667vJZU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=oTS5Zv4jTlOmPjYme2cI7W4d00PBojbv67IR4KMZWOzUQlDSobGgx8t+EBXAEsI+M5
         1mQhsg5U1RrT8wNdugkHF6WL18KLkZfpTPN6ZPMYVL87ocUOehpEFclxtxO18T2Iktt+
         hKxsQla8GEzUP7vZXb1Ch9DOvyckDRMMkPAe9h0bG2NuDOGxn6Os7+HK6XFv3h+iC7UL
         RlGb+k/zGR5cxyWfOEzJi4KxMjqhWyrAUX+HskAhsG+y3Ay9aroVdgpgAGNt3YiCK0dp
         IrZLm3CWzRdOuQfevd6MZLNsNVlhPhm4/S231DWI5ZrhGezDhdQDVoUQ1Uqjfnj7vX22
         S7oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020ad45f4f000000b0068cb7b40344si10682285qvg.430.2024.02.21.07.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:20:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoNS-0007MP-Qd; Wed, 21 Feb 2024 10:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoJp-0000wk-23; Wed, 21 Feb 2024 10:15:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLz-0004pz-4H; Wed, 21 Feb 2024 08:09:40 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxPz0n4zz2BdDH;
 Wed, 21 Feb 2024 21:07:19 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 121BB1400CF;
 Wed, 21 Feb 2024 21:09:28 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:27 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 07/22] target/arm: Add support for NMI event state
Date: Wed, 21 Feb 2024 13:08:08 +0000
Message-ID: <20240221130823.677762-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WPAJgGN8is8m

The NMI exception state include whether the interrupt with super priority
is IRQ or FIQ, so add a nmi_is_irq flag in CPUARMState to distinguish it.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/cpu.h    | 2 ++
 target/arm/helper.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5257343bcb..051e589e19 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -603,6 +603,8 @@ typedef struct CPUArchState {
     /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
     uint32_t irq_line_state;
 
+    bool nmi_is_irq;
+
     /* Thumb-2 EE state.  */
     uint32_t teecr;
     uint32_t teehbr;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bd7858e02e..0bd7a87e51 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10575,6 +10575,15 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
         scr = ((env->cp15.scr_el3 & SCR_FIQ) == SCR_FIQ);
         hcr = hcr_el2 & HCR_FMO;
         break;
+    case EXCP_NMI:
+        if (env->nmi_is_irq) {
+            scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
+            hcr = hcr_el2 & HCR_IMO;
+        } else {
+            scr = ((env->cp15.scr_el3 & SCR_FIQ) == SCR_FIQ);
+            hcr = hcr_el2 & HCR_FMO;
+        }
+        break;
     default:
         scr = ((env->cp15.scr_el3 & SCR_EA) == SCR_EA);
         hcr = hcr_el2 & HCR_AMO;
-- 
2.34.1

