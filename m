Received: by 10.223.150.237 with SMTP id u100csp2783453wrb;
        Mon, 6 Nov 2017 07:48:49 -0800 (PST)
X-Google-Smtp-Source: ABhQp+T/Uj/a76BhH4oKSYOxuPQunzmlA7neOH5aOSQ0SFWN2J2MTLHennFJVwXtI67cxTWpoFr2
X-Received: by 10.37.248.32 with SMTP id u32mr9937059ybd.289.1509983328951;
        Mon, 06 Nov 2017 07:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983328; cv=none;
        d=google.com; s=arc-20160816;
        b=FfrytACJLjMuwCYUCKhXj2ITk9E7xIwqrcdMm9Hq/pfaRd5Iz3SGiTUbVb62PgzXVT
         sLaRy4vlPuW8ptdlmCkfcRtws8oTyLedRnv7jlnRYmrGHhfXgETE17IMdysCJ7kS8Zft
         ynYg8perw5VJVQYzrK3g6Gp30xj1Z31yG3EZPNdqaaHngvd+79+H4FCpi7uzlRl0QWIs
         Y6I8ssXQrAyXvC/1+HsepwiUAPrAhU+pGQUyX+1PCsZacE8HKiMvZG43FWD3+pf9ne1p
         lwPWGkDbYDn15IpAxef0ou8CS2T5v4LaWLjMGy7rVCU3+erxbmm4iIBHwzdUUk0SFhaT
         b6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=P9EQP+u+vNQBVnrsWrC2coZt+UETAIa48JorqpJmjA4=;
        b=bMmv57vAHBYqdgzJIRDq+M25Equ+KntzlFLlRNrkDfSDH6jvIJEEmyY+VtAkP5x2VI
         /u4HzfOgoLLo+GDAJMTdjl4wVG3cxoTYEXR82gkMhCmGCFz3yGUtfvIVU9B/tBhjcRLr
         ZxKxlQM6n2LAatrV4tu2RheBr97UjOCiKXXpagm3FixAFXJ5DOyghQy3qlLCnSNV58VW
         geiBFvxh5HlPli85JfyzSz4lRucSZdp3OZul+rfCwK/c0pygC0j79kU6fRMI52GP39ah
         ylWDDKRIa/RLUJy0KKfMNwJqfSSmZMYEJuBWNDh5FcT/d+QA9jTVT9tCAyjhjFBqNYcZ
         mHOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H/7vWcgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g84si1386477ybb.377.2017.11.06.07.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H/7vWcgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjdo-00072I-CH
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:48:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjda-00070k-Ba
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdZ-0000NL-IO
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:34 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:45189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdZ-0000N9-Cw; Mon, 06 Nov 2017 10:48:33 -0500
Received: by mail-pg0-x241.google.com with SMTP id b192so8515659pga.2;
	Mon, 06 Nov 2017 07:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P9EQP+u+vNQBVnrsWrC2coZt+UETAIa48JorqpJmjA4=;
	b=H/7vWcgq7esG5XEmmxB9vKZnmyjTbEvZkYKbyGcPnfefKkyFLV0+GRTXz35ekFO0jQ
	/4GqHFBWhN5vTYC1roTaSQcNLwve0LvoW+DC/Gyua67W6ROSUDzETUw79lBWCtTerEat
	t0bW/1xhoOYDB1UD0BGfy1s4lO1AILdac4abhXEgAcN5NwAcljf/oVB0xyAdkgirPkbb
	3yrpsYWwY6T422xB6qCKRP1A3xLQEyEspRz/j52EOE9shBsyGi8pIKOi4jf9Z27ccie3
	DhffraxKQySd9KEPFtVDWWOoMQJc4BRbM1/BZQ0K8w8VndmiMbExRxzWxgtm1N4Y30IY
	6A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P9EQP+u+vNQBVnrsWrC2coZt+UETAIa48JorqpJmjA4=;
	b=i/9aMoPdy87omKk4RkFBDjbmoEeqV6AAawvCxtfXP0CVAPZd+84f8G8GWlcu9ED9Yg
	NLKmNYXICX0gnNQ54r/S4urzurMo2osiDPbiHyxJG/GC4QnuUC7k/NOlD4z2WuWXEXtx
	uprMMCLK1baEIDGeFmqTVDjQzy5FQBL98AaGIXd5Q4+IGWK8+lD0hNozegpfB2J1ckdg
	8pG5pzZZE3Q7Fsh0tWNc5OgBjFu0DLjz2AVBLkPoGlHbTzIHmdwqWtZJ9RQG+csIrLFm
	jwobOCjNnCAIPK0D0dLP3z/gLaCMIPigBS/ZwFPPQJgCggDdJhUZpsP90seZ1wOw7QK7
	PsCw==
X-Gm-Message-State: AMCzsaXBm2YDjqDbOlE7eW13Lc9BKo7s5d9lppvfjE3iVVXs2epI7RZ3
	xJv5TXfOXhRfdnlAAyLWxZ0pD4T50IQ=
X-Received: by 10.98.198.138 with SMTP id x10mr17118904pfk.55.1509983312144;
	Mon, 06 Nov 2017 07:48:32 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:31 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:47 -0800
Message-Id: <20171106154813.19936-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v3 04/30] imx_fec: Use ENET_FTRL to determine
 truncation length
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 18Z6U7zuxz/L

Frame truncation length, TRUNC_FL, is determined by the contents of
ENET_FTRL register, so convert the code to use it instead of a
hardcoded constant.

To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
increase the value of the latter to its theoretical maximum of 16K.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 4 ++--
 include/hw/net/imx_fec.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index eb034ffd0c..dda0816fb3 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1052,8 +1052,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     crc_ptr = (uint8_t *) &crc;
 
     /* Huge frames are truncted.  */
-    if (size > ENET_MAX_FRAME_SIZE) {
-        size = ENET_MAX_FRAME_SIZE;
+    if (size > s->regs[ENET_FTRL]) {
+        size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
     }
 
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 4bc8f03ec2..0fcc4f0c71 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -86,7 +86,6 @@
 #define ENET_TCCR3             393
 #define ENET_MAX               400
 
-#define ENET_MAX_FRAME_SIZE    2032
 
 /* EIR and EIMR */
 #define ENET_INT_HB            (1 << 31)
@@ -155,6 +154,8 @@
 #define ENET_RCR_NLC           (1 << 30)
 #define ENET_RCR_GRS           (1 << 31)
 
+#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)
+
 /* TCR */
 #define ENET_TCR_GTS           (1 << 0)
 #define ENET_TCR_FDEN          (1 << 2)
-- 
2.13.6

