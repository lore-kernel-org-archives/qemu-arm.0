Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7535048njc;
        Tue, 12 Nov 2024 10:13:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUl03kLRuQQNYRsQb6b9BXbylmH/U853lyqJdnMelkpomY2Reo4m3gIL5eiejepiBYtHinVjUo5KnNlPA==@linaro.org
X-Google-Smtp-Source: AGHT+IGtqYVEy1WjUHIOogUfQQZaMk6yoD+Xcl2LYGg29kTQp9SKJjwBWgZlo27M17hrrPYKL/DA
X-Received: by 2002:a05:622a:1b1e:b0:458:532c:1e6f with SMTP id d75a77b69052e-4630941bf6fmr191913561cf.55.1731435188989;
        Tue, 12 Nov 2024 10:13:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435188; cv=none;
        d=google.com; s=arc-20240605;
        b=l26XspQVxj0NLkHVqcdsSE6YpROKrX9nBpkTX8zyG2vTMWCimQYeXBScLbJiFngj+J
         /GwYIq1VIxzOERQOAPJxOOgpxmUKbkQAXo0fY+VHjGlQq+xUgqKkJRmkFn9TQ8/7/mls
         xGzMhLq7X5nJMnrG/3B2kY+jXzbd8fubSDra6kyfUnQr3ctOe83F/r8SnHUlPPFAGcW+
         AllZGNNZbATSf2ziV9Q/uM+EyDjx/Fbxvo/yUZRsiUxo8FVTCOVoFIJWj2zDDhc94hvP
         EDkxjdQMYRGoRYy+z48x/2cpmw0bYXaO5SOKxGz3Yb9Jfs4YC9UP4/Qepu/cZ/E9KZjW
         kJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gI2r50YagKyW5wjp5nKAHhdiWka7DOBUV8IxoWF7VBw=;
        fh=pMPdOatqIsp/BDtre5KbjwQNuwTZ4VlnCTu8Xe67mSM=;
        b=I7DTJdU5C0m+OBaK9uDIQIzO58nLG9ekTa0qr3IYrshdU2g+l9TGNEw7tBO1fOZNFu
         v/kLGL5a5PS2qf3aC3tTCj033lyk5PRgtoZ9/PBuRdL5QCH/ybO3XkWRECw2loNUQhjU
         KRxtWh4GvZYstuRS5hetx5UvfvIoRv8+REsA7wiVydnReT9AAvvTgYjycuxnBqOFlg+t
         tekdc78DZqpkPrChpfz7OMg2eMqcrn5cdF1W777qh4WA/U4On8bVrR7byHI95KbLuw9H
         ESKJ6gpWG/EXxYN+pUBiH6XlKkqyEXJkOxihyfHp/87K0PtRfKEZaaDL24p837CZsUpe
         UWtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q5FxZrwr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6c4a79si149162871cf.718.2024.11.12.10.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:13:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q5FxZrwr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvN7-0005aj-Gq; Tue, 12 Nov 2024 13:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMm-0005Ip-OZ
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMl-0001y2-As
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so75301995e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435110; x=1732039910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gI2r50YagKyW5wjp5nKAHhdiWka7DOBUV8IxoWF7VBw=;
 b=Q5FxZrwrzHcyZsvR2yYfhrNXbeVXyvPScvRu6n9M18XyWEcosFy+Q6REs1W4+0VglH
 Lu/qS1luLeN9BRD7xm7jaqkf+PDF1jrTU3cwN5vq5Nk5xU+S3hzww1rBJMT5uJ1M+sGl
 LMyoL0sT8ibwyapp9tg8lRy4aGJvwN5dgU0rL5ToAYLsWnUY/p8KV+RMqwwSHcjDMef7
 IWk3/1ED/BaSCTyBbYOyYkODyXEMrEo8ukqaXkK4t/m/mjLSPlGWVKoWxnJzirqRNzQi
 ceOknAOr6UOWReD1y8fF8k5xFHufvIQaIxc7jzjJ/5wRUay+fel2twTDhXbrtFb58G02
 YL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435110; x=1732039910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gI2r50YagKyW5wjp5nKAHhdiWka7DOBUV8IxoWF7VBw=;
 b=IAUmaz3jIwc+pSM6TeucIbOjQZKjRAENoReJSxkEC43eAceF0W5CPxE4Cv8O4Dx+Qj
 nsyjllTPqnVPTqF7ByrRr1SzAfc6zwVedJ0sXpvC03CYmIKQ1YA66XTwCLog2D8RtFKb
 KDOsJqNYA7mEuliSkphm8azSqAu67UgFB/gJ1su0Lk0K7PgcwE6Xtw7I4X2tR5lc1fkO
 RUGeyPwLbIle4REYw4fNZIsE/cOXx4mtyUCmK+PQXjjVG71ow42gHMR5Cdpyl6F1EQ72
 eHc0s0iFyzfbk8TLhsyDMhSachkH8+G3yJ975kxzT4c9IiWW0Vi4Oze4W9LhxEhWiOuz
 /LIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd3I4oiJQ4gfDY2h7N0lO/XF3Wm7J4dytDUnJyM5JjOB5ZMkb0UkEUaYk1htrAgK0U5wiBy7fXFA==@nongnu.org
X-Gm-Message-State: AOJu0YwCkeXVb/5+t9RIPTJrDIYfJIzxTQ1CKHdAQrMwjhy5xHCM4VaJ
 OuKASVxMFIap6V4buyhXFLKwypUIRh8JPeyDjeMkq7UzM7AbT8wcoM52NhO5Rc4=
X-Received: by 2002:a05:600c:5494:b0:426:59fe:ac27 with SMTP id
 5b1f17b1804b1-432bbf6ba6emr171715275e9.26.1731435109702; 
 Tue, 12 Nov 2024 10:11:49 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda0517csm15935048f8f.96.2024.11.12.10.11.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/20] hw/net/xilinx_ethlite: Introduce rxbuf_ptr() helper
Date: Tue, 12 Nov 2024 19:10:34 +0100
Message-ID: <20241112181044.92193-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 7xxdmlocFJrG

rxbuf_ptr() points to the beginning of a (RAM) RX buffer
within the device state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index d4882f43f7..fdbf25fd91 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -99,6 +99,13 @@ static void *txbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
     return &s->regs[rxbase + R_TX_BUF0];
 }
 
+static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
+{
+    unsigned int rxbase = port_index * (0x800 / 4);
+
+    return &s->regs[rxbase + R_RX_BUF0];
+}
+
 static uint64_t
 eth_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -220,7 +227,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         trace_ethlite_pkt_size_too_big(size);
         return -1;
     }
-    memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
+    memcpy(rxbuf_ptr(s, port_index), buf, size);
 
     s->regs[rxbase + R_RX_CTRL0] |= CTRL_S;
     if (s->regs[R_RX_CTRL0] & CTRL_I) {
-- 
2.45.2

