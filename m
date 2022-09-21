Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2758442ejy;
        Wed, 21 Sep 2022 16:21:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OiEs/sFMxuOnyJJTF9nS8zP98qt/Xd5MEKlh+uuVYA7umlUHB8iSlwnnIv8XOZjC25ehM
X-Received: by 2002:ac8:4e90:0:b0:35d:4c5:7e4e with SMTP id 16-20020ac84e90000000b0035d04c57e4emr665150qtp.117.1663802462633;
        Wed, 21 Sep 2022 16:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663802462; cv=none;
        d=google.com; s=arc-20160816;
        b=cD6kn4PjH6yA0eqM5zMp0scndBONIHynTEtxiPuUj5cUykkbwZIAo1y9BWCPONyqa8
         J7ycLnMpuGwBJZIUbaG122Vu7p3nsNNCy/s12uDlmMqzEDxVjVsl5jxY2+heyWDRx25L
         SgiJUN3vVKXmCfnpPhKpEyB/LA76c0X2gQHB/SKqRgztFGoK8tUSQDGbsy/hB2b8cKo5
         SswXqJghIG9vP0613HLfe+Bba2ohIY86T+7vdhUss5ZMD5R5xQLI/I/BuikJzNb+EsZY
         0pbsc2vRPayLH8LCUmzwKhL3tnoTlnQ0PQeSVgolE7df4S0HIQp6hqVT1oi/2CBeca+E
         yBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Me8ulcsbNjHsaAKjtva3HKYWvRtkDuDwNDWtdQMzMFY=;
        b=IWfJu31gR/uc7EReKB+qVy356nFHRl7JkuP5jWx22jGJLfEYc/qmDSfGYtIiJgKGm8
         dUc+OgCZejcHITLrlX/pMBVlgl1LM3D/mVtC5QgfMZqFeGBCNyCuJcUTIsl0D/hMReUh
         qZXbiJ0gkmG51RgZIgF6IpnVV56BXKAregrB1LXyGKplY/vtKFYWL0+Pka5iUOe5/Rx0
         LDULwKrpNyzsTr7/jGXUAfqfd5I9XG3pDpxDnHBliH5GGF4uRIbW33/F2Sj6GVq9IAQI
         W+cvbwYP1DOC52MjRdLsPE4DZmY1hqRZ6c4+jxruGXBT5zYPMc/B21MtZ+aXEN4J0EGZ
         Jq8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DFwu2T7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm42-20020a05620a1d6a00b006b9cd2282a6si2453189qkb.711.2022.09.21.16.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 16:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DFwu2T7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ob91a-0006hk-3q
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 19:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8v9-0000BD-Kf
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8v7-0001tv-WD
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663802060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me8ulcsbNjHsaAKjtva3HKYWvRtkDuDwNDWtdQMzMFY=;
 b=DFwu2T7cR2hHDfvSp2xijfm0M/GxNjjhnqqON8JlQ0gP1+bXFwBLhoUtcoqsCIaaprOERE
 EKQYiha5vUNN2RkWhO9AShQ77Rv8EulZu7OIeGMeJN/taJV79REKFAN64VEGuQzJBPry9O
 ZdelAeEHXdtb2QhXt+vq11XTTwgRXFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-p9X1P-2FMFWP5c2lVdybgA-1; Wed, 21 Sep 2022 19:14:17 -0400
X-MC-Unique: p9X1P-2FMFWP5c2lVdybgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 315DC862FDF;
 Wed, 21 Sep 2022 23:14:17 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DEBA2166B26;
 Wed, 21 Sep 2022 23:14:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v3 5/5] hw/arm/virt: Add 'highmem-compact' property
Date: Thu, 22 Sep 2022 07:13:49 +0800
Message-Id: <20220921231349.274049-6-gshan@redhat.com>
In-Reply-To: <20220921231349.274049-1-gshan@redhat.com>
References: <20220921231349.274049-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qr/5HkeTejsB

After the improvement to high memory region address assignment is
applied, the memory layout is changed. For example, VIRT_HIGH_PCIE_MMIO
memory region is enabled when the improvement is applied, but it's
disabled if the improvement isn't applied.

    pa_bits              = 40;
    vms->highmem_redists = false;
    vms->highmem_ecam    = false;
    vms->highmem_mmio    = true;

    # qemu-system-aarch64 -accel kvm -cpu host \
      -machine virt-7.2 -m 4G,maxmem=511G      \
      -monitor stdio

In order to keep backwords compatibility, we need to disable the
optimization on machines, which is virt-7.1 or ealier than it. It
means the optimization is enabled by default from virt-7.2. Besides,
'highmem-compact' property is added so that the optimization can be
explicitly enabled or disabled on all machine types by users.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 docs/system/arm/virt.rst |  4 ++++
 hw/arm/virt.c            | 33 +++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  2 ++
 3 files changed, 39 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c1..f05ec2253b 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -94,6 +94,10 @@ highmem
   address space above 32 bits. The default is ``on`` for machine types
   later than ``virt-2.12``.
 
+highmem-compact
+  Set ``on``/``off`` to enable/disable compact space for high memory regions.
+  The default is ``on`` for machine types later than ``virt-7.2``
+
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
   Valid values are:
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b702f8f2b5..a4fbdaef91 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1734,6 +1734,13 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             base = region_base + region_size;
         } else {
             *region_enabled = false;
+
+            if (!vms->highmem_compact) {
+                base = region_base + region_size;
+                if (fits) {
+                    vms->highest_gpa = region_base + region_size - 1;
+                }
+            }
         }
     }
 }
@@ -2348,6 +2355,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
     vms->highmem = value;
 }
 
+static bool virt_get_highmem_compact(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_compact;
+}
+
+static void virt_set_highmem_compact(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_compact = value;
+}
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2966,6 +2987,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable using "
                                           "physical address space above 32 bits");
 
+    object_class_property_add_bool(oc, "highmem-compact",
+                                   virt_get_highmem_compact,
+                                   virt_set_highmem_compact);
+    object_class_property_set_description(oc, "highmem-compact",
+                                          "Set on/off to enable/disable compact "
+                                          "space for high memory regions");
+
     object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
@@ -3050,6 +3078,7 @@ static void virt_instance_init(Object *obj)
 
     /* High memory is enabled by default */
     vms->highmem = true;
+    vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
@@ -3119,8 +3148,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
 
 static void virt_machine_7_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_7_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
+    /* Compact space for high memory regions was introduced with 7.2 */
+    vmc->no_highmem_compact = true;
 }
 DEFINE_VIRT_MACHINE(7, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6ec479ca2b..c7dd59d7f1 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -125,6 +125,7 @@ struct VirtMachineClass {
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
+    bool no_highmem_compact;
     bool no_highmem_ecam;
     bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
@@ -144,6 +145,7 @@ struct VirtMachineState {
     PFlashCFI01 *flash[2];
     bool secure;
     bool highmem;
+    bool highmem_compact;
     bool highmem_ecam;
     bool highmem_mmio;
     bool highmem_redists;
-- 
2.23.0

