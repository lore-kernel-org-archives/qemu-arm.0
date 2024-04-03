Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4485330ejv;
        Wed, 3 Apr 2024 03:21:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwugtFTvUKFcVB1V3HGdB9nx7DbwFaLNXW//zSlgRNnMZMhRD3BAjydqEhYr0m9kokVDoXe9KJb1EzIZdxtQN9FrJqaJPW
X-Google-Smtp-Source: AGHT+IGRaIyqzsAfQcePTzNG4jAIQ1s8NscvYkhtmbIdzxlMGc/L2FBO9z5E8M8xAQc4j7XQ2OWc
X-Received: by 2002:a25:8110:0:b0:dd0:76e:d630 with SMTP id o16-20020a258110000000b00dd0076ed630mr11890776ybk.53.1712139680057;
        Wed, 03 Apr 2024 03:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139680; cv=none;
        d=google.com; s=arc-20160816;
        b=hWFxlTtmHV9uD/7P7MtafL3659oxiyU4aaw75hmcyHBQDNgTLIdeIf/IdtLTKS0G9t
         EKTghkuM8TwUyedZcrd5DsINHXKBguGOrMtQwiW6YnKqZs6qsq02yTeaQMTEMv5GP1IT
         7eArpTV7cZ7sHdggQKJXOIPiiE3xEBIZU1jO7PfEuV8M2ZfylayKyQ33iAz81nQJ3nBV
         ScX3C34oAx9XdREOZ2FFBXtJeWjbbh8ySpBQrNyOeTSZaDIq4IbJoFS3Oc2daHvQQTZI
         /Cle6z6up3mJgZCD+dH8mCIC+wzWL+FDy4p0qVrpJ/IDcP8fvsfrSn9Ug14dGSUtXe4y
         1y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=S8k5Y/Uoc54ka39NJo5eSMIde+zhZPfNg95zZFnAL0I=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=gZPlRw6f1pMfMVBg+ILOImphXW3fr+0ZylWaW+fawek59eAJRQsNT8EeBOgXmsKpH2
         zO40ktX++gfQusGhcjQ8eeS4agcua7DK2VKqUEL+V0Qy9OSoXAcVyRiQ4bSYS2Ns/58m
         UYFBSg3Urm1KTEFhfkGImQUiEadlwN9h3unlyBD4JbgLBlM80vA35O5bTzHV/ZSVzS0q
         dtb0gR0P9KIV+W8XesN+SuasyQV3BPmTS1z5N66rrRJj6HzTq7FEUx3CYo0P/Zw4x1rh
         PPYAsd7oqcKlfDw/GRJ1CcoLREPrf6gfePVUZ1ml9MUyj3vLSqYvkigcVJrgXm6i9zAe
         XvZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a13e500b0078be905f307si4951354qkl.660.2024.04.03.03.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxh0-0000uw-6n; Wed, 03 Apr 2024 06:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgs-0000op-PO; Wed, 03 Apr 2024 06:17:58 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgo-0006e4-3H; Wed, 03 Apr 2024 06:17:58 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8gbt0K8Jz1h5Vr;
 Wed,  3 Apr 2024 18:15:06 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 8E4651A016C;
 Wed,  3 Apr 2024 18:17:51 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:50 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 14/23] hw/intc/arm_gicv3: Add irq non-maskable property
Date: Wed, 3 Apr 2024 10:16:02 +0000
Message-ID: <20240403101611.3204086-15-ruanjinjie@huawei.com>
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
X-TUID: UAjx4eJUlVvl

A SPI, PPI or SGI interrupt can have non-maskable property. So maintain
non-maskable property in PendingIrq and GICR/GICD. Since add new device
state, it also needs to be migrated, so also save NMI info in
vmstate_gicv3_cpu and vmstate_gicv3.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v12:
- nmi_needed -> gicv3_cpu_nmi_needed.
- needed_nmi -> gicv3_nmi_needed.
- Add Reviewed-by.
v11:
- Put vmstate_gicv3_cpu_nmi and vmstate_gicv3_gicd_nmi into existing list.
- Remove the excess != 0.
v10:
- superprio -> nmi, gicr_isuperprio -> gicr_inmir0.
- Save NMI state in vmstate_gicv3_cpu and vmstate_gicv3.
- Update the commit message.
v3:
- Place this ahead of implement GICR_INMIR.
- Add Acked-by.
---
 hw/intc/arm_gicv3_common.c         | 38 ++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  4 ++++
 2 files changed, 42 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 2d2cea6858..9810558b07 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -164,6 +164,24 @@ const VMStateDescription vmstate_gicv3_gicv4 = {
     }
 };
 
+static bool gicv3_cpu_nmi_needed(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+    return cs->gic->nmi_support;
+}
+
+static const VMStateDescription vmstate_gicv3_cpu_nmi = {
+    .name = "arm_gicv3_cpu/nmi",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = gicv3_cpu_nmi_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32(gicr_inmir0, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3_cpu = {
     .name = "arm_gicv3_cpu",
     .version_id = 1,
@@ -196,6 +214,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         &vmstate_gicv3_cpu_virt,
         &vmstate_gicv3_cpu_sre_el1,
         &vmstate_gicv3_gicv4,
+        &vmstate_gicv3_cpu_nmi,
         NULL
     }
 };
@@ -238,6 +257,24 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
     }
 };
 
+static bool gicv3_nmi_needed(void *opaque)
+{
+    GICv3State *cs = opaque;
+
+    return cs->nmi_support;
+}
+
+const VMStateDescription vmstate_gicv3_gicd_nmi = {
+    .name = "arm_gicv3/gicd_nmi",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = gicv3_nmi_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(nmi, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
     .version_id = 1,
@@ -266,6 +303,7 @@ static const VMStateDescription vmstate_gicv3 = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_gicv3_gicd_no_migration_shift_bug,
+        &vmstate_gicv3_gicd_nmi,
         NULL
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

