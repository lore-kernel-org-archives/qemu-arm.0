Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp877914ejb;
        Wed, 24 Apr 2024 13:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6cs3g4Qa7kMVPcW+ppWL7eNaLAwHXMilTl/K3UQnu9GPqfRCrKPuBiRJSFTSmkiEk4sUMAgj8D5CXk/GgOj59WqRnnssn
X-Google-Smtp-Source: AGHT+IGtKjrI3LxZJA3K6yzzhqp/os6IQ8SpJPr4H0/CbuCJnsNiUeqCM3ytlnT0Cikqdsj7n1DX
X-Received: by 2002:a05:620a:14b7:b0:78d:6479:7c39 with SMTP id x23-20020a05620a14b700b0078d64797c39mr3913817qkj.19.1713989454552;
        Wed, 24 Apr 2024 13:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713989454; cv=none;
        d=google.com; s=arc-20160816;
        b=y6bjAzjMVlLIIXMrzXU7hAcppKIW5lH2vAYR5tGmLVfr21D8JEj4LgYZOa/QlEoJWv
         wgyx+SrjmFcNUVeHffmdCiev8L+i7/qd7DKF7PekMJWajdCoHjnpCtbKZAGyBC1kgMFH
         B1ytau1K4T7KCCBrTiVXDLuiam70IYKoAoN9c5o3uPJr+4iN7pYHm+3K+LS2MGbLjT4H
         3kKwwNwxJ66hve9T/T846ZZ022J/Wk74Iy9hNAxcaqXcboPG0mZgf/VlTYhKh6Kafyuu
         vTbCO1f+f6hF/AvKOM+OJHdmWHj5RTDQCaiAv5/4+pPcv8dHXUOsgac32HjHLy6SZZct
         soLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=rkvHDWHwM89qp+9rxTxnpGySHdZI835QMMEyoTWJEHs=;
        fh=+gWto4Gw9TP3T//pcME19W0GfYoED8QkCfNqBInjbwc=;
        b=MeYZd7fgLcOVUOvv7CzRACOPP45hod8OgPp11lGkl+1fzqST+j4o62SLBpOMOltmfn
         0t47VzmvBDNWEpYDuqjqMW8T3787x8Rt+y/p1D5+q8dxHYN1AQDNijVnoUapx/LCqHbW
         jT5+L5reOKOf/mW5jl3VXrYJ8iWkK/E7fw7cxz9cYjQ9S+ErnunS4/o6GqDSX7MR3/4z
         iEMhFUF6ic8FRCmDSbRK3aCAYfI4Q7Hrs0HvXeMmjo13Z/Zr5eWtGdu+orlpDFSImrI3
         MyYk2ukddKOsSdjI+JK7BL5EwpQcl9skLTLhtacULynXm6Clqdf1UoGv3mMa6PAEuTPY
         hsFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=FFyCsaD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj16-20020a05620a1d9000b00789ed541240si15700337qkn.330.2024.04.24.13.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 13:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=FFyCsaD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rziwj-00046d-Di; Wed, 24 Apr 2024 16:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rziwJ-0003sr-LQ; Wed, 24 Apr 2024 16:10:00 -0400
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rziw7-000118-Qe; Wed, 24 Apr 2024 16:09:55 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 485A8A07A8;
 Wed, 24 Apr 2024 22:09:40 +0200 (CEST)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id EAxF3PDfTkXe; Wed, 24 Apr 2024 22:09:39 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id C2370A07B7;
 Wed, 24 Apr 2024 22:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr C2370A07B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1713989379;
 bh=rkvHDWHwM89qp+9rxTxnpGySHdZI835QMMEyoTWJEHs=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=FFyCsaD50xb9wmUv6Hz8DNhMNYpdnfODrmRruV2JiCpWGXSpV1ZxBCpeLpXowF6mL
 CdWzJJClpPJ/oTtuSzCCxk/r9ApOt42A6mtnYS4cgJxXYQmYjqPQQq0o3Twxnsja2z
 kMi5yNX+d/MJKJDJLlpbs3aLyZ8WdoYIezirrM4A=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id jmIBBcFlFR1D; Wed, 24 Apr 2024 22:09:39 +0200 (CEST)
Received: from inesv-Inspiron-3501.. (unknown
 [IPv6:2a02:1808:204:e56c:df60:5720:79e:c1dd])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 165C2A07AD;
 Wed, 24 Apr 2024 22:09:39 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v6 3/5] hw/arm : Create Bl475eMachineState
Date: Wed, 24 Apr 2024 22:06:53 +0200
Message-ID: <20240424200929.240921-4-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424200929.240921-1-ines.varhol@telecom-paris.fr>
References: <20240424200929.240921-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.222;
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
X-TUID: i62x6MkaJyB9

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
---
 hw/arm/b-l475e-iot01a.c | 46 ++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
index d862aa43fc..970c637ce6 100644
--- a/hw/arm/b-l475e-iot01a.c
+++ b/hw/arm/b-l475e-iot01a.c
@@ -2,8 +2,8 @@
  * B-L475E-IOT01A Discovery Kit machine
  * (B-L475E-IOT01A IoT Node)
  *
- * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
- * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ * Copyright (c) 2023-2024 Arnaud Minier <arnaud.minier@telecom-paris.fr=
>
+ * Copyright (c) 2023-2024 In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r>
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  *
@@ -32,33 +32,51 @@
=20
 /* B-L475E-IOT01A implementation is derived from netduinoplus2 */
=20
-static void b_l475e_iot01a_init(MachineState *machine)
+#define TYPE_B_L475E_IOT01A MACHINE_TYPE_NAME("b-l475e-iot01a")
+OBJECT_DECLARE_SIMPLE_TYPE(Bl475eMachineState, B_L475E_IOT01A)
+
+typedef struct Bl475eMachineState {
+    MachineState parent_obj;
+
+    Stm32l4x5SocState soc;
+} Bl475eMachineState;
+
+static void bl475e_init(MachineState *machine)
 {
+    Bl475eMachineState *s =3D B_L475E_IOT01A(machine);
     const Stm32l4x5SocClass *sc;
-    DeviceState *dev;
=20
-    dev =3D qdev_new(TYPE_STM32L4X5XG_SOC);
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    object_initialize_child(OBJECT(machine), "soc", &s->soc,
+                            TYPE_STM32L4X5XG_SOC);
+    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
=20
-    sc =3D STM32L4X5_SOC_GET_CLASS(dev);
-    armv7m_load_kernel(ARM_CPU(first_cpu),
-                       machine->kernel_filename,
-                       0, sc->flash_size);
+    sc =3D STM32L4X5_SOC_GET_CLASS(&s->soc);
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0,
+                       sc->flash_size);
 }
=20
-static void b_l475e_iot01a_machine_init(MachineClass *mc)
+static void bl475e_machine_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc =3D MACHINE_CLASS(oc);
     static const char *machine_valid_cpu_types[] =3D {
         ARM_CPU_TYPE_NAME("cortex-m4"),
         NULL
     };
     mc->desc =3D "B-L475E-IOT01A Discovery Kit (Cortex-M4)";
-    mc->init =3D b_l475e_iot01a_init;
+    mc->init =3D bl475e_init;
     mc->valid_cpu_types =3D machine_valid_cpu_types;
=20
     /* SRAM pre-allocated as part of the SoC instantiation */
     mc->default_ram_size =3D 0;
 }
=20
-DEFINE_MACHINE("b-l475e-iot01a", b_l475e_iot01a_machine_init)
+static const TypeInfo bl475e_machine_type[] =3D {
+    {
+        .name           =3D TYPE_B_L475E_IOT01A,
+        .parent         =3D TYPE_MACHINE,
+        .instance_size  =3D sizeof(Bl475eMachineState),
+        .class_init     =3D bl475e_machine_init,
+    }
+};
+
+DEFINE_TYPES(bl475e_machine_type)
--=20
2.43.2

