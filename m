Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp298181lfq;
        Wed, 16 Sep 2020 02:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcHSLCEftEYbsr82RvSf2U7yrj2Q4ubCNaH+nj5Z9sV1ZnGsOj5yKO5UOyBlGs3SoagkV7
X-Received: by 2002:a25:e643:: with SMTP id d64mr31937399ybh.431.1600248418591;
        Wed, 16 Sep 2020 02:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600248418; cv=none;
        d=google.com; s=arc-20160816;
        b=DKJHyN92/QwlzgDaSwHsS7P20TWVqVQuAkVbT50XYLQA4GKyP2vKdNd/KKr+7d8BcI
         DZi5imONnKEqADvb/2M6n2ImrhLvahwoKMz9FIaEUP/xbrQnWHrg7Y6a/klaUAqo58Ex
         FmmgV9nMmGAUHrTb/cB1UzdhebKjLSqE4K5JKVXgYFdZY9G9HQQtkiC8J9GomyQB1TAr
         YnfG8kWLDK19mJAigRsEoxmfjNQZ4PXn+qtVx6scR9N/653UCteLHmCaboH5VzU8p3bP
         ZUypXOfJj+rANGJ8XXcDHrOD16C81Fv72H7cdJZ3vcRrPK+ovupGQk1Pt+xchWOtBwQ1
         GL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hhsaugpWiFwFc4SoYUPLxMZx9qgqTYv00DKouNTKEiM=;
        b=Esc7HO/hVoj0e4NlyJ8Q7b2dg5pBLo7vc1vm8MjDd1uFpOET/khYCweX+IqwfhWsEg
         jzrF6LUmKMzlh5EwZvvWv/rQGACClnroG+8XwtnnpX/gXWmKYfpkYEdpSwvvJQkdcA/U
         YzcdDy19CaNrNEPgH4jDCduCkUMat3Yvx5ciqztZXK0kSQvdhCpjqAfRrJYEfRqBDWcy
         jcpILSDqavYxTjOWdR26+gkpouV9DO2iCv3cG0QHTFVHfROWnZeduvW33kv+w4eXp4Ke
         DyMUsnHh4Hhi6zTcrxeMdNbVe6bkkn7F5MouUFTwFJptHUGznc+nAE3qey+e/Yva1R52
         KWFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ElImVLzb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z186si15731964ybz.459.2020.09.16.02.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 02:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ElImVLzb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kITiM-0008TH-00
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 05:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kITi5-0008Ry-52
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 05:26:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43016
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kITi3-0005FE-42
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 05:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600248395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhsaugpWiFwFc4SoYUPLxMZx9qgqTYv00DKouNTKEiM=;
 b=ElImVLzbTsJGOWAHBGE5ryEgu240Ugc4N7VXxMrcJZCPJslu7S2UdF5B6LYzVM8zndEKRm
 r7zWzgussTl2yFWZePS+F68KMM04YpmL2rwBtPXo1EXy9wztZzbD1KfcRI33q50SVH6ccy
 +q7+Y6Hq0sW6h9bjaqRDyvRcVVUfOgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-Y1n4RPRcNAmlndGaM9zJkA-1; Wed, 16 Sep 2020 05:26:32 -0400
X-MC-Unique: Y1n4RPRcNAmlndGaM9zJkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA907186DD3A;
 Wed, 16 Sep 2020 09:26:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A3E3607A1;
 Wed, 16 Sep 2020 09:26:29 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 2/5] hw/arm/virt: Move post cpu realize check into its own
 function
Date: Wed, 16 Sep 2020 11:26:17 +0200
Message-Id: <20200916092620.19161-3-drjones@redhat.com>
In-Reply-To: <20200916092620.19161-1-drjones@redhat.com>
References: <20200916092620.19161-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:41:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bdZBbcYQ8bB/

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
index acf9bfbeceaf..2cba21fe3ad9 100644
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

