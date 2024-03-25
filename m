Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564356ejj;
        Mon, 25 Mar 2024 01:53:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUX6UtAfHD430av1jtGGPT2dG9CMW7xoMElfKjq0+j3ZSIFIagRyAt5U21jClVuKxHuk0oryMBQFFvejUl2SeHdObKvASI9
X-Google-Smtp-Source: AGHT+IELXhcN2UAknm5KMBc8VWuaKB5ihtH9L6BAakoV+7YiK5ZiYIwUTH/jkBniYHJqQYRShXNF
X-Received: by 2002:a05:620a:36c7:b0:788:7583:7647 with SMTP id cz7-20020a05620a36c700b0078875837647mr5732334qkb.69.1711356832475;
        Mon, 25 Mar 2024 01:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356832; cv=none;
        d=google.com; s=arc-20160816;
        b=S200/uhqxqlJlTvNah7pWT2fVy7a4VXaYiortn5lGo7XVezJRsmLH0T74kuDDRa+i9
         lpAKn68gAGONKdKb4gbYN6uD7UjHkoIEwPuzCJZUsvEU5AzR5v77AUwCjVqzfaEm6ZxR
         vDBWaYiXXxz7C7oRaf5TaAE7HD55RCLOB1LFD8tkLuPCTL6HgDzBa8FiZWiA0h7Gh+Yu
         9NXT48/skembFBS95jPgSUxMR6YVJrmBQY7fZ+5Dol0D/zWPgJxcKwvyUkFX82IghuCl
         UBHAM+16KSdY0cOVEjWjhTkpzlBu216se2BOZQ69qhL/YpJuKdRzs4V+bC3cZNvokG4f
         ts9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/39MLRYyia71qkZSYr0cs1jEB7hZuawoRtnqAdUipww=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=zoVeU+u6hLajWsfFsISoR7tcyZNCNH2+/D4fAevoymLK0CvLra4H3XF+dMELdgQ8P6
         ICPAymzue6PSxlyapF2//aXvHX+J2NDBpBst5JJyDhLRm5zq9OnAU4YTjnGDZBLCByWW
         DsRG61VpuVIlqZAeDxsiADF4PSS5vS0Rm+eJdEpFVyV20qTwS3xH+qS6VxiTyV9RHZUO
         8ahmlLA/NrnRM8La3QBnShs8HQ0yOZqVzaRInZidap7i5vU9JqxAWvjriTd4c+5815GX
         obQQRsJYvERwGkFFEKDU0lb+mCk47xx8/w3ANnrB4mz4vlMWSoR6Es5OdnBbPPY2Zzai
         +pjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4-20020a05620a260400b0078a57c1d0bfsi1479548qko.674.2024.03.25.01.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4S-0003GU-N8; Mon, 25 Mar 2024 04:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog41-00034v-JE; Mon, 25 Mar 2024 04:52:19 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3q-0007Pf-Rd; Mon, 25 Mar 2024 04:52:16 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V367726QYz2Bhcx;
 Mon, 25 Mar 2024 16:49:23 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 072131A0172;
 Mon, 25 Mar 2024 16:52:01 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:52:00 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 13/23] hw/intc: Enable FEAT_GICv3_NMI Feature
Date: Mon, 25 Mar 2024 08:48:44 +0000
Message-ID: <20240325084854.3010562-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kGe87arcVJd3

Added properties to enable FEAT_GICv3_NMI feature, setup distributor
and redistributor registers to indicate NMI support.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v10:
- Adjust to before add irq non-maskable property.
v4:
- Add Reviewed-by.
---
 hw/intc/arm_gicv3_common.c         | 1 +
 hw/intc/arm_gicv3_dist.c           | 2 ++
 hw/intc/gicv3_internal.h           | 1 +
 include/hw/intc/arm_gicv3_common.h | 1 +
 4 files changed, 5 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index c52f060026..2d2cea6858 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -569,6 +569,7 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
+    DEFINE_PROP_BOOL("has-nmi", GICv3State, nmi_support, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     /*
      * Compatibility property: force 8 bits of physical priority, even
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 35e850685c..22ddc0d666 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -389,6 +389,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          *                      by GICD_TYPER.IDbits)
          * MBIS == 0 (message-based SPIs not supported)
          * SecurityExtn == 1 if security extns supported
+         * NMI = 1 if Non-maskable interrupt property is supported
          * CPUNumber == 0 since for us ARE is always 1
          * ITLinesNumber == (((max SPI IntID + 1) / 32) - 1)
          */
@@ -402,6 +403,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
         bool dvis = s->revision >= 4;
 
         *data = (1 << 25) | (1 << 24) | (dvis << 18) | (sec_extn << 10) |
+            (s->nmi_support << GICD_TYPER_NMI_SHIFT) |
             (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
             (0xf << 19) | itlinesnumber;
         return true;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 29d5cdc1b6..8f4ebed2f4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,6 +68,7 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_NMI_SHIFT           9
 #define GICD_TYPER_LPIS_SHIFT          17
 
 /* 16 bits EventId */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 7324c7d983..4358c5319c 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -249,6 +249,7 @@ struct GICv3State {
     uint32_t num_irq;
     uint32_t revision;
     bool lpi_enable;
+    bool nmi_support;
     bool security_extn;
     bool force_8bit_prio;
     bool irq_reset_nonsecure;
-- 
2.34.1

