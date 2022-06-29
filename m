Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp429186lft;
        Wed, 29 Jun 2022 06:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0z6qOct16x/V9DSMVQGP7CFaXlBurNwuOH5ngi6Vkk1Nh4PhEjNOalCx5yQbihCh/WuBf
X-Received: by 2002:a05:6214:e83:b0:470:54c3:e18e with SMTP id hf3-20020a0562140e8300b0047054c3e18emr6607354qvb.3.1656507903979;
        Wed, 29 Jun 2022 06:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656507903; cv=none;
        d=google.com; s=arc-20160816;
        b=UlYieGLOX6tC27S83w2+U9Hp+P7NREFtPtOVbvcf43ArEox7XjNwzsfuNXpX9ifYkG
         RhU5bs8MgSowwdtQC4NZh6Tmy8Wf9ezSfXDdUR9+tK+vow6+r9PhSWP/RFsxbUFCqTmi
         Qf3sOwj85Bv/tLD00pU+/n6O8GUHdHg/OmAFrGZCIJjq2JtUQk5HfNVmpvjfEn7SdPE4
         seuSfety/9Bc7iRzkmFLsulmf9OHs+PPPRk6GqH3GPQbppn/JcaZ8JWah/EuO6znO0Gn
         H+RI3AQMNzelWyqZHboD8tmu887+E7kwSac82GDbh1R8HatQAil+dEPd+zAtzvQaNAs5
         HfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VrrIbZOpvkUUv5LCGpRSGYib3z5cOrpFGnnIw2haosk=;
        b=KceYf7d9wT9QwVl40NyrViaVRKiZs+3Casug2uxxX9rLokzbAMrnEDwoM+Tpzty0yH
         CpNgwjiDDrF5qcmhY7X0fdMWzqL7kUCy4LzebfxvW8SADWZvTAaSXUx2GHlGu38yw3q6
         Npkiq+f5D4XZq1rtcK2RaRf/zo4IWYnu1ROKazZiN2vnIPzoZv2mPV3srBlJvcpZDEZT
         XXoqeMerjG2Y2frIgOdgQphCv08F0de3fF/HpjSE4uDpDMVp5ums9OMR6qM2qlqRGx8Y
         e27nsFQKWfpuUmH0VQ9iFP58JekIUf5VkasAtsub4P9EL+ZpzPOXnOxQOGoOy9K63crB
         t+mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=sGUg8G6R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020a05620a411400b006af44eabef7si4762530qko.640.2022.06.29.06.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=sGUg8G6R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XNP-0008FZ-9V
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0L-0007hS-Qf; Wed, 29 Jun 2022 08:41:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0J-0004fd-D1; Wed, 29 Jun 2022 08:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VrrIbZOpvkUUv5LCGpRSGYib3z5cOrpFGnnIw2haosk=; b=sGUg8G6RrthTuwcXYQCV6l6iCh
 AnueXDyUMM2eNfVIwu8TA0oROzTbqxbNrzRpyUMcdCwi9QU7mdiXyUH6pxkOn4VUC9WntIcQ75hfv
 eGBZTXPba0lBGFqA1rUwW1RY2JaHC46ORCOceM7FQ/fCDLzphoV5H8gLLw3smZMDxDYhxQxLxljni
 1585MNnnK0uIJg1gDvJLJG1ECtPyTf9YyWF3KCe2LmHVLWM/pkxr3E/5nn3iSwQQRnoNnF7LAe0QL
 kKXADwB8UnCxaDHdy2KfAFIR6D2U6wrzTy1dnfgUX7qPvkXpZC989YrEe/H/dl867sfPW7ikKVBK0
 DOLjmTOxTciPBsjZD/0B7ucU6dwswNGeZkYgrGKr8yf/u03OGvk1mZvIatyiqbZkB1juuW00r8AEB
 5CCOo8jo7Kl1vqR8JsCfsPCUNl5AqwW0YqunbtiCqmZmm2lxfvdKYKmiZMbai2o42zsRlz0yiGfWT
 hfiK3Z+Wu30r6Y4idepUdW25mvLfxWUC6Unkt9RkM36TXZYWlznN/M7KrzHn5ULzUe5GMImHk8jUo
 iXeKhgXqISucuJa6GeHFUCrxKIEn439KUOtg4dFark7B256ZE92ggq0gFxs9kr8o4Uk9PD8+oG+Cy
 KzVM8tQbp83mPc3n1zazrpL7XSzif39tg4RnJYnTE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wz2-0002tZ-Ke; Wed, 29 Jun 2022 13:39:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:58 +0100
Message-Id: <20220629124026.1077021-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/40] lasips2: don't use vmstate_register() in
 lasips2_realize()
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CLw76z6HJkEo

Since lasips2 is a qdev device then vmstate_ps2_mouse can be registered using
the DeviceClass vmsd field instead.

Note that due to the use of the base parameter in the original vmstate_register()
function call, this is actually a migration break for the HPPA B160L machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 9223cb0af4..d4fa248729 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -272,8 +272,6 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
 
-    vmstate_register(NULL, s->base, &vmstate_lasips2, s);
-
     s->kbd.dev = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
@@ -319,6 +317,7 @@ static void lasips2_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = lasips2_realize;
+    dc->vmsd = &vmstate_lasips2;
     device_class_set_props(dc, lasips2_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
-- 
2.30.2

