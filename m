Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2340535njb;
        Tue, 15 Oct 2024 03:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgkA463OhKLhSSlRNt49QskrcsKtlakTeEroAfAc3rs4zw0V443i+ThLIm8rMuJjwalwY38Xw8Zxsktw==@linaro.org
X-Google-Smtp-Source: AGHT+IFXToKco1a2fsLJWk2Ka0RZHJk2TtBb66X1icRw3iIYf6HAdeVkCWDySszkvA9fKTmYPHwl
X-Received: by 2002:a05:600c:a16:b0:430:57c9:f885 with SMTP id 5b1f17b1804b1-43125616451mr113299875e9.31.1728986905628;
        Tue, 15 Oct 2024 03:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986905; cv=none;
        d=google.com; s=arc-20240605;
        b=VCuKUfk5SHR47TANWt48BzbGPoocHkigu3kaNXWzz/tqwOJ5jT1NxoJO9WsUoo5GSt
         i8R/PMSexzXLJaXU2q8QRt5PQ7sEzYaMM6N+yplWB3nhVZecC8DYHeISBVNcliNyhVFL
         VnNr+ZdzHlA52YRqY62ssCEhFUVqh+nOB6j/6whAXPebZVydoSyjvSa3sAkNCjD1XOXA
         hwbZnSS6Z73pChT9WQY76vvf3WEpWhYyi32B1DybzCpHbYZJQdzjKYVxaPdX+qZhwuiQ
         Mu2vls06ZewgeXeujzE/bSiaTjp0hoG8Lg9YHhVfEtG7Y3+h0efucHUe8ad/CQX2P9Bx
         q3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hU2CgzHJK/NinSmOpsUpBycxo19a8SSsqHQc9c/g8Io=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=gi7fmkqPQkuX0O6hi0xkA1rjNh5IGy1eYY9Msub5NVhnbb1H1vQoUhg4p76Q0bc8Fb
         MhF9H40VuAibQvC7Swlxi7BRg1gtntstXi9nEthHMbxWB5I93wW5yHFVC7tqKoZ8Cafb
         MqR4iVcRh8vF0f+IdkRNul27OtydfZxYMDp1tVuQl2Dltyi+iSEULfq51hDQdwI7kxDt
         +exwkTS5zfrTEFxXsVVJ9m3Q2b1vHyIb7FdklQ3Dmje71/snp6aLBevj7pjJXJu9RYPT
         F8GXphMdhWQzFJz7lD4T+6ZRSubGKgKmJLl/1iHZRL6/PY4vGF91mUyI8+83AkxcvuT6
         JMrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4313f56a6c5si5568465e9.78.2024.10.15.03.08.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSVBH21j1z6F97V;
	Tue, 15 Oct 2024 18:06:47 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 7CB55140519;
	Tue, 15 Oct 2024 18:08:24 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:08:04 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 22/30] target/arm/cpu: Check if hotplugged ARM vCPU's FEAT match existing
Date: Tue, 15 Oct 2024 11:00:04 +0100
Message-ID: <20241015100012.254223-23-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: +huKdPkz0I5Q

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
