Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1283185ejb;
        Thu, 23 May 2024 12:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/dlYFV/wNHDyeNJgdsjGO3B1WufN9T+J13M62Mq+g7bF30HQ9OzEOq/C2ySwWhDDNBY1MoiW2KK1ruDSGRMvnBh7lM6Mu
X-Google-Smtp-Source: AGHT+IHm89ila2U8hzsQpwoIVRMzIrboo7bC9K5WeFd7pU7IsjFykkqWufObWxAOVG5O+QCeyzNm
X-Received: by 2002:a25:8244:0:b0:df1:cd00:b176 with SMTP id 3f1490d57ef6-df7721e223fmr213644276.39.1716493527796;
        Thu, 23 May 2024 12:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716493527; cv=none;
        d=google.com; s=arc-20160816;
        b=xo/qQwb+D30bSKdK5jvUpmLRjB+VyKfbPUNDgm9iK8cKgZjUXRrwwV2ijet9XjMYkH
         q5YivXEiTZ2y17FwhVV0BCbTOZNfYgECX/K4wpcLtnhqf60XilFGRdRpwyS3h74u7qNc
         AB+RBC6Lhu36rC38AVPzl0Wdf11FjEUzGK1bIH4yKYlYREfxNgFv8kJHhVK3Lv2PZkBd
         xRVdNo1+ABSsvh6OIYPumltw9cw7AS4petnNnnQfcB4Xs3XfTmtUsEb72xojujUr/zpw
         ft6qXQP/yPQZSZ1umSRhYJoHWJkRoxatTzDqj8KX8fcT8qmnpdTYNLFftnYYhnmu57Qb
         RUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=JTSUQ395YyQQEeQKpUIo3LUvk6G3z3GKNBQnfbt0BPc=;
        fh=eN0x/CTOvxxw5NUPtsJP+w8vf031I24wpq4YCOSTmPU=;
        b=DPEhz7TaUp1w5gh0NsDUSaFLDQOZBcMWqLoHKZEcKjkOmn/8OSOjlIW9PlkpITQRzm
         YaZH58MsM8oLY66ToR+U4/kcbhr3MfUWDHJUq2mJkZwFbQzOBN6ZnzRLpJzM0YosAjp1
         wdetMq02b9qic4qj3JyiyhEwhRCIN3W1Sut+/WBSDk5D/c15w+7cMyJnuCiP/JEMWAKf
         +WgnmT7WhDOS/oiuVT36kcSuOnT4MH1MeAHyf+mP0jsY4WeF+Oa4kziIx5qZXHZ0M+WC
         Y9psmjcDpDRK286tUo15EBOZWQzR8OB94fhKI8KgmJC/fqHwIKYuIEgNFo9uHobwsfMj
         ZOag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=oCyE5TQS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df54b557fsi110101141cf.213.2024.05.23.12.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 12:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=oCyE5TQS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sAEN6-00045r-QD; Thu, 23 May 2024 15:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sAEN1-0003qQ-Oy; Thu, 23 May 2024 15:45:00 -0400
Received: from zproxy1.enst.fr ([137.194.2.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sAEMw-00035K-Nz; Thu, 23 May 2024 15:44:59 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id A2303C067C;
 Thu, 23 May 2024 21:44:51 +0200 (CEST)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id a39n0n189nRp; Thu, 23 May 2024 21:44:50 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 7FF6FC0582;
 Thu, 23 May 2024 21:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr 7FF6FC0582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1716493490;
 bh=JTSUQ395YyQQEeQKpUIo3LUvk6G3z3GKNBQnfbt0BPc=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=oCyE5TQS0IE/OeL9JWgDBO8hVkVwSGqEsVdKgjAri4HHR8bYnToQ3OdmjFn17/6FD
 Le9PSJ0O39yhtw8cbiK6N3iNf4Yc3F8TkTZgJ+YWZaxYM7ih2ygf9AerUGqRnTHgfK
 ntIFTF9GQb/U343Q88am5PXA6Qsoas/3gEj9pwMM=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id VG0qXmmjHBE2; Thu, 23 May 2024 21:44:50 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id 7DEEFC0610;
 Thu, 23 May 2024 21:44:49 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Damien Hedde <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 1/4] hw/misc: Create STM32L4x5 SYSCFG clock
Date: Thu, 23 May 2024 21:41:47 +0200
Message-ID: <20240523194441.21036-2-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.220;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy1.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MpieiLFXWvhz

This commit creates a clock in STM32L4x5 SYSCFG and wires it up to the
corresponding clock from STM32L4x5 RCC.

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 include/hw/misc/stm32l4x5_syscfg.h |  1 +
 hw/arm/stm32l4x5_soc.c             |  2 ++
 hw/misc/stm32l4x5_syscfg.c         | 19 +++++++++++++++++--
 3 files changed, 20 insertions(+), 2 deletions(-)

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
index a5a1ce2680..a947a9e036 100644
--- a/hw/misc/stm32l4x5_syscfg.c
+++ b/hw/misc/stm32l4x5_syscfg.c
@@ -26,6 +26,9 @@
 #include "trace.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "hw/clock.h"
+#include "hw/qdev-clock.h"
+#include "qapi/error.h"
 #include "hw/misc/stm32l4x5_syscfg.h"
 #include "hw/gpio/stm32l4x5_gpio.h"
=20
@@ -225,12 +228,22 @@ static void stm32l4x5_syscfg_init(Object *obj)
     qdev_init_gpio_in(DEVICE(obj), stm32l4x5_syscfg_set_irq,
                       GPIO_NUM_PINS * NUM_GPIOS);
     qdev_init_gpio_out(DEVICE(obj), s->gpio_out, GPIO_NUM_PINS);
+    s->clk =3D qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
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
     .name =3D TYPE_STM32L4X5_SYSCFG,
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(memrmp, Stm32l4x5SyscfgState),
         VMSTATE_UINT32(cfgr1, Stm32l4x5SyscfgState),
@@ -241,6 +254,7 @@ static const VMStateDescription vmstate_stm32l4x5_sys=
cfg =3D {
         VMSTATE_UINT32(swpr, Stm32l4x5SyscfgState),
         VMSTATE_UINT32(skr, Stm32l4x5SyscfgState),
         VMSTATE_UINT32(swpr2, Stm32l4x5SyscfgState),
+        VMSTATE_CLOCK(clk, Stm32l4x5SyscfgState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -251,6 +265,7 @@ static void stm32l4x5_syscfg_class_init(ObjectClass *=
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

