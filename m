Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1338031njb;
        Wed, 14 May 2025 10:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZtteipg3R6ue/BuXhUsYdX0AG+HqVEEUSs6tMUt7b6+eMsDK8MMn4UG+hO9yAP/lEvS9NCiGZO4DBqg==@linaro.org
X-Google-Smtp-Source: AGHT+IGIZq+iT9gLWnna+fC1k9UMsMP5179LNwdqzoQPBCGMm+ZhA9hQNkYSEBebjF0oLDlhcUB+
X-Received: by 2002:a05:6000:2a3:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-3a349947e6dmr3600574f8f.51.1747242329283;
        Wed, 14 May 2025 10:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242329; cv=none;
        d=google.com; s=arc-20240605;
        b=kkWVk9HoSvIjaZeMx3Jz+rCYo73OyoSUqCbcq/0jyinIKYDNKdzwnWVhOUJfv5tmp2
         Zt3JKIrzzva3jJDIjklyVmkY8CwTS3O5usQInSDVSSLMg17i4lALEyD2iugDBK9KwKp9
         bKwpaL/+uLR/JY0GKNb3zIftxjPuYXV04RLrCRj2ibkIYew3PxPkftQuWgxqMmA1eeVW
         SFjIrbB7H+nM44I2Ad5awd8D1a0rfMglBNGVDFUZa+vOMpvUCXt+I5kgLF0iWMJ8OEIm
         A/z8+x4qy9WAUejzng7kyHjKCE13lzZUGQJpcuCe/UEv+viVT4UnpEmhhnAx+vfoPBI8
         r3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=37bWn0/SLN7Et2zFWZ1hnl9+t8mUMekHwstaQlziV6U=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=lqkWQ16XFp1cl7HnkkfSQpNRjGVCEvKKz3RAXUKixY3Q/RCt+E+UNfObu3Sa5cKgW/
         J5m95UIMT2H2DLFma+OTsQDzBINCY9HDYsq7dEbHvWceSNSAkVdICOTMow58njdfGSPn
         T1gHqzHE0boahwWb7RH7Oe4lrKhB2UqAkF5itd/aTQ8kUNpHI8PasaYQlWW0GX0DIAFe
         S4E8EIkSZ5erqyBPztXSS19i4q8T61e60jhvyFPKauq124wjZfWynJqezQCi+lrUUFvJ
         PvXz8tlrt+t2oB0Rlry+Ml3h6pObV6QM4veffdMEkG7BaaNZZW8PfeM9EjFdoOGLfKoe
         ZKag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ty8v5Oah;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-442f39954a1si17516485e9.149.2025.05.14.10.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ty8v5Oah;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFFXd-0001hx-Vd; Wed, 14 May 2025 13:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXa-0001dX-CC
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXX-0007bI-Jh
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37bWn0/SLN7Et2zFWZ1hnl9+t8mUMekHwstaQlziV6U=;
 b=Ty8v5OahI1ggi2G852jp/ZPcdUYpiwDAHKDoPm59XkQa22YRZ9nynT7f+fh/DWaZcOxhOm
 zHsardhlemZYhv866DCkDcLV/FFjifKGNiEKPJixkgS7hZoHsfhUqbjxuEabOgQCXN1pKx
 tu3fzPS1pWoHCtqTkyGcee7l3Vx2ktw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-E7G1LCGHPcGolzQ0IPk1Ig-1; Wed,
 14 May 2025 13:05:03 -0400
X-MC-Unique: E7G1LCGHPcGolzQ0IPk1Ig-1
X-Mimecast-MFC-AGG-ID: E7G1LCGHPcGolzQ0IPk1Ig_1747242302
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 47CB7180036F; Wed, 14 May 2025 17:05:02 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C0FC930001B0; Wed, 14 May 2025 17:04:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 04/22] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
 acpi_dsdt_add_pci_osc
Date: Wed, 14 May 2025 19:00:51 +0200
Message-ID: <20250514170431.2786231-5-eric.auger@redhat.com>
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
X-TUID: 7SZi53XeeZfu

Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
native pci hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

---

rfc -> v1:
- updated the "Allow OS control for all 5 features" comment
---
 hw/pci-host/gpex-acpi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 0aba47c71c..f34b7cf25e 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
     }
 }
 
-static void acpi_dsdt_add_pci_osc(Aml *dev)
+static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
 {
     Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
 
@@ -77,11 +77,12 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
 
     /*
-     * Allow OS control for all 5 features:
-     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
+     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
+     * and PCIeHotplug depending on enable_native_pcie_hotplug
      */
-    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
-                              aml_name("CTRL")));
+    aml_append(ifctx, aml_and(aml_name("CTRL"),
+               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
+               aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
     aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
@@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             if (is_cxl) {
                 build_cxl_osc_method(dev);
             } else {
-                acpi_dsdt_add_pci_osc(dev);
+                acpi_dsdt_add_pci_osc(dev, true);
             }
 
             aml_append(scope, dev);
@@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
-    acpi_dsdt_add_pci_osc(dev);
+    acpi_dsdt_add_pci_osc(dev, true);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
2.49.0

