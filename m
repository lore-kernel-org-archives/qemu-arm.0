Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1984703ejb;
        Wed, 21 Feb 2024 07:20:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFgnr0m3rsBrdEM1JJGIEIdl8wU7I6YwcLbY3iAOqf4azaJCylCYz+vbSDFtLPl3pQK/jGT2ZdElrbk6U10ULodhmcLPKI
X-Google-Smtp-Source: AGHT+IELA9NVhnJ3upAD9G6KP93gdoF8zhwwaRsXbtdDHvsrZGyCc7EdJ6U/kk/+kR+SmIQ/mvk1
X-Received: by 2002:a05:620a:8807:b0:787:9091:9fc9 with SMTP id qj7-20020a05620a880700b0078790919fc9mr1308397qkn.66.1708528819404;
        Wed, 21 Feb 2024 07:20:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528819; cv=none;
        d=google.com; s=arc-20160816;
        b=kAFV28pj2MYyBhgNxxS1m9/7njXD1/RKRsTP/47iNsjZ1NFx58SjOY1PabxPghWWd0
         3ufDsJiST/QqLozuO3FghvL1OTzEwQi1zRVJ0ZZwLRKlr8aYA2eE7NUfHyWM2ohbfxzV
         xu+K9bGx19bJatgVi5lC0eG9/VEitv5q6aP3A0vjMO5cQH+YFSboyn524+cTN5TeIplQ
         Fjk646fSSru6ddgOj2ET4lo+JLnAJ56qQlWoE7hNgNxdyk9T3oQZYDSoe3b/iHsg3OFL
         u+goRls5MjBiueSXk8G7XqXTtrjk8Plhzk+X1E6s4tP7cHd2cY+WvGIf+3O4175nV6DR
         7ucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=K2dgVgQFZwluG65jIAtunS+jq76qjexX1917s5JgsWU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=YESvCMxV314iEYH3Lfjo4bHksMaOeDUXVCvRoGbqZtWK20zNy1oZWexoCROGixFrjh
         8tjKJDKCji1wVoBkt6ZN0i/t45+0wins/FunkcZGLku4F4HAMZxlqHTI24tmv/fNIQr9
         BbuOyQk2CG78kNcRYEcnaqZ4Zh5XnaPbwGi/wmR3TYy6FAU0xJW8VmhBsGRq19T7Eama
         Ko0iEZoajYGJ1zjGp2yqAcpEAdvoVUEA7qG0oF9mchMaETpbnxCmECJ+I0OcfUsMQCMX
         Wk3h19VlSn5HC2pZuQYGn2wM+vfedRKnEL57VSJOYxiVEkQ5krFjk1ptIQOAKyMArc0H
         PF2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05620a22f500b0078718948c20si10531478qki.95.2024.02.21.07.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:20:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoNn-0008OO-W9; Wed, 21 Feb 2024 10:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoK6-0000sX-8z; Wed, 21 Feb 2024 10:16:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLz-0004s9-25; Wed, 21 Feb 2024 08:09:41 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TfxQ73mG2z1h0HS;
 Wed, 21 Feb 2024 21:07:27 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 472A11400CF;
 Wed, 21 Feb 2024 21:09:36 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:35 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 17/22] hw/intc: Enable FEAT_GICv3_NMI Feature
Date: Wed, 21 Feb 2024 13:08:18 +0000
Message-ID: <20240221130823.677762-18-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
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
X-TUID: DCa1CbLJIy2R

Added properties to enable FEAT_GICv3_NMI feature, setup distributor
and redistributor registers to indicate NMI support.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/intc/arm_gicv3_common.c         | 1 +
 hw/intc/arm_gicv3_dist.c           | 2 ++
 hw/intc/gicv3_internal.h           | 1 +
 include/hw/intc/arm_gicv3_common.h | 1 +
 4 files changed, 5 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 6249c3edc9..9abbe9b71d 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -566,6 +566,7 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
+    DEFINE_PROP_BOOL("has-nmi", GICv3State, nmi_support, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     /*
      * Compatibility property: force 8 bits of physical priority, even
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 2f7280c524..65e7ca29cf 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -412,6 +412,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          *                      by GICD_TYPER.IDbits)
          * MBIS == 0 (message-based SPIs not supported)
          * SecurityExtn == 1 if security extns supported
+         * NMI = 1 if Non-maskable interrupt property is supported
          * CPUNumber == 0 since for us ARE is always 1
          * ITLinesNumber == (((max SPI IntID + 1) / 32) - 1)
          */
@@ -425,6 +426,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
         bool dvis = s->revision >= 4;
 
         *data = (1 << 25) | (1 << 24) | (dvis << 18) | (sec_extn << 10) |
+            (s->nmi_support << GICD_TYPER_NMI_SHIFT) |
             (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
             (0xf << 19) | itlinesnumber;
         return true;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index a1fc34597e..8d793243f4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -70,6 +70,7 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_NMI_SHIFT           9
 #define GICD_TYPER_LPIS_SHIFT          17
 
 /* 16 bits EventId */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 1eb8c39239..c9d31c7c7d 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -248,6 +248,7 @@ struct GICv3State {
     uint32_t num_irq;
     uint32_t revision;
     bool lpi_enable;
+    bool nmi_support;
     bool security_extn;
     bool force_8bit_prio;
     bool irq_reset_nonsecure;
-- 
2.34.1

