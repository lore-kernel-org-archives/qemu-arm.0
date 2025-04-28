Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5870760njd;
        Mon, 28 Apr 2025 03:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU78rpr0P4ZQzEGDzxJXBZIuY7KwtoBKNFiQZ+TAhCdI1DgPy+aKeYOXeUVQi+CAD4F/xrZz/GkdrA3Pw==@linaro.org
X-Google-Smtp-Source: AGHT+IGLy/pSlhEEILg6xoEGsFUtv4c4oKT65zyfc6Q+VEhITbldSUphMT5nCEEWMxxByIYaTbvC
X-Received: by 2002:a05:620a:414d:b0:7c9:1335:633e with SMTP id af79cd13be357-7c961975b8fmr1843976685a.1.1745836167102;
        Mon, 28 Apr 2025 03:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836167; cv=none;
        d=google.com; s=arc-20240605;
        b=FeHH7VGTOS+YsITmjHX7DjxwdlKKt8EBnqM9SS2TzEpgYxBaKjDg03ufNikvAjoWzZ
         QRxgGBsvefvYYp/X2ghFC21ZYxQDNfCCH/Ggz+oh5T6bFqy9jgzPEvK3mYMIZtbQLK9N
         9+lKemCOtDWWydT8AcI0GM/NTJ9QYe/lnsir2BeMrwWOunMm6Ae3Hm7QxExihpp5IvMM
         pz0ltnAtwhj8pFbGw2QwKEhXAdEC7IOSwhgIhHdXYODB8WlhW3Xs5IYr9nyxa5hNxfM4
         HdvWZ8Rw5adXL/iJJvq+eDoVbE5efDb1HO4N6rSm9POV7Alc4z5B+6TGKyKaGBJ6nnw/
         mftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IWEcEo7tJZDk7sv1PSsr65GTVqALG8w8RfUI/yPTJ4I=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=jFW6//EfXIWwterpxd7LAQcNG5KEGelZCLrZHblLPLshCln+Ki0u83y4g65TS8nPmV
         UfKyl7yuwnkv1Kl1UYxE8XaYDK6HoRvpjLUBs9JdJZlcm6r7cxd73p+sD23Q72o9itmV
         vrXs4J3k8elscpswMtuqMNsPiAOyK70B3NRBIW58rq3au/hzkrnDYoapBuv2QQZ2ftWO
         e300MWo42uz6SZ3MDI1Pt087wXhSWfGWcMP1JSOeLe/w2t3RnmqMXntyYLFtPWQGeo+y
         exJvSyxidfQJBmGDlkvv+qXXbUkxEw7QRZNjxZhd3Pm8pNOKjcnC+juh4ygWXVjAfL/j
         kiBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K1R/Xlg5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958edfb33si999510585a.624.2025.04.28.03.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K1R/Xlg5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9Lj4-0000l0-2S; Mon, 28 Apr 2025 06:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Li8-0008It-V0
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:27:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Li6-0003PF-H7
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWEcEo7tJZDk7sv1PSsr65GTVqALG8w8RfUI/yPTJ4I=;
 b=K1R/Xlg5KmlcSRHi8hORll06FFtRXmKB1bRau9jUyZF17Trj4XiSPweove9IRLZxUls6jS
 uSHPo1PW7dxZvThdH7y94pPfpqUJIis4UxWd0bUlHouHCSvKsOmLkQ9YkTx9Do7z9iG8xA
 mc19GqX48dnGoHrM1AuKQ0d44YlAkBc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-O2zQI23uNXW6lwBGDQMjDA-1; Mon,
 28 Apr 2025 06:27:34 -0400
X-MC-Unique: O2zQI23uNXW6lwBGDQMjDA-1
X-Mimecast-MFC-AGG-ID: O2zQI23uNXW6lwBGDQMjDA_1745836051
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFA99195609F; Mon, 28 Apr 2025 10:27:31 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2F5AF180045C; Mon, 28 Apr 2025 10:27:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 12/24] hw/i386/acpi-build: Introduce
 build_append_pcihp_resources() helper
Date: Mon, 28 Apr 2025 12:25:38 +0200
Message-ID: <20250428102628.378046-13-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: Gb8cc1dfPb7m

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
index 2da0bc45c9..819e815acd 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -74,6 +74,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                          Error **errp);
 
 void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
+void build_append_pcihp_resources(Aml *table,
+                                  uint64_t io_addr, uint64_t io_len);
 
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 35d8c0bfd2..6f9cd45b5f 100644
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
index a3065a94d1..4934d939f4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1458,19 +1458,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
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

