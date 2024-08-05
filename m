Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986543njb;
        Mon, 5 Aug 2024 13:17:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyfWcYUe5ZkaoVUaqA6W7wDheZ+EXgdYTHbqBYrp/TQNdPw99OmYSyBpQGlc8LtcZju45NLKtE8+Y8A1f6Y0QOiTikKQ0h
X-Received: by 2002:a05:6870:648c:b0:25e:d62:f297 with SMTP id 586e51a60fabf-26891ee2906mr15055644fac.45.1722889075733;
        Mon, 05 Aug 2024 13:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889075; cv=none;
        d=google.com; s=arc-20160816;
        b=ru3IwKJVN1SYqYD1zjMrZb8t7jgz6Pi6fD1VmdBY+e4orHTIxZYX/ydcfUUDC9Dvh3
         s7qalIj9tt+SQX5KsU0tdIj/WfGhmxkrf+o6p9yBmXyUR39VDji49Zl6phGTpqM130kd
         wMaNxwENsBy/KF1mKMuWGkk5QFxUuL2yLj7XpVRmxaa6ScPOHiiNWkRap2Rx5BnFsThy
         zbIA/qnyIm0fcrnmVWL4tgmKq7a41IOhuNloMAHF82xsDR7+d2ai6fSLZqYmaOPjx2iK
         hAYggGk4szytPG1FkW7UiX4Z7FNKRYpkdKQ5hoLBv81rmV7pWRnvHVr97cgVA81eEENZ
         83aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=TDXUM/DnNUUyn6pHbVPdEoD8ZybpFrPwu+WD1vFxHS8=;
        fh=HzxJ6ZXU//28qdZq7NkbO76xpBUEdu6UG5pqaEi7QBE=;
        b=X8JiWfrKXAsQKIV4Irp/coWa+YkvStz9bayXGMgGJSkZCr1/9246JKrntez/O3Y6Md
         x+rqM4Rbl++T+Ub9a6D3LVcS+W9fM3O+owAF0LpxYkd2qTEMtkMvR/Ws4cYmsXhN0++S
         EFlrvGuGgutlfljgSRcjgSfGDYGa1RjFoM52nDxxfYrTDK6mYCtWpdSTPUPg+nS/6UEU
         6vX0ZiV/dzEzpKwyoEt//voA87p9lBaM9UcfikjylI0vIGtK8Ez+nyjx32kRT527WN6K
         deuP8nMEIIZooIqzDVW3TTPcTmXAQIeIBr5bArWgZAU2hMZh4NLbULPu32RRDMkCPZTT
         Xb0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=j1BiepgW;
       spf=pass (google.com: domain of 3cjoxzgukc9ko5qdkbjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3cjOxZgUKC9kO5QDKBJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3cjOxZgUKC9kO5QDKBJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 41be03b00d2f7-7b765c98258sor5636121a12.9.2024.08.05.13.17.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3cjoxzgukc9ko5qdkbjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=j1BiepgW;
       spf=pass (google.com: domain of 3cjoxzgukc9ko5qdkbjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3cjOxZgUKC9kO5QDKBJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889075; x=1723493875; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDXUM/DnNUUyn6pHbVPdEoD8ZybpFrPwu+WD1vFxHS8=;
        b=j1BiepgWA5m/0hpyrZ0q7WXDSJ/HrIDiNdubn4b0R5XqSKumQPnJzJr9d1YsWnDgDK
         nS7+vZ2LUs8lNI3FjLSRzS2Gyi6B5nLsb0mM5efHaI9N+F77+i09qAwYTGHO5Jftb+8F
         wGA455mpqDtrc34kix2IsgksXU+Lpb2vAIJAp8jDEnHOkmS/JG/26YKmCtHjKqDWbKFL
         buBjfznF5KL8l6m7uFTlsFS1te07GOS/F9MFDM9vgpTnosomAVQMTeP6mA1YDmT5v3f4
         3v5Rw3syu7/0qtYWd+H0RLwdq1USWWYdf9FU2o9jK5KciGEuhSXF95OzqhtOl/DXaBKT
         eH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889075; x=1723493875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDXUM/DnNUUyn6pHbVPdEoD8ZybpFrPwu+WD1vFxHS8=;
        b=qUat/UwrWgY2FZwra3bOnmFyIJThE7S6d0SelnYijoePqPV/aF2XdECYIoZ5acK7gh
         hkkyc5fIJuw+jKFiNXDrxr7M3b6v4NA9mX863g7ZyBQfkTKQM7TWu3T2aAVrvrfbwZlr
         xwQsqCwmRMtVheYbz1N3ZGsJ/TJ0hxHMAUiFkfFvcNVlouY5/1HQLjhVPEFuOhPmQyLY
         8RM8PDooPnDL2G2psXHZUXb3rBoMfhzVPjvt8fsiMdeR6i8VeseNzqDJsFmJT/baVJGM
         L0F4XIJjElwlfktAfdn2Bw71tYgrymDe6hPUkk8bt2bteWR0fHWNzbiQLKj1xlWaKnsJ
         lBNA==
X-Forwarded-Encrypted: i=1; AJvYcCUb4k25AL59BOxHWhHIFVM5p33qoFjKcTtmzQWiBXKL8heGNG6W+K0arDzLGheS+DIyw7uO97lOdbI3i0GfAGFkYukHvfAS
X-Gm-Message-State: AOJu0YwotKugY5Gasj9sgHXeegseFkXEuGwhPAd2+z5D25BkmRGqmfsW
	is+WNBLMVp4xnsRk5E3gmZFPahGeqwCTf+TJgT3ziTVUAczXeILJ+/2WvrtB0dE2kyr0DMtJZA=
	=
X-Google-Smtp-Source: AGHT+IFnbKW0982idR2ThGvBGZQLmLXkxC9szOhbfZs08+ppAvucuotVSSXrQPXEto+7IAj1EGypCgRzBg==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90b:1b05:b0:2ca:7e66:2d90 with SMTP id
 98e67ed59e1d1-2cff955f924mr72168a91.7.1722889074724; Mon, 05 Aug 2024
 13:17:54 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:14 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-20-tavip@google.com>
Subject: [RFC PATCH 19/23] test/unit: add unit tests for RT500's clock controller
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 68pF+QE4cbqr

Add test to exercise clocks set and clear, system PLL initialization,
audio PLL initialization, systick and ostimer clock source selection.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/meson.build         |   7 +
 tests/unit/test-rt500-clkctl.c | 270 +++++++++++++++++++++++++++++++++
 2 files changed, 277 insertions(+)
 create mode 100644 tests/unit/test-rt500-clkctl.c

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 7a28e7b521..be3062acbf 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -188,6 +188,13 @@ if have_system
       meson.project_source_root() / 'hw/ssi/ssi.c',
       'spi_tester.c',
     ],
+    'test-rt500-clkctl': [
+      hwcore,
+      meson.project_source_root() / 'hw/core/gpio.c',
+      meson.project_source_root() / 'hw/misc/rt500_clkctl0.c',
+      meson.project_source_root() / 'hw/misc/rt500_clkctl1.c',
+      meson.project_source_root() / 'tests/unit/sysbus-mock.c',
+    ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
     tests += {'test-util-filemonitor': []}
diff --git a/tests/unit/test-rt500-clkctl.c b/tests/unit/test-rt500-clkctl.c
new file mode 100644
index 0000000000..9312091c46
--- /dev/null
+++ b/tests/unit/test-rt500-clkctl.c
@@ -0,0 +1,270 @@
+/*
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "exec/memory.h"
+#include "hw/clock.h"
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/misc/rt500_clkctl0.h"
+#include "hw/misc/rt500_clkctl1.h"
+#include "hw/misc/rt500_clk_freqs.h"
+#include "sysbus-mock.h"
+#include "reg-utils.h"
+
+typedef struct {
+    DeviceState *clk0;
+    DeviceState *clk1;
+    Clock *sysclk;
+    Clock *systick_clk;
+    Clock *ostimer_clk;
+} TestFixture;
+
+#define SYSCLK_HZ 100000000
+
+#define RT500_CLKCTL0_BASE 0x40001000UL
+#define RT500_CLKCTL1_BASE 0x40021000UL
+
+/*
+ * Test fixture initialization.
+ */
+static void set_up(TestFixture *f, gconstpointer data)
+{
+    f->clk0 = qdev_new(TYPE_RT500_CLKCTL0);
+    g_assert(f->clk0);
+
+    f->clk1 = qdev_new(TYPE_RT500_CLKCTL1);
+    g_assert(f->clk1);
+
+    f->sysclk = clock_new(OBJECT(&f->clk0->parent_obj), "SYSCLK");
+    clock_set_hz(f->sysclk, SYSCLK_HZ);
+
+    qdev_connect_clock_in(f->clk0, "sysclk", f->sysclk);
+    f->systick_clk = RT500_CLKCTL0(f->clk0)->systick_clk;
+
+    qdev_connect_clock_in(f->clk1, "sysclk", f->sysclk);
+    f->ostimer_clk = RT500_CLKCTL1(f->clk1)->ostimer_clk;
+
+    qdev_realize_and_unref(f->clk0, NULL, NULL);
+    sysbus_mmio_map(SYS_BUS_DEVICE(f->clk0), 0, RT500_CLKCTL0_BASE);
+
+    qdev_realize_and_unref(f->clk1, NULL, NULL);
+    sysbus_mmio_map(SYS_BUS_DEVICE(f->clk1), 0, RT500_CLKCTL1_BASE);
+
+    device_cold_reset(f->clk0);
+    device_cold_reset(f->clk1);
+}
+
+static void tear_down(TestFixture *f, gconstpointer user_data)
+{
+    qdev_unrealize(f->clk0);
+    qdev_unrealize(f->clk1);
+    g_free(f->clk0);
+    g_free(f->clk1);
+}
+
+#undef CLKCTL0
+#undef CLKCTL1
+
+static void pscctl_test(TestFixture *f, gconstpointer user_data)
+{
+    /* rom controller clock should be enabled at reset */
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, PSCCTL0, ROM_CTRLR_CLK)
+             == 1);
+
+    /* DSP clk is disabled at reset */
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, PSCCTL0, DSP_CLK) == 0);
+
+    /* check PSCTL_SET functionality */
+    REG32_WRITE(f->clk0, RT500_CLKCTL0, PSCCTL0_SET,
+                RT500_CLKCTL0_PSCCTL0_DSP_CLK_Msk);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, PSCCTL0, DSP_CLK) == 1);
+
+    /* check PSCTL_CLR functionality */
+    REG32_WRITE(f->clk0, RT500_CLKCTL0, PSCCTL0_CLR,
+                RT500_CLKCTL0_PSCCTL0_DSP_CLK_Msk);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, PSCCTL0, DSP_CLK) == 0);
+
+    /* FLEXIO clk is disabled at reset */
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, PSCCTL0, FlexIO) == 0);
+
+    /* check PSCTL_SET functionality */
+    REG32_WRITE(f->clk1, RT500_CLKCTL1, PSCCTL0_SET,
+                RT500_CLKCTL1_PSCCTL0_FlexIO_Msk);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, PSCCTL0, FlexIO) == 1);
+
+    /* check PSCTL_CLR functionality */
+    REG32_WRITE(f->clk1, RT500_CLKCTL1, PSCCTL0_CLR,
+                RT500_CLKCTL1_PSCCTL0_FlexIO_Msk);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, PSCCTL0, FlexIO) == 0);
+}
+
+static void audiopll0pfd_test(TestFixture *f, gconstpointer user_data)
+{
+    /*  audio plls are gated at boot */
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD,
+                              PFD3_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD,
+                              PFD2_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD,
+                              PFD1_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD,
+                              PFD0_CLKGATE) == 1);
+
+    /*  ,,, and clocks are not ready */
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD3_CLKRDY)
+             == 0);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD2_CLKRDY)
+             == 0);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD1_CLKRDY)
+             == 0);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD0_CLKRDY)
+             == 0);
+
+    /* ungate all plls and check that clocks are ready */
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD3_CLKGATE, 0);
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD2_CLKGATE, 0);
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD1_CLKGATE, 0);
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD0_CLKGATE, 0);
+
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD3_CLKRDY)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD2_CLKRDY)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD1_CLKRDY)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk1, RT500_CLKCTL1, AUDIOPLL0PFD, PFD0_CLKRDY)
+             == 1);
+}
+
+static void syspll0pfd_test(TestFixture *f, gconstpointer user_data)
+{
+    /*  system plls are gated at boot */
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKGATE)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKGATE)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKGATE)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKGATE)
+             == 1);
+
+    /*  ,,, and clocks are not ready */
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKRDY)
+             == 0);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKRDY)
+             == 0);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKRDY)
+             == 0);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKRDY)
+             == 0);
+
+    /* ungate all plls and check that clocks are ready */
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKGATE, 0);
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKGATE, 0);
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKGATE, 0);
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKGATE, 0);
+
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKRDY)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKRDY)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKRDY)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->clk0, RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKRDY)
+             == 1);
+}
+
+static void systick_clk_test(TestFixture *f, gconstpointer user_data)
+{
+    /* systick is not running at reset */
+    g_assert(clock_get_hz(f->systick_clk) == 0);
+
+    /* select divout no divisor */
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                    SYSTICKFCLKSEL_DIVOUT);
+    g_assert(clock_get_hz(f->systick_clk) == SYSCLK_HZ);
+
+    /* change divisor to 2 */
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSTICKFCLKDIV, DIV, 1);
+    g_assert(clock_get_hz(f->systick_clk) == SYSCLK_HZ / 2);
+
+    /* select lpsoc */
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                    SYSTICKFCLKSEL_LPOSC);
+    g_assert(clock_get_hz(f->systick_clk) == LPOSC_CLK_HZ);
+
+    /* select lpsoc */
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                    SYSTICKFCLKSEL_32KHZRTC);
+    g_assert(clock_get_hz(f->systick_clk) == RTC32KHZ_CLK_HZ);
+
+    /* disable clock */
+    REG32_WRITE_FIELD(f->clk0, RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                    SYSTICKFCLKSEL_NONE);
+    g_assert(clock_get_hz(f->systick_clk) == 0);
+}
+
+static void ostimer_clk_test(TestFixture *f, gconstpointer user_data)
+{
+    /* systick is not running at reset */
+    g_assert(clock_get_hz(f->ostimer_clk) == 0);
+
+    /* select lpsoc */
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                    OSEVENTTFCLKSEL_LPOSC);
+    g_assert(clock_get_hz(f->ostimer_clk) == LPOSC_CLK_HZ);
+
+
+    /* select 32khz RTC */
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                    OSEVENTTFCLKSEL_32KHZRTC);
+    g_assert(clock_get_hz(f->ostimer_clk) == RTC32KHZ_CLK_HZ);
+
+    /* select hclk */
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                    OSEVENTTFCLKSEL_HCLK);
+    g_assert(clock_get_hz(f->ostimer_clk) == SYSCLK_HZ);
+
+    /* disable clock */
+    REG32_WRITE_FIELD(f->clk1, RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                    OSEVENTTFCLKSEL_NONE);
+    g_assert(clock_get_hz(f->ostimer_clk) == 0);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    /* Initialize object types. */
+    sysbus_mock_init();
+    module_call_init(MODULE_INIT_QOM);
+
+    g_test_add("/rt500-clkctl/pscctl-test", TestFixture, NULL,
+               set_up, pscctl_test, tear_down);
+
+    g_test_add("/rt500-clkctl/syspll0pfd-test", TestFixture, NULL,
+               set_up, syspll0pfd_test, tear_down);
+
+    g_test_add("/rt500-clkctl/audiopll0pfd-test", TestFixture, NULL,
+               set_up, audiopll0pfd_test, tear_down);
+
+    g_test_add("/rt500-clkctl/systick-test", TestFixture, NULL,
+               set_up, systick_clk_test, tear_down);
+
+    g_test_add("/rt500-clkctl/ostimer-clk-test", TestFixture, NULL,
+               set_up, ostimer_clk_test, tear_down);
+
+    return g_test_run();
+}
-- 
2.46.0.rc2.264.g509ed76dc8-goog
