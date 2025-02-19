Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1282405dlb;
        Tue, 18 Feb 2025 23:17:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaamVzWqi6AmBx0vWR/KhtzgL06+RwhYcCTT9P0j7DOtPl9C3nmAemQTr8pvuAsWvfnvhgNDltlo+Lmg==@linaro.org
X-Google-Smtp-Source: AGHT+IHbHYrIvY4dvqyrIXcUEWQO1Sb0hQbz92GkcoVhZlYfx6f42SKF1relsVpzMrNDVQqFqYqI
X-Received: by 2002:a05:6214:dc5:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6e66cd19fedmr246909156d6.33.1739949425770;
        Tue, 18 Feb 2025 23:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949425; cv=none;
        d=google.com; s=arc-20240605;
        b=GbqPf+VUKpwSerskurYn/RdkQe1I/4NPbwX7sUjPu8FYXm9sQd2JY+E6ggigCHdXq7
         1VrtnsOhbM5u24pPgfRUTznRIqa0K8BkoKIlgN+OEq5LP+rwi6K3nfq3+1E9ppibA8mL
         gJV//Hgc2iMFLqtMJzxq640iVE+W33/lr2bRnf27pjGuB7TTaRisg2VzuQLRqdIny7go
         6IJOH/L7ZNF4svHbvrY4cuR4nb5gpi8XWLvZ63GUEtunyggoONNZ2OCPXqVD1g7fy3QQ
         mnPIk0DkqjmZ7JYiGVdnxuvEVwrYKlW0SyRZ/mW+bNcBNVEPcVWSaQUSOL91letF+LXs
         YZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9zXi8ePcLudFZrqpdShmQBohG79pDZImwm/7Uyu89uM=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=cs3+Z8JQOD1HmixuIz/W7k9KjpNtChPdS5QX4OazV/IxWp5deyz5xrEJJyQJXmQlSv
         9nFfLvJCz83VO/4OXloQS4RCdtCWrMA/n6n9Y5XhFTf4qzO98dGLuDbRqIIviBRA33+W
         y9b4+7DRxeYAFCuOiAb0a/d72X/MaVG2n8snap5Lk/0RmfM9s5a67n3tRtUEE9TBo+Ml
         /5hIiDQm1+F3OXI9rgBOO/zMVaIzQeczcnbsOw6aXCMHUh1S8K4uvI5YURKP3WzQoL3I
         IuZPo4TVoWz/PEyouliPQhXynB3OJxLLTONtk/IXDMb0OY0oiF9DCwcrKQysu6GXmR4l
         37Fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZFG2bm4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d7344edsi126325356d6.20.2025.02.18.23.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:17:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZFG2bm4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkeK8-00055Z-R1; Wed, 19 Feb 2025 02:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIq-0002bT-U3
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 02:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIo-0005M8-I5
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 02:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zXi8ePcLudFZrqpdShmQBohG79pDZImwm/7Uyu89uM=;
 b=SZFG2bm4IC18MgdhmELlhGARi3pGeXJUkGJpeeoDlou3nzyIPNkvcIcPTOLjYz30ukLB/+
 Bimkm7lpWbCqCtvaKK2ulBvZXOv5zZIhcyGBc9qxVItdapF8hbvttU1Cue1PhF49hMlh5t
 fM1Lvthzf3HlG/HEwPtjiZQIeBnCE3Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-NB__LR88OamIaonzzkpiJw-1; Wed,
 19 Feb 2025 02:15:13 -0500
X-MC-Unique: NB__LR88OamIaonzzkpiJw-1
X-Mimecast-MFC-AGG-ID: NB__LR88OamIaonzzkpiJw_1739949311
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 382A51800360; Wed, 19 Feb 2025 07:15:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9DB78180087E; Wed, 19 Feb 2025 07:15:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5AA131801B04; Wed, 19 Feb 2025 08:14:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 20/24] hw/uefi-vars-sysbus: add x64 variant
Date: Wed, 19 Feb 2025 08:14:22 +0100
Message-ID: <20250219071431.50626-21-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: bpDtBrcaMKMX

The x86 variant of the device is mapped on the fixed address 0xfef10000
and uses etc/hardware-info instead of FDT to pass the mapping location
to the edk2 firmware.  The latter allows to move the device to a
different location should that turn out to be necessary in the future.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-sysbus.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/uefi/var-service-sysbus.c b/hw/uefi/var-service-sysbus.c
index 28572981c2af..d953ed8a86d9 100644
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
+        .mmio_address = 0xfef10000,
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

