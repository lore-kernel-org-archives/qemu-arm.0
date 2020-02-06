Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp816911lfp;
        Wed, 5 Feb 2020 17:26:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdksvcxnh7h0nHp/myKhWg8f9yoSSuAt5YC4MqfvWZ+yrnd9lno3Rk6NB+jLzAmkzWCfh7
X-Received: by 2002:ac8:6ec1:: with SMTP id f1mr587168qtv.144.1580952374350;
        Wed, 05 Feb 2020 17:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952374; cv=none;
        d=google.com; s=arc-20160816;
        b=cgY5irFfB/6BNlb49/KTvwAphhH6kz6VlT2jaVJAu8DIPOTLwZF/CVU9KNUGVvUlFU
         Y6jC4Bw/LQGfI7qyGQHG+BVDzUvt7JKnwH84ov/IfMW/pj4D10Q+4IkhmObzynUOE+UV
         2OouldKX7gG+tKPvtEMUT+dJW2Hlt6F2wwBUVhVr0P1/rtEwQH9GWlwPgGbYLJFFwdLN
         exlsSDT+Pi9bYJNXkcNOHNkpcGFGO1s2pw9ECdUEBVDQ1Nm1kbrj3Hx1lGfbkOAMJdLN
         u1uUclYjLPIByUAu9C8HjVBFxQ03PsEgmNe1lmlm6MBtwwJ3115VBLT8he2vZwNEyMsO
         l15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZQ7H/VBhBbZJ296rEwB4ccWCzYWB0TCAGh2KT8v1BXA=;
        b=oQ7rOGa/1hbkrQw+vJOuBt48d33OjRKmYl5tveemCHUZxBPlXkvgAY9OeciRs/mEP9
         oufFSBi5hU/6ORbCvcmWL5AFS4RcblWzpa7OwpEcr0k5YNmBRmhCovwGFsLqR8eK9lr+
         rVibNZDfKLIbMzngmLaeBzLhKxGTkfnV1aY8VEX3lUbK9kRYPhQmzDi965H/nKn/mJoQ
         9TikckDO/VuT+t1d1vQPeoP3FXX4220wgMaqOYB4+cLQDiO8ERCP+VZHaYjrNSdL7JZ8
         P69/67zwgB7weeXpR1sOep4Bt++g0crrsNq4zfs90FBcBgWUmj/LGbi12KlFle0sslrr
         kGMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PfwqIART;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si772933qtp.41.2020.02.05.17.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PfwqIART;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVvp-0003ZZ-OH
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoM-0000hZ-Fd
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoK-00034o-Bh
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:29 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41280)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoD-0002bv-Rb; Wed, 05 Feb 2020 20:18:21 -0500
Received: by mail-wr1-x442.google.com with SMTP id c9so5118155wrw.8;
 Wed, 05 Feb 2020 17:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQ7H/VBhBbZJ296rEwB4ccWCzYWB0TCAGh2KT8v1BXA=;
 b=PfwqIARTtpneD4rrFiXDXY96Eob+ltk9t0V/RdthzIrKRXrZZ20Z/2gD8aL0Nkd1Q8
 SDXVzWAP+IitWq3RwmV9+DQv3NU8b3hiNGoeBoAj0FHMKsyzZkQVU5X2v7kX8wDV4AxK
 wBnDLrUg2ADf74Tm5pVtWEAvmsp1mYWNWVgvrK3YVypYFXtv1U7eKMZN5dS/lpEW6hh9
 iDF4iOCUIMY4mDMcbGwEpgH2xifi7WDaY1DK62tHER0J+3oMB5fJboZRHTIteZ95HtVy
 6KX3ZOt9BaLvQHnJym8Om3kCfI4lEE7VDbNYu1Est0yULHrSFeHZfd6RP6DGZ0sDsFuo
 nSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZQ7H/VBhBbZJ296rEwB4ccWCzYWB0TCAGh2KT8v1BXA=;
 b=JrPExzwaHKiygeOB6F1QIp+kJWOThMNtZ/AYM2/k/6fXOnbqpsd6BCqD9sB/4Tn2eQ
 LAYBkMDEIGdFxxyfwxwJPAfJRLHdOK87FLUfYFYwZ9hXM8R5vVrErV8htLSzJYqZPr8b
 ZnCtrQuTHjrmnQL47EeOdvoeiLHaZ9LoB/6Gi0fTR7Qs8CMuIVCj55nhX44LM5nX1B+z
 glMLF8Dln5V+7fKhOjvQFzrtlat8YUWA1UXVBWnlS68U+Wf00mK0JUNwJRVfqpPcksM4
 Lw11BCQBlzu1NKjABJ1gbpuEdAnPPu2p3iQ/AemlgejvnrnleFqxAbzqpDBsh+Of2y4p
 Vv8w==
X-Gm-Message-State: APjAAAWzBjAjuDrb0tmX4GH6p5RaKGIgSNqQ1XldYcL4P7LsNmhZ3pJz
 9MQxSSnfcdTcZCaNTDSWKUBBhiHc
X-Received: by 2002:adf:cd92:: with SMTP id q18mr319541wrj.261.1580951899561; 
 Wed, 05 Feb 2020 17:18:19 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/30] hw/arm/raspi: Let class_init() directly call
 raspi_machine_init()
Date: Thu,  6 Feb 2020 02:17:35 +0100
Message-Id: <20200206011756.2413-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e/brOMiEPtZi

raspi_machine_init() access to board_rev via RaspiMachineClass.
raspi2_init() and raspi3_init() do nothing. Call raspi_machine_init
directly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Squash with previous?
---
 hw/arm/raspi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 885abced57..651585ebfb 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -227,7 +227,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
 }
 
-static void raspi_init(MachineState *machine)
+static void raspi_machine_init(MachineState *machine)
 {
     RaspiMachineClass *mc = RASPI_MACHINE_GET_CLASS(machine);
     RaspiMachineState *s = RASPI_MACHINE(machine);
@@ -279,11 +279,6 @@ static void raspi_init(MachineState *machine)
     setup_boot(machine, version, machine->ram_size - vcram_size);
 }
 
-static void raspi2_init(MachineState *machine)
-{
-    raspi_init(machine);
-}
-
 static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -292,7 +287,7 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 2B";
-    mc->init = raspi2_init;
+    mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
     mc->no_floppy = 1;
@@ -305,11 +300,6 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 };
 
 #ifdef TARGET_AARCH64
-static void raspi3_init(MachineState *machine)
-{
-    raspi_init(machine);
-}
-
 static void raspi3_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -318,7 +308,7 @@ static void raspi3_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 3B";
-    mc->init = raspi3_init;
+    mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
     mc->no_floppy = 1;
-- 
2.21.1

