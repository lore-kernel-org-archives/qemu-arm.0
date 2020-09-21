Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4351126lfq;
        Mon, 21 Sep 2020 15:15:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqnfL2b3ptpFI04Qdkj9axbPdoCNHAFjsfpmrXixxYCf0Mi68kOy4lkO9ucHSi9Mw8dB+N
X-Received: by 2002:a25:d94d:: with SMTP id q74mr2865878ybg.452.1600726541581;
        Mon, 21 Sep 2020 15:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600726541; cv=none;
        d=google.com; s=arc-20160816;
        b=mUAFVeG4E3rCAevHHWK21hS5ec+MQ/V37mqA1zNx/SLOAE88fbz/Z25OzKXKvCJcKE
         zyozVVHtPsRJAoR8KzO8My5Wb7116tkJQwZDVWxTEFBrJg1dJ8W2umjEOKBtUZ+s4pBw
         0nchPJlDCd9cvKfPaU+Yh4FII0XnPL0yqPWaJjbqMN2PNALqJu9SKYzhCPmYdB7k60qR
         U/fdybyAPP8qFdvI1RwAgp/U88YV5spKkPaiFuQDLPAgJ3Sog58HJrtqkIp6poDmbJ2e
         cxTLE33/Ecwce8IFwpaC1SU+N031j33IaJaVgLEMhnQdL34J0+LORLORuC1T8PhYqYXg
         MFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VZuWdbUwG3KMSIvyqRzeAAr4Sn3NuYTMl0QZA5j61c8=;
        b=VVwPpNGl+vv4YKgwh8O5l8Hw67Tb+kcxWTLMbStMUy7qZrEhv2iaU1JvJYRV9B640c
         mpGa6k3GXfwkj97CLdWZ2CWr7iUIoKSUOl5wrWd7NLhwNk77U0SAohzaqYyalv9OLFIT
         u4xh4HQraOIrzqiGFqKzUEr/Tpkcj5wfjtsFqW5JdBumylXQas4gipMrloHxZa/70iJE
         gjzBs82uQqV1Z9MVGOHlfWsrpDJuIOXo8h4cLhMxVB5EhgG1cGAW+8r/Au3jewpGNSj9
         G37mEgA0oWY6rGb3iVy4uVh2UK4F+9FWTEDCoGlW2NsSI626i9CNkEn+3DykzyiYhoiw
         PyEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e2saXLs6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d123si14566575ybh.434.2020.09.21.15.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 15:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e2saXLs6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKU60-0004wp-UE
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 18:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU24-0000UY-Kb
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU1x-0001e7-12
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZuWdbUwG3KMSIvyqRzeAAr4Sn3NuYTMl0QZA5j61c8=;
 b=e2saXLs61ymnjg5wt0IG4my4cG58Z9py93Zca01vNhJ0ubkeAyDYuoGd7YfLqgTxRqVOBN
 aTgvkoxg0bUlXZ4TjsWeXuc6h7dDAOVBvqMgVQKmfPuBdTw3ZPUujfATVWYvNtbDEOAFja
 3EGjXJfZiHSor4Ri2SaJ0kr5VI6ef98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-ykWrRKunNbSFnv2tpsLdrw-1; Mon, 21 Sep 2020 18:11:25 -0400
X-MC-Unique: ykWrRKunNbSFnv2tpsLdrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 053AD185FD70;
 Mon, 21 Sep 2020 22:11:24 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C138A5D9CD;
 Mon, 21 Sep 2020 22:11:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/24] arm/virt: Register most properties as class properties
Date: Mon, 21 Sep 2020 18:10:36 -0400
Message-Id: <20200921221045.699690-16-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k7Nt8Wp/CUYT

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt.c | 76 +++++++++++++++++++++++++++------------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index acf9bfbecea..d1ab660fa60 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2443,6 +2443,47 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "acpi",
         "Enable ACPI");
+    object_class_property_add_bool(oc, "secure", virt_get_secure,
+                                   virt_set_secure);
+    object_class_property_set_description(oc, "secure",
+                                                "Set on/off to enable/disable the ARM "
+                                                "Security Extensions (TrustZone)");
+
+    object_class_property_add_bool(oc, "virtualization", virt_get_virt,
+                                   virt_set_virt);
+    object_class_property_set_description(oc, "virtualization",
+                                          "Set on/off to enable/disable emulating a "
+                                          "guest CPU which implements the ARM "
+                                          "Virtualization Extensions");
+
+    object_class_property_add_bool(oc, "highmem", virt_get_highmem,
+                                   virt_set_highmem);
+    object_class_property_set_description(oc, "highmem",
+                                          "Set on/off to enable/disable using "
+                                          "physical address space above 32 bits");
+
+    object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
+                                  virt_set_gic_version);
+    object_class_property_set_description(oc, "gic-version",
+                                          "Set GIC version. "
+                                          "Valid values are 2, 3, host and max");
+
+    object_class_property_add_str(oc, "iommu", virt_get_iommu, virt_set_iommu);
+    object_class_property_set_description(oc, "iommu",
+                                          "Set the IOMMU type. "
+                                          "Valid values are none and smmuv3");
+
+    object_class_property_add_bool(oc, "ras", virt_get_ras,
+                                   virt_set_ras);
+    object_class_property_set_description(oc, "ras",
+                                          "Set on/off to enable/disable reporting host memory errors "
+                                          "to a KVM guest using ACPI and guest external abort exceptions");
+
+    object_class_property_add_bool(oc, "mte", virt_get_mte, virt_set_mte);
+    object_class_property_set_description(oc, "mte",
+                                          "Set on/off to enable/disable emulating a "
+                                          "guest CPU which implements the ARM "
+                                          "Memory Tagging Extension");
 }
 
 static void virt_instance_init(Object *obj)
@@ -2455,34 +2496,13 @@ static void virt_instance_init(Object *obj)
      * boot UEFI blobs which assume no TrustZone support.
      */
     vms->secure = false;
-    object_property_add_bool(obj, "secure", virt_get_secure,
-                             virt_set_secure);
-    object_property_set_description(obj, "secure",
-                                    "Set on/off to enable/disable the ARM "
-                                    "Security Extensions (TrustZone)");
 
     /* EL2 is also disabled by default, for similar reasons */
     vms->virt = false;
-    object_property_add_bool(obj, "virtualization", virt_get_virt,
-                             virt_set_virt);
-    object_property_set_description(obj, "virtualization",
-                                    "Set on/off to enable/disable emulating a "
-                                    "guest CPU which implements the ARM "
-                                    "Virtualization Extensions");
 
     /* High memory is enabled by default */
     vms->highmem = true;
-    object_property_add_bool(obj, "highmem", virt_get_highmem,
-                             virt_set_highmem);
-    object_property_set_description(obj, "highmem",
-                                    "Set on/off to enable/disable using "
-                                    "physical address space above 32 bits");
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
-    object_property_add_str(obj, "gic-version", virt_get_gic_version,
-                        virt_set_gic_version);
-    object_property_set_description(obj, "gic-version",
-                                    "Set GIC version. "
-                                    "Valid values are 2, 3, host and max");
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
 
@@ -2500,26 +2520,12 @@ static void virt_instance_init(Object *obj)
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-    object_property_add_str(obj, "iommu", virt_get_iommu, virt_set_iommu);
-    object_property_set_description(obj, "iommu",
-                                    "Set the IOMMU type. "
-                                    "Valid values are none and smmuv3");
 
     /* Default disallows RAS instantiation */
     vms->ras = false;
-    object_property_add_bool(obj, "ras", virt_get_ras,
-                             virt_set_ras);
-    object_property_set_description(obj, "ras",
-                                    "Set on/off to enable/disable reporting host memory errors "
-                                    "to a KVM guest using ACPI and guest external abort exceptions");
 
     /* MTE is disabled by default.  */
     vms->mte = false;
-    object_property_add_bool(obj, "mte", virt_get_mte, virt_set_mte);
-    object_property_set_description(obj, "mte",
-                                    "Set on/off to enable/disable emulating a "
-                                    "guest CPU which implements the ARM "
-                                    "Memory Tagging Extension");
 
     vms->irqmap = a15irqmap;
 
-- 
2.26.2

