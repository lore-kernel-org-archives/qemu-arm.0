Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2829898lfo;
        Sun, 31 Jan 2021 10:54:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIGXn8yohjkqWQci7BxXU+XuHN+2c+aIij8GCSWdFVa2OZeCf1iznyDB56xAkA5GrSfdUV
X-Received: by 2002:a25:7658:: with SMTP id r85mr4141136ybc.271.1612119241860;
        Sun, 31 Jan 2021 10:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612119241; cv=none;
        d=google.com; s=arc-20160816;
        b=i689tk14rjgKcyESBa46ETBzdJ24t8xQsRTCzFZaxEHVZ4P3ztT/jueKfHhKqesfpe
         fMQ78GeFxvdjM2lUOdSYpa49yvb4h4vw/Aw4LUgNbjzA2F5jTZa9LxjOG94s+d2MsnDS
         TSucD+9eeCfE2/UJo4R4X9OfrRQ6HbaE+v8WWZ4r43eUOoIIcV7P17Op7ewS3VAgi8Wo
         JKjtB9JkMG1hz9crPuODM8S9Fd9LyYPT2i1gPVXYf81d0xHpybnpQygq2rGA95AWKgUW
         os5/E5tUe5rUeu8cccxGYZ114NGCZlIbGbqOZG+7ByiYrMzU2KzqHPM53uv5b0MED8/0
         Dumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
        b=lOKLzmuFbPxNz2OD6y3yE8R706BQDsLzuOG48zBikFglbM1pUGycfTcWS1fwdpUH4O
         W8y4UkW/YygnptGbT+aQ9ZO5WEOXsnnCa4YRzXRGV4cIXSKnK5Xs/raz5sIBBZqoscIU
         HPDacplw70afG6dzimxavWFVkM4A9z6ON00Bqr/c2P5GJ1Hghe22gNxyukaQKZyEeiUR
         4vhNlZreTWUAGQDOlETAkkRmBjLnpbJ4eaQ8owO9KE5iYeQcYvD1HnYvN5U2Sdjzr9/b
         9GLJ9P8rW8WVPw83M6GgEOscT4XbYR2Ipy1UuBOhbm1UMcUVMJ9Wz4YFlmPNrhGFlS+B
         Pimg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xex9yBlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si13574742ybf.228.2021.01.31.10.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 10:54:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xex9yBlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6HrF-0000Qb-8Y
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 13:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hj0-00021k-60; Sun, 31 Jan 2021 13:45:31 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hiw-0007fb-8Y; Sun, 31 Jan 2021 13:45:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i9so11346153wmq.1;
 Sun, 31 Jan 2021 10:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
 b=Xex9yBlF2YBcUJZkVQebz+LHHVE0PmtFKcD4mns2pqWsWtmf+WRdiGPDWVf4zj8u8V
 blPpNzVMbbh7TYy5sdVI9nfnPpa2QzMKq8r2rCm9qSD6AoscmPIkXiFreAOZnRk/2sie
 1KjRrq+dfFFhFtcmwkrdhyxmk2svUeUrVPhD9eTEyBuPAqU0iQVQonwyeYH1E6P6v/wt
 kxij9zFc+z941w7GR6W2oYBYrhSYWQiOOW0/+1slbi+GyiVkD7nIWC8oAgbfhBuiHdh5
 8r6+ebCXr7kFQr2A6NIDL9F0etJUN3P83WA+ghAu6Ie9IRygrBPan8fVHn16P9e61QUU
 ZuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
 b=IxTkO/zqt0ittEDoSFaUhKs8F9+wTZp8Nh91/t6B521elmk4Jc8N5PKlUr77VjBSNz
 iD9Y55MIbWgOqm1fd+cQMWMYcmviNIlEKAwM1xhHVVz7KHzlxV7TMppBZUPU6uzizhPX
 PXz56fW+NLJVt78NAAGV2o3rldW0MARYP9Pk9fZdPZW9d9GWn+0M/MyRaYDvQNWq5RLp
 lrm3CXUXhmeQeM50qlIwDAWyEF2bevBzoFdMTcD8yRxKdtLiLWX29rfnLKMSTwqXObgU
 EbC2ZA7JQw7RCIMui52OS9pPmaiSRGKI0/WPU6rbIaxNEDr/QmQh/0+L5jiKNYJMxlX6
 T92Q==
X-Gm-Message-State: AOAM532QuEWGTjw9cLz2YlSonolXqbuXYT1rJm0kP/Dfa5J6E41p7wjk
 yNT+QtUcmPOXreJz/o4Sml6OtIZwRvA=
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr12017398wmn.96.1612118723210; 
 Sun, 31 Jan 2021 10:45:23 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m16sm14368847wmq.36.2021.01.31.10.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:45:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] hw/arm: Display CPU type in machine description
Date: Sun, 31 Jan 2021 19:44:49 +0100
Message-Id: <20210131184449.382425-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LBctbA2dW3lL

Most of ARM machines display their CPU when QEMU list the available
machines (-M help). Some machines do not. Fix to unify the help
output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/digic_boards.c  | 2 +-
 hw/arm/microbit.c      | 2 +-
 hw/arm/netduino2.c     | 2 +-
 hw/arm/netduinoplus2.c | 2 +-
 hw/arm/orangepi.c      | 2 +-
 hw/arm/stellaris.c     | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index be12873673b..6cdc1d83fca 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -142,7 +142,7 @@ static void canon_a1100_init(MachineState *machine)
 
 static void canon_a1100_machine_init(MachineClass *mc)
 {
-    mc->desc = "Canon PowerShot A1100 IS";
+    mc->desc = "Canon PowerShot A1100 IS (ARM946)";
     mc->init = &canon_a1100_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_ram_size = 64 * MiB;
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 0947491cb97..e9494334ce7 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -64,7 +64,7 @@ static void microbit_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "BBC micro:bit";
+    mc->desc = "BBC micro:bit (Cortex-M0)";
     mc->init = microbit_init;
     mc->max_cpus = 1;
 }
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 8f103341443..1733b71507c 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -54,7 +54,7 @@ static void netduino2_init(MachineState *machine)
 
 static void netduino2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Netduino 2 Machine";
+    mc->desc = "Netduino 2 Machine (Cortex-M3)";
     mc->init = netduino2_init;
     mc->ignore_memory_transaction_failures = true;
 }
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 68abd3ec69d..d3ad7a2b675 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -55,7 +55,7 @@ static void netduinoplus2_init(MachineState *machine)
 
 static void netduinoplus2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Netduino Plus 2 Machine";
+    mc->desc = "Netduino Plus 2 Machine (Cortex-M4)";
     mc->init = netduinoplus2_init;
 }
 
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index d6306dfddae..40cdb5c6d2c 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -113,7 +113,7 @@ static void orangepi_init(MachineState *machine)
 
 static void orangepi_machine_init(MachineClass *mc)
 {
-    mc->desc = "Orange Pi PC";
+    mc->desc = "Orange Pi PC (Cortex-A7)";
     mc->init = orangepi_init;
     mc->block_default_type = IF_SD;
     mc->units_per_default_bus = 1;
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index ad72c0959f1..27292ec4113 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1538,7 +1538,7 @@ static void lm3s811evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Stellaris LM3S811EVB";
+    mc->desc = "Stellaris LM3S811EVB (Cortex-M3)";
     mc->init = lm3s811evb_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
@@ -1554,7 +1554,7 @@ static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Stellaris LM3S6965EVB";
+    mc->desc = "Stellaris LM3S6965EVB (Cortex-M3)";
     mc->init = lm3s6965evb_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
-- 
2.26.2

