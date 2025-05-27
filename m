Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647838njc;
        Tue, 27 May 2025 00:43:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmplrxRbVWGMkwmdMiKZ2ECTFojjdRqa51sKzFsnQUohLPjaI2NZQVQMXlxBvFFGijFkdeMRlKTmL6zg==@linaro.org
X-Google-Smtp-Source: AGHT+IGKPGrd1puwaCPNVNZOwYeU4ltF05lXMIBo07Et9iTW9qbhb0EbhS/T0loOkiHJyK97uiZs
X-Received: by 2002:a05:620a:2717:b0:7c5:95b6:b40a with SMTP id af79cd13be357-7ceec4b928bmr1804572485a.27.1748331804541;
        Tue, 27 May 2025 00:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331804; cv=none;
        d=google.com; s=arc-20240605;
        b=kovZNZR65IU0wjGFwm5c/Shxi+spPVoXWmWY7bDwcMGWgCCG4oJnbRBjEzFdAQNo8e
         3/uhIzATTfdMhjCXfYOAlgbaPbVpUYwX4/bjGgflGHjSTBh/nYddlPqhCGeeVgEnBKcj
         kdWieXPQP1VwlHUUujlNcwWmUYig2Jjgn4YjsMALsQMrrRVNe/jQUkJLVuKebfgZEGEK
         w5cljP0HPBumej6Q5tD30rthrrnxV018sThENM4trYCEwPZn3TRF86tbsZ3SDW3+29BX
         GyUlBG+Tl9zkXNqTxxxmyJc53olFKXBZsIbK+UyxettplDjxlrw5xer0TBM0luliYODv
         5pOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yrzVGVh8lIMAfL8ew6HgaTGBjvLAkqq1jZsorV45cQQ=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=AT/r8RmgsFOV+naXk/6zzUb0ln3gMfytEoXlJ7PuXjaPw3Wp34H5YPohlwalIjqGX2
         s/hZ60GmklMhoPlVaFoyDCABm1+AkuDV9jxYwGizLZ3atbL7oZp69ShtMFGsSd5bNFtQ
         XwVEQ6Qe1b3CetL9OnIkmi19t5tWTD/BJULnkFbz59z+GpQZqyKSXhtjnHSUfP6lprAM
         NLtdC+DSpqqjU0vXXJQUVEk9f5zuzZ4gwfR6VPjyDnNlPXxOIgHL8O0t3bnIiU2RtU/9
         PTYGyOHSxfjZGuXXWcifhvoec2QFS57xrzDzuHFiAe4DlOMwTvSO1HzPcZXb/AwHnS46
         HHbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F0j9NeJy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467ce2f0si2564779285a.18.2025.05.27.00.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F0j9NeJy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yrzVGVh8lIMAfL8ew6HgaTGBjvLAkqq1jZsorV45cQQ=;
	b=F0j9NeJy8wie/TG7ETvnVsngQOcct2bPfr8xlfspSphr1l5+xjK/XP6Yv1K9ZeDd3cKjBY
	CrcpN2VoJBhGcZfYlHaWl/ZS9s6hZN9FNEIIwjupJIUIHYw3TzMaqbL9qUAjDGy3YxiY/K
	mnkJgjLH7gX6t/YOr60eTJoJjVJ2jks=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-FgsgXQVDOiuLAhUhORUNXw-1; Tue,
 27 May 2025 03:43:20 -0400
X-MC-Unique: FgsgXQVDOiuLAhUhORUNXw-1
X-Mimecast-MFC-AGG-ID: FgsgXQVDOiuLAhUhORUNXw_1748331799
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37BFA19560BC;
	Tue, 27 May 2025 07:43:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A9BB1944DFF;
	Tue, 27 May 2025 07:43:14 +0000 (UTC)
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
Subject: [PATCH v2 09/25] hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
Date: Tue, 27 May 2025 09:40:11 +0200
Message-ID: <20250527074224.1197793-10-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 67QOP+OmW5Oq

gpex build_host_bridge_osc() and x86 originated
build_pci_host_bridge_osc_method() are mostly identical.

In GPEX, SUPP is set to CDW2 but is not further used. CTRL
is same as Local0.

So let gpex code reuse build_pci_host_bridge_osc_method()
and remove build_host_bridge_osc().

The disassembled DSDT difference is given below:

  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001A4F (6735)
+ *     Length           0x00001A35 (6709)
  *     Revision         0x02
- *     Checksum         0xBF
+ *     Checksum         0xDD
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
-                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
-                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    CTRL &= 0x1F
+                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
+                    Local0 &= 0x1F
                     If ((Arg1 != One))
                     {
                         CDW1 |= 0x08
                     }

-                    If ((CDW3 != CTRL))
+                    If ((CDW3 != Local0))
                     {
                         CDW1 |= 0x10
                     }

-                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
-                    Return (Arg3)
+                    CDW3 = Local0
                 }
                 Else
                 {
                     CDW1 |= 0x04
-                    Return (Arg3)
                 }
+
+                Return (Arg3)
             }

             Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- move in the dsdt.dsl diff in the commit message and remove useless
  info (Gustavi, Michael)
---
 hw/pci-host/gpex-acpi.c | 60 +++--------------------------------------
 1 file changed, 4 insertions(+), 56 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index f1ab30f3d5..98c9868c3f 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -50,60 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
     }
 }
 
-static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
-{
-    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
-
-    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
-    aml_append(method,
-        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
-
-    /* PCI Firmware Specification 3.0
-     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
-     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
-     * identified by the Universal Unique IDentifier (UUID)
-     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
-     */
-    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
-    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
-    aml_append(ifctx,
-        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(ifctx,
-        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
-    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-
-    /*
-     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
-     * and PCIeHotplug depending on enable_native_pcie_hotplug
-     */
-    aml_append(ifctx, aml_and(aml_name("CTRL"),
-               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
-               aml_name("CTRL")));
-
-    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
-                              aml_name("CDW1")));
-    aml_append(ifctx, ifctx1);
-
-    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
-    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
-                              aml_name("CDW1")));
-    aml_append(ifctx, ifctx1);
-
-    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
-    aml_append(ifctx, aml_return(aml_arg(3)));
-    aml_append(method, ifctx);
-
-    elsectx = aml_else();
-    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
-                               aml_name("CDW1")));
-    aml_append(elsectx, aml_return(aml_arg(3)));
-    aml_append(method, elsectx);
-    return method;
-}
-
-static Aml *build_host_bridge_dsm(void)
+static Aml *build_pci_host_bridge_dsm_method(void)
 {
     Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
     Aml *UUID, *ifctx, *ifctx1, *buf;
@@ -134,8 +81,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
     aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
     /* Declare an _OSC (OS Control Handoff) method */
-    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
-    aml_append(dev, build_host_bridge_dsm());
+    aml_append(dev,
+               build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
+    aml_append(dev, build_pci_host_bridge_dsm_method());
 }
 
 void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
-- 
2.49.0
