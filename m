Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp112056ejc;
        Mon, 4 Mar 2024 23:06:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXjg5Yy/0YZIRACQ5xdv1ADZpTXRtZ0IuKqAaNtd3kyna1vwgxogEPbFqryZ0rDETCxUbV9fpf366xIrXkrWNRfhZBQdlNz
X-Google-Smtp-Source: AGHT+IHSRdsi6SAb7trrHadOfHzEAC/OtjMQbCixuBV7Z+CLaWcaBJy5By446CP/SGsVPQKjMJLJ
X-Received: by 2002:a81:4744:0:b0:608:b5e4:9576 with SMTP id u65-20020a814744000000b00608b5e49576mr8645431ywa.45.1709622393760;
        Mon, 04 Mar 2024 23:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622393; cv=none;
        d=google.com; s=arc-20160816;
        b=yDimmuPyxxCjhHISjX25fht6otWznlDcJO3p+IPvSX6raT7T+Y3EJ8I8TQ+tTgalEG
         3C0WcC0ZQziXfoewFWLhg/pG/2Ev4TzFN9dTKtQ3HLbpM3nA5KA0EVhLdWSSh/yrUNn+
         xAZLcz2lKIcqtmw2zcOR2dTHbbNs//cgLCg05cVfYB8JtmIBjtb5Fb1SIPM4uSDXbcsI
         wxxjky6a+8dMFQc4vZWww5UxT3bMAmP4nSfWVrqiVDI3fMxrH0eOQQ6G0lygp66pcg+b
         spSCYVXY9V6MOvjpCOINgeVQmqQQyJkIPz1lfXUF12vwB7SLWitK29qV239hUSDCgBZs
         1opA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6F+muBG2sFhXaJ0bL3QHGxlktDKUuT6YhCvBdluQbHo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=dylsqk9IIEjxnSao+x/6afCX5CYWHHNe3wYu7CsqFOaVIcxts5wNWp2faBHkOJCwSB
         ZOfpH7gzYqHcwy+yJU1mjDhENhk+wR6gU+C62bvJtsD8guBalLDWUmSOsTzz2gzj/zSd
         hTEKOEdwt9WYfV67UBEsIeZnSGr4FrzR3oC2v1t2a40vuH+2TWInyhSf4eCUEHrX/FNP
         HTlRR53mFKylbWugmUimG1uNp7//ltr11zM5yp8hCg4mhy9zVp7Q0WFxwazmxag/X3iX
         tfOQ/EsD3ARb9yfHLZ/bTp6EUiyG1uz009QASgHJUW5T/Owlm/jU/0dXg9W5zQVsZCnr
         knGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020ac857cb000000b0042ec79de2e2si3327907qta.597.2024.03.04.23.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:06:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhOsb-0004xh-7j; Tue, 05 Mar 2024 02:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOr9-0004Ca-4J; Tue, 05 Mar 2024 02:04:56 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOr3-0008S6-BY; Tue, 05 Mar 2024 02:04:54 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TpmjP1cy5z1Q9Gf;
 Tue,  5 Mar 2024 15:02:49 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 65B5414037C;
 Tue,  5 Mar 2024 15:04:45 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:44 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 13/23] hw/intc/arm_gicv3: Add irq superpriority
 information
Date: Tue, 5 Mar 2024 07:03:21 +0000
Message-ID: <20240305070331.2151131-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DCWXdTx9Uj2O

A SPI, PPI or SGI interrupt can have a superpriority property. So
maintain superpriority information in PendingIrq and GICR/GICD.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Place this ahead of implement GICR_INMIR.
- Add Acked-by.
---
 include/hw/intc/arm_gicv3_common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 7324c7d983..df4380141d 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -146,6 +146,7 @@ typedef struct {
     int irq;
     uint8_t prio;
     int grp;
+    bool superprio;
 } PendingIrq;
 
 struct GICv3CPUState {
@@ -172,6 +173,7 @@ struct GICv3CPUState {
     uint32_t gicr_ienabler0;
     uint32_t gicr_ipendr0;
     uint32_t gicr_iactiver0;
+    uint32_t gicr_isuperprio;
     uint32_t edge_trigger; /* ICFGR0 and ICFGR1 even bits */
     uint32_t gicr_igrpmodr0;
     uint32_t gicr_nsacr;
@@ -274,6 +276,7 @@ struct GICv3State {
     GIC_DECLARE_BITMAP(active);       /* GICD_ISACTIVER */
     GIC_DECLARE_BITMAP(level);        /* Current level */
     GIC_DECLARE_BITMAP(edge_trigger); /* GICD_ICFGR even bits */
+    GIC_DECLARE_BITMAP(superprio);    /* GICD_INMIR */
     uint8_t gicd_ipriority[GICV3_MAXIRQ];
     uint64_t gicd_irouter[GICV3_MAXIRQ];
     /* Cached information: pointer to the cpu i/f for the CPUs specified
@@ -313,6 +316,7 @@ GICV3_BITMAP_ACCESSORS(pending)
 GICV3_BITMAP_ACCESSORS(active)
 GICV3_BITMAP_ACCESSORS(level)
 GICV3_BITMAP_ACCESSORS(edge_trigger)
+GICV3_BITMAP_ACCESSORS(superprio)
 
 #define TYPE_ARM_GICV3_COMMON "arm-gicv3-common"
 typedef struct ARMGICv3CommonClass ARMGICv3CommonClass;
-- 
2.34.1

