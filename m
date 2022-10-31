Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp944140ejc;
        Mon, 31 Oct 2022 05:54:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4cZkgy+aixhawDFDLtX4wAK5pGHe22P9xI3/YrQMsS2BcUbjdt2yZjOHs0iZCfvH1dOjgT
X-Received: by 2002:a05:620a:4917:b0:6f8:6bb8:e909 with SMTP id ed23-20020a05620a491700b006f86bb8e909mr8776673qkb.49.1667220846897;
        Mon, 31 Oct 2022 05:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667220846; cv=none;
        d=google.com; s=arc-20160816;
        b=oBcR+dTWiqH+x4pO0ZHNrmg/KckOpZOycLTkn6FBKGaeePYpw2FKBfBxBDRq1ZFDA4
         p1kvrWfi7oox4VlI+i60pF9WOYPDEOhh41b4f52+BdiBRz/J5rbQKvpA3XGIGH6HSXzw
         dqe+7oT2gt7RsX5iALr0QnzE1aYI8inVPf0w/Pb8Kwt+gu+Xfups+CqqQU9lOPuNxtKK
         kW3L7ULQTBZ0QR+CqBqWBcESEQce1NSLqoFCvQe5kAk71vhutc3nvISrV0CAPhCkcCx9
         FL3/7t3KW0reZ6GHvvUoLa50QbMjYU6oJaixQOA6iukLGcFYvaAnIBSmLrDXiOJxXINh
         iZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
        b=y+RbT5Fo1xb1NpJyiga25Zg8lZR4gwAM9isfXxfkHgH7p8+3HLsXs0KUgVCTBlui/3
         t0ShuqsfKDEvr/2MVznD/1zG2sRkm3sJVQXnm7sGsOLUSSXiUvvB7Qvh1od26poi4yPe
         Unipb9xjMhY9V5Zif5VdEM3E/at+Py4WyUOqI8hzaF5ileEImw4TYRi9AeQSDtIyM637
         8sRqFaqk6amMsALddxbv1Ai7fPP0jmlsGjKbxCB5aS1Rt7qzwW/looUHABg09vBQpyqA
         Ems4en3OqldPSnNcNQVsPqIMdDDcCA2wY2+X+DBKjvGK3Arkkxd5pgqYTm1bU5vuzvfG
         xDvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZLWCcEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020ad45749000000b004bb69f057d4si3892220qvx.511.2022.10.31.05.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZLWCcEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opUHW-000533-3X; Mon, 31 Oct 2022 08:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUH5-0002en-B6
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGu-0002ZR-Iw
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=PZLWCcEQcCWS8ybH6lbPPNXrQmKpaqyqQNCr5YazVL9hTjduoEdfOE4IjpCS/srCoYSogY
 FjxthZM01rjzWoaanFNCbS1V/pPKffJS3bQJFVPHQVsiUoZ5JKee4E+SJrf+kOd0ekKaGg
 XEaqrqS4TWPc5mTpm0bN0kz5bjokmPo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-Hg2D3J6FN62qnvud_E0ADQ-1; Mon, 31 Oct 2022 08:51:59 -0400
X-MC-Unique: Hg2D3J6FN62qnvud_E0ADQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3046461wrg.21
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=kSko3WTZlcnORsPIAioHM0wvZZUukxaAPpQJBUbwXXE+U7FaIvFOPJhIqttuctTqD0
 cFGpFsjunvdao5OwqN9L85fFI/W3UryHvWPWLkXGJCyKmzy0caR471M7pKPYYUfvFWew
 ZeiOSZ6YxtyPZ6Z/jaaMd3gFHQYtK5LXWYAcT0t9L78JbnIDwCVsFEMDRwd9efjKDQUV
 PqwlXVAjzD6SooJF2yr8jG7hhv8vHbCQxIHwELMtioPjZlKRXNpHMDBi63AULS6uyujf
 PqdwsKhEvBFSg89vQw7LvqT7Hfi24sZSomQAMFtFKgUKn/ljp1WFR0dU1e7RdAKVaqyn
 VNMw==
X-Gm-Message-State: ACrzQf3c+bELuiPXi24QVNg9tLN28+5LOoRjiffZXDJHuJ3sBD739znv
 FK/5S4GhbKO8yLYR+yGklz9ptmU8uAMTx+IFvf1MbHZEz/9XtPZu9GF0+xshCuuRwiGqDDukVpR
 ZwuQZzEmJV6/P
X-Received: by 2002:a05:600c:28ce:b0:3cf:6e78:e335 with SMTP id
 h14-20020a05600c28ce00b003cf6e78e335mr4033219wmd.142.1667220718056; 
 Mon, 31 Oct 2022 05:51:58 -0700 (PDT)
X-Received: by 2002:a05:600c:28ce:b0:3cf:6e78:e335 with SMTP id
 h14-20020a05600c28ce00b003cf6e78e335mr4033204wmd.142.1667220717817; 
 Mon, 31 Oct 2022 05:51:57 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 a15-20020a5d53cf000000b0023682011c1dsm7087511wrw.104.2022.10.31.05.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:57 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 25/86] acpi: arm/virt: madt: bump to revision 4 accordingly to
 ACPI 6.0 Errata A
Message-ID: <20221031124928.128475-26-mst@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: lS4PClt6Um8S

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

