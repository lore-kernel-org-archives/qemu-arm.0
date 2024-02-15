Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp737804ejb;
        Thu, 15 Feb 2024 10:02:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXr5KjurP7o9+XpFQcED3Jn/Bd7ONLQF3TSY/7fvH+pnUjJQku2WPIUGaAOfG2lsj1MI5rt02kq/qWuZDAd+tXwzZcp6MSJ
X-Google-Smtp-Source: AGHT+IHi/cdLBkZfuLXq1BG5utblIdzQOCoCzGh+NQXgJBadd0E2K2uo+uUazujieWI/BaNaS8iN
X-Received: by 2002:a05:6808:219a:b0:3c1:39e3:3408 with SMTP id be26-20020a056808219a00b003c139e33408mr1997445oib.28.1708020151616;
        Thu, 15 Feb 2024 10:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020151; cv=none;
        d=google.com; s=arc-20160816;
        b=YpvbQhr+NvKRUGdFIFXalDcT0DWxnMOi3+gGfMcaWZXM8abMXKxYNmoX9WSVfzHlG1
         unUpYdyGux1SgZP3WoQqUyfQBdfeGehJJHuqA6tUvJq6K5A2bCM6FrL09BFgHrNW4eDG
         D4YRTGVACKynzO5CP7IPEW8AwfPRLsBJNoGitgz73MGBDxtXRhHf7zel+kpOcxKji6CE
         rWt4W9c4qgtnO+iM8yh1beEN2ywfaVRxHgM5OydqahnrzVRu6lffUJBF0RYBdWQzUz8V
         5jSm201GHLSdfqyW4S9Vps0530NmR33+KIyF53vpdrB/wFnjQKI+K7I5uX7cH6FYrMEd
         Y7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+ubSQX0s8XFIX39hOsqAJ21CHgufQEziwezWtT3SVxQ=;
        fh=nCTwhhW/WMub911ewRoNKt7gtVS56prXFP7C+c0FyxM=;
        b=vp7pI5D5WqURZvAD3oFuPDkkLbgWUgGzkLvg9klCFHwofJ7qWdAu7SNeuEM2o6o8hX
         nxFbw02TegGk4kTMCh0S7KaMWKa5ruO1hWZH+gY54yHC40mZDyCgm4stUL4aYCcktqhf
         x/ppwUx4fnN+OLBBYN8p8eo2AjhZ692/TcbyqrGdGamMRyaPh0qHxxQ0us/JT7PSedkX
         fGjU4znPHFoWznP2NQXaCPk4PwZOYFHOFsBs3r4a0LKDDOyoha5gz4UB+pRi4ecHHqGe
         8w8zKD4u48LQWshPb2VQJ5jKymTs9NMLKi7gl2sb1fxoUO0eb4YotY46pO9hZnhUWH3c
         B+5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NdyP/VV2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020ab04a0e000000b007d61b4b6a4fsi377104uae.70.2024.02.15.10.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:02:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NdyP/VV2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag2i-0001wd-7Q; Thu, 15 Feb 2024 13:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2a-0001lg-AA
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:57 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2U-0002MC-48
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:55 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55ee686b5d5so1532035a12.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020048; x=1708624848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ubSQX0s8XFIX39hOsqAJ21CHgufQEziwezWtT3SVxQ=;
 b=NdyP/VV2u7egJYv8FmmbmbmB/X2HN2b4XDxhpCaag+Ng0hsxouIBLxagswdFXToxou
 8lkDyt0/VDgzfC2EaUSj0pflzkirbaBG+9HHiP5gtyPvZMdZtuLA62TvR0HidW0/o1CT
 gEbL7IggrmXab2/mEN7sj6QEx/D8sHOcmRNwnq6SzfxGLOOL9BtTQJdZt5V9PNpD+VCA
 OkmrgyDqjtFwKiUgjHeuvnyuvy99wfl+JWA2UJ3negeU6PywE8pxlJDZUMPisVDs8klI
 +3PcH9PrHJNluQgUeJ31IuJgWAJJ/kOauU1m+WRvSpRZPbTOmtqVvIdOkULTwRYz3AeK
 3ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020048; x=1708624848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ubSQX0s8XFIX39hOsqAJ21CHgufQEziwezWtT3SVxQ=;
 b=MknUCEU6xNxHMSgMqpVFJ1nmblFzqpNW7+um7OD/2PDABcT2NWhhrkx/EylWPr1Fx2
 izFUfDdxbVBVvArvjvKnva4DbPABqrwju4QIId+4zZdjSjju2MqUOsDWJ7ylZnlvZiVH
 jVejYsFdL+eg0LxzEFmRp1QsizGpx+QNmVLsSQ8Y7Bbog12xb/To7xaBhxDeGF8LesOZ
 hho+eN1HWuPAC5tJpK/qCLZyIBOnwhoWCuzu/RMoutG7Du9N1KLJwzPJW12Pm2basNTS
 ou1gZ92eoAbfz694RicP8n0Tp7o7j7ECnjqIO9wnlSWDGN6HihfbCxzgnXE3HPZdkdTQ
 wFDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvraN7cGqczLVY0xK+vdYLpJrXgzSVdoFVi91I56JaBUBuCc0hwFrO102kG14a5d7LldoBIG+Ljo26kfQ6jwmmXkxT
X-Gm-Message-State: AOJu0YxAH6UOzglxquq92TC3P+M2Dz41dB/N5LjHzn/VVgEdCCSs6Uy5
 Rzu/zFjarnf7jyYCULTlwgi7DnTFzv5sVsMkv9WUt/gZ/r0m4CPe0jg7MW8vK30=
X-Received: by 2002:aa7:d38e:0:b0:562:f25:b125 with SMTP id
 x14-20020aa7d38e000000b005620f25b125mr1825343edq.36.1708020048674; 
 Thu, 15 Feb 2024 10:00:48 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 fg8-20020a056402548800b00562ee409ea0sm740914edb.62.2024.02.15.10.00.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:00:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 26/56] hw/dma: Pass parent object to i8257_dma_init()
Date: Thu, 15 Feb 2024 18:57:20 +0100
Message-ID: <20240215175752.82828-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: J+0XkX+/YDbD

Set I8257 instances parent (migration isn't affected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213114426.87836-1-philmd@linaro.org>
---
 include/hw/dma/i8257.h | 2 +-
 hw/dma/i82374.c        | 2 +-
 hw/dma/i8257.c         | 4 +++-
 hw/i386/pc_piix.c      | 2 +-
 hw/isa/lpc_ich9.c      | 2 +-
 hw/isa/piix.c          | 2 +-
 hw/isa/vt82c686.c      | 2 +-
 hw/mips/jazz.c         | 2 +-
 8 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/dma/i8257.h b/include/hw/dma/i8257.h
index f652345d65..4342e4a91e 100644
--- a/include/hw/dma/i8257.h
+++ b/include/hw/dma/i8257.h
@@ -45,6 +45,6 @@ struct I8257State {
     PortioList portio_pageh;
 };
 
-void i8257_dma_init(ISABus *bus, bool high_page_enable);
+void i8257_dma_init(Object *parent, ISABus *bus, bool high_page_enable);
 
 #endif
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index f6ddfc51c5..e72aa2e1ce 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -129,7 +129,7 @@ static void i82374_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "DMA already initialized on ISA bus");
         return;
     }
-    i8257_dma_init(isa_bus, true);
+    i8257_dma_init(OBJECT(dev), isa_bus, true);
 
     portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
                      "i82374");
diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index de1d5b110c..24a54ca272 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -632,12 +632,13 @@ static void i8257_register_types(void)
 
 type_init(i8257_register_types)
 
-void i8257_dma_init(ISABus *bus, bool high_page_enable)
+void i8257_dma_init(Object *parent, ISABus *bus, bool high_page_enable)
 {
     ISADevice *isa1, *isa2;
     DeviceState *d;
 
     isa1 = isa_new(TYPE_I8257);
+    object_property_add_child(parent, "dma[*]", OBJECT(isa1));
     d = DEVICE(isa1);
     qdev_prop_set_int32(d, "base", 0x00);
     qdev_prop_set_int32(d, "page-base", 0x80);
@@ -646,6 +647,7 @@ void i8257_dma_init(ISABus *bus, bool high_page_enable)
     isa_realize_and_unref(isa1, bus, &error_fatal);
 
     isa2 = isa_new(TYPE_I8257);
+    object_property_add_child(parent, "dma[*]", OBJECT(isa2));
     d = DEVICE(isa2);
     qdev_prop_set_int32(d, "base", 0xc0);
     qdev_prop_set_int32(d, "page-base", 0x88);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 70d12bb1b5..999b7b806c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -310,7 +310,7 @@ static void pc_init1(MachineState *machine,
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
         isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
 
-        i8257_dma_init(isa_bus, 0);
+        i8257_dma_init(OBJECT(machine), isa_bus, 0);
         pcms->hpet_enabled = false;
         idebus[0] = NULL;
         idebus[1] = NULL;
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 3924eec483..70c6e8a093 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -739,7 +739,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
 
     isa_bus_register_input_irqs(isa_bus, lpc->gsi);
 
-    i8257_dma_init(isa_bus, 0);
+    i8257_dma_init(OBJECT(d), isa_bus, 0);
 
     /* RTC */
     qdev_prop_set_int32(DEVICE(&lpc->rtc), "base_year", 2000);
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 344bf32e54..2d30711b17 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -336,7 +336,7 @@ static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
         i8254_pit_init(isa_bus, 0x40, 0, NULL);
     }
 
-    i8257_dma_init(isa_bus, 0);
+    i8257_dma_init(OBJECT(dev), isa_bus, 0);
 
     /* RTC */
     qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0c504de36e..aa91942745 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -731,7 +731,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     s->isa_irqs_in = i8259_init(isa_bus, *isa_irq);
     isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(isa_bus, 0);
+    i8257_dma_init(OBJECT(d), isa_bus, 0);
 
     /* RTC */
     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 5bf3e328db..1bc17e69d3 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -289,7 +289,7 @@ static void mips_jazz_init(MachineState *machine,
     /* ISA devices */
     i8259 = i8259_init(isa_bus, env->irq[4]);
     isa_bus_register_input_irqs(isa_bus, i8259);
-    i8257_dma_init(isa_bus, 0);
+    i8257_dma_init(OBJECT(rc4030), isa_bus, 0);
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
     pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_set_link(OBJECT(pcspk), "pit", OBJECT(pit), &error_fatal);
-- 
2.41.0

