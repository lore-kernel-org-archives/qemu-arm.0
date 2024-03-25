Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564694ejj;
        Mon, 25 Mar 2024 01:54:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVoHhLR2YheWK71jUV0IIeLzWCVS7R3F63mes8tJNpN3pCLR7WE8OinPmzdLuOF35OpIPVyXFoAri+jN3bB3fvdQX2OjMZ
X-Google-Smtp-Source: AGHT+IHmOProMWXzvVgyJpYrNs+H9bq72OXCZzIriAF4RWNB7X20Edi/mcLEWk4L5H8ennDtEGIk
X-Received: by 2002:a05:6102:5e7:b0:476:d9f2:f9aa with SMTP id w7-20020a05610205e700b00476d9f2f9aamr4110755vsf.0.1711356897119;
        Mon, 25 Mar 2024 01:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356897; cv=none;
        d=google.com; s=arc-20160816;
        b=J0iprA0SyM58oc5VE6lJuPsfgEBxLkI1cfHH7PadW0t+GDL5dmmDSJYy6QrLn9/vqe
         dXkZtJsRDI4CUVE6zWgfYJyzz7k1Vg2FxJ9tFGNiZTldeCWVwUunO1H/FqLWwDp4iAZg
         i9bfAxdNqSWzA7Kr759dwpaGte49g/uFTf/cJMQHiaNFHi8hEbj/6jPvM6rqwYx04IvM
         ps2zmv9LN38r5i4mEEabI6wr0CidCx88jrSy96RBolpZ59whKrhJ+vKumD/uCc3YkFIK
         N3lshgxByeljGAdISfDKWbEMC1IV+ykZFRr9kfZ9syhgxotinVRwA8STH2PG81GYlhXg
         uvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Saap2FMxIpOPUBX0IH9pOgg3BzQsYcr4zuOaSuZrYTM=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=pZQqe8VfOtN9nLdwjSdFG4kDUp0zBniNiCfmHk9zEr/d0gpOBZZERu4SytJcOtFiKs
         sG5g9UHr1TAkNBO/vopsxFDK0fQ99X+PNFC64wfu/j9W1mLoI8dV4pkrkY2RzDSVLfMz
         baQB7F0fT2cKaqAkBBG5mPI1hkyvuhnQR3VxdYYWz87DCKO9FrVb7hiaTdkAcPCwaHyr
         ULE5DJoa5fJ+ymZtvMYuq/cA8UDPImJt5oVcnhvy5hesT7h/z1E7VWAB+awkBe5oGgyR
         3FJbXtpq3KclpNRwDWHChpHpvrgK/AWfB3CbCdRuG+qjhFD9MsoGm8gjyHK8m9Ty/+1Z
         AxgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a084700b0078a5dafcd82si8920qku.46.2024.03.25.01.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rog4e-0003aO-ER; Mon, 25 Mar 2024 04:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog41-00034t-Ic; Mon, 25 Mar 2024 04:52:19 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3x-0007Rq-Ua; Mon, 25 Mar 2024 04:52:16 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V367b3J01ztQg3;
 Mon, 25 Mar 2024 16:49:47 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 093F814011D;
 Mon, 25 Mar 2024 16:52:10 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:52:09 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 23/23] hw/arm/virt: Add FEAT_GICv3_NMI feature support in
 virt GIC
Date: Mon, 25 Mar 2024 08:48:54 +0000
Message-ID: <20240325084854.3010562-24-ruanjinjie@huawei.com>
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
X-TUID: euukqP71OIpx

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

