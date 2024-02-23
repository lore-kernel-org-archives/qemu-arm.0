Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475239ejf;
        Fri, 23 Feb 2024 02:34:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWb3H3e97XHyQ4W39q+IIXvV3JQYP5gIWMavzcXXgPS7YB9rrRAJG2B9pV4vdACbRQOjiO9ANg47Y/YKkFUL4PSCD242zaH
X-Google-Smtp-Source: AGHT+IEVVcl+feitm33GxfP3I9S+UPTTI2K3r1HcBiuBmznZO+RgxZecYsN6w9JSbZDacMNrROr0
X-Received: by 2002:a81:71c3:0:b0:607:b864:530a with SMTP id m186-20020a8171c3000000b00607b864530amr1899044ywc.36.1708684488735;
        Fri, 23 Feb 2024 02:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684488; cv=none;
        d=google.com; s=arc-20160816;
        b=aa90Ksfi2LB1OuBOkAdUd6RP5g1ynOARPelAIEsHpURBaIkejgEmdo8eLqSmu/4JEo
         9Ya9BuXFm0ctHV+obKoM+j2ThDYcfOQh8a3taboZtSM9V24C6oKwk2rNPuOr5XYoL8Fg
         kTQx9dCJkOM9zn31DS33FG/DajLI+3M6hmRnWLn+RtACmslaxFdkLGOXx3m3WkHnoZPK
         pmIuN/tTtjVQT9zV7ebtAAflXE9kMtpowR87QCmZXAUv3B79M2X9gVbtjV9wxLt6KOTG
         Q89MCasybkNXkBGu46ziM96PnpUu/mCP4xxmJhsH+XFG4glsW2Y8OCgtq7zLd8XgCC5k
         zOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=OvuXVY4k3pgaq/cdljeUH6J4STYaFmbl3/M4xS9yIqA=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=T0be4hEhzKSVv4WmzyO3h2cCzNmX/taZvxe1R3XouOKxt9JbNEC1IlptqUNHRZ9oH5
         7SR4m4OFXG4oTlCPv7dOA2ZKON4QaPHYKPOX4MQ+xiRGEcUhgL1eWiFPmxsm12+tzCpZ
         LvQl7LJiU2Va0o9EXnmHyfvPEEvviEgxh7BXWGvAtR3KvHw/hSHCTxdBf/YHiStqv5jA
         vRq0qKa+RqWO8WPQJwirC1YK+tI4wnrl19f27s0BeipD9r6dD+o7xhKMHzlIVIqUBnCq
         rM8t7Oj74voj85P1/OOm18TDjbDjoSotO/hPa76vtXFOBygIpyLLZU+uyAj24rP3PCXB
         CWhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc13-20020a05622a44cd00b0042d337fa1e4si14076179qtb.656.2024.02.23.02.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:34:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSso-0003mY-Ni; Fri, 23 Feb 2024 05:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsV-0003c1-GP; Fri, 23 Feb 2024 05:34:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001xO-Op; Fri, 23 Feb 2024 05:34:03 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Th5tN0SB0z1xnSY;
 Fri, 23 Feb 2024 18:32:28 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id CB6311400CB;
 Fri, 23 Feb 2024 18:33:52 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:52 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 21/21] hw/arm/virt: Add FEAT_GICv3_NMI feature support
 in virt GIC
Date: Fri, 23 Feb 2024 10:32:21 +0000
Message-ID: <20240223103221.1142518-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: mINQJL/20sPI

A PE that implements FEAT_NMI and FEAT_GICv3 also implements
FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
FEAT_GICv3_NMI

So included support FEAT_GICv3_NMI feature as part of virt platform
GIC initialization if FEAT_NMI and FEAT_GICv3 supported.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
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

