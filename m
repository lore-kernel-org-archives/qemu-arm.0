Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1018274ejc;
        Sun, 5 May 2024 07:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUm/RReNjnXJgsG0S7ltUfGTnPN5dC9K7/hEsU/WP3Fj8cvPzfXqPo0nM22Q9ziV1PDO5tWXOMMe5lKr3/u/p1/xb48WFn6
X-Google-Smtp-Source: AGHT+IH1hJ5gdNkr4o/lxyrI7iuQoNIhoOS3r/PXSf47hrzoKL3C5hk+BIW0Y8Lg+g2hcu7bTE3y
X-Received: by 2002:a05:622a:180a:b0:43a:f443:d127 with SMTP id t10-20020a05622a180a00b0043af443d127mr8669363qtc.49.1714917995990;
        Sun, 05 May 2024 07:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714917995; cv=none;
        d=google.com; s=arc-20160816;
        b=iA3O6MRALr2sd89/KPwgngV+HM1GibtA19+WruCNlztHr9m3HwWP+hBO7xM/fM9Zv5
         DokQoCVbiG4VrPwzNCWEgs6RqBHtJouDYCHiaz5L6Q0SQO6sKFMwTw+02KALRaqIqj/1
         /3oWpliyaIq+TPgCLjmiFi9h+38t4J2tsqvXsDjdUNrZh6f69LVaFehV/YbP818tjsqM
         JH0bqQYbQE7qEfS6YE6mP/NSt79hBnyGlgJ/MGjStB4Lrs5A/pfkfBZyv5mGoQQMfwSe
         1uKu1ABwWQbWBTRY4d0BzJ0KzYE+pY/1inY0PaBVmWcW5G3eJhJ9+A6LbJtH6rjIY5GM
         Qx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=PQrO98JAVg+dMsiZ3wMPO7MlqpV4mBVU/7/oZd0u37c=;
        fh=HZifwXm5fvflHYf2cbKVplOT47ne2uF6SUUZ3w7LV4M=;
        b=gu9WnoFyWJZOOSIS9gRRAEFcd98kMdnO9NjLruebUs7pIg0cqSyoCIGZ6KTKECUD/v
         Xu9rFUZP/dv2ZBxHPDaU/0d1dLrvoku4ILro52HJ91ZUsRcYTzPXTepBPa05tLySGkB0
         fqWkxFb7+nPTtWm0QpGoEQvRwasddVNZVXmwOn4HvhF8Qi/QnW8a72ANYJ6KbPU7rfKS
         vqNF5/i1mzFRt9irtuYKtvngKC3f59w8Ws9JEqOQiQbgAjpDE5Z2IPG+nPOt6mNE6AJN
         cFFXfFIiOAzCGzaB5QA9aEANMzBuGRCLgQ/NGKHPtjQwLZqsTubPtDd7ouK1UmEhd3VY
         NSkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="Cy/QkrCW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020ac85a82000000b0043b0757e44asi7358880qtc.271.2024.05.05.07.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 07:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="Cy/QkrCW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3cVN-0005u5-Tl; Sun, 05 May 2024 10:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cVK-0005su-Jj; Sun, 05 May 2024 10:06:14 -0400
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cVH-00085q-2m; Sun, 05 May 2024 10:06:14 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 33FCAA0748;
 Sun,  5 May 2024 16:06:05 +0200 (CEST)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id B88WY9VTXHwk; Sun,  5 May 2024 16:06:04 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 9A729A072C;
 Sun,  5 May 2024 16:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 9A729A072C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1714917964;
 bh=PQrO98JAVg+dMsiZ3wMPO7MlqpV4mBVU/7/oZd0u37c=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=Cy/QkrCWmo7xJnmER4B4hRj5UYp+n87UKywEUEQYl4prGvWV2HYWD7ECyKXkNL1Wu
 VHhK8njZldQE9mJ8+vTBP5xQLD/4bmVa2LLtqY2SqHLqe7BW/eIdCDT92gutL7/wQf
 Z6oPACW110gRSQkoWCd0BHprhwLl4QpV8FzZz2Hs=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id 9zqfmn7Q7a1F; Sun,  5 May 2024 16:06:04 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id A03CFA06D1;
 Sun,  5 May 2024 16:06:03 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/4] hw/misc: Create STM32L4x5 SYSCFG clock
Date: Sun,  5 May 2024 16:05:03 +0200
Message-ID: <20240505140556.373711-2-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: L6ZlLZq6rqe7

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 include/hw/misc/stm32l4x5_syscfg.h |  1 +
 hw/arm/stm32l4x5_soc.c             |  2 ++
 hw/misc/stm32l4x5_syscfg.c         | 26 ++++++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/include/hw/misc/stm32l4x5_syscfg.h b/include/hw/misc/stm32l4=
x5_syscfg.h
index 23bb564150..c450df2b9e 100644
--- a/include/hw/misc/stm32l4x5_syscfg.h
+++ b/include/hw/misc/stm32l4x5_syscfg.h
@@ -48,6 +48,7 @@ struct Stm32l4x5SyscfgState {
     uint32_t swpr2;
=20
     qemu_irq gpio_out[GPIO_NUM_PINS];
+    Clock *clk;
 };
=20
 #endif
diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index 38f7a2d5d9..fb2afa6cfe 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -236,6 +236,8 @@ static void stm32l4x5_soc_realize(DeviceState *dev_so=
c, Error **errp)
=20
     /* System configuration controller */
     busdev =3D SYS_BUS_DEVICE(&s->syscfg);
+    qdev_connect_clock_in(DEVICE(&s->syscfg), "clk",
+        qdev_get_clock_out(DEVICE(&(s->rcc)), "syscfg-out"));
     if (!sysbus_realize(busdev, errp)) {
         return;
     }
diff --git a/hw/misc/stm32l4x5_syscfg.c b/hw/misc/stm32l4x5_syscfg.c
index a5a1ce2680..a82864c33d 100644
--- a/hw/misc/stm32l4x5_syscfg.c
+++ b/hw/misc/stm32l4x5_syscfg.c
@@ -26,6 +26,10 @@
 #include "trace.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "hw/clock.h"
+#include "hw/qdev-clock.h"
+#include "qapi/visitor.h"
+#include "qapi/error.h"
 #include "hw/misc/stm32l4x5_syscfg.h"
 #include "hw/gpio/stm32l4x5_gpio.h"
=20
@@ -202,6 +206,14 @@ static void stm32l4x5_syscfg_write(void *opaque, hwa=
ddr addr,
     }
 }
=20
+static void clock_freq_get(Object *obj, Visitor *v,
+    const char *name, void *opaque, Error **errp)
+{
+    Stm32l4x5SyscfgState *s =3D STM32L4X5_SYSCFG(obj);
+    uint32_t clock_freq_hz =3D clock_get_hz(s->clk);
+    visit_type_uint32(v, name, &clock_freq_hz, errp);
+}
+
 static const MemoryRegionOps stm32l4x5_syscfg_ops =3D {
     .read =3D stm32l4x5_syscfg_read,
     .write =3D stm32l4x5_syscfg_write,
@@ -225,6 +237,18 @@ static void stm32l4x5_syscfg_init(Object *obj)
     qdev_init_gpio_in(DEVICE(obj), stm32l4x5_syscfg_set_irq,
                       GPIO_NUM_PINS * NUM_GPIOS);
     qdev_init_gpio_out(DEVICE(obj), s->gpio_out, GPIO_NUM_PINS);
+    s->clk =3D qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
+    object_property_add(obj, "clock-freq-hz", "uint32", clock_freq_get, =
NULL,
+                        NULL, NULL);
+}
+
+static void stm32l4x5_syscfg_realize(DeviceState *dev, Error **errp)
+{
+    Stm32l4x5SyscfgState *s =3D STM32L4X5_SYSCFG(dev);
+    if (!clock_has_source(s->clk)) {
+        error_setg(errp, "SYSCFG: clk input must be connected");
+        return;
+    }
 }
=20
 static const VMStateDescription vmstate_stm32l4x5_syscfg =3D {
@@ -241,6 +265,7 @@ static const VMStateDescription vmstate_stm32l4x5_sys=
cfg =3D {
         VMSTATE_UINT32(swpr, Stm32l4x5SyscfgState),
         VMSTATE_UINT32(skr, Stm32l4x5SyscfgState),
         VMSTATE_UINT32(swpr2, Stm32l4x5SyscfgState),
+        VMSTATE_CLOCK(clk, Stm32l4x5SyscfgState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -251,6 +276,7 @@ static void stm32l4x5_syscfg_class_init(ObjectClass *=
klass, void *data)
     ResettableClass *rc =3D RESETTABLE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_stm32l4x5_syscfg;
+    dc->realize =3D stm32l4x5_syscfg_realize;
     rc->phases.hold =3D stm32l4x5_syscfg_hold_reset;
 }
=20
--=20
2.43.2

