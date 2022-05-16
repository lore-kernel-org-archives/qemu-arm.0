Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2247150lfj;
        Mon, 16 May 2022 13:52:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYVQkLDoEY/5mLDL93DwfOlr+O7DfFOQpd5vSN/k7Ve0PLWj/EkU4epEnGxEJ0K9Ut6D9a
X-Received: by 2002:a17:906:dc89:b0:6f4:d3a9:34ed with SMTP id cs9-20020a170906dc8900b006f4d3a934edmr16822557ejc.459.1652734361168;
        Mon, 16 May 2022 13:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652734361; cv=none;
        d=google.com; s=arc-20160816;
        b=nYc5Og6hqrpnNWzsmHYV1Zr1ysYkUyAJ++XEk1JLSoImSTHUSmKT6Xw0pRZbz5IAiT
         11vu7bZ38xGKqaysXDZOk33KX59wuod07/zmFr7vKV/3ouB1ma0zJkzfzawgGm2zmun0
         dBvMY+yLimxvAssqsZLa9IFSbUFKSldTSn7rzOsnmtH2wIEqfrFx4ZJR5WlhVVTnUdiE
         aj2t/eeD8Ank2Axw+oH0xjSUPtObttacSj8VMvWi4pDe4UP1/h2g8Bj3L8RZ9VkOm91B
         svc0/0BC8dDb9QwggfzjG+WoR2Eq+GdWnIrUuHIcVd1d23QufkAvhJbFDOg0QayIG2+N
         4U7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
        b=nfGXOghIXUu2K5WEcZWukPuEA32n+q7/ows0y5gvgprAad74K/Z+reCP/eu5S+4NBB
         ndhEaSheMRwqabeI4kV71J7PoCucvRt1o5tSS1v6QTHPxQPr77GJSYgAvvhHmm4Rlvan
         WQTUuMBuI4L8jsXnoFH3Te4CD1FqM2KrR6jEas8/3Q5Wj62q7MujP3/ezpdvKzUrqHd9
         rKC4OpOLFMkxx6HUxK+isCL1pkGo4dsLpQN0pKQ26RHVMwNWX85yk0JOz430eT+NZFRP
         ps2tq48u4Wjr7xCVwoHZJD73mniY9hWR3F7lnNbOeXBo1dgdZ7yMETycwLdLSleAAz1K
         TNtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GbKMBM2Y;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ka5-20020a170907990500b006f38efefa6dsi361881ejc.764.2022.05.16.13.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 May 2022 13:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GbKMBM2Y;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652734360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
	b=GbKMBM2YpGP0j2qJF0YIeh/vtW8qerts+mn0hHHYbageG2BnPCqgDDy2R47kF7UHC8awrD
	3gqMsEdLMuidODQrNedv5YqqG2XqwBDkWBByjTzjOhaBqCTqbw2uScpwYgjyuS0cfKobDB
	xNZxdfK69UMgKpGyI/sgGS6tnJbhD+g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-bfPV5MlxPYeRiIlVN9aSRA-1; Mon, 16 May 2022 16:52:28 -0400
X-MC-Unique: bfPV5MlxPYeRiIlVN9aSRA-1
Received: by mail-ed1-f70.google.com with SMTP id c17-20020a056402159100b0042ab2e56743so2402150edv.10
        for <alex.bennee@linaro.org>; Mon, 16 May 2022 13:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
        b=ill708ZqzurI5HADpA1IR0E4x2xPmuqEurK+UTIlUmd7iv5NBVkoRfvi4Lv1XF9fMC
         4MyQsNr1UcQIe5NzPI+BPkmyXtAfdx7KBcj++OfD9nOqq86LGy3EFtxQcsfrpfuBry3d
         Oc0qO7tTl3ApTWdGcCu1Zvmh2KrIEVQf7OjFzIr9Hh3kCmMAu1Tq/RlSKnuU6sxPOcA7
         nZ6Is63TwCWlh0gbIAJvWs9L9g2Qy5Ua5R9XwSJWhIjOR0vhnildLWi3WPnAgxMYQaKQ
         /cBpk+Hl9xPKWJk9Y8Cp6qq/aIixGoY66Ark2+C6hcfBS4yJmadGa0YHcgKpVWRFpGbH
         15xw==
X-Gm-Message-State: AOAM531Xgc6GgmA+7DslhpHBeUbqInDoDFvWGwCgV96SJZMNwQfUZGQd
	OSDWo3O/n8zMnL/DC6I7jxwHLxrO3UdDIH5VR92IcPDrlGpRw+I+cZ82qc9bpb86PUEZkjOqTxZ
	R3jg6AoPDUNg9ExiD
X-Received: by 2002:a17:906:d54b:b0:6f4:cea3:843b with SMTP id cr11-20020a170906d54b00b006f4cea3843bmr16374407ejc.40.1652734345383;
        Mon, 16 May 2022 13:52:25 -0700 (PDT)
X-Received: by 2002:a17:906:d54b:b0:6f4:cea3:843b with SMTP id cr11-20020a170906d54b00b006f4cea3843bmr16373576ejc.40.1652734329690;
        Mon, 16 May 2022 13:52:09 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.55.131.38])
        by smtp.gmail.com with ESMTPSA id ev6-20020a056402540600b0042aa5a74598sm3270999edb.52.2022.05.16.13.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 13:52:06 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PULL v2 31/86] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Message-ID: <20220516204913.542894-32-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: dfAK8YFD1Fu6

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This adds code to instantiate the slightly extended ACPI root port
description in DSDT as per the CXL 2.0 specification.

Basically a cut and paste job from the i386/pc code.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-30-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 20 +++++++++++++++++---
 hw/arm/Kconfig          |  1 +
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e7e162a00a..7c7316bc96 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -5,6 +5,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_host.h"
+#include "hw/acpi/cxl.h"
 
 static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
 {
@@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
         QLIST_FOREACH(bus, &bus->child, sibling) {
             uint8_t bus_num = pci_bus_num(bus);
             uint8_t numa_node = pci_bus_numa_node(bus);
+            bool is_cxl = pci_bus_is_cxl(bus);
 
             if (!pci_bus_is_root(bus)) {
                 continue;
@@ -154,8 +156,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             }
 
             dev = aml_device("PC%.02X", bus_num);
-            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
-            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            if (is_cxl) {
+                struct Aml *pkg = aml_package(2);
+                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
+                aml_append(pkg, aml_eisaid("PNP0A08"));
+                aml_append(pkg, aml_eisaid("PNP0A03"));
+                aml_append(dev, aml_name_decl("_CID", pkg));
+            } else {
+                aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+                aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            }
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Device")));
@@ -175,7 +185,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                             cfg->pio.base, 0, 0, 0);
             aml_append(dev, aml_name_decl("_CRS", crs));
 
-            acpi_dsdt_add_pci_osc(dev);
+            if (is_cxl) {
+                build_cxl_osc_method(dev);
+            } else {
+                acpi_dsdt_add_pci_osc(dev);
+            }
 
             aml_append(scope, dev);
         }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 97f3b38019..219262a8da 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_APEI
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
+    select ACPI_CXL
 
 config CHEETAH
     bool
-- 
MST
