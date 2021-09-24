Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1193919lfp;
        Fri, 24 Sep 2021 06:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjZfkrOLc/gKfuGi8zYUCNyLxnAei06W44daNuLIFWUOTTSfmO2bnkF6azsjZK/PhBms98
X-Received: by 2002:a05:6512:3b23:: with SMTP id f35mr9143670lfv.423.1632488660441;
        Fri, 24 Sep 2021 06:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632488660; cv=none;
        d=google.com; s=arc-20160816;
        b=nipLVG6oPinPy5YRsJ9qIBmNzR+EbxRUih64NKnd0uGh+HU2grtqxbXCb4SqU7DK3K
         YEx3tC0ZGGPnBC2ehsJF4HXBvj85JZqDWnZ7BrxLc3cFybkgg8hgYm1XHSIzbDMnI8J6
         Lg0m+fgXO8v6IFnzqPaHIQ2J2z/KfasYWgEbcOk7FNx2UGO48T7RKSYmgCF/Ig4GqrEf
         o6hCPuVxGijMp9ik4TJ9Dk+4pOGuExvvno2BwwuXcoWoAT399K2XB8w3CP92cZ84XXsh
         uwUz/icMHXUqTjKiAlvxznl3k0JyUIKSv3Gjqczb5VVH734E8XjOjOToM0Ba6oH/lIxG
         6zUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2+lAgKL9E0cCrf8Ex2UggvQQsfT8jZHki+ly6R/hC1g=;
        b=fvEYpP92Ebnrs5iN9zCD6+wah/ETF2hGUl1PnAvOl9fbWBRclhcLXra83bwOEDPZS7
         laqy+cqUAwhJby4htkA2pOprZdqJEKhhjIneaNf7Cu3Sjh1S9wHuKJ9QEzih2xZ/LzMZ
         z9xBHqiBPEpTDKEtHT5aPsKHIlsm1krZ8KXuOu+byXZLc9xpfk0SWIVYq71RKraZm7HZ
         PDll69M1jVDh33jJ6yVTBh1tW010wHMgZvINx65np9JE6m6EZ6N7am1LPptJq5+RmdGp
         EdtuPUvHjsq01BtWPgmaPlFHm/Ip8wFsAUWwMIUtQgagFkxvPdFxC/n6k9jzOym2UDF2
         0hgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c0Y3iNM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e29si9769423ejl.320.2021.09.24.06.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 06:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c0Y3iNM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTksF-0000z2-Fy
	for alex.bennee@linaro.org; Fri, 24 Sep 2021 09:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkL7-0006wG-H6
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 08:30:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkL6-0001iB-0I
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 08:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+lAgKL9E0cCrf8Ex2UggvQQsfT8jZHki+ly6R/hC1g=;
 b=c0Y3iNM0dX+U1RVFl/L8hAxi/l53ejE5v4mc6cg0z29lOTJLKTrKY65Tf1qUAYVyZsdTx7
 4Zh8J/T6ZNp3j1vc3hqQXwm8aF0Ouhv3vn0MbZFLvoFn8XBZ4xhEvAosj+nQ1NJVa3FayK
 uyP4XNDnCtN5jSh37HnNwwsJdYAzlFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-Hg-59thuMAqRroHpni_8nw-1; Fri, 24 Sep 2021 08:30:01 -0400
X-MC-Unique: Hg-59thuMAqRroHpni_8nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B05C11084681;
 Fri, 24 Sep 2021 12:30:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 204CA62465;
 Fri, 24 Sep 2021 12:29:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/35] acpi: arm: virt: build_dsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:54 -0400
Message-Id: <20210924122802.1455362-28-imammedo@redhat.com>
In-Reply-To: <20210924122802.1455362-1-imammedo@redhat.com>
References: <20210924122802.1455362-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 ani@anisinha.ca
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qXXw0aIpIoJH

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
---
 hw/arm/virt-acpi-build.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a9a78d904a..4b9687439d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -729,10 +729,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
+    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
+    acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
-    /* Reserve space for header */
-    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
 
     /* When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
      * While UEFI can use libfdt to disable the RTC device node in the DTB that
@@ -779,12 +780,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
-    /* copy AML table into ACPI tables blob and patch header there */
+    /* copy AML table into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
-                 vms->oem_table_id);
+
+    acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-- 
2.27.0

