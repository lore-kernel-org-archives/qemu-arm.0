Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1237725lfb;
        Fri, 10 Sep 2021 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLdE5t6YEDki309gmQOLbimFvIHb0TWUw/LAXBSRqpib25Z5BXGUPvJgFbniiBF3Tgewaj
X-Received: by 2002:ab0:3415:: with SMTP id z21mr2623369uap.115.1631284961262;
        Fri, 10 Sep 2021 07:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631284961; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZG4FH/iy8mb5Voky8Tf++4tgGa3RUF0J1Y2EFLHZEPkLQOTq+JkSo7T8IU7gcrz07
         yDuqD5swiXP/ALo/2E9shWyEl0zIBcfT4zjQpiBoN5/61UKQ+PcVf+Y8H88UGdK37uUF
         Zz5OVhdWcw9uuGFi5UPZ9ohiG7s8Vx3CWM/dzojyRQmBS6Lb3oqVr+caLkbEr7wb62Rh
         xu8i4Q4q3axocN77T9R65KOI6TA0Zl/tGKD1A37JIJJ97oTrbjm3wVQDBf43D+gh9Vqj
         1cJGpemWDue97gij4+TSiUj5SspG/uo6wm0Yi2ILlEONBHRltdGmPDGKYPokCQnPFvNQ
         MWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zlb0HsQWoS5ea9vumF8XRLzz0YZw6JIfSm47fIH9pT0=;
        b=DlrKaiNwl6TKPRoW8vTiyhbsyOdSmuS607AnAmtzHPxWewAMzl3L3QNbOS3rWvWbtb
         M3HyMo1KstI2k0lGIGkHWB/yQQ2K8UOQJkShUT28refyfQLu7n/GXgGCnf0UzNpshjFw
         KWDKSxfEVGRz5sKlpvtlEnA/wusdghHX75vauf9xIxZq9hRbH6TNkXwK1KR1k6k183y1
         Io+eQuve+1lfW7SDsQ57rpN2OOxzAgH+n4+F0mV0dbpps8wystZv0GZHg0ujmbVzXIyn
         BjehS4ODAXh6foEdvk7fT8Yq2zUW62x9a2y6JCU9UVTd+3QKC4ok5HYh8pSq6emu5xls
         eE1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PqH1L7km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si1847990vsb.329.2021.09.10.07.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 07:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PqH1L7km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOhjk-0006Jy-D2
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 10:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhhG-0002PW-L5
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:40:06 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:37469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhhB-0002yw-4F
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:40:06 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id a12so1375645qvz.4
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zlb0HsQWoS5ea9vumF8XRLzz0YZw6JIfSm47fIH9pT0=;
 b=PqH1L7kmhN+vYlpaWydP0BCZapqUY5JUCoBo2w1V0YAxBGUOoyISoS8cGjYwTROmwg
 xm40aMxnjpTMXh+P2h8Qbe96qTtRA+vyaIfx8O73FNV/m4Mj19XDYw31rit5+hD1aaHo
 eBzKmwjJI+dAr5vBz4CZZXgYjq5svlAXBFQqqqV8zjBtGTAIGVw4pq79odDOx4VzUz5I
 u8wDbwxmqwGu2X9BtPw05Jgv4t165AXdBYLDj61vuJyg7uvMJR4fXw8peWLYiZdhzMvX
 9DyxU2l+KTnO+Fv41x63iWhx5hC8Jz7OjuwuSua/e6doUzN8eSCAAwHWoa1mg/K+AnB9
 QZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zlb0HsQWoS5ea9vumF8XRLzz0YZw6JIfSm47fIH9pT0=;
 b=yjmdAqqxRQmWtVseVM7FWDkkyshQfBLcHhipStYs4LuUxu6yYMJ2SLia3EquJWQHbm
 uftMPz4B5cF4//eyEBy2quSu2bGQwIYAYsylfN8g33ZScU2CMK5v8hZdA/9x5D4fzRQ3
 +MSak5TnrqE2hBVKTUlx2nlD/e31mPBGe0quEzfU/bScn+G9KvqOA7NFyEu64dxENtjF
 GRYpWhZfkCBY6EIZFdzdw6wOiPNNnuemclaqR9OCkwSGc6JPIVRrh+Ak7XTN4AInX4eL
 DXrepOLCrWNxX/3LYdETU59T4ge0sve96RYTljkSFipsM/V78yVih6Er9XeQe8Wv6fTl
 I7OQ==
X-Gm-Message-State: AOAM532sodUDevCpPV8XHkrODf/74IQ74zuCpTxFrf4vS3dK6z/zpr4G
 Rv6jcqa53+g8NQ5Q+Lgb6/a4Kg==
X-Received: by 2002:a0c:ef4b:: with SMTP id t11mr8593446qvs.57.1631284800250; 
 Fri, 10 Sep 2021 07:40:00 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:39:59 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 8/9] hw/arm/virt: add ITS support in virt GIC
Date: Fri, 10 Sep 2021 10:39:50 -0400
Message-Id: <20210910143951.92242-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210910143951.92242-1-shashi.mallela@linaro.org>
References: <20210910143951.92242-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KYnly6cZdA/6

Included creation of ITS as part of virt platform GIC
initialization. This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 29 +++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  2 ++
 target/arm/kvm_arm.h  |  4 ++--
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73e9c6bb7c..1d59f0e59f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -584,6 +584,12 @@ static void create_its(VirtMachineState *vms)
     const char *itsclass = its_class_name();
     DeviceState *dev;
 
+    if (!strcmp(itsclass, "arm-gicv3-its")) {
+        if (!vms->tcg_its) {
+            itsclass = NULL;
+        }
+    }
+
     if (!itsclass) {
         /* Do nothing if not supported */
         return;
@@ -621,7 +627,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -655,6 +661,14 @@ static void create_gic(VirtMachineState *vms)
                              nb_redist_regions);
         qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
 
+        if (!kvm_irqchip_in_kernel()) {
+            if (vms->tcg_its) {
+                object_property_set_link(OBJECT(vms->gic), "sysmem",
+                                         OBJECT(mem), &error_fatal);
+                qdev_prop_set_bit(vms->gic, "has-lpi", true);
+            }
+        }
+
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
@@ -2039,7 +2053,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
@@ -2742,6 +2756,12 @@ static void virt_instance_init(Object *obj)
     } else {
         /* Default allows ITS instantiation */
         vms->its = true;
+
+        if (vmc->no_tcg_its) {
+            vms->tcg_its = false;
+        } else {
+            vms->tcg_its = true;
+        }
     }
 
     /* Default disallows iommu instantiation */
@@ -2791,8 +2811,13 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+
+    /* qemu ITS was introduced with 6.2 */
+    vmc->no_tcg_its = true;
 }
 DEFINE_VIRT_MACHINE(6, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c46699..b461b8d261 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -120,6 +120,7 @@ struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
     bool no_its;
+    bool no_tcg_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
@@ -141,6 +142,7 @@ struct VirtMachineState {
     bool highmem;
     bool highmem_ecam;
     bool its;
+    bool tcg_its;
     bool virt;
     bool ras;
     bool mte;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..0613454975 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
         /* KVM implementation requires this capability */
         return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
     } else {
-        /* Software emulation is not implemented yet */
-        return NULL;
+        /* Software emulation based model */
+        return "arm-gicv3-its";
     }
 }
 
-- 
2.27.0

