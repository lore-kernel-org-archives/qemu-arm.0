Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5869987njd;
        Mon, 28 Apr 2025 03:27:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNFCdCXLz34TndCaR4Chec55Szc4mMAfxNqT+vAWN7jIaQLd+pJFrJOiO4dIpL5c5+5y6JXurcJhwW6g==@linaro.org
X-Google-Smtp-Source: AGHT+IFv5/csdFlj05srJNRY72fRRwNjCpL1fZNVpwM62vCq5W82YbN/Htf9S6QFCrPbxw99fA6M
X-Received: by 2002:a05:622a:15c5:b0:477:c04:b512 with SMTP id d75a77b69052e-481318036d3mr116704991cf.16.1745836064618;
        Mon, 28 Apr 2025 03:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836064; cv=none;
        d=google.com; s=arc-20240605;
        b=BiE6MLhAzLGgmrJRW68oOSBrpUtys3SCCeoLjUyKi5U9sDx44JaMUkw6AGjVBFtK5g
         9mI/GLoax7W0uyA5RJ6McGKsufSK9bNWRB98Pl482BybYBPwc6iJpE9CEI6E2CldrNto
         tueUXbVQt0/k0K9hnBqWuuUV9RMiJ3Hxivm2FFZrh2KpbnXBhrTmYnr5gOkFqfB+BqNd
         NL02Bv+UXpcz5FktKxUzxha5yUBU7AbwxWum1kc5ZFVQWd9QqFnK446sj0UiaAijhn+k
         EpWfyW3/zEcZfSv19JnZyd9FdLgIF5wmuK9QCKglWVkiaribDrcbLfS0pnsKoSW3q/F2
         YwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=69FrE0S4fSJ+qVigUPurs+LzNHJjYE7L3jEoiPizqRE=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=RmDAQTWc5d6gE+7EbcB9R+VDogjwG+fdSyHHdXBfDFuP7+/JKQvVxhLZWiGTlmxqhh
         YQiGEJ2RwZ01UJdP6kj74xCbqCY6Ugat4o53xaUMM2Xm69yDxh2AX7ovFqs1DigUUNi+
         Tz+6D09vDUDG6rLICIoMOHhc/p9QKqcYPEwnG+XUAJVjqTdQa68qio/ovgjvS+ezRfmB
         7KVWwWjfXBCqZK5IMxDf/yzs+uRgaljdlMVn7piHDntLVKq75CUfbaKW8a6/NH8l5GnE
         gbrfm2nJdFA3pZHFLsqv6U81Pf7/wEaiEcVM6R74Cr3KFsS33E8J1mnuFO7Z0YTg+Evj
         jieA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U5lmWUha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1f8a656si105585991cf.399.2025.04.28.03.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U5lmWUha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9Li1-00087H-MW; Mon, 28 Apr 2025 06:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lhp-0007f2-4c
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lhm-0003Ko-35
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69FrE0S4fSJ+qVigUPurs+LzNHJjYE7L3jEoiPizqRE=;
 b=U5lmWUhaBnSDOoV/1/1WkeFYXQrwimOdv6R3ovruLBY77QI/MzWxIU8GeilLzdvow11vty
 JB7dxQOGU2L/OwXxVHB+d1iuAEtfuxmLkMAGOWLmJ09RYxNooDEfRp/eiu2Y+lbjoIub5b
 RBwGJ7npUOUWAro1uCfOLkWHpTOZf+U=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-225-FNyzShMVMdGhlGQS1BMBlA-1; Mon,
 28 Apr 2025 06:27:10 -0400
X-MC-Unique: FNyzShMVMdGhlGQS1BMBlA-1
X-Mimecast-MFC-AGG-ID: FNyzShMVMdGhlGQS1BMBlA_1745836029
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B7D4C1955DD0; Mon, 28 Apr 2025 10:27:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AA0471800374; Mon, 28 Apr 2025 10:27:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 07/24] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
 acpi_dsdt_add_pci_osc
Date: Mon, 28 Apr 2025 12:25:33 +0200
Message-ID: <20250428102628.378046-8-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5RzsFIvf2t03

Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
native pci hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e8b4c64c5f..4016089893 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
     }
 }
 
-static void acpi_dsdt_add_pci_osc(Aml *dev)
+static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
 {
     Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
 
@@ -80,8 +80,9 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
      * Allow OS control for all 5 features:
      * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
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

