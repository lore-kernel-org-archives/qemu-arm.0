Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1332512ejc;
        Fri, 13 Oct 2023 00:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwARl0IIzgl6seTchDKmEwpkF0EdmR//F0BStIMbDGI/So7TZ1/5INl9+cTJkqexH/DOVz
X-Received: by 2002:a05:620a:4454:b0:772:6384:f8e8 with SMTP id w20-20020a05620a445400b007726384f8e8mr37004629qkp.3.1697183762939;
        Fri, 13 Oct 2023 00:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183762; cv=none;
        d=google.com; s=arc-20160816;
        b=SeK+F3wIGgHJTRa9ffG3BIZ4dn4ubaSZXgAyMyAK+2YOv9Cc36VAH/isYfVKZtz+22
         AT9xTqW2No/SZVktF8dPEkZhiMnY2/jVRz4ObaXzF5UkyRgVWZoMt8FJ5oRk7tNUDwPq
         oqDFIOSCs8TIlYmxhVrX04+xTv4yAqEFEpmncVwdAtil3pRBnSS1emmOBwBGg2tZn1pL
         EoZR2CaNTXk83l5Cw395QxolddNPO/4HpIjey71Bgc8EiPKeubJR7RbF+xSCA1Obnt3N
         dEIZ1IuBAtxm7pO9ZicXOmxND595M6Y5OsPIFL2Htpt+PdBxp8fIm+fDmoZezl0RiMNH
         pv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g1OhV6qS5rsFOKsCecCidHB0/dji6/R7YehoLsjqmZ4=;
        fh=EBkdUMj9C3M39N2OwVKGknmDrMiEMM9+YXYSxxRBlxM=;
        b=LiDImcUM0oJ211kbBBmYCaCfk+wuzngK4/g5bzAlqxe+OqZNVuEjhOT9sXOf06tC+I
         Zu3dmZeyXLPWBKeuE02Z66TJRyKGOiEAin+rDHmo9AX0R5oqdXFPOAtQl4x4ByI2xCAt
         olehvW2rExPMjubMyxMAHPiNy2C7jvPJdHBLAeg5y7nbMm5DC8CUL8L8rvzyfYbjHWjH
         fdyM7okVMfnxBq3uRE1X1lKKXq8NNvc+Ppdrs0UjTJl3xvduPSNS9n3DrZfZsoASig6m
         H+v9ydgwd1xJyGIsF9ZYIseaBjmGdv/+zpHWRz6kQzXD8j5cA0ZDo+EnxlTBznUp8eaS
         lwtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RjCeVuVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qw20-20020a05620a8b1400b007726448cd7asi796903qkn.191.2023.10.13.00.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RjCeVuVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCzF-0004qy-8S; Fri, 13 Oct 2023 03:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxw-0001Wo-Oh
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:52:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxd-0005Gq-6E
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:52:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-406618d0992so18933475e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183512; x=1697788312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1OhV6qS5rsFOKsCecCidHB0/dji6/R7YehoLsjqmZ4=;
 b=RjCeVuVAPqICNQZK440RqOkZBdilWzt6gINGsMBcV4WKZsoKXvOt/U5D1a+SwnhBDW
 xWmXZ8pNl3swD0HGfodec7RJxfxr6olt+Z5E/4S5OlhkcCJuPovsrteSOO+Mzv5Dfij/
 mvp6gDhneEUNX7bE0QZTZYfJQfjHlWJ4LRGlES/ESnA5q8TWnhJL/XBSQZ1KUqweuxc4
 fCYb6m/9wpApjO3PMmSfgOAMm//cFlinm0SERZmnwS0KXLX74y4NE45iel0syhGNaPvI
 Wx+o6BCTRA5LdrQpcxUAKXSfgOnyny5N2UGZfBmn95WYj6IZIdhPJWWOX1Hm3Wzd+5JP
 ySmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183512; x=1697788312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1OhV6qS5rsFOKsCecCidHB0/dji6/R7YehoLsjqmZ4=;
 b=VVZUIQC16E3d7MJ6c3Nn7Xm1UukPCto7BSxycN+BJ2vpXhfVCx+tAcEDueQKeEqvyL
 Rj4NiYuFuUMUdWcMB9aUYW4cl5FkFPuDi44Uc+JSk5mTq6QTloqdAWamm9n+42F1k6UJ
 8fsecOvhbTtxbOZamkhjJVVTfCbxSh7ugYuhVjOggei+mtLSY4m2F8xyX237nM082pby
 1zNynNkAYsK2myvyx0muz+DvDvHMS9k2D7SAZs+cagVlY8Da2I0rVXIg+DjlHkgPLA7s
 si+WOt2lW6W+HAoyAJUUQl2XGkkQM4fPbLwbmFpI4UNk8MyYNp1Aq67yHQGY32uvhmyr
 R0DA==
X-Gm-Message-State: AOJu0YxJdkKtMWgKJjNjY/Lw9lhwoGHVZgwdOLq6dRxDQ3kb6bOXlTzV
 0k8AtdwhSlSrXnzZliqFHB3vag==
X-Received: by 2002:adf:ecc3:0:b0:319:7c0f:d920 with SMTP id
 s3-20020adfecc3000000b003197c0fd920mr24613357wro.57.1697183511822; 
 Fri, 13 Oct 2023 00:51:51 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:51 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH 51/75] hw/char: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:48:10 +0300
Message-Id: <c5632702ea33995c5f4f02d3b1e70eead463be40.1697034504.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
References: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: 2YPWkCf+PRlz

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

