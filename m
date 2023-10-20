Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1374833ejb;
        Fri, 20 Oct 2023 10:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZqTwLfKtR3UgVvxg7DkQKc2E6gfJAkrfNDkgeF4cfTIF0DmYogQtGNJgyDfVkvw+XB9cs
X-Received: by 2002:a05:6808:20a4:b0:3ae:2362:7137 with SMTP id s36-20020a05680820a400b003ae23627137mr2538936oiw.59.1697821285210;
        Fri, 20 Oct 2023 10:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697821285; cv=none;
        d=google.com; s=arc-20160816;
        b=esNmDe8PAq2+y5w0oUzjLlTDeyzVzFZKcMhJgJ0BfYJV2UWnk1T6FVjimAsnq1CetC
         5wzv0ZJA/aHK39p57ZoSTJcAksC7na+3lS3FxGcdvMzv0sxzb41vn7aSkEK1FHg/N20u
         PRc5NMYkwwr/32kqb/rPaFZSKeQK/+073HUAOXkcdXscJ+J4GI/eCBM/PYB3iArCnoTp
         IHFVLP4agM8Mlo3UF5eB/vZmxOPuEByh+26OYerTxgA4unF0F+/OTrHJWa+n/SdQTdkk
         C6bPu0r9ABYxzPxMdKo49MhIZ3LBelARWwzTIEa9trIKAMbjjADDfi96SijQooAsGAAl
         HOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SZbdJuO1XaqUdGSgYAbogilRMESNu95+lra/cS1fLyE=;
        fh=CSV7ixVglXzcxb66Foh/+b7TyX0eETHj/jUl4XtrXPU=;
        b=J3aF7sV+MH8K1u11OfCeC8/pIG03LMlDWWUIMFWXboatt5hpYFUhUUcaly5B9E7hj+
         fjyDOxgUqJha8NjCPBlKxxDAnfKi6vuj4VfG4a0g4j+uYxKCSEy3BddFqMDO/0WAf4We
         wh5MDQa6/VFrhRZ3qd0AcLXTD7B4Kqt/9GGdUcqJf1JvikOyyvrIvc0HPkGT57GZtvaE
         lKsEinYFeQUU4dl5QhWMVfU1s9SgjlC2YIpcCLHmkED9gI7qX41rTRhSYkNN0aU+zBcq
         Sd9M//joWG/Dsd7+1AF5GJopKtZkXTBwf/qOqmL4XVbQ9j0IE52VQTp5VItARhY4I6aL
         +Mqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVUy9awI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eg14-20020a0561302b0e00b007b636f092a6si238805uab.56.2023.10.20.10.01.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 10:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVUy9awI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtsrH-0002UO-6B; Fri, 20 Oct 2023 13:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrF-0002TT-Fi
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:22 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrD-0008QC-OU
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:21 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso16795701fa.2
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697821218; x=1698426018; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZbdJuO1XaqUdGSgYAbogilRMESNu95+lra/cS1fLyE=;
 b=rVUy9awI97SavE1SO8l0eH2QA8JPf1HYrNFHWczkuHoecnEaSuDsv8N3zjprzRXC1I
 TqbiDUWYsUG2FskVWWO+fRPJTPJfpNBB44HX66sn2XLdqOFVCQEk7gc5LhGfEHWdYCRq
 bN1sq0PPHWIhDX7YIFm8Z1/RUtEf1QGdsluktf9fIMp9h6l+dUHm+0xoZElPwrvqQQDS
 bgTjgRfZ76uaBtvQNv0msD96wbImrC7V0n0ldlL5wek7yV5b+Lc/PP1A6w6bwdMNRVP7
 6xUiESrMUt6YNGa+2EqWImZB0hJP5JXr7v2YY0KxFkqFUE6sPDrvuvggGlPb8YxjiPbZ
 s0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697821218; x=1698426018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZbdJuO1XaqUdGSgYAbogilRMESNu95+lra/cS1fLyE=;
 b=DCTXjetRHHJaf/Ka6NtLg0oX+EjJaEFsckQfncAWS9KdyzFy8dgI+Jod058asL13P8
 uJcDio64XAqvIrjAlq/hxWn936lxGiHdH231du8qTY8k7D5RjNIuhv93MyvXB1rHnS6v
 pCa1xOWavqleFQcVIvYYjTHDfYem2qCWlsJ+KlYuf7bvCfV5tSMMnU03InVTmHeGD7F0
 HFbDA+vPHACXg94GC6UzE8tRlxSzXBm0XplSs4DsfYTJpOizKRk+9SOH5ypjHN09n+6r
 um0/0mjUE1zB4nkhMPrjoA+Br0W/VuJnxLYvrCcQiJGMTl4yRuapyCY0SRwLWqMvKuY8
 uQEw==
X-Gm-Message-State: AOJu0YwmzmaEqq/y/Lpo5Y1pPIdPWJv+1cq/uAzcWNl2Ef923w3T30nJ
 SeI85K8S830IO4HJQPDa4S1bjw==
X-Received: by 2002:a05:651c:1a29:b0:2b9:ee3e:2412 with SMTP id
 by41-20020a05651c1a2900b002b9ee3e2412mr2520307ljb.22.1697821217878; 
 Fri, 20 Oct 2023 10:00:17 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4151000000b0032d87b13240sm2079188wrq.73.2023.10.20.10.00.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 10:00:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/4] hw/char/stm32f2xx_usart: Extract common IRQ update
 code to update_irq()
Date: Fri, 20 Oct 2023 19:00:05 +0200
Message-ID: <20231020170009.86870-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020170009.86870-1-philmd@linaro.org>
References: <20231020170009.86870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Mfic+suNqmMv

From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.41.0

