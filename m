Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3081873lfh;
        Sun, 22 May 2022 12:14:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSoTzLberLWXnC5FMQWwDyym9+xikI+LOIHF2FYISPJZcc2fvI/t3vlcm5aivPgYQ5dkEh
X-Received: by 2002:a05:622a:143:b0:2f5:27ac:cdd7 with SMTP id v3-20020a05622a014300b002f527accdd7mr14273369qtw.172.1653246873904;
        Sun, 22 May 2022 12:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653246873; cv=none;
        d=google.com; s=arc-20160816;
        b=i1THjq262cnOEXk71mu5C+nzDLBjP4ytOHFp2MSjL77YDOpHmVDSi7NaZYnVWe1NcX
         wvYqEOzOqz/7jNRgsVKtrNQMFWb3frptTLXdzx9mPXEPfuoHAwaye0EFb/rvVKTKIR0c
         RV0EPvnut6knPt1wJagejMTLw0jaLxij1/+zFZYiTMBWOAGSW86/fPAlV+/f9Ne5E68h
         GMq2qxVSO6Wl7sYs+YrGwsHte93JzCcr1XVoB5EwCaMZ0jHnfdEacifamU22BeQcolQw
         WODVZEWFdf3YDJiMOnT2QivUh6h7L0Yg0YXCn90SNYG+svjdKftTtOcGr7GwByOwb1kM
         PKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=5nK8g1J+aM772UuMRFtM9t2Nf56o9ekowPA8C0gSulQ=;
        b=EXsyUDhJhwhpqXrsqvLmfm71Jb4L9w78PkyTh3j+hVpKEbi2ToqIziZGWL1iLIcV9H
         7X1BvjvdUXZ0d7d+eB+Paq70c2oEpA1nFT2SNK+tqpkGhv8958HObMC0RDEu49eol/fu
         LNsB1HdFK0HYv15NZCq4i8C5raF3yj8YIiMIHxplfB0HTKcnv7xwhYPOkjZaVMgg5lel
         1BNdMmQG26sL8DI3mgVwMCk9lcLD6rmeek/OjCVikiiqj5NhppR4XSkQ39eli67m4j+Z
         3Xw0GIG/zlrk36pzE+H7WoXq/Qw5sqJ+aJX8l4tkROvgVzoCx1mzuvxwDDs/mdzYs+kc
         /uBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=PrQUdp3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a29c300b0069feffa3052si2174026qkp.607.2022.05.22.12.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 12:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=PrQUdp3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsr29-0005lI-E1
	for alex.bennee@linaro.org; Sun, 22 May 2022 15:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCF-0000KV-6J; Sun, 22 May 2022 14:20:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCD-0003u3-IV; Sun, 22 May 2022 14:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5nK8g1J+aM772UuMRFtM9t2Nf56o9ekowPA8C0gSulQ=; b=PrQUdp3+BpLkaOJaoVK6Cf4/SA
 NBQh9btOEA2i0mKit/7k9HgosUZb48SIQGhqkvQSG/WAZ+3eC9f/s/v44tX7O1nMaYDe6+MdEepfQ
 2OX64Yqk/baFsRZsRwnBFMSVBEdFp1H6ZVjuo5OfdRJ0fvM9K0fD+c4KrmMQGA+Cy7B8oYwzgr0gX
 AMIo8Y6qBiHp8QZatwB1E/2Ky2FZKD1x2spKcCEJfSw1WcnWScHS8sMiIQtXGCPIL6R+oJDROtUt5
 UPD1VQEoaI8G15p5skkGmJLzecG1OKbNE6OvyFpwrIEdRPFxEloFeVMcUQ4Mlzwd6P2C60wZ5WAqy
 ecTQGtp0w4RWzBCZHiDO9Bk+ahdxkREGnPkYo2uOP/TgVsFv/K5JDqDRCx28QqzNq+20XXGh18h+I
 e/NZS2O9H1ZluJG0AkD4rQsF00CdkbozhpHBHY5ENOPvADbjKL1phIglQZKkmrrMUYSMitZNPCyjt
 /yC01ol0ugev4vHfgOCpA+jOmf5bfNW9gCf6G/RDyd5W2wwEbj5gLHkPwgUdtzvC4FO2uvHi+1lAu
 BxaWg3hf+A5x+kxFVvrWxe0LsR6yljWr3Uyb/yNyJHsRH55aYTSqjMUycF8xbQTuubNhrZfPVrran
 kVOqVIstHOTLHM0q01G/TQLnO6e3YcANsBw7mZwpA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAm-0007pH-O2; Sun, 22 May 2022 19:19:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:27 +0100
Message-Id: <20220522181836.864-42-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 41/50] lasips2: move mapping of LASIPS2 registers to HPPA
 machine
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mE57hX3DFhkq

Now that the register memory regions are exposed as SysBus memory regions, move
the mapping of the LASIPS2 registers from lasips2_initfn() to the HPPA machine
(which is its only user).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/machine.c          | 11 +++++++++--
 hw/input/lasips2.c         |  7 +------
 include/hw/input/lasips2.h |  3 +--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 1fceaf2072..f6dd79e211 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -286,8 +286,15 @@ static void machine_hppa_init(MachineState *machine)
     }
 
     /* PS/2 Keyboard/Mouse */
-    lasips2_initfn(addr_space, LASI_PS2KBD_HPA,
-                   qdev_get_gpio_in(lasi_dev, LASI_IRQ_PS2KBD_HPA));
+    dev = DEVICE(lasips2_initfn(LASI_PS2KBD_HPA,
+                                qdev_get_gpio_in(lasi_dev,
+                                                 LASI_IRQ_PS2KBD_HPA)));
+    memory_region_add_subregion(addr_space, LASI_PS2KBD_HPA,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
+                                                       0));
+    memory_region_add_subregion(addr_space, LASI_PS2KBD_HPA + 0x100,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
+                                                       1));
 
     /* register power switch emulation */
     qemu_register_powerdown_notifier(&hppa_system_powerdown_notifier);
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 8d3a2d88e8..84e7a1feee 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,8 +245,7 @@ static void lasips2_port_set_irq(void *opaque, int level)
     lasips2_update_irq(port->parent);
 }
 
-LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
-                             hwaddr base, qemu_irq irq)
+LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
 {
     LASIPS2State *s;
     DeviceState *dev;
@@ -265,10 +264,6 @@ LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
     s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
-    memory_region_add_subregion(address_space, base, &s->kbd.reg);
-
-    memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
-
     return s;
 }
 
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 5a35c22f73..b9723073e1 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -33,7 +33,6 @@ struct LASIPS2State {
 #define TYPE_LASIPS2 "lasips2"
 OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-LASIPS2State *lasips2_initfn(MemoryRegion *address_space, hwaddr base,
-                             qemu_irq irq);
+LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq);
 
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.20.1

