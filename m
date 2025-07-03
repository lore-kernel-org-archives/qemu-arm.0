Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505603dyc;
        Thu, 3 Jul 2025 05:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrO6dOr9aNiIdLMLTRw7PK+mHMhwFyXFhpou0PH2s+CqG7846SZqcQwU5a8XatIrhw/gfzyDguNB/DfA==@linaro.org
X-Google-Smtp-Source: AGHT+IGtVsIE6B0Yw0wzl+Aotgq57PWF4JXUTycIfenT6zgAl9LlcvHx51RCTB2fRrIdj/7RRsZ2
X-Received: by 2002:a05:6a20:914e:b0:21f:5598:4c49 with SMTP id adf61e73a8af0-222d7dc4f79mr12829301637.2.1751546323495;
        Thu, 03 Jul 2025 05:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546323; cv=none;
        d=google.com; s=arc-20240605;
        b=X7rjqZLMNX4xfCQus5/gJdgZe+lPjFdUFI7PhWTtRozCsp2ZGicV3Bdf7lfp09Q9SU
         vg+zD8cridQYy49/jopK2m1bC27+zrupuXvkWXBkwf8CAwQ/DhaWP8og/nG19X/NSPnV
         eTeecqcFEMzZdhRA6tTlEAGsKQR/JJWvWptvNohojqIvmr3xP66aaVvjxsJBmD+Sw20+
         vb1GZifhI00U94wNp2qySpdcglAR1udyttwn9kvN0NcuttisKJGAACyovWfwpvtuhRFC
         LRngdxqL3i1ebRah4ttTzw5om7EAS3WMD1VOI+MbnXiQAvsv5+dxtpcGABEN7330V7nt
         FJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dPBzy9CsJVFt5NIIFLm3SKgobSoPadimXomCtIYommM=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=lWqkT1htq/DXraMXxvyonTtmHd8p3R/CtsDPuafQmO1/DTvJeVcYRp8UOq/DkRp4Ou
         LVEwv+bLnMYduvb+8mfZ+UMi5fi5jL7uGelkLHn3I7p5w+ygOORObf3eVh6uEmcPdoNZ
         s5WfPRUsYgw+8vv5ouKMBGI1AdK89H0hCACs+g0pvlYKu1JzJNrlFYpx7PBzNcsDwNLX
         hBXEOrLlX1tqQ6tS6GQHe7Bxc5/siQCGS+gZdVS0Enb0LCrzHaaNPMeCu8TziMT1Hj2x
         qClEViSy0/ufQjmlDRCoA6uq/yJLSXvAzhahr26dKJ5AqGanTs2nA2+c4UnbUYIf3W5E
         iiYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rhs0iEOF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b34e3215579si17683295a12.346.2025.07.03.05.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rhs0iEOF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPBzy9CsJVFt5NIIFLm3SKgobSoPadimXomCtIYommM=;
	b=Rhs0iEOFoFKv5Gf8iGjJn1bMt9rMK+aa7omz1QuTLKK/LS6tXbr3+AZYexEWRQEUdnSoQN
	Z1fMnlVBHABeQ4BuFUjiri/cVlnpv74cerZoTlmFO6KUzmWcUJjBZJvuEeMln9waMAqhch
	hvZZj9r6bDZmDflv2HC26UpIUZS22UY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-GcIaQgQnOXWizg6XZLCZdQ-1; Thu,
 03 Jul 2025 08:38:37 -0400
X-MC-Unique: GcIaQgQnOXWizg6XZLCZdQ-1
X-Mimecast-MFC-AGG-ID: GcIaQgQnOXWizg6XZLCZdQ_1751546316
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0A691800343;
	Thu,  3 Jul 2025 12:38:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92B80180045C;
	Thu,  3 Jul 2025 12:38:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 11/36] hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
Date: Thu,  3 Jul 2025 14:35:11 +0200
Message-ID: <20250703123728.414386-12-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: ewWals1NvRMT

Extract the code that reserves resources for ACPI PCI hotplug
into a new helper named build_append_pcihp_resources() and
move it to pcihp.c. We will reuse it on ARM.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---

v2 -> v3:
- fixed indent (Jonathan)
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pcihp.c         | 18 ++++++++++++++++++
 hw/i386/acpi-build.c    | 15 ++-------------
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 971451e8ea..8a46a414cc 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -75,6 +75,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 
 void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
 void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
+void build_append_pcihp_resources(Aml *table,
+                                  uint64_t io_addr, uint64_t io_len);
 
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index cbe7e01385..5ca36c8619 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -685,6 +685,24 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(table, scope);
 }
 
+/* Reserve PCIHP resources */
+void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
+                                  uint64_t io_addr, uint64_t io_len)
+{
+    Aml *dev, *crs;
+
+    dev = aml_device("PHPR");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
+    aml_append(dev,
+               aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+    crs = aml_resource_template();
+    aml_append(crs, aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 const VMStateDescription vmstate_acpi_pcihp_pci_status = {
     .name = "acpi_pcihp_pci_status",
     .version_id = 1,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 91945f716c..52cef834ed 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1432,19 +1432,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     /* reserve PCIHP resources */
     if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
-        dev = aml_device("PHPR");
-        aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
-        aml_append(dev,
-            aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
-        /* device present, functioning, decoding, not shown in UI */
-        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
-        crs = aml_resource_template();
-        aml_append(crs,
-            aml_io(AML_DECODE16, pm->pcihp_io_base, pm->pcihp_io_base, 1,
-                   pm->pcihp_io_len)
-        );
-        aml_append(dev, aml_name_decl("_CRS", crs));
-        aml_append(scope, dev);
+        build_append_pcihp_resources(scope,
+                                      pm->pcihp_io_base, pm->pcihp_io_len);
     }
     aml_append(dsdt, scope);
 
-- 
2.49.0
