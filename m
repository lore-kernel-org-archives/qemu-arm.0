Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3222534ejc;
        Fri, 29 Sep 2023 05:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbaXbqknMeOylK6/5m/Jp+/qEdhde+HoUXiTQlaqkjLhybZPEUGOGXXwEKMkWFk/GOydfm
X-Received: by 2002:adf:ee48:0:b0:321:4790:bb5e with SMTP id w8-20020adfee48000000b003214790bb5emr4169922wro.38.1695991645631;
        Fri, 29 Sep 2023 05:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991645; cv=none;
        d=google.com; s=arc-20160816;
        b=dPrPNJOtwIl8IjoZImWX7BV+8ahD2FiaQ7txmDY17bHgf9acJo6DrInFPDcrEhk0OS
         lnXuNoaW9/jqpjdMK8vdb59fkS+RnM4/T8Ol0E4ta85DTQezxnMvlVUsseMt6xANnH9W
         5Opky7b10XcdYNYIM3IdK71HT59PbvELf5KmPtDCvaKVff3wJXLEzLA+dlK3pV5GK2sf
         UkD1WzvjXf2hSsV1nnWdjCUBD3YEu13p6xZ8qGhUxHUuO6mx/9d6KHB6vmerDFJfwL3r
         x6OC8P9JodfMlYs+3K+oLRTqo3T755sNu2J93vi/PnhVPT+hNHCG/8d3cegS6hnvgUHR
         p+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=qBZ+VJ4nD5t8FtSMNqtXM9UlIS+kq7AqXPDwpJl0Tk8=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=nfpDb6XrL7rDdCHDNh1XetaZB4UcUiDjI4yFBfZDKA4BACVPSOey2c3xBjvCtj37n2
         Lrj7pqU3hCEyx11OeUsfW8K2mWXOb34n3pvpZS4gb+TpVekOaRqvt4bQOPpnQuTfDMiI
         OnR8C3hKOfnfYHMx714Ea6DKC91lPILDigPhlezrQaD2aKGS3wqwGGbsYEOZwdKleaBE
         SOxqWr3K23lQ0WkWb7JpeBtcMiACmMutNJu6xjXC+bY/HgB6z272Qusz9VIVNyL1kXk6
         wsaribcuzLk/raio6QON7qEb/W5YCzXCfuCCSG75pfx+O9ByWP2A4y8U7C+m7sXFvO0G
         eS4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id p12-20020adff20c000000b0031f899b0a41si9549846wro.679.2023.09.29.05.47.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RxqpJ1yBxz67yyF;
	Fri, 29 Sep 2023 20:46:00 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:47:05 +0100
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
Subject: [PATCH 9/9] target/arm/kvm: Write CPU state back to KVM on reset
Date: Fri, 29 Sep 2023 13:43:04 +0100
Message-ID: <20230929124304.13672-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230929124304.13672-1-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: Fa6TH8GLs7U5

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
is not synchronized with KVM at the moment. Because the vCPU is not
marked dirty, we miss the call to kvm_arch_put_registers() that writes
to KVM's MP_STATE. Force mp_state synchronization.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
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
