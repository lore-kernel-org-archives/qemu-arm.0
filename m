Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505814dyc;
        Thu, 3 Jul 2025 05:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiRDK5nxAxJeDd4FltFN+Q7iOyzTH5zg57vEuN1jI2gFtNMQ2liSxKCGECrpde0bosporpGf+7pSZoCw==@linaro.org
X-Google-Smtp-Source: AGHT+IFVSd5b5cQronLKKbHLRjtpTpzNScrfljWUrl0NdqJomCKxIldOINMLfryZ//ROSPBz8mdT
X-Received: by 2002:a05:6214:1242:b0:6fd:75e6:bd33 with SMTP id 6a1803df08f44-702b16c4e9dmr96025346d6.0.1751546346505;
        Thu, 03 Jul 2025 05:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546346; cv=none;
        d=google.com; s=arc-20240605;
        b=i0yvsorFNNTJlbMvZYqTVWMjZVD9LEW0DmlmumUR42nXALdj1DGChcon6Gw4YmaZma
         v5x02pLtmp9YnO4Q1x0o8sLACfopivmo1J1f4wAomG5szlYCDqYdETpXt+WsHF7Qum0C
         VR1RP7W9IqLo0ZjCdQysbl2uUL/MxBUjq9Hkz1ZTpILBfb4libQu5w0OnnkZ0ff2f2Pt
         bWMMJnXACNuMZsfVpmk0TmDjDLD1UjdjGpa6r/yBkUZ65yLxoDQlh0wqKkiP+/wDhHuv
         4sfCf3aWbbbYgr5DSF3YldEkVLuH2sC6+XWlAPwzM3oNXuoJBLnAATrV/onADqtpkXUY
         UC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qrdM5Qv5B/f5uJagCphvmvd7g7H1raHqAypDeISaWyY=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=F984jcDcQos8YPQX1qH4hw7M50hzzrWGO7uSbzrXXhpOiuUG8iu9az/fdfZwFDEbAu
         LhFwuPlVwtOrJ5/c0mctG5btgniBp1S/LpbhUQtBisiyK6LRpiisbj17EQQxixf8QzkC
         s2q+9j7PFqa+FpcZoSwunG88/e7pORKRWUf6TZoT8Jn9/4OWMQM3wAlLLP9jtZbNbuAI
         VqzTc70d/XxS5Em7eEUxfkWupTu2PniEVPVcUGrSLKuCh9ibLRsj79UV06OGXPFrsQqw
         33g0SVw+mU48tb2E9DAmO5jlHSvXQHXGoCLdrjh5yhMEW4akG41inxZgX/sUO4aociKt
         I82w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqStNk3e;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd772981a6si172361466d6.117.2025.07.03.05.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqStNk3e;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrdM5Qv5B/f5uJagCphvmvd7g7H1raHqAypDeISaWyY=;
	b=IqStNk3ei94b13vhEzhbZiodnsfPHx+QcjUjTHDqHgdeAj0exMVue1zkTRVSOL0xpgqQ1X
	DN366EWChi3bHuEEiQNPmprPi9Z72ekfip8rSeZJAe8hXiJDYe+B64IbB42To+dKDoKTf3
	dK1Xd4sJiqp40xm3ogv/xa0L76vZSgU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-s0yPEGRaPGW51AiwDbBSGQ-1; Thu,
 03 Jul 2025 08:39:03 -0400
X-MC-Unique: s0yPEGRaPGW51AiwDbBSGQ-1
X-Mimecast-MFC-AGG-ID: s0yPEGRaPGW51AiwDbBSGQ_1751546341
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EFC018089B7;
	Thu,  3 Jul 2025 12:39:01 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 012D1180045B;
	Thu,  3 Jul 2025 12:38:56 +0000 (UTC)
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
Subject: [PATCH v5 16/36] hw/i386/acpi-build: Move aml_pci_edsm to a generic place
Date: Thu,  3 Jul 2025 14:35:16 +0200
Message-ID: <20250703123728.414386-17-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: vO0Dmh6tG+0N

Move aml_pci_edsm to pci-bridge.c since we want to reuse that for
ARM and acpi-index support. Also rename it into build_pci_bridge_edsm.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---

v3->v4:
- renamed into build_pci_bridge_edsm() (Jonathan, Igor)

v2 -> v3:
- move to pci-bridge.c instead of pcihp.c (Igor)
---
 include/hw/acpi/pci.h |  1 +
 hw/acpi/pci-bridge.c  | 54 ++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c  | 57 ++-----------------------------------------
 3 files changed, 57 insertions(+), 55 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 69bae95eac..20b672575f 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -42,5 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
 void build_srat_generic_affinity_structures(GArray *table_data);
 
 Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
+Aml *build_pci_bridge_edsm(void);
 
 #endif
diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
index 7baa7034a1..394a919479 100644
--- a/hw/acpi/pci-bridge.c
+++ b/hw/acpi/pci-bridge.c
@@ -35,3 +35,57 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
         }
     }
 }
+
+Aml *build_pci_bridge_edsm(void)
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
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fe8bc62c03..423c4959fe 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -338,59 +338,6 @@ build_facs(GArray *table_data)
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
@@ -937,7 +884,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, aml_pci_edsm());
+        aml_append(dev, build_pci_bridge_edsm());
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -952,7 +899,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(dev, build_pci_host_bridge_osc_method(!pm->pcihp_bridge_en));
-        aml_append(dev, aml_pci_edsm());
+        aml_append(dev, build_pci_bridge_edsm());
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
             aml_append(sb_scope, build_q35_dram_controller(&mcfg));
-- 
2.49.0
