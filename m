Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272519ejb;
        Tue, 5 Mar 2024 19:59:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYaWYYCVqzcGYTKSb2cpEXy5ozmMrx6UkSIT0DNAP9AChrJKkd+MZcHgNbHc+5bQNegebn9JdJJixwCYfBnw3XOGYoGoNd
X-Google-Smtp-Source: AGHT+IFqysR2YotmGsT0eJyQlWWoZHhUyZK4iI7Jmx1FPOB4IVpvMOzLKNG0YjB2/GirA+dA0KVq
X-Received: by 2002:a05:620a:578d:b0:788:26ea:c3da with SMTP id wk13-20020a05620a578d00b0078826eac3damr4246192qkn.46.1709697593424;
        Tue, 05 Mar 2024 19:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697593; cv=none;
        d=google.com; s=arc-20160816;
        b=ypQateQhApKgHbrRfIwQYqqRZtT/+lky/qdo+j3fyDCkPfZVmB5asnMTZPANrnOway
         djS1CMa9zj8MIMi8Th0LPsWfAaSlhA/6dQll9OzYaVKiR4vBE+zavqgYZuBjlr01t4ss
         mTkEFp1K54f2LU6COfhevnLYLxgXyuBQdcPbmYkSqNWmukYVV8B3Rna0euK6dmRp/Zx5
         cj9h51lUaE7gcIO9sjxMGW/D/Cz78jWTdGnfoTiOJoTIFh9QWtSvjV5KTZMySsGMRH78
         /L+bEuLrvWC5uUvzdo54rxSc51TMy77O6QX0Gn/fUSEXmNGVU/cVo54vcy3LbPZTSf2i
         ifkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6F+muBG2sFhXaJ0bL3QHGxlktDKUuT6YhCvBdluQbHo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=0PxCBk8TkWM14cc+7PNQzv+N6ljb3B0E/k46wwWZG/Fi9plT7REiYHQVNxk0+5q1eV
         ML9BoPhRsvvROuKFE50HOUwAgnUNMCQlI29rUzVrBSx2oWHrsv4Rtv6sOXex3tgv8alq
         7x9Y1TMMNI3DXQAanVnQ/C6VmszHl5VPwtYNCQnyb5hvZ6rd3IhwS5WqlnpSYDVCxe8d
         M7WZHp8V66wjwTlkRKgNg0DEq2IsreKfDJRTwcu2X4tNSLIxKPcbk4LqG5bgvvUhrUq8
         M81CgYmak8n0AbeX4W3E31DkmDA3TnH+v3dAMRkgh7yqgR0tedxLYBoz1rYKLX4rHX+Z
         qZtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020a05620a414b00b007883c2ec6bcsi1459835qko.352.2024.03.05.19.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 19:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQW-0000wt-TV; Tue, 05 Mar 2024 22:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQW-0000vv-1D; Tue, 05 Mar 2024 22:58:44 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQU-0006n1-3H; Tue, 05 Mar 2024 22:58:43 -0500
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TqJX86YJyz1Q9Km;
 Wed,  6 Mar 2024 11:56:40 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 3C66E18007B;
 Wed,  6 Mar 2024 11:58:38 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:37 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 13/23] hw/intc/arm_gicv3: Add irq superpriority
 information
Date: Wed, 6 Mar 2024 03:57:11 +0000
Message-ID: <20240306035721.2333531-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
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
X-TUID: bUUgJXew9Ka+

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

