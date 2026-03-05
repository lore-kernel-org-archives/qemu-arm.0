Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18267F513E1
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:09:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGt4-0001DQ-LR; Thu, 05 Mar 2026 17:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsu-000128-8g
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGss-0002Ga-Q6
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso126721045e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748569; x=1773353369; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/8vBrNspQwC+4wrO/zavy+wMEo5y5nyjJoJrIaKZns=;
 b=FMxzRkv1Cw7z3y72SyUoiK5N7TKDkFp7m9YV05ocumUtloutuV0ud8jvPSHDZ+RoeS
 4sPbW9tWYq8HEPWr/rbcYTMIYADUKXTsN2JRt1M14/5tbdVrv3FQ4xt3FhxTZOUmdpkH
 pkZp91XSCyOcpoEaP9SptY//L+fgRPf4MuuvDWFxEE0dmkr8CzeLt9S05WBV6P0qSfOX
 KNWhuVLskN3a28bVb3BimyHYhioRmSi9qg7m+u3+mHxyat8JnnXiNLMcnpCpzMvZIYDV
 b91wjUcROrwpQiOqpN6baGsNxVXMTVIg7a4HwhdzCBtzo8HGfnLN82hmXFpYaTFctKdX
 90vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748569; x=1773353369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T/8vBrNspQwC+4wrO/zavy+wMEo5y5nyjJoJrIaKZns=;
 b=fSeN62Zewu8HXM/1c+Ot5LVf36bqyu6fNbOCNWFBG2MlqAtDaTsgORQhMBaMEXbV9d
 jJ0XKpWNabobIJk+thyEuDWT8ek5gykQC7Rj4O4M18W/knO8Eit96I2Jmn0TVAaO/MTL
 9JCa705dY+xo3p3Zo4s9Ff2MugF4HR24lmIBQ9xIPe8n+8UtactGBTLnFiZm8q7AEn0x
 TC6OJxKZOWbg6KO5z92a4j7zvFYLwVQLahohAUqS/TtM0SX+4fkXh54GkpDLBn7B2lmk
 c9gj0QdzDSWeoPjsLoDKoGBjCbsnkaFW0csXA3qLh4fjzwPr2J6UY6FZrOPLrmLNB2te
 pJtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiW0LCssBnvBBPhcznFDvdF9ooAKdpKpZhuXpKBWTBc7GDxovA+Xke6j7Zd7i2yckoOoJdE4h/ZA==@nongnu.org
X-Gm-Message-State: AOJu0YwngDkgIDHwp4jFnunp39z2WxNc5NfPKhyEiQkgFWYSp/Gz2KOK
 z8JHfYAXf7+nxnIIfA5yQ15Rt4n9jMk/wOCT3RCiCQClBfE3My1m3rh3
X-Gm-Gg: ATEYQzw/IYm2/AkwWLyy2/ktsP+faVD5/gDrWn50lp7Q9TaLyRokmTUTulPWqAYycNt
 gGA14XASxOgwYum2ogi0rRGr1XbpIbbsS3BKN0dbNOoHT8ZngylRsWJBs1ZEeFLtdF03/V9pJ0f
 TJJjz9cHP90qzXhMEru4tQvFsfLrhsKR/zi+HLZEE6b6JyqVN7j8cOA/rxe60C3eQp5pVrssu1a
 4cwxIslnxAiuJgRjHiG7bpRekg4cn4tB4XPgWt5PRahhq2z8mfEPhRwpFLmKMmqUihWBilEjpxm
 PjVwGtmWDjoYTo0JnyFMkDix44SHw/5gENEjCFMUc78BrxmzHJp/DIXQKxwEaY0z0vjea+IskMN
 g1qfig0dcQSt65Z3zbibXs/BHeqYvANIjc/zw+ygdmjLCYQZqtFlPDMZdugedgQ3tpdffPkchG8
 wVq9tBB5B6QlI6n1XdehdYDlSkADWAPEzGFRJI4A4uxy4mpIt4xKapw6lTndlf/ooi64Wl1ByO5
 ap+Xm8+pbMbgYo5Fq1iEurgZ585CgEp7pUBo3GJqV9jtrY=
X-Received: by 2002:a05:600c:198a:b0:480:f27c:6335 with SMTP id
 5b1f17b1804b1-485235fddd0mr17724115e9.25.1772748569104; 
 Thu, 05 Mar 2026 14:09:29 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:28 -0800 (PST)
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
Subject: [PATCH v3 08/14] hw/char/serial: Remove unhelpful comment
Date: Thu,  5 Mar 2026 23:09:05 +0100
Message-ID: <20260305220911.131508-9-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
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

There is no "is_load" flag and one can tell from the method name what
the method does. Remove this unhelpful comment.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 2c558cb9fc..f73de1ae4f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -281,9 +281,6 @@ static void serial_xmit(SerialState *s)
     s->lsr |= UART_LSR_TEMT;
 }
 
-/* Setter for FCR.
-   is_load flag means, that value is set while loading VM state
-   and interrupt should not be invoked */
 static void serial_write_fcr(SerialState *s, uint8_t val)
 {
     /* Set fcr - val only has the bits that are supposed to "stick" */
-- 
2.53.0


