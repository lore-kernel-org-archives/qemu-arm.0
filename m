Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741271njc;
        Mon, 16 Jun 2025 02:50:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVobt9DdNyukv5xX3D+OCEtPRKXvze3CTRPGYAg64nZNf2zy1J6a6DgpF30Q70FdU/U/S33IPMIxGk0WA==@linaro.org
X-Google-Smtp-Source: AGHT+IFzhmDMxigCXPKZpdJDnZYj56oEN7R7a38+8D65MrXCLr4A3kWgB/HT7H5ecfAY95Q+9r0U
X-Received: by 2002:ac8:750b:0:b0:4a4:2d8a:1cb7 with SMTP id d75a77b69052e-4a744b3c358mr71412161cf.24.1750067445285;
        Mon, 16 Jun 2025 02:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067445; cv=none;
        d=google.com; s=arc-20240605;
        b=W/H71OOSu2qH4VimegaB8OqtUS5tgdHkG+Wr4nDb/d1mcljHVGNmglo82T2BsYrXE/
         tG/4e1QGE+TudW2h7n8p7xk2S1T6OeDaYyqKltZtJXX/EqLHqq4Eu7n69cTAWbU4E3o0
         b/CSBqBhBVpgoLNQPO+mwsuUk9gWb9NtEqtVtQYY6EO/YQfTEPmquV5imgFf2qxla6a8
         cBZQx6QHVJieW1XoqtK46B+hmoKkdW9nOM90tDo0soqykgZmKJ0bZQGDArTjjEdDSChe
         PYPep71OWs4ui7JXG0F0hCvKjaQzjPEIdCCzUze5+Dn44Vb3Hw6ZLZB78YwAo9pB3J9j
         gxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CDbaTZpBIN+bSl0Gm4UeVXh57r0yQ+O/c3GBAhZxp10=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=D7bK2CXvQp68p10A7OjRuwedAIsHjtN5O79AIQhn9hxSSJ13HrIQAgBzFH9b07Iwvd
         uWm+plBvlP7yl2zuku1AaGOBeOe7ZhfhKNHQRjzOtqc+4bE6zE8UOnN9tBC+EP+QMiz/
         2i2Ma0gbhI5lJDeMmPXmvraM74tLuZTV75JRHq9T6A/BhwkPLwFnkH0u/0qdzQ4WETBi
         UlhHW0622iSb1GRCT35DK0b+Gl/4HqlZouDa81gD68IFS27J1qk8cRlCNZ2yG3wolGPB
         vpTBRtrsCrA5zhwYo5kLnD2QzTjKcv/+EnxcrOvKa6KA/j3TNgh8rY8fDOA2G6+IhyIE
         38vQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TdLbOpIO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b8fbcsi101605831cf.113.2025.06.16.02.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TdLbOpIO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDbaTZpBIN+bSl0Gm4UeVXh57r0yQ+O/c3GBAhZxp10=;
	b=TdLbOpIOf+0PX6us1nPLWziimFPIsfslVCeU1uZ1qp7vsc8s+LwxRxYJoBAVzWlYLFlizQ
	rdH6e+lD+aqGGDk9VsUMaLNHCwt0ego/bOAfR7PZzLUfHX3pj+RLzwKHHLdns+XCdTbfrh
	T5j+Ux0gbD4yKHoDKtKjWljAk7LP9u0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-AqHCKoMTOYK78vjv4do81g-1; Mon,
 16 Jun 2025 05:50:40 -0400
X-MC-Unique: AqHCKoMTOYK78vjv4do81g-1
X-Mimecast-MFC-AGG-ID: AqHCKoMTOYK78vjv4do81g_1750067438
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C82ED18089B8;
	Mon, 16 Jun 2025 09:50:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B10C19560A3;
	Mon, 16 Jun 2025 09:50:34 +0000 (UTC)
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
Subject: [PATCH v3 16/29] hw/i386/acpi-build: Move aml_pci_edsm to a generic place
Date: Mon, 16 Jun 2025 11:46:45 +0200
Message-ID: <20250616094903.885753-17-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: xF4Z3k8aJ9I/

Move aml_pci_edsm to pci-bridge.c since we want to reuse that for
ARM and acpi-index support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- move to pci-bridge.c instead of pcihp.c (Igor)
---
 include/hw/acpi/pci.h |  1 +
 hw/acpi/pci-bridge.c  | 54 +++++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c  | 53 ------------------------------------------
 3 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 69bae95eac..05e72815c8 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -42,5 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
 void build_srat_generic_affinity_structures(GArray *table_data);
 
 Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
+Aml *aml_pci_edsm(void);
 
 #endif
diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
index 7baa7034a1..be68a98c34 100644
--- a/hw/acpi/pci-bridge.c
+++ b/hw/acpi/pci-bridge.c
@@ -35,3 +35,57 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
         }
     }
 }
+
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
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fe8bc62c03..6cf623392e 100644
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
-- 
2.49.0
