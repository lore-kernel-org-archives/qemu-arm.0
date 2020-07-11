Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1530386lfm;
        Sat, 11 Jul 2020 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl7PvD9gkcuzY5fCL7Mei5I4AD0f9eRqAFP6qQOCcMn3OVvJCUnPPmha3rLFb+qzFl5rAZ
X-Received: by 2002:a25:8802:: with SMTP id c2mr29197723ybl.444.1594462256050;
        Sat, 11 Jul 2020 03:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594462256; cv=none;
        d=google.com; s=arc-20160816;
        b=LGWnivv6XDyzHyOmvuE2EqUO1nByDPboah3r4RXW+E5/sfNaqV/WyuV5HYSictibQY
         v0TLuER8+2UOn7ht0xsvUEMsWpAIP4MaUvLM+CN0WYWscRr8Enz+Hn6HDT4iZ6D/Fp4t
         i0UEPpqSwNNRwgaGuM7SMbr4b9SHTysyzlQI7TV8b/UiB3d44+96HzOT3L2Bo0yzoxdp
         qw2BaYleewZoryHXt5yHL8T2tw0SI4h6MT6+teKFYTxhfQkHmA5Nx8NRMp7FhnA+TdAe
         IQSPgIBo3QymCd/lOn9+cRDPJkPxtL03LeJokC4HMCgcfYSvURASMi4DXBrx4ZT+oZ7u
         Cmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V0XJQDKBVgwTNqB7JV+NoE0714DNBcenljLxGJNaaw4=;
        b=IXnA9Kh0r7W4pQ0EuK64sE95ZJ+g9Z8n4Rzh0cYBuF4fFw+5IPJg7hf1CHpFm4saYw
         kJvbEYbhvwAxseBYdayt7u//kDl+GwHZjjXW+trWbYwWwswVfIjs8FITKpKweFClhBdK
         34Cao17pOdGAyEckwp1x3XX36tp3HVmio/wQP8FsF5cB08DpDNGebZutD+lSmIhgUWGR
         WOHyivyO4zlnpiejRmOrMeoMSD6txpE14ZRYQIVsYZckJtHz2FfsLD9oMt6qAqKn+/it
         JFnLFN6agPCgcMAK5ooex3RPNxMOksxH/Vu4K6W9YbqZ4c6gA1GJUI3O18pkaLVhsA94
         PGIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="S/z1RjSo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w130si2174628ybe.471.2020.07.11.03.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 03:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="S/z1RjSo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juCT9-0000Yl-6J
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 06:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1juCT0-0000YS-A7
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 06:10:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42638
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1juCSx-0008Co-LI
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 06:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594462241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0XJQDKBVgwTNqB7JV+NoE0714DNBcenljLxGJNaaw4=;
 b=S/z1RjSo0PT1dRKDwZDskygrbbV2JFGcfsiTE+lyBmyY6acfoHo0oUbkeWJofNvOmgmKS0
 gibQ0zYuMuWjGx0/x5McVXOZC+Xvj+F/cHmw4Bb7NtAE1o9KPtS16Oi4CFKSMebri+xLz8
 tcHwRm2TQdjVDxoX8PkJGIon+nPxglw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-zDSPhT-QMkS70ACslbHPKQ-1; Sat, 11 Jul 2020 06:10:39 -0400
X-MC-Unique: zDSPhT-QMkS70ACslbHPKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDC51107ACCA;
 Sat, 11 Jul 2020 10:10:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79B9B610F2;
 Sat, 11 Jul 2020 10:10:37 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/3] hw/arm/virt: Move post cpu realize check into its own
 function
Date: Sat, 11 Jul 2020 12:10:31 +0200
Message-Id: <20200711101033.47371-2-drjones@redhat.com>
In-Reply-To: <20200711101033.47371-1-drjones@redhat.com>
References: <20200711101033.47371-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/11 06:10:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +9ML77ylGsWF

We'll add more to this new function in coming patches so we also
state the gic must be created and call it below create_gic().

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9005dae356be..cb2fa99b1ef5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1672,6 +1672,31 @@ static void finalize_gic_version(VirtMachineState *vms)
     }
 }
 
+/*
+ * virt_cpu_post_init() must be called after the CPUs have
+ * been realized and the GIC has been created.
+ */
+static void virt_cpu_post_init(VirtMachineState *vms)
+{
+    bool aarch64;
+
+    aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
+
+    if (!kvm_enabled()) {
+        if (aarch64 && vms->highmem) {
+            int requested_pa_size = 64 - clz64(vms->highest_gpa);
+            int pamax = arm_pamax(ARM_CPU(first_cpu));
+
+            if (pamax < requested_pa_size) {
+                error_report("VCPU supports less PA bits (%d) than "
+                             "requested by the memory map (%d)",
+                             pamax, requested_pa_size);
+                exit(1);
+            }
+        }
+    }
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -1873,22 +1898,6 @@ static void machvirt_init(MachineState *machine)
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
 
-   if (!kvm_enabled()) {
-        ARMCPU *cpu = ARM_CPU(first_cpu);
-        bool aarch64 = object_property_get_bool(OBJECT(cpu), "aarch64", NULL);
-
-        if (aarch64 && vms->highmem) {
-            int requested_pa_size, pamax = arm_pamax(cpu);
-
-            requested_pa_size = 64 - clz64(vms->highest_gpa);
-            if (pamax < requested_pa_size) {
-                error_report("VCPU supports less PA bits (%d) than requested "
-                            "by the memory map (%d)", pamax, requested_pa_size);
-                exit(1);
-            }
-        }
-    }
-
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
                                 machine->ram);
     if (machine->device_memory) {
@@ -1900,6 +1909,8 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms);
 
+    virt_cpu_post_init(vms);
+
     fdt_add_pmu_nodes(vms);
 
     create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
-- 
2.25.4

