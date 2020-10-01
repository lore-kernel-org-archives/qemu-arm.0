Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp249035lfq;
        Wed, 30 Sep 2020 23:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxHNWE3YXMFzQrilbSs38lSpsrafCwheb3z3m3H3iOxORiGjq/1O3+Id8YbkgboP5BccNj
X-Received: by 2002:a25:5907:: with SMTP id n7mr8546136ybb.324.1601533296440;
        Wed, 30 Sep 2020 23:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601533296; cv=none;
        d=google.com; s=arc-20160816;
        b=ukrcam2JPC4dUrUJDuePYGJDH+Kk9LZTb/5RGyb8FTER14GfpWkj/ICLXiwEQa5eRy
         xj389OOeKcrFvangsYQkHgm0jayPu/LmIF21hcMVp7xwSRBrrZ1oEo2As0+7Bvkf9PxY
         aG7j0V4zbVL29A6LRK7a5X5x+Mzo8P1leSx+r9VksE9EfDjXw9mj+nzfiRXg9XbTPAwM
         GbVZzbhWH0yAkgWy60hNQy1YKcTIpOCwX7FjFi2tYJD9j+LKWimWlzdWVFqwuaYSbr0Z
         iKxhYXCRcZGLEEXpGt9+FnNL99qddKv/Qc6XoYmoYm5jGQG2fP4UUrpTld4qt1OYfSzx
         AyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jlrJ3kLUFV/YV4bCTxJQhgwV/nme212RrN8MphOvkyM=;
        b=Jer6uWqxSUV7xi6OQfmXYuQGvOvuIY4cDbXbEpDFLJ6/zlN7SPLP/bFCkthHmZBVxA
         +/7ic6yzgW2tiM1yZxET+oUmEc+7ZUVYyhhonsISnFvuTyCMyK480EjalM5a9YprZFxt
         5tCEr5L98AIxQMv6aV1Gr7Pz3s0tfLcO54yYXp1FAtF/avCUgzFK0sEkp7zcvCUoA6oA
         FTbbOklgvYfcRYcVLpMVJUmMGD3a0eKWNjEyOPRtNCrwR7OSB0xxE6Yio7Tx9YogjUxM
         14ucTSX4P/+DL6fWfueepTA+EIpTwz6MdnBBUgSVxNG1d/IyX/CziwDVOOo1rXqc1RIu
         XFbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iEPvECuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t46si4220608ybi.442.2020.09.30.23.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 23:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iEPvECuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNryB-0001Ec-Sa
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 02:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruL-0004J9-MG
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruJ-0003sD-Mc
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601533055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlrJ3kLUFV/YV4bCTxJQhgwV/nme212RrN8MphOvkyM=;
 b=iEPvECuUllH0Zg4TYBL2CsCCP8lt1HYrhg0wt79g44kMte51LcOZKEMh8iA13DPdu9Lchv
 WVseNVr2l075XMSXRmK1oTqs1+htqH0QQvFWH4hlW8cR3/ezRhLtL6XNDtypjPQ6oqejem
 MyYbhCVXN7APDo8gpuADb7XYxpM19Gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-zvIE77b3M4W4CAqok1rnRQ-1; Thu, 01 Oct 2020 02:17:33 -0400
X-MC-Unique: zvIE77b3M4W4CAqok1rnRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A9A31868433;
 Thu,  1 Oct 2020 06:17:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21FCA5577A;
 Thu,  1 Oct 2020 06:17:28 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 3/6] hw/arm/virt: Move post cpu realize check into its own
 function
Date: Thu,  1 Oct 2020 08:17:15 +0200
Message-Id: <20201001061718.101915-4-drjones@redhat.com>
In-Reply-To: <20201001061718.101915-1-drjones@redhat.com>
References: <20201001061718.101915-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 00:27:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ola2h/8aNAEB

We'll add more to this new function in coming patches so we also
state the gic must be created and call it below create_gic().

No functional change intended.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1231a197c850..524eafe22df8 100644
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
@@ -1886,22 +1911,6 @@ static void machvirt_init(MachineState *machine)
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
@@ -1913,6 +1922,8 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms);
 
+    virt_cpu_post_init(vms);
+
     fdt_add_pmu_nodes(vms);
 
     create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
-- 
2.26.2

