Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp307229ejx;
        Wed, 2 Nov 2022 09:10:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55A7lz+RulKbodwGiyk+GYy66Is/eL6rWOA50ncilPmVXPzsFZQ3H3YbkZoigNZl0SEWHN
X-Received: by 2002:a2e:9ce:0:b0:277:a3d:6fa7 with SMTP id 197-20020a2e09ce000000b002770a3d6fa7mr9099255ljj.106.1667405432951;
        Wed, 02 Nov 2022 09:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667405432; cv=none;
        d=google.com; s=arc-20160816;
        b=dLT+Sm9OBv4BUkxPnqeAFX6OXFE/EZ2njlw+5RuS3AOAPDb9pJ3X021Y5WsRu0N1GM
         EozISxSwgFenBxt47GfgV8hWFEyGUt/s11ThmXBsRC/DLlZpz15co92yau3g5l3pfcqS
         Atn4VJ0ws1ByCSdz4P9mxHA55VEhhY5HMi+f1anL8ydWx2DHP7iET1Tw3f2g+kgBh9FE
         A62FNWgIh4jDJ15ohxADBAzG2v4svNmhS5yU+LPEuEiFCoYsUeNz/Dilla1PABZ+9dye
         26aelOTm0WeKUeL4NPogpuXFzsmL27/0XCVoj3BW7HMb1CDMdddkovWstqXMOJ2VK/1F
         FCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
        b=sZK9aH1h49OiPJEsp/y3KoBJbMDyuKUMt+6N+n7sew7zgVLP+uMeLfkmJBsdC62Vh8
         MkcHjSQ2hR2qr2ARhF2YSPMhOZh6wd+a1P473JbFPZkY+qRs9b7jJxe33V5E8RxsKDXk
         5SNFJMc2W2hMdgIUYaoXBVZ/x23yjcw2ZSyp0sUTLgzOlWA/RbHHDOpAbvZ2R0Aia9al
         09yXND1d3FJDN/h54UWcDUggHaNwmNrj0lre0CvVc9aIRDh+aS4fqcB4srH3UQPmBczK
         sAbhPsMd30xT9OiG6DOH+9ofAJEGhHABmfsF+FkjEdA9NmAOdO/TEAE5xYUXF64QntzA
         8OSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5sO72Ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn30-20020a05651c179e00b0026f6dfa7c7dsi10827602ljb.368.2022.11.02.09.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Nov 2022 09:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5sO72Ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oqGJF-0004JA-Af; Wed, 02 Nov 2022 12:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJ5-0003if-KV
 for qemu-arm@nongnu.org; Wed, 02 Nov 2022 12:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJ2-0002S5-3V
 for qemu-arm@nongnu.org; Wed, 02 Nov 2022 12:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=N5sO72Ahj9jvgZbVytgxz45uPw3jYWwOyzG5o1dumRszcbqJqupH+KSCyTopKkqnCsfgxP
 7HrpDs3GvnudPWUwSgZOMyWJtCUq/Mx8TQ82e6m65HTuKASbCyQnvzhwRb0kB7xxyzPABa
 u/ZVdm9cMxpoe09GGuRjNN7W3dnH3zQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-34pajpMOOAKpMKvT8GlMjg-1; Wed, 02 Nov 2022 12:09:30 -0400
X-MC-Unique: 34pajpMOOAKpMKvT8GlMjg-1
Received: by mail-wr1-f72.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso4977402wrb.2
 for <qemu-arm@nongnu.org>; Wed, 02 Nov 2022 09:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=suQ/bY7KG6FVIUTVuCxTjRBKHp1Npkes4VAZZwG0RfdlkXkuPnUjuk1BunQnMd3Hrv
 67KCjQb02yTZ9dfmwKWYQR+pXRvM1tbWZxF2xTZSIy9gmiXeqPII+gQ3ayInt08UOkxi
 gOe60v0MVI7XzhVh3mBbyu/U8XubA1/90ahthN87/Fo1ciTBz05aM9u9Yh6snC+vLXsE
 aQtgLpxs+KFIYbxwHEVtz0NLoojrndPcxuegVkycq5VifUOmId258CJUCar+jTiqFyh9
 f4ltKxHGUheoJOsZh4qUpfJ4WfO8C7tRHaktgXzXfaBz4G8VwOg/UkHK9K/gPc3o0SIw
 YClA==
X-Gm-Message-State: ACrzQf3ObWRw3J0zYXUEeixwBRPVFl6F/44qVQ0CulZj4+pmRnN1E0WX
 ipIcKOFQ3ToJt5erZtzKRLyemN1Ye17nHHJTTat90/UZzS8wE5UxZbwkhz/9NkpeiXyPimvmXZc
 g79G5MV7E5klr
X-Received: by 2002:a7b:cd07:0:b0:3cf:71b7:7a32 with SMTP id
 f7-20020a7bcd07000000b003cf71b77a32mr10943144wmj.202.1667405369153; 
 Wed, 02 Nov 2022 09:09:29 -0700 (PDT)
X-Received: by 2002:a7b:cd07:0:b0:3cf:71b7:7a32 with SMTP id
 f7-20020a7bcd07000000b003cf71b77a32mr10943128wmj.202.1667405368921; 
 Wed, 02 Nov 2022 09:09:28 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t12-20020a7bc3cc000000b003cf66a2d433sm2374176wmj.33.2022.11.02.09.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:28 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL v2 24/82] acpi: arm/virt: madt: bump to revision 4 accordingly
 to ACPI 6.0 Errata A
Message-ID: <20221102160336.616599-25-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ezGMms7cI9k3

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

