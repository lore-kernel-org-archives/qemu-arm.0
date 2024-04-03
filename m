Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484171ejv;
        Wed, 3 Apr 2024 03:18:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXhflaO+KBh6Q6FMwwnIt27r3nueeoyDflvTAEiRlz5nB9jlIL4NviRYugZpdKCjN5cd5YL6GVInblHS7gLVPsyBkkF7BA
X-Google-Smtp-Source: AGHT+IHm/GrWyFBD+ZsT4r7qotFBlA9VNhXhG+uHM55ZKvjKJN0EBsPojjxq0CtPuXrCctdGoVZg
X-Received: by 2002:a0c:f305:0:b0:699:26bb:aa6f with SMTP id j5-20020a0cf305000000b0069926bbaa6fmr1471292qvl.49.1712139525050;
        Wed, 03 Apr 2024 03:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139525; cv=none;
        d=google.com; s=arc-20160816;
        b=SUfjTGeGTCi/Gn+HSlThYTXqEHmiUxcw0MOsaB5k+FrRjOOt+7VR/yZjWfoje1tggV
         UKS5FRfFFwiABZ84CLzcMgf3dZYibqQm5NCxTMHDzGHb4BJb8wgExXJ3R5NxXj6HrtWb
         6RkDak+2RMxivYd4yv1RzEgjyvNS9OK09OQAfYlmEbHvD89O3kPwt4X39qPeAoHOUCvv
         P9BfKm5Z0iaElDJa/c/dibhhOaecye+/E214O1LTHfA9EJQK5RWLdRXiPuZUGFsFmedd
         EOxqnRveRQ50XuFqQ+uUF4zdNz7ZQrC5uFNM+8Klz1FWmJn31NV1jAYv2OhgwAaHpHkf
         s17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=17u46GjXNuFpLUttXxJef1xJGuKlRKEBj+2XZG42ekQ=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=ZDhb3DMY6HFoEUn7WwGOEBagQcCW89kfN7L6TpPvZvmJr9r7TkjhQpVJjqVXTsSXmY
         OmJuhAOOJx9n+fNKwc/ZZlK+NoNeoFZzrfnHh0kHKpoPcIy+XvcD7waei5PfDSyukrZL
         2rdR+w3Pt2+f+KgyUWYqSUdUOycw5c5mcBWvCfwjjiuPPB56yLu0S2/SljAvvHKtHo6U
         ipTvdPPidohSRn3p4JH0Sxr2aZkq/6sXLMCu0PejeC/19B0vnLxm4w+7FvgOLR1Mq/5L
         kBCTSQW/yLDyWmemgxq0TJsF+T01EtiJFjKmK2TarRXqFm51O1LDttvoqBY29AAygTXc
         2gWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a0cdc04000000b0069928b2d538si800408qvk.550.2024.04.03.03.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxh2-0000wu-Vt; Wed, 03 Apr 2024 06:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgt-0000qE-Eg; Wed, 03 Apr 2024 06:17:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgn-0006dm-C2; Wed, 03 Apr 2024 06:17:58 -0400
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8gfJ24HKz1GFkS;
 Wed,  3 Apr 2024 18:17:12 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id B73ED1400D3;
 Wed,  3 Apr 2024 18:17:50 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:50 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 13/23] hw/intc/arm_gicv3: Add has-nmi property to GICv3
 device
Date: Wed, 3 Apr 2024 10:16:01 +0000
Message-ID: <20240403101611.3204086-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: WhFagJWCRtl3

Add a property has-nmi to the GICv3 device, and use this to set
the NMI bit in the GICD_TYPER register. This isn't visible to
guests yet because the property defaults to false and we won't
set it in the board code until we've landed all of the changes
needed to implement FEAT_GICV3_NMI.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v12:
- Update the subject and commit message.
- Add Reviewed-by.
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

