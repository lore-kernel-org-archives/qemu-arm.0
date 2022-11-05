Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1672477ejx;
        Sat, 5 Nov 2022 10:25:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77J9+D4RVzo/mEx5eZwUG0owGRbMBpCDm3aBmb3MfN06TT/vjiJnLTfR0xOjdrw5jPhKVO
X-Received: by 2002:a05:620a:28ce:b0:6cf:933c:40d3 with SMTP id l14-20020a05620a28ce00b006cf933c40d3mr29297040qkp.258.1667669116592;
        Sat, 05 Nov 2022 10:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667669116; cv=none;
        d=google.com; s=arc-20160816;
        b=aFW2O1hDgDt8tasfHEcETIEOSvg8+FoFyG+ZqL99X72/ZwpxQb830AFs0tkB8pD4Ds
         REkJNqrn2kiDlu22aZZsBXJw0IPSYfX01UXI2beY7J6A+sZFA2vk+4zcHN8PCzdC6jIq
         fcI4Mloz+W36qcrOCXYYhJqL+tZ0PDXL4hNxSgthbfA/Mr6y/S9+tYxHvY5/qODZYGzZ
         SSQh3J2uqo2O5JNwwVqKS7BrTjs4VSM9uHFFPblcEzqUaSXnh7Jo9d8oIij+o7MU1Nqn
         yJdXaQ9vXb6zuoPvk4irXTJvlwGkNNqpYd1ZBYWSXbsJfYAm/p4JumYP++fn2TM/wJKn
         lJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
        b=E38mcvapVhC4f0fC8U9dtCyY36JwkqYfASA4DKkTLdzQHkutOa2fK1Yf8kCF6QJffB
         hLV64vFObnN6OzvclBvMOt2zyszTFCN9eBjQkvPY+LeWjCDv89y9Y/7LxDcAnLWxePBr
         aa2cbFTevqrReqTmxNMgxG4Yh7D6EprYrPzqRQ8FJgQ+cZBvZ4e/fvzgv5DLh6x75sfb
         Fd8k17SPnvYN169GSd9M9bhDllAiLobDt18VYt8X9D2kbmuVjkzKtYqiDSjHcPi3swWN
         nopCW6Dtv/ZA9CVETXQQGXOqEmTFaTUb0MtmK9Q+/Dft8Sw/pDSe3qA0MjIe8WNuxKr3
         VWCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N8oN+BFo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu10-20020a056214260a00b004bc06573e81si1348429qvb.170.2022.11.05.10.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Nov 2022 10:25:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N8oN+BFo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMoP-0007Qe-9C; Sat, 05 Nov 2022 13:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmo-0006f0-14
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmm-0007NV-DU
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=N8oN+BFoE16pmEw5F9YaM+kh05ToEvRIpDD/Sc9iUWW8rwh2b4KZtz+khNqfIgfz07qlHC
 P83ZkCvjuIaHoOv1PI8LQS6X2FGW2MH3Dm7evlgM6v+zNMwcowVtEVAASBWrY95fjTfDcS
 tBF+Ecje8/7I0hmIynnEywHOCl6RDR4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-_FjjKZQJOaKqj-bqDdnYfw-1; Sat, 05 Nov 2022 13:16:39 -0400
X-MC-Unique: _FjjKZQJOaKqj-bqDdnYfw-1
Received: by mail-wm1-f69.google.com with SMTP id
 f62-20020a1c3841000000b003cf6d9aacbbso3828944wma.8
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=emSOowH0SgWk37no1Xx5tQTxbB6++pM1iqjlIeopPZoz4LJ3MkSbxGl+ndDWg2G3b7
 e2VvHDzxF5A58Un9Iz2+f2qGnX1PWXN4Yn6/Xk5DkET2ie5bE8z+vDVXysvmOTaxdt3z
 eDpQp9tjTvkxUh9Hs0wzKsk7YX6mLmmQ7UttEnYsc6Mrpf0hisa7Oc7b+W+m2sEJeZtY
 RgNAKFYIVt150hLmcnv160UlZwXa48VYrN7Rbr+Giaj8hSNlzTJmi47D7BJmTHisXMjg
 DVLSVdGhN5BfAY56B2IVpF5kvJJv3kqWy5EhwD/lLWjc/C3RW469Ubc2VpwqZh2Ph7Q9
 /cnw==
X-Gm-Message-State: ACrzQf1NuQpDwq0spqO6mt06a+R9xa1j/KamKsCjWdLy9IEJGicAGOED
 rFssHwh8mAN7sP4UtPnTuRjwTN/7GwYuPfsUx+uiCQOPiqT0Qlog+sXq4wx9DO3Gx5XrThBMwWO
 yTauEOx1Ly+V3mokwBrJthkD0BQPP1EglbQTKiBE1C/2hu43rwXLTiNIwDl6V
X-Received: by 2002:adf:e9c8:0:b0:22e:3725:8acc with SMTP id
 l8-20020adfe9c8000000b0022e37258accmr389342wrn.330.1667668597696; 
 Sat, 05 Nov 2022 10:16:37 -0700 (PDT)
X-Received: by 2002:adf:e9c8:0:b0:22e:3725:8acc with SMTP id
 l8-20020adfe9c8000000b0022e37258accmr389334wrn.330.1667668597375; 
 Sat, 05 Nov 2022 10:16:37 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c1d8400b003b497138093sm3012767wms.47.2022.11.05.10.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:36 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v3 23/81] acpi: fadt: support revision 6.0 of the ACPI
 specification
Message-ID: <20221105171116.432921-24-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
X-TUID: KyKPlx1cMTmD

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

