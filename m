Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1338772njb;
        Wed, 14 May 2025 10:06:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHNTcNLE6KJF/dH6bSbweVmO+OvTop7svH9QnyMZrhtkbHLmwAn0Kr/H1JfOHi4ON8Ry834HhgFuW7FA==@linaro.org
X-Google-Smtp-Source: AGHT+IHnr5byfuYlw9hVXrPF8EOnY3oYgu/AYHyxDkVIvUkUrKf9rcVZrM8oU8jKQLgkP46W+At2
X-Received: by 2002:a05:620a:43a2:b0:7cc:13f:fa30 with SMTP id af79cd13be357-7cd39e370b8mr41710185a.27.1747242380196;
        Wed, 14 May 2025 10:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242380; cv=none;
        d=google.com; s=arc-20240605;
        b=c5+/pgDBCLAknwpkSNfhAIJ4LnuM6SVIoN/Rxdsl95NxSeblVvBLp7elRZiEGIjbLl
         R4AfirJVCigHK2WpKjTCESWBqzSaTOZKzyVY2wvHDLfa4dKxyFd9e+kQNlD9e14jqtIE
         w52r2Za/3Nfy56mUhz/013PH3Tq91RI+0oIX7FAyu7INvkC6c/E2VqmAsnu0l+j7P+fL
         ADapJoQrxH5TchrRMR7rkHts26AZQTrHwNfi/tBz1FwGuAQcf6wD8gyP2fuymhaWYEPp
         g4Z4lDLMDrh/5P82ozHLKVY+tFEfX4ZMUsPNyGVYf2MMoGKSWjkMdbxJsmAZWyxmc8p7
         Csog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uueJeKZGs9OTwP2nPMCJi7LJLS9sZ21mtUNPD/c/Ocg=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=jdHBVJFZpdHaa4bZHyMaDwcF85KTbVE+dJofWv3+JKzyWei27Y3KNNi0lGi3NALBSP
         rTCoU6M2FwrmkZSdjfqNvJIqCyGX2THiT+wOjq4SVJwOhlGqFHbNn15CjyQ7n43lyJ6V
         dFwcJ9Mo+pACLhNU4vjgtUnkbUobexOICdFbMeVbqT6DC8Kzm4+xtoAOvmrW8bxMBoOH
         4/5eGtEQQ0uCKMyqEBG6YN2HdG7/cD4vVpGJHjYpmFrICRp2e+LAVmCfBcSKznSyRgjF
         BAWdoBXg5PzGIJSL2Wfrk37w5gzyBz5yEXvEbRB0PgfJcUQsiMzAWpXqWXuTCmvv/NFD
         2ecw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTM44nHr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe3477si1375487285a.424.2025.05.14.10.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:06:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTM44nHr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFFY8-0001wB-8k; Wed, 14 May 2025 13:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXx-0001sL-4F
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:05:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXv-0007f0-Ar
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uueJeKZGs9OTwP2nPMCJi7LJLS9sZ21mtUNPD/c/Ocg=;
 b=iTM44nHrAyXzLxtuwEp+F5D9ZZvi4XjPDqsA+I+d6pWdQYpty4sPgAfE8wb5VFtyZpsNjV
 GIWKeCYV7R10HGjg/rhqsyjRGr631+NA/ggbyoRKlRWsfFQk/OjhAO6M3NWbaKWbxism0O
 hzK8cr3WM/EGIDUHocxPxBDOx9JRrKE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-mRZIvN9NMT2jDCqxPGLM9Q-1; Wed,
 14 May 2025 13:05:27 -0400
X-MC-Unique: mRZIvN9NMT2jDCqxPGLM9Q-1
X-Mimecast-MFC-AGG-ID: mRZIvN9NMT2jDCqxPGLM9Q_1747242326
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 47D391955D52; Wed, 14 May 2025 17:05:26 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 140F130001B0; Wed, 14 May 2025 17:05:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 09/22] hw/i386/acpi-build: Introduce
 build_append_pcihp_resources() helper
Date: Wed, 14 May 2025 19:00:56 +0200
Message-ID: <20250514170431.2786231-10-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cXUOODuew7e/

Extract the code that reserves resources for ACPI PCI hotplug
into a new helper named build_append_pcihp_resources() and
move it to pcihp.c. We will reuse it on ARM.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pcihp.c         | 20 ++++++++++++++++++++
 hw/i386/acpi-build.c    | 15 ++-------------
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 95efe9a804..ec9b010e4a 100644
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
index e0260f67e6..fb54c31f77 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -685,6 +685,26 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
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
+    aml_append(crs,
+        aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len)
+    );
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 const VMStateDescription vmstate_acpi_pcihp_pci_status = {
     .name = "acpi_pcihp_pci_status",
     .version_id = 1,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 41fde88b22..ca59185aac 100644
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

