Received: by 2002:a05:7022:611:b0:8f:43c:4b5e with SMTP id 17csp2906536dlb;
        Tue, 5 Nov 2024 07:32:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUa8Tbmi/+to6k470tbu3f2qlBf/o2MDI4PLiSVFusae5wwZvMgvgm4R5/twbw+JVohmbbBhy7aQ75Qqw==@linaro.org
X-Google-Smtp-Source: AGHT+IEkTa5DtZ1xYhAGORyFFrKCll7WUiWHkP/BKx5GmIIRgTuCqzeF0sEOXSxMSljnIGAxrUkf
X-Received: by 2002:a05:6102:370a:b0:4a3:ef1e:8530 with SMTP id ada2fe7eead31-4a8cfb5f759mr34669310137.10.1730820758400;
        Tue, 05 Nov 2024 07:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730820758; cv=none;
        d=google.com; s=arc-20240605;
        b=LfODTrUU9Anthi65vvIv3yv+bzBFCol4r9rBMuz8b/pW8srO8SVqQ+qPYJNDMX+/Mm
         +X3C1APnAbpaMn+WyQ5/kAUPMQkv5aclBzrAeL3TdoSwq0ywORf8kDGdzilZuBNqged3
         +5R01ym0cVdZpBpAQXljIZpjM/7dwIEIVwxq/6u90IhC5B+H6Cgw/BkaYzsrduNcADMR
         UWEDByCYzHRYRTmf7AGsa68uS+AgDjEl8Qt9354VFjLTEvMsoD3s3jHiuVDdxkAp0Czw
         TJHyYONLysrPWIA99xHuJTQ5K2W1JqYtfbTTZ7A99M/1FpX/x8RF8G3bGnarsMSGAU+8
         FQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
        fh=NzXvK1YkUP6TpyhAEYJjsuRswl6Y+krR1aG3dQUFbzY=;
        b=gjaQQz2fORIlQuvK3FqLIxE6i2eiEkgQtwRYFsldKk/iTlQpZ6ZXBmhDg8Md6T59fs
         eDyK0mUT2JdJLHWQJKVvrhlb0TJ0ozyjwh63zzSW2cKdgBuF3lp1QahMAr/lbav83loX
         zzCreHB2gj95C0HGMkQLgTlAssdW+aIDpRaqK6RaD06BM8J6/WywPXyYtr/bXU0KJ5vp
         rFzBZpJH+MW3DUzbGKAoKXY0uXUmhG7ElXIIU8O4tSzHtrI+C9p/TNArKfaVothFO97k
         af/WpezkRYENLWNSNr/D6SSxxLJ+mo1Yn4zAvLhpqbsvUeQLM4x8jMxfSUUCdzmaSxgl
         o4Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=mbLqEdEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a957563669si2605721137.484.2024.11.05.07.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 07:32:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=mbLqEdEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8LWJ-0005cu-Ey; Tue, 05 Nov 2024 10:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LWG-0005Zh-Fy
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:31:01 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LWD-00043R-UY
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:31:00 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso3508708e87.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 07:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730820656; x=1731425456;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
 b=mbLqEdECzxhM4RZZuhFFzpfp/36EkuHSiHGEugua3uyFV1CceeqQOlibapvzKHKF/H
 Kt6QWaeOdQxrhWxSnlKXpXfPaIc5tg0aeL9GQb70uhiqOceXGkrleOEunUObT4VTmen+
 i7ylebrSSnQefBXRlCWofW/xgfN6EowFAAUQgwo4NtN5qeqZy7sW17WF/C8yEAAFXhOj
 timlkWE7ISivCQAuCR9k39MYZvv0rYudHVZnJGW1ea9uZpxLPH4r6ZUCau5GjQ0CfJDY
 R6XhmYXcuwn5dhPWbcfXNTEm0zCqgvH6j4P0bWOz0NGewB0ZhlftUbF4efeb9r6kz9uo
 PjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730820656; x=1731425456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
 b=P4cOf5VPtAA+bH2eZjdBJEoLGBcdmYJ/vqUp2lXBwWZgmZwGi94/JYLRnjrHcyMdRT
 CjWyfOs3xKo7opsjbhL20ErnbtOJFIMGhsE3HafHwyb53VSUkUCxiELi56YGuqaCOn8f
 EG/ldIGNhQTWX0bSRVOc4cXcyHQ1F6eU1ceUJSiNcVOYChc1biYwIjyzn2f8GLSm+XvF
 KTDnm6ym2J+QyFiwbxjEYPgZ8G93Drf1aqoJgysTs3cvjMpUTydHtP5/zuZjjG5nlfLa
 6P91Mq9tKpib/QdGCrxlGjwaLBDFNUFHvIMSod/EfPs7bpTZu/9uR06PpOpX+3+jgHBl
 ajPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVudLh/yw60aYsf+lt2DQR5YhRgA3pE/MUvnJk4fRYdCFFjyA+fSFzY1YdHRXMeZ56SXfhs8lxm7Q==@nongnu.org
X-Gm-Message-State: AOJu0YyuOFDAyYvXJdKYTF1Z28pDCNj4hhtsB57TY6fThot6DhQ/YXEo
 Kr7Bgzh7dwpPJxYnkj6TgAJl2EY8gytTgfphA7scDNe7HpvxX7PlSQAPE7q8eg==
X-Received: by 2002:a05:6512:308a:b0:539:8d67:1b1b with SMTP id
 2adb3069b0e04-53b7ecf1ff6mr13196373e87.26.1730820656015; 
 Tue, 05 Nov 2024 07:30:56 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6aae3fcsm1419415a12.21.2024.11.05.07.30.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 07:30:55 -0800 (PST)
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
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v7 07/15] hw/misc/pvpanic: Add MMIO interface
Date: Tue,  5 Nov 2024 16:30:14 +0100
Message-Id: <20241105153022.91101-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241105153022.91101-1-phil@philjordan.eu>
References: <20241105153022.91101-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::132;
 envelope-from=phil@philjordan.eu; helo=mail-lf1-x132.google.com
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
X-TUID: vQVF3EvtQtg9

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
2.39.3 (Apple Git-145)

