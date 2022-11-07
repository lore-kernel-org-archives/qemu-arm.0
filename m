Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3405309ejx;
        Mon, 7 Nov 2022 14:52:00 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4R5tio0reI6dlO/C504xahOMtRdcmL9AJFixp6bvbC1EtL0RRFedpyhqE/S/Up4CQIuDvk
X-Received: by 2002:a05:6214:400a:b0:4bb:b1f7:4cf3 with SMTP id kd10-20020a056214400a00b004bbb1f74cf3mr47012136qvb.110.1667861519975;
        Mon, 07 Nov 2022 14:51:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667861519; cv=none;
        d=google.com; s=arc-20160816;
        b=K1MDWHe+g8WpgCRVDJQG3Kfppnqq38DLnzbfslVnBI2DSbKk6ys0Xu7vNWrN0z9+fY
         xSYMoB/Fj2l39V3YvQk7ixTW0TS/XLZogTd+whid/Kn4eD21q/VaARFK1mCecgh56uBI
         lqYrG8Ghu6JRpbt6oPURac9Ut31V7EYjMQpBsNq2eZ7Eft+wTgri6MqOoofuKlBI0o5t
         +eV/gqUZLZ7IgcjxV2oAjr1bLN+pBzBGVEbGqmzjQ8+2JFr5hR06LsC533uTLEntPTE5
         YKqwb6kzhm082AmZ05WvZWP+zHpqXRnLadbOSg4O6c2rMOTEmkT3kmPhEvTAJAykgY86
         3POA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
        b=zd1qn4TrFMopiZHIStfXbvNu/wzAsOwmFq40BZQvN3pHVnQWIeZ6xKg+5eS6l/pQ6B
         wjZWNhYDahZpo2/iUf5sdQpDMWJ8l8eVL9ZpyCSF9OAFYlmtIX1w2vKiDOwXm+1WuCaQ
         m5IwV2Wbn66GOkWY+Z/eS4PZGcfJ2uHqjIa73c76smefeV0tNYbUVMvl247klAM+LcHV
         7It5msmARc4v2n/Tdm1lIa+THVHXneihiAhyRwgCrhTcIRwvZl2/mnXivW8KDq/eFpuS
         l3k45vyjTcJXxFUR0OMBZQJF9U5fOYdYUXOonAIN2Orj7EekTmj0QVJAm/ZVphN+rULV
         A0Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8ofswXU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j127-20020a375585000000b006fa4ab0714dsi4848436qkb.689.2022.11.07.14.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 14:51:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8ofswXU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osAvb-0007HU-Uu; Mon, 07 Nov 2022 17:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvZ-00079u-RJ
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 17:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvX-0001kG-9l
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 17:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=P8ofswXUJ9pwDMDmZcrEGB1hJq8+tKQdB6lIUTegdSKqVTgFkiwmm/6bPlTfLN91+kc7qX
 P3gLnTcchPJ+HAKi3sYORV8aFNW9PP6YCsU3Yq6VQTKlYhSSLHJVhOZj6wRluGWWyniaOr
 Vbm5kQ73iWhUC36Biclf3gke09vPl/g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-nz-9kqa3OHWlHL7sbT8wBA-1; Mon, 07 Nov 2022 17:49:09 -0500
X-MC-Unique: nz-9kqa3OHWlHL7sbT8wBA-1
Received: by mail-qk1-f197.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so11318566qko.3
 for <qemu-arm@nongnu.org>; Mon, 07 Nov 2022 14:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=3R4wP38OFtpr+v0r4B6m7fxj8/HMMAppDHHH2BV9fbNnPOlnT6Hxns1kNNIMtp+cpR
 PQ5Ib+Y3QLMPTb4KsxqdwT0Tn3u+aHY24/JSTUTWeFS99Qcpj/sZr5vU1Cg5U+vJijcn
 mEGOVOWcew9Bmyy+JG5tOUWYggFG/oO5r4W8kVwV55mVwdLvC3Sp1YJci+Zg8qoUodTc
 9fOjXYO/Q/DuxIkrr6kFiIZsz7vo5Hy/GSOKDG6jm819MK+C0cATITAQzN1jpk92hPzX
 pPXSS6GBKxGZURUkovPoj1GGykf/1D8N8neCVP5MABgZYp/Yn82mDt/zT4GURIN4/2Iz
 j+qw==
X-Gm-Message-State: ACrzQf2Ns9a56LLGI6RPx4FwMg9dxf4E3gFf3/SdDPkMNNyw32rHb1Tv
 ZMmTsZZW3YZG2MyKOqje8c3VFMrC3jn9+GYrMByKEW4/Exd34xgIvay+MA9G3WKa4iezcAwgR9P
 DA0pehuRCNVKp
X-Received: by 2002:ac8:664d:0:b0:3a5:68b6:887f with SMTP id
 j13-20020ac8664d000000b003a568b6887fmr13956990qtp.458.1667861349066; 
 Mon, 07 Nov 2022 14:49:09 -0800 (PST)
X-Received: by 2002:ac8:664d:0:b0:3a5:68b6:887f with SMTP id
 j13-20020ac8664d000000b003a568b6887fmr13956980qtp.458.1667861348817; 
 Mon, 07 Nov 2022 14:49:08 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 az36-20020a05620a172400b006ce9e880c6fsm7959843qkb.111.2022.11.07.14.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:08 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v4 18/83] acpi: fadt: support revision 6.0 of the ACPI
 specification
Message-ID: <20221107224600.934080-19-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HXxRimeJjL7B

From: Miguel Luis <miguel.luis@oracle.com>

Update the Fixed ACPI Description Table (FADT) to revision 6.0 of the ACPI
specification adding the field "Hypervisor Vendor Identity".

This field's description states the following: "64-bit identifier of hypervisor
vendor. All bytes in this field are considered part of the vendor identity.
These identifiers are defined independently by the vendors themselves,
usually following the name of the hypervisor product. Version information
should NOT be included in this field - this shall simply denote the vendor's
name or identifier. Version information can be communicated through a
supplemental vendor-specific hypervisor API. Firmware implementers would
place zero bytes into this field, denoting that no hypervisor is present in
the actual firmware."

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221011181730.10885-3-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/aml-build.c      | 13 ++++++++++---
 hw/arm/virt-acpi-build.c | 10 +++++-----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index e6bfac95c7..42feb4d4d7 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2070,7 +2070,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     acpi_table_end(linker, &table);
 }
 
-/* build rev1/rev3/rev5.1 FADT */
+/* build rev1/rev3/rev5.1/rev6.0 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
 {
@@ -2193,8 +2193,15 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     /* SLEEP_STATUS_REG */
     build_append_gas_from_struct(tbl, &f->sleep_sts);
 
-    /* TODO: extra fields need to be added to support revisions above rev5 */
-    assert(f->rev == 5);
+    if (f->rev == 5) {
+        goto done;
+    }
+
+    /* Hypervisor Vendor Identity */
+    build_append_padded_str(tbl, "QEMU", 8, '\0');
+
+    /* TODO: extra fields need to be added to support revisions above rev6 */
+    assert(f->rev == 6);
 
 done:
     acpi_table_end(linker, &table);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 13c6e3e468..e5377744f3 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -808,13 +808,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 /* FADT */
-static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
+static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
                             VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
-    /* ACPI v5.1 */
+    /* ACPI v6.0 */
     AcpiFadtData fadt = {
-        .rev = 5,
-        .minor_ver = 1,
+        .rev = 6,
+        .minor_ver = 0,
         .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
         .xdsdt_tbl_offset = &dsdt_tbl_offset,
     };
@@ -944,7 +944,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     /* FADT MADT PPTT GTDT MCFG SPCR DBG2 pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
-    build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
+    build_fadt_rev6(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
-- 
MST

