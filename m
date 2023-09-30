Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2680ejb;
        Fri, 29 Sep 2023 17:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXSNgVF22j727NUXrC4syHZrKoKcUg2E6K/GVR15Liz1rg2S7u62QSFOuLcvtlWgcnGsvW
X-Received: by 2002:a5d:4a89:0:b0:31f:b6ea:af48 with SMTP id o9-20020a5d4a89000000b0031fb6eaaf48mr4953833wrq.49.1696033403692;
        Fri, 29 Sep 2023 17:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033403; cv=none;
        d=google.com; s=arc-20160816;
        b=l/alP9YxEvvNb5aCWvpRSwsUSCPPdgU7KUkQhX4XUYKzlpo+J/KdZR29t++rEAkvLw
         Hf0tl0kmhUP++2SLmVj5uDvg7omSzOIbT49q9gyAKmGezGJ6nlxVNt1/4pqnlGFyhis1
         Dy1ZvAR9O2zjIU/PqXvaejMaJ8jjnkajOP7MjDNebpOfe2vetXxMF2a1sgirlpTV97un
         rCtVxLhxIkNBoXzNZ2lCUoNVRSDOBrU8htKmXbZ167Oyk1F6ngL/+552SgPO7vGX0l1a
         sjXByt2f///FOn7i4UNXtLzI9Lt1pLrDEuc8dSjga1faFaTMu9cBHOQmxtD/X0L8sYRO
         jpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=H8XDUKELtAzks0OFZ7mZ4L9TtQOEGmt5380nszY8DRk=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=HalSEG1qdRp+0U1Hp+7Z7qlgCyJRwuErD+6bm/nZJVQjpYA5zNhJegbAJ2UHaojE6d
         H0Qz4/w6hKidbIdSJpw53evPOaBMkPOq0P9j9xhux2prFUgjRM80+cOdXN/iTyIqTHBE
         bkZ6vjaAu/DJy0tMcfkF1GlklK3ASoWfOMBIIa7pdlhqAS+dWY8Wb2Zehz4zdBVg4quY
         xIzEZOIH4ikIEw/Yamt25Epr0CSiFmIEun73DtCLj9nMQKAVfTpBhka9sjM6nY1wcXf+
         rMp8W39Jj55p0ab6W2jJbon8TlQ7hFELdDG9j9hTnmGs86uOqqKi7dQ4EmC/BRHoZFP4
         Pd7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id a8-20020adfe5c8000000b003217779f41fsi7442893wrn.535.2023.09.29.17.23.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry7FK2cPhz6K5rX;
	Sat, 30 Sep 2023 08:21:57 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:23:03 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: [PATCH V2 10/10] target/arm/kvm: Write CPU state back to KVM on reset
Date: Sat, 30 Sep 2023 01:19:33 +0100
Message-ID: <20230930001933.2660-11-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 8w4Ml8qT+rQt

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
is not synchronized with KVM at the moment. Because the vCPU is not
marked dirty, we miss the call to kvm_arch_put_registers() that writes
to KVM's MP_STATE. Force mp_state synchronization.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b66b936a95..8cb70b9e7c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -642,11 +642,12 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     int ret;
+    CPUState *cs = CPU(cpu);
 
     /* Re-init VCPU so that all registers are set to
      * their respective reset values.
      */
-    ret = kvm_arm_vcpu_init(CPU(cpu));
+    ret = kvm_arm_vcpu_init(cs);
     if (ret < 0) {
         fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
         abort();
@@ -663,6 +664,11 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
      * for the same reason we do so in kvm_arch_get_registers().
      */
     write_list_to_cpustate(cpu);
+    /*
+     * Ensure we call kvm_arch_put_registers(). The vCPU isn't marked dirty if
+     * it was parked in KVM and is now booting from a PSCI CPU_ON call.
+     */
+    cs->vcpu_dirty = true;
 }
 
 /*
-- 
2.34.1
