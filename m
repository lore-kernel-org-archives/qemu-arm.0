Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp849973njb;
        Wed, 27 Nov 2024 07:06:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXL7yu7v+kIPBLNnwU19pL+1a8ApVOa0KKkf7vDuVV/rJiHXAJ+955fVjZZn4v+CTj0hXN7PukCP7axig==@linaro.org
X-Google-Smtp-Source: AGHT+IFTjO/kMVFeOUMI/cbgHBAl8uoZVfVUJqG1TZMSS3NRvdT/pgMeqEZksQSDljXAyqReCFuA
X-Received: by 2002:a05:600c:350c:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-434a9dc303bmr33305945e9.11.1732720007385;
        Wed, 27 Nov 2024 07:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732720007; cv=none;
        d=google.com; s=arc-20240605;
        b=TwcHvMoCVGJ0ZWuUNfXIDPrQQEzZzOhBa82p6Xn2cOqfVVKBz6VIZSuLjZGVoG0B8B
         idQtiT7730xLHYALhHz79ki6dNkzNIZz8fR7DrIhRNCTPNhiQAo1i4e6s73WPt4gJcIm
         YN6I2q5ewCDOC07RBp8kDosZ/Q+RiAUMdZYfh/I25znNhApA3xzeBpmKffwVtOJ+cm+N
         hlhUiAjpT06hSyn7O3Wg2bKT4HKXhatJPyjINJNu3EDAp6DJLvx29dC/FK3hi7OkLIQS
         QBtXkxX9onyb3amkcT83cC5TS3QrP3O1I+4Ckak26MigODsP921Y14OdclKbupjY8Hhi
         1Nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9fBIkfb/JNGOeADe4W7k8MHHsSm50BaP9rSq2He7Rec=;
        fh=NUIS6Hi6FYF1AjOSSIvu1xLj8diKdhRW20rwEVYxuyY=;
        b=iZZZG7g0PqpNaHGZaGra99fU0F2xWgGBetbPw7AR3azQ/UVgxOxdQpgGAz8qS3G4TF
         EDXPXf6yMD60kqZrdRd2YrH3/HAr9OaKjB4uIYFyeHMI45fhIfeSOlU9AusK2Ce2+yRx
         BpX+BPrP4jW8xA6EaMpmpRirffiW6HhD4rZMNma62k5RexG7bMJ7IN7xUnbji6LmWGP0
         z5ooADQY8Lu0fvbGvKqxLIIC8Aw2mcOHhV5hNG8jY6zPUgosTjBKtSXwcvrJlvECvVRl
         zUJ/vZX9imJeEIaRdIVyrm2+VHISi9s6nM3sSJjWbCBtIBfLSjijSM9cq/g+1s3f4uZi
         dyRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=HnCRRSDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-434aa7a4a1dsi945385e9.48.2024.11.27.07.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 07:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=HnCRRSDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGJcR-0001NC-MH; Wed, 27 Nov 2024 10:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJc9-0000gu-Tg
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:06 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJc3-0008C3-Js
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:00 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a736518eso19416485e9.1
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 07:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719944; x=1733324744;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fBIkfb/JNGOeADe4W7k8MHHsSm50BaP9rSq2He7Rec=;
 b=HnCRRSDJUcB6SkdpZKRuGPPSFQpjW13LeNLK/LdGZ65ps0Ta0ROsET/T8WILYLqfE1
 vovxYz23XCjnX3pt1lvbV55bt/kiTaIf6uGd+Ba7z8qWOfvMXMEK4e0qD8zRmQAc0l2P
 o61DEOQme/y3pc92bPFXUtMQP8Jww1vKYOgr8fBWgKgSYf443MdHwryy+5jDgDa/iX6L
 bNTTo+zWgaAnXx5UXV6ZIXLi8yriUrH0AnxFGafno3sbcBU3iIoIvUrulm2R06lsMLFe
 2EOh5lrnKa1zlzTWdzjqYEy2BjmpeJO1LTqFS80PrBbx9nZlRz2r3KVZ5uFqT+bwdxNF
 Q3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719944; x=1733324744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9fBIkfb/JNGOeADe4W7k8MHHsSm50BaP9rSq2He7Rec=;
 b=gM1Ytpod3A0X/4wb+YMTf8TR7ZqKiLxIm+lcUKMrypFDOfbj3OXGfF96J6OKjREseS
 dNKH3W91quXRfBgdnbWcGCLC5O9kmW7dyWtQ9DoCB+TnZwy1aa26njuDcwQe6rK30Vth
 fU/pw5ezUe2m+tZWgMPGTbmKKgWFgzH3RD+uIwVvDcDVVDO+WOVcvjII85kqS/usKxOZ
 cTfSb54g0PqbiKol6XJ+1sf3EPMts9+xgJC3YvDr5le33yCiAYS8cmHOVk76K2Ygy646
 CPLFtXe2JP2nZyKctzgLYgsCjq8eBYkqwPiOXlLA1xNVGmtcyzIfOIVdRWz+gPnt1u4z
 YQ5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcaxV+eSEap4ZxaMBhEiFDxP1Mo0LunibqujZ6M3SgSdenS9+ujm06euQbExs+z17U8XN/bDYlnQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy7QDKntQ0V7LTKJ0aL6CYXHzPwqb/JxWylJwLxa5zJzZKtC8V5
 em4qxhSeKpfbrp28UlMZZVg9LAUqaYeWfCPIkcebe2jqsjutIUrZB9F7ur1Hsw==
X-Gm-Gg: ASbGncsx4LiRQnfmopP013xJGA8OUYoIG3BRa034KHAVwKSvi3s2XOvRFWrJURsJqOX
 LPrG1RDVRT5nuaVgyE2Nk82g1WjGdB81wu2ZEbzZZh0YGixhJ9O1mqcWdFyvuC7xmOQ2Rw6Qfem
 3ceijaDgDJujrVrzkFDWd95YV6YJ76o2mNyUj9Htm4QRg4BCay25DNWXobnsN81zEVeSzSLq6ev
 ZWxFUBh7lGrrOYyDN+9KnZcjiF6umIU5TcR504H512aciaG+2Qew6cJRk4kgwhlYwzjTx+Kwrud
 vApA681h10eahXf7G5JueZVvuA==
X-Received: by 2002:a05:600c:5254:b0:434:a30b:5445 with SMTP id
 5b1f17b1804b1-434a9dcf2b6mr31738065e9.19.1732719935016; 
 Wed, 27 Nov 2024 07:05:35 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.05.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:05:03 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v11 07/15] hw/misc/pvpanic: Add MMIO interface
Date: Wed, 27 Nov 2024 16:02:41 +0100
Message-Id: <20241127150249.50767-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::333;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: aLlS0+aqTJU9

From: Alexander Graf <graf@amazon.com>

In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
platform device that we can use in embedded arm environments.

Signed-off-by: Alexander Graf <graf@amazon.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v3:
 * Rebased on upstream, updated a header path

 hw/misc/Kconfig           |  4 +++
 hw/misc/meson.build       |  1 +
 hw/misc/pvpanic-mmio.c    | 61 +++++++++++++++++++++++++++++++++++++++
 include/hw/misc/pvpanic.h |  1 +
 4 files changed, 67 insertions(+)
 create mode 100644 hw/misc/pvpanic-mmio.c

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 1f1baa5dde9..5a6c1603b60 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -145,6 +145,10 @@ config PVPANIC_ISA
     depends on ISA_BUS
     select PVPANIC_COMMON
 
+config PVPANIC_MMIO
+    bool
+    select PVPANIC_COMMON
+
 config AUX
     bool
     select I2C
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index d02d96e403b..4de4db0a600 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -122,6 +122,7 @@ system_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
 system_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 system_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
+system_ss.add(when: 'CONFIG_PVPANIC_MMIO', if_true: files('pvpanic-mmio.c'))
 system_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_hace.c',
diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
new file mode 100644
index 00000000000..56738efee53
--- /dev/null
+++ b/hw/misc/pvpanic-mmio.c
@@ -0,0 +1,61 @@
+/*
+ * QEMU simulated pvpanic device (MMIO frontend)
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/qdev-properties.h"
+#include "hw/misc/pvpanic.h"
+#include "hw/sysbus.h"
+#include "standard-headers/misc/pvpanic.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(PVPanicMMIOState, PVPANIC_MMIO_DEVICE)
+
+#define PVPANIC_MMIO_SIZE 0x2
+
+struct PVPanicMMIOState {
+    SysBusDevice parent_obj;
+
+    PVPanicState pvpanic;
+};
+
+static void pvpanic_mmio_initfn(Object *obj)
+{
+    PVPanicMMIOState *s = PVPANIC_MMIO_DEVICE(obj);
+
+    pvpanic_setup_io(&s->pvpanic, DEVICE(s), PVPANIC_MMIO_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->pvpanic.mr);
+}
+
+static Property pvpanic_mmio_properties[] = {
+    DEFINE_PROP_UINT8("events", PVPanicMMIOState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, pvpanic_mmio_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo pvpanic_mmio_info = {
+    .name          = TYPE_PVPANIC_MMIO_DEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PVPanicMMIOState),
+    .instance_init = pvpanic_mmio_initfn,
+    .class_init    = pvpanic_mmio_class_init,
+};
+
+static void pvpanic_register_types(void)
+{
+    type_register_static(&pvpanic_mmio_info);
+}
+
+type_init(pvpanic_register_types)
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 9a71a5ad0d7..049a94c1125 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -26,6 +26,7 @@
 
 #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
 #define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
+#define TYPE_PVPANIC_MMIO_DEVICE "pvpanic-mmio"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
-- 
2.39.5 (Apple Git-154)

