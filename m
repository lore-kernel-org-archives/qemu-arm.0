Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp100593njm;
        Tue, 4 Mar 2025 04:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3e1v7DRtOLDVi/rpAbvPB8sy+nCqqUMyZH3wQdAQ+g1PicSkvs0p+JAy/G8aTxigX5GDdfv066JwhVw==@linaro.org
X-Google-Smtp-Source: AGHT+IHuwRU5fgx6U5UZOomvUr5+ZvPc8xK5d7mgUHAUOZzvaQtOCpRnN4JLNnwABjrmc1s1Z05R
X-Received: by 2002:ac8:5a55:0:b0:474:efcd:535 with SMTP id d75a77b69052e-474efcd1166mr88158491cf.16.1741093086800;
        Tue, 04 Mar 2025 04:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741093086; cv=none;
        d=google.com; s=arc-20240605;
        b=B0P0PyRFhILI2DUesUKuwJTPSAweUooiC825G7y7r70/udD5rV+7d0J5N/rXLTw1LN
         x6yhMpH97yQXNIrknPHiWPIA2fHObrf5OIWRGhnR0ZMF+JMu/XvQjoGNK2qktgV67hks
         LXIYjMo0+sPuzZoZ+MA9t3WTpu0Ps0AcaxL/SvBlfWDkCfXDWyKHP/2DjhnDBjzW+GVE
         sM+CBTsx2U6r1EU3zderiReVp/6oLrtHtdTrZSaoquGayfbhGXnhz9p7o1CCYig3waAH
         zLaZLuOZSWogOUWfJixzr1dwASh+cbQASpL1Zt8mNftxrAD9XpSddPXXJC/Q88Sp0xBX
         EyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WCfTLGK5BCPPyuAOyalwI7XVH4IGkc4LkKHa1QF2XYI=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=KA+l4tt6Heoneoz7UWY3RJ7EK64nEDxyB4w76WbGRq0deV+lWZ0IEcIvOZXpQzvfgF
         HM8HN7I+6wi8zN3fsHpjUAHfA2khjq2Wm6+Bh/l+2K3rje5SsYzjUEnWR7S6rp0MVvOj
         RMjZ9J943yifYH3FFaR804ShWBi7dN/+TtMbTG2NKlHbSV6Z76nxg5OEwiMg+w9Yo9Je
         OwfgpOGtuQ2wMfyT8STnHT/r9GpxzAtxZvWejnTTV7OrkUhoZEIkTAUPh3ceKJEJI9vC
         e8qPln6WpiQFwctxdLQRRiEjpj3ouG/5T+ihzXQluHO3dcyC9eddHXpiIMaRdQI47S3w
         njDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PNS+Z5UA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474f7719e3fsi23862391cf.125.2025.03.04.04.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:58:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PNS+Z5UA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpRjE-0006ju-Gr; Tue, 04 Mar 2025 07:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhp-0004vT-W6
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhm-0007JM-O2
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCfTLGK5BCPPyuAOyalwI7XVH4IGkc4LkKHa1QF2XYI=;
 b=PNS+Z5UADwZrhea631wB5cFnJHs7taKtTVtofU1sh1W9pUZj+/u3BwXanS5MeR4X8lXWep
 07Ndewur1aT08YgTgVX0t4Ab+aeTpC5txcAEOCgMi+3Up0FE6SEzMHmDYqVC171Mcr28JC
 lLni/ZXKxfA1YdsQ2hVJyZfr/RTMSH8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-E2cBlXwAMnGUepkLmjbCdg-1; Tue,
 04 Mar 2025 07:48:58 -0500
X-MC-Unique: E2cBlXwAMnGUepkLmjbCdg-1
X-Mimecast-MFC-AGG-ID: E2cBlXwAMnGUepkLmjbCdg_1741092536
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 964F11944D01; Tue,  4 Mar 2025 12:48:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2004819560AA; Tue,  4 Mar 2025 12:48:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91455180060A; Tue, 04 Mar 2025 13:48:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 20/24] hw/uefi-vars-sysbus: add x64 variant
Date: Tue,  4 Mar 2025 13:48:08 +0100
Message-ID: <20250304124815.591749-21-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4WFx3Nuqbd56

The x86 variant of the device is mapped on the fixed address 0xfef10000
and uses etc/hardware-info instead of FDT to pass the mapping location
to the edk2 firmware.  The latter allows to move the device to a
different location should that turn out to be necessary in the future.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-21-kraxel@redhat.com>
---
 hw/uefi/var-service-sysbus.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/uefi/var-service-sysbus.c b/hw/uefi/var-service-sysbus.c
index 28572981c2af..97da8672ee95 100644
--- a/hw/uefi/var-service-sysbus.c
+++ b/hw/uefi/var-service-sysbus.c
@@ -9,6 +9,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 
+#include "hw/uefi/hardware-info.h"
 #include "hw/uefi/var-service.h"
 #include "hw/uefi/var-service-api.h"
 
@@ -75,6 +76,7 @@ static void uefi_vars_sysbus_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
+/* generic: hardware discovery via FDT */
 static const TypeInfo uefi_vars_sysbus_info = {
     .name          = TYPE_UEFI_VARS_SYSBUS,
     .parent        = TYPE_SYS_BUS_DEVICE,
@@ -84,9 +86,39 @@ static const TypeInfo uefi_vars_sysbus_info = {
 };
 module_obj(TYPE_UEFI_VARS_SYSBUS);
 
+static void uefi_vars_x64_realize(DeviceState *dev, Error **errp)
+{
+    HARDWARE_INFO_SIMPLE_DEVICE hwinfo = {
+        .mmio_address = cpu_to_le64(0xfef10000),
+    };
+    SysBusDevice *sysbus = SYS_BUS_DEVICE(dev);
+
+    uefi_vars_sysbus_realize(dev, errp);
+
+    hardware_info_register(HardwareInfoQemuUefiVars,
+                           &hwinfo, sizeof(hwinfo));
+    sysbus_mmio_map(sysbus, 0, hwinfo.mmio_address);
+}
+
+static void uefi_vars_x64_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = uefi_vars_x64_realize;
+}
+
+/* x64: hardware discovery via etc/hardware-info fw_cfg */
+static const TypeInfo uefi_vars_x64_info = {
+    .name          = TYPE_UEFI_VARS_X64,
+    .parent        = TYPE_UEFI_VARS_SYSBUS,
+    .class_init    = uefi_vars_x64_class_init,
+};
+module_obj(TYPE_UEFI_VARS_X64);
+
 static void uefi_vars_sysbus_register_types(void)
 {
     type_register_static(&uefi_vars_sysbus_info);
+    type_register_static(&uefi_vars_x64_info);
 }
 
 type_init(uefi_vars_sysbus_register_types)
-- 
2.48.1

