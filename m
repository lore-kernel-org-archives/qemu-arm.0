Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp373575eja;
        Thu, 29 Feb 2024 05:12:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0rxjoKFxD3Us2Bbn44pfZexEh+Pb70S1bauVswRxFg/Madi3e/XsNOszwfHT4cNPo2PUnOaZXSLsllQttGeNwQKPNsbFm
X-Google-Smtp-Source: AGHT+IEpYLzwaXbljRCWkba4QuxGFCJPA2HnNDnk+3BUFnbWg64St0SrH6g9hhMVOcGENyGBsVMj
X-Received: by 2002:a05:622a:1496:b0:42e:bb5a:2971 with SMTP id t22-20020a05622a149600b0042ebb5a2971mr1652836qtx.7.1709212345422;
        Thu, 29 Feb 2024 05:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212345; cv=none;
        d=google.com; s=arc-20160816;
        b=O6Zurnt602a4RWVwljyoA7da41oHE/DWur6KTr4a1vp17AHH1xJAIXdciCPm/fAP4U
         kllTsp9dxvA1RDzCruyA4jNYqXfJD8kfk65kJr49P1IhzC+q1DJkdg0UoeaW4WSFFBwV
         X5qkiArKADZlNHaA63l/H40HSRGO7yH8vO0/JzQpxcZ8J3Hiz+FIoEIA+msvsCmR7OB8
         goyf1RVRudW6cUGNNExA39yWr82nTbzFrSGRnVTJPh9c7uBgjw/sNlflKdIqZtjZpB+3
         jT3SuC78RVhYBncAFAvEPCVg6dcKFVw7wos6JloEL6ZObym9WczaHkWlW99RRp6SntFr
         /TuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=N7dNHg4L9Q68SYDEhK0V1aLQiJifq6PDJwZf1ikrAYk=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=UaWtOx3Rcm3fY78AaU7LhCWZ7gxH/T5f38ltzflBc8Ew4U0/x2uTXIRNstphoVWRS5
         6pbUSgjV7LXQK4kt4ECbrZ7i7rEzEOSgV8CTrYmgxH8iuNCXxPwbEUduyXDW3FrmVv5e
         GaGIQdauFOqwcrXWEw4ZYmp1pqv8T4vWNg13jj6PSQG4NVLCRqMXRXZ0QEBQw6V0gCfR
         fSA4CpIsbe9EN8hAf8WKG6Zt05y9KnrGuaU/uFrJ28/hvnV4VdxtjIry3B6iLBI+LHUP
         d/Cm1rKVAdzNn0WP/IEP5AQsAQnsdQzGgarEmAnlipaPE56LN4mUpoYcxuNGSgo4qLn4
         dhyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020ac87094000000b0042ebc760378si857916qto.477.2024.02.29.05.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfgCw-0005qj-SX; Thu, 29 Feb 2024 08:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCe-0005fW-6p; Thu, 29 Feb 2024 08:12:00 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCc-0002gI-7e; Thu, 29 Feb 2024 08:11:59 -0500
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Tls5S4Dtsz1Q99P;
 Thu, 29 Feb 2024 21:10:04 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 909391400DC;
 Thu, 29 Feb 2024 21:11:54 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:54 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 16/22] hw/intc: Enable FEAT_GICv3_NMI Feature
Date: Thu, 29 Feb 2024 13:10:33 +0000
Message-ID: <20240229131039.1868904-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
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
X-TUID: QNUv3+AdtahV

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

