Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2784915ejn;
        Tue, 11 Oct 2022 16:21:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5q/wjnWZAbRVTCDwyjStd2ERa1/GCffjiyuaTTRul34cxJ/WkcMSLSQBu7xuLAIr4mjWPk
X-Received: by 2002:a05:620a:22c3:b0:6ec:53bb:d296 with SMTP id o3-20020a05620a22c300b006ec53bbd296mr11100533qki.158.1665530475106;
        Tue, 11 Oct 2022 16:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665530475; cv=none;
        d=google.com; s=arc-20160816;
        b=lK5x5w9FDvQStLudgLLX/WRDdGh+JixuEULhqwOll/rrqAZTSjj0nCYHu9WgmmT427
         Co0UbO5bfcFkhuG18C/jBb5ukSbEy7651w9wHE28otWi1ZzJa5m3KEgmWoxpeTouF+9x
         MQMpXvUjX710m0+6rBWrDhcrFUFq1++kQ5q4tIzCdePn8qYllP2WtIyTzFvW0cnln76r
         jGms8MePtfIWQYINb0XjT9t20WhCHitCRS5poJ66KDZn0vTcsI+hpqfXy/8tIo+hJkHl
         fqxsrU32Ui9IMdKgA/iM9cu4n/Lye6lGgGbQy71PqlDRTp8brA7b0hLIf/j2qSVCCUPO
         4Gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WOV+X2uAyYJ1zbRPt7RYGPi78UrAvsYebPcSYhy9acs=;
        b=j7mzopq3RDkbDJ+bwyJ5Ls274hahb4KsqPh4YMZhXt8ZRis01wiQKR+4Z9qPk3hWlr
         1BWQ/h0fhBDdUnoO2GHSA3O8rHOXwgIQ25jvwIPUba3il0/cltTHFWqhO/bz/WaNbHsd
         tDd3E0zpUVxav/fQVqWtUMWvInrjEje4PGKNfxlmObcP1W9nMUJSIzPa8OfqV+UDaUeN
         Z+HGtWfm0uKGDMSKYZUsrJYumhjDFUOcjD/qa48dasCSKkg2kXPZn8c5VMHvZFLXySNG
         VbUiw0snXbMrH1WKtV/Q0ef6PE+IMtDeGC5lo/HucHfRCWTOYY+XU1EdfVBfQfuwTTxT
         N0hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PRNtc1xO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br18-20020a05622a1e1200b0035a7047cdd3si7860263qtb.476.2022.10.11.16.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 16:21:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PRNtc1xO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiOYk-00084q-HL
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 19:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOX2-0005Lx-VY
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 19:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOX1-0006Rn-3g
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 19:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665530366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOV+X2uAyYJ1zbRPt7RYGPi78UrAvsYebPcSYhy9acs=;
 b=PRNtc1xOuJpfYwx0bOY1VZWLEG1eIy7a1pXiftxDH6hpoXpUy1jkPq8XCWXZWbUuhUCYgD
 qYfYR6yMUPG9xxCVgAojX+uHYNGDJNpyyq1aixWoCMjhCcPmAgtEFjNcW4l22biD8xwp9r
 VhCZSgE85LQcVrkgsGGSKTLNSSptAeU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-Yu0iQ-DtNHKRONQrmrsRuQ-1; Tue, 11 Oct 2022 19:19:23 -0400
X-MC-Unique: Yu0iQ-DtNHKRONQrmrsRuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 080D1801585;
 Tue, 11 Oct 2022 23:19:23 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-52.bne.redhat.com [10.64.54.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 991BA2166B2F;
 Tue, 11 Oct 2022 23:19:19 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
Date: Wed, 12 Oct 2022 07:18:32 +0800
Message-Id: <20221011231832.149839-7-gshan@redhat.com>
In-Reply-To: <20221011231832.149839-1-gshan@redhat.com>
References: <20221011231832.149839-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xn/aWnkRhbFn

After the improvement to high memory region address assignment is
applied, the memory layout can be changed, introducing possible
migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
is disabled or enabled when the optimization is applied or not, with
the following configuration.

  pa_bits              = 40;
  vms->highmem_redists = false;
  vms->highmem_ecam    = false;
  vms->highmem_mmio    = true;

  # qemu-system-aarch64 -accel kvm -cpu host    \
    -machine virt-7.2,compact-highmem={on, off} \
    -m 4G,maxmem=511G -monitor stdio

  Region            compact-highmem=off         compact-highmem=on
  ----------------------------------------------------------------
  RAM               [1GB         512GB]        [1GB         512GB]
  HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
  HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
  HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]

In order to keep backwords compatibility, we need to disable the
optimization on machines, which is virt-7.1 or ealier than it. It
means the optimization is enabled by default from virt-7.2. Besides,
'compact-highmem' property is added so that the optimization can be
explicitly enabled or disabled on all machine types by users.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 docs/system/arm/virt.rst |  4 ++++
 hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  1 +
 3 files changed, 52 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c1..75bf5a4994 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -94,6 +94,10 @@ highmem
   address space above 32 bits. The default is ``on`` for machine types
   later than ``virt-2.12``.
 
+compact-highmem
+  Set ``on``/``off`` to enable/disable compact space for high memory regions.
+  The default is ``on`` for machine types later than ``virt-7.2``
+
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
   Valid values are:
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c05cfb5314..8f1dba0ece 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -174,6 +174,27 @@ static const MemMapEntry base_memmap[] = {
  * Note the extended_memmap is sized so that it eventually also includes the
  * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
  * index of base_memmap).
+ *
+ * The addresses assigned to these regions are affected by 'compact-highmem'
+ * property, which is to enable or disable the compact space in the Highmem
+ * IO regions. For example, VIRT_HIGH_PCIE_MMIO can be disabled or enabled
+ * depending on the property in the following scenario.
+ *
+ * pa_bits              = 40;
+ * vms->highmem_redists = false;
+ * vms->highmem_ecam    = false;
+ * vms->highmem_mmio    = true;
+ *
+ * # qemu-system-aarch64 -accel kvm -cpu host    \
+ *   -machine virt-7.2,compact-highmem={on, off} \
+ *   -m 4G,maxmem=511G -monitor stdio
+ *
+ * Region            compact-highmem=off        compact-highmem=on
+ * ----------------------------------------------------------------
+ * RAM               [1GB         512GB]        [1GB         512GB]
+ * HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
+ * HIGH_PCIE_ECAM    [512GB+256GB 512GB+512MB]  [disabled]
+ * HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
  */
 static MemMapEntry extended_memmap[] = {
     /* Additional 64 MB redist region (can contain up to 512 redistributors) */
@@ -2353,6 +2374,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
     vms->highmem = value;
 }
 
+static bool virt_get_compact_highmem(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_compact;
+}
+
+static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_compact = value;
+}
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2971,6 +3006,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable using "
                                           "physical address space above 32 bits");
 
+    object_class_property_add_bool(oc, "compact-highmem",
+                                   virt_get_compact_highmem,
+                                   virt_set_compact_highmem);
+    object_class_property_set_description(oc, "compact-highmem",
+                                          "Set on/off to enable/disable compact "
+                                          "space for high memory regions");
+
     object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
@@ -3055,6 +3097,7 @@ static void virt_instance_init(Object *obj)
 
     /* High memory is enabled by default */
     vms->highmem = true;
+    vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
@@ -3124,8 +3167,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
 
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
index 709f623741..c7dd59d7f1 100644
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
-- 
2.23.0

