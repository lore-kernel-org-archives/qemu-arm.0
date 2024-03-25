Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564333ejj;
        Mon, 25 Mar 2024 01:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUVMAI51Y7ddG+eUik4Ednv8PAx108uCGUjncw8e+mVP6ewjZuICNtLSeXomimrxyKK6Fo0ITpblgbB6PkbrH8cQ0NJPsv
X-Google-Smtp-Source: AGHT+IGugvzYtz8d/kYaKueGKMJY/HDOujYA9M1p/FaGG11T7njqrViJEqiR4VV0YgAc91KZPyye
X-Received: by 2002:a05:622a:15c6:b0:431:4890:26d9 with SMTP id d6-20020a05622a15c600b00431489026d9mr9239465qty.34.1711356827754;
        Mon, 25 Mar 2024 01:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356827; cv=none;
        d=google.com; s=arc-20160816;
        b=pM4C3ebxzKz13n0z3BVVaUEsr2c7mVOZsTFQbem1NdDY3h6QTt5tRCbSX0b1zQ3OtH
         aMtx2kmCJKK+cbrCd2/DBL/ptU2x3b7Q0zrFQZN0f0t16MTW1GEC+fu06fjPUA1bzAVU
         bh3o10XtFnmnbb0uAofytpMBku+uV0U6ZOgOfRSXBbmkWqA219Qy1/qelDFD58irwhNw
         RFdcfIe4ptsN1ZrVgmA9GEq4VAewkWgFpTUYMPiSdGAEYrs8Tm8CqJK/uj4L+wqzcDZw
         D/01NSZbciayNmOtwPzksqQSO8nT+jw3jLsm9m5IpEiF31UxiDfqbhW/Mhs3fiUq+rMH
         4kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=URye7WXe5stYLBKMDeBSiUd34ShQseJwDglCJV6y23E=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=IfEYcv5CquRIuoA8YZbPMXtegVJWRiUyLxY4Ft5Yw7XXxpm0ADaHRZfufvU1mQ/dl2
         qb7GmoC0IK/933rUV+pgo501xe8QTaCj4IQBOh0sazMfloMH9wm1GYT45WXL5OgRIViA
         vSvoshjEAvJCgzBD51FrmOnP547/RCvxHrPLdTc3T50RjsAEv2tbMZ9xOSMRxGTzHi6Q
         dMxuZSB4L0pZvyTPj0MAOAa7fOWW7SjAKpCGLWegsz4wFVyWHPBsZCPwDahHLNF25OGZ
         tpvxzyw7vsxl9NunwgOs6CIBu00P5/uiMNWAEMCQ/VbVvWZz2Cgm4bCNYhnDX64uyyiJ
         wbig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020ac85c8b000000b00431620882b5si227189qta.450.2024.03.25.01.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4D-0003B4-Hm; Mon, 25 Mar 2024 04:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3x-00031M-4P; Mon, 25 Mar 2024 04:52:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3q-0007Q4-2m; Mon, 25 Mar 2024 04:52:11 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V367R2PX4ztQgD;
 Mon, 25 Mar 2024 16:49:39 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id DE01A1402C7;
 Mon, 25 Mar 2024 16:52:01 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:52:01 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 14/23] hw/intc/arm_gicv3: Add irq non-maskable property
Date: Mon, 25 Mar 2024 08:48:45 +0000
Message-ID: <20240325084854.3010562-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: k/LNSee9aqAb

A SPI, PPI or SGI interrupt can have non-maskable property. So maintain
non-maskable property in PendingIrq and GICR/GICD. Since add new device
state, it also needs to be migrated, so also save NMI info in
vmstate_gicv3_cpu and vmstate_gicv3.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
v10:
- superprio -> nmi, gicr_isuperprio -> gicr_inmir0.
- Save NMI state in vmstate_gicv3_cpu and vmstate_gicv3.
- Update the commit message.
v3:
- Place this ahead of implement GICR_INMIR.
- Add Acked-by.
---
 hw/intc/arm_gicv3_common.c         | 44 ++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  4 +++
 2 files changed, 48 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 2d2cea6858..be76ae0be6 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -164,6 +164,24 @@ const VMStateDescription vmstate_gicv3_gicv4 = {
     }
 };
 
+static bool nmi_needed(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+    return cs->gic->nmi_support != 0;
+}
+
+static const VMStateDescription vmstate_gicv3_cpu_nmi = {
+    .name = "arm_gicv3_cpu/nmi",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = nmi_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32(gicr_inmir0, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3_cpu = {
     .name = "arm_gicv3_cpu",
     .version_id = 1,
@@ -197,6 +215,10 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         &vmstate_gicv3_cpu_sre_el1,
         &vmstate_gicv3_gicv4,
         NULL
+    },
+    .subsections = (const VMStateDescription * const []) {
+        &vmstate_gicv3_cpu_nmi,
+        NULL
     }
 };
 
@@ -238,6 +260,24 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
     }
 };
 
+static bool needed_nmi(void *opaque)
+{
+    GICv3State *cs = opaque;
+
+    return cs->nmi_support != 0;
+}
+
+const VMStateDescription vmstate_gicv3_gicd_nmi = {
+    .name = "arm_gicv3/gicd_nmi",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = needed_nmi,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(nmi, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
     .version_id = 1,
@@ -267,6 +307,10 @@ static const VMStateDescription vmstate_gicv3 = {
     .subsections = (const VMStateDescription * const []) {
         &vmstate_gicv3_gicd_no_migration_shift_bug,
         NULL
+    },
+    .subsections = (const VMStateDescription * const []) {
+        &vmstate_gicv3_gicd_nmi,
+        NULL
     }
 };
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 4358c5319c..88533749eb 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -146,6 +146,7 @@ typedef struct {
     int irq;
     uint8_t prio;
     int grp;
+    bool nmi;
 } PendingIrq;
 
 struct GICv3CPUState {
@@ -172,6 +173,7 @@ struct GICv3CPUState {
     uint32_t gicr_ienabler0;
     uint32_t gicr_ipendr0;
     uint32_t gicr_iactiver0;
+    uint32_t gicr_inmir0;
     uint32_t edge_trigger; /* ICFGR0 and ICFGR1 even bits */
     uint32_t gicr_igrpmodr0;
     uint32_t gicr_nsacr;
@@ -275,6 +277,7 @@ struct GICv3State {
     GIC_DECLARE_BITMAP(active);       /* GICD_ISACTIVER */
     GIC_DECLARE_BITMAP(level);        /* Current level */
     GIC_DECLARE_BITMAP(edge_trigger); /* GICD_ICFGR even bits */
+    GIC_DECLARE_BITMAP(nmi);          /* GICD_INMIR */
     uint8_t gicd_ipriority[GICV3_MAXIRQ];
     uint64_t gicd_irouter[GICV3_MAXIRQ];
     /* Cached information: pointer to the cpu i/f for the CPUs specified
@@ -314,6 +317,7 @@ GICV3_BITMAP_ACCESSORS(pending)
 GICV3_BITMAP_ACCESSORS(active)
 GICV3_BITMAP_ACCESSORS(level)
 GICV3_BITMAP_ACCESSORS(edge_trigger)
+GICV3_BITMAP_ACCESSORS(nmi)
 
 #define TYPE_ARM_GICV3_COMMON "arm-gicv3-common"
 typedef struct ARMGICv3CommonClass ARMGICv3CommonClass;
-- 
2.34.1

