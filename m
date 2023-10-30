Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1939256ejc;
        Mon, 30 Oct 2023 08:15:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGfI+7a1YzwcoObDgDz6pOnyRWLb+CmevoTewMKUjuF5nhHdPzZQBJNAUiArbwguel5195
X-Received: by 2002:a05:6808:4d9:b0:3ad:f3e6:66f8 with SMTP id a25-20020a05680804d900b003adf3e666f8mr8862021oie.41.1698678958170;
        Mon, 30 Oct 2023 08:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698678958; cv=none;
        d=google.com; s=arc-20160816;
        b=eGRz7l0GUiOF5C/N176G7JHiJ2rkJ0+TBiyaK5gKmOn6vsc2HLvSM4s3c5/hm/CKx8
         ajL9ta6sPfrpPGwGvUJlL3aXbfdGrH1ePzLoZQA7UBTbHpZOU5OFJGkdjxfx0Ybmec4E
         4xlHdujO9LAmZDYUc4+gS7D4jxiLXjDFO6RidCbzW/EwtspdN5Tya/IOJU32PQwYAXOs
         h0vBO8qc0IYuRNaN2JkIb/InBKvZcZRUFymHC8gonyq33B6rnwNMxnNL6MAu2lgUaKE5
         NFn8eBuVTDoUuM8rmDODXFCnmCi8PUwEirJmI/Mww27fQ/AUD+bDqhFv0owh6gbLIXZ2
         kqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uRsK1HoIvBsHW04NClN2xLhUJUoshMkHuCRflJWwSIs=;
        fh=aCejG00mBFvUFyicGgwZuyWNmnQkTwZFkToSNY6Vt+0=;
        b=kXH+sPT8Tyq2gnl8/L/szUxAVFg+jEqVbfx4bjkMdjM4FpPtDyqvkhzbj3FuZ0bX13
         Dz1E4VfTQFZmCfBuNe8MdV36dNM4uzjwEXmLQnjHyZp8YXXsZeE2woYIcBSaLllJHTv9
         09MycGRsEvNajhHciAW73HmQ9IZsUTKob7iTIBMbN4bPSrbhZxGjQElW2pTSrmoOWLFK
         J1OJdISP7ZVc3R1t/88r1dXc4xKO4IKy0z2Ng/DfRQ9mjldIXKQ5ph0TZe/OiEKJYNJv
         e0cA8h3qa52nr+913myQH9TgUcpknD/FmPqqXKZNbVpMT04vol5EBDGI+9CNt6Z2XhZ/
         TQMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=u00We0yH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs16-20020a05620a395000b00767b7c58ac4si5972850qkn.605.2023.10.30.08.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 08:15:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=u00We0yH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxTzc-0002bv-Sf; Mon, 30 Oct 2023 11:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTzc-0002bY-1K
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 11:15:52 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTza-0002sh-CA
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 11:15:51 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c5210a1515so66926701fa.0
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rt-labs-com.20230601.gappssmtp.com; s=20230601; t=1698678948; x=1699283748;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRsK1HoIvBsHW04NClN2xLhUJUoshMkHuCRflJWwSIs=;
 b=u00We0yHzWTCK/bccSWx54NxZ4yx6o5CQ15E2rI9HkgsWuRd0gjOq3PURyKCHJQT4u
 EuGFOWwYxzFoPPQsaHw7Ry8W8beNQgUBC6tnpdH+7kWad0KeDBn7OXzGNySBSfqJcpnS
 nVNQtabne01FeExVO3W2yssQCu1PqflcDSm1BUcBjuEpWR+3+sL3oZs9NinLhNBF3Hj0
 rgpR5AN8yBfYC1nKkIOGZcM7n+vfMDouJ2WFwqccIL4PIv4lgv80XMCcw/czQcusOdZj
 fRsjqKVkAAAxUwYDNBYBIl9NWRzqY/XOegfH7CFQqOX4Gj0MLaFhQVLYLaUC/c/fI6wU
 ZHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698678948; x=1699283748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRsK1HoIvBsHW04NClN2xLhUJUoshMkHuCRflJWwSIs=;
 b=Eh68wmq3HIOT53iQCGbjT/6wj1EIacUsh8upeUbo2HQmqHnWkuqMoIlg3fBYBWDTPQ
 oldUWDcxmTbbmhK4+XJqWUMLzvq2sULx+5ejINnKyKIMPxv6sFnXlx+g6zdQPk4FPqGR
 bpDvmsmQTWAUuFKuZYFTujLWGZribnA5leUVdyrOeCVTKL9jwjc/dRyQNfgduP241TVL
 SnfhQ/hQp4HamYMrbYTyZFR/aJi7KDoV9S71Ilk/k4vqpjCI35XOWlEYGtEoVkLhwBIV
 LYR0A23IA/LdngnmCE7cdwhvO8YY+1CRUdrY26EUaSbuaeTInxxcwcybo0rzGt/5TG+b
 Lu0A==
X-Gm-Message-State: AOJu0Yzo40F3RJqegsqqflfY1VHitLlmxB9m/lrPxWH6mgeuS6BE4IED
 j6WVYirT24PT+8Bx8n1OVC4OSg==
X-Received: by 2002:a2e:b0ef:0:b0:2c5:f54:2497 with SMTP id
 h15-20020a2eb0ef000000b002c50f542497mr8340714ljl.39.1698678948158; 
 Mon, 30 Oct 2023 08:15:48 -0700 (PDT)
Received: from rtlap47.intra.rt-labs.com (h-213-136-33-86.NA.cust.bahnhof.se.
 [213.136.33.86]) by smtp.gmail.com with ESMTPSA id
 j18-20020a2e3c12000000b002b95eb96ab7sm1282274lja.18.2023.10.30.08.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 08:15:47 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: alistair@alistair23.me, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 1/3] hw/char/stm32f2xx_usart: Extract common IRQ update
 code to update_irq()
Date: Mon, 30 Oct 2023 16:15:16 +0100
Message-ID: <20231030151528.1138131-2-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
References: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=hans-erik.floryd@rt-labs.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OCF01aBYbrr8

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
---
 hw/char/stm32f2xx_usart.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index fde67f4f03..519d3461a3 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -53,6 +53,17 @@ static int stm32f2xx_usart_can_receive(void *opaque)
     return 0;
 }
 
+static void stm32f2xx_update_irq(STM32F2XXUsartState *s)
+{
+    uint32_t mask = s->usart_sr & s->usart_cr1;
+
+    if (mask & (USART_SR_TXE | USART_SR_TC | USART_SR_RXNE)) {
+        qemu_set_irq(s->irq, 1);
+    } else {
+        qemu_set_irq(s->irq, 0);
+    }
+}
+
 static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf, int size)
 {
     STM32F2XXUsartState *s = opaque;
@@ -66,9 +77,7 @@ static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf, int size)
     s->usart_dr = *buf;
     s->usart_sr |= USART_SR_RXNE;
 
-    if (s->usart_cr1 & USART_CR1_RXNEIE) {
-        qemu_set_irq(s->irq, 1);
-    }
+    stm32f2xx_update_irq(s);
 
     DB_PRINT("Receiving: %c\n", s->usart_dr);
 }
@@ -85,7 +94,7 @@ static void stm32f2xx_usart_reset(DeviceState *dev)
     s->usart_cr3 = 0x00000000;
     s->usart_gtpr = 0x00000000;
 
-    qemu_set_irq(s->irq, 0);
+    stm32f2xx_update_irq(s);
 }
 
 static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
@@ -106,7 +115,7 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
         retvalue = s->usart_dr & 0x3FF;
         s->usart_sr &= ~USART_SR_RXNE;
         qemu_chr_fe_accept_input(&s->chr);
-        qemu_set_irq(s->irq, 0);
+        stm32f2xx_update_irq(s);
         return retvalue;
     case USART_BRR:
         return s->usart_brr;
@@ -145,9 +154,7 @@ static void stm32f2xx_usart_write(void *opaque, hwaddr addr,
         } else {
             s->usart_sr &= value;
         }
-        if (!(s->usart_sr & USART_SR_RXNE)) {
-            qemu_set_irq(s->irq, 0);
-        }
+        stm32f2xx_update_irq(s);
         return;
     case USART_DR:
         if (value < 0xF000) {
@@ -168,10 +175,7 @@ static void stm32f2xx_usart_write(void *opaque, hwaddr addr,
         return;
     case USART_CR1:
         s->usart_cr1 = value;
-            if (s->usart_cr1 & USART_CR1_RXNEIE &&
-                s->usart_sr & USART_SR_RXNE) {
-                qemu_set_irq(s->irq, 1);
-            }
+        stm32f2xx_update_irq(s);
         return;
     case USART_CR2:
         s->usart_cr2 = value;
-- 
2.42.0

