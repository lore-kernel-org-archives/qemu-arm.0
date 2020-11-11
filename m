Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp674829lfb;
        Wed, 11 Nov 2020 10:49:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykUPyOXUalI+XwlFHIqyxyr6uSgeY7zDhI28zHF2i3+qFw0Kx98TsM7FGPHiWUSzwBuxX5
X-Received: by 2002:a25:1802:: with SMTP id 2mr35213095yby.148.1605120576454;
        Wed, 11 Nov 2020 10:49:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605120576; cv=none;
        d=google.com; s=arc-20160816;
        b=fwQzIi76H0tlUlUA/2Mwcy0SKZrFkctovoMD6w7UV8NcojttxxbTQV4HLoKXEJYx6C
         eAqk9Rdu1/VrWweDpsBnAMGSreolVhgXTyEFUwKEfi9UMb/LypGjZjCriDN06GiItkqg
         EzvzHJJD/lO9HgHlt2sHXlVzH61uvBQXS7qLlF1d/10WNi9louQxJ3Eqyy+xzFcJi8O4
         FEBA/ZAEbHikWlav0a7jY7ZVoCpqhlfQBRB42bgyuJ3OQ+6sPzIiFqF+vCBl4e3dJgAW
         oMAGZtbDlFMkzEPzntghpRPXSFLJPEgBDy/PpPl0Ul+BOgoOK4ePggkknbxDshzBDvNa
         umdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g1BuxTUhsmcY0SFuQ3DYGN96ziKI4fIsmsSBKpMTc1E=;
        b=qmwvOlWEIE6NelqRapOlkSIrnLyrE86QH1f5P9tyCwkfMui/jVh8gL5W77GnFBwaQD
         mYH1ux44/x6uc0J5NB1TEdOxn6JrhUUj1XFeWisPf+k+INFCYbEPSUC7eR6s+6pVhNpO
         40IsKnOcY2BA8prUMHdj4alyTPDLcApEpLfE8Rh3Z13jaq+o5FhZjq/oTt2AbZBedO2n
         m7LtJDZnPQS4QbJUGiHcMoD2z/oWhBGMPK/khyC7z4ikyXGDijWe2hxwqWBibPAFdzpS
         REIg6CDZ1+y0cEZALmO/VBMQy9gmIPKkUQLc0js+Dt34EnMthccUo+sdftgjwdZv0u5h
         eyKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NRHmsq2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si2563339ybz.39.2020.11.11.10.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 10:49:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NRHmsq2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcvBX-00038C-Pk
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 13:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv1o-0000ZB-QI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:39:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv1m-0008GS-Bw
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1BuxTUhsmcY0SFuQ3DYGN96ziKI4fIsmsSBKpMTc1E=;
 b=NRHmsq2XS8wjsm6bWPaoYEy+jYTWNjyWwMq7dJQeFc1wc4+7lGGp4AeHu3lMy9YpN9IIpC
 o/ijFHJQ8+cXIFVsEorZfKYCgAJTdrisHGHAy2aHJpzKPu1LFbCetLh7mp56t0kVFFYWBM
 HG86moDMPqtApqzcM3fT/nbgUwYbDdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-jC_RUB9zM0uj-G7-tsmJjQ-1; Wed, 11 Nov 2020 13:38:55 -0500
X-MC-Unique: jC_RUB9zM0uj-G7-tsmJjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837815F9C2;
 Wed, 11 Nov 2020 18:38:33 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F9325DA6A;
 Wed, 11 Nov 2020 18:38:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] arm/virt: Register most properties as class
 properties
Date: Wed, 11 Nov 2020 13:38:16 -0500
Message-Id: <20201111183823.283752-6-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: exqpjsmkbn9H

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
index 27dbeb549e..53fcaf5e4f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2484,6 +2484,47 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
@@ -2496,34 +2537,13 @@ static void virt_instance_init(Object *obj)
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
 
@@ -2541,26 +2561,12 @@ static void virt_instance_init(Object *obj)
 
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
2.28.0

