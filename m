Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp113402ejc;
        Mon, 4 Mar 2024 23:10:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9HnrcXLgsaC8xEQfQ3Yxb1WM+MTU4gO360V7UmpxA2ZiXiV2qRUxjPBTr/Jl+4EJECI/SerhZmQUWujmXm0joAkdY88dp
X-Google-Smtp-Source: AGHT+IG4hxBOBCHIAmR3cLTGFfwTJGl0SnyiO4kaqUgOpuUUiXWfVcPRVBqZyWC9oVUzyowzBviK
X-Received: by 2002:a0c:f507:0:b0:690:488f:d8e5 with SMTP id j7-20020a0cf507000000b00690488fd8e5mr1080424qvm.18.1709622608638;
        Mon, 04 Mar 2024 23:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622608; cv=none;
        d=google.com; s=arc-20160816;
        b=cKrSCB5qv5q2DRgGgrcBz/aVN/IXjpWQ2Ra0/P6GCWTIdYdvi93PDOyRq6TXQPekIw
         Rh0F3b/5Io6L7mT13IAQB1fQX3iW81BFoc/tu+vdJzFA9GYoaYOG/mtbdKsdNWTZyfL5
         7uF2D5gddG1yPBBv3OaQc2bPhU1Vl21/FtROkE1HiUBzKAPPdtfSuV328018SlWbMaR0
         dQySWl49nmM67zYhyz4Nv6A8v4HAzB8Dh9Y2I5WKJiR29u7leaDCgo8IUeTEOixFcW0p
         g1bcVaWoXHVxynWrPq3g6W3gGQ7Wdp+ksLVmuHxZ4F6nniIf2I5/TNLBtO7VRFGgMgSX
         QErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=DYdBcRTFVKdV17vpdL00pZLwPYPXQvdZfVh1xwk1UAo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=0A19wCRJi4WSFD0aaaTfFILVy2kTDmAJt4mTDCuK7ZBSEREwB8K80nDjOoG145HZGR
         V1CVJyG8m94e+y9eDfSz45Kx01AE5H1mALxrx0PAMCACRnMfT61bfafiYHFog1XIvQiD
         mTQ8hkNmPMLPN0wO2SJ7rEk2HoFVoseBm1kYwsit+203YpJsUol8QXxEuRandxyp3J70
         IpLOKBo3STdOoMIjjvIBHIOgTqdRaCGln41WGtPiclVhrylwPv3iDBgQDYDJDavhnS9g
         +kWxzIfS5Lh3LywLMa/uvEZlSamWBDDg+KDK7KwgmelDuMuWq5CjWnTVn/UIGzHgYyZ3
         vt9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk11-20020a056214508b00b0068fb7e2785bsi11892630qvb.319.2024.03.04.23.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:10:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOtN-000786-Oh; Tue, 05 Mar 2024 02:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOri-0004TQ-4m; Tue, 05 Mar 2024 02:05:30 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrg-00008L-Fz; Tue, 05 Mar 2024 02:05:29 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Tpml30DlYz1vw5r;
 Tue,  5 Mar 2024 15:04:15 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id B568D14037E;
 Tue,  5 Mar 2024 15:04:54 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:54 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 23/23] hw/arm/virt: Add FEAT_GICv3_NMI feature support
 in virt GIC
Date: Tue, 5 Mar 2024 07:03:31 +0000
Message-ID: <20240305070331.2151131-24-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: f8mc4W4x0Rgq

A PE that implements FEAT_NMI and FEAT_GICv3 also implements
FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
FEAT_GICv3_NMI

So included support FEAT_GICv3_NMI feature as part of virt platform
GIC initialization if FEAT_NMI and FEAT_GICv3 supported.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4:
- Add Reviewed-by.
v3:
- Adjust to be the last after add FEAT_NMI to max.
- Check whether support FEAT_NMI and FEAT_GICv3 for FEAT_GICv3_NMI.
---
 hw/arm/virt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2d4a187fd5..c12307ccd9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -712,6 +712,19 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
+/*
+ * A PE that implements FEAT_NMI and FEAT_GICv3 also implements
+ * FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
+ * FEAT_GICv3_NMI.
+ */
+static bool gicv3_nmi_present(VirtMachineState *vms)
+{
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
+
+    return cpu_isar_feature(aa64_nmi, cpu) &&
+           (vms->gic_version != VIRT_GIC_VERSION_2);
+}
+
 static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -785,6 +798,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                               vms->virt);
         }
     }
+
+    if (gicv3_nmi_present(vms)) {
+        qdev_prop_set_bit(vms->gic, "has-nmi", true);
+    }
+
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
-- 
2.34.1

