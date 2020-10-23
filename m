Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp289454lfa;
        Fri, 23 Oct 2020 00:12:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfzGyiTixboh9xDEiEJ7pxrZ7XrXS2E4re9D+dGSFGVQ0zx6eyO6tZHYb+9ZfCPRw75DPQ
X-Received: by 2002:a25:df45:: with SMTP id w66mr1538488ybg.302.1603437140243;
        Fri, 23 Oct 2020 00:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437140; cv=none;
        d=google.com; s=arc-20160816;
        b=HNvK411XLpOzD1nIFooI/G7sF8D1ngoL0vz6OgzCDk6QcgkniUwi2Sr2xeFexhKnuv
         CWbE6Dot8wQiVPLXIicxMT7VOAz4mebb3DucMfF6Wuez5c7Eb/o0Myf0iiXomtzKuhks
         6GM7s7adkFvn0O4T/AmNc53J8L6aClRpLeNKR7ziCsWSV88awjBPZ70wFKq2YBcbFU4V
         xWhb12fYkoLuakzS20UOuXoDpotnDjNdTgYvxKpA/HwE3VWdtNRNR20+K1ixfg0yFFyW
         t/n3aNnQF/3eVoh+kVU+b3LW3XeGYmvd/vuP6cvOl3tQM86LIsOrfdSlRs4hD0XR7QsX
         L03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eWkdInSjGNjGML1dW+2HIPwAc6XN/W7Ms3osxO/bjYA=;
        b=VGtiSkc8I0v5eSFSSudt7KFEQQpWPkamb7PIRzspelPYYlLVimNFDNKPS3FQUqMHyo
         mAyZmJlwWnXkugkFg0tbF0q9X+3fBD3baSpl1tKFTjA4N8tydMWKpU77dsvrkO2zFRx9
         lIJAGvI6dh+Zc8AmtAezoEAL7eQceRlL+q/rKgxtaIVyx7nP+OUlQ6zXbjGCEdp9NXy5
         I1ep3+ftCnLcN99Me1PLZkt3/ui5uOmXPbnhI6SCzLvBWcHtbyRy7B8Vur6doBytdm19
         R6mci2D8DEX+366k5p0/qsZgdrxrU9scgcAUp3Htl8kUzZaCIleW6JgJm58mxMqbiVka
         6IJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hkm0GQfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si727082ybm.64.2020.10.23.00.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hkm0GQfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrEK-0001Qs-EO
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDk-0000xe-0b
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDg-0003d8-Hw
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWkdInSjGNjGML1dW+2HIPwAc6XN/W7Ms3osxO/bjYA=;
 b=Hkm0GQfEf2qY3GZWKtt0Sy5bpg/TSPSHJfUHmyK9+ovSabbH2r2zsX4Yu68+5F5aUGJWY4
 uJU608120Eg5+etoUCvnx6pNIl1UPykhYdovxSVfR3w3UNN2K7RjftpNG0SfRn2Xuo992t
 4VaBWbAXgwuBOFgR6HadbtTuvhpSu7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-ddXiReYYOrW7qLJR8VP07Q-1; Fri, 23 Oct 2020 03:10:34 -0400
X-MC-Unique: ddXiReYYOrW7qLJR8VP07Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B81C95F9DA;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74CBC5D9CC;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4BEA9204A6; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] arm/virt: add acpi dsdt entry for xhci
Date: Fri, 23 Oct 2020 09:10:19 +0200
Message-Id: <20201023071022.24916-6-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
References: <20201023071022.24916-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rA958VfOtWma

Also tweak xhci_sysbus_build_aml, add _UID and _CCA.
Without _CCA the linux kernel's xhci probe fails on arm.

ASL changes:

         Device (XHCI)
         {
             Name (_HID, EisaId ("PNP0D10") /* XHCI USB Controller with debug */)  // _HID: Hardware ID
+            Name (_UID, Zero)  // _UID: Unique ID
+            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 Memory32Fixed (ReadWrite,
                     0xFE900000,         // Address Base
                     0x00004000,         // Address Length
                     )
                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                 {
                     0x0000000A,
                 }
             })
         }

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/virt-acpi-build.c | 6 ++++++
 hw/usb/hcd-xhci-sysbus.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9747a6458f0b..147332b37597 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -54,6 +54,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/usb/xhci.h"
 
 #define ARM_SPI_BASE 32
 
@@ -631,6 +632,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     }
 
+    if (machine_usb(MACHINE(vms))) {
+        xhci_sysbus_build_aml(scope, memmap[VIRT_XHCI].base,
+                              irqmap[VIRT_XHCI] + ARM_SPI_BASE);
+    }
+
     acpi_dsdt_add_power_button(scope);
     acpi_dsdt_add_tpm(scope, vms);
 
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index 29185d2261fb..fa963a5de4fa 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -79,6 +79,8 @@ void xhci_sysbus_build_aml(Aml *scope, uint32_t mmio, unsigned int irq)
                                   AML_EXCLUSIVE, &irq, 1));
 
     aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0D10")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
     aml_append(dev, aml_name_decl("_CRS", crs));
     aml_append(scope, dev);
 }
-- 
2.27.0

