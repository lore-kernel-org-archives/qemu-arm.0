Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114339njk;
        Thu, 17 Apr 2025 17:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+wJYMT81xb8c/8/kNJ5VB8QRr1IW8hGC2isls/m6GSkLKS9ZZHcda48q+LE7s5/knkhcKmfbETi6a8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEmi+2ec6Ze0pfJQDJfKCSIVz0RT6SI0PFtrANvpthym7wXozmNEF7rvMlYX6AFJ+AmPjHY
X-Received: by 2002:a05:620a:4111:b0:7c9:1c6f:b4c8 with SMTP id af79cd13be357-7c9282a2170mr122817285a.15.1744934400888;
        Thu, 17 Apr 2025 17:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934400; cv=none;
        d=google.com; s=arc-20240605;
        b=RSbkCyCRF0D3e2KRPfN6gmG3OkBDj+thuuU4czK4jXlrP8zj0f6mlR1nVG5ijtgz6V
         lr32xqpriVLNqPCeqM5Dro7zOS+cerzX9WH3ejq0WYf7fCB6BxZCtqc79lqtOtUHmLka
         a8Qef3PeVgxZW8MzpdX6i87wXtkU33afehZMOk1sx2losKTlQYki9stAf9uvX9UdTfAj
         rnsRgy2JyeD1vS4hUkgtqSPrGU6D1M/yZK7yoExcehzqrMgtOYpEaL+N8Dwc+DjBf8v2
         K1Wi87Wvj6wBfwT8Qs5JzRMD34JL6T957SezeklScbKO/4XP02fgqVCIYqhMAQa/+2Ux
         aEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PYqZLGf8zmbZFL30Ike2RIyikST1A7pLxDDWpbB2TD0=;
        fh=mZELNR06jGRyHDHKTb+IToB63VflW8tMpfhJRJKyLH8=;
        b=Jte0U9rP5kh0ipGCBptkn+6Rxlf4tDMMIxvbmgjW+3xsVmwOisoE/UxOeAOSohVWIQ
         aNc/3oCTfpb59YesHPjCAH9OtxchfzukNBsQCpzYSIqMqrZB4GinP5gfqfADJKe3kSN/
         M7cMU2g7mL4E1BBmUgerP3V2+764/mdh7gVEMDiXDsm8v3yrJoekfwWbrdKD6fwex/yy
         zWtjeOtopVwzgj/GQqg27hcsUsgh6aZRjpq114tgTW2p3KUtxqX1I6bBlHQ+hKL72qYe
         pQQo4kCPrKDhojw9NpOad2jgu/GXa6o3e0k5NfEMpsTzyY9tggy6HGwtEB82d2Wbk/XY
         5s/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaKp7Ejg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925adb75csi93563785a.170.2025.04.17.17.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 17:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaKp7Ejg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z8n-0007hE-Kc; Thu, 17 Apr 2025 19:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8Z-0007TE-Vv
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:59:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8Y-00043l-7P
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:59:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so10217735e9.0
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934356; x=1745539156; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYqZLGf8zmbZFL30Ike2RIyikST1A7pLxDDWpbB2TD0=;
 b=SaKp7EjgfIqzFtkuNxD4GGT/ezwJwqluK5E621OGUovQ9fmgQH3YHb6U2kP3VEgp37
 O+MibXr86Dw0cUU6oTZfobPECTsVTm8OftyhJCvqBRgQyv26DVCs59NGYd/fkRczWtR1
 qCGajpb6y2+bedcxWTMda73UuvVPSvCxPMn5Inl69QKXwup8h1DGvHxuHgdoY6uUC+tH
 otc4LNxdm56xrBsUPu2F5yKd2u4C3/uQAQUEpaZMMtvNT6e12vOL4Q7PVs4lkdCWpEkM
 mZz6UUXrZGehZvgA1RMKZPBoFZieqTpfKH4WxIzoy2krBJY+eRyN51PdWZOUu8bjiOzu
 LyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934356; x=1745539156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYqZLGf8zmbZFL30Ike2RIyikST1A7pLxDDWpbB2TD0=;
 b=CONB1CcJPvjojDcXh3uzDHoBmh8aX2qnXrAQrufgYMF5tkORKquLNYkrWByxdjV4nX
 GO47/J0cOaZW7KmBFRR8H44xT2v7GkSuyqZz697iOFK64B1fcKCrHfVfjP6//oBHkU1Z
 sqnxZozJUxfLhWaNLvoy+eRK9gSIa9twrZfEHRL5lK5mwvAVEZCMHkHmALpASv4PApGe
 rfLQw92ddqh3RudPWQDK33ZGpPkIB0QODjeBLqmKrUvIvtuPt6KIfCUypxyJWswj1XyV
 Jgygq+LEBHS/BkDonbHg2bJnPKMaY0YGJI3MvB/4hzt6GawnU39xWoKgFsSA1kyHk502
 Zo9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxPj7rn4Pyaacif1PXrDuAVatyRwRAtesVoV56xJ9YEhVvdp++vmkNPD0cOOi0Y9LbR1Bikidu4w==@nongnu.org
X-Gm-Message-State: AOJu0YxMZ5BLFSL65CSswN8z8yZWAMVHaH70WwhpE5Se4RzObUm95YGT
 xIwuK6PsfYIAlJ4ZAffVYCjJ/v3juU3+fGTCLCHP8EYh+Zm3IlxKb3Jt5o6ABRM=
X-Gm-Gg: ASbGncuHVUrPGO2LzeAHBCqrv68l0RKEPFIOX6Fd2OnwIYZpdd04W9xklMAy7+fkXcx
 sa8vQTtu7kncna+ybaEwBPSdUBsUX3w2MVpbFaQrWiI18CC205n1mjVlaMqdc8R49Mnk8tdARh/
 Srg+Je1MQ3Py2LtWb1xAPy6RWt2ZwvoBxd3JsfM+9crm4f5ucZG2i5QRcUug5w8xGeEdpRkfBIm
 SjYs6EkAaDQ29YM2BRiKQmb3/Y8fZfLyXbFRuF4JeLtdLDcmq8JKeO8eZU3f0eq9j/JMPyLBCM8
 TCfo3w11fCLRmWUYMonmV/WGdChI6M1r7QsksWA9x8nyFWaBxsK7Uk/p2/zsqJ0bjNqai9g58jh
 LFTYVWkq+g4JTJSK2f0LS
X-Received: by 2002:a05:600c:3107:b0:43d:24d:bbe2 with SMTP id
 5b1f17b1804b1-4406ac1ff5bmr3586335e9.28.1744934356424; 
 Thu, 17 Apr 2025 16:59:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6dfe4esm808665e9.33.2025.04.17.16.59.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:59:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 11/11] hw/arm/stm32: Define machines as generic QOM types
Date: Fri, 18 Apr 2025 01:58:14 +0200
Message-ID: <20250417235814.98677-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: qDMcWWdidpxl

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/netduino2.c         | 13 +++++++++++--
 hw/arm/netduinoplus2.c     | 13 +++++++++++--
 hw/arm/olimex-stm32-h405.c | 13 +++++++++++--
 hw/arm/stm32vldiscovery.c  | 13 +++++++++++--
 4 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index df793c77fe1..52c30055d44 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -52,12 +52,13 @@ static void netduino2_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void netduino2_machine_init(MachineClass *mc)
+static void netduino2_machine_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m3"),
         NULL
     };
+    MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Netduino 2 Machine (Cortex-M3)";
     mc->init = netduino2_init;
@@ -65,4 +66,12 @@ static void netduino2_machine_init(MachineClass *mc)
     mc->ignore_memory_transaction_failures = true;
 }
 
-DEFINE_MACHINE("netduino2", netduino2_machine_init)
+static const TypeInfo netduino_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("netduino2"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = netduino2_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(netduino_machine_types)
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 81b6334cf72..2735d3a0e2b 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -53,16 +53,25 @@ static void netduinoplus2_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void netduinoplus2_machine_init(MachineClass *mc)
+static void netduinoplus2_machine_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m4"),
         NULL
     };
+    MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Netduino Plus 2 Machine (Cortex-M4)";
     mc->init = netduinoplus2_init;
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("netduinoplus2", netduinoplus2_machine_init)
+static const TypeInfo netduino_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("netduinoplus2"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = netduinoplus2_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(netduino_machine_types)
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
index 1f15620f9fd..795218c93cf 100644
--- a/hw/arm/olimex-stm32-h405.c
+++ b/hw/arm/olimex-stm32-h405.c
@@ -56,12 +56,13 @@ static void olimex_stm32_h405_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void olimex_stm32_h405_machine_init(MachineClass *mc)
+static void olimex_stm32_machine_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m4"),
         NULL
     };
+    MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Olimex STM32-H405 (Cortex-M4)";
     mc->init = olimex_stm32_h405_init;
@@ -71,4 +72,12 @@ static void olimex_stm32_h405_machine_init(MachineClass *mc)
     mc->default_ram_size = 0;
 }
 
-DEFINE_MACHINE("olimex-stm32-h405", olimex_stm32_h405_machine_init)
+static const TypeInfo olimex_stm32_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("olimex-stm32-h405"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = olimex_stm32_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(olimex_stm32_machine_types)
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index e6c1f5b8d7d..3a9728ca719 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -56,16 +56,25 @@ static void stm32vldiscovery_init(MachineState *machine)
                        0, FLASH_SIZE);
 }
 
-static void stm32vldiscovery_machine_init(MachineClass *mc)
+static void stm32vldiscovery_machine_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m3"),
         NULL
     };
+    MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "ST STM32VLDISCOVERY (Cortex-M3)";
     mc->init = stm32vldiscovery_init;
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
+static const TypeInfo stm32vldiscovery_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("stm32vldiscovery"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = stm32vldiscovery_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(stm32vldiscovery_machine_types)
-- 
2.47.1

