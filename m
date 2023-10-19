Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp803842ejb;
        Thu, 19 Oct 2023 14:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW671vCuu2vH6VuOB070AIvLmwoi/s5NRGxvBXV5BuZ5gQBKGJaS+u4eHhINR8hWRsQigx
X-Received: by 2002:a05:620a:4729:b0:775:7535:3ed9 with SMTP id bs41-20020a05620a472900b0077575353ed9mr4034216qkb.40.1697750854030;
        Thu, 19 Oct 2023 14:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750854; cv=none;
        d=google.com; s=arc-20160816;
        b=Esy2mjiB5ocBqwfCROP5BlYfSjhy+iCTnJhz5X8juxgrJOGClUmasy/UpXWmH6BaUy
         ZYfLCpHIXecpdYHolbgB2ev7WoE+tCvQIIzS+jKYJoNtvjOQ4OwKDwcU1/2rjZ7F0lS1
         zTRQBimoO7S+R1mnua/DMf2uKcBaz38tyokIJfzLcQ/3D0iTYXlpvxHHvwOLX1Mtew3X
         ngVtKqkalC7FHVv3vRvm6EQcFfxdpvl9h08VR0dZIL8CBGIewNR/8Oz869SezEItd1M2
         kZwf26j8Rsmqy81/LVDACCNfWELoqoZUi09paBxa7BKm2Y5X3Ls91UlOB20OaJiZdWW0
         I6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1TkahiOfYYlesTz2N92yWSyEJwEKIj0IcIbfbK44s1s=;
        fh=pu4gC+9R++4XiOr8w2vmQ4WPqb5P+M9CM0qMbNEJ2Ng=;
        b=wv/hPYtfdJH0Vl62BbjhbxAVkLJys6vUOkRmgmFL26O2atmXYvVV+7gxH9u1w2wWky
         +ZPiRztrioOVx0/ieoKs1BtsBFOCRU6hinp1EfuYhdLtHPQ/QmSBw4ps+fLOW57/SrpC
         grwYWMiySV+xc4Osz+3OflhiXKKqLON542aFR1m1saISpWwxFKyeCjl7OuEwRv39G095
         SWclfXFaPKFa9Oq8OVu1V0/QZQuTkt5nH4vg3SOlV5Rv2JQ1Xkx0ncOqzhvOFrxhQ91q
         6LFijsSPT7ikcekE+XG1sSxdt4qFmrlhmXXxs8vXGJZGawdCpZ4l08hYHQ5aCXr19zkO
         mNSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MKp0xZOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020a05620a125300b0077736eb9fc4si252494qkl.4.2023.10.19.14.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MKp0xZOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaSe-0001ec-T6; Thu, 19 Oct 2023 17:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSd-0001YQ-5A
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:21:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSa-0007KL-Jw
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:21:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so110264f8f.1
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750498; x=1698355298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TkahiOfYYlesTz2N92yWSyEJwEKIj0IcIbfbK44s1s=;
 b=MKp0xZOuDjvHEliVoE6UmU1Ykp93jFr/mSXbpYO0STgl3nSgp0ZNxUT54ZBXVEgKTD
 3ViwrEDxwq/aW4KdktO6OP5MAZX/5NcmAb3xKy9pHfU3QH5bCoguGLFkHpJ5kpkbDqGV
 yK0MJ/gAw/CVhYb4f8dBODM9uY82tmgQlvuoQI4+HrVXjxVDwKHyo7FDuo/tXwpCuRf1
 mOc3j6Ce9D+OSTrc/ihFCbdI4S0xLIcJ40acKAn2DtCFdcu2LfzKtIZUfrCuGWgqPVuh
 GITKMRwThhELNoQLm7sU4f/2MYGRvV0UnYQQ1TZZfTnwHomA5LPtiVhKkw79X0cZZt8+
 f3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750498; x=1698355298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1TkahiOfYYlesTz2N92yWSyEJwEKIj0IcIbfbK44s1s=;
 b=ZV5B6VyR8RxpRLRq7bIGxXgCCRtAoh9KHs8Pp9T96hAWkuVErinl1q3ylbgVCiQt0D
 pVGYRxwkHMhk1sbn1dvLZlwEmmp61YQfOVOlXuMI9prOjeUCBOoMnUdMVXrAGH2Qllpz
 wPZixt0HM4ITtJI6cqKXX4lpHZ6F0iwH9S2FDHovpzCJU1CqJwgz1yMwgaU0SNg/POC4
 miTGdJswkDhxGaNzd5nBy+DWGlOM2SxEYI2cRigfpd7eJ8SNjc1w11z2T/djjn+ZZtAc
 7D+AIhdc+j6hNDL4OY44bPqSC2PZZRAcFuyypGKl34FK3rVQc9CQt3YaUo0he6Ee8lhP
 RDNA==
X-Gm-Message-State: AOJu0Yxbd5yGX//+1HxhNEJSynGjL5uPtfYsJwvprIH7RJBS07f1RSY5
 yUwUQflAOgqzxJmOaF38LMGpH276oZ6162KLQCNS/A==
X-Received: by 2002:adf:fc07:0:b0:32c:ea14:89e5 with SMTP id
 i7-20020adffc07000000b0032cea1489e5mr2409581wrr.39.1697750498710; 
 Thu, 19 Oct 2023 14:21:38 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d650c000000b0032d9a1f2ec3sm228657wru.27.2023.10.19.14.21.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:21:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 30/46] hw/audio/pcspk: Inline pcspk_init()
Date: Thu, 19 Oct 2023 23:17:55 +0200
Message-ID: <20231019211814.30576-31-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pmqRlEToVH7g

pcspk_init() is a legacy init function, inline and remove it.

Since the device is realized using &error_fatal, use the same
error for setting the "pit" link.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231019073307.99608-1-philmd@linaro.org>
---
 include/hw/audio/pcspk.h | 10 ----------
 hw/i386/pc.c             |  4 +++-
 hw/isa/i82378.c          |  5 ++++-
 hw/mips/jazz.c           |  5 ++++-
 4 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/include/hw/audio/pcspk.h b/include/hw/audio/pcspk.h
index 9506179587..6be75a6b86 100644
--- a/include/hw/audio/pcspk.h
+++ b/include/hw/audio/pcspk.h
@@ -25,16 +25,6 @@
 #ifndef HW_PCSPK_H
 #define HW_PCSPK_H
 
-#include "hw/isa/isa.h"
-#include "hw/qdev-properties.h"
-#include "qapi/error.h"
-
 #define TYPE_PC_SPEAKER "isa-pcspk"
 
-static inline void pcspk_init(ISADevice *isadev, ISABus *bus, ISADevice *pit)
-{
-    object_property_set_link(OBJECT(isadev), "pit", OBJECT(pit), NULL);
-    isa_realize_and_unref(isadev, bus, &error_fatal);
-}
-
 #endif /* HW_PCSPK_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index bb3854d1d0..f7ee638bec 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1283,7 +1283,9 @@ void pc_basic_device_init(struct PCMachineState *pcms,
             /* connect PIT to output control line of the HPET */
             qdev_connect_gpio_out(hpet, 0, qdev_get_gpio_in(DEVICE(pit), 0));
         }
-        pcspk_init(pcms->pcspk, isa_bus, pit);
+        object_property_set_link(OBJECT(pcms->pcspk), "pit",
+                                 OBJECT(pit), &error_fatal);
+        isa_realize_and_unref(pcms->pcspk, isa_bus, &error_fatal);
     }
 
     /* Super I/O */
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 63e0857208..79ffbb52a0 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -67,6 +67,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     uint8_t *pci_conf;
     ISABus *isabus;
     ISADevice *pit;
+    ISADevice *pcspk;
 
     pci_conf = pci->config;
     pci_set_word(pci_conf + PCI_COMMAND,
@@ -102,7 +103,9 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     pit = i8254_pit_init(isabus, 0x40, 0, NULL);
 
     /* speaker */
-    pcspk_init(isa_new(TYPE_PC_SPEAKER), isabus, pit);
+    pcspk = isa_new(TYPE_PC_SPEAKER);
+    object_property_set_link(OBJECT(pcspk), "pit", OBJECT(pit), &error_fatal);
+    isa_realize_and_unref(pcspk, isabus, &error_fatal);
 
     /* 2 82C37 (dma) */
     isa_create_simple(isabus, "i82374");
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 86dfe05ea8..d33a76ad4d 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -176,6 +176,7 @@ static void mips_jazz_init(MachineState *machine,
     SysBusDevice *sysbus;
     ISABus *isa_bus;
     ISADevice *pit;
+    ISADevice *pcspk;
     DriveInfo *fds[MAX_FD];
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     MemoryRegion *bios2 = g_new(MemoryRegion, 1);
@@ -278,7 +279,9 @@ static void mips_jazz_init(MachineState *machine,
     isa_bus_register_input_irqs(isa_bus, i8259);
     i8257_dma_init(isa_bus, 0);
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    pcspk_init(isa_new(TYPE_PC_SPEAKER), isa_bus, pit);
+    pcspk = isa_new(TYPE_PC_SPEAKER);
+    object_property_set_link(OBJECT(pcspk), "pit", OBJECT(pit), &error_fatal);
+    isa_realize_and_unref(pcspk, isa_bus, &error_fatal);
 
     /* Video card */
     switch (jazz_model) {
-- 
2.41.0

