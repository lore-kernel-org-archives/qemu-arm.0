Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3637901ejd;
        Sun, 21 Apr 2024 07:06:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4Q6n2SK27Cy19ob17QsP1E2JVT5QDg8/t2IK0mAzNTZouORifWhX+8cQi8NKFBqcOaD5VC9O8GA+rvj2qxcYjrFj9vnyk
X-Google-Smtp-Source: AGHT+IEVrQtl7+5mc4fjRquuFXZf4IQQn7ao+bvsRUh43ovVmGSXE6xsFS/okQJbKW6ktex5Arvn
X-Received: by 2002:a05:6214:5c7:b0:69b:2664:cda2 with SMTP id t7-20020a05621405c700b0069b2664cda2mr8024604qvz.8.1713708399309;
        Sun, 21 Apr 2024 07:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713708399; cv=none;
        d=google.com; s=arc-20160816;
        b=OgshMlvqBt0DKqk4KaK9ByerjPgnyeTpCzsxluUJI5WZK3M3vaYfI9vx1lr/Vzj4mm
         8SGxXAYPRUW1Jj9oIPJbXHbWPhtQmlCrBZGWvladRPgMZda3e8M7yHYV4aR6fYy9OOU/
         +HJsZ9bGGZtSZXqS7m9LTVSgjRFERtT5rc871NOyxXDFkCFJfH1P9iVcBxTri3vEq/vJ
         LXDtXmbFwtsnBhI6RUI7o/hgq7E9EYKoE7IXdmKngmwuTwuuZIVIm+pVmP0QL6aM8UOu
         mjtLJ+GotzZ8Y+4+vUPQ1+UMokNh19giq+GRdYsRxWSXZwOrElSp5IGaevzzGVw2cejB
         7WEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=5CFKEPqz+1ZcgxhABmTozLTGT1xbD7H5nOrjny7q8kM=;
        fh=qCKTD+AnYCGca/qkg8saz3FMbn1gCujqEM1vfcJsKaM=;
        b=IPOx6FHWASHSU7R0vxyNmH94R+3UzCQYb8clbj7UCWiMNTTmOrvMETlyexbj9Gik71
         aQPj6NQDO54cnNRfNlrRGghRmQ1nazHPVxOyBPgUu+hq/jZ3EzaAipat2lNOmc5No5ax
         AVHBRHL2K+gujdfqxpq2E+gKFe2ZU0Zdr721X3gfSDOxpeAo95Koo1ZQ3JmNavy9tocT
         mZlQK5bWne5/RZo6GcvHkIEKGtRgmb7E2XpHw5DULINcWCTAMg7z2PtRURKuElvuu16R
         /N6Bf80IAEg1x0SVIgsDoV5sR7uZGwE2IFvlKGoJ7Jr1YmNdjZHux4ITS8JGJDTn5EQk
         cieg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=ETy7ZurZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv7-20020a056214240700b0069b4c1a50easi5820755qvb.520.2024.04.21.07.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Apr 2024 07:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=ETy7ZurZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryXps-0001RC-MJ; Sun, 21 Apr 2024 10:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1ryXpo-0001Pd-2c; Sun, 21 Apr 2024 10:06:24 -0400
Received: from zproxy4.enst.fr ([2001:660:330f:2::df])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1ryXpk-0008Kz-CJ; Sun, 21 Apr 2024 10:06:23 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 8BC1320641;
 Sun, 21 Apr 2024 16:06:17 +0200 (CEST)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id VUCAIoKKxz3b; Sun, 21 Apr 2024 16:06:17 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 10F882058E;
 Sun, 21 Apr 2024 16:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr 10F882058E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1713708377;
 bh=5CFKEPqz+1ZcgxhABmTozLTGT1xbD7H5nOrjny7q8kM=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=ETy7ZurZKTWBcfJSWVYPYpaBRHD6tMF8TjfZSPhSsW8SkCrES+MWeVYWCwJkRn+6T
 SX3y3nDwmdiNAOutSP1RVKWFDBjZLMwjrySEP2qzr65XnrzrV/VBXcFFhSmkbYPMvi
 7Jh4RAWKJzlg3zqvIHJVLLvDY0hwbuG03tJKaVEA=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id ajHVnndBjG5N; Sun, 21 Apr 2024 16:06:16 +0200 (CEST)
Received: from inesv-Inspiron-3501.. (unknown
 [IPv6:2a02:1808:204:e56c:d081:2a7:415b:bbbd])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id 158CC20600;
 Sun, 21 Apr 2024 16:06:16 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 4/5] hw/arm : Connect DM163 to B-L475E-IOT01A
Date: Sun, 21 Apr 2024 16:02:47 +0200
Message-ID: <20240421140604.111262-5-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240421140604.111262-1-ines.varhol@telecom-paris.fr>
References: <20240421140604.111262-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::df;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy4.enst.fr
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
X-TUID: O0Ls1gLB6B0a

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
---
 hw/arm/b-l475e-iot01a.c | 59 +++++++++++++++++++++++++++++++++++++++--
 hw/arm/Kconfig          |  1 +
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
index 970c637ce6..5002a40f06 100644
--- a/hw/arm/b-l475e-iot01a.c
+++ b/hw/arm/b-l475e-iot01a.c
@@ -27,10 +27,37 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-#include "hw/arm/stm32l4x5_soc.h"
 #include "hw/arm/boot.h"
+#include "hw/core/split-irq.h"
+#include "hw/arm/stm32l4x5_soc.h"
+#include "hw/gpio/stm32l4x5_gpio.h"
+#include "hw/display/dm163.h"
+
+/* B-L475E-IOT01A implementation is inspired from netduinoplus2 and ardu=
ino */
=20
-/* B-L475E-IOT01A implementation is derived from netduinoplus2 */
+/*
+ * There are actually 14 input pins in the DM163 device.
+ * Here the DM163 input pin EN isn't connected to the STM32L4x5
+ * GPIOs as the IM120417002 colors shield doesn't actually use
+ * this pin to drive the RGB matrix.
+ */
+#define NUM_DM163_INPUTS 13
+
+static const unsigned dm163_input[NUM_DM163_INPUTS] =3D {
+    1 * GPIO_NUM_PINS + 2,  /* ROW0  PB2       */
+    0 * GPIO_NUM_PINS + 15, /* ROW1  PA15      */
+    0 * GPIO_NUM_PINS + 2,  /* ROW2  PA2       */
+    0 * GPIO_NUM_PINS + 7,  /* ROW3  PA7       */
+    0 * GPIO_NUM_PINS + 6,  /* ROW4  PA6       */
+    0 * GPIO_NUM_PINS + 5,  /* ROW5  PA5       */
+    1 * GPIO_NUM_PINS + 0,  /* ROW6  PB0       */
+    0 * GPIO_NUM_PINS + 3,  /* ROW7  PA3       */
+    0 * GPIO_NUM_PINS + 4,  /* SIN (SDA) PA4   */
+    1 * GPIO_NUM_PINS + 1,  /* DCK (SCK) PB1   */
+    2 * GPIO_NUM_PINS + 3,  /* RST_B (RST) PC3 */
+    2 * GPIO_NUM_PINS + 4,  /* LAT_B (LAT) PC4 */
+    2 * GPIO_NUM_PINS + 5,  /* SELBK (SB)  PC5 */
+};
=20
 #define TYPE_B_L475E_IOT01A MACHINE_TYPE_NAME("b-l475e-iot01a")
 OBJECT_DECLARE_SIMPLE_TYPE(Bl475eMachineState, B_L475E_IOT01A)
@@ -39,12 +66,16 @@ typedef struct Bl475eMachineState {
     MachineState parent_obj;
=20
     Stm32l4x5SocState soc;
+    SplitIRQ gpio_splitters[NUM_DM163_INPUTS];
+    DM163State dm163;
 } Bl475eMachineState;
=20
 static void bl475e_init(MachineState *machine)
 {
     Bl475eMachineState *s =3D B_L475E_IOT01A(machine);
     const Stm32l4x5SocClass *sc;
+    DeviceState *dev, *gpio_out_splitter;
+    unsigned gpio, pin;
=20
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             TYPE_STM32L4X5XG_SOC);
@@ -53,6 +84,30 @@ static void bl475e_init(MachineState *machine)
     sc =3D STM32L4X5_SOC_GET_CLASS(&s->soc);
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0,
                        sc->flash_size);
+
+    if (object_class_by_name(TYPE_DM163)) {
+        object_initialize_child(OBJECT(machine), "dm163",
+                                &s->dm163, TYPE_DM163);
+        dev =3D DEVICE(&s->dm163);
+        qdev_realize(dev, NULL, &error_abort);
+
+        for (unsigned i =3D 0; i < NUM_DM163_INPUTS; i++) {
+            object_initialize_child(OBJECT(machine), "gpio-out-splitters=
[*]",
+                                    &s->gpio_splitters[i], TYPE_SPLIT_IR=
Q);
+            gpio_out_splitter =3D DEVICE(&s->gpio_splitters[i]);
+            qdev_prop_set_uint32(gpio_out_splitter, "num-lines", 2);
+            qdev_realize(gpio_out_splitter, NULL, &error_fatal);
+
+            qdev_connect_gpio_out(gpio_out_splitter, 0,
+                qdev_get_gpio_in(DEVICE(&s->soc), dm163_input[i]));
+            qdev_connect_gpio_out(gpio_out_splitter, 1,
+                qdev_get_gpio_in(dev, i));
+            gpio =3D dm163_input[i] / GPIO_NUM_PINS;
+            pin =3D dm163_input[i] % GPIO_NUM_PINS;
+            qdev_connect_gpio_out(DEVICE(&s->soc.gpio[gpio]), pin,
+                qdev_get_gpio_in(DEVICE(gpio_out_splitter), 0));
+        }
+    }
 }
=20
 static void bl475e_machine_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 893a7bff66..8431384402 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -468,6 +468,7 @@ config B_L475E_IOT01A
     default y
     depends on TCG && ARM
     select STM32L4X5_SOC
+    imply DM163
=20
 config STM32L4X5_SOC
     bool
--=20
2.43.2

