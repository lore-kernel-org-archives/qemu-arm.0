Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1621511lfo;
        Fri, 29 Jan 2021 17:58:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2TDDVlT9V3UjaxmvWSBAUwj8RUkaDojUBp8U+kiTdQVAsWJ5hvDHwIZNSU2EBafGp51nH
X-Received: by 2002:a25:428d:: with SMTP id p135mr11013252yba.498.1611971923146;
        Fri, 29 Jan 2021 17:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971923; cv=none;
        d=google.com; s=arc-20160816;
        b=rUDpRdXUqdxe7MQqL0mDPxgzq42FVoT4Fk/YHOMW8PDEH0ZV+hPO9fSMyJOJYh5N1u
         PvI+y4PzxrqeCPbK1AZDbtZNjh9CrDXAzHBNuwVFpmuvGY8rrBVLTP/HFJZYwafH7M5g
         elmcZbLR+qCslkUtolMHIYpaPfX01QgxjUsAmwu53SlBYhKB8J4RNXxZPXBLoGf/hUXT
         SZIFHBBnhbPGm4M/aJZhjMCyufmYeX36/ZV14SC+CpKzVPRBbNlFTc+QoIl1g10lKP/T
         vcwmchekgmG4El9QrEsVYaaoc7fRwoj7BG5a5SfeEQjzuoGaRBdBK/SsKCJXdHb9/4Z6
         uolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
        b=Z+H0qHt2Yi3I0PIZrVP9Fa+xgODZbwc8ZaPDQ2BZ4sGow35KGgdZd5GNh7FsSgo9kd
         r2eHJwu2XLMDYbJZw/ItBTPRltP+/XHZ3ronAGUa/Yozp1th4rCSiI4tgNlvljz3vQmV
         CoJT7OMz1eFZKIr87odfrwaNrcokeSdPQpE/4oMsrUYPdjn1mPGS+vLTwoR90aZ+VyOR
         NhZFYjgsiRvu0GVNyio2FAK0s89lq/UNNzmtNubSQoLg+V81t3mH+m6NAAHmhHFEm0Ol
         4jCFmHgbwZsgwnZPFRePMc5FLGHjRf7nnFeb7eEqgvu1/ynvcBiQ+92kROoyeOKKYrf4
         FJCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WgnMZojy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si9951661ybt.404.2021.01.29.17.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 17:58:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WgnMZojy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5fX8-0006en-Hc
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 20:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fUE-0002pH-Rp; Fri, 29 Jan 2021 20:55:44 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fUB-0000vF-Oh; Fri, 29 Jan 2021 20:55:41 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so10621048wro.12;
 Fri, 29 Jan 2021 17:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
 b=WgnMZojyiZx5lKB4qw0pSqL5QpZH65Z4MwQDqUMZM2RWGZuS8sMWrtFuGc1fN3KRJg
 sNkeEjdUsh/SrkrIgOvXF4INgjLmXB6aIjAoKfGSOSocLcCT57BSyM2BLnE6BkEttZ1j
 jP8CNfcpWinztNrSi0CKiCxb/ct6hX19JL4vBWUTf8e36Nl8sfbSmCP4blkpXvreGBw7
 w+A9hoe9ITYRaKwq+L0LHmSsvGdRFirk3gMT6R0PjZnZNVrw7npmu5W9pMUysT6OOqLp
 W7vswo4+kYSe+RX9bjPERa1OgmGGmJiH7vvLS1uzCX6/o9/LB9qpA8I7Gjpz6CpTk5XP
 UD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZTEQksi03h84QrtUmTk444gEe+iL7OPLaC2gCq3Rbc4=;
 b=RGCEWpP5RBcmRVXfrdPEzCwCGbIbN2hDzwo/b+ZFMpPqiJV49lh8f90XRF+HLQ1nCf
 mrROlPUvHLohEWbubsv2nf8YMCe4VngJ974t1GExXy9jS9RVfwVvBp7cZbsZBumO/21c
 epaNQKVtFBiKqnfZar4L+rgURHUV4hwxT3y6Dyfkr3rLXl4i7k7ogZaXITK/KjQtLxXn
 XsGTqzJlMfif33f3U/pgT7DiAorhTIbwULI/OBeAQZN3Ru2sYmdAD41qpArPX8StdSI6
 3YxE6skY2yqKRZ1PnDGnDGbcvGIDQKoT8WCsT46UND2KtBoWrSrJgaXJElZjBffSncRv
 Wh8Q==
X-Gm-Message-State: AOAM531YuqsciM1g4Mbt7r3qhgmrvVl/cmTuHlQKKTDR93mh3QQXMM3B
 xSSVxRxjl9jFW9k/4OGSAg/oZeP3lWw=
X-Received: by 2002:adf:8464:: with SMTP id 91mr7164004wrf.188.1611971737537; 
 Fri, 29 Jan 2021 17:55:37 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f17sm15861336wrv.0.2021.01.29.17.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:55:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/arm: Display CPU type in machine description
Date: Sat, 30 Jan 2021 02:55:19 +0100
Message-Id: <20210130015519.4072469-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015519.4072469-1-f4bug@amsat.org>
References: <20210130015519.4072469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Joel Stanley <joel@jms.id.au>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jdZgfiIaf5kQ

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

