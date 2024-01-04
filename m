Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp108697ejo;
        Thu, 4 Jan 2024 06:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG59KJo5/MpkIRnVTpjXlyzWA9z3zCNlIZft+eVsdmxwXTohYISESjcQtw4pmGKQBg3FhbS
X-Received: by 2002:ac8:4e4c:0:b0:428:34f5:f6d9 with SMTP id e12-20020ac84e4c000000b0042834f5f6d9mr818302qtw.88.1704377560038;
        Thu, 04 Jan 2024 06:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704377560; cv=none;
        d=google.com; s=arc-20160816;
        b=zf7Iqe+gW55xB5HnoCOh4fg/CwJuTc7YBHp/dZoMxz7FKW2E8o4FPP3xKhJR7BaWrX
         DSyQN7F2WL1XS4/bc6Ctp5lcH+g8kuDuXTG4XPCT7ChID7Bnykg5uMGVpLRweCWpqlit
         oHPd6p4366ZND9c82nWliqXclQUkCx0z71jf8YgUwmy3G6t+xaBPyGCELi1HGpsHL9EZ
         s887lpTz8Ye9BwoUC0njrm0me/3aTCSn3JskKV6V2jIXO4uEPLF7mdfVq8qP7YWCspEW
         7h0cvQmdrDyTOosAyzIbOmZo694nhD/F5NXgvNeYj7F/ofTfhsOR9kELpsssypAS08W9
         WQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HH/FOzMkAK9P4wWyuKIB0SOChexA4vOozUZ0T8lYoS8=;
        fh=B6SVMKRdYi+b41ThkwYr4zn1YgSXd92ztSh8thEtKw4=;
        b=rSDL6VGaP+Kzr9/yna+r0QRVzJatmO8vk+nMume+TmVAmraE3pTOBaQz2K/XQbyuc+
         EHOc7NEKPNmkJRXqXO9EiHy45luvm5AZH/pd/5FAqR4OSx1PVmNS2qcoQfGx4Kb2rcvn
         69TTnByEDA8zu+vYyjErb3dFrOeHGSclR+LJ+9d9FBbLqxfPF/jvFcFsBT3aPK6UED+c
         fPYBAcf/x0TJyQi7eEU2upJ8oLxqsf/Nk7XvgjDD3nBU5c7gmLbA9mea1skOzkjrBbSa
         P/8k7kTabRV3HAjFASlNk853YhLP5+dEctVSmYdB5GyLp37R8nLMIds/FWHu0KAmU5s+
         5wyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gF4yh7tA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020ac85805000000b0041815de1524si31125798qtg.178.2024.01.04.06.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 06:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gF4yh7tA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLOS9-0006Ff-AC; Thu, 04 Jan 2024 09:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLOS8-0006FJ-C6
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 09:12:08 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLOS5-0000Ju-8h
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 09:12:08 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e6ee8e911so595529e87.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 06:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704377523; x=1704982323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HH/FOzMkAK9P4wWyuKIB0SOChexA4vOozUZ0T8lYoS8=;
 b=gF4yh7tAutpOO9ZHanxhABaotb8IUvk9jiX2GKoRO021J3yqJNVqgNo4pXdM7ioS8r
 zukNhi/Tpp4/vLmPfnoVp5Mpcn+k2N1YWTGbDIJJcPEv+sYKEK28f3PYCKRfrnJP9kYh
 DL2vXnDK8GBm0e7KIQVqosXZ0MmqaF6io+2WGzpyRNHVJiRczzfSm+puaOSJoPF0KaUR
 eTgzBYWh9ozFbTgozO8rY4q5dxebHyyrz+g4Uvv1elKbXdLIxT2MR1aETQlgDIucfqIR
 G9Ou1IgTxYm+LPtL4CKdOkAPG/yDTRHlOWxFxX4UWm5YlgCIlAx31nYGJrZaOFKts/Mw
 LUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704377523; x=1704982323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HH/FOzMkAK9P4wWyuKIB0SOChexA4vOozUZ0T8lYoS8=;
 b=kPTDTXyxTuMWgg7P3nu4JgrVFopmEdanz7Vml1aglPh2rZNkvwaXxdcn+gtuEATEE6
 ohmqUduZ0sjkQUtrBTyj9KC23zDNQrcqT8B1kUD1vHaseO5QhP4TVuhOD+9mDsRYH2AP
 w44fjyJ3KGNbuepWUpwrFVySiYmnvYCkrXNzhqcE+s6u0rwTRGOJtPEamOSSXGMx0Yix
 h6NhWrPu9I4ENtKNFtPk8ICnFbUs2hBbyDF1ZAbgu9mBQ1BPeDJvbotOSH/Gfsg4fNuq
 THAWvsP/RtNVJmDtt4tUnzqDgGVBBfnMra4zPBxoEi/F7sJ3MN7Iv6nAlxFnwH0X29mU
 gZEg==
X-Gm-Message-State: AOJu0YwjGqWhBFUhbKXLmPXQ+9UfaJDy2iGKH5uIoAOrjsJYtQoZh7Qb
 1mExPhwxWH6YiicMsRXRUIuphwKMa6ZGKUz9QCu9BXiVDE55YA==
X-Received: by 2002:a05:6512:31c6:b0:50e:712b:393f with SMTP id
 j6-20020a05651231c600b0050e712b393fmr411303lfe.80.1704377523160; 
 Thu, 04 Jan 2024 06:12:03 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05640210cd00b0055298b38768sm18985841edu.80.2024.01.04.06.12.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 04 Jan 2024 06:12:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Felipe Balbi <balbi@kernel.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm: Add missing QOM parent for v7-M SoCs
Date: Thu,  4 Jan 2024 15:11:59 +0100
Message-ID: <20240104141159.53883-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +ISPHKVDq6jm

QDev objects created with qdev_new() need to manually add
their parent relationship with object_property_add_child().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/msf2-som.c          | 1 +
 hw/arm/netduino2.c         | 1 +
 hw/arm/netduinoplus2.c     | 1 +
 hw/arm/olimex-stm32-h405.c | 1 +
 hw/arm/stm32vldiscovery.c  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 7b3106c790..e93c83c410 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -66,6 +66,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
 
     dev = qdev_new(TYPE_MSF2_SOC);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
     qdev_prop_set_string(dev, "part-name", "M2S010");
     qdev_prop_set_string(dev, "cpu-type", mc->default_cpu_type);
 
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 501f63a77f..8b1a9a2437 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -44,6 +44,7 @@ static void netduino2_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F205_SOC);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 2e58984947..bccd100354 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -44,6 +44,7 @@ static void netduinoplus2_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F405_SOC);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
index d793de7c97..4ad7b043be 100644
--- a/hw/arm/olimex-stm32-h405.c
+++ b/hw/arm/olimex-stm32-h405.c
@@ -47,6 +47,7 @@ static void olimex_stm32_h405_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F405_SOC);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 190db6118b..cc41935160 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -47,6 +47,7 @@ static void stm32vldiscovery_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F100_SOC);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-- 
2.41.0

