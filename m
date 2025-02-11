Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp191861njb;
        Tue, 11 Feb 2025 01:25:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUivWEnpTHhNw2SBcZZJSZbZ8eudWYvt4DbQMGs4w/gA0LtfDI5kGQKdGt8H4cP+BDn+EQT0kZLqOKwAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFLOL87Tu1CveqmpAIhT8tbtGiYRgk0c+rLjWR3+PWjY9Ok29iGAmEsltRAXr3w08s5czfa
X-Received: by 2002:a05:620a:172a:b0:7c0:6404:bcc0 with SMTP id af79cd13be357-7c06404c110mr774777985a.44.1739265907522;
        Tue, 11 Feb 2025 01:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739265907; cv=none;
        d=google.com; s=arc-20240605;
        b=Gxke8FReW+AeNVZQPlXIhMQg66vuyicgzRDfrNmru2Z8cAVv/G9BqQNZXeIhQBfldP
         YRGAUO9jDQ3Qjmga2m43EG2Qcj7BrC2rS6B+weN/bzngKWMnhvxiAk7e9fH+3APUXDQq
         xW29Q+LxZAYwA08vqTizSxmlO93pdIY13ftIvH3sQQy9LcJdu+22rRUWdTi+M9GscVeD
         8NJe5d+pCfGA892e7LcsDKmSVi8Sa0+O08VJ9em31GaCtVMlvZfgTQT06hpWYAG2kEYj
         L2STYKDlAPPEE4Mrd4rFwLhpcM45yM5RXfHq/+OFpD6cNA4ahieUcevCRAEY4mF5flxl
         IzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N5zLzqfgx2whA5lFQYweJp9KIJglL0y0DuXJ8IZjqrM=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=PMM4ETd5yCz0jZLp/3vqhKuPJqw/A+XQvgTcPhMatobcqDNcsovt0bP4fFmoF10ge2
         SJ3W0mgczFyoCnMRlUV8YmYdWiCIP/RTTy1Ym+fglrZiVU2LfVVRADPwMnubS7eUIy66
         9tEfkhUwZLdOIbyn7220KhMVfDDWWO1qamtoXrox/598dmRibOANgSKYkuUnmUQVmoHX
         wq3fiGRt04ZpGBubQnx2BA8sLnaE5iueBrvJUuUuHEqIwZqU6i68SsRoFB7dmhfqfPyh
         2hWMT8f/mGyNdQraL7B0yR11ZkV2H9LOk6BclTSLMZ5lXIq1LCwIkyTHz4V0ycewng26
         CUYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtgCHWtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c05988bcaesi490538085a.342.2025.02.11.01.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtgCHWtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thmV3-0002oy-38; Tue, 11 Feb 2025 04:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUv-0002Q9-TH
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUt-00035k-05
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5zLzqfgx2whA5lFQYweJp9KIJglL0y0DuXJ8IZjqrM=;
 b=PtgCHWtl86G+GvbvnnL0mQERB4aDlEYMKAhEt+jzkTc8U+GCVD2kbIMeVzmYbn/+dTf0aI
 c8cdankQFKPcPv7AixQBbF7b0tg68ZVM/9qXsF9XebG8uP5ivP0/JXImhih5vg41YPjYnf
 mOvXJQYiXM+NObUXl3CCeXBTg43pJ20=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-EonJTerUOXWTmqbHWJ9twA-1; Tue,
 11 Feb 2025 04:23:59 -0500
X-MC-Unique: EonJTerUOXWTmqbHWJ9twA-1
X-Mimecast-MFC-AGG-ID: EonJTerUOXWTmqbHWJ9twA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 721391800874; Tue, 11 Feb 2025 09:23:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E859B180087F; Tue, 11 Feb 2025 09:23:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE1FF180061D; Tue, 11 Feb 2025 10:23:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 18/23] hw/uefi-vars-sysbus: qemu platform bus support
Date: Tue, 11 Feb 2025 10:23:16 +0100
Message-ID: <20250211092324.965440-19-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: UsL4QuM7v98N

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
index 1815c0b8d27f..2d6a602a7993 100644
--- a/hw/uefi/var-service-sysbus.c
+++ b/hw/uefi/var-service-sysbus.c
@@ -67,6 +67,7 @@ static void uefi_vars_sysbus_class_init(ObjectClass *klass, void *data)
 
     dc->realize = uefi_vars_sysbus_realize;
     dc->vmsd = &vmstate_uefi_vars_sysbus;
+    dc->user_creatable = true;
     device_class_set_legacy_reset(dc, uefi_vars_sysbus_reset);
     device_class_set_props(dc, uefi_vars_sysbus_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-- 
2.48.1

