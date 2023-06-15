Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp767097ejt;
        Thu, 15 Jun 2023 07:24:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6PJ/+HGv/3y/LkStU1Fw/WlifqyOWmSzVubZMQrQKQQzZ/rGR/FnHP8wTYIEKQ/3vQhXvO
X-Received: by 2002:a05:620a:201b:b0:75e:cd1f:d93 with SMTP id c27-20020a05620a201b00b0075ecd1f0d93mr17729777qka.50.1686839076244;
        Thu, 15 Jun 2023 07:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686839076; cv=none;
        d=google.com; s=arc-20160816;
        b=rTyCKV4/eJS/bcxOkKnaaDDltO3owUslKn00jR9WXJ8igy/A+kNgqnhuo4KRUkx499
         oX/n9fYdNXLTgLXvD7PPuq/Ph8qgtHIG5tf1zyf1P7EnmQGdvmacwHAhN6C4ZpmW4kkH
         ZibCdGvu8Pk0yZSK4Dwo19+EX/Q9LG0HJiBIFlxPYgL6B8jLS+nHyDcv5k+G13q+1lvn
         1JglYHj4nFTIGcJhQF0/fFRYLMCSni7cLmwMkvHp8zLxneqLTVHk+e+yo5cNIikMVmnI
         gb5Xo5u1lGGjSfvUjdgzVc49QktJMISfDDemkbSjD7OquT03G1u5SK57Fj4N90mMlvam
         2R2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=yA71C8OFTIOl8Hd1ZXAKfYQtoI2BdzK4hETTxGSuuP0=;
        b=BnDv6/e92YEJ7PCfgdFttVoIDEuOjcmkYMMh0M0mIQcoMJlwPd+wlDST+M7ojCzVmW
         Yf4xefgQ4gzV5682DNUDaAYv5aoArFBXCYH8mXx0cA9uy5XV12pJBD9XeXm8nCuZe9k6
         7ZxXa2/f6smse0fJRE4LU0TStGXp+pPJ7gQV9PefB7NsgNPR4/GRFPYSCx3fpEFX6o20
         35zVH16n1BByv9g/SVAcmfKscThHmjHER8tiJ97TOkvDvMGtGN/W52ffzw1CYv+c2Jqk
         oFfBWWZtekZ0Yid37xhvX9UHuwZR6ymy5GwlHbfWdlXAanNTPRM18JrZD5uISJ0MU5Sp
         o/jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020ae9e710000000b0075ced896377si9568381qka.19.2023.06.15.07.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 07:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ntk-0003BB-50; Thu, 15 Jun 2023 10:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <postmaster@kaiser.cx>)
 id 1q9nti-0003Aw-4g; Thu, 15 Jun 2023 10:24:26 -0400
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <postmaster@kaiser.cx>)
 id 1q9ntg-00086e-JY; Thu, 15 Jun 2023 10:24:25 -0400
Received: from [94.118.66.68] (helo=martin-debian-2.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <martin@kaiser.cx>)
 id 1q9ntX-0001T5-QI; Thu, 15 Jun 2023 16:24:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v3] imx_serial: set wake bit when we receive a data byte
Date: Thu, 15 Jun 2023 15:22:56 +0100
Message-Id: <20230615142256.1142849-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230608154129.133169-1-martin@kaiser.cx>
References: <20230608154129.133169-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f;
 envelope-from=postmaster@kaiser.cx; helo=viti.kaiser.cx
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VvizefZ6o97R

The Linux kernel added a flood check for RX data recently in commit
496a4471b7c3 ("serial: imx: work-around for hardware RX flood"). This
check uses the wake bit in the UART status register 2. The wake bit
indicates that the receiver detected a start bit on the RX line. If the
kernel sees a number of RX interrupts without the wake bit being set, it
treats this as spurious data and resets the UART port. imx_serial does
never set the wake bit and triggers the kernel's flood check.

This patch adds support for the wake bit. wake is set when we receive a
new character (it's not set for break events). It seems that wake is
cleared by the kernel driver, the hardware does not have to clear it
automatically after data was read.

The wake bit can be configured as an interrupt source. Support this
mechanism as well.

Co-developed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v3:
 - fix some spelling mistakes in the commit message
 - add Philippe's Reviewed-by

v2:
 - support interrupts from wake
 - clean up the commit message

 hw/char/imx_serial.c         | 5 ++++-
 include/hw/char/imx_serial.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index ee1375e26d..1b75a89588 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -80,7 +80,7 @@ static void imx_update(IMXSerialState *s)
      * TCEN and TXDC are both bit 3
      * RDR and DREN are both bit 0
      */
-    mask |= s->ucr4 & (UCR4_TCEN | UCR4_DREN);
+    mask |= s->ucr4 & (UCR4_WKEN | UCR4_TCEN | UCR4_DREN);
 
     usr2 = s->usr2 & mask;
 
@@ -321,6 +321,9 @@ static void imx_put_data(void *opaque, uint32_t value)
 
 static void imx_receive(void *opaque, const uint8_t *buf, int size)
 {
+    IMXSerialState *s = (IMXSerialState *)opaque;
+
+    s->usr2 |= USR2_WAKE;
     imx_put_data(opaque, *buf);
 }
 
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index 91c9894ad5..b823f94519 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -71,6 +71,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(IMXSerialState, IMX_SERIAL)
 
 #define UCR4_DREN       BIT(0)    /* Receive Data Ready interrupt enable */
 #define UCR4_TCEN       BIT(3)    /* TX complete interrupt enable */
+#define UCR4_WKEN       BIT(7)    /* WAKE interrupt enable */
 
 #define UTS1_TXEMPTY    (1<<6)
 #define UTS1_RXEMPTY    (1<<5)
-- 
2.30.2

