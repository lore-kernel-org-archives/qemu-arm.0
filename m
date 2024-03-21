Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp489163ejv;
        Thu, 21 Mar 2024 06:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0LEEmDTjTyzGapUqZT1nbrNz0zKSgqYvt8zCg7Sbto+mIVta/2gDd6CwoCcUBRl+2ZDzH3ig5JLRIrLGv3CdAlrUlVkW+
X-Google-Smtp-Source: AGHT+IFdB1gIVPJZy/aposvvlE4oHQYe2O4EytGe2rQjP/jyI28nRaEz55q8wTnWWLh4XX5PcPbX
X-Received: by 2002:a05:620a:16a1:b0:789:ecd5:5c7d with SMTP id s1-20020a05620a16a100b00789ecd55c7dmr5094949qkj.68.1711026656486;
        Thu, 21 Mar 2024 06:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026656; cv=none;
        d=google.com; s=arc-20160816;
        b=KXrRrDdYeXqpfzaSwaiMW3JN9/7Cf5O0Lgdy+E5E+51ObHolLUn4p5L5Fwerw1WgY9
         sZIOyz6bt9gpe9lEbCxsxRlIrC3Y0L+oe5BTu2QujoogZ1OxQRvtvXY2lW7K06fRomQj
         ep9dD8lp1/SGNoWu4JURPmeQ7HlkXMAan8c2O/6x1Pz0SwF6aL0bp0HUrer70kocL39B
         5aD4xFgKA0xfcOWJZo/HMbmfrmRLkhdj436dR7JsHxjF6M3n0OlQZom+uhselkkSXC4z
         Q2GG+1PFRmXN8MHFMV5MZmV7qOvoPaRbC02l3bE+5S0lkYcKtpGB8R0pQihMZ2aBYJSt
         jyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=N7dNHg4L9Q68SYDEhK0V1aLQiJifq6PDJwZf1ikrAYk=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=qxyBufKYO0OHMqs3vhcgMNs07kQoAwbD6SBk5fdaZgeSRMMknLQVfxxtkjK/jRVUqX
         CSoLq17wiaPWRamtO4hBrGljKOKGlUFNV100j8gI6qMPHsQYUyfFSdWW5MWcpJ6bqqpt
         bpaSAN0nWH/3s7jcdoWRQED0IWf9fxGpoY+OXT4AgeDJ+1Jc8I3Azs/rK/6zO+gzPf4L
         Qp7Z2w+kWbkavxrXSrorU+lflklQ1ZyMK5vnIHrZ5YS2/5lBou0H1g+DYATE4lbOHrdm
         8YtTZx4cKVzdC1kCtKrwjLd+5XwyV2FsLorp0PvEULwKA0QRxus7+I2L6qfZnOIRiY5W
         gbww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa27-20020a05620a831b00b0078a08f0c3basi6872492qkn.150.2024.03.21.06.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rnIAz-0007Gt-J3; Thu, 21 Mar 2024 09:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAx-0007F4-RH; Thu, 21 Mar 2024 09:09:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAv-0002tg-NZ; Thu, 21 Mar 2024 09:09:43 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V0m2H41nwz2Bgj1;
 Thu, 21 Mar 2024 21:07:03 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id E94361A0172;
 Thu, 21 Mar 2024 21:09:37 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:37 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 16/23] hw/intc: Enable FEAT_GICv3_NMI Feature
Date: Thu, 21 Mar 2024 13:08:05 +0000
Message-ID: <20240321130812.2983113-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: W3s6hTAX8Phw

Added properties to enable FEAT_GICv3_NMI feature, setup distributor
and redistributor registers to indicate NMI support.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
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
index 9739404e35..c4e28d209a 100644
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
index df4380141d..16c5fa7256 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -251,6 +251,7 @@ struct GICv3State {
     uint32_t num_irq;
     uint32_t revision;
     bool lpi_enable;
+    bool nmi_support;
     bool security_extn;
     bool force_8bit_prio;
     bool irq_reset_nonsecure;
-- 
2.34.1

