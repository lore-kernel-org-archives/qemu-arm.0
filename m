Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1337978njb;
        Wed, 14 May 2025 10:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFqF9mFHAjpy7avgLQrENXuqhuNYLzJwaAkjqjXN82E5SUvXGn9BmYYkET0DTVc5J/Atp8IPu1wwzWXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGELwXsmEkdWa0ImFqVe6KQxsSOkvI+Jj7ooYQHWJpD0s7DhQwMPTQBnl7KXXN+05i2jHq4
X-Received: by 2002:a05:620a:1a2a:b0:7c7:a554:e2a5 with SMTP id af79cd13be357-7cd2884d156mr618898085a.44.1747242326323;
        Wed, 14 May 2025 10:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242326; cv=none;
        d=google.com; s=arc-20240605;
        b=aB8CMc4HmhkysOb41ZM+a6Ou+i/e73HNDLdCq6712LlNmMq/zXPaON26F1EtNnXKs/
         kZzKS2c4wO/nvQkYtRjSUv4HROEa743XX0L8pZDG6WQlZ2/5/0UOIg9W0kUG7v55lA+t
         cN5kdcQ04gl+mogqCu4dWWiJ+vWLb2jjjI/Qm93byr451THuPR22opkWksa7mBN8RZFl
         Try3/DBWEb+D6Yq30pabV/adzOWL9wNjjkjQNKlePUmPE5WUGaKbbkvjZWgjnjwc69qy
         C0/5ypgR54aO3PXMpEj84buO43FemVSuvBNA59slyb+JB99wlWAYXHvshtdu9+8lmkA9
         JALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yt7Go2NY2vORq6t2I/qWoIsyNcD4CNCagkdGZahyAeI=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=cg1dmoaIC33vT1bU+C88XY9PqV9+LzEd5ZYADe4EGjvOqvu5FpI8NjM+lhK7nTNTjs
         /6xIycRqa+l7/FqiH84lWo5XTCHzKzDlfRN0Sgow7yCFpI1OUzubpVfMwzrjUTf1p1I7
         FT8K4RS5uqO3XEeY4MGec3T/LUZudk6iPSdn3Bkhnxu2IDlA9CeoVNEEcJnGDXk5T8cq
         dfacQojb7QHs+3Oz3SdFrSEv5rKodVQRjkZpjJEh42VkckDlkbgwvFKR3PLNN/BRT2U/
         LFQDoapkcU97p6YSrOGume9wG+KTY195uS3vfTxyhdyLsN2QxYZdoWuDG2NL8dC/nL+P
         +iEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U1TLp0DG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f51934si1366153885a.12.2025.05.14.10.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U1TLp0DG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFXQ-0001Mi-Li; Wed, 14 May 2025 13:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXO-0001Kb-QZ
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXN-0007Ny-2V
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yt7Go2NY2vORq6t2I/qWoIsyNcD4CNCagkdGZahyAeI=;
 b=U1TLp0DGMHWyUEsIJRt8pv7Ki8w6IVr7fWB8+r0wXi9WmPPh8jC63uRb35kaI/1TI0rw4R
 VZ3M71EI7GbDgEPnPhZH/yyehCTKYLXm+FTkDfPAgGtKTUEawRRdY8I4rWYV/JHt1vceqN
 jlmyzGomKxr2j9tSF2C8V6168ClrBEo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-39-OiJefIDVPtuZ48ciwpEbJg-1; Wed,
 14 May 2025 13:04:52 -0400
X-MC-Unique: OiJefIDVPtuZ48ciwpEbJg-1
X-Mimecast-MFC-AGG-ID: OiJefIDVPtuZ48ciwpEbJg_1747242291
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CBEDF18001CA; Wed, 14 May 2025 17:04:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A0A8130001B0; Wed, 14 May 2025 17:04:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 02/22] hw/arm/virt: Introduce machine state acpi pcihp flags
 and props
Date: Wed, 14 May 2025 19:00:49 +0200
Message-ID: <20250514170431.2786231-3-eric.auger@redhat.com>
In-Reply-To: <20250514170431.2786231-1-eric.auger@redhat.com>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f0QGBoC91Od5

acpi_pcihp VirtMachineClass state flag will allow
to opt in for acpi pci hotplug. This is guarded by a
class no_acpi_pcihp flag to manage compats (<= 10.0
machine types will not support ACPI PCI hotplug).

Machine state acpi_pcihp flag must be set before the creation
of the GED device which will use it.

Currently the ACPI PCI HP is turned off by default. This will
change later on for 10.1 machine type.

We also introduce properties to allow disabling it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 include/hw/arm/virt.h |  2 ++
 hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a1b0f53d2..10ea581f06 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -129,6 +129,7 @@ struct VirtMachineClass {
     bool no_tcg_lpa2;
     bool no_ns_el2_virt_timer_irq;
     bool no_nested_smmu;
+    bool no_acpi_pcihp;
 };
 
 struct VirtMachineState {
@@ -150,6 +151,7 @@ struct VirtMachineState {
     bool mte;
     bool dtb_randomness;
     bool second_ns_uart_present;
+    bool acpi_pcihp;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a6cd085a3..a0deeaf2b3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
+        vms->acpi_pcihp = false;
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
@@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->acpi_pcihp;
+}
+
+static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->acpi_pcihp = value;
+}
+
 static bool virt_get_dtb_randomness(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
 
+    object_class_property_add_bool(oc, "acpi-pcihp",
+                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
+    object_class_property_set_description(oc, "acpi-pcihp",
+                                          "Force ACPI PCI hotplug");
 }
 
 static void virt_instance_init(Object *obj)
@@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
         vms->tcg_its = true;
     }
 
+    /* default disallows ACPI PCI hotplug */
+    vms->acpi_pcihp = false;
+
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
@@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
 
 static void virt_machine_10_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_10_1_options(mc);
     compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
+    /* 10.0 and earlier do not support ACPI PCI hotplug */
+    vmc->no_acpi_pcihp = true;
 }
 DEFINE_VIRT_MACHINE(10, 0)
 
-- 
2.49.0

