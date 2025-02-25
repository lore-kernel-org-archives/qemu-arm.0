Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp335950njg;
        Tue, 25 Feb 2025 08:33:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUniw9nehf4WpPD7sj2F70QPKDgMEQdJ68gpg2w/5xAWHFJ9WXe9i2cW1OpkWfv/wGGS+plqwYFKaxD3g==@linaro.org
X-Google-Smtp-Source: AGHT+IFXnw3T0UESpEHs2ozqcJohO6CYrsJvg3ln4QqfOcM+6lgEOgkH0FCfQ0URXpe01+J0L5AK
X-Received: by 2002:a05:620a:2a0f:b0:7c0:b76a:51d5 with SMTP id af79cd13be357-7c0cf7d816bmr2352782785a.0.1740501185674;
        Tue, 25 Feb 2025 08:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501185; cv=none;
        d=google.com; s=arc-20240605;
        b=Iz9M3pY7BtxOVcLlIXqc7I63qWrFvu/fj/5Fx+b6T/x52wuj2xteVV3W0badMOsCEI
         j1EJP83pEgO8rBhI6tADT/X/jfbc8mR+e6kXoNDirZdJwzv76QtZfQKaH70ZFe5hNDAH
         kMEqTnaWMKExittBYiJ1uXUajApBhgGoOq0DrNmS+1ad4J5GAV62JHJ95ruP47Exnq9J
         C9j+KUZDd1zwElulq3HcxN2iDFa99CcG2Z5gsE33bNm/eL5XPksAIc4G0ESnRiUwKjwP
         NTmFexHcmIJOLUUsxeADEkH0fIzHQrJC2YLcuuLpQDmmooMAqIWuxIRy8UGoBeXAyRPp
         HdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ci9ryyO5jJhLtY+8f4vGFSf/EmQ+yINSL5BsGSMy7hQ=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=NunKAOP2S+K+GEMgzentWJj7psjnSJigXUCQr3ni1qqNitBhEV6RSA0wKidMCTR4LL
         EtKwfgWVJE3nmAbbbPJQAyBIwansbHMWZJ1vKWarXHXIUnusFzsCcg5F03dCAhmAP/nE
         ++kwXmxJByZ1VyUv9snTdBf9D59x/XW7JDYKFBeyWlhB65pKaukQg8H2ibzM+3EznvJE
         kNQK26Czw6wOFn7DlWnMWU4B2eZruPFp2gN2QO03k+gnjV7e9mygHWO9EP6CfJIvZLtz
         JcDTLh8R+xXuNPP5c4VJeeLCsdsP8e6ZlR1ifJi1VcXKj2KcQ/SEWRwIpkpPTQalYzfb
         zE6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9yrWv7g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c236193si194853185a.47.2025.02.25.08.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:33:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9yrWv7g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmxqJ-0001Uj-Pm; Tue, 25 Feb 2025 11:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq2-00016e-II
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpz-0006bV-BY
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ci9ryyO5jJhLtY+8f4vGFSf/EmQ+yINSL5BsGSMy7hQ=;
 b=A9yrWv7g29aNro1vUlRQuxaB/TvB5ED0UzAMi4kvkhFy/qkF3dU4B1yqTHm76NRPR06a+J
 5cjgfXMuVrVv/gHOKwVS/ykh0Pnseh+Xx4EoWwXd1QxqK8PXWeHN1q5C7059T7Yqb0zf48
 V+YVzQp2dvQUQmybdxk5+mV2N3Viguw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-RTFJsyfoM3GOOWOQ6hXsGw-1; Tue,
 25 Feb 2025 11:31:10 -0500
X-MC-Unique: RTFJsyfoM3GOOWOQ6hXsGw-1
X-Mimecast-MFC-AGG-ID: RTFJsyfoM3GOOWOQ6hXsGw_1740501068
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BE0551800984; Tue, 25 Feb 2025 16:31:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7112319560B9; Tue, 25 Feb 2025 16:31:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DED1C1800799; Tue, 25 Feb 2025 17:30:32 +0100 (CET)
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
Subject: [PATCH v5 20/24] hw/uefi-vars-sysbus: add x64 variant
Date: Tue, 25 Feb 2025 17:30:24 +0100
Message-ID: <20250225163031.1409078-21-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xV8wvtAKxWJh

The x86 variant of the device is mapped on the fixed address 0xfef10000
and uses etc/hardware-info instead of FDT to pass the mapping location
to the edk2 firmware.  The latter allows to move the device to a
different location should that turn out to be necessary in the future.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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

