Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1340871njb;
        Wed, 14 May 2025 10:08:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNBsFDxLWFhTeJJTsOYix4Jg4DsAX/njXJOkReQsHrkJx9cLPA0vzaoX256No8O/0nQDzzuDjQpYFQ/g==@linaro.org
X-Google-Smtp-Source: AGHT+IHlVkLK5DKB0F3sdN+GhiM5ZG6HQ0ZgvquB3kb+Iqr1ZbAdNTkrP+7hIPH/EhA8Z/tV3Px/
X-Received: by 2002:a05:6122:3284:b0:528:bd71:8932 with SMTP id 71dfb90a1353d-52d9c70d212mr4149211e0c.11.1747242533661;
        Wed, 14 May 2025 10:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242533; cv=none;
        d=google.com; s=arc-20240605;
        b=QYA7lmpMa4iwqoE0FEUpS1cI9/UPt5ggkTlqE+brgawaToMxZazEB4uqiUWjrH4/ZP
         V9oirpkxYzj3xaQ2SzjCT1V9gqcwsCGnxtBl7GPE4u2RgkDjYFTUWl2+pj60P3JxxV7M
         bsSLPqnRjuFyQ2Kq6PdoYtpETx0Zw/hPZCFSgdMpKOLBhp8TrqgtHlx1OJ06zH5iApFl
         5CZ7HDh3mwWPFdoP7tOpCPE03OYP6cSNkloDfu4WDYNzEwNjTZtVMR8yQygeZKQPNifS
         ubpFKd87K/QY7updESMMDPvV1C71MD0lsuxS9lJJqsDxafw0+QL3yhnEAtiB18lWHcEk
         KBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ebLd/turm0DnIjkCerNEmilmKQMPlh922vTPXvbEb1o=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=MWKE248+e9JCjtVsB3/HqGmScLPWBVNA7JzijiffMJC/v+dG+8EDYjbhUcqi31Wes1
         pvM5hoC7q/JpSomaGGTaUsglBD0olGxtdzKPdCu+VjWaydxprMtZ9idaAuVYnylljmFL
         0aRL2mgW2e5/5RY4X3zWy1rILLYlIG/KK5mgDL9Frm5UlEwdzuGmcJTTk+hPymlZRda+
         O3E6n6aiO+yB8kPbgXyvB+1Q/I3I5RIDSM2jNCfViNun18UBxENG/vlBukhOCNQTYK88
         YecV0pkLxUGjgHjJAEoLZO0lDaNhzzADun+4jZIcs6/rYyvA5PC60HXxTAFvQGi+kDdI
         Nd9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RdDMySuN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4deb200b6dfsi4041646137.374.2025.05.14.10.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RdDMySuN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFFYS-00027Q-7j; Wed, 14 May 2025 13:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYP-00024H-CV
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:06:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYL-0007j0-Qf
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebLd/turm0DnIjkCerNEmilmKQMPlh922vTPXvbEb1o=;
 b=RdDMySuNYY31A5Uevca4nYj0+FQtGpDj818j9Sghjy72p7SInk4VCwd9WUQ2WVtm7tfg/p
 8qkXgUtowpmh9XqeYfzFKRtBnHklaSIhjU6mMWQ+7Xi6/JJhDLWlI9PBPYcq1TqWVP/tSe
 cjensTFWDhkuAby6FThqBN3L8lmct+0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-ot_0TCqROiywFIWqRor7vg-1; Wed,
 14 May 2025 13:05:52 -0400
X-MC-Unique: ot_0TCqROiywFIWqRor7vg-1
X-Mimecast-MFC-AGG-ID: ot_0TCqROiywFIWqRor7vg_1747242350
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B2C361956088; Wed, 14 May 2025 17:05:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AC8F330001B0; Wed, 14 May 2025 17:05:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 14/22] hw/i386/acpi-build: Move aml_pci_edsm to a generic place
Date: Wed, 14 May 2025 19:01:01 +0200
Message-ID: <20250514170431.2786231-15-eric.auger@redhat.com>
In-Reply-To: <20250514170431.2786231-1-eric.auger@redhat.com>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: a+HoReaC96Tk

Move aml_pci_edsm to pcihp since we want to reuse that for
ARM and acpi-index support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pcihp.c         | 53 +++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c    | 53 -----------------------------------------
 3 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 4d820b4baf..bc31dbff39 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -82,6 +82,8 @@ bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
 
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
 
+Aml *aml_pci_edsm(void);
+
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s);
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index d800371ddc..57fe8938b1 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -937,6 +937,59 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     }
 }
 
+Aml *aml_pci_edsm(void)
+{
+    Aml *method, *ifctx;
+    Aml *zero = aml_int(0);
+    Aml *func = aml_arg(2);
+    Aml *ret = aml_local(0);
+    Aml *aidx = aml_local(1);
+    Aml *params = aml_arg(4);
+
+    method = aml_method("EDSM", 5, AML_SERIALIZED);
+
+    /* get supported functions */
+    ifctx = aml_if(aml_equal(func, zero));
+    {
+        /* 1: have supported functions */
+        /* 7: support for function 7 */
+        const uint8_t caps = 1 | BIT(7);
+        build_append_pci_dsm_func0_common(ifctx, ret);
+        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
+        aml_append(ifctx, aml_return(ret));
+    }
+    aml_append(method, ifctx);
+
+    /* handle specific functions requests */
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
+     *        Operating Systems
+     */
+    ifctx = aml_if(aml_equal(func, aml_int(7)));
+    {
+       Aml *pkg = aml_package(2);
+       aml_append(pkg, zero);
+       /* optional, if not impl. should return null string */
+       aml_append(pkg, aml_string("%s", ""));
+       aml_append(ifctx, aml_store(pkg, ret));
+
+       /*
+        * IASL is fine when initializing Package with computational data,
+        * however it makes guest unhappy /it fails to process such AML/.
+        * So use runtime assignment to set acpi-index after initializer
+        * to make OSPM happy.
+        */
+       aml_append(ifctx,
+           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
+       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
+       aml_append(ifctx, aml_return(ret));
+    }
+    aml_append(method, ifctx);
+
+    return method;
+}
+
 const VMStateDescription vmstate_acpi_pcihp_pci_status = {
     .name = "acpi_pcihp_pci_status",
     .version_id = 1,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index bcfba2ccb3..385e75d061 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -322,59 +322,6 @@ build_facs(GArray *table_data)
     g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
-static Aml *aml_pci_edsm(void)
-{
-    Aml *method, *ifctx;
-    Aml *zero = aml_int(0);
-    Aml *func = aml_arg(2);
-    Aml *ret = aml_local(0);
-    Aml *aidx = aml_local(1);
-    Aml *params = aml_arg(4);
-
-    method = aml_method("EDSM", 5, AML_SERIALIZED);
-
-    /* get supported functions */
-    ifctx = aml_if(aml_equal(func, zero));
-    {
-        /* 1: have supported functions */
-        /* 7: support for function 7 */
-        const uint8_t caps = 1 | BIT(7);
-        build_append_pci_dsm_func0_common(ifctx, ret);
-        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
-        aml_append(ifctx, aml_return(ret));
-    }
-    aml_append(method, ifctx);
-
-    /* handle specific functions requests */
-    /*
-     * PCI Firmware Specification 3.1
-     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
-     *        Operating Systems
-     */
-    ifctx = aml_if(aml_equal(func, aml_int(7)));
-    {
-       Aml *pkg = aml_package(2);
-       aml_append(pkg, zero);
-       /* optional, if not impl. should return null string */
-       aml_append(pkg, aml_string("%s", ""));
-       aml_append(ifctx, aml_store(pkg, ret));
-
-       /*
-        * IASL is fine when initializing Package with computational data,
-        * however it makes guest unhappy /it fails to process such AML/.
-        * So use runtime assignment to set acpi-index after initializer
-        * to make OSPM happy.
-        */
-       aml_append(ifctx,
-           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
-       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
-       aml_append(ifctx, aml_return(ret));
-    }
-    aml_append(method, ifctx);
-
-    return method;
-}
-
 /*
  * build_prt - Define interrupt routing rules
  *
-- 
2.49.0

