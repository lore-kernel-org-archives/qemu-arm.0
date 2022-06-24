Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp348111lft;
        Fri, 24 Jun 2022 07:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1saGS+kmQIexvMv1p3qXP6m+JenmKLuktYiOUcuN5VUj19oZsMYIsZiRwWkftfAwXWaebYN
X-Received: by 2002:a05:6512:3183:b0:47f:79f3:af9a with SMTP id i3-20020a056512318300b0047f79f3af9amr8568301lfe.182.1656079587744;
        Fri, 24 Jun 2022 07:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079587; cv=none;
        d=google.com; s=arc-20160816;
        b=Tuvoj1gSehoiFg9VdXfj31yTsncgiOSjnv6kIzFVdr0j0x1d7lTcz+6pEIhhclnvR4
         dvbIepbB/P/rAIT7NBpDAg2Wf0fJ1h6EihepwyKvEDPVdN4HZCzPIgQS+4IQ6bImZ7hy
         /2E0hvmglGw8AD0mGeUGWLIYBeJMbOmvSIU3xuvKymCBSU8bN3gW1CJPh4oDvNUg6pqD
         EMocbEbwBUkULl7wu1Za6LHaYLGptY84N7YnLGD95uB1Tu/HyL2MFyzDuWuRVlaGeuP7
         FXB+CPvm8n/M787W898+BO1/J5v23/fuk8r+mNFSikjF9fHr6YBGdyNz0ZE9fzMxU9IV
         Cs6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=f20XAKlV73C1AtBoFgDM7PTELLB03NW7scoQvrrrph8=;
        b=fia+VhMFjHzm9E0J+01HhBiMt5wMB7MIDDm0hje104fzRP4qx7c1gqefyO4uAXygmV
         hbAO5wHLKIA1B+Wm7x+bicVW0BtRwEYQLs/Yd3Ogm6TFjotI++2bXiVC+FWaek3mc1Qv
         N9WsNAOJ5KVC74cZjG98BTXdxSI4VwF+S0bGmHM7YfzLivN1tvF9E9JNzLmEI8b2OiSa
         q+CZ/1vkfsZpfflwAtZBhXh+ie2LUff9hiBeh7UfaBi+lCmm93dQcopQGIjI8hLEWtq5
         UNmQtkQpePbmmiS4zm66zvOjTLThMGUVGimFOPzAM+ot9oUlRRJaHY0S8nz3vWX2JySn
         p+zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=xYOpeQBz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a2e8942000000b0025a77f8c5bbsi2682578ljk.264.2022.06.24.07.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=xYOpeQBz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jx4-0006C2-NH
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jam-00020P-TY; Fri, 24 Jun 2022 09:43:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jal-0005Gp-CT; Fri, 24 Jun 2022 09:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f20XAKlV73C1AtBoFgDM7PTELLB03NW7scoQvrrrph8=; b=xYOpeQBzeCKVA8xiS0FPBUqCuO
 pFTA4YqwVDCMhDZD6Tg5YBU+DNyw52GpGoiALIRBCq/pV+Wojt8Yt/TQIHgh8V8CwkWIgZv/rq6lH
 5NjaKAdwoxQLinpPz2j+IBqTQMqFM5Hom2i/h+9/CNg8zf4JpNs0b0LR8xotn7qH2IO7AIYyZD9UM
 3pdmYoRc8XiE3/Hyri9mM3FrVu3X3fvo7udgdKwXdaBZxOIJ2Q09/qI4ffxJ9lGyrSVNYUGwDxEh1
 fhcg71sfDOiPKUEHHKm1aN/insyNmPid0J8n0T6rWHUQ8Ojxo9fqcsTekgJIlj24ru7aAgJnNK6FI
 +Kfm+bHsHWCEifvyF0ismcG8Zq1M3l0jOCbtQqE1lMUCbObqkBTMuoSkpga22SwtgRh4jEzPabTzi
 2CPFZ2u+lzk/gZ1HA5PnurWxlqtx5LOGAYTbCAKqC1lk8q2D0xqdzw4kPsQ03ez1kDFYi9U/X0qaC
 s6/lK0fv2CYQKzs3OhxNsnMp+NyCRkfEiaiyRhDnvemokOokor1yVQYnS18p6Dxe3iw4R8MhXGC8r
 9nx8mRlaj8bzPJBMfQ/dMbBOAu0K7pYAEUlh/Ai15o3D7SI8tLFNpiw4Z4EsiySA09GaqxMxmiWwN
 exMCAfwcwg0t8al5F+1S3sqmNha6A/A3sPoF3Fm6M=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZ7-00037t-F9; Fri, 24 Jun 2022 14:41:45 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:42 +0100
Message-Id: <20220624134109.881989-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 27/54] pckbd: alter i8042_mm_init() to return a I8042_MMIO
 device
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
X-TUID: yrSSSEQM7B+b

This exposes the I8042_MMIO device to the caller to allow the register memory
region to be mapped outside of i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c         | 8 +++++---
 include/hw/input/i8042.h | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index b8623d2f9a..702dab056c 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -708,9 +708,9 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                   MemoryRegion *region, ram_addr_t size,
-                   hwaddr mask)
+MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
+                            MemoryRegion *region, ram_addr_t size,
+                            hwaddr mask)
 {
     DeviceState *dev;
     KBDState *s;
@@ -730,6 +730,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
+
+    return I8042_MMIO(dev);
 }
 
 static const TypeInfo i8042_mmio_info = {
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 59d695a9dd..d05cd33e3c 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -64,9 +64,9 @@ struct MMIOKBDState {
 #define I8042_A20_LINE "a20"
 
 
-void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                   MemoryRegion *region, ram_addr_t size,
-                   hwaddr mask);
+MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
+                            MemoryRegion *region, ram_addr_t size,
+                            hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
-- 
2.30.2

