Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp109279dlb;
        Wed, 28 Feb 2024 01:31:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6Zw9KSc7TDBnU9b5nb5TQ8IDa6BH7KyjrrVXhJG2SiWN41r+a5ZG68mDUTXPbQNQe9iNxEuljk2tLr388lT+UGmWxMFDz
X-Google-Smtp-Source: AGHT+IEhjFAe4bk9prWmwGB0X4RsQDtY6KdbbBciAX9x9k73V1LHq857g40XP72ewMs0EtJ3RLAI
X-Received: by 2002:a05:6214:3381:b0:68f:a954:bba1 with SMTP id mv1-20020a056214338100b0068fa954bba1mr2883543qvb.26.1709112684753;
        Wed, 28 Feb 2024 01:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112684; cv=none;
        d=google.com; s=arc-20160816;
        b=aCXrcBSeMVLg/FTSW0Od+Jb6kl1cDhORAxo3MRWVLHQRHxtJjiaqqg9ZBh1LwYd9kj
         NJDE+kHkOk6L9tovNg9ZlA3xn/dIPbr/6whlGNTC5R17KtmVSdil02Nre2MF59JE8/YW
         5I5B+oOZo0FkbvfmjPp4s0TCS1xfcP7RqZHI3NOQEACdhb+plvV6FOLojHLMcmuQTl8u
         GtEVI91J9VM0CZodf139odRjYvGDYp2V0AY0kCjyTE6hIbYcKHlh823ktH6HIKBQwqxP
         cw9KxvRRZT1n7ymCMsFx54gEmSrP5Ft9saJYoff/jNGzt7lWqCN0Z2ngMctrYTATDdfd
         vG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=DYdBcRTFVKdV17vpdL00pZLwPYPXQvdZfVh1xwk1UAo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=f16W+3+MTj82OZ92ZUlq7Xh7gYghNVOSZ/0Y+5zQOGcZalnsF2rQBFf2zbnp/gfp1y
         IvWR59v9L0SGQGEtY+9k6rMzF7+V7ZlSuM9qwRiKwS4kFn706N8ydQtOVnU4VJS58NkT
         zGEk641nRdB5Xk6xbqE81r4m6iyiQmApqU12qCcEwov7vJMZomZmSIeIYW8NxaMbUkon
         k28Fbvfklik9kDuPxCBuhu/QaaSoWweT1gasBcngjz4zeyIGZ64KNeT6jV7Gyjg6eCSN
         +nAUuMXc7OQQB3TsuyQ1NLqgIyIcY2vAkOO5HAPJfSjynGkVNPTcPPXuCWavBpwp8hb4
         pHsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19-20020ac84f53000000b0042c513c8cc8si5489898qtw.68.2024.02.28.01.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHb-0001FZ-Re; Wed, 28 Feb 2024 04:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHS-00015V-Nn; Wed, 28 Feb 2024 04:31:17 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHQ-0001t0-Pr; Wed, 28 Feb 2024 04:31:14 -0500
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Tl8Dv6gdCzXhP7;
 Wed, 28 Feb 2024 17:29:03 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C719E18005C;
 Wed, 28 Feb 2024 17:31:08 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:31:08 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 22/22] hw/arm/virt: Add FEAT_GICv3_NMI feature support
 in virt GIC
Date: Wed, 28 Feb 2024 09:29:46 +0000
Message-ID: <20240228092946.1768728-23-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
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
X-TUID: WHUoJDxGzTPL

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

