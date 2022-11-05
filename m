Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1674344ejx;
        Sat, 5 Nov 2022 10:28:47 -0700 (PDT)
X-Google-Smtp-Source: AA0mqf7v1/5K+JhevRjn3hG93nFN/Ucg2pjIszyFFmL+DxFQVEpZANn0y53eB/vl8Ek9juTNYJRR
X-Received: by 2002:a05:622a:654:b0:3a5:8349:44a0 with SMTP id a20-20020a05622a065400b003a5834944a0mr253792qtb.70.1667669327410;
        Sat, 05 Nov 2022 10:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667669327; cv=none;
        d=google.com; s=arc-20160816;
        b=reAOWxP5616eZixn4c+YeiV/sBvyVNpEP0g9HJVCNARSKvwCA8/PCdkntbk6ryr7WH
         sWeFEHcLrhgRHtqpJjggIcgrStap1FPTtP1MQE9cS+1fkywePkpZluRc+m0845Yi7smR
         K1d8Cy49FAWsnDpaTvE79be4KBStcmBCxkQJjakjZUhVPdcx4ZzBU3hrhevxwdjhCXh0
         hH1TuTzOYu6rF0KxFXChFr7GAz4R4+e6mUqmmLFRh8eD+jSirDlEJuiMmqKxAez7yrbP
         1DTexJFrD3qeAUm/6qtPZPhGRxf4KhhAsFLTyds4FjFZ65Ou1sZ3BRRvJ1MU/31m5sTs
         9hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
        b=EqsGC44HRbDoCKpxcS8+O/4OUQ3lwA8G1ugy51NquVXAFTc73WXnntv2Va0B/ki4Mp
         uLU1jltUvQ0MJ/PS3F0SS+uSUdnwTe5vS/611wfrm8FahS14Vp2uEgyp66H6DiekQqeL
         SO0EeY6vZs1uVgRDxw3rDtPKJhtnVuc0Afucsr5NPZs6B3NQ1txHrt+QvAo0imMWMZgp
         yDQEEXTDycq8NkU9jvkTSJmgyMtJdtBQ9BMGqCn/8nNyBACmp3HLJ6X+OmqyEEVidZ19
         quBfr+YhqgUFS7Coz7eMl9RnZWVtgo9/6580XZd1qVxPjG38CmTB5VjSwa1TwJm8f60A
         xFow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e+rxjg3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj27-20020a05622a259b00b003a51d7d02aesi1702584qtb.13.2022.11.05.10.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Nov 2022 10:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e+rxjg3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1orMoS-0007V5-6m; Sat, 05 Nov 2022 13:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmr-0006fC-67
 for qemu-arm@nongnu.org; Sat, 05 Nov 2022 13:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmm-0007NZ-Hk
 for qemu-arm@nongnu.org; Sat, 05 Nov 2022 13:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=e+rxjg3XrGraQU1C/p4qSKEo9LPT4TlzKIzTkw6TUIsbqzr1Pt587sPz7T0Jgjyd6d3eBp
 YsYGUtArm4uYQvMpfYcJoHJR9J+UiNybEZuE9VC5URHRy665qyOkJ4vugu2A+2jvSPrtv0
 JyfRWGEkoa24vgKDlNQ047yJGa2j9zc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-LHUS1NCXPfqcjJHjEFb4kQ-1; Sat, 05 Nov 2022 13:16:41 -0400
X-MC-Unique: LHUS1NCXPfqcjJHjEFb4kQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so5236907wmb.5
 for <qemu-arm@nongnu.org>; Sat, 05 Nov 2022 10:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=pQUZgxzSuGdHnqfxyyeQ4U3RxSCNzPjj6i2tN0PmtrOl5usCNsBO7t6x1UyNwJkZw3
 QVmeGckgAk/1jlm74ZZD77spgvbYXyfOTjK1eqg6ACxnk0mNlFHhOx0+KqlP33irdE93
 G2U52oUg+NT4T8qoZeQcLAaAuSR9IuLBCmNPhPGb38pDQyIeYsvGZgfwFXv8lmC3xQvc
 Z71fGggHO0JyZYyx1oUsk3KBXIel/SR/V9GFhbMHrrRV+yVz8oDVCWP2qFhrud10tJcG
 dQSALcqCgtM/4IYefpeoH9tZtdcFi63+FO1CtzLLInfi/XAacAHBl41PRNcPZKzMxVvi
 LvgA==
X-Gm-Message-State: ACrzQf024gndv+kopT5Qc2dmySXrZFxxHPOrUPtDq1ROSCm3haiFxgRq
 mqA+ugM9s6W5i8329JwJ5i2bM7Kum+/EVtapjHU8hZi2jEYaaoSKHjbSE4FstnHuNqt09DofczY
 1JEE6kfWO8v0C
X-Received: by 2002:a7b:ce02:0:b0:3c6:c796:1071 with SMTP id
 m2-20020a7bce02000000b003c6c7961071mr395466wmc.138.1667668600524; 
 Sat, 05 Nov 2022 10:16:40 -0700 (PDT)
X-Received: by 2002:a7b:ce02:0:b0:3c6:c796:1071 with SMTP id
 m2-20020a7bce02000000b003c6c7961071mr395461wmc.138.1667668600245; 
 Sat, 05 Nov 2022 10:16:40 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003a3170a7af9sm3118883wme.4.2022.11.05.10.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:39 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v3 24/81] acpi: arm/virt: madt: bump to revision 4 accordingly
 to ACPI 6.0 Errata A
Message-ID: <20221105171116.432921-25-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
X-TUID: tqT+kKJVkFgT

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

