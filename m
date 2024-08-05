Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986592njb;
        Mon, 5 Aug 2024 13:18:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0AIiU7QaULl3GEzgHZGOrRVjAR9NQYy1UIK+wiA/nyz+88Vbw2Sg+Yba4jRZgXDhiXC9nYlf7fZBaADLL9FJPLvD3r7pd
X-Received: by 2002:a05:6a00:4f8b:b0:705:951e:ed84 with SMTP id d2e1a72fcca58-7106cfcf0c3mr16481659b3a.15.1722889082740;
        Mon, 05 Aug 2024 13:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889082; cv=none;
        d=google.com; s=arc-20160816;
        b=r3rdsPJzR2zD/7ZZeWs13zinPOkefV0IjKs/CdXQHaPZArTePfJwJhXrzqH/VOmvpq
         D9AyPzh2qlRyJnkRBtAICEo0HfqKofcl35ZXI8kt/kbFTUK4JLb1cqZKEla8XQLrRSpJ
         OjkFpMkY+V/iAjlB8Zz3WfiIRQob0XlbITUGVGcOI5EIddGDBtKe7rlk5K2CCEOl4iEq
         hzSu+orjzBcZ6ay+LR/JQy1gxPnN4WjrscyXeGsnQuzAblVJlu6tYixQs3Bv7HOWu5IF
         WDCYzZbKbvAB1fiB2xyCLULF7Y/xkN8uU05Ey3QRH+SErzziyRHimyjyWLPcR++cMH/3
         UKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=3GjBap7FxZdPpDdgQeaY7XNjHE33uQ9g7r73DwU0Kyw=;
        fh=3dUjK19Nd4vZ4QsUHucfmtQEhxoVdRHdtZrNmw9aH6s=;
        b=yzixkCCo36pXYZY0vUNkxeiNL0/Y4AsXwD7GyyZlYsL4NM806fnmC+9JGzKUJD7iah
         wHHuskr0fLQkxPQJ0KMNB8hv40eemxFbqU5iF8zpp6pFm2TivFi5driwTBo12iIjTr+P
         7aj3Av94SuxvPeJlMKtlgFyrTb84dHqWM9pAOrZ75W9yjjMHFTube/F8kgU1ZmWZAHrT
         c1oD04nzN2KkeZzjOHs/FjRMjS3A4iyXncqimo7SwQqaZuJvXDGjejpHa3e5j6mmIkyw
         XCJDeQmbbJciD+AAYWXfVD/Ksn7v4nzq1c3iU9/Dsiqh6bZS9cWR/scJI0IpMBX4kNN5
         8/0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Vati2FYF;
       spf=pass (google.com: domain of 3ejoxzgukc-ewdylsjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ejOxZgUKC-EWDYLSJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3ejOxZgUKC-EWDYLSJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d2e1a72fcca58-7106ed27066sor8275357b3a.12.2024.08.05.13.18.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ejoxzgukc-ewdylsjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Vati2FYF;
       spf=pass (google.com: domain of 3ejoxzgukc-ewdylsjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ejOxZgUKC-EWDYLSJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889082; x=1723493882; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GjBap7FxZdPpDdgQeaY7XNjHE33uQ9g7r73DwU0Kyw=;
        b=Vati2FYFGW7oO/8trXtjFXB8Rz3XcK+WonN1qWKIYEvv6GmTF2qExSL6zWwtzb9Ls1
         6meSepmi+cIrMP1RqjRnNN9OHgIJAzC07rozbTgo3/Qs3G0pD/o5x0s/oywkrW6AwoIE
         CwEIWzsC8b0op2O2s/ho+feBYT9SQOoqVKI4EongGMPZwF4Oe4rdH+7gCZmZdKEHf7ss
         QH9mRon2IK/Yr0ne7Z9gVv7ETBZYM9wz94wfIaWcdKjsKqnDsR2SxWbySnkbsmskvOoP
         eSLl1H7b2CqA06B6OJzRsGb8ATKh8ZQvnxIu3S9WxQi3iPCZcjUVoiSCGUMVuPHBT+ow
         oJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889082; x=1723493882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GjBap7FxZdPpDdgQeaY7XNjHE33uQ9g7r73DwU0Kyw=;
        b=YK6/RG1iiBdMz0ToFp9VAu3rDZgv7qDDy8M5aqSe7fD+sMtCLGxthl0Q/UHxpexfsb
         nEbnVwYwEDjj/L16UH693Q3AdniUbiWL4B3SCa7+L5qLGvPJE/v0sK5ecP5b40sTpGzG
         jKHZk12r2XEDgE55taDgSWUb+KSIMuIcA2xL650Bdo9uKVgOdGT3NYb3cLoNcQeDWg6L
         fQHFXQgeFCkAOlIPGkHulS3QvcIDtPLrGIpuc80YJy74/domXZMkUTFodcGZgN3YGIpi
         IJCER8vDl+hKcsrct8gUWJOPPOe8urGbHFFeG5uEqOuMjcAaXBz3Upz0oYINrBswkS1T
         cp6A==
X-Forwarded-Encrypted: i=1; AJvYcCVkDEY6986nXbgLlgUKHjaTqYzv0k5s14HjzZw4nAiARk3NeG1Xp6t2F3yIyTDk5GNp38CEvAG18BsHQjvIfLlx+CtQWpsm
X-Gm-Message-State: AOJu0YzZtj1b/KlvLKnNen7LrMigASEK85bxLC12t2gljPd8TCmR6xnV
	xauawtHYJrmrQVB0h6iH+Rn3Smp4uBbqWts+bYcm2Yo5nZrLgWbXqblWOHKEwmQkSQD+4CcxUw=
	=
X-Google-Smtp-Source: AGHT+IEXkrqOE/XzNbGuVKsM0VKvpvoMdnNt3Ub2rtyWCRwYu7a+ohGR2cw4S360MRHtx60w8KRKA+NVSw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:9153:b0:710:5798:44de with SMTP id
 d2e1a72fcca58-7106cf97a92mr55487b3a.2.1722889082012; Mon, 05 Aug 2024
 13:18:02 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:18 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-24-tavip@google.com>
Subject: [RFC PATCH 23/23] hw/arm: add RT595-EVK board
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: TxRyrMzd/hMt

Add basic support for the RT595-EVK board, enough to be able to run
the NXP's microXpresso SDK hello world example.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/Kconfig     |  5 ++++
 hw/arm/meson.build |  1 +
 hw/arm/rt595-evk.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 hw/arm/rt595-evk.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7ffece3dec..26ec3d391a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -720,3 +720,8 @@ config RT500
     select RT500_CLKCTL1
     select FLEXSPI
     select RT500_RSTCTL
+
+config RT595_EVK
+    bool
+    default y
+    select RT500
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 7d827d512c..9792c93142 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -60,6 +60,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-e
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
 arm_ss.add(when: 'CONFIG_RT500', if_true: files('rt500.c'))
+arm_ss.add(when: 'CONFIG_RT595_EVK', if_true: files('rt595-evk.c'))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/hw/arm/rt595-evk.c b/hw/arm/rt595-evk.c
new file mode 100644
index 0000000000..fff3004195
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
+#include "hw/misc/unimp.h"
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
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->ignore_memory_transaction_failures = true;
+}
+
+DEFINE_MACHINE("rt595-evk", rt595_evk_machine_init);
-- 
2.46.0.rc2.264.g509ed76dc8-goog
