Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4485459ejv;
        Wed, 3 Apr 2024 03:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVM22cyRyjzdopiLOmavW5xLUm9zDcFOEVzIGsq46YbSO3+V0g4urwfUVspIj9UjWkAMTgKS9BqvDbjp8V0O4Et/5txQWf
X-Google-Smtp-Source: AGHT+IFF9YeUAPahnbO9ebDquNHiX2Gw5wjFyI3NZfB1hH2RyNe+1LT8iDDT/7+ISl62mHE79clx
X-Received: by 2002:a05:622a:14c6:b0:430:cded:997a with SMTP id u6-20020a05622a14c600b00430cded997amr17966172qtx.40.1712139701425;
        Wed, 03 Apr 2024 03:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139701; cv=none;
        d=google.com; s=arc-20160816;
        b=e3XIRVvJKxf3l2qC8pkGL1GErCRss48jE3gixKHtgtp22u8gVQOQBGOlBUKdYRQscG
         XjIhnXFXEyvhotFmrqA6anS+yjI2RDrf+mbjMdxIzNvTMCBo0Eoy6qaslPYNa3xdvqIr
         P3CAazVXQQnQu0kO9ki7JSihP1Pd3yIrK3n5IWKsHe8MrXFDxkki4mUMzgEQ86hSyAHk
         v5Bu7iKmxUX4c7OmM2xeJHdI2EBRMj7mpGpU5kqH3SCZKrvZVaz9h0OGrljErNPY+bDZ
         uz1twoCtLeKeKQfDS0IW8Px9jSJAzzZCYmaApg/O7ZF/j/Gn7R4pt5dMi/OUdcWUv8/z
         q+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Saap2FMxIpOPUBX0IH9pOgg3BzQsYcr4zuOaSuZrYTM=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=uCIm6YO/M9INvEXt1f+CGTApjx522pJ9VlrT/enTsSveJxEhyZoRoQ1IFPEfL79+rn
         Z/waVrR4Bmcc1yZKtYUMhHNkKqf+yMXXQi9q3y5P51+h4hK+GqzbZkRCKKJWSbPsdVER
         EY58EPnTkEsHd/tEtqivPhKmKzjlJ/1mlPQnrYx/J5vKqYgEkfv6+YvQubcIrxA8qU24
         CpqIfBLq62JMygkiE8qnZ2P8Nrq6aMJJp2Sg4xlSrgNir+T9NwlWl0t1tjRvbiEPLLVd
         1ek5/IJFKndiTVkKfymAT2kqWxiTou5fvDK2zrY/fSU+1f6j9WpYbqMZE2iGu8255fKt
         hpBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020ac858c1000000b00430f10b9c98si14252894qta.709.2024.04.03.03.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxhP-00016X-MW; Wed, 03 Apr 2024 06:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxh0-0000vl-Jk; Wed, 03 Apr 2024 06:18:06 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgx-0006h3-Ok; Wed, 03 Apr 2024 06:18:06 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V8gck25J2z1JB3H;
 Wed,  3 Apr 2024 18:15:50 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id BFC6A140F81;
 Wed,  3 Apr 2024 18:17:58 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:58 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 23/23] hw/arm/virt: Add FEAT_GICv3_NMI feature support in
 virt GIC
Date: Wed, 3 Apr 2024 10:16:11 +0000
Message-ID: <20240403101611.3204086-24-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
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
X-TUID: g2UDqDI6zaig

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
index ef2e6c2c4d..63d9f5b553 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -729,6 +729,19 @@ static void create_v2m(VirtMachineState *vms)
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
@@ -802,6 +815,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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

