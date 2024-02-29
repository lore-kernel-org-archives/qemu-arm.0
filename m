Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp374938eja;
        Thu, 29 Feb 2024 05:14:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsIBfVV6J1Cru361HmMo1xdTHg9Yb83XMhQWYT8KcN19R+LMuTo1CFtN7KgGEIbyLXTd2PT1BmJ4D2pezkykztru7xssXv
X-Google-Smtp-Source: AGHT+IF0PMK1RCIflvl9A57JPqUwflU1H7hP73mjQq6fOhkAMnhElYp8hYcL6LUUdOx7gZsuXsNP
X-Received: by 2002:a0c:cb85:0:b0:68f:6df2:3b6f with SMTP id p5-20020a0ccb85000000b0068f6df23b6fmr2094362qvk.44.1709212470630;
        Thu, 29 Feb 2024 05:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212470; cv=none;
        d=google.com; s=arc-20160816;
        b=cigpvpAy4FTR4UgNc99oG9cu2VcMkozXNmmTAJ/OpHwZ6BVYgikm8RNkS+2t/i7Cid
         sy6OpAOuSMKx2FN9mrpsPbFd/suzXRE5QudFF7uziFm4KQEKF2zWorl6R50TCq63fBuo
         +uME0+KApgx1bSvQmADaHz/8U1mYbdhLfvyihZpWqS7VBaL+wJH9Yvz/xgs1uwGnvYu+
         QyHr5dWQFTTtaYlMK5KTg+AcAdF+IJX05+MWpP4PvzFDAZ5yUxfuETkMDmosloTPAMCk
         /ItMbPz2oFCpuiBuZX6Kl5gFEk+Q6z27dKWiB5U3bdNrY2Di6b/y1aUHEPUdSHUohtxg
         OOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6F+muBG2sFhXaJ0bL3QHGxlktDKUuT6YhCvBdluQbHo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=ujCeMRHpxvP3AC6GynT9gy5NeoMCQQlj7PTYtOhWHk2xcsjAhYq5WX20IlRrqfvzSy
         35cKCvqfo39lxkAhlAOPEsEYdZFApUZyI6aCRsTCBoJ+WdGYvzcED6dvqSDQZs2FeMaQ
         /ShZU0hde5Ynhe3af1cPknK4Ik2Czwyg5/HtQvucdmOi0KLPFGdxXX1ZXhnHDcWyB0++
         NADEci65a6Vuh1jlhIPHGIP5HA97VkidtCwY/ZP+IzfimIumxymBN/uXL//ZNNZTpaE1
         wMiev4Kd9DO1iPlrUvGdu/uCqKNALVIaeWGGeomMPdiz2agHk1m3oiKO1J1gKTsChrs/
         KsEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020ad45bc4000000b0069004ed6032si1278826qvt.230.2024.02.29.05.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:14:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgDC-0006EF-Sx; Thu, 29 Feb 2024 08:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCb-0005aV-2h; Thu, 29 Feb 2024 08:11:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCZ-0002eq-BI; Thu, 29 Feb 2024 08:11:56 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tls4v6wXjz2BdtL;
 Thu, 29 Feb 2024 21:09:35 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id E80911402CE;
 Thu, 29 Feb 2024 21:11:51 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:51 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 13/22] hw/intc/arm_gicv3: Add irq superpriority
 information
Date: Thu, 29 Feb 2024 13:10:30 +0000
Message-ID: <20240229131039.1868904-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: TvalRC7l1jUp

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

