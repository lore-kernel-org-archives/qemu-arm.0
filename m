Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1344352ejc;
        Fri, 13 Oct 2023 01:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1DqJEs7uEodLB/RJ30km6VI7zJ+ffR+pHt/CY1vsars+9y8npRy3FyHxIRXjRaX3CuC6K
X-Received: by 2002:a05:620a:4051:b0:775:9041:73dc with SMTP id i17-20020a05620a405100b00775904173dcmr28322400qko.16.1697185321727;
        Fri, 13 Oct 2023 01:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697185321; cv=none;
        d=google.com; s=arc-20160816;
        b=N+yyKLood4n4fU06VVnKcDLI2DnIBM4OHA3EGbD2/g61klkctjBP2MKQ6ld+tGIYZ6
         KKSPeIN4rqek1Ue+vR98ktLLuMArEP2fpB33DRAvH1cKrcngjyH7JDPUqTvkzWkU6+CE
         j/cxZGpZFTSqzhvxpt6LUyhAR7/aDIAe3sUzSh8sVKf3ijqsCEKqmnnaCz1Tf7Ge97xk
         4dhTUuAIgqvGBcYYrsP1chv+PCs3ysmKDLjtPcp7Uyad1gChFQRgqYWFi8+wfXRApgij
         Cn1uRv8cI+6av4aiM6llxY7yOoGmPWLL8wdT+uecVfUFAv4i7q01SnX3aSCd434PSdMm
         lH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=otVaVJDhbuHMXV9luSXKOD49q6dBPVmJnIkfSS0ltHs=;
        fh=rwdWCS3+t5yhuwz/YhqnsUuEawGPKPVrPFbpAYGu3rk=;
        b=EkvXqn1KUMTPdzHxH9FC8CSYPPzV89LttoIwthUC9hnok1wtgHdPwdCVHusHRVuyCD
         0zArsMyK9DDb0BWalxgVpnGciY7fCZjY6RdwMKK8lqx/0g0uoDWSO9rTQ+6kxLM9dcL/
         cw6733wR17vDlUFDDsb28n/ecMJS0bDWeHosN9OLeya7mGbrd+zSfEfYhagVaRPYrCG7
         6K2r6bungndZyuzr4ueBSGh3IBe55xv4FJdwpb9gz/okSF66Wewx9APtObs+jYEd/+kI
         tfgrgBhik6j/MuNIgilZUTcc3C2cepbhE0mb9UmhPWHkIf9vWWvPfys+pt2wXBwwq7qd
         DIWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqoWypOo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05620a454a00b0076eef941267si859646qkp.495.2023.10.13.01.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqoWypOo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrD53-0004zd-1R; Fri, 13 Oct 2023 03:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrD4y-0004Ya-Q7
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:59:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrD4w-0007Bm-U3
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:59:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4065f29e933so21044605e9.1
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183965; x=1697788765; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otVaVJDhbuHMXV9luSXKOD49q6dBPVmJnIkfSS0ltHs=;
 b=VqoWypOom6q8NmHSodwcTngRVwJDpPy2SaYnpvRDBTC3SNfrUaC9IyRPXTD0+h5k3L
 JhKnm8w0549Elrgu7yM4+5kE3Vduld6ANTFvLvfKhTGHyqZvkHGt6HiHafae48xfkN7g
 ONEHlObQVTFnt/QkiK7SjYQkorS67rsuwTEApHjHHKH+ocJlEoKh4wh+vGPeGzYx3hHY
 1/55hgA0FPkeCd0EUPpQZ0n1ms2wbN7cjJHXuDeusI9f3Kwz9bJjPYWaLxTUeT3tnV0q
 F//oVeFvHft6fQ1M/LUEVUkUtlztSxJZqCWCiYLNy5ohQCXdhhcj0wtpLCBXYYbEjHCS
 R1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183965; x=1697788765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otVaVJDhbuHMXV9luSXKOD49q6dBPVmJnIkfSS0ltHs=;
 b=Wo9QLO7YWZ8SsBcGET/5/jzT4otlsit5295SL+iOLsYWNzQxYOmwaVED+07Wz6HffT
 8PxJFD+tm4YUkjZGs8uKYq96NeMVtmjIGb7w+bCGCwm2PTK2VL8f4OjkbBUNy7K+cFwb
 Eh3UI4qLUVUnWGS/fClymGXqCKDei00p8y64wfqc4OIQKF0LumOyEXkQjuSn8k7VfXE/
 7zwgRJbcyu8NlYZSTp6AWZ46BjdZcnbn21An0xkgAj0bI3opl3u/WbK9Q13V3L44sytm
 Uk6+Pe/XlLsTRph4DhCPxZqo6axfR6B9IaxNlVTTJ1IBL5ImOR3ZUCJ1wH4bDZU3USxR
 sClQ==
X-Gm-Message-State: AOJu0Yz1M2zWQ5RW9tCziXbnz3bGememG8KpCWrgPPdOWhEwUAG0Mipr
 c4gV3x2QbLc13hzE08EgUrkrwG2Witt/7ynJd5g=
X-Received: by 2002:a7b:cc8f:0:b0:403:7b2:6d8f with SMTP id
 p15-20020a7bcc8f000000b0040307b26d8fmr22923873wma.2.1697183965315; 
 Fri, 13 Oct 2023 00:59:25 -0700 (PDT)
Received: from localhost.localdomain (adsl-26.37.6.0.tellas.gr. [37.6.0.26])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c224a00b003fe23b10fdfsm1798183wmm.36.2023.10.13.00.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:59:24 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org (open list:NRF51)
Subject: [RFC PATCH v2 52/78] hw/char: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:57:19 +0300
Message-Id: <892c67609977bb00b317089ca9b6f9485be226fe.1697183699.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: lJduXx1l6Qs1

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/char/nrf51_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
index dfe2276d71..3e2b35c7ad 100644
--- a/hw/char/nrf51_uart.c
+++ b/hw/char/nrf51_uart.c
@@ -113,79 +113,79 @@ static void uart_cancel_transmit(NRF51UARTState *s)
 static void uart_write(void *opaque, hwaddr addr,
                        uint64_t value, unsigned int size)
 {
     NRF51UARTState *s = NRF51_UART(opaque);
 
     trace_nrf51_uart_write(addr, value, size);
 
     if (!s->enabled && (addr != A_UART_ENABLE)) {
         return;
     }
 
     switch (addr) {
     case A_UART_TXD:
         if (!s->pending_tx_byte && s->tx_started) {
             s->reg[R_UART_TXD] = value;
             s->pending_tx_byte = true;
             uart_transmit(NULL, G_IO_OUT, s);
         }
         break;
     case A_UART_INTEN:
         s->reg[R_UART_INTEN] = value;
         break;
     case A_UART_INTENSET:
         s->reg[R_UART_INTEN] |= value;
         break;
     case A_UART_INTENCLR:
         s->reg[R_UART_INTEN] &= ~value;
         break;
     case A_UART_TXDRDY ... A_UART_RXTO:
         s->reg[addr / 4] = value;
         break;
     case A_UART_ERRORSRC:
         s->reg[addr / 4] &= ~value;
         break;
     case A_UART_RXD:
         break;
     case A_UART_RXDRDY:
         if (value == 0) {
             s->reg[R_UART_RXDRDY] = 0;
         }
         break;
     case A_UART_STARTTX:
         if (value == 1) {
             s->tx_started = true;
         }
         break;
     case A_UART_STARTRX:
         if (value == 1) {
             s->rx_started = true;
         }
         break;
     case A_UART_ENABLE:
         if (value) {
             if (value == 4) {
                 s->enabled = true;
             }
             break;
         }
         s->enabled = false;
         value = 1;
-        /* fall through */
+        fallthrough;
     case A_UART_SUSPEND:
     case A_UART_STOPTX:
         if (value == 1) {
             s->tx_started = false;
         }
-        /* fall through */
+        fallthrough;
     case A_UART_STOPRX:
         if (addr != A_UART_STOPTX && value == 1) {
             s->rx_started = false;
             s->reg[R_UART_RXTO] = 1;
         }
         break;
     default:
         s->reg[addr / 4] = value;
         break;
     }
     nrf51_uart_update_irq(s);
 }
-- 
2.39.2

