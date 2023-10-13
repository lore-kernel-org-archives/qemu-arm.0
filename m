Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1170017dlb;
        Fri, 13 Oct 2023 01:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE28iWuTethPwF0P0VsdNtIU6AUoT21bBDC3wzXQxJuhSTMe4/Dqa8WM8YmTwTh7O6THbUe
X-Received: by 2002:ac8:7f05:0:b0:410:9836:8066 with SMTP id f5-20020ac87f05000000b0041098368066mr27082460qtk.43.1697187218650;
        Fri, 13 Oct 2023 01:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697187218; cv=none;
        d=google.com; s=arc-20160816;
        b=ACbtGolEelo/ranYGFoJOp+tkaT9bkOWhadrqEyESjrwtNsOsjJQMO7onnuoL7GtuL
         LvjspqTQ+qVS9dlnAtURnlFDyDokgQxE5KleXSK+PQU8fGiKp1X9X8Vu7aFVCfVmYPVG
         PiHrtXRZRoYBdr0JnlQ2pzsTEuyHa6/xFwhTqbiyVZxF6k5Fh4kbmxOLcBDxnv8pVrHn
         5MY/nISaoKVaX86hdVwd55aaru/LvoxPQH6cCh2xQsDDmCBrc1KbihSSJaj1T2xz7EEO
         65IMw9b48JEXkwnT9Iic2fwmXvZAwi3xcZwlI38rKQ9nZgxvpgHl5xoBHnH2Uss3FMC5
         8L1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hOvGuBypuCWb7hwJnxTfq9f8trGAKqx0KCb984exKgY=;
        fh=rwdWCS3+t5yhuwz/YhqnsUuEawGPKPVrPFbpAYGu3rk=;
        b=zusbcjUj5J9ZX4HfUTtO7NVL/civsEPkxjQTQP/hDztVxbc/U+ytSFC8pjCqRgQ7ei
         ICh0GHF0iEDnNA0xb4Hb39ATRPBmIzmIIZeExBAuVxPbJ6pmQaWfpwxjrop6rm1G9s9k
         0VDElUXn+9B6cLBywcyUasdGVq42hSG5Y0RtWrCaTudBHBL0v0kLOAjehqxDideD56oD
         OMmnXvpNKcigTKOx2+qK2gkDxQB1GIf8vyyKd8Vx1NreCRclojrdtUIGziKVAwwx46Nz
         1WwBSUI9TOfO5OTGqXdbKjxi8UbdxaaRkYPHLxTX4LBVFCff4E9nnM7qiiyO4ZTAk39x
         27Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+vcCliA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ac85fcf000000b004181b8ae8edsi926052qta.246.2023.10.13.01.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+vcCliA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDqo-0001px-N1; Fri, 13 Oct 2023 04:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDqd-0001Bm-O8
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:48:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDqb-00018i-RH
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:48:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307d20548adso1689253f8f.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697186920; x=1697791720; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOvGuBypuCWb7hwJnxTfq9f8trGAKqx0KCb984exKgY=;
 b=F+vcCliA8X3dwFVx2x4v/jXyboVUflRqxJGnsOm6qMsXcGrR+fqHbDehW0r8k2ZpYN
 XVuRaJP3peGpWRUshViz3ytSkr6ka7JMGTlEejWq2nSUY9KY5NVYLvmGupBwF/MbpSqX
 c1Tw3DAfZSKz7i1WDcGfxNKST8LF1BhISn7s0lXbQgMABpz/B+0MRTDHKIaRRq4bLqxS
 7/3GKsJ5Oaj4idYWQmyIcXTM+axCAOtFJFvSE/4HBSXESiio1hwX1lm0t77wa3qlVsFQ
 cX9r/aLWZqFe0FPOP3wDVongEbO9iOwFqDoI6kMa2vN1tcItTPRMuxzlAVEKzp6+jOEP
 s/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697186920; x=1697791720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hOvGuBypuCWb7hwJnxTfq9f8trGAKqx0KCb984exKgY=;
 b=rzohPZ8fco6utF+R3EWJHYLtoIgDc+nIAkLafhOlGNXGpYv957+L9OJfP6lFJ6DhdW
 3DyIP2o7Z8XpxG/SRFlVWZaPGYqSSQI5iqHclbMz2s/vOI7HE3hFXCfs5ab3KUooklu9
 C0SJ8J8nqLA6fXEDuP+EHFMUsJbBsze64PCVg4DkaktsRyYIWJ1s0WcSxXmPZ3WU/obk
 0A0Z/ZXinD2iHkNRsU9rxXWVkKZAPYI8W+0imx3Xs/eYOh2294W4qlJDhrW/pcmfRel+
 LocR2ypk+vzqtbFHX/0ZerDoi3P2b3NuBcfKBVMFtRuc6MYaPSZYLskXFK3yq7HTqdv6
 EQ4g==
X-Gm-Message-State: AOJu0Yyvy+7GJ2QM+QCFkG8KJBChleBv7E4Yc1d7QDMHQIhDDFuTeGZh
 vyn49Sw5Pi4ei05N14aakTPvHw==
X-Received: by 2002:a05:6000:108d:b0:313:eb09:c029 with SMTP id
 y13-20020a056000108d00b00313eb09c029mr22881580wrw.43.1697186920539; 
 Fri, 13 Oct 2023 01:48:40 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:48:40 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org (open list:NRF51)
Subject: [RFC PATCH v3 52/78] hw/char: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:46:20 +0300
Message-Id: <299c3af2d3ce4394394fb952e30d97dde24dca04.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: mbymy6x6vW1F

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
@@ -170,13 +170,13 @@ static void uart_write(void *opaque, hwaddr addr,
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
-- 
2.39.2

