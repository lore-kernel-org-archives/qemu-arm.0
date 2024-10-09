Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp596920njl;
        Tue, 8 Oct 2024 20:27:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9pVxz/tP0/VwIZsMZ+QRKJzxCRb5O+DifsbRrVYS3z8jtDtzcMIrlOomqxpr90OX5SJn4uK5da20pow==@linaro.org
X-Google-Smtp-Source: AGHT+IF5xbhGMtuFtIVl+5BLkWcVtuZIHztUloaEvzYPrlimXO7Dmxj1Zr7dgTUfqmc/2DXdPBue
X-Received: by 2002:a05:600c:5021:b0:42c:b6e4:e3aa with SMTP id 5b1f17b1804b1-430ccf0546emr6250475e9.5.1728444467554;
        Tue, 08 Oct 2024 20:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444467; cv=none;
        d=google.com; s=arc-20240605;
        b=cJL8RomXI88KH73th2KfzQXUj/mq9OSfLMRFnKRz2VmjCU8JtXvNyf1MUNdA1awJkJ
         3TPgLJ0q08tBcbqIEaNyqkjKd6UZ98wc54gIBLIzJvM6PrIHbInd8B5vVdsnAFcJI2Vl
         BjpuJSEkQtnzlcMcu5gNOhOVay+lWwynMy+DjOSDLpVIAfgYlL9t8PeM3xOKAHxL2bdc
         +eWhxjvgcMyUbg/XUuIsn180o1lZQSoPlJJbURFUBk31OrJIJo5SKAd434ZrNsKOY6Sz
         +DxkEunU7DS4V4+mW3fynyL53f0tnaUYH1pkCJIuOsai/lnNwKXUwb9aXpACRgC3fAFq
         lDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hU2CgzHJK/NinSmOpsUpBycxo19a8SSsqHQc9c/g8Io=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=f2IWb2oOfefd94Kg5+Hg3+1USAS6SqvlNtJBJOO6SLu6nbrVaFhKPyc9YBtF4HTPgR
         MpJhHTw8iwoQNWvsymQ9f6mJjcCIxxDZD5EFTkgfE40MWitD09HzTM/rXGUIaCQm16Ka
         IeIYYAEATDaDSeWUZRyBZEPUJ4r9O5Wy1QHplq5N2iLLeJ6WPPb5eNtyRjLjYoQG6iZ6
         MZxn0DoEXdSce/lzztDV31DQG73O/kvN4ZesdaBaOIMLFE8S1h0HZQrdbw60FVtBJEJ1
         GpL2MbayBI6hH1mYU+Vq1LcgjXDk3jCsjJoVqt1XskcL0jocsc4K3KM3BCFm0WlYA1kU
         Fybg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d3a210352si345499f8f.184.2024.10.08.20.27.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdbB21wDz6K6G2;
	Wed,  9 Oct 2024 11:26:30 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id B215A140114;
	Wed,  9 Oct 2024 11:27:46 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:27:27 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 25/33] target/arm/cpu: Check if hotplugged ARM vCPU's FEAT match existing
Date: Wed, 9 Oct 2024 04:18:07 +0100
Message-ID: <20241009031815.250096-26-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: eoo4yCeFX4Bg

The ARM extensions configuration *must* match the existing vCPUs already
initialized in KVM at VM initialization. ARM does not allow any per-vCPU
features to be changed once the system has fully initialized. This is an
immutable constraint of the ARM CPU architecture.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/cpu.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3de0cb346b..14fcabc2c9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1912,6 +1912,49 @@ static void arm_cpu_finalizefn(Object *obj)
 #endif
 }
 
+static void arm_cpu_check_features_change(ARMCPU *cpu, Error **errp)
+{
+#if defined(TARGET_AARCH64) && !defined(CONFIG_USER_ONLY)
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+    ARMCPU *firstcpu = ARM_CPU(first_cpu);
+    DeviceState *dev = DEVICE(cpu);
+
+    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        return;
+    }
+
+    /* For now, features of hotplugged CPU MUST match earlier booted CPUs */
+    if (!dev->hotplugged || !mc->has_hotpluggable_cpus) {
+        return;
+    }
+
+    if (cpu_isar_feature(aa64_sve, cpu) &&
+        (cpu->sve_max_vq != firstcpu->sve_max_vq ||
+         cpu->sve_vq.map != firstcpu->sve_vq.map)) {
+        error_setg(errp,
+                   "CPU %d: 'SVE' feature didn't match with existing CPUs",
+                   CPU(cpu)->cpu_index);
+        return;
+    }
+
+    if (cpu_isar_feature(aa64_sme, cpu) &&
+        (cpu->sme_vq.map != firstcpu->sme_vq.map)) {
+        error_setg(errp,
+                   "CPU %d: 'SME' feature didn't match with exisitng CPUs",
+                   CPU(cpu)->cpu_index);
+        return;
+    }
+
+    if (cpu_isar_feature(aa64_pauth, cpu) &&
+        (cpu->prop_pauth != firstcpu->prop_pauth)) {
+        error_setg(errp,
+                   "CPU %d: 'PAuth' feature didn't match with exisitng CPUs",
+                   CPU(cpu)->cpu_index);
+        return;
+    }
+#endif
+}
+
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
@@ -1961,6 +2004,13 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
+
+    /*
+     * As of now, we do not support heterogeneous computing, hence, features of
+     * all cpus should match. Hotplugged vCPUs are not allowed to have
+     * different features than the existing cold-plugged vCPUs
+     */
+    arm_cpu_check_features_change(cpu, &local_err);
 }
 
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.34.1
