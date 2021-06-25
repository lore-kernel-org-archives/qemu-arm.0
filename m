Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1342511lfg;
        Fri, 25 Jun 2021 02:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ54Vu+ihti9mqpbHLjYtW/m+Y7hV7cwK5Y+bjoIMvke2vKHTlp2JJv9JzESu118R4oejK
X-Received: by 2002:a05:6214:1932:: with SMTP id es18mr10047630qvb.17.1624614283681;
        Fri, 25 Jun 2021 02:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624614283; cv=none;
        d=google.com; s=arc-20160816;
        b=hBlb8rOmLVRJ5vJDExdMLyx4j8x6hsj9AuAilJiMmEQoZrgASZFUBSO5kGWQIB7UES
         ZamtsIs3cjdGnxM5bPuTuJ5/jzKRQ5wiWkuy2b5xqQJOR4X3vJweR4DUmH2iRQpDoNgS
         zNmk/smzIQlyXWuBjjpHBgHqUFYm95vnUk5+Kya503YjG8H5F5tLsq2ES0uiZIS8FaR9
         q1RAHV+tDY4sB5wjfln25sEvdq+EP00RW5ifKVDc4XvR6zLihlLp53HRci+Nw0kxlkVj
         8l2XbeNvvnqneVh3P1I8J958fZFiYHuM2fwOeHe1kWM0iOofiHJ7II60ZAjah7o75DzA
         LFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PyFoqAxAksvg/lZ6BFl1E0IaFWv6cM4OdKkcW5w+dFE=;
        b=TY6MJELCLHhIC/P8xHjr3sKZ9aU/AaQ/9DcwUtz1Bc8IhUteVY3wqxtkD99wuWco+2
         28AX/zuEhER/lOzBCS/m69KblCZC+j9f7olj8tVI2jvu9WRGFAvf+ovSi9J9DCcl5pNI
         XekxPM4M71NpJqz+wMlvkQXq+LG28drpZUtKHU7ITkoIhqQFnnCYEj/ggPqvyrjVbitg
         sjcUOhNbOipvrUvp9Sh3XCAb0kBFFJplniufUbG+jGFR+5Z7p1H5oO0Qw1cwXDamK9Wq
         JYQdKe/THfObxVFclKFCfapFa5kWac146n4igOaQfEsBzzFJYA72yqxCXmdwJcKILJrn
         cnPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="FM/bGLqG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si4656729qta.18.2021.06.25.02.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 02:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="FM/bGLqG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwiOB-000604-0I
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 05:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0F-0003wZ-Hr
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi09-0007M3-Uk
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PyFoqAxAksvg/lZ6BFl1E0IaFWv6cM4OdKkcW5w+dFE=;
 b=FM/bGLqGAApdtZRkOdB9sKR/92CzBrx+TmCIW+tLHiFN5QwBHrbHFBSBGsCkqs2J9l/D69
 2Hfq7yiMJzeWsgLuR2wjA3RrYDcWFqBuHyTB1HqSqhsH1mxjA9RVWkJzjHcHXPVk0+1+kK
 iEWc8ai+Kf8pHmkg5M6YBjxfvE8qlHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-l7c_3c0gNWqxf92dv4lQ0g-1; Fri, 25 Jun 2021 05:19:51 -0400
X-MC-Unique: l7c_3c0gNWqxf92dv4lQ0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D4A80430A;
 Fri, 25 Jun 2021 09:19:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0162460C05;
 Fri, 25 Jun 2021 09:19:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 45/53] acpi: arm: virt: build_dsdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Fri, 25 Jun 2021 05:18:10 -0400
Message-Id: <20210625091818.1047980-47-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +tEH7kKfqzXK

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
---
 hw/arm/virt-acpi-build.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index dd8011a670..d15e67a39b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -636,10 +636,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
+    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
+    acpi_init_table(&table, table_data);
     dsdt = init_aml_allocator();
-    /* Reserve space for header */
-    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
 
     /* When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
      * While UEFI can use libfdt to disable the RTC device node in the DTB that
@@ -686,12 +687,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
-    /* copy AML table into ACPI tables blob and patch header there */
+    /* copy AML table into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
-                 vms->oem_table_id);
+
+    acpi_table_composed(linker, &table);
     free_aml_allocator();
 }
 
-- 
2.27.0

