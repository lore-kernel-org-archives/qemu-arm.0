Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp99416ejr;
        Thu, 13 Jun 2024 16:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKUuOsjbV+XGxa6M7WCAdeqOtAIxtV+SzVp8TWgkbepnP6p0f9deSvdYpmozUJkTlRInClDydQI8HOfOuJL+Y3io0f/HbT
X-Google-Smtp-Source: AGHT+IFj6jzyASuc8L6HhTARmWGBU5fiEitvpp0xx6FQcIceUj7IPJ2cUEaitbmxfJOzkJVppHTu
X-Received: by 2002:a5d:4d08:0:b0:35f:2363:e4fc with SMTP id ffacd0b85a97d-3607a7606b3mr968407f8f.17.1718322442138;
        Thu, 13 Jun 2024 16:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322442; cv=none;
        d=google.com; s=arc-20160816;
        b=pL8LA3cwTHa0IcanRo4IeVoADljKdZj7+plzv3JDXzEXGDpcuCVzNZetzaYbhTc2RL
         Ee2c8vGUDK7LZbhaOb5wm5vw83tMFTgX9LNqmeuV042cX6ZFZCNw2yMfT/I02nLiqpPx
         Fw/NHgEwBoWnvcWERuzKHRbfhIQxHq/hgWj6sHsi4wlU21/kdP0xXDbHbVeamWdml6w9
         lEk3ZlH0BzKhqliuu2yQYBF5VejOXmobgwSOBOPI31J//ChRiQxb/hs/8U3IjhlQWgnQ
         EjV3fhTfmSNQtpcAspq1JfOnhLNBbuCl6DhLq0spi+KWp6QoYGTtq8BMnsREc4PacGOg
         EylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=iwEEX2SADeXqAFnprFupM3er8ptrR9grKukQeyzG7Ds=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=TM3rgAuGQ1sZquJzWZ2aZ7zVSOd6Lsd1whTXpwAtqDjrAmaf8pVdcX2cIoAgmLO9wu
         Ko5RI9wTIJCftNZ19BCukQqgBZXTecxG/jwL+s7AYpy55ENiWRwYAfbwlpE8AiIC4DNg
         iSdSlPvTn+IADyAQydebmJMGWiXNKxsmzVeRAwgtJTIHilPSLopoAmW/snwwH2Ns9u+V
         2pS3jJ3DDpGokJLaO8ISqL+HwrgfDaiOKwJnppjcrTdVD8D+Qifgs7GbzYjuuF4HfAtC
         bUFGM90XRnETodCnVP2wZL7noaPQtktAQqM/tK6q5wY4XcJiTGlCLpxXi7LFaRPTtZEX
         wOtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3607512ef90si1381818f8f.827.2024.06.13.16.47.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f8t5WZ0z6H8xV;
	Fri, 14 Jun 2024 07:42:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A470140AE5;
	Fri, 14 Jun 2024 07:47:21 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:46:58 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 25/29] target/arm/kvm: Write CPU state back to KVM on reset
Date: Fri, 14 Jun 2024 00:36:35 +0100
Message-ID: <20240613233639.202896-26-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: iOXbAPZ7XYHM

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
is not synchronized with KVM at the moment. Because the vCPU is not
marked dirty, we miss the call to kvm_arch_put_registers() that writes
to KVM's MP_STATE. Force mp_state synchronization.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/kvm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 1121771c4a..7acd83ce64 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -980,6 +980,7 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     int ret;
+    CPUState *cs = CPU(cpu);
 
     /* Re-init VCPU so that all registers are set to
      * their respective reset values.
@@ -1001,6 +1002,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
      * for the same reason we do so in kvm_arch_get_registers().
      */
     write_list_to_cpustate(cpu);
+
+    /*
+     * Ensure we call kvm_arch_put_registers(). The vCPU isn't marked dirty if
+     * it was parked in KVM and is now booting from a PSCI CPU_ON call.
+     */
+    cs->vcpu_dirty = true;
 }
 
 void kvm_arm_create_host_vcpu(ARMCPU *cpu)
-- 
2.34.1
