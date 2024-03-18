Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp521281ejb;
        Mon, 18 Mar 2024 02:39:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXr7TQdvjmLaPvgpiB1EpSZ/txVrUXRV0dFnQ+ytaw+lZPZoMxWmDehiJKO+a523+2WItJ68Fcys2uvysv6jUQ6TEEo1AVq
X-Google-Smtp-Source: AGHT+IFeoeF/VEg7r7teJXyeGc3Amf22sSosKfOgnN4kM7jqemAeHSv6NnZS4ZYjQ+0JebnkGFxx
X-Received: by 2002:a0c:f048:0:b0:690:dab5:93cf with SMTP id b8-20020a0cf048000000b00690dab593cfmr10789415qvl.65.1710754747674;
        Mon, 18 Mar 2024 02:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754747; cv=none;
        d=google.com; s=arc-20160816;
        b=0exPa74Qd492c3gy+fQE+RPvzWoFtMGRMMHs0WJQF6OW3DoIF2shgRK2SDafghDBJX
         i/qnIkFUbgRLYNQs0ktWCW5B+GhcLUvByvOF00IeFImxrGR8we+7BPY/dpmub7PNmuOQ
         ofo7NHagEsCgLxJD2NeFqXvp5ER+yZCuvhmB+DXrcRTgavELj3TOmx+CdxEeyZi3RIlF
         sEGypBLQCrHhvvpk1b0TrDBkaJ822VXWYQ1JP1Ge5lg3x1Q42BehsEWrBAqsuzAQU5VB
         sjBNi/84olCw4RcLlVJew5Qj9uKxBtqk5oBCF0E4ETwCSdzk1M/fj4Kuj1wZqM88fo8C
         uPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6F+muBG2sFhXaJ0bL3QHGxlktDKUuT6YhCvBdluQbHo=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=X2yYNtsZKPgCDix2ryDZkKDeZlOrt1sgpMgn/Pyq+uFbLKElyLB4T/5ZkZgM8my9dW
         wFXqWgmebM/E/Rl9JXKucFFWgtjMyI1bMMOfg+ppdOv0Kt1+gQGjAI+nuVM/FMLgisEr
         ZQF5a7gs2DyeP6Wk4h9BYGe3pNVGU6CLtL03k7EzmHi9m134uucQULDl3x62xUw/vK8t
         oZwdV9sRcv4a3KiSk7qw2DlAt9qkchbiEF+2oLr+FKXMT+l7ogreKe8lpvlKH5upzBPy
         snzNPbI8O65W5BKrx54j3qGGVMYvho8kkSlgWWO8jWYLopxMcxdoR3NZvw9YHjy3xBBC
         FVwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ad45aea000000b00696100bfda9si2719841qvh.469.2024.03.18.02.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9Qn-0003tP-6H; Mon, 18 Mar 2024 05:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qk-0003se-Ko; Mon, 18 Mar 2024 05:37:19 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qg-0000vd-8K; Mon, 18 Mar 2024 05:37:17 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TyqSZ4cBlz2BgQr;
 Mon, 18 Mar 2024 17:34:38 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4042F1400CB;
 Mon, 18 Mar 2024 17:37:10 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:09 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 13/23] hw/intc/arm_gicv3: Add irq superpriority
 information
Date: Mon, 18 Mar 2024 09:35:35 +0000
Message-ID: <20240318093546.2786144-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: f3U535hLEJG+

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

