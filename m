Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp738100ejb;
        Thu, 15 Feb 2024 10:02:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9NvbdIBQ8j241Lcxq/BofvlSSOn71r2ikQDy9lT3wqiWSjWmfx5/238U1WAdEH9rdWAFb1q2TZhuXXmzN0yEdF09UmlOi
X-Google-Smtp-Source: AGHT+IEqni+SX2BYusM26J/cOY619Ji6xnoVPRpBJGmzxl9VszY5nHWWmD4V1V+6hq/LRPZ6KufY
X-Received: by 2002:a1f:e401:0:b0:4c0:305b:694e with SMTP id b1-20020a1fe401000000b004c0305b694emr2149474vkh.13.1708020171627;
        Thu, 15 Feb 2024 10:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020171; cv=none;
        d=google.com; s=arc-20160816;
        b=Efdf2+qQb8E8SCjPYmfHktpTC9Vv8BHnopDuaJBG+dSgbRFR/2dn2OePpbXK0ruHkg
         g8Lc6gbj53DCLrthFslPCnVBWWWcl4zLQWskSZeL1nG/WxIus7aw/EImLcCW5BgHKMWZ
         FvV61XZ/wHKhM8ueEFS1nLNuv73Gt+3ezXloZ3v06zbwdWrlDyfPdLsERHoM5yP0O12k
         45WUcCAJHGOp6Q3CEM1fdHW1bx4Z4RuUJE3774Xv1u4QqETb1Wb9awiIKi58YK9Qhww9
         CVHW/KYpeEiDvmgySl7NS1lAvbmLgF+nQdOEsbhu7t34h0vgnIvSAlPoW2/4lHKokfEm
         qMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qpxuOXpE/IReVLTC/yU2rQlOGnVVc7L2PdtnHDAApI4=;
        fh=YO5x1XT5l0PGnWfsyAbRbxCqOTsDzRid4q6CoYgPhno=;
        b=PPHFMPSQpTuIxpTtjrjT3fEWtSrUDDgYvunggjkr6yyGtdYLogNPcfap7c2VQddb/s
         YoliqBMaan9ud45vP85kqTXwXIje6OEmyhgcECqDEVyVkqAgYyI09JbGYG2XPJIaljLp
         HlYe0bgxWQy4T8/h+KEdv66zse6wMp3Zxr4BCSCGIHJDWgNOvS9cowDH0CBnTMT+j64A
         /9NMHAiOO9LTPsEDkZn3BMDeDRUo2S9rNv38nsg1FvxZGfUiAwKZEDdf8KkKqAMlfPdD
         DYv8PF6fQWN06NQe5RyPHBQEzaQjRHMYM5HQdZhwiJrIr/ugHOcb3WpqrhbOMGvKqDvZ
         uzzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caVifrBx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l189-20020a1ffec6000000b004c0303f5e30si368599vki.272.2024.02.15.10.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caVifrBx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag2M-0000FQ-LO; Thu, 15 Feb 2024 13:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag21-0008Jo-7g
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:21 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1x-0002CE-44
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:20 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-563b7b48b9aso922944a12.2
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020012; x=1708624812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qpxuOXpE/IReVLTC/yU2rQlOGnVVc7L2PdtnHDAApI4=;
 b=caVifrBxtaanOdRzfmGMH+SaYh7OnjsskI7CnEhJoH7NCE7vZmgVhER0HKeB0k+5ot
 rkYDJW2l73mXsq3FPjOyhXDjAIr9nKiRNKDaQeBkpq71PAOzbghtU8wr7zd734dKOsmB
 Eecs+Ek2qm5hVEdxEZH/M/cm2OZmuLBXH+g5s1YVSeUvNDSKGfEPtoSR+YGas7z3ty/R
 3jpXobzoyrwe2yzjDi13qQ0t023zHWAAqpBTcQPf8dWHMGggaJ2/rH1UViVj/lFH0Kx6
 krPtBcdyM1sE3RO0biRQ2D5cTM3b1r4Chf2422U0oaP9HG4fq7xcO3mAEkz+0tfr8/Hu
 r5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020012; x=1708624812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qpxuOXpE/IReVLTC/yU2rQlOGnVVc7L2PdtnHDAApI4=;
 b=OFyrsa2F+QGnXj8iFrYK62rDu2T0Uvv+S3BfH/YLjPNVCO9ks50U5vNbP0d9KWofH6
 pkEYuao1M4W5haoi7T9Ogy9mhv06FzRlpu26O7shy19ehmHHwQfez7nekTNKgnm5WuP+
 Qy+b6CeKFtckLuwndXErj+y65K6t/VZ4HDFZgh6IDpvIIWaljvc1bHHBGnau27e1lBAx
 qagtZd1lxCJ8Wo+zpG9mqhUQoXB3YKsq0sOjIp2kH3BmpAqcvwZd00V2esxZHVyecaRY
 lJUcREbRp9jY8GTIGF0b0dMNYsGaPNpFrzwSfoO9yISwFFxOtiQNtyF8kIV1YYXSOMqz
 DwRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSgpbto1CvwyQrRuiBqiBaGByIX6xNPhs/FZq/JvAXntEZ/7Z2bHfJf9ctpjX/doEa9mTQWbzpC7oQH+1N44YhvEK4
X-Gm-Message-State: AOJu0YzZIckSgQwB+nMTVoQyPxxgKwMzjts64YUP4ynt4a1bYY3Ph0zR
 2ZjMToLRTGIQhSRg0lDvpKt6NlvZOW/zJZ6NjbChlakbJ1q8CHeT7QGdr/X4nRc=
X-Received: by 2002:aa7:c445:0:b0:55f:1728:3b33 with SMTP id
 n5-20020aa7c445000000b0055f17283b33mr1699734edr.40.1708020011889; 
 Thu, 15 Feb 2024 10:00:11 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a056402414600b00563c179b993sm465926eda.11.2024.02.15.10.00.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:00:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 21/56] hw/rx/rx62n: Only call qdev_get_gpio_in() when necessary
Date: Thu, 15 Feb 2024 18:57:15 +0100
Message-ID: <20240215175752.82828-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UejDLECSi/Hv

Instead of filling an array of all the possible IRQs, only call
qdev_get_gpio_in() when an IRQ is used. Remove the array from
RX62NState. Doing so we avoid calling qdev_get_gpio_in() on an
unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213130341.1793-4-philmd@linaro.org>
---
 include/hw/rx/rx62n.h |  1 -
 hw/rx/rx62n.c         | 16 ++++++++--------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index bcda583ab3..766fe0e435 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -67,7 +67,6 @@ struct RX62NState {
     MemoryRegion iomem2;
     MemoryRegion iomem3;
     MemoryRegion c_flash;
-    qemu_irq irq[NR_IRQS];
 
     /* Input Clock (XTAL) frequency */
     uint32_t xtal_freq_hz;
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index d3f61a6837..560f53a58a 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -148,14 +148,11 @@ static void register_icu(RX62NState *s)
         qlist_append_int(trigger_level, levelirq[i]);
     }
     qdev_prop_set_array(DEVICE(icu), "trigger-level", trigger_level);
-
-    for (i = 0; i < NR_IRQS; i++) {
-        s->irq[i] = qdev_get_gpio_in(DEVICE(icu), i);
-    }
     sysbus_realize(icu, &error_abort);
+
     sysbus_connect_irq(icu, 0, qdev_get_gpio_in(DEVICE(&s->cpu), RX_CPU_IRQ));
     sysbus_connect_irq(icu, 1, qdev_get_gpio_in(DEVICE(&s->cpu), RX_CPU_FIR));
-    sysbus_connect_irq(icu, 2, s->irq[SWI]);
+    sysbus_connect_irq(icu, 2, qdev_get_gpio_in(DEVICE(&s->icu), SWI));
     sysbus_mmio_map(icu, 0, RX62N_ICU_BASE);
 }
 
@@ -172,7 +169,8 @@ static void register_tmr(RX62NState *s, int unit)
 
     irqbase = RX62N_TMR_IRQ + TMR_NR_IRQ * unit;
     for (i = 0; i < TMR_NR_IRQ; i++) {
-        sysbus_connect_irq(tmr, i, s->irq[irqbase + i]);
+        sysbus_connect_irq(tmr, i,
+                           qdev_get_gpio_in(DEVICE(&s->icu), irqbase + i));
     }
     sysbus_mmio_map(tmr, 0, RX62N_TMR_BASE + unit * 0x10);
 }
@@ -190,7 +188,8 @@ static void register_cmt(RX62NState *s, int unit)
 
     irqbase = RX62N_CMT_IRQ + CMT_NR_IRQ * unit;
     for (i = 0; i < CMT_NR_IRQ; i++) {
-        sysbus_connect_irq(cmt, i, s->irq[irqbase + i]);
+        sysbus_connect_irq(cmt, i,
+                           qdev_get_gpio_in(DEVICE(&s->icu), irqbase + i));
     }
     sysbus_mmio_map(cmt, 0, RX62N_CMT_BASE + unit * 0x10);
 }
@@ -209,7 +208,8 @@ static void register_sci(RX62NState *s, int unit)
 
     irqbase = RX62N_SCI_IRQ + SCI_NR_IRQ * unit;
     for (i = 0; i < SCI_NR_IRQ; i++) {
-        sysbus_connect_irq(sci, i, s->irq[irqbase + i]);
+        sysbus_connect_irq(sci, i,
+                           qdev_get_gpio_in(DEVICE(&s->icu), irqbase + i));
     }
     sysbus_mmio_map(sci, 0, RX62N_SCI_BASE + unit * 0x08);
 }
-- 
2.41.0

