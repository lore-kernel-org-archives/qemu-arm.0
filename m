Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647627njc;
        Tue, 27 May 2025 00:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1BcNTDtOXIFOaEyiXYNDHYBUincfjLNGuB4uSgl2c0LXoQBJbgW3CrMzH+USj0E477i52J/SzDYoNmA==@linaro.org
X-Google-Smtp-Source: AGHT+IHj1VXws0OCEpwjn1C88A/bRH0OP1d+wSBz6JTX6S3jAcnynEY+fUgZxQYiGn/Y6gOKzdRY
X-Received: by 2002:a05:622a:4b16:b0:494:b007:c682 with SMTP id d75a77b69052e-49f4713deb6mr179565641cf.28.1748331769892;
        Tue, 27 May 2025 00:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331769; cv=none;
        d=google.com; s=arc-20240605;
        b=aabLlMb8SQFwGXDzxdeX2YzkKjcrF+SrxnMGMvfB5cTiqvkbRpYtlm6Rm2avZAJasq
         aCDelZ2vqEIVn/rXe5/dYZrLW7nJdouYwTP6Cf+ebvdaXzmmLGT516WEsEJxNNVS9NXi
         0VtS1seADa1i/RuJedQfN9SXRr5r7OEYVXF8OTznuA/LeDYAWvN6CaArTC+iVCkd5UoQ
         KTXuPSDSnoq+fBg/HnbRYYMIN+CsbS8jryBIPRivLc7psydeUx5rgT2GoDtOLCy5ZxYh
         Zf4mtRFaOT8hqaTgYFyVGsxh3ONwJ7Rmdh1CBGEj3BSU7BCWP2h9jRJ/0MTeSDBkHosr
         yWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yt7Go2NY2vORq6t2I/qWoIsyNcD4CNCagkdGZahyAeI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Z4V3DYG6idGSdDKe8ItaavDpyELQFQa8w3bTLoxWLglGndHhZ+QpFiED+kmRNrgk0d
         VIodYitjNGSGvYFGdsE42fPDTEPsSCcDrufwZkuLywQrMn2eEK4yNNbG1gAa3rAWXgts
         Z8MVKJlFgGSgZUpD6pyoH+SsE8nyLbXZ6lRWdhBynBFCdTRoywxWMzkPNjdeaWMc7gJs
         +9a2TxkhEZwUogaWgS0+4Vpey1/IKO5LP85vjYLMbuBLqqqmBBbk5156OF7Si+lc+rWH
         oNBhz1Hav1jjirXzWkYFqK86NO3RYgwStq5K6IJFpSLVU6ndgvtUndq6KhIOUDMoK0Z3
         /CjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BzZZme5z;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fa9bf79f7dsi82747746d6.430.2025.05.27.00.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BzZZme5z;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yt7Go2NY2vORq6t2I/qWoIsyNcD4CNCagkdGZahyAeI=;
	b=BzZZme5zXsEAnnIyLzLsaTTshy4/o4mESbR0PiFZ74ZahqiG3uKIudLikpNqQK/m+MZclh
	xvVOkB/1u3CKdQjPT1faDfrHjVeaB8PFEVTg9iIAlwE+4772dNtQcVHJTk/2/et9epYpin
	QUEi/iOuA2yEKDFvUt0WfBeGD0ZJX+o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-134-TBk1iAg1M0aULz1acFbHhA-1; Tue,
 27 May 2025 03:42:45 -0400
X-MC-Unique: TBk1iAg1M0aULz1acFbHhA-1
X-Mimecast-MFC-AGG-ID: TBk1iAg1M0aULz1acFbHhA_1748331764
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6706E1800370;
	Tue, 27 May 2025 07:42:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1237E19560AA;
	Tue, 27 May 2025 07:42:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi pcihp flags and props
Date: Tue, 27 May 2025 09:40:04 +0200
Message-ID: <20250527074224.1197793-3-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: W1hSyMmyPxhY

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
