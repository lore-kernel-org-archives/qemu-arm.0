Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3404334ejx;
        Mon, 7 Nov 2022 14:49:52 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4CGepHOcDAiGE8HEhyIvzQGSAWa3aMWsLttA+m1mXRpuTcl2CdbIkbygeCwa1W9G+Vd6OP
X-Received: by 2002:ac8:4e90:0:b0:3a5:7dd3:75e3 with SMTP id 16-20020ac84e90000000b003a57dd375e3mr9604698qtp.590.1667861392010;
        Mon, 07 Nov 2022 14:49:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667861392; cv=none;
        d=google.com; s=arc-20160816;
        b=auSVVhn8X5GC1ezofwFfk/gy5N6p0gE9QRV8qGgOqw330F0XWxOUhg2UyHNYxGT+Af
         FeW2OlJRG2YI206CHnJcIATe4oZI9AOrcPFt1bv1yuGaCrtJosUknpEkgoHD1LtbsRP8
         bXqFkh89gysbhUPlDUfxle8u61bomEwsKpVM9Beurf1xw6k6o2zW8N59HgfNx4An/fuv
         mDPg8PkacMxxO9T5BD4h7pzHrCGiGQ08SK0/DMX412mmV6TiDl/b41g6hQ5Tx5Tm/fjx
         KthfGN/jKNxmWgby/7MMiMKcnmA/axYRngFXiDHf6WmeccuGbdYFS3dm6Q0Q05pP5ZNX
         6o3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
        b=lgiEh5qrwtzfq2YL8Dm6XP0s8/bik+dE8bRrD9kTdv1dS/YbS/HjGmcfFF8ID+vD8b
         7ZpvAUaf96vnlCWnG+J07q67WuwYp/zSY0KIIyV4nG6c0Wd+L44kuWIvbsD8xc7IYxUZ
         c+QU5Gn+SDpSgxoHmU3ZbKyiI4ry1U1C4zgRFp+27Ydlm/ex/wHdjSzTgo08lIxYoJJH
         hSlXrBjlbYSLYrysCVA+nV33Nh1tujsGWY2IgqT3Ae2DQ8dDbLSScHrxH/xrT7+YKOMZ
         7K1ZCVnTkTWyBb/T45dKQMHLpmPoCtNu6/W3QdqxN+0BNV+5vvtELDIeyQM/m/1S1TPl
         xWDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdcC4AWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a37ea0d000000b006face8cfc0asi3263743qkj.603.2022.11.07.14.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 14:49:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdcC4AWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osAvf-0007Rn-MC; Mon, 07 Nov 2022 17:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAve-0007N3-4z
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 17:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvc-00023m-GU
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 17:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=hdcC4AWrjqvqVUO6B/2m4jXgyC/33j6iKRsj+CYVyMjryXOK2AyH12aBRHU7BeZC7Rpr8S
 m/ZsN2zODbipBq5zoBei/8zha950QWYanun1RMbq6sMqwIYqXunWF1gTapLaCejR7tiQ+E
 QmRI24j1BuVGv+GVtwmb7+BAvX3b3xw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-zoTVTzZKO-qSQ0kbMxbuMw-1; Mon, 07 Nov 2022 17:49:14 -0500
X-MC-Unique: zoTVTzZKO-qSQ0kbMxbuMw-1
Received: by mail-qt1-f200.google.com with SMTP id
 ew11-20020a05622a514b00b003a524196d31so9032716qtb.2
 for <qemu-arm@nongnu.org>; Mon, 07 Nov 2022 14:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=Hyae3+n1RW8oIEoZZqgem/dznlzyAcIdpFYxZtOdUwWkRRO3lwF8MAiZ7H/BwcYMfl
 UZdx60VALrahG41yOraeHP4OSlze9bNSiNpGQBhKtveakuj0PEU4sXnt6nRonwhp/QtU
 uKiWetuIQTZOnrwtaD2m15wpL44Ks3nwL4l+JB+hFbuhBsJ5Pjy6e89dD6hrQwMC5g/e
 Gt7BfHcrtq11Dx59D+TWOfRVd3nNV7vxpHWJQOEl8Y6bUCeHJNXVRulAoNDjiFdwRjwR
 9zUZaCEmyEwwTCQwwsQ4OlO3C+yHQmSHEjCSa0Fk3RAMzDGJJ6gXOhCa4FKyIHiW2VsQ
 VoPw==
X-Gm-Message-State: ACrzQf0MgdhblbpYUKUd6ek2ijSfZXSl1m1uZDowK4NEkrUvNPT580Ez
 p5n2S91MUyRL10SMBiGpEZXemQ8ptkRB/XiXfusY19MPuHVA0OogseQ4BdEB2X1sLOg8EUHWwcs
 b5ueo2Dpuquc3
X-Received: by 2002:a05:620a:2109:b0:6fa:75bb:c766 with SMTP id
 l9-20020a05620a210900b006fa75bbc766mr16907113qkl.369.1667861354207; 
 Mon, 07 Nov 2022 14:49:14 -0800 (PST)
X-Received: by 2002:a05:620a:2109:b0:6fa:75bb:c766 with SMTP id
 l9-20020a05620a210900b006fa75bbc766mr16907101qkl.369.1667861353954; 
 Mon, 07 Nov 2022 14:49:13 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05620a289300b006b949afa980sm7868738qkp.56.2022.11.07.14.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:13 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL v4 19/83] acpi: arm/virt: madt: bump to revision 4 accordingly
 to ACPI 6.0 Errata A
Message-ID: <20221107224600.934080-20-mst@redhat.com>
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
X-TUID: JTgn2c/WlRdK

From: Miguel Luis <miguel.luis@oracle.com>

MADT has been updated with the GIC Structures from ACPI 6.0 Errata A
and so MADT revision and GICC Structure must be updated also.

Fixes: 37f33084ed2e ("acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table")

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221011181730.10885-4-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e5377744f3..da9e41e72b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -685,7 +685,7 @@ build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 };
 
 /*
- * ACPI spec, Revision 5.1 Errata A
+ * ACPI spec, Revision 6.0 Errata A
  * 5.2.12 Multiple APIC Description Table (MADT)
  */
 static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
@@ -704,7 +704,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
-    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
     acpi_table_begin(&table, table_data);
@@ -739,7 +739,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         /* 5.2.12.14 GIC Structure */
         build_append_int_noprefix(table_data, 0xB, 1);  /* Type */
-        build_append_int_noprefix(table_data, 76, 1);   /* Length */
+        build_append_int_noprefix(table_data, 80, 1);   /* Length */
         build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
         build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
@@ -759,6 +759,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
         /* MPIDR */
         build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
+        /* Processor Power Efficiency Class */
+        build_append_int_noprefix(table_data, 0, 1);
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 3);
     }
 
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
@@ -770,12 +774,6 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
 
         if (its_class_name() && !vmc->no_its) {
-            /*
-             * FIXME: Structure is from Revision 6.0 where 'GIC Structure'
-             * has additional fields on top of implemented 5.1 Errata A,
-             * to make it consistent with v6.0 we need to bump everything
-             * to v6.0
-             */
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
-- 
MST

