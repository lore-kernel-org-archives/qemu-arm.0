Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1342359njb;
        Wed, 14 May 2025 10:11:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAkA1UAmVDFz+066BEwIA9XVLGJAHusTRWGdDUKTCJD2IlnU0PN3d+b7okl1qgQgc4Un9CpCofuk0dyw==@linaro.org
X-Google-Smtp-Source: AGHT+IEC/IkcZDj2x/ZsACAsbmaDY6p4MRlHEdYNkRND7r7jtgC6QhrrjEkPzgigOvjuHe3H4eyC
X-Received: by 2002:a05:6122:787:b0:520:997d:d0b4 with SMTP id 71dfb90a1353d-52d9c5c48f5mr4173048e0c.4.1747242658378;
        Wed, 14 May 2025 10:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242658; cv=none;
        d=google.com; s=arc-20240605;
        b=ETHrGBk57t1+DhSbKmGmgKk+uqSWCubf7I9ocB2u9zLxvchVb2TCtZIc2e0kikRz89
         DTwRYGDqTjLC4MaMkQJZwjtt8bEZM0k3qqU4/UAtGOUfClH18zvVSJn0qAI7c/rxVIT2
         YlMNkfEUEwRgwfmBX6YveuPl1QJqxv+DF2ipqiu+jK8Ypi8qjGSW9d//kCePxR4RIKiv
         uF8eAZ8ZHrBdf+V7IVO/N//Ao+ZtFglmValqWcCTiEu2lWZG8yfx2H1BXSSwVcfH2oQL
         5DcIR/UTJ5WoizwateTQlXOA3GEBpsdDSw/hpDA6gkP6Zl/MNu8Of8EWlb9A8P7fuqWU
         FDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9yIx3jO5l/tsT765FqOpH2V9bnrJ0fYoOfXeZobeS98=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=LzHI7WdmQMp26acHFtAZ0CLfCPMTGY9VUSchOIUGRON2fEvvFj3ZRbVed8wDuPOfzd
         BrJvrDHokXeBRfYQkDrMQZEScMNfvs2RvLvTmmsAxGTEgEuMxEa0+0FPX+juWc1aAzKI
         FxztLeWoIRXs3HoYmm0pfnGioSxDf82gk5fWUBa9KtRbWvlcpyCHldX7abrY8pMhzKLb
         xRTQdow1YDCgCRWsO3T29R+agYWMQPeSfpOlQprZAwkYLr27hogKIagXrJFjgem+Dr9E
         f0pSbQ9p3/FB2PfGBnPdB7iZvFRGvOLTi1UaB1mF3/Fj37X1sgUQrs2VEW7E1cIp4HrA
         MEMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LTmkdch8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-52c53caa85dsi5505998e0c.224.2025.05.14.10.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LTmkdch8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFYP-00024r-Q0; Wed, 14 May 2025 13:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXv-0001sB-91
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXr-0007e6-Lp
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yIx3jO5l/tsT765FqOpH2V9bnrJ0fYoOfXeZobeS98=;
 b=LTmkdch8ONnm+vZDodKvHYgKHnEpCrUabBVj7k8Hf+cUDLEK2nXhe7VJnOXz3k9ChsRlHY
 eEL/8xYdLo3jkM3jI+1eOc1CW6it3tPusAMXBv3uSUdqiCIPie4nXuxJo0U92Pjpr/aCFq
 fnpe0DnptRob5vbNuHjezN55lTQa3sM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-HcEo3HmpN2i3-XUYLfst-Q-1; Wed,
 14 May 2025 13:05:23 -0400
X-MC-Unique: HcEo3HmpN2i3-XUYLfst-Q-1
X-Mimecast-MFC-AGG-ID: HcEo3HmpN2i3-XUYLfst-Q_1747242321
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 805491800366; Wed, 14 May 2025 17:05:21 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2190030001B0; Wed, 14 May 2025 17:05:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 08/22] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Date: Wed, 14 May 2025 19:00:55 +0200
Message-ID: <20250514170431.2786231-9-eric.auger@redhat.com>
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
X-TUID: eGhLuCvJE7Lj

gpex build_host_bridge_osc() and x86 originated
build_pci_host_bridge_osc_method() are mostly identical.

In GPEX, SUPP is set to CDW2 but is not further used. CTRL
is same as Local0.

So let gpex code reuse build_pci_host_bridge_osc_method()
and remove build_host_bridge_osc().

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

The DSDT diff  is given below:
diff --git a/dsdt.dsl_before b/dsdt.dsl_after_osc_change
index 3224a56..fa7558e 100644
--- a/dsdt.dsl_before
+++ b/dsdt.dsl_after_osc_change
@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of dsdt.dat, Mon Apr  7 05:33:06 2025
+ * Disassembly of dsdt.dat, Mon Apr  7 05:37:20 2025
  *
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

