Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1919828lfp;
        Sat, 8 Feb 2020 08:58:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqw17UI64fEtknSpf8i1dn7N3oe5djwNKWhjnFj9z0PwDzh/UUZQcEtpUzYFNMM7nzEFUZhI
X-Received: by 2002:ae9:e70d:: with SMTP id m13mr4262740qka.184.1581181107363;
        Sat, 08 Feb 2020 08:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181107; cv=none;
        d=google.com; s=arc-20160816;
        b=Mi86cIrvkV3rxnBoP7abdq8hsZ8hmoIOdqzH05DL7Mf2IoTOjxRK4vDXQdRbju+aA7
         pTuWwqLK3bYiLz5Ou4TMDGkh1Voy/oshgWGUfBXMpDQIfaZiJAiy8F9A36DQkTm1vfMO
         GbYp1CO3chN90RWrkV1ftMTNvB/utMrB3WuQFMYlaBFpYnI8nXOc/+/72VC6C1uINgT9
         mxJiIQOpXWTbCRe49c0ktISloVwN9RwlgdBoTH4MpvENvAZ9SjeQ1J6NZEbaBaCQvwAs
         VaXKn5iZtaqt2jPGQG19IhNvw6BoF4koUbW9yT1QfYmfw2W2V4vI8Oni9gzewYktkcw1
         xabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PQ9RCvZi2otUw1qqPfGvj8l91J+geLVqZwXKPaCPo0s=;
        b=o9J+4voX8c2OfrB6RqXfdLn35Xfj7ZeN3Au2r9/hWt+5rFLaOduufdyML9XN2mJy5D
         RgtpQI+twOnUB8Zu/Mkir7P+siLmF/QbbboEkbfWripQNJe0In1MA+FxvXkqtNW3FLnG
         U8SiIucLl7RjCwTj7AZVJTno0QRp2m/A/Cre+a5nBdRCVnIiNS1zVybSxjXhLUiYpcT7
         0JiOSzN8UKGHh2xAN73RhKopjvfeXquRH5lRnjvLYLYgeOckbWPlfEQGXaxjQf59jIuY
         8+3UFG5/TCAIidvNJa7HQmZpd7rBggWgCAHvBzsbGUgI4QiFWncfJZd7dGSFwzpTabRM
         7lWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RrCdzZKg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si1508355qvo.86.2020.02.08.08.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 08:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RrCdzZKg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TR4-0006oc-OT
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 11:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPz-0005zQ-Ud
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPy-0001oN-NE
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:19 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45764)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPy-0001nh-HK; Sat, 08 Feb 2020 11:57:18 -0500
Received: by mail-wr1-x441.google.com with SMTP id g3so1410838wrs.12;
 Sat, 08 Feb 2020 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQ9RCvZi2otUw1qqPfGvj8l91J+geLVqZwXKPaCPo0s=;
 b=RrCdzZKgivqN4loroP0+cRbq4EF4GhRSz9wlioUwMOOSwq6XSv5UiRkIajIUvmmVNL
 KO3nuaNJguzSguZBboF5p3EJezjoNoTbeFcQmfWZLfs0klS1iCxbalp4W4tYNg+X5Lk5
 WOqN9zvi27SjAoo/Gq0hjtxJVmvvh6CVEBvxY73wCT4TV2Be1jExfwafhmdpkcQMq7li
 OOtR/cSSD0QupAMyQUBeF0R2LPn/sMzd+yEcm8cGF9O9ckQ+qKQAMhDl6fiorrpHg6tj
 zskUu9QXFnTnyavp+MWLFuRRdEOtaeWIxkfl1bHFbAp8PHXYPoK5gUWA1OySI60WM8PW
 cQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PQ9RCvZi2otUw1qqPfGvj8l91J+geLVqZwXKPaCPo0s=;
 b=TY37oLExDmXw6w5KtV1XzeUFww1x/f+1c0NRgh3cz7NmAO7p5gtYei0u2UCLOTULc/
 9AULgLzukli/bvVCWG4t9ATBAqkQZmJRUt5ZvIaxBAE5e2gJbf0aD5G7YP52PgdoB9XS
 d5uLCxG0kgoiqcAuyZo4pp1UCSApBQf814MGA7WORl6HDGEuXEZ81HYxGDqtx5fvjrRw
 ybhbgu8dHl8yzYZFWKUE/iTPTI6Mw2dOJ+LZEcMYZ5E+LahOS9KDkaZDwd9l98GnsEfc
 Ha8ZuTJ4MvbKV73GUWvu+fp8W6I1ATPJx8kxdQJ+bNHAUt7nIjnksvPMbdpN7YieMr6Y
 9+pw==
X-Gm-Message-State: APjAAAWmI6uJ6P1manhZ7LFjyN221bFpAc4YDX5vvr91eXoZ9DOcW8QN
 cfu//Zlnx1yHqLtpqEVVOCb2iWcY
X-Received: by 2002:adf:b352:: with SMTP id k18mr6003393wrd.242.1581181037383; 
 Sat, 08 Feb 2020 08:57:17 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] hw/arm/raspi: Let class_init() directly call
 raspi_machine_init()
Date: Sat,  8 Feb 2020 17:56:41 +0100
Message-Id: <20200208165645.15657-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9FvvIovFlAN1

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
index fbfcd29732..1628b0dda7 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -228,7 +228,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
 }
 
-static void raspi_init(MachineState *machine)
+static void raspi_machine_init(MachineState *machine)
 {
     RaspiMachineClass *mc = RASPI_MACHINE_GET_CLASS(machine);
     RaspiMachineState *s = RASPI_MACHINE(machine);
@@ -280,11 +280,6 @@ static void raspi_init(MachineState *machine)
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
@@ -293,7 +288,7 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 2B";
-    mc->init = raspi2_init;
+    mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
     mc->no_floppy = 1;
@@ -306,11 +301,6 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
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
@@ -319,7 +309,7 @@ static void raspi3_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 3B";
-    mc->init = raspi3_init;
+    mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
     mc->no_floppy = 1;
-- 
2.21.1

