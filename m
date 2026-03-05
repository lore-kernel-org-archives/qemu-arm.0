Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22DDF513E4
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:11:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGt3-0001CS-3Y; Thu, 05 Mar 2026 17:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsx-00015C-5b
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:35 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsv-0002He-Iw
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4837584120eso65553055e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748572; x=1773353372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkqwSLJa0xJ6zHaGrPgGg+nUA0PuvLRB97+M4LUsZGQ=;
 b=PcXAjtoHDLhw0GL7WT39Gsk2o04AvINa0cAOPj+1NknxCrxxi9YLLR7ehCZUBzEYlI
 B5wS07Z5TUKi1h/3ijv88IFHqRVG5xxj6glyIWoOI0GGohaqgknRVCHG3LDELtFoLTqe
 ByOFzfryFwSoBrho5a6Q4tNKcs1aP/nWb7wNTaIAwVkg43g33XtZ/f5uCG9H77xVdmjX
 mIAOV2Jd6co404Xb7IdFSj6dWGgUbOeUoHeRcYirzVl6B0DTr419iMZ0+rtp2JlrWWZu
 F8wvsUxXYBCEDrRm9Rw58j/BWRJHqIml2GKx42LVJKsnrBYawejED9va/xxAt3+Q0nf/
 cs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748572; x=1773353372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xkqwSLJa0xJ6zHaGrPgGg+nUA0PuvLRB97+M4LUsZGQ=;
 b=Aw0UYgN3kHp6YOBKcj5TLMrhRHdzWkimt675CsM8dJmVY+ftcrXY6It2digtg/gFyn
 /42f9QAFtOib6+y2K9Xc6Va80BF9z7C1IrVnOYuBNinalAdTEh6RY5tBfNHodYVUE+m8
 70sZ+HxvAK4RsUOt2d2K+Ws9YOsC0+vFixA8RqD9igM5EgDTDj/UEfMsIpx6N0Ng2S2a
 sO4SGSyXacd4/e1teYyiBM7ntMLFHPG1kX3P1EDgp+VwHmMP2SgztHbwrRGTy4G8/GDY
 sWBZctIQ6zectMb63Fi35y48BIQK2MCyl2EpYAfqD4sf+1XTwSlGooLphP9t8tdfCna4
 JbVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPP+MoSM9xjHLojjGgcRJ6XZnBQLyYkhKRFeva0/JBQzUQu/R4Jav5eKwVPT5jxYuwnPrEhXsb6g==@nongnu.org
X-Gm-Message-State: AOJu0YyDRnGngckBxvhbVe5Xwcj15kvj6KdWpRPYjJD3RBhOAamHYne/
 2wqIAJhr1i8NsjId+VKxpqzMkAqX+QxgNgW9kAtyYESFpnEv08Yng3h5
X-Gm-Gg: ATEYQzzHXhC/DlC6+/dTVZ+iUfzWRwim7dYnRA9WNOwB7ON/mddGLcDcbFC5ww7jZBs
 7r4Iyh0wbz13U0nZXJ7M1yD3g650Jlr8dCtn2ul2WkkCjegggPR3TGvJ6Vku4MjWVdff46HpENo
 /PGOHErmrtGk7tt4Nbkrmry2IzI39a0juZzoBoRVMqmiUMifAt8uYsl3YaSdgyQj+OsFPTVaiWB
 151dGttZN3qpiXvoE4CfgbNNQLazI/PYVR7lo6trg2686mZPfNz4ca7ExmklDR4UqcwHxgsO9AW
 BB+Ga9zsEkd416Zx9NFH1UURwFwbTU7tWBR4bn0PizJlHLis+hjkUjNOIDptRk6id59uXS5of3G
 Bek9XZLeVksiK21/bd04SbqlzDWn0PuJqxZaRXz26Bf24kA/rB2SVjf654yyuEm5Z215CjDINZa
 ByXGv63LsHvG//1TgYnR3HhHMfDEFafJzbCK9CW58I/b3HHmhNxKZF6BxSD+Ak8SvrrmkkiHXPf
 PWt9mZsTStiSac4t2sW+nrTl5C2GKxE9h9xcoVd7vQn8f2daqYcmgS02g==
X-Received: by 2002:a05:600c:46d1:b0:480:6bef:63a0 with SMTP id
 5b1f17b1804b1-48519879438mr136817645e9.21.1772748571741; 
 Thu, 05 Mar 2026 14:09:31 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 09/14] hw/char/serial: Add constants for Line Control
 Register
Date: Thu,  5 Mar 2026 23:09:06 +0100
Message-ID: <20260305220911.131508-10-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Substitute some magic numbers by named constants for slightly improved
readability.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index f73de1ae4f..485b98f03f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -39,6 +39,11 @@
 #include "hw/core/qdev-properties-system.h"
 
 #define UART_LCR_DLAB   0x80    /* Divisor latch access bit */
+#define UART_LCR_SB     0x40    /* Set break */
+#define UART_LCR_EPS    0x10    /* Even parity select */
+#define UART_LCR_PEN    0x08    /* Parity enable */
+#define UART_LCR_NSTB   0x04    /* Number of stop bits */
+#define UART_LCR_WLS    0x03    /* Word length select */
 
 #define UART_IER_MSI    0x08    /* Enable Modem status interrupt */
 #define UART_IER_RLSI   0x04    /* Enable receiver line status interrupt */
@@ -153,23 +158,23 @@ static void serial_update_parameters(SerialState *s)
 
     /* Start bit. */
     frame_size = 1;
-    if (s->lcr & 0x08) {
+    if (s->lcr & UART_LCR_PEN) {
         /* Parity bit. */
         frame_size++;
-        if (s->lcr & 0x10)
+        if (s->lcr & UART_LCR_EPS)
             parity = 'E';
         else
             parity = 'O';
     } else {
             parity = 'N';
     }
-    if (s->lcr & 0x04) {
+    if (s->lcr & UART_LCR_NSTB) {
         stop_bits = 2;
     } else {
         stop_bits = 1;
     }
 
-    data_bits = (s->lcr & 0x03) + 5;
+    data_bits = (s->lcr & UART_LCR_WLS) + 5;
     frame_size += data_bits + stop_bits;
     /* Zero divisor should give about 3500 baud */
     speed = (s->divider == 0) ? 3500 : (float) s->baudbase / s->divider;
@@ -430,7 +435,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
             int break_enable;
             s->lcr = val;
             serial_update_parameters(s);
-            break_enable = (val >> 6) & 1;
+            break_enable = !!(val & UART_LCR_SB);
             if (break_enable != s->last_break_enable) {
                 s->last_break_enable = break_enable;
                 qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
@@ -676,7 +681,7 @@ static int serial_post_load(void *opaque, int version_id)
         }
     }
 
-    s->last_break_enable = (s->lcr >> 6) & 1;
+    s->last_break_enable = !!(s->lcr & UART_LCR_SB);
     /* Initialize fcr via setter to perform essential side-effects */
     serial_write_fcr(s, s->fcr_vmstate);
     serial_update_parameters(s);
-- 
2.53.0


