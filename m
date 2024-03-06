Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272292ejb;
        Tue, 5 Mar 2024 19:59:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVnpF1QTGPhofcmE28wfHbnMLXIfY4K+thQI/KYZcmuyM+KyQ4GFk2/chobQoh9ELRSHPW/rfualRT57SsctjY9/NBWj8xK
X-Google-Smtp-Source: AGHT+IFyGmqnz/cxDzm9jMRylaRCYX4Wb8qqPMg4KFlDfItjt7CD36+NXjEbUuSf1Y3Pa+nIX730
X-Received: by 2002:a05:620a:310:b0:787:4e45:cc18 with SMTP id s16-20020a05620a031000b007874e45cc18mr3525643qkm.65.1709697544097;
        Tue, 05 Mar 2024 19:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697544; cv=none;
        d=google.com; s=arc-20160816;
        b=0JSEfLA/wHv0TjRo7VRf3kVpwM/VAqOi3ofdTYiUGaS68Sy2RPwPt3Zkpl8e7dh1TK
         sRpGFGfnRoGrez9lDLo11H5UpJSVESpqu18bkCJVKDMf4Yq1v/n+xelrS5oNcEAqObG1
         FA7nUOLjx02I5Pz9vT3BcJS4+9bUcuQryVOB61QRjmy/rkvnESRp3jFirdw11qUnLlHa
         GCpbvuVI8DIcYQfm2NrCSTXC75kCFnoJpVy7qvu6vmEAB4eBd3o1/b56MUYl/7Az9BVN
         a6uM4jlNb02ENIG/HPPFpUJ9B7R7JKgvNHA0M1RlllT0qKHWBdwv8w5M26lrsaBSAGuV
         uCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=DYdBcRTFVKdV17vpdL00pZLwPYPXQvdZfVh1xwk1UAo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=JixiYtbTGGWAr+g7O8EJIU//vhXJ4gHF70s2EuMR8gWcBEFJ5IwkoRgCBsoVCdO3r4
         GQqj8hZ5Duh8rz9V6sRLvG5eDJBPBDq5moBA5XJ+XYwICWoqKYY2dlwcD35IInBpsbVn
         uSZGdolTxmgDr0QGv8kKR9ryAqtIS0z6dWoKlyp4e3ZIIOKjsgIHEcuY3H/gU2iJmg7E
         BmalEKOFbEBgY4OuZawaLTzz9CuRgpNwp6HDnEv+nXlIeu1/jU6uDckWSNjK3+B+ib0j
         h3ObdBNUAc5g36CuTsoYviOADPVP28uQcTRWEpy/GtBhjER2WL1UL3Swhu4IsfuaKD2l
         iaZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23-20020a05622a181700b0042ef7f714ccsi5004701qtc.3.2024.03.05.19.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 19:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhiQg-0001B5-Un; Tue, 05 Mar 2024 22:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQd-00013n-Fe; Tue, 05 Mar 2024 22:58:51 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQb-0006pN-MY; Tue, 05 Mar 2024 22:58:51 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TqJZR1PZcz1FLpS;
 Wed,  6 Mar 2024 11:58:39 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id F3E041400E8;
 Wed,  6 Mar 2024 11:58:46 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:46 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 23/23] hw/arm/virt: Add FEAT_GICv3_NMI feature support
 in virt GIC
Date: Wed, 6 Mar 2024 03:57:21 +0000
Message-ID: <20240306035721.2333531-24-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VGUlWby3IFGB

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

