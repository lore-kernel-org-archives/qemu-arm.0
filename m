Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp909609ejb;
        Mon, 19 Feb 2024 12:18:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBjaCnSJKv7aAO1unwsMqxR3sb1sl2s4+3jIsNhhDsmE7rmOGNQyk0dUo9vnGnULTWPfukBpU+8zBZbcZ+MardsxHpdBem
X-Google-Smtp-Source: AGHT+IHkG77anZdeqe+l87BWPWLsif1RgwQu44Buzk2ihLfbcx4piUCRXYPgINAO9VWx2inLHSTz
X-Received: by 2002:a37:c444:0:b0:785:8c17:dfa1 with SMTP id h4-20020a37c444000000b007858c17dfa1mr14998095qkm.61.1708373924239;
        Mon, 19 Feb 2024 12:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708373924; cv=none;
        d=google.com; s=arc-20160816;
        b=yG2xuii96Nbh7SZkNKPYSQ1Wa5gWeln4DuQVchTO31EnpZIVXzhO4I0qC6GHFkDRrl
         6+awCSiKyKVFDUZE7X6xwyIgmQ+ASaDEyRk8bPq+nUMEPIn/9Qkkui65I9sdel6wc/ym
         eu21YvAalil+RI8pKY+1FdFTHaIAFGi0ziDzSJkSe5peasYK6KnM0WWoTROav+ybY+J3
         7+qgZeYPuoiIulTYLHYm97bKUtemEFsFrQpg0CB8rJnxSVB1AGwDxgBxUPf7IBLWRitX
         KQKuZ1klGSN1oMaZhiyQYsVecnLbv0sahMKfAsX7cIMoArMspoAvi8SFk42DlaH5jb0j
         78rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=6OWyIP/uqVnW4J//LHi61Uyri1NPl0nc40DaUoK9OdI=;
        fh=qHg8Tb7xOPgm8J+P0Bex5H9sQZieJEo4/96pXJ5pmls=;
        b=JWl86BGeVLJ2StGLvvXTwhHTepog6UruaYWw0jDYcCl5Naqd2CVcRNF3rN7iVhDGsq
         f6dFu6OaC7bUlPMKIxlb0i6AzKQc2Dv4hNPGs9xLntL5CANtafgluc9sk/5rpryKAy7E
         BNV5zMdQSUux3FRK92XlSYV/iSgzST3vxJ9/lyHhQYBqkB7YTjfxOkufYlBCFYbLZE9+
         8tGPNWQBQIxu8+3PBDoAPXCTm5eStR0EagClDPEeTmXRvtMtZF2WgAleAlXUCm29n4BY
         Rz+0xTHHipaYbZMCQM5tmDDvm8pIMka0wu9CAgsvsUeyU9f2hEyIkSKmcIKUxPim1uW/
         R9Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=JsNNagOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi41-20020a05620a37a900b0078725883460si6616702qkn.390.2024.02.19.12.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 12:18:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=JsNNagOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcA61-0007XN-Kw; Mon, 19 Feb 2024 15:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rcA5a-0007DE-Rf; Mon, 19 Feb 2024 15:18:15 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rcA5K-00072S-Qb; Mon, 19 Feb 2024 15:18:10 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 5B62AA05F6;
 Mon, 19 Feb 2024 21:17:45 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id Zu38H3wjXYZm; Mon, 19 Feb 2024 21:17:44 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id CB8FBA0607;
 Mon, 19 Feb 2024 21:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr CB8FBA0607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1708373864;
 bh=6OWyIP/uqVnW4J//LHi61Uyri1NPl0nc40DaUoK9OdI=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=JsNNagOGyc4RCXcqyXepByqGQOyaJ9/sFe/F6m6AmBjrM7WRO4Jr/JO6Vhp+1XPO2
 +z8HBuIOsCkE2QaP+be7X9AR4DS7bKoNW937UAapuMFSCpb9sAea0+Byhz+FrOEDDG
 VmD+3TTpgwP+3yREBTxQ0XIFj/vqOMSQBk68NLbo=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id RVjlZzrcMVi1; Mon, 19 Feb 2024 21:17:44 +0100 (CET)
Received: from AM-Inspiron-3585.. (cust-west-par-46-193-4-103.cust.wifirst.net
 [46.193.4.103])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 4689DA05B6;
 Mon, 19 Feb 2024 21:17:44 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 7/8] STM32L4x5: Use the RCC Sysclk
Date: Mon, 19 Feb 2024 21:09:07 +0100
Message-Id: <20240219200908.49551-8-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy3.enst.fr
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
X-TUID: pAs/tBs7Q0Zy

Now that we can generate reliable clock frequencies from the RCC, remove
the hacky definition of the sysclk in the b_l475e_iot01a initialisation
code and use the correct RCC clock.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
index d5c04b446d..347a5377e5 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -85,9 +85,6 @@ static void stm32l4x5_soc_initfn(Object *obj)
     object_initialize_child(obj, "exti", &s->exti, TYPE_STM32L4X5_EXTI);
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
@@ -99,30 +96,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc=
, Error **errp)
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
@@ -152,8 +125,10 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
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
index e480fcc976..1f71298b45 100644
--- a/include/hw/arm/stm32l4x5_soc.h
+++ b/include/hw/arm/stm32l4x5_soc.h
@@ -50,9 +50,6 @@ struct Stm32l4x5SocState {
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

