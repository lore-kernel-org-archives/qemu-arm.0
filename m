Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp800606lfc;
        Wed, 26 Aug 2020 07:21:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJrPlC4TNteWAkJMLfqmpOSLNqixNl6lppKNUhqBolp3tCgG01lITd+dYUSfFolCNoCW1r
X-Received: by 2002:a25:aaee:: with SMTP id t101mr22673375ybi.472.1598451698874;
        Wed, 26 Aug 2020 07:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598451698; cv=none;
        d=google.com; s=arc-20160816;
        b=TUdUOosZB4haFHacMxuvZstDyBrbk/1TNhu2i+yuWlYACOWDoh5XwtgSZh210LuVaa
         cjxUu6YgQ6BNfYz+YYFjo1HB5zRvNpmZCN3Rvn4trbftWuO/SB7ff35VryaUEbga82Qg
         kuJPRFAeUpHAxAxyR2q+m8uBqY2+adojV3vGRa7zC4T14rLReODB2ck6VKy0FY3VdBmm
         vVlQKzRrgPP9NYKPCXBri9O/6fLpxJ36HVcmCfieYhiegpmUqxF5A6bZy6e5jtbTUbCG
         tzj6WwrDf6OppJTMTPxusxXIeDHcyUxS+3KOfe/Oqvp8D7kqggs+Z6C6Ql6T+tU3WZIr
         8UJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7+36PnMQTCjkKChJLGXL0i7a9udhWvYuIUxgFCuMpx4=;
        b=jU562g0LprQ5aSNTcTxpZOVCXcIQ0Ekjpu7ZiGk2/htdKY3thp79L1Isiy+tD2URPR
         Rvy4aAvc3aZ3i9dGbSsazcTPZZ0HwsZC4nlf22+l4UVLeqrPi6viil+fW0Qh6x41oX3d
         KoSXlvDil98LXiHQYNECROnnp8E2o0cjo37LLSqbZ0zEdQUAK1o1T+TPpBk2MjTc4DvZ
         v9ZRtmGNiIWvnZfCjzQDrxGcYEmrs7IqZp9ndHuEA+u8xzd7j0xFXnjwUIen8bfyZS0j
         mVztxAuBM3QZMg+ibvBZXsl/zJfSlBbSdRGmbBLNwQ+ybYRacewHPyJFjpzxdjdkXQlx
         W2oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=yj5t2G+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z63si2294098ybz.470.2020.08.26.07.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=yj5t2G+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAwJ0-0005PQ-7A
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAwHT-0002jK-CX
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:20:03 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAwHR-0003rX-Do
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:20:03 -0400
Received: by mail-wm1-x333.google.com with SMTP id b79so1359319wmb.4
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+36PnMQTCjkKChJLGXL0i7a9udhWvYuIUxgFCuMpx4=;
 b=yj5t2G+I8krhcX6LRNhdI/tM3NfECG/90ZZzaGmwUUaC8H1IIZVfMXOLqJduApaLPl
 wQP/seh6Bz9oL82ngg3YtpWueVRPy85NyrlmuDJlGK8BRpHnmxN+PPGH34j81RSwUetm
 Vxtbd1VFHo5Fkgz2u33bj7UVoXppx8UaE2D2UGJhfM1CMpl5OS7m7evhj/VLTW9hqn35
 e6KUdInNnaZe9illCjr9cDpo0uxdSh4xpNg8YYZ1SMo71NnmT+2/H0A6UHd47gpZMyOW
 J/kQoQte+Dk59TJghd4IdNN4g3fsdZpFUdUARz35+8OccgVfdo1E/gjRueuCwALoSPP6
 Aq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+36PnMQTCjkKChJLGXL0i7a9udhWvYuIUxgFCuMpx4=;
 b=ZCNhfXGp8XYiAKHcaqxNeQDQhsjewNI0L66ecsXoSdQy2pA9hEFBVcooS9/OoNddur
 gPSHJDetdz4wWiGIG1N/pwVbP36ivhZhDveSIlZdoooSpscLvLCBz+2aPP0K850qoAi+
 SwBqxtG9Gz2YguPVdHgbhOKNaNubHjF/CzalHVXnDcfKwq3tnoSXRKjSIEfFVlKmmPWO
 mlvCVdWEY0yOqQZ9+7sPnhJK2JwMlJksDXlWDiCLahVO0D+1gW83wd8Y5fQbNzLPCZH6
 l/3gvX4akWf2kMbs08Iyac72u0JjgnGG2+GGixKW6BryoR5XzHRvnW5injuLuHXg3msV
 XyOg==
X-Gm-Message-State: AOAM532O58F3JypW6lVoZvZEvvtsdU1rtCKZcRbQW5cofcmKlrodh7oV
 1oyoL5hSwxkP8EooPQ72ByHg0PXc2gbUqBXnl5r6K0i44MY6xyzViTrExqdWUW9Slug8yZLJg8o
 VBOS++CcKTGDe5ymArpnCyju4I3KOaWb3Zuh+nBQs30juyILp+sqpf6B+WgyaglKluxBSZg==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr7570848wmi.151.1598451599595; 
 Wed, 26 Aug 2020 07:19:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id n7sm6604411wrs.2.2020.08.26.07.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:19:58 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] hw/misc/sbsa_ec : Add an embedded controller for
 sbsa-ref
Date: Wed, 26 Aug 2020 15:19:51 +0100
Message-Id: <20200826141952.136164-2-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826141952.136164-1-graeme@nuviainc.com>
References: <20200826141952.136164-1-graeme@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x333.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 rad@semihalf.com, qemu-devel@nongnu.org, f4bug@amsat.org, leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iSJB2Hb+Si9z

A difference between sbsa platform and the virt platform is PSCI is
handled by ARM-TF in the sbsa platform. This means that the PSCI code
there needs to communicate some of the platform power changes down
to the qemu code for things like shutdown/reset control.

Space has been left to extend the EC if we find other use cases in
future where ARM-TF and qemu need to communicate.

Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
---
 hw/misc/meson.build |  2 +
 hw/misc/sbsa_ec.c   | 98 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 hw/misc/sbsa_ec.c

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 84fed0494d..e1576b81cf 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -97,3 +97,5 @@ specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
+
+specific_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
new file mode 100644
index 0000000000..9a7d7f914a
--- /dev/null
+++ b/hw/misc/sbsa_ec.c
@@ -0,0 +1,98 @@
+/*
+ * ARM SBSA Reference Platform Embedded Controller
+ *
+ * A device to allow PSCI running in the secure side of sbsa-ref machine
+ * to communicate platform power states to qemu.
+ *
+ * Copyright (c) 2020 Nuvia Inc
+ * Written by Graeme Gregory <graeme@nuviainc.com>
+ *
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/log.h"
+#include "hw/sysbus.h"
+#include "sysemu/runstate.h"
+
+typedef struct {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+} SECUREECState;
+
+#define TYPE_SBSA_EC      "sbsa-ec"
+#define SECURE_EC(obj) OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_EC)
+
+enum sbsa_ec_powerstates {
+    SBSA_EC_CMD_POWEROFF = 0x01,
+    SBSA_EC_CMD_REBOOT = 0x02,
+};
+
+static uint64_t sbsa_ec_read(void *opaque, hwaddr offset, unsigned size)
+{
+    /* No use for this currently */
+    qemu_log_mask(LOG_GUEST_ERROR, "sbsa-ec: no readable registers");
+    return 0;
+}
+
+static void sbsa_ec_write(void *opaque, hwaddr offset,
+                     uint64_t value, unsigned size)
+{
+    if (offset == 0) { /* PSCI machine power command register */
+        switch (value) {
+        case SBSA_EC_CMD_POWEROFF:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            break;
+        case SBSA_EC_CMD_REBOOT:
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "sbsa-ec: unknown power command");
+        }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "sbsa-ec: unknown EC register");
+    }
+}
+
+static const MemoryRegionOps sbsa_ec_ops = {
+    .read = sbsa_ec_read,
+    .write = sbsa_ec_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static void sbsa_ec_init(Object *obj)
+{
+    SECUREECState *s = SECURE_EC(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &sbsa_ec_ops, s, "sbsa-ec",
+                          0x1000);
+    sysbus_init_mmio(dev, &s->iomem);
+}
+
+static void sbsa_ec_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    /* No vmstate or reset required: device has no internal state */
+    dc->user_creatable = false;
+}
+
+static const TypeInfo sbsa_ec_info = {
+    .name          = TYPE_SBSA_EC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SECUREECState),
+    .instance_init = sbsa_ec_init,
+    .class_init    = sbsa_ec_class_init,
+};
+
+static void sbsa_ec_register_type(void)
+{
+    type_register_static(&sbsa_ec_info);
+}
+
+type_init(sbsa_ec_register_type);
-- 
2.25.1

