Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3747509lfb;
        Mon, 6 Sep 2021 05:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJwZzDXGqnmjIrZr2vAlyBr+cGpT35M7B5zGpp7QkRVRWQAE9v8rlXfTN/zd8ThDH+E9eF
X-Received: by 2002:a05:6e02:20e7:: with SMTP id q7mr745363ilv.212.1630931694150;
        Mon, 06 Sep 2021 05:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630931694; cv=none;
        d=google.com; s=arc-20160816;
        b=KPS8NSj60IVIoF2oPDrQ/Ze8V/G3V/KTFdfQfMVn3XnyDLBAJnHwpzC4RKKbhcSS4N
         6XepZQh+MFiSEal+isXjnJ6r0En+knRl6m1TpvM99luxDUjk4+p4aSqKhpJtRQxFCtCI
         hETvpSQN826cR7mWMJ6aQKpmXFxYbBcskITcy9sVMhm5zNM6CJmhqQkkx//RFpsJERME
         ztjb6hc5K/y+UjPMq7HlujFdVq6HqxQB3s+kwxkYedFuVc3MMA4TGo4O3oUknOKqcyVP
         KbQNdsMyWzewrqNvcsz4pnBLbLVLtojpmzpdwH/zIh3E+sS55EomCM7vK0ltSnWVEmLM
         9NYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LveBQff8aq/vpMgg77GLqQotmwHLCIyfEeYr0nw6Rhw=;
        b=KMnJfFC53SGsZjTKd//C3gf0ctm04QOsc98EWsSecGOEk7YhORQJOJWGA/HxBk3rjP
         4BJRa68cHgWB213fVygOHrfPrWsvHFztkWgeSiE8OJorwLzNhDhQbRYiNoVNVdyA/tCA
         4RkYze0gGeQR1OT0u50c7S0JNQUHvza5plpAcx57ZgTQtWtL2cKm2isvCS3We1rFB3Xe
         TViUmPtw3SToHfDjqpHRAK8BFaQjsm0Vg+4M17QAF6HsdItNKc+awAnltYCu7ROUfXVC
         UvjA5mkiFRb+UdOH77mWTTHyDp/6BCbVuW9wVbPCgzwyr5MkW6oJc72zEym/c/VL6gAR
         KqFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ifL/2uHJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q128si8477902ioq.111.2021.09.06.05.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 05:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ifL/2uHJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNDpt-0006NN-ER
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 08:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDpD-0006KG-6a
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDnG-00021X-Qf
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630931530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LveBQff8aq/vpMgg77GLqQotmwHLCIyfEeYr0nw6Rhw=;
 b=ifL/2uHJkhzMl3ByzjULS1C3hs3ZsGvbR3+P6gstU8+Ui3ok2qJCVIosVYqdrosdBk9cEO
 XxR5+w/PlPCTPfpDpk8qqixF8TF8v+ahb45Vsji5VYRHxcwmbDD3W/I6qSqvFY/uYo/qQb
 iWtgqdmatsQUWmo8nW6tM5I4XNcI0OY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-wu_zm4JgPKiETqnVTi4hSw-1; Mon, 06 Sep 2021 08:32:07 -0400
X-MC-Unique: wu_zm4JgPKiETqnVTi4hSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483956D253;
 Mon,  6 Sep 2021 12:32:06 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CC8A77F2C;
 Mon,  6 Sep 2021 12:32:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v2 3/3] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Mon,  6 Sep 2021 14:31:39 +0200
Message-Id: <20210906123139.93593-4-eric.auger@redhat.com>
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8eNyWaxfIONm

ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
this latter allows to describe one or more debug ports.

Generate an DBG2 table featuring a single debug port, the PL011.

The DBG2 specification can be found at:
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v1 -> v2:
- rebased on Igor's refactoring
---
 hw/arm/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 488ea04eed7..de604e79779 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -512,6 +512,65 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_composed(linker, &table);
 }
 
+/* Debug Port Table 2 (DBG2) */
+static void
+build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+{
+    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
+    int dbg2devicelength, baseaddroffset = 22, namespace_length;
+    char name[] = "COM0";
+
+    acpi_init_table(&table, table_data);
+
+    namespace_length = sizeof name;
+    dbg2devicelength = baseaddroffset +
+                       sizeof(struct AcpiGenericAddress) + 4 + namespace_length;
+
+    /* offset to the first debug struct */
+    build_append_int_noprefix(table_data, 44, 4);
+    /* number of debug device info struct entries */
+    build_append_int_noprefix(table_data, 1, 4);
+
+    /* debug device info structure */
+    /* revision */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* length */
+    build_append_int_noprefix(table_data, dbg2devicelength, 2);
+    /* register count */
+    build_append_int_noprefix(table_data, 1, 1);
+    /* name path length */
+    build_append_int_noprefix(table_data, namespace_length, 2);
+    /* name path offset */
+    build_append_int_noprefix(table_data, 38, 2);
+    /* oem data length */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* oem data offset (0 means no OEM data) */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* port type (serial port) */
+    build_append_int_noprefix(table_data, 0x8000, 2);
+    /* port subtype (ARM PL011)*/
+    build_append_int_noprefix(table_data, 0x3, 2);
+    /* reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* base address offset */
+    build_append_int_noprefix(table_data, 22, 2);
+    /* address size offset */
+    build_append_int_noprefix(table_data, 34, 2);
+
+    /* BaseAddressRegister */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
+                     vms->memmap[VIRT_UART].base);
+
+    /* AddressSize (PL011 UART length) */
+    build_append_int_noprefix(table_data, 0x1000, 4);
+
+    /* NamespaceString */
+    g_array_append_vals(table_data, name, namespace_length);
+
+    acpi_table_composed(linker, &table);
+};
+
 /*
  * ACPI spec, Revision 5.1 Errata A
  * 5.2.12 Multiple APIC Description Table (MADT)
@@ -770,7 +829,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
+    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
@@ -793,6 +852,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_dbg2(tables_blob, tables->linker, vms);
+
     if (vms->ras) {
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_add_table(table_offsets, tables_blob);
-- 
2.26.3

