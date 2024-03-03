Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2099794eja;
        Sun, 3 Mar 2024 06:10:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYSeugWCJtDTxQHebuRo3g0wEn5f+UPcCcT/zXfSeXporAR8NojqFTL7RbR9z+m/O37u9sEhXdjsWFnSVNELzD8p8si0Vh
X-Google-Smtp-Source: AGHT+IGTMV/iPxSWD4ZbNHNSR8P7uvhEjvR4/fJAmOaezQnPx/o0hH7vOtbIOrNrq4/PUHIaLw4q
X-Received: by 2002:a05:6808:1919:b0:3c1:a9c3:d411 with SMTP id bf25-20020a056808191900b003c1a9c3d411mr8951220oib.27.1709475048421;
        Sun, 03 Mar 2024 06:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709475048; cv=none;
        d=google.com; s=arc-20160816;
        b=G5x8qLLeq2AVL1u5DH/XgI23kqwFVOXlyQf6JwEJZFnfL3DnbG3z6QPPX7gufgRQJs
         MmM88D2YCzO4s3rQCUY/5c1rDv+L0x4qJcRDnLNU/Tch+aHiDVXgg0tNytz2rKnQAAZS
         2n8DoOlO4P/1loEmJhOPRmG4aHbRShUtAabNmFskSiy8f1KlJ5XSDen6g18GsR8RA/KE
         m8qyn5TIcYOCFBKaNBMLwMHfvxlx9B32FHtgw3x7VilIRikB6cGMt9P4IBPJGF1C3JD+
         SrnF5a6Bw9Gf0ZW6tBdIMRQzUMtbYD9DfaFDpGQpLJJUGGZmTvfpSp2SBW6xeegpvJVb
         YESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=Z6U9XiUMQxM2cBCu+yT1Dmp7L2Ykg+hJ/5IaiQyUgDE=;
        fh=ytucLf6Cj9eRKUjHIXh4+6nMjHevglmwTt5UOkw9wwA=;
        b=T90AZ8O/R/DT7OtaeXMwg9N1fsY01kfqtyOJBagbKEri6hWT085xBa6tbRAg1rcsgp
         aOuceib0KaP0XxMzvLU8gJHrzVYGRKaFYvuQb0iPp/tYRD73Vf7/yi5Bo+UDzcg5p1Jo
         AEKBjwcZAogK0k2PgVjxoWYSp9FrWRHewjGuYZzZ4SNXGeBGtoPXvX59FAEm0ZDD/oSA
         vmd/QM6sMe33UlM3ZXlRJrE/hanHd66GCLxoS+ABRd2bCDWQh/RbT1gFLRP4Bib/Auuz
         dypdxAqh5Ogd1Q6QUZ9iElXbYiTYzAXXa+Ljk2j/EQgQAmOHDCzXMQscIQO1nZrio4Hf
         y5oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=jQOBgdCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020ac84283000000b0042ebaea71a3si6953110qtl.261.2024.03.03.06.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Mar 2024 06:10:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=jQOBgdCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgmY1-0004tu-Qx; Sun, 03 Mar 2024 09:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rgmXv-0004sm-NU; Sun, 03 Mar 2024 09:10:31 -0500
Received: from zproxy2.enst.fr ([137.194.2.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rgmXk-0004uW-GT; Sun, 03 Mar 2024 09:10:31 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 0644C8061D;
 Sun,  3 Mar 2024 15:10:18 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id HSJg34gs1Y_Q; Sun,  3 Mar 2024 15:10:17 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 87C3680649;
 Sun,  3 Mar 2024 15:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr 87C3680649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1709475017;
 bh=Z6U9XiUMQxM2cBCu+yT1Dmp7L2Ykg+hJ/5IaiQyUgDE=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=jQOBgdCVEkSccYFdCbQbnfeu7O5lVhX3uEabarHpZLYKY3Gud5ucNeWjvuiP5WcDS
 8SNnRsTvFzvmYL4tcu427EQCZpzWkfb7CU7iPDKolwkOXdKPYjxAF7+Ql6Btwa5ggd
 A5n4uJz3L0J10XT+/Dtt5en2YtxOqkmsIbxOyrIM=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id 3rM7hES2nzCE; Sun,  3 Mar 2024 15:10:17 +0100 (CET)
Received: from AM-Inspiron-3585.. (cust-west-par-46-193-4-103.cust.wifirst.net
 [46.193.4.103])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 1B0718061D;
 Sun,  3 Mar 2024 15:10:17 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 7/8] hw/arm/stm32l4x5_soc.c: Use the RCC Sysclk
Date: Sun,  3 Mar 2024 15:06:42 +0100
Message-Id: <20240303140643.81957-8-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240303140643.81957-1-arnaud.minier@telecom-paris.fr>
References: <20240303140643.81957-1-arnaud.minier@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.221;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy2.enst.fr
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
X-TUID: souRNfACbzn1

Now that we can generate reliable clock frequencies from the RCC, remove
the hacky definition of the sysclk in the b_l475e_iot01a initialisation
code and use the correct RCC clock.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/b-l475e-iot01a.c        | 10 +---------
 hw/arm/stm32l4x5_soc.c         | 33 ++++-----------------------------
 include/hw/arm/stm32l4x5_soc.h |  3 ---
 3 files changed, 5 insertions(+), 41 deletions(-)

diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
index 6ecde2db15..d862aa43fc 100644
--- a/hw/arm/b-l475e-iot01a.c
+++ b/hw/arm/b-l475e-iot01a.c
@@ -26,27 +26,19 @@
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-#include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
 #include "hw/arm/stm32l4x5_soc.h"
 #include "hw/arm/boot.h"
=20
-/* Main SYSCLK frequency in Hz (80MHz) */
-#define MAIN_SYSCLK_FREQ_HZ 80000000ULL
+/* B-L475E-IOT01A implementation is derived from netduinoplus2 */
=20
 static void b_l475e_iot01a_init(MachineState *machine)
 {
     const Stm32l4x5SocClass *sc;
     DeviceState *dev;
-    Clock *sysclk;
-
-    /* This clock doesn't need migration because it is fixed-frequency *=
/
-    sysclk =3D clock_new(OBJECT(machine), "SYSCLK");
-    clock_set_hz(sysclk, MAIN_SYSCLK_FREQ_HZ);
=20
     dev =3D qdev_new(TYPE_STM32L4X5XG_SOC);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
-    qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
=20
     sc =3D STM32L4X5_SOC_GET_CLASS(dev);
diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index cb14705009..bf9926057b 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -110,9 +110,6 @@ static void stm32l4x5_soc_initfn(Object *obj)
     }
     object_initialize_child(obj, "syscfg", &s->syscfg, TYPE_STM32L4X5_SY=
SCFG);
     object_initialize_child(obj, "rcc", &s->rcc, TYPE_STM32L4X5_RCC);
-
-    s->sysclk =3D qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0)=
;
-    s->refclk =3D qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0)=
;
 }
=20
 static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -124,30 +121,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
     DeviceState *armv7m;
     SysBusDevice *busdev;
=20
-    /*
-     * We use s->refclk internally and only define it with qdev_init_clo=
ck_in()
-     * so it is correctly parented and not leaked on an init/deinit; it =
is not
-     * intended as an externally exposed clock.
-     */
-    if (clock_has_source(s->refclk)) {
-        error_setg(errp, "refclk clock must not be wired up by the board=
 code");
-        return;
-    }
-
-    if (!clock_has_source(s->sysclk)) {
-        error_setg(errp, "sysclk clock must be wired up by the board cod=
e");
-        return;
-    }
-
-    /*
-     * TODO: ideally we should model the SoC RCC and its ability to
-     * change the sysclk frequency and define different sysclk sources.
-     */
-
-    /* The refclk always runs at frequency HCLK / 8 */
-    clock_set_mul_div(s->refclk, 8, 1);
-    clock_set_source(s->refclk, s->sysclk);
-
     if (!memory_region_init_rom(&s->flash, OBJECT(dev_soc), "flash",
                                 sc->flash_size, errp)) {
         return;
@@ -177,8 +150,10 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
     qdev_prop_set_uint32(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m=
4"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
-    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
-    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
+    qdev_connect_clock_in(armv7m, "cpuclk",
+        qdev_get_clock_out(DEVICE(&(s->rcc)), "cortex-fclk-out"));
+    qdev_connect_clock_in(armv7m, "refclk",
+        qdev_get_clock_out(DEVICE(&(s->rcc)), "cortex-refclk-out"));
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(system_memory), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_so=
c.h
index 0b4f97e240..af67b089ef 100644
--- a/include/hw/arm/stm32l4x5_soc.h
+++ b/include/hw/arm/stm32l4x5_soc.h
@@ -54,9 +54,6 @@ struct Stm32l4x5SocState {
     MemoryRegion sram2;
     MemoryRegion flash;
     MemoryRegion flash_alias;
-
-    Clock *sysclk;
-    Clock *refclk;
 };
=20
 struct Stm32l4x5SocClass {
--=20
2.34.1

