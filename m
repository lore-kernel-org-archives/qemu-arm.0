Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6255825njc;
        Sun, 10 Nov 2024 13:59:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6KTn6mbG+NPHM4pWROvus6741jMaof1iQIYNKUUURe83tDLqvRBREVskGMV1qcWLj1w7ZgpSJWjUHug==@linaro.org
X-Google-Smtp-Source: AGHT+IFLFvt3KB0+RCwoh8QbAZz+aI9q5pBl3UDtLcoyOhiJ+NlKShdNQx76Swq3YxViwy6ClYjT
X-Received: by 2002:a05:620a:2447:b0:7b1:113f:2e6e with SMTP id af79cd13be357-7b331f31074mr1451741785a.62.1731275983218;
        Sun, 10 Nov 2024 13:59:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731275983; cv=none;
        d=google.com; s=arc-20240605;
        b=T6D8+oliJE+l5rryUBX17+hKFyjZYSf5a5UglsaqqQohTl7Uqhv+EixxlL+/VAoyBt
         1XKS8y6fA3RDqBKv5iLcoSlyEZsCUPC+bZpTVw315yg8d0Bz2+1NZCiM3yp7/ZwAEtcZ
         TTY4l091ZZHWfPimQoWrnFxjkX3wfai9Wuwy2lIUD9fjgutJfAtUmsIinYxHGYtNDtY/
         FpNXckA42qckaeH6vt0Dnobn/zVDyT6m9yf7Lh5FBV+TP5GO0S6n2ptPxy/lmrElal7n
         SIUd9PCu7WteBuFg9NBvZ1CJmm6M6HNJjC6uNb3QpydsxHDUJdtskw7YwKF3ogVE1ZKJ
         qrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
        fh=EcwXPi7fNzawVwcrLZ/3lxqcXRhtaVvIXpWl+WebLB4=;
        b=F+09VLIDdvYN6OON2hKc0bW/QGaRp5+clleNX4+HNDDcpPWXH7+GYF6eo+mWNLk2fO
         yN1W1YvMRQ5uBBRSyizw2Z8rpRyZ3sC830cotKSBBWx3vN7AawGsheXaFWo5NKGcNXwj
         EVZwvC0wqZfRLNnuLcyCNe3rpnOWU0vj3bvYD7Xvb+H91RALjGXxzAv5cXm5SiN/X5Ax
         Bc6b72oK8qrspA5U7gYc2CSBFPbMVJiuxwgF/ZVWfiWXdHoY1UsW/UW7/iohdiltUDYu
         bNr1AfIqy7UwZtWLhf5MQHGVQXpsc953E3Opac1fjUaZIiYY9lVm4o+LXcsuUq28CQ8E
         wgOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Vjfdt3ha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad26e7asi985030185a.635.2024.11.10.13.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 13:59:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Vjfdt3ha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAFuS-0003to-0x; Sun, 10 Nov 2024 16:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuM-0003mo-1L
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 16:55:46 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuI-0003zl-D7
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 16:55:45 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9ec267b879so706080366b.2
 for <qemu-arm@nongnu.org>; Sun, 10 Nov 2024 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731275741; x=1731880541;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
 b=Vjfdt3haQQacyFeNxwubRRX6tjHXRak5JdZzRVlUoBL4u6h5ry7TIyax5FE0atA3uM
 QjIZdX417QDmsRU732CWTxwcUww+1Su6S7VhHMkf0TDtKINZX2gc2kXjiUWdkHAA3lah
 x6xsW9won5orDa+lic/tYCnngUmVQ9W0yc3zGUsdRNi11xdDMUh374zPdSAW1Kc29NrT
 kCe45YiBWCtT4hl1Ud0AQsPi8IoJLnnCc3jqF7yxnSo+AqgeN5/3uxNc9ET6KpeJE+ks
 zh4OWEeO/G1h8IV5CRZSQSC+SC29J+wi/lUS3r8koQA8flnGHEqOvdxcixfRzkr+80F2
 QkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731275741; x=1731880541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
 b=E2ae0HylVu9lwgtMDysDdNQSRA9Iqm44extDGBIxE5zrGqXu4bZzK6byjrdlFBuaVB
 wcqI/r1nUFLQFfeD+t7Q6CDok0GGz1ScTLSmOTbLrpzy1s2WYoWHVjFwrtaAm31JiwGk
 0hAoXtjan+XdEtUUms5T1tdEDKp1W5T1gCtohnYJ9ZXR5rs+UxtyDR36B96iS3cSHRSf
 8IoPwD7JoEyGldp56K4OSTlejtXbjHSNXk1vV40BGVliF0OMI/Zv9grRuFK1f4gpo86h
 e7aXhhsVr9G/HlxIstpYO6HBU8HjQBuJ96MdmoJZUGly5eEV5MFBLb0Y19ENQZpg83oJ
 m9Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiV1wRtjYV4key1H3H8J5HrGbYlQuwAVz5cYRxdCboU9XeFtJ0NcLiHYrhIbbqKL4ZLbd3A+4YYQ==@nongnu.org
X-Gm-Message-State: AOJu0YzLSJkw7AIj9wZhVnW7eAjDmTbWgU4b8H7XTSp2JiSlYSnyqEiT
 ID3Y9XXmt0idTTkBtChW0BacyLE6T1lT32aOQz5Q90X7BQIlc+VY2tqwCTGx9g==
X-Received: by 2002:a17:907:e93:b0:a9e:85f8:2a35 with SMTP id
 a640c23a62f3a-a9eefff14c4mr1009194166b.37.1731275740154; 
 Sun, 10 Nov 2024 13:55:40 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2f731sm523715566b.189.2024.11.10.13.55.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 10 Nov 2024 13:55:39 -0800 (PST)
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
Subject: [PATCH v9 07/16] hw/misc/pvpanic: Add MMIO interface
Date: Sun, 10 Nov 2024 22:55:10 +0100
Message-Id: <20241110215519.49150-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241110215519.49150-1-phil@philjordan.eu>
References: <20241110215519.49150-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::636;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x636.google.com
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
X-TUID: ThlEJxdyGEun

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

