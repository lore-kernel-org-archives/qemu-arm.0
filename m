Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2073571lfg;
        Mon, 23 Aug 2021 10:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW4XiX6CUDdNKFU+CtkBG0TzZUrHhF7IO8Iv2iiRgr9GjNNXhxK9imGHQuFGUes1sXZ9vQ
X-Received: by 2002:a6b:f919:: with SMTP id j25mr28423526iog.2.1629740481654;
        Mon, 23 Aug 2021 10:41:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629740481; cv=pass;
        d=google.com; s=arc-20160816;
        b=IidV4SzxfI73PT/u324Sr2JE9ZcFv9UrUVie4Epv+ad71oL066yMHfmGJrteFu//PH
         Dg/UPVA8c7Z0mRy8VQ3zyG7HsNHcmpXbGfb7q8PlVFXvT6zLYZ7wBCBeCOiL2RxaJBJ1
         qaMIw/jTLk94IEFdPtQcj3uPCqt5p9AqWHRhjzic7W9/+TDZVa9I9f8v3JtyGHFbDZ88
         lFnKWpn+zMwkChVUbIezd9aZ1nXVxXBjJF7LGyxfuK/ptSBJNXRhpdJSkLhNnT0v5ndn
         QGLTEMH2vNxD44qyUgjD4IsILIH8K1oS4XrwnOLl7BsUpkw6sfSTSXeKOEB3YpymWQhL
         LB/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=72ivKOLNd+udtGEHNOqwnEyegz8NasPXRnfXRh6aeN4=;
        b=T7qKQCu6sECgDf7ncVSF4oCO9Llygxd/5r54bFcoKnjsJcapagjDPyuiuIZ+mZRg2k
         xlE8gtDZBvmRGPkpgR/wfnAt1xdopTOA4omxXm1jhoTSqmXB10aNGINR774tt6/JIYfT
         3K1JzD+H7uoM1u6gblXoGTYrl5S8wNQYg1YzVqgZsDQGkBMvVSwXA18way+yS0GHA3Ah
         9/UilGO2aFnE7TrXplE2KxkckstG0JYKxvcc8mVZ56GsZaxvrPwzcXx3vH9X6jI0Qq77
         Z+htlujoDsnUSljgJADJxJtha8mDHymwGp+jc7yXT4w1iO+c17HrwBXxOH9zWvpHXn0B
         YfQA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=OpDyaj7l;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si16514126ilt.16.2021.08.23.10.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 10:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=OpDyaj7l;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIDwm-0000Ji-VX
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 13:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIDu4-0006Ro-66; Mon, 23 Aug 2021 13:38:32 -0400
Received: from mail-bn8nam11on2076.outbound.protection.outlook.com
 ([40.107.236.76]:9761 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIDu1-0001yE-5z; Mon, 23 Aug 2021 13:38:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSUzzWoqTC1QLfcmuvLtf419JjxIEzVF9gUgFi5ZTFDI+Fvkfk4yFo1ZW7eo1rVtKvlyKsvV1sfLhSiesNhl+a3My5tyGpmUXILMSFQ6VmTNHgADGynib/ca7N7ps5F9UZ1ixx8R+srpbMUEFWxR1nXNWIWF4a5y7slkdMXUdfiH6TOuyk/cSSSUpu8aRTQXwj/4e0qTAYtWPHIzSZ6K3oACYuXOv37Ssv58870yBiT5MkmGXDycy9RtgWbdLbqy6sUDTyy0K4dOzPdeGdr64p5FzI7IQXCxRCw9DprQJG/ekS6oeJPSU09poZ+73554IlsGbEdP7TWikxn4T8Zhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72ivKOLNd+udtGEHNOqwnEyegz8NasPXRnfXRh6aeN4=;
 b=I+cuxQm5m7i4lnan77qWSsEG+6FddkOGr4hQIOhIU/67ZWUg8A+weoyWznFHq7oeqo4cyygpazbYLOi4kQqfTZRNmAlAynUVJhae1o9YLdcjyhZGX3WWfShlPTdwzyo01aGasVJVpcfF/cVmOhV9GM95y2abTUC3m+eoE1BPKt6NrQUbSUQPRkUfTZEL8JBqFhUpsZDz2aOUsPgEvu1RYaoDX+WEDuM/xLyU7eHoLldOrNIfPVM5wftySyQyvr7cB8zSrF6YjSYbOwt/jm//1bEsZ8smfLBsPi9PO9SbYQHMOjJIr7TZ2aHNmg8yXSgKMBoSnaNZuh7gC5sLZNFa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72ivKOLNd+udtGEHNOqwnEyegz8NasPXRnfXRh6aeN4=;
 b=OpDyaj7li3bhUWglruQsYEp0bBKoEMCLFec7bXkJDrChfteGSl7FMKMFxN4TAoODXqUedb7H3qDmSGhTal+TYDA9ZQn4Wia0p8X71dkyMvdGFPjHqqQoek+8jFlkXBI1L86d3pa3kHV+TBx5bpi478nGFheI4+1xwznI/lKgUmU=
Received: from SN2PR01CA0056.prod.exchangelabs.com (2603:10b6:800::24) by
 SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Mon, 23 Aug 2021 17:38:21 +0000
Received: from SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::55) by SN2PR01CA0056.outlook.office365.com
 (2603:10b6:800::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0052.mail.protection.outlook.com (10.97.5.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:38:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:38:19 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:38:19 -0700
Received: from [172.19.2.40] (port=46968 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIDtq-0006Cc-W2; Mon, 23 Aug 2021 10:38:19 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [Patch v2 2/2] hw/arm/xlnx-zynqmp: Add unimplemented APU mmio
Date: Mon, 23 Aug 2021 10:38:18 -0700
Message-ID: <20210823173818.201259-3-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823173818.201259-1-tong.ho@xilinx.com>
References: <20210823173818.201259-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e98570d-68a1-4dcf-dae3-08d9665cccef
X-MS-TrafficTypeDiagnostic: SN1PR02MB3822:
X-Microsoft-Antispam-PRVS: <SN1PR02MB3822D4442A46E59986565F65CDC49@SN1PR02MB3822.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fI80m8t7JdlXL7tEJXy4yNjxAUjR0EgJXpodvkhlQvZ4OrFpgxxDC4ESeVe3x1vIbbHULK/RoxPgwNmqd83LZsrKI0m4E18rvtJ1JtxLbcbQt6Ew4WrlCQyQTMlEh6vJsQ4RkeNmZgqDM9spdb44vpg8eY1JWVjKEOwfqEI++W7WQ59/lbKL1awF0Cn3Vj+QtMgYP8y/2qPtd0BOTgV2SiMYAcItJIN70hlvdp0bzL1PSikPxlDO5UN116AKR/NZQulhhqVJ56/lLoPh2SoUaRSf3IvZpCiOoZAMhsQs3tVWGSAS2t+jclKueX4zyiebKoP0I2YUnx2HMGSL0i6BzBki8VVYSm5mkSF0qrn6ynLy4r22BV3clDbjw+81r+P2WcaLKuthQi3+gRUq/9idE+kK4GqlmmUINLVzpCGOnOoHlpOvSxc7X3y1p9p7PdOnELrbKDp0Sv5pxMtgRiFOremqphjUgD4gyosiq9JYHsO4eD/Eq44aoKFToMWgd7X7JDgSlRWDMM/f8Os99VjT1JhlQSZsirhNVMgiFe0LkqWzI1S2aLkuzTbqnqGrSw4IgAp3QjoWaMHuPZqqVWptZymwI85wU/2k49cfflquVS7ThC5S6065nrgBNtrFsyNxYKIvwO46zsCRY1S0qpy+5fpuOV2+csXdUWq/6A9VUho16MmlthVKisrKBgyhJsuKEkrj3JL9osbEUgwJ6vFKqrVnbh42VJWEQUrXYGXkMwzOlEe/j3OfVx/Ajn1SzpHha9Nz1beqdN+pIQDPYcQ+zJGGekyjdB55aCmFswdnxNTPNGSI4VM5/yO4kY67geEnIz9Fi/Z/HeHTpeqInn8T/WYrUv2JcmNB2mGn7Ptt34=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6916009)(70206006)(36860700001)(82310400003)(966005)(2906002)(316002)(186003)(70586007)(356005)(54906003)(36906005)(8936002)(36756003)(7636003)(8676002)(7696005)(44832011)(5660300002)(508600001)(2616005)(1076003)(336012)(83380400001)(47076005)(26005)(4326008)(9786002)(426003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:38:21.0121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e98570d-68a1-4dcf-dae3-08d9665cccef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3822
Received-SPF: pass client-ip=40.107.236.76; envelope-from=tongh@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, alistair@alistair23.me, qemu-devel@nongnu.org,
 philippe.mathieu.daude@gmail.com, edgar.iglesias@gmail.com, tong.ho@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73GvGDP5awk8

Add unimplemented APU mmio region to xlnx-zynqmp for booting
bare-metal guests built with standalone bsp, which access the
region from one of the following places:
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/armclang/boot.S#L139
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/gcc/boot.S#L183

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  7 +++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3597e8db4d..fb70204662 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -20,6 +20,7 @@
 #include "qemu/module.h"
 #include "hw/arm/xlnx-zynqmp.h"
 #include "hw/intc/arm_gic_common.h"
+#include "hw/misc/unimp.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
@@ -56,6 +57,9 @@
 #define DPDMA_ADDR          0xfd4c0000
 #define DPDMA_IRQ           116
 
+#define APU_ADDR            0xfd5c0000
+#define APU_SIZE            0x100
+
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
@@ -222,6 +226,32 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
     qdev_realize(DEVICE(&s->rpu_cluster), NULL, &error_fatal);
 }
 
+static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
+{
+    static const struct UnimpInfo {
+        const char *name;
+        hwaddr base;
+        hwaddr size;
+    } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
+        { .name = "apu", APU_ADDR, APU_SIZE },
+    };
+    unsigned int nr;
+
+    for (nr = 0; nr < ARRAY_SIZE(unimp_areas); nr++) {
+        const struct UnimpInfo *info = &unimp_areas[nr];
+        DeviceState *dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+        assert(info->name && info->base && info->size > 0);
+        qdev_prop_set_string(dev, "name", info->name);
+        qdev_prop_set_uint64(dev, "size", info->size);
+        object_property_add_child(OBJECT(s), info->name, OBJECT(dev));
+
+        sysbus_realize_and_unref(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, info->base);
+    }
+}
+
 static void xlnx_zynqmp_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -616,6 +646,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
+    xlnx_zynqmp_create_unimp_mmio(s);
+
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
         if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
                                       errp)) {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index d3e2ef97f6..c84fe15996 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -79,6 +79,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
                                   XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
 
+/*
+ * Unimplemented mmio regions needed to boot some images.
+ */
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
+
 struct XlnxZynqMPState {
     /*< private >*/
     DeviceState parent_obj;
@@ -96,6 +101,8 @@ struct XlnxZynqMPState {
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
 
+    MemoryRegion mr_unimp[XLNX_ZYNQMP_NUM_UNIMP_AREAS];
+
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
     XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
-- 
2.25.1

