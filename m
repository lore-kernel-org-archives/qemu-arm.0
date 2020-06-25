Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1308841lfm;
        Thu, 25 Jun 2020 06:44:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5H60wyImHHnVgKc8UADeO2vVZiWWIfuuPNjn4S6vAXbG5TaUIpS4/vRC6znFhjBu0fyrX
X-Received: by 2002:ac8:1ac4:: with SMTP id h4mr19400046qtk.249.1593092656952;
        Thu, 25 Jun 2020 06:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593092656; cv=none;
        d=google.com; s=arc-20160816;
        b=s5oen9meZF5fLsEUVfJrIK1N/gdOAV2lFFKL8T6CG7+6ykuQc2O496u42NFlfVhKje
         fBZNeJfrIkcOlKEgjRhgIwux6bh73NH0V6Rr3kLVMcTVMaZIbjeUM3xMoUhP08kVmZ2F
         Wb6pntz1yGuIKe30gypHRZRThtHzNOFWpKka+hNmk0utlaUJ0d8akM2UxLWdeyAFlnAT
         abCD6Pi0NN9QICsEJLCxKHXhrEKMptqMoTbRt700ZaM1pqANndoXQoRNaIM9hJJ8kb4v
         Or2aQ4olDR7J77vDcv9Ojk8MKLHf3gTX6OcZt674kdGLsV8I8U61UXpT7tB8025Rfccx
         zJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:dkim-signature;
        bh=n1WewWBsyxDIgy+gMf/4PRcF6i/BvR4/emZUmMOjYMQ=;
        b=wHfTkp2/htpkT2iiFfl/HtB9xB2RBflMblrzAMlnhM84gR0wLdSKJd5TsjtbzYv6LD
         XF3uDHOJv2Q5z2p06SLCAjDWTe6gz+5aIxCBCTSyzSI+Q8Vt3ZUQZ+I1UY5blKaJjSXE
         I0wocHSE1RvbHDZAl2NQqF07D+dtBfX3CYbaOpElxjuNP+N1q55WXZHoGrhz7N0u//kf
         /iIUL4GzLpTKxUq20zX+sTeVwLP6dd5rRyTKxp6DXQZ6kbKXIwhNZK00x5glRwC4b0F2
         Bu3GdhfiURD2z3nXa5fq8b7bqwDnsAWQDGZaIwOTj4ondRBj3kzBYdqpARcgS552W6kd
         zBnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@lists.infradead.org header.s=merlin.20170209 header.b=wM14igu7;
       spf=pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 2001:8b0:10b:1231::1 as permitted sender) smtp.mailfrom="linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org"
Return-Path: <linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org>
Received: from merlin.infradead.org (merlin.infradead.org. [2001:8b0:10b:1231::1])
        by mx.google.com with ESMTPS id p22si23734qkk.18.2020.06.25.06.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 06:44:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 2001:8b0:10b:1231::1 as permitted sender) client-ip=2001:8b0:10b:1231::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@lists.infradead.org header.s=merlin.20170209 header.b=wM14igu7;
       spf=pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 2001:8b0:10b:1231::1 as permitted sender) smtp.mailfrom="linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n1WewWBsyxDIgy+gMf/4PRcF6i/BvR4/emZUmMOjYMQ=; b=wM14igu78rexZMYZz2hc6XX6M
	obL5nbTlhacP6zeZoJPmr17fY1jbs7VNhc3QjGg/wfSV7ZW4ZNoFKNA4c2KVOzd2IoqoO3z6MSuAr
	72VafbPPQiZjP5qHKUO0D2FjniOCW/sZwCDvrM4SNvCC74LWYnr18Wc4/kOgSHr+p9U864Kf/G2q5
	S6SwtknLF4lcvoKZ8hENOv8GtdMPuyVe95tfd+sP9Y/Zf8TmxA994KXwPh3ocqCFQ7xtwFrNjszBz
	D0lrB0TGki0F8VQZzYARO4awhAlnuoZfQOjGN8kF/JcRECPNO3XC6PbM7fv8lXZgZrAMS047cq3NC
	nItBTGnBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joSAg-0004pE-IE; Thu, 25 Jun 2020 13:44:06 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joSAc-0004mi-3O
 for linux-arm-kernel@lists.infradead.org; Thu, 25 Jun 2020 13:44:04 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 52A299654FC5BEE3B867;
 Thu, 25 Jun 2020 21:43:55 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.76.118) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 25 Jun 2020 21:43:48 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH RFC 1/4] arm64: kernel: Handle disabled[(+)present] cpus in
 MADT/GICC during init
Date: Thu, 25 Jun 2020 14:37:54 +0100
Message-ID: <20200625133757.22332-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200625133757.22332-1-salil.mehta@huawei.com>
References: <20200625133757.22332-1-salil.mehta@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.76.118]
X-CFilter-Loop: Reflected
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.190 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, peter.maydell@linaro.org, gshan@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, catalin.marinas@arm.com,
 linuxarm@huawei.com, linux-kernel@vger.kernel.org, will@kernel.org,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>, lorenzo.pieralisi@arm.com,
 maz@kernel.org, david@redhat.com, drjones@redhat.com, andre.przywara@arm.com,
 mehta.salil.lnk@gmail.com, richard.henderson@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, Salil Mehta <salil.mehta@huawei.com>,
 christoffer.dall@arm.com, james.morse@arm.com, sudeep.holla@arm.com,
 pbonzini@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org
X-TUID: 0WAR3Ho5LjI2

With ACPI enabled, cpus get identified by the presence of the GICC
entry in the MADT Table. Each GICC entry part of MADT presents cpu as
enabled or disabled. As of now, the disabled cpus are skipped as
physical cpu hotplug is not supported. These remain disabled even after
the kernel has booted.

To support virtual cpu hotplug(in which case disabled vcpus could be
hotplugged even after kernel has booted), QEMU will populate MADT Table
with appropriate details of GICC entry for each possible(present+disabled)
vcpu. Now, during the init time vcpus will be identified as present or
disabled. To achieve this, below changes have been made with respect to
the present/possible vcpu handling along with the mentioned reasoning:

1. Identify all possible(present+disabled) vcpus at boot/init time
   and set their present mask and possible mask. In the existing code,
   cpus are being marked present quite late within smp_prepare_cpus()
   function, which gets called in context to the kernel thread. Since
   the cpu hotplug is not supported, present cpus are always equal to
   the possible cpus. But with cpu hotplug enabled, this assumption is
   not true. Hence, present cpus should be marked while MADT GICC entries
   are bring parsed for each vcpu.
2. Set possible cpus to include disabled. This needs to be done now
   while parsing MADT GICC entries corresponding to each vcpu as the
   disabled vcpu info is available only at this point as for hotplug
   case possible vcpus is not equal to present vcpus.
3. We will store the parsed madt/gicc entry even for the disabled vcpus
   during init time. This is needed as some modules like PMU registers
   IRQs for each possible vcpus during init time. Therefore, a valid
   entry of the MADT GICC should be present for all possible vcpus.
4. Refactoring related to DT/OF is also done to align it with the init
   changes to support vcpu hotplug.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 arch/arm64/kernel/smp.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index e43a8ff19f0f..51a707928302 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -509,13 +509,12 @@ static int __init smp_cpu_setup(int cpu)
 	if (ops->cpu_init(cpu))
 		return -ENODEV;
 
-	set_cpu_possible(cpu, true);
-
 	return 0;
 }
 
 static bool bootcpu_valid __initdata;
 static unsigned int cpu_count = 1;
+static unsigned int disabled_cpu_count;
 
 #ifdef CONFIG_ACPI
 static struct acpi_madt_generic_interrupt cpu_madt_gicc[NR_CPUS];
@@ -534,10 +533,17 @@ struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu)
 static void __init
 acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 {
+	unsigned int total_cpu_count = disabled_cpu_count + cpu_count;
 	u64 hwid = processor->arm_mpidr;
 
 	if (!(processor->flags & ACPI_MADT_ENABLED)) {
+#ifndef CONFIG_ACPI_HOTPLUG_CPU
 		pr_debug("skipping disabled CPU entry with 0x%llx MPIDR\n", hwid);
+#else
+		cpu_madt_gicc[total_cpu_count] = *processor;
+		set_cpu_possible(total_cpu_count, true);
+		disabled_cpu_count++;
+#endif
 		return;
 	}
 
@@ -546,7 +552,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 		return;
 	}
 
-	if (is_mpidr_duplicate(cpu_count, hwid)) {
+	if (is_mpidr_duplicate(total_cpu_count, hwid)) {
 		pr_err("duplicate CPU MPIDR 0x%llx in MADT\n", hwid);
 		return;
 	}
@@ -567,9 +573,9 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 		return;
 
 	/* map the logical cpu id to cpu MPIDR */
-	cpu_logical_map(cpu_count) = hwid;
+	cpu_logical_map(total_cpu_count) = hwid;
 
-	cpu_madt_gicc[cpu_count] = *processor;
+	cpu_madt_gicc[total_cpu_count] = *processor;
 
 	/*
 	 * Set-up the ACPI parking protocol cpu entries
@@ -580,8 +586,10 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 	 * initialize the cpu if the parking protocol is
 	 * the only available enable method).
 	 */
-	acpi_set_mailbox_entry(cpu_count, processor);
+	acpi_set_mailbox_entry(total_cpu_count, processor);
 
+	set_cpu_possible(total_cpu_count, true);
+	set_cpu_present(total_cpu_count, true);
 	cpu_count++;
 }
 
@@ -614,6 +622,9 @@ static void __init acpi_parse_and_init_cpus(void)
 	acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT,
 				      acpi_parse_gic_cpu_interface, 0);
 
+	pr_debug("possible cpus(%u) present cpus(%u) disabled cpus(%u)\n",
+		 cpu_count+disabled_cpu_count, cpu_count, disabled_cpu_count);
+
 	/*
 	 * In ACPI, SMP and CPU NUMA information is provided in separate
 	 * static tables, namely the MADT and the SRAT.
@@ -684,6 +695,9 @@ static void __init of_parse_and_init_cpus(void)
 		cpu_logical_map(cpu_count) = hwid;
 
 		early_map_cpu_to_node(cpu_count, of_node_to_nid(dn));
+
+		set_cpu_possible(cpu_count, true);
+		set_cpu_present(cpu_count, true);
 next:
 		cpu_count++;
 	}
@@ -768,7 +782,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (err)
 			continue;
 
-		set_cpu_present(cpu, true);
 		numa_store_cpu_info(cpu);
 	}
 }
-- 
2.17.1



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
