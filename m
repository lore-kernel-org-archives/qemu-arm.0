Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp947081ejc;
        Mon, 31 Oct 2022 05:58:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uQPkybA3cgzS/qPa61pp6VQjzW8dhrW5N6OG9nIH25+mVWMVI7H7K0Q8xx8F8yJJV6Egl
X-Received: by 2002:a05:620a:4482:b0:6ee:e6f8:c5a6 with SMTP id x2-20020a05620a448200b006eee6f8c5a6mr8878362qkp.275.1667221081464;
        Mon, 31 Oct 2022 05:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667221081; cv=none;
        d=google.com; s=arc-20160816;
        b=wDN4GxT0EkmIHAwXtOy02YrQdutiX2HIlXQcN/ONgXArVP6PEbzsbnpc2Zp05DQRT7
         0mMcIyDgzgDgtUO5vfmlmirIHAArZ74e8TeXOPgvtzKwruhfxQmGnC5riAKA1/b3Cx8h
         LyNFZAfdMNzKTbzu2tsOl5thLMa0pk8lkF3s7/yITmCa/8BEJpbc8DvbeiHrfpklUNBX
         taKYEL3MFf9DmbcLr70UdqQv08toFd37i/SvPNKnpeikdCM9OfySMDPEfguWXD6V3fr9
         PmnteocdY0h7iGjfRoK8HnKGJKLQ/Vkah5VvGHoppez6AwsYWX/b5iMLpqwwZjsN2XEe
         iLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
        b=zDkUAPojyBNhbQlRT9UHDB1ddsM9t1FMJC8x08fxzijX4do5S0x0akjRhQ5dj2jtPI
         hcxTto5//99t4RvfvGggHLlYux2juG5RCPkOjlnnNxH+RasQm0ryMv2ZNCvOJPQe3peX
         2mnyNBJEZVGz3arwTLRJl/OCkLJ/Mr92oqOYm4PWMpd4F2m320inmzml/zg595wpRkzz
         duJ3QBeX8cOtKfutXERa04DxId8XKvW9oSb7PXkBQIL3o3tmpe1d/hDYv7ygtSZv7ntu
         6of1L5YQcfoBfZij8JKDUzmqJDQ78PHRdKRIM//meQxPUhN/olSzD0+ZtCjbM9QI2qJ3
         CVBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V4Xl81Ps;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020ad45bc7000000b004bbab456c1dsi1747601qvt.124.2022.10.31.05.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V4Xl81Ps;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opUHa-0005ft-Ox; Mon, 31 Oct 2022 08:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUH3-0002eb-VY
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGn-0002XF-6l
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=V4Xl81PsWLnioSJrm4TQya/VkPmZhG6BVDPCIBPyWvPYtLFkbJLDJYTHVEfQ+qTdj/drDP
 3Q3MAspnDEb0NgDbXXGtDBOabXlTabs+nRJrAgj1Opkj+XQmpQl0FY0g6A/CzKC58NaPEu
 sgQcjc7G4H25vK08rEUf5Vuyq0e/0fc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135--dJF3eArNwGcmrAGX63pjg-1; Mon, 31 Oct 2022 08:51:56 -0400
X-MC-Unique: -dJF3eArNwGcmrAGX63pjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so2581152wmg.0
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDPHfFPBmUiBzVFQbV+4l1hgXmVtWz7Ck3nwksImP0A=;
 b=2vdq1NP1xQp9zFNtiK5flvsNpHDJmPCp79OPOc4a7RahrLBT0lbrGcVI4lBliYqEAw
 s1oZjH6hQQCd98tdb84aMtUa3YhR+95VW9N9iu+K4izgkSoLAv7yp+xV6RIgbDvPLZom
 Is0d8R6O1LDJFRtSXTl6wmmxBrFDZeMsOLJIsgY77e03OB5spOWNy/6Sw5eymaA6044M
 0pVSYU2kUsB1/DVMKCf2fQcgxCxoAl85e/GLJE+5JTUXBf81OrOlkO67Ih4m1wv8uYAq
 mzfxrCaDrH5NEAiVedF7HvPXCNNKtuKsEJvfel9LhHxAaiTJaZa9LRhkRy0qYbFJ5WmW
 bGAA==
X-Gm-Message-State: ACrzQf2BFMCWjgKVj5HVhbOQS0Rs9MimaZx1rN3xVQV4DDB/qkGEbBYW
 J3NDRO31j7FQEddAQ/Z180+5AZqDPhrwGfKTDpYy/wncYFbWxdq2cXMDCp+XXqrqsa8oxyWnudD
 L+3wgLzgPjyf/
X-Received: by 2002:a05:600c:154a:b0:3c9:f0df:1cc with SMTP id
 f10-20020a05600c154a00b003c9f0df01ccmr18050054wmg.200.1667220715121; 
 Mon, 31 Oct 2022 05:51:55 -0700 (PDT)
X-Received: by 2002:a05:600c:154a:b0:3c9:f0df:1cc with SMTP id
 f10-20020a05600c154a00b003c9f0df01ccmr18050034wmg.200.1667220714853; 
 Mon, 31 Oct 2022 05:51:54 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 p16-20020adff210000000b0022ac672654dsm7083450wro.58.2022.10.31.05.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:54 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 24/86] acpi: fadt: support revision 6.0 of the ACPI
 specification
Message-ID: <20221031124928.128475-25-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: +EwnYc4Bunen

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

