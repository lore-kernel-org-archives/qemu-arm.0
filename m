Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp995242ejc;
        Tue, 26 Sep 2023 03:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0iaWIl63YTT2mZZl1HHsYJs1wFeJD76u6aiJfDOj6amFdIsipdK0M0r1K9FtNEhUUq4Q2
X-Received: by 2002:a05:6a20:7488:b0:15e:7323:5c0f with SMTP id p8-20020a056a20748800b0015e73235c0fmr9172263pzd.16.1695724679300;
        Tue, 26 Sep 2023 03:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695724679; cv=none;
        d=google.com; s=arc-20160816;
        b=YfQyN6p0GiyGlZpxDoQsfJnmOulDue/d9xPNzbQO05vMqSL7QtT92v155aj0ncSyZL
         zZooXXC7J2nxQAiQsOKqRQJpmykverRh0Id1EZivUZ7caeF7MqpkmmGbdTCIQ8xxPakF
         TMpaLL5scPD7CoG1FxuAfnHwii3VH7hpEmZVTYdjOwtIXBvkHPXaJqTVKOHaypYAQudR
         6WYkwQe3rwtgTXbjD1QXoV1hhwBhPip0ldBlhccJQxSFJAYiAr7NObqFrJ1IGqmqRC7m
         E377NvqGXjj7SsaSK3kk5Nf4thR8hzd9Qjpu/TmGLkKRVZUDgiUINKJe21VTgmhSCqFU
         +wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ZpdISj+oiA2vFHKcNlO4HmohP3g2XDXwFTkcQw8ImzE=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=Y4hozbxcqC/lNfzuUfyvZcHO1jo1OvcKjCuw+MF00bqvDShV+Krz9UOXPkYEo1FQyD
         M+VUT0RX3H/XfYbvCkB+FL3+0T8InRuRjLaDFQYTk9r6+5MNhs2GkW5pYFMXTwbKX4Ti
         76eB6E5N86hV2m6+MGUBkO6a8/iokQ9e7GNE8xVp8f2EH4aPKIHeZxzzq/S2i5Zv2AO7
         Rg7OFdHPvqRfdxu4yjjM1++w2WQ7VKRln1wqGPcnUPGSCLcHTunFnYsG7iP5nXf0sV0f
         nk+uov0DrnktiNki4FFCeDJP8eBvIaLmD4SG76FYqzTLBsrV01+qEys7yfNx3C/K7HjT
         K5ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id t2-20020a17090ae50200b002774daac5e7si5169477pjy.0.2023.09.26.03.37.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rvx4S22lHz6K8s5;
	Tue, 26 Sep 2023 18:36:40 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:37:36 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 33/37] target/arm/kvm: Write CPU state back to KVM on reset
Date: Tue, 26 Sep 2023 11:36:50 +0100
Message-ID: <20230926103654.34424-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926103654.34424-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926103654.34424-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: gZYUSHXlwmLE

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
is not synchronized with KVM at the moment. Because the vCPU is not
marked dirty, we miss the call to kvm_arch_put_registers() that writes
to KVM's MP_STATE. Force mp_state synchronization.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/kvm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0e1d0692b1..8e7c68af6a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -614,11 +614,12 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
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
@@ -635,6 +636,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
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
