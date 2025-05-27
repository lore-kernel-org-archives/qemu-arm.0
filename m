Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648088njc;
        Tue, 27 May 2025 00:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyqqtDyIcCVNoooI8fnKhwzK07mD6RlYKXbatzlWj0SdJ8EqsturZIRNp7gAXJgZzi8UkxeQ3fGSVeQg==@linaro.org
X-Google-Smtp-Source: AGHT+IHXTi1r5kedUvFrHM8Re/oXLXd/+ik2Ewpnviivwdm17mRUznPdYs/px3zxUGIFzaSY2uRB
X-Received: by 2002:a05:622a:1f0e:b0:494:ac74:a2af with SMTP id d75a77b69052e-49f4674db24mr189992921cf.15.1748331838959;
        Tue, 27 May 2025 00:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331838; cv=none;
        d=google.com; s=arc-20240605;
        b=j+VV+rq0KZsxGLSgfU5RzNRHyuiiH5zw+sIpwOJIb7GByCCSrdCR7DCdpGwrv5pdFi
         NiVNDBKGiYbm/IYPqdsyxzdNn2e1+051TkoFiWeRthPwzadv6AkrLrbNNaJNg1vmgV4b
         mk4tpQL5mp3LvGznxpZyfNzokYnYOMjHKFlgZIm4a7plL3v9EEF45LFgN71hi5O5zoXw
         AsYlsHNsySL1difDA+gmDFZboGOyqoztVcHGksflLFuwBfOrQCuEpvrFpV58HcR85SNJ
         lfXnB13w/XmqzBuWwXRPDskFAmFVzhkF8cnaMAUjUytiHy0SEcV7r1ZE6/4A8bPXGyds
         2djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1zp8eSi3g7YhvwHcDTyqJ5VXJp15yzIwC9C2AxqeIl0=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=SsshUeZy9cYn/ZuJI/H39/LAJM/q+v80iICV/aBR8//FmqGqLtPY6tlr/uzXrjBvjt
         9Gvuzu3V1VjtqfmBTvdInw0OecfX8LNxxnWwupzwXZZApRPa7w+NVuTUSBdPcCEeVfiG
         AMyTMfWQSlmEEnCcfizXmrptYVv65aEqRYVd1XSPkdz9Ajht3RGyT82xHSwxsnNGRHzA
         +xqDMB0fxcDo4a582mIUjDeXY7JIjk+xRZMKwDoGnlFJB3ysUibcozRlc7OEoFnE8Wzx
         ivLA8/g8aDelX16UhMKGz5InT/VIMvSHWr/LCNwZeXTkyL9dc2ZsycS4JXDDanie9vkn
         P/zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dJJeHV6L;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40c572si264762951cf.20.2025.05.27.00.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dJJeHV6L;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zp8eSi3g7YhvwHcDTyqJ5VXJp15yzIwC9C2AxqeIl0=;
	b=dJJeHV6LITuFWKDISvMt2KVGFZYGcChNM+PPul9puZiD8qz98QlHZE8kojTAH1ieUfacMc
	+y7IErf4yX/zuO6PwvGBJ4ZhziUCm9x48/CDcyefRKMyhZ9XOiSYBKp/aaWZOpeziYYCHW
	HzLdUHZQJiFuulW4jpwqbh9Zc1VekDk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-jiBX2us9Mam7iuDV659Opg-1; Tue,
 27 May 2025 03:43:55 -0400
X-MC-Unique: jiBX2us9Mam7iuDV659Opg-1
X-Mimecast-MFC-AGG-ID: jiBX2us9Mam7iuDV659Opg_1748331834
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA98018004AD;
	Tue, 27 May 2025 07:43:53 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74A7A19560AA;
	Tue, 27 May 2025 07:43:49 +0000 (UTC)
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
Subject: [PATCH v2 16/25] hw/i386/acpi-build: Move aml_pci_edsm to a generic place
Date: Tue, 27 May 2025 09:40:18 +0200
Message-ID: <20250527074224.1197793-17-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 4TkIPKQZDgQV

Move aml_pci_edsm to pcihp since we want to reuse that for
ARM and acpi-index support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pcihp.c         | 53 +++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c    | 53 -----------------------------------------
 3 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 5506a58862..f2c3558654 100644
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
index 6feb99e9eb..e8ed335fdd 100644
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
