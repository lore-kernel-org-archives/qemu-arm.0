Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1308815lfm;
        Thu, 25 Jun 2020 06:44:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznbLqSeKUzzIgWXu4yA/JO1rbhrJug/LHkNWbxGtneNHkCnQd5R0ZWmcDkcRFc5+G/7Db2
X-Received: by 2002:a17:906:a112:: with SMTP id t18mr3362934ejy.350.1593092655480;
        Thu, 25 Jun 2020 06:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593092655; cv=none;
        d=google.com; s=arc-20160816;
        b=qKgtX6hqBf+XZB+dAXG6anJ0gGbHyfdIxsjMB8Qf9KyWOBJG6hHD69DbKi+7IxBWVu
         kBWq8oXbvVElOqNJW5dWiEF0cEAgmhdA8sO3F4HtnM3yFu1BBfWxwO60zGco9QIkeFDu
         uWMcRKyowNabQjQHoFF4HZjVGX/m0yRBwdY7hDd07Qmy48jLFM+Vgr74Rin4vVL+NwJ2
         CVLKnSCbsoH2RlRFRCGzI6iJmjTcoEKI9qloEo69GW8805zqKF6Z7nff1FKfqFUAjzl/
         d3EFprWzF4Ai7gQI089K5GvoIqMGsPqlfpZK1wAFqf4R5dNjLBvlWI3N8XLwiHDhdCMv
         Xk4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hLJtOA63tkCBep41IUSdE9tjJTaMek1ZUxbXih8UeLM=;
        b=003SPuR187e/EcuE/VPf1pGnbsqX3PLsQCNFJOgZvqhOGTe9YWmJkNKj+Vpcumaeyi
         3ovktWDOiw2jUrJK/AhrD8UpQCQrA/rnsWw27xlUk4lhx/OwNbzrj3wvT+96WXQSXe73
         KkXuLch4IZHxpwwlYkzg6CRuphsGUWHg31e/za4wj/0+T/Obu04FT7qclySFN6aTMVbx
         hMlB/Xs55q73RE7ly/LkKgmcWLZfW2p0pboANCFhjmaha6yYFkCb2KGSrZS/5rn/pTT5
         8pHrLXwH5fCh8MBQk8v5yckONpi5i94sb8PBl4JybZhQ5josFdb05ZP9YMCskbQw6uJL
         v2EA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id f8si9757476edv.497.2020.06.25.06.44.15;
        Thu, 25 Jun 2020 06:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405230AbgFYNoL (ORCPT <rfc822;peter.puhov@linaro.org>
        + 27 others); Thu, 25 Jun 2020 09:44:11 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:49350 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405190AbgFYNoK (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
        Thu, 25 Jun 2020 09:44:10 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 6F308B2C6D69505DCE5A;
        Thu, 25 Jun 2020 21:44:05 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.76.118) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 25 Jun 2020 21:43:54 +0800
From:   Salil Mehta <salil.mehta@huawei.com>
To:     <linux-arm-kernel@lists.infradead.org>
CC:     <maz@kernel.org>, <will@kernel.org>, <catalin.marinas@arm.com>,
        <christoffer.dall@arm.com>, <andre.przywara@arm.com>,
        <james.morse@arm.com>, <mark.rutland@arm.com>,
        <lorenzo.pieralisi@arm.com>, <sudeep.holla@arm.com>,
        <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
        <richard.henderson@linaro.org>, <imammedo@redhat.com>,
        <mst@redhat.com>, <drjones@redhat.com>, <pbonzini@redhat.com>,
        <eric.auger@redhat.com>, <gshan@redhat.com>, <david@redhat.com>,
        <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>, <mehta.salil.lnk@gmail.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        "Xiongfeng Wang" <wangxiongfeng2@huawei.com>
Subject: [PATCH RFC 2/4] arm64: kernel: Bound the total(present+disabled) cpus with nr_cpu_ids
Date:   Thu, 25 Jun 2020 14:37:55 +0100
Message-ID: <20200625133757.22332-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200625133757.22332-1-salil.mehta@huawei.com>
References: <20200625133757.22332-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.76.118]
X-CFilter-Loop: Reflected
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: K9VvS9mP0DOt

Bound the total number of identified cpus(including disabled cpus) by
maximum allowed limit by the kernel. Max value is either specified as
part of the kernel parameters 'nr_cpus' or specified during compile
time using CONFIG_NR_CPUS.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 arch/arm64/kernel/smp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 51a707928302..864ccd3da419 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -513,6 +513,7 @@ static int __init smp_cpu_setup(int cpu)
 }
 
 static bool bootcpu_valid __initdata;
+static bool cpus_clipped __initdata = false;
 static unsigned int cpu_count = 1;
 static unsigned int disabled_cpu_count;
 
@@ -536,6 +537,11 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 	unsigned int total_cpu_count = disabled_cpu_count + cpu_count;
 	u64 hwid = processor->arm_mpidr;
 
+	if (total_cpu_count > nr_cpu_ids) {
+		cpus_clipped = true;
+		return;
+	}
+
 	if (!(processor->flags & ACPI_MADT_ENABLED)) {
 #ifndef CONFIG_ACPI_HOTPLUG_CPU
 		pr_debug("skipping disabled CPU entry with 0x%llx MPIDR\n", hwid);
@@ -569,9 +575,6 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 		return;
 	}
 
-	if (cpu_count >= NR_CPUS)
-		return;
-
 	/* map the logical cpu id to cpu MPIDR */
 	cpu_logical_map(total_cpu_count) = hwid;
 
@@ -688,8 +691,10 @@ static void __init of_parse_and_init_cpus(void)
 			continue;
 		}
 
-		if (cpu_count >= NR_CPUS)
+		if (cpu_count >= NR_CPUS) {
+			cpus_clipped = true;
 			goto next;
+		}
 
 		pr_debug("cpu logical map 0x%llx\n", hwid);
 		cpu_logical_map(cpu_count) = hwid;
@@ -710,6 +715,7 @@ static void __init of_parse_and_init_cpus(void)
  */
 void __init smp_init_cpus(void)
 {
+	unsigned int total_cpu_count = disabled_cpu_count + cpu_count;
 	int i;
 
 	if (acpi_disabled)
@@ -717,9 +723,9 @@ void __init smp_init_cpus(void)
 	else
 		acpi_parse_and_init_cpus();
 
-	if (cpu_count > nr_cpu_ids)
+	if (cpus_clipped)
 		pr_warn("Number of cores (%d) exceeds configured maximum of %u - clipping\n",
-			cpu_count, nr_cpu_ids);
+			total_cpu_count, nr_cpu_ids);
 
 	if (!bootcpu_valid) {
 		pr_err("missing boot CPU MPIDR, not enabling secondaries\n");
-- 
2.17.1

