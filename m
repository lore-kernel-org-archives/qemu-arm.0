Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp979068njg;
        Wed, 18 Sep 2024 12:26:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2vLxmeVdSyh/Qkc62FjmMUrvTwl1GLsCXmIVuG/MFPqTiQVQD2R0Z/Qz9ivQXzWEfT+4rWqscrifT3A==@linaro.org
X-Google-Smtp-Source: AGHT+IEdYJpb61+iz92jUeGk4bJWMk7vwlBjGtgULOwYB10ks2EnMXSfCIbYeG7CLhzJBaKWYZZx
X-Received: by 2002:a05:620a:2913:b0:7a1:dcc6:fbc2 with SMTP id af79cd13be357-7a9e5efa478mr3749773385a.24.1726687581703;
        Wed, 18 Sep 2024 12:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687581; cv=none;
        d=google.com; s=arc-20240605;
        b=CzlTqQ8qR7tk1r+iu8RQ7jf4xQU3WoRSFxuPXPY0uCma/6XB0uXlUGN+U97wQ7LpkG
         zVpgTKnfIYqiMGez8pRhwXk9hwoRD9ZYRWb/Nq90dMZ28Y08xNBqjnD4xOpu8Gt192dC
         wf+M0IuTbb3Cru1N7KgXW4G57TfVvXkM2sFJUgC8TNMy4hfF/ETVri0se02+DD9zb8Tm
         a7Wu7Uj+8F8BtiMDiAApsnGl9A+RTIntHCZwugL9iJfPioCNifSWVqoO0rvKEZBc4J83
         Vzo9audcyKQ3fAQenzTqPJxV19TnNUaatyoTgSbmaNbsbjobdfqCV0v7mm/EA1SMbgMU
         rOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=QCo9xmek7WzVKGlXYZp97A3tCGxyI9d8cl8h6DAFK9k=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Jn5sf3ZHE8diYDSIxUD6CmDqBmGjSNzy7zIGvK4BUiC4VrvDV6JGqueAt6u/q6Xj8R
         VT/fuZCy+5r15kjWJP1pIlE6+hhkmPyiiMWHgNKYSoj5mPuRnlqmKlMZ28zm7xW2/Vun
         tsucYBpdIKCQUEqWf1qAJZx2QE8MTQcNZlTXWwpzZuIA74SVPqKMUaMf+ZK0vaA0CDCk
         aXjJnZBSEXFTEURZA5uC0jjvNmqbHH+jcqihi9s8wfxQ/WYyXLaZteoUeMLaNCvCWOyZ
         tKR3LFa7RDIj4m7zXF7uhA6ZqlXiJWETTUYWtr1y9UKie5pRuHHAj6TTOSHuL5K3x11i
         g5hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mqVmW6to;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb07f7ffbsi12373185a.25.2024.09.18.12.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mqVmW6to;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0Gw-0005QL-Kg; Wed, 18 Sep 2024 15:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qSjrZgUKCOQZGbOVMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--tavip.bounces.google.com>)
 id 1sr0Gr-00055y-Vs
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:26 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qSjrZgUKCOQZGbOVMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--tavip.bounces.google.com>)
 id 1sr0Gq-0007Mg-2s
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:25 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6d9e31e66eeso938887b3.1
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687402; x=1727292202; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QCo9xmek7WzVKGlXYZp97A3tCGxyI9d8cl8h6DAFK9k=;
 b=mqVmW6tox28nxAlic8+NwAM9oWKZaxP/0WiwTP9rEGcNznGcmVqFhowt7dSxZyNXeO
 hMZ3OplLapZ/SIeBPQZ2beF0uBhn17yfkchR0mSyhmW9lXZXkqmJlUgNrlbxeB5tQoUL
 UforDUUTLHlWTfVwm4EhO72O8y6vtsk3isVAKfV1wHbqCiG0CHEHsXeFRv2xLLArT01z
 cQMthr2a2mKzByHUEZxTXKaO23TnIp8FcP2y50xE95PaNqtizP18sWFp/ni/gDXtev8k
 jsg8E1bQICnmReOsvMYswKNXPoNVc6nz7uDOuK8Y94GptEEGBNRH/Fu0ooeinM3fcuxd
 Jz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687402; x=1727292202;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QCo9xmek7WzVKGlXYZp97A3tCGxyI9d8cl8h6DAFK9k=;
 b=fkE2UJqE/Oyq8hRL/JZZGBnpu/8EQLaTfS6kuK70FcSBmjJsth3I2JZGSIr7qfjzw/
 IAmAvk2DpqJvrgYxfwXhO7fzcipX7Y6rLKlfColMerBESvEewvhDHOXGfTjo+FTpUvDs
 VlW+5k4Nvue8v5gnK/eM/qp4UlN/zhd6R/b3desVXarBrLpVBDQgcj3gpWC1eRJSqx16
 fQ7nC0e6FYQXO2gqLDtyee0poe7EvhDyVRCOt+qSkar1UG64D5eCqnuZgi0VlhlrFgBf
 KQb4RDFPOhipK+1Pau01FgINbbZSJ+5QXQHFEuMRzSvlMGW1cSBscPTYjjOAl3Q374uk
 LfQw==
X-Gm-Message-State: AOJu0YybGPCSLA6VJprt+6PMx5N1lixkdKKdr/bDbrcXT+jW7ucNv5Vu
 IT0h849UC6xOY9KwjJfBdr6TFRw3We4SR6FuKzod+gAxPyGJczPLKhO2V8LD0ddtRmMNbHAj9A=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a25:aa01:0:b0:e05:6532:166 with
 SMTP id
 3f1490d57ef6-e1daff60717mr45920276.1.1726687401837; Wed, 18 Sep 2024 12:23:21
 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:42 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-15-tavip@google.com>
Subject: [PATCH 14/25] hw/arm: add RT595-EVK board
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3qSjrZgUKCOQZGbOVMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--tavip.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 3+oFmPsPeJrd

Add basic support for the RT595-EVK board, enough to be able to run
the NXP's microXpresso SDK hello world example.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/rt595-evk.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig     |  5 ++++
 hw/arm/meson.build |  1 +
 3 files changed, 70 insertions(+)
 create mode 100644 hw/arm/rt595-evk.c

diff --git a/hw/arm/rt595-evk.c b/hw/arm/rt595-evk.c
new file mode 100644
index 0000000000..e5daecc8b8
--- /dev/null
+++ b/hw/arm/rt595-evk.c
@@ -0,0 +1,64 @@
+/*
+ * i.MX RT595 EVK
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "elf.h"
+#include "exec/address-spaces.h"
+#include "hw/loader.h"
+#include "hw/sysbus.h"
+#include "hw/boards.h"
+#include "qemu/log.h"
+#include "hw/arm/armv7m.h"
+#include "hw/arm/boot.h"
+#include "qapi/error.h"
+#include "hw/arm/rt500.h"
+#include "hw/qdev-clock.h"
+#include "sysemu/reset.h"
+
+static void rt595_evk_reset(MachineState *ms, ShutdownCause reason)
+{
+    /*
+     * CPU reset is not done by default, we need to do it manually when the
+     * machine is reset.
+     */
+    cpu_reset(first_cpu);
+
+    qemu_devices_reset(reason);
+}
+
+static void rt595_evk_init(MachineState *ms)
+{
+    RT500State *s;
+    Clock *sysclk;
+
+    sysclk = clock_new(OBJECT(ms), "SYSCLK");
+    clock_set_hz(sysclk, 200000000);
+
+    s = RT500(object_new(TYPE_RT500));
+    qdev_connect_clock_in(DEVICE(s), "sysclk", sysclk);
+    object_property_add_child(OBJECT(ms), "soc", OBJECT(s));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
+
+    if (ms->kernel_filename) {
+        armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, 0, 0);
+    }
+}
+
+static void rt595_evk_machine_init(MachineClass *mc)
+{
+    mc->desc  = "RT595 EVK Machine (ARM Cortex-M33)";
+    mc->init  = rt595_evk_init;
+    mc->reset = rt595_evk_reset;
+
+    mc->ignore_memory_transaction_failures = true;
+}
+
+DEFINE_MACHINE("rt595-evk", rt595_evk_machine_init);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d1443e8f89..6720a41f65 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -719,3 +719,8 @@ config RT500
     select RT500_CLKCTL
     select FLEXSPI
     select RT500_RSTCTL
+
+config RT595_EVK
+    bool
+    default y
+    select RT500
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index d0be157092..f8c227c633 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -64,6 +64,7 @@ arm_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-pvh.c',
 ))
 arm_ss.add(when: 'CONFIG_RT500', if_true: files('rt500.c'))
+arm_ss.add(when: 'CONFIG_RT595_EVK', if_true: files('rt595-evk.c'))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
-- 
2.46.0.662.g92d0881bb0-goog

