Received: by 2002:a17:906:a892:b0:a44:c09:7745 with SMTP id ha18csp168333ejb;
        Wed, 28 Feb 2024 03:46:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUI2IxTPNMVqvNZRnjZT3vPZ8nca1M+7tqJ8Ic4x85lcRk+5mNPoav6HjlDcNSpFh0HRz2Al8Q6fG8fJeWrmbVyfN3pLsQ1
X-Google-Smtp-Source: AGHT+IEVN+9rrRsGXUvT2mldrVnz+guW6+zjM8YV4IcGGJ4auMIoqUnFOwoAnhHVrU2aPt7Rq+zO
X-Received: by 2002:a5b:9cd:0:b0:dcb:abbc:f597 with SMTP id y13-20020a5b09cd000000b00dcbabbcf597mr2191898ybq.54.1709120816905;
        Wed, 28 Feb 2024 03:46:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709120816; cv=none;
        d=google.com; s=arc-20160816;
        b=tr7CjunLzQ3AU7DMaLNwQCDyr4L18ARz4J8kW8oqcH2vU5j+dmXIEdCot/WnT1M7AP
         nG6dMFZVbfqEctIej6MBfMq3RBaLN8o87RLVrRkxneMPKAI7gQ0cePoSTAKfD2s8l2ZA
         W8UUTJabYl/+j3ZoKLnBG8OOjOMJlgOBfQ3yjANabMqKJXeyHtq1MojCiwTw+Go3EVcW
         byVvbMmnr3oihDOSFgUYAZoq91lfIjlofn48tNiIIM3NLoJUouC2ccYPd2WZ7rbfgLYM
         F/yv8Xxt6+hE3XvrLc1lg5fSIwN5yGeSSga/9VIcgAs6xOtIALH1HiQeGoRTG/C8hMSl
         Kmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=9yCAa2IaqsNHr0V/8Z3CfJJGrYjFNpZ6MWKqMGjZhOM=;
        fh=SXEQ4uOOc3uDrzcMFkl93DTKd5A7MrL4ch0TU9ebRdg=;
        b=Sz1IiUp1QThV7052vYi/GoF3R4rAsmjGn8k/j1KtaPz/mOy5Z7BU0/UmkPBBzcAeqe
         KbZCXJN7kTCkuRTnRArGXctUf9/UXwBBcCtPd7EQP+TUW8t2wgSNbk/3lcjb3kR2a7TK
         Y9/3NnAfp11jZOuf3uEy/ybGfnJb2wH80x9Oue0Rmx2Ag0UoMfqmpxH55mwKgn1F0pD8
         heUn51cK5oYxCCCgSb6N6uQfk0rvaEnApwCQFzI5ekCtMbp/xLuHA0uzqNcDWqsEUXiU
         DFeu2zZ6kjCl5DwQ95WAHVg3uug2v4aLXtcZ7T4Z8R7CsS//WWheAv1WKNoxyljfH9S3
         n0iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=OWH4l5pE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a05622a064a00b0042dfa21270bsi10406210qtb.605.2024.02.28.03.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 03:46:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=OWH4l5pE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfIOM-00060E-R5; Wed, 28 Feb 2024 06:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIO9-0005ta-EI; Wed, 28 Feb 2024 06:46:22 -0500
Received: from zproxy2.enst.fr ([2001:660:330f:2::dd])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIO7-0002BL-8u; Wed, 28 Feb 2024 06:46:16 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 87EA280659;
 Wed, 28 Feb 2024 12:46:08 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id vW1iydv7yZSb; Wed, 28 Feb 2024 12:46:03 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id C1A10806DC;
 Wed, 28 Feb 2024 12:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr C1A10806DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1709120763;
 bh=9yCAa2IaqsNHr0V/8Z3CfJJGrYjFNpZ6MWKqMGjZhOM=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=OWH4l5pEtz924socZpLC2c0Ta7j/UP6wmodIAHZYbn8cW9j93VIxMl6Fyxhs9d3ce
 RTI1BYbFcy2mSdtpzzXsVmOmnpDArbYusuD+IQw0Owy742S7JveHQBLRDtNbaAZSoy
 0wxs941IMs4Qqc9y+A8/z6jMHHhojl+L99wiE2fY=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id NZa0-mnXQD5g; Wed, 28 Feb 2024 12:46:03 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 3BAB1806C9;
 Wed, 28 Feb 2024 12:46:03 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 4/5] hw/arm : Connect DM163 to B-L475E-IOT01A
Date: Wed, 28 Feb 2024 12:32:02 +0100
Message-ID: <20240228114555.192175-5-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240228114555.192175-1-ines.varhol@telecom-paris.fr>
References: <20240228114555.192175-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dd;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2y/usvvLFu3p

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/arm/b-l475e-iot01a.c | 59 +++++++++++++++++++++++++++++++++++++++--
 hw/arm/Kconfig          |  1 +
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
index 2b570b3e09..6f0bf68ca6 100644
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
+static const int dm163_input[NUM_DM163_INPUTS] =3D {
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
+    int gpio, pin;
=20
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             TYPE_STM32L4X5XG_SOC);
@@ -53,6 +84,30 @@ static void bl475e_init(MachineState *machine)
     sc =3D STM32L4X5_SOC_GET_CLASS(&s->soc);
     armv7m_load_kernel(ARM_CPU(first_cpu),
         machine->kernel_filename, 0, sc->flash_size);
+
+    if (object_class_by_name("dm163")) {
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
index 5776dbb19f..6c05bac99b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -458,6 +458,7 @@ config B_L475E_IOT01A
     default y
     depends on TCG && ARM
     select STM32L4X5_SOC
+    imply DM163
=20
 config STM32L4X5_SOC
     bool
--=20
2.43.2

