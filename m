Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp573925lfb;
        Wed, 20 May 2020 06:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybgO+KXKvQW/7KLuBL4U7/oJ7JrsJMzit1qRqFr7F/i2ITrp0giBgJSLO1CkA6iV464rM9
X-Received: by 2002:ac8:fb5:: with SMTP id b50mr5170861qtk.164.1589980887833;
        Wed, 20 May 2020 06:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589980887; cv=none;
        d=google.com; s=arc-20160816;
        b=0w0nvPcSRAnY0RKTmuoV4V8YyoQ8wer1prJ24xyCbTc0yhZj2EM362NZAzZlaAuNUD
         lw6X6AK3Q+/hyETLIaZihmzQlmIGluep3T06XhvOX6oZ1LKSgMXvs66cWTaOlrAQ2CKt
         dff22+Aax0yu3q7JfS/I9olCAK3Iw1SqlAdEN5B49wnTKLlj9RMe345JwCaTHo5s7G7d
         38OcSijozQ4H4gicsXCvgtY6Cm9vDyU/LRNRkK8rfOGL9Q0rfud0wSlSipsyEeleheMT
         FewAwvTsxqU84cXqPSIYnoxG+XuRgIVuHZV5ZkjkYBl4Oy2PA0CMYX98PYC8uRKw2d+L
         sniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+LpZn95fCyMj5LlBHQAcVb5mRTpszyydwOnQVComLXw=;
        b=fA3qhjHL4P3914+oVO7Jh2BySYvWWpISn2GzUq6JucJt3fdDxq4a1S62iKD6tmWv4q
         SdjWt4Q3vZ25OIWgXw4N+CtRWdE9+wjKT1dGaJAGHEqiGkK6yHdYSevN3TbGL26Twz71
         olQ7zPMZFRLV/OGVJlc4ijGR75cabOhEI8op2hccCYtnmglsvOp2Rif6DvJFZ5Z91+fE
         6YdD7JvCtp11cIdbPmzknCL4YhMv2F4lZfRJThKRee9GkgLxqHuAJCDmNnenhPJnr0w+
         Pis1YxluUq/bBXKDxunFPXVOkuGZI8rS8pzppjPnIraaRBRCaUOG8T/U8ADbP0xjlQ1i
         etmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PS7fRYxE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i185si1805755qke.246.2020.05.20.06.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PS7fRYxE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOf1-0003jn-5f
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe4-0001oh-B6
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe2-0000EI-R4
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LpZn95fCyMj5LlBHQAcVb5mRTpszyydwOnQVComLXw=;
 b=PS7fRYxEw/ZYsig+oHB1tRlSHe//X9NdqGjyqpX923/oiGESXpOUU9slgClwDQDTU/lhqb
 g4U3U+8GaT0Y9k7+m8FNi3PUdMCt1N8lMSMkhQO2LMLbCpFOuiettDVdY0uuqHsPQ4OlWj
 r3BKJj7WgNpbawgEZVC3H2MdIHJ9MPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-xI7otfMqN4GRE8mHKW9wnQ-1; Wed, 20 May 2020 09:20:24 -0400
X-MC-Unique: xI7otfMqN4GRE8mHKW9wnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4B8D8014D7;
 Wed, 20 May 2020 13:20:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFC2E1943D;
 Wed, 20 May 2020 13:20:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB0559D56; Wed, 20 May 2020 15:20:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/22] acpi: madt: skip pci override on pci-less systems.
Date: Wed, 20 May 2020 15:19:48 +0200
Message-Id: <20200520132003.9492-8-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Ym+f5T4f9BF

Needed for microvm.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-common.h |  3 ++-
 hw/i386/acpi-build.c  |  2 +-
 hw/i386/acpi-common.c | 26 +++++++++++++++-----------
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index c30e461f1854..9cac18dddf5b 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -9,6 +9,7 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev);
+                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     bool has_pci);
 
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c0fdd539a640..583bb58d6f0c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2414,7 +2414,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
-                    ACPI_DEVICE_IF(pcms->acpi_dev));
+                    ACPI_DEVICE_IF(pcms->acpi_dev), true);
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 5caca16a0b59..ab9b00581a15 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -72,7 +72,8 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 }
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev)
+                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     bool has_pci)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
@@ -111,18 +112,21 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
         intsrcovr->gsi    = cpu_to_le32(2);
         intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
     }
-    for (i = 1; i < 16; i++) {
+
+    if (has_pci) {
+        for (i = 1; i < 16; i++) {
 #define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
-        if (!(ACPI_BUILD_PCI_IRQS & (1 << i))) {
-            /* No need for a INT source override structure. */
-            continue;
+            if (!(ACPI_BUILD_PCI_IRQS & (1 << i))) {
+                /* No need for a INT source override structure. */
+                continue;
+            }
+            intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
+            intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
+            intsrcovr->length = sizeof(*intsrcovr);
+            intsrcovr->source = i;
+            intsrcovr->gsi    = cpu_to_le32(i);
+            intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
         }
-        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
-        intsrcovr->length = sizeof(*intsrcovr);
-        intsrcovr->source = i;
-        intsrcovr->gsi    = cpu_to_le32(i);
-        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
     }
 
     if (x2apic_mode) {
-- 
2.18.4

