Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp476111ejf;
        Fri, 23 Feb 2024 02:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZKzWr3rJiVojUGQrcRDxgEEKW+60PaYvO8gvnPl7zEOlKB6UBkpVF+AdplwDrtDiO2PazTYFxsY16wPVDzna+0XCF9Z7h
X-Google-Smtp-Source: AGHT+IH2+2U5aAhO7NmAJh8sHIY9vc8Z/lfjFE2Q5rUxNfhrHJLQDpUYU19J2WEjlsujkthgdZ4Y
X-Received: by 2002:a25:4d85:0:b0:dc7:423c:b8aa with SMTP id a127-20020a254d85000000b00dc7423cb8aamr1563708ybb.12.1708684629842;
        Fri, 23 Feb 2024 02:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684629; cv=none;
        d=google.com; s=arc-20160816;
        b=p0LtyDuKGIavmIVaeMSGiiQulnMa3hmgI9eY6LYS8BXS2b02CBXMIynwaY58mlRmAJ
         oTjnnPv6S4bnLzEfDqLk6Dv62zreaot2e4ss/h5JRP3/pbtC+SON/8siiEv23oOmxOUA
         /qexmGkJG71Jyyu2FR85JLbaiPe1ucOJgl5dzx5qqpKnzLHqDWcK1r8Z+snGfCTv2tj5
         TuKo71tq5EZwnuAKbOicvmmNyv7p6ZaZS4wDMiHy3Y1AePXGnef9CNneZNJozg3ZXLI6
         48BWqEyQ+Ft7SYsLJxbT7mnY6kUwmqVy1ZrwsPtHsv+A83P0+nUGWR+lCriX3rjqaj1e
         ubvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6F+muBG2sFhXaJ0bL3QHGxlktDKUuT6YhCvBdluQbHo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=wXmFPBErWXiSHAb0uI08VejbH7KCj8tPu95aDLl9Shsy++Xvo4zG31T/q4KntU4NyE
         JPaxkdiu8504TValXP52B8l9J+29uJg0pOc1FzEc3VYxgr59L9ZUeb4loeDyH74anpcB
         U5dqvlZCOabXeurxr/o/QSVrTcST8Q8aEpleAxm5/PWsv0vXGSjS0jXZ1xKzlw4BpE7S
         sDifWb8+UlKnuhey4t0xLp6Xi61CDS1wX2l4RhlqzJM7bVCsIdkp/AqnrQIVrO12QXaF
         N8Ta+y/4iXoOjXZcwfTxZ7Fq2pKQ0XUZxAzgSdGqSASdoq/ou7psvp26eQeXqTMgsr6A
         lcsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w28-20020a05620a0e9c00b00787acee5ab7si1620917qkm.565.2024.02.23.02.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:37:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdStQ-0004I4-Qj; Fri, 23 Feb 2024 05:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsU-0003bd-6z; Fri, 23 Feb 2024 05:34:02 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001wo-Qz; Fri, 23 Feb 2024 05:34:01 -0500
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Th5sM1vvVz1X3K2;
 Fri, 23 Feb 2024 18:31:35 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 38A0318002F;
 Fri, 23 Feb 2024 18:33:46 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:45 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 13/21] hw/intc/arm_gicv3: Add irq superpriority
 information
Date: Fri, 23 Feb 2024 10:32:13 +0000
Message-ID: <20240223103221.1142518-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
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
X-TUID: Z0uZ3IpkYxsc

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

