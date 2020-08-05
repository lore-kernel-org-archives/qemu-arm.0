Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp434597lfy;
        Wed, 5 Aug 2020 02:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMPdFX20lEMx491powTNl4JtPuW8QhbqYUUsux/DehB6U/j/vvMoBTiS2i9VGPX1gnMeMS
X-Received: by 2002:a25:8089:: with SMTP id n9mr3317984ybk.44.1596619127007;
        Wed, 05 Aug 2020 02:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596619127; cv=none;
        d=google.com; s=arc-20160816;
        b=aaSnG3+UYUeUA9gcQmXXzaAiqVtHM2eid0jJNJBkzGayDDnk+/MMvkzCyW5YMMbjnO
         +crZdap08ORjvDd83n8biD4gdv7UwYTPs1tBO4KRs66f2eQJEEtQTpG3V1RvDyTFtLsF
         xsHPCZWtQagz3u4ugoB7kXzkDWVLgEuUQ+cUWNEoQmGtal5iyVTyE4ClSeMXOLi1HFeO
         1T9jePv9EB2DPYtzSy6zGtywiQ6PvgTJW/VDHGg2W4phHlZ+qgDR944kWGyMu0hUDVuK
         Vgnf0eOOaKjoFj27enXCY1i24UuigRTMsD8pCIFJbmVMe3zqgi91OD7lo0zBm3B3U1B0
         wrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J99HLmEIThaLCCZCR99/ESk/rkShlj/GIdpjJrYfWy0=;
        b=ZTPQWxg/NxKddJy6Buz1YIdsi6z3MbCp3vFrIwCQgAEvXDfMa6Z0LHaK5aY/SxczeY
         whZS75EmTyuf5P57OQgp7Qzbj1GkxA/7Y+LXev2bmC61tHgFrVvF2Fxnr1m/ecQ9Rc8b
         rCz7CgGsTWpqfuBrvTSl8Pp3Cj3BT2wh4vhwnXNWiETYDC3Ti0c78X6taYkvZZJt90iD
         0Ar4jYDVig+ht96ENzU8mwvpqZ0vxNTvCWMzS1AkojcYrMN1qDhFyfeoq1VSa8ZcspZZ
         RrhfnhTzkSu2WodfKeumftVHNLBsJWovU2FEyD0uJ6kQby64UNl8Ds8FY0fxVfRbn7DL
         h5pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BCypG/Dc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si1683182ybj.30.2020.08.05.02.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 02:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BCypG/Dc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3FZO-0001X7-Bz
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 05:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k3FXc-0007Fh-Ly
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:16:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53451
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k3FXX-0003jH-44
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596619010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J99HLmEIThaLCCZCR99/ESk/rkShlj/GIdpjJrYfWy0=;
 b=BCypG/DcBX+47+MTTo2I6Kt8SUSSC/1BHeQxowNjZwKXEKj07N1mPPsAL7rLI8ttK0uoiT
 q+RPQFNwssWga57P2d6b+y3l5iRjsvaOyEl9wMmSfjFEIG+aBEPI6iXwcA4kKC9990U1Mq
 1KQjXG7Eq3sQ/ANLyHV31MDOdd+xL0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Xh10qcC0P56QBse70mn95A-1; Wed, 05 Aug 2020 05:16:48 -0400
X-MC-Unique: Xh10qcC0P56QBse70mn95A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08E6100AA28;
 Wed,  5 Aug 2020 09:16:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 909BC2DE66;
 Wed,  5 Aug 2020 09:16:46 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 3/5] hw/arm/virt: Move post cpu realize check into its own
 function
Date: Wed,  5 Aug 2020 11:16:38 +0200
Message-Id: <20200805091640.11134-4-drjones@redhat.com>
In-Reply-To: <20200805091640.11134-1-drjones@redhat.com>
References: <20200805091640.11134-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 04:10:11
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wkS2Zy57CjHr

We'll add more to this new function in coming patches so we also
state the gic must be created and call it below create_gic().

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
2.25.4

