Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp336046njg;
        Tue, 25 Feb 2025 08:33:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSCunEb1a4pYGSq4wP6PiEhF+mzOJgZqpgkt0ieiXHYLuvQkrnhWQ8sxMUi+gyEDrHkDpzfKX+EM7fNA==@linaro.org
X-Google-Smtp-Source: AGHT+IHzq5IN78EI9IHgZMoNsSK0TTDfcd/91v6u+mHwZwYTcJiTdGZBGRTA4+H1AZHpDQAvahxA
X-Received: by 2002:a05:6214:2b09:b0:6e6:61a5:aa57 with SMTP id 6a1803df08f44-6e6ae7f7ec3mr240056286d6.14.1740501196183;
        Tue, 25 Feb 2025 08:33:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501196; cv=none;
        d=google.com; s=arc-20240605;
        b=For7hT7Cstg1FCLRwRUrvjvuTg/au4Ypm0HRLGNspvdzLUCrIw4ExnG1QnxrIe9Bou
         N1zu3s4EvnuMwrpTm7kmdHPPK7SjugXqDzue2qp0ZaAbI0Uz20ee/5kuIYslHt+cYRid
         UMhOKTRC1XHdSg+/pFSbRWPzIyQReMFuUi2h0cqZyRZRtsqW83nNMT0B4U/MaCYXL27f
         b/Tm7JALRIVPpWzFirQqDyycVpNg2v1AceQGEh2v9Lne6gvnklA60oEACWBGZTLRJjvm
         Rxn0is0QpLgeqdGAmfBeYsIn7qy1yfzAEyWg/VjWgBTEpOIMi3bpBNJrCxCWTVu4fV2X
         5MFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qvorbgiHjRAcQNyyKsR/FLp8f9h6za5NToARgffqtJo=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=OWLLpWkvG1Tbht6Ty68683P3CO4kua2a2RLxWDto0b09E3AXuMthZnxjhFGR3oaBow
         f4TPpH1uNtzaMatSeANcRLIHRzxPI/ZcXg+D7hK5A7F4RYDcrcti7jtN0T3/2sZ7BveT
         As68uOaoo9Ow+BMgyzvE8wMfKUNWiXCXlhfSxo+KD2y+hEiy4C/XkqH/MruF0XNEICa3
         mpYPsJdZewtkbhgoBcCq5paQIXEaOL8SVyoq7awaoMT21Bm7M9Fv00FEiunYXzY0uVqR
         xUVu8JPeAsC3ELgEZWTZxVquGSs6r39N2BpAacz9qbHhbJZw335k1StdVl2oG/xx+/EV
         y7GA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=chK8tWON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b01b136si19252116d6.97.2025.02.25.08.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:33:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=chK8tWON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmxqC-0001Gn-W0; Tue, 25 Feb 2025 11:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpz-00016O-Sw
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpx-0006ax-OA
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvorbgiHjRAcQNyyKsR/FLp8f9h6za5NToARgffqtJo=;
 b=chK8tWONlcN61Yi9mvhhfEJpABAI4ffhtjskkmSelQ7O0cKifFe9om/qx3YclI5DoZ8yZu
 CtgGAoK6/cWR5mbv+GmMlbaisLhRfJxuRNsMf8FgyU1D/elLsW+V2BAar0ilorgUY7hX4b
 xAy8ahZ4sEosaCsBHBIHquOhmkQ5X3M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-575-pLfCMs8tPwygfsT2PPhbtA-1; Tue,
 25 Feb 2025 11:31:09 -0500
X-MC-Unique: pLfCMs8tPwygfsT2PPhbtA-1
X-Mimecast-MFC-AGG-ID: pLfCMs8tPwygfsT2PPhbtA_1740501068
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F007418D95EA; Tue, 25 Feb 2025 16:31:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A2B12300018D; Tue, 25 Feb 2025 16:31:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF8931800798; Tue, 25 Feb 2025 17:30:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 19/24] hw/uefi-vars-sysbus: qemu platform bus support
Date: Tue, 25 Feb 2025 17:30:23 +0100
Message-ID: <20250225163031.1409078-20-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: I97hhQz4o8A+

Add and register function to create an device tree entry when
the device is added to the qemu platform bus.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/core/sysbus-fdt.c         | 24 ++++++++++++++++++++++++
 hw/uefi/var-service-sysbus.c |  1 +
 2 files changed, 25 insertions(+)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 774c0aed41b5..e85066b90563 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -36,6 +36,7 @@
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/display/ramfb.h"
+#include "hw/uefi/var-service-api.h"
 #include "hw/arm/fdt.h"
 
 /*
@@ -471,6 +472,28 @@ static int add_tpm_tis_fdt_node(SysBusDevice *sbdev, void *opaque)
 }
 #endif
 
+static int add_uefi_vars_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data = opaque;
+    PlatformBusDevice *pbus = data->pbus;
+    const char *parent_node = data->pbus_node_name;
+    void *fdt = data->fdt;
+    uint64_t mmio_base;
+    char *nodename;
+
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               UEFI_VARS_FDT_NODE, mmio_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename,
+                            "compatible", UEFI_VARS_FDT_COMPAT);
+    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                 1, mmio_base,
+                                 1, UEFI_VARS_REGS_SIZE);
+    g_free(nodename);
+    return 0;
+}
+
 static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
 {
     return 0;
@@ -495,6 +518,7 @@ static const BindingEntry bindings[] = {
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
 #endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
+    TYPE_BINDING(TYPE_UEFI_VARS_SYSBUS, add_uefi_vars_node),
     TYPE_BINDING("", NULL), /* last element */
 };
 
diff --git a/hw/uefi/var-service-sysbus.c b/hw/uefi/var-service-sysbus.c
index 60072c8815cd..28572981c2af 100644
--- a/hw/uefi/var-service-sysbus.c
+++ b/hw/uefi/var-service-sysbus.c
@@ -69,6 +69,7 @@ static void uefi_vars_sysbus_class_init(ObjectClass *klass, void *data)
 
     dc->realize = uefi_vars_sysbus_realize;
     dc->vmsd = &vmstate_uefi_vars_sysbus;
+    dc->user_creatable = true;
     device_class_set_legacy_reset(dc, uefi_vars_sysbus_reset);
     device_class_set_props(dc, uefi_vars_sysbus_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-- 
2.48.1

