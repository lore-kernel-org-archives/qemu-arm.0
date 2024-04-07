Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659924ejh;
        Sun, 7 Apr 2024 01:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1TjpMRgcFYWZeOrWQ5/iDMKKfUJUNWBZDscv0QGV364pYfKvW/N9yc0lMeeBYbyKGD2LbtzNJztukXlYoaGKsq3Zhw1HG
X-Google-Smtp-Source: AGHT+IGay03M2VMORVOIHKMOQkfodDRMdIrQCq2YEHGU6/tImStNZ1IcqdQSdO7BmlBrDF2qPoa7
X-Received: by 2002:a05:620a:2b9b:b0:78d:53bd:a0c5 with SMTP id dz27-20020a05620a2b9b00b0078d53bda0c5mr4606763qkb.61.1712478217384;
        Sun, 07 Apr 2024 01:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478217; cv=none;
        d=google.com; s=arc-20160816;
        b=VpsZHse/SiEsDQ9px7XeElcOoZTyax2BsYcac1C5gk4ru8UKKlu8hjws5/k6cd95sQ
         eTbe0WRqRbVXvusGfiyYR3pxsee/9Qk3kg1h4GYN+el3l9foOhBgjTx+BTerJbtArf9d
         f/xHputa7sCvxsF2Vp4MVnKXmwmAzOqWduQgJ4cAFSh/iCUSowTXG56Ibjw0DUgFPjQg
         9oChLZ99h7f/MAU1quEoSr7oAlENdNpzUUhMF7rynG50WsFaTcRVWBHARmL7kRlM+Iqy
         9dnuBKVoC2bvRfV117ZbqaQQa4CNUQBo+C8X22asEaUt73mldmQZWUuST60G+8n78puB
         xW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=5eGol9aDxzRuIPTJ4AV+Djt/y3IV6sZuZZKmuXJUzPU=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=czzNBidWLhNzJxzA6BprPXcIrYy7QPDwC4F28NytHuyQvwuaBQrLJCDpNbiSFCImlq
         i8H0gztTYfLe/VScpGmg19/keo57qhhaVfHYC9pty6xi0g1NyU8TCjODhOKONpT8ZiSc
         xp0y2R4mSq5V/gCcChvbf1SZ/gyIaWPFeSvm8PMxsr4qjxK2SwvSGJ/9xT0iUdyd0bQC
         XH886zVdec7BpPY+d/4z2cg1yDiZR8nQLxJ7TS7kPwrPn31e+LubBqoeoFhiTIdUk/mp
         oPdJ3GWNhXtZV2wLBsFMFKzz6k36/O3HQ4Z4soUXfs1Yj2eR0Zoz3yK4UZq+J8KPeFKE
         FXHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a05620a0b0200b0078d4c4b985csi4899004qkg.455.2024.04.07.01.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtNlL-0004XL-Cp; Sun, 07 Apr 2024 04:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNlA-0004Km-HG; Sun, 07 Apr 2024 04:20:19 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl7-0002Hg-M8; Sun, 07 Apr 2024 04:20:15 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VC4p60drkz29dNV;
 Sun,  7 Apr 2024 16:17:18 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 418041A0172;
 Sun,  7 Apr 2024 16:20:07 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:20:06 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 24/24] hw/arm/virt: Add FEAT_GICv3_NMI feature support in
 virt GIC
Date: Sun, 7 Apr 2024 08:17:33 +0000
Message-ID: <20240407081733.3231820-25-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
X-TUID: i3hBfQxu2xk7

FEAT_GICv3_NMI introduces GIC support for non-maskable interrupts (NMIs).
A PE that implements FEAT_NMI and FEAT_GICv3 also implements FEAT_GICv3_NMI.
A PE that does not implement FEAT_NMI, does not implement FEAT_GICv3_NMI.

So included support FEAT_GICv3_NMI feature as part of virt platform
GIC initialization if FEAT_NMI and FEAT_GICv3 supported.

And as Peter suggested, neither KVM nor hvf support FEAT_NMI yet, so add
tcg_enabled() to the condition. Defaulting QEMU to not trying to enable NMI
in the GIC device is the safe option. As and when those accelerators get NMI
support, we can add the handling to QEMU and update this code in the virt board.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Check tcg_enabled() for gicv3_nmi_present().
- Update the comment for gicv3_nmi_present().
- Update the commit message.
- Add Suggested-by.
v4:
- Add Reviewed-by.
v3:
- Adjust to be the last after add FEAT_NMI to max.
- Check whether support FEAT_NMI and FEAT_GICv3 for FEAT_GICv3_NMI.
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dca509d082..a8c9156b24 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -729,6 +729,18 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
+/*
+ * A PE that implements FEAT_NMI and FEAT_GICv3 also implements FEAT_GICv3_NMI.
+ * A PE that does not implement FEAT_NMI, does not implement FEAT_GICv3_NMI.
+ */
+static bool gicv3_nmi_present(VirtMachineState *vms)
+{
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
+
+    return tcg_enabled() && cpu_isar_feature(aa64_nmi, cpu) &&
+           (vms->gic_version != VIRT_GIC_VERSION_2);
+}
+
 static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -802,6 +814,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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

