Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1894119lfj;
        Mon, 16 May 2022 03:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdchvOR2arK5IGxp9eXZxZxblCEfE/1h2BftZHdRy+TFnEyhDSyNAVwN5qsiG1kJHmYJe0
X-Received: by 2002:a17:906:9743:b0:6d8:632a:a42d with SMTP id o3-20020a170906974300b006d8632aa42dmr14611428ejy.157.1652697452168;
        Mon, 16 May 2022 03:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652697452; cv=none;
        d=google.com; s=arc-20160816;
        b=g9FTNxLvr1AmhZVFjO+6GRrndk7QzQOVfNODBbIYNstPGmJCEEuXPgKYYhyQX9/O+g
         oq3Xt+sBljXXt2S1R6Y48i47QQGwpDXbEk3o5TA0KcX07EzzR+KiIkaNLS/C6gZD8IWD
         E5X2g6HFXomc4T1ncFyKE3wPCCCIjiX2PxtSmBq0cZh21DtYfbUUvOm7hsCOiVqHpHC+
         qgogx1Nd1hH6wkfuCEDVdNMWDw/mU5pOPbiz9CVRuWxmvOAY61I0B+n4mEAE+wd6TCWR
         2XBrsldUrDKqBo7qre5yNb+PNyUU9h9m9daqHfS2Th83uyqHoXEvC12QTo51KxSDlqP8
         6BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
        b=VTMdprLeu9GPBQbsqyeNvP+PdjmshEjKBLJ4AsEFFjV0hZKF/wvFnYiAM0qstgCnpQ
         McYfoA1mgXrvJVFMgZ/Ay5vo0Orpn6MUW5wEyx5emz+c7yaELNU12+hfRW9mq35KfBcb
         SuAvjSSn8XJ+kC7gwC/c3SaQSeBbb+0T4sDk3gaqq+6Qcanvq7NMGWzjoDIqZ3H/Wh70
         3I9odKACLQISj3APjlds5/5L6buU7Ng9ToNAf5bdIr8ibV50povI0tlCZ+yIk6MoU8pY
         bmsSuzabZqTOU4PZN6p3eXJgailb+f1tN2LV+k4rBCfynH41bRj8yQFebiQdOzp3J+UC
         d9xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="b/akkovG";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y26-20020a50e61a000000b0041d763065f4si9312651edm.484.2022.05.16.03.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 May 2022 03:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="b/akkovG";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652697451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
	b=b/akkovGRNTEvLQRVPWntm2VixACIwrTERzh/FBKbLQNsfb6+6U91T1zGymrgCqI0YXWwO
	y8d7Y79Dy9APlva9mu4KO8ezbAPotW1kJHx0oV228HDyNgW9b9BHSApLp9+RZzq/zHR9xV
	CHQ4lePWgmR2uIi3pUkaCyghZbJig2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-zBAa-44ZNI67S9g5dbXpxw-1; Mon, 16 May 2022 06:37:30 -0400
X-MC-Unique: zBAa-44ZNI67S9g5dbXpxw-1
Received: by mail-wm1-f72.google.com with SMTP id z23-20020a05600c221700b003942fd37764so10135528wml.8
        for <alex.bennee@linaro.org>; Mon, 16 May 2022 03:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
        b=I70iwdxqJ0LyVUE9yjteCkztJ1bdoolamMGcQMEmDfWqqo7U6+ZnEJdhRrtRz/FTNc
         YnnmrKNwYfGBZhqlURH71BQ7BVQzU+0OE5wJEJZVYeC7fubZ+9AdZi5mJzzl532MNs9W
         cikPhurMVC8jowdpTsz7qRlOlHRfEqKXrovnik4KCLE0jgKPV4zQD/Fd9N0o3Zj9HtoT
         KfKAbZWfMqyGkdoqIpbMwpfFJl6XO7U6d+Rv3KQ2dRHSUNcAqSMBHH1VDBolnjHr6XHp
         vql/mHPfhQrRI9xaZ6bPvypXgNNmvpauaZo5oxbFmn06M6pvs7+lo7OiY0DfFFOTBZLk
         Tgpg==
X-Gm-Message-State: AOAM533YksYJLlsGW7+ibeDk9EUpHnpPAziExAGv9LJ3uVbWHtEIMuek
	2MKbuVHOacZPCwi7/RfR3SX0DAyx8T6nCvdx00pJzh11RRPdFuUQ5Vea2vBD1/qA0jWuYDUiKNf
	2RvGdGHHs4O+lF4TH
X-Received: by 2002:adf:f504:0:b0:20c:734f:d39d with SMTP id q4-20020adff504000000b0020c734fd39dmr13767110wro.717.1652697448836;
        Mon, 16 May 2022 03:37:28 -0700 (PDT)
X-Received: by 2002:adf:f504:0:b0:20c:734f:d39d with SMTP id q4-20020adff504000000b0020c734fd39dmr13767097wro.717.1652697448640;
        Mon, 16 May 2022 03:37:28 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.55.141.66])
        by smtp.gmail.com with ESMTPSA id w12-20020a7bc10c000000b003942a244ee1sm9629511wmi.38.2022.05.16.03.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:37:28 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PULL 31/91] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Message-ID: <20220516095448.507876-32-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: V3UsKdWLmFba

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
