Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp450510lfm;
        Sat, 13 Jun 2020 14:46:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykEaYKJ9yy/Lj4cSzSNKs+QG/6ndhmdru1GjXD/2p3VRBeR49ntkF2avrZGuDHWK5jeU1f
X-Received: by 2002:a5b:b4c:: with SMTP id b12mr28452003ybr.433.1592084773704;
        Sat, 13 Jun 2020 14:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592084773; cv=none;
        d=google.com; s=arc-20160816;
        b=aryjlUo60ISE/OnHvRLUVmSr6YS7zVPXvW2OsPECLFVAU6NtELysQwcS5rh1XcJ3f6
         tQdYGp8duTEAVLPAuN5D+UZhxZV8XZHEOsAzvjwGWy+HqoxJAS6Su82KOHzII1RSGp7S
         xDxhW36Xn831FMT6IcR5ip/8GJK20MPOCPuq3owyYJDVSllEFBLXssK37fhP7RBSijJm
         u8ghkDka1iJBbtma3mFxoTAhAuHA7cFzQYYjhfKulI7w35/VAqtLLLzYC5O5lyrq5l0z
         0uGRav6jGXUFTFIsH43qHL2h6SE3lgZ1ey4d+WXtWaZhfrdXrAw1kb9jRVt5l+3/NlVE
         CjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=HDc5SqTaiv5cjFQdsPhWGO1JmoYIcr+nMKCwD0LLu4M=;
        b=0uHIOc9a9AfYCPE3UJXQmBwWEe74tCq66NBvah+B+TtVyyp+yLuKek43iuGvmR8+uM
         OZSQkYHT1/R+cuPFXfk06Kr4B/GP5iOAfvaS5AHDE2BforQbhliEFWNk5opUAwmx/fER
         cw1oD+wLt33ySzYGE8PsNPqT2ErLml4tclDcCBCn/RHRCnYAYSWAAYI1OuBsRYR0iQTd
         BlvoVWLKOA0r7k0Vk1zVu9ix9It6VeA7asgNmhiTzPXt4cxzQZZn1HdehEaZZs+Kc/LM
         uJNxMSgZwdSeS49ap4JmxqB5kJuLyvQL/S+FcBfuit/r3Uw1abI/n1rl61lthiGnKEOX
         /8Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si8924153ybk.395.2020.06.13.14.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkDyf-0006np-1V
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDx6-0005A1-JT; Sat, 13 Jun 2020 17:44:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3706 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDx4-00036A-F1; Sat, 13 Jun 2020 17:44:36 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3046C9153F694E10A53E;
 Sun, 14 Jun 2020 05:44:30 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:44:23 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 02/22] arm/cpuhp: Add new ARMCPU core-id property
Date: Sat, 13 Jun 2020 22:36:09 +0100
Message-ID: <20200613213629.21984-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A3CABkJt1IUD

This shall be used to store user specified core index and shall be directly
used as slot-index during hot{plug|unplug} of vcpu.

For now, we are not taking into account of other topology info like thread-id,
socket-id to derive mp-affinity. Host KVM uses vcpu-id to derive the mpidr for
the vcpu of the guest. This is not in exact corroboration with the ARM spec
view of the MPIDR. Hence, the concept of threads or SMT bit present as part of
the MPIDR_EL1 also gets lost.

Also, we need ACPI PPTT Table support in QEMU to be able to export this
topology info to the guest VM and the info should be consistent with what host
cpu supports if accel=kvm is being used.

Perhaps some comments on this will help? @Andrew/drjones@redhat.com

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c    | 5 +++++
 target/arm/cpu.c | 5 +++++
 target/arm/cpu.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5d1afdd031..c4ed955776 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1778,6 +1778,7 @@ static void machvirt_init(MachineState *machine)
                           &error_fatal);
 
         aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
+        object_property_set_int(cpuobj, n, "core-id", NULL);
 
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
@@ -2081,6 +2082,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int smp_threads = ms->smp.threads;
     VirtMachineState *vms = VIRT_MACHINE(ms);
 
     if (ms->possible_cpus) {
@@ -2093,8 +2095,11 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     ms->possible_cpus->len = max_cpus;
     for (n = 0; n < ms->possible_cpus->len; n++) {
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
+        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
+        ms->possible_cpus->cpus[n].props.has_core_id = true;
+        ms->possible_cpus->cpus[n].props.core_id = n;
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
         ms->possible_cpus->cpus[n].props.thread_id = n;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 32bec156f2..33a58086a9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1086,6 +1086,9 @@ static Property arm_cpu_has_dsp_property =
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
+static Property arm_cpu_coreid_property =
+            DEFINE_PROP_INT32("core-id", ARMCPU, core_id, -1);
+
 /* This is like DEFINE_PROP_UINT32 but it doesn't set the default value,
  * because the CPU initfn will have already set cpu->pmsav7_dregion to
  * the right value for that particular CPU type, and we don't want
@@ -1168,6 +1171,8 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
     }
 
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_coreid_property);
+
 #ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         /* Add the has_el3 state CPU property only if EL3 is allowed.  This will
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 677584e5da..5c4991156e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -949,6 +949,7 @@ struct ARMCPU {
     QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
+    int32_t core_id; /* core-id of this ARM VCPU */
 
     /* Used to synchronize KVM and QEMU in-kernel device levels */
     uint8_t device_irq_level;
-- 
2.17.1


