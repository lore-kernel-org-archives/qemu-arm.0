Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5081566lfp;
        Tue, 5 Oct 2021 09:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPfC9h+AX+KZKyZlzINSzgOkenl6QoZz5MDnVQVyRcYCXIj6zrCxCNgSritHLXazRtDdKI
X-Received: by 2002:a67:df16:: with SMTP id s22mr19461328vsk.47.1633451942345;
        Tue, 05 Oct 2021 09:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633451942; cv=none;
        d=google.com; s=arc-20160816;
        b=yll0JIU9gu+FxZLhNjLUMQ3x8hxFajJ152kMb/I+mykPYiuKQVfAvWBA7XbSRuS2tc
         ++isaTqfrBTB7S6TVH5bhTTiV1dAFCyk+xnzbraE9+2NDPPccZb/jylkz1XzLyQv37Vw
         hp0+v/LW0bVzzmXv57t7ZqpwLNaGG4sT8lK1nPhu3ZgUtA+r/OHea4yMdkThNeKbAPex
         rEyUn6Z9tq4LC5/SraCrTu4zqpNKElbO8yGy1aefIfq+4CKXsXOp0ZW0UPa0Jj281Xu/
         LJDCjRiimE0z0sLyUSddr+NDsaoARFxmmrQHgH1sGcdLva7kegFLRo/vVvZsL6liFLuT
         qvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=R4wGL6P6mQ8b+hHluivUshpdu4ZjMd9sQXmFz3Odljs=;
        b=JPKcpbpLfQUJjm/Ud/WIi8okLQS1f3AySkSel3jFXxbcKvGARiWAmglQ1PcV/XosjW
         kdOBB5fNRKjamRyZPTuUfMXnBll+5rDFQb3Qzmhgn5IMJsENTeZTyK/IIFkjsSSBfhBG
         oYeVrRG9yM/4tzhcJVp/uslHffhk5bwttYX6rW0sxByuEsY7IAMFGzLulZfzbmT2JoBJ
         S7b244fTNrPEor95msrK/WagbRzq3IpfMT+eeUuizuyR2BcsDQ7YUMaFOWou+46JnvE6
         6vYc/gc99tiuwZcVleQOiZ1HbodDduKhMVvpfPrvSV8bFcnmsVDU22C8pF0sJVHzxbhk
         OOIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OMXVDK+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si9891793vsh.275.2021.10.05.09.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 09:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OMXVDK+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXnT3-0007bL-NV
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 12:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv5-00020p-FJ
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv3-0006rQ-Tb
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R4wGL6P6mQ8b+hHluivUshpdu4ZjMd9sQXmFz3Odljs=;
 b=OMXVDK+R4JeTtFDJIbFIsqZ4RAqbp+RcXl4MvfyQnXvmrzcKlyvCChwiq72dFW1n3GD7rV
 mgSqdmbbovd9Ca9X2YADOb6ERMUYTJ2vScLKGtiYt+kGUg/v7dUzaqaZ22dUAehUSFVAYH
 AOgxRFzlGOm9A/2hmA/6qJthhoaqSg4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-1IVr8YNAOBmdo2yyeDJtbA-1; Tue, 05 Oct 2021 12:03:51 -0400
X-MC-Unique: 1IVr8YNAOBmdo2yyeDJtbA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z194-20020a1c7ecb000000b0030b7ccea080so1489227wmc.8
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 09:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R4wGL6P6mQ8b+hHluivUshpdu4ZjMd9sQXmFz3Odljs=;
 b=kMGxsZqqil6qmENH+YwynItb8ToBSFNo5hXYHNWvb0Ru3IwnMNPPxgTYzozFLe7nVB
 B4IxU4pW8ppOHCW0LtdBoDa5vvCTHOhcb4+UN/A+4dy05NnBqQ5hs9mmR8BPkM1VHsud
 7v08L3yVDUxx4Tsl4Ing4j2u+EjVVOwWTDUtUtR5IYrEHOd9eS2tNFQpSX264uVwTjET
 t2pMjSIPRum1rSEEx0Fhi8L1oJbRBCvmkBZ6uqEqdcL+T/dz2uj3fjyyOmCgB0LGnv7d
 lDNczrBrZrencZ/mAl2+TeZB7gQj4Zp6IqDrkGv08syZO2ZG8qR7O57BgoqaHj4jpJI8
 rbrQ==
X-Gm-Message-State: AOAM5307pwmgHys2k2T2BVlG3pZ9JYrL0Aa7jA3KvgyCa2AbjgViIxUK
 cAvgufXfW2Dm5p4p419wlQsEbEc6WwNgthQgMO7DC7RO7t5LjvbVQ/1CG4TWQKmUzqbIltG59Fy
 AQZEyaLFOXcTP
X-Received: by 2002:adf:bc48:: with SMTP id a8mr2437554wrh.19.1633449830696;
 Tue, 05 Oct 2021 09:03:50 -0700 (PDT)
X-Received: by 2002:adf:bc48:: with SMTP id a8mr2437528wrh.19.1633449830530;
 Tue, 05 Oct 2021 09:03:50 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t15sm8836412wru.6.2021.10.05.09.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:49 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/57] acpi: arm: virt: build_dsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-42-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILIVF+hCfdwB

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-28-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST

