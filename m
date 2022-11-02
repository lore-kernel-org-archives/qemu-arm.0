Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp319534ejx;
        Wed, 2 Nov 2022 09:24:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4boHwZSUV/DZXvdak6qLxeA8m6gvdpfNyRFjl856ZhVXy1EInSsz5jaCSEa7yfDs70hoRp
X-Received: by 2002:a05:6214:29e3:b0:4bb:a93c:6d88 with SMTP id jv3-20020a05621429e300b004bba93c6d88mr21731518qvb.105.1667406278513;
        Wed, 02 Nov 2022 09:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667406278; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl5QDlKUqfWC1XiEjYoCuOFa58zj11Xo2RtCRwcvBxT9wfGNchOZz1ZliZvOBUlIPl
         1fM6OvxXGked+q+K+2l/gjJnCX4salxaL+WWpaVA3/PJ16H3wG7h/TdqmVisJczeW4FF
         ec8A/Rbr/f+vjwRq+kEfIPrLUKz7ydAFxH/SUjeP2pqkQg+iPajIIDi8WbiqeXd7DmaQ
         4MNZcfd5jf6n/CVN7/bWGR76bOTMmQIPDCU9n7ZuuDwtYPpSzM2i6oFcHXn8gMl2288P
         gvxtUHMPXBGE215pPH2LfSaSgkY+edE2jwJv7Onx/k7BCJO+oWQAF6KPdlkfmj23inYu
         /KlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
        b=jQFPrcpFd2sPkIXOcye2ZaZDWDVq4onFgcE8vq4FKO7WNRoyh/ajA/5HT9c2c3xS1m
         zmdxevN5Lb/fk6XLzs4UBcUjkQQFYpgAQqzBXWTF+TJ/shDM9bIfQ3ZEHSJ6rEasGque
         NzyOBKD19yu6a2E5rB/V+Y7lF85XS3EGrT+GG21vPdJtTVkcejIGqJE3Gh6q3SEmo6ed
         0jxQxzlZPkyWtKhBO/Ay3woTIMlcN87YcSQvfbCx6aaXbAtFPbh+avCLZQ8bQvVE7fVm
         DH2JWps1i+Jzak3CDMUYS9BSlMhM+akP9KO7JorREYcCNIbjcKz0fwsJMNxiA57Kg6V6
         wtEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PrpfCEaz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3-20020a05620a294300b006ce5215fc54si9180173qkp.207.2022.11.02.09.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Nov 2022 09:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PrpfCEaz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJD-0004AJ-A5; Wed, 02 Nov 2022 12:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJ0-0003c5-WA
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIz-0002Rm-GI
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=PrpfCEaz8HyLLm3QAZ4W2h5uzjoUhVOTnSLLfbsc/fSA+qLFX8vyLuD55B0pumW+Kx9NkM
 vRktFkhm1/u6+st7FiyEcRb/urAoBbnQzIRkeEPiKLkL6gxaUfPlsyhapQu4CRdcSK91hK
 iM7QR10CxfnhD+UMIy0BSkHoyIyeU/4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-h5w05AV2OsmIFc2j_MckxQ-1; Wed, 02 Nov 2022 12:09:27 -0400
X-MC-Unique: h5w05AV2OsmIFc2j_MckxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so650193wmg.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=isHL5JTgvDEntf6cKm3MOJZAEB9tLwsbRtKXP8+fw6o7v01yuzZYgEeBrGWgZFr1Kh
 M1YsgOLq4mbdtChwBVWAT+sPa/rnb4D8nbWFmonN4wDYjnsmk1ipEPUZtyBRNJQ0aprc
 ZKz2EcgpZYMkidM2qUevS4IA9NEg53/pbgaQfX6rBFR4puz97OEtwcj1pB+zo4En1DgJ
 a/WtrXMytk6/Lmn25X8wiTytC2XvWMp0at8tYRAORSCGroa6fXX15i08ey0UYUtPdKKp
 T97htA4G6I7gCl6vm6kz1qF3GQ7N1bMxb74QLenjij4uSXgk+xi/0Xi4s7dDtFJkG+uk
 7DaA==
X-Gm-Message-State: ACrzQf00ZD8SPnJTCE82EAj+zHMxaH+M6wOF1O8Wq9+LAzEySKl/MXeu
 /EIbZcCPdxDh6l1+kfP6tKY6kZNfI8pBhFSkQna5fgu1RQak1Wwm7urlhhV8mszvTsf6Bi41Aei
 3tu1AmmVPcQv7nqtpJDwRmRWPFqqJO3TijWz5pZ3moEyCtCHGnJ9+Jx7RLkkB
X-Received: by 2002:adf:c082:0:b0:236:d057:3fff with SMTP id
 d2-20020adfc082000000b00236d0573fffmr9822528wrf.206.1667405366484; 
 Wed, 02 Nov 2022 09:09:26 -0700 (PDT)
X-Received: by 2002:adf:c082:0:b0:236:d057:3fff with SMTP id
 d2-20020adfc082000000b00236d0573fffmr9822483wrf.206.1667405366021; 
 Wed, 02 Nov 2022 09:09:26 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 cy2-20020a056000400200b0022afedf3c87sm13410422wrb.105.2022.11.02.09.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:25 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v2 23/82] acpi: fadt: support revision 6.0 of the ACPI
 specification
Message-ID: <20221102160336.616599-24-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tHvbqTA4zPId

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

