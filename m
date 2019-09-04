Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp978062wrp;
        Wed, 4 Sep 2019 10:14:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPRwaQ/87NWstBfmXu7vy/pgIGHaBkHxi9MGIE685Cnd3gPPxC8PwPwKZCmbHWrYcaom6B
X-Received: by 2002:aed:2da4:: with SMTP id i33mr30444496qtd.320.1567617254725;
        Wed, 04 Sep 2019 10:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617254; cv=none;
        d=google.com; s=arc-20160816;
        b=EQ1aA17ngthDOG4GNP6Dhix3eiWIcEjEfW3jA3MdDLNtxZGbMtLL3vmo1RmGIGKjif
         r0TRsz1AfjgQGT1WcoTEsgZymCBBbVEI17sdU0EHRB8ZMrufxD3AJcZGq8gDzXGiRVq2
         TEePq6GwvINHI2DXLQIIfqRZY7mSspCP2sy4bE2/0yHUgT6WWdXhnQNLmnxPgWyREEWD
         LPKcMUvoSlEUL5jR8MVZ69E9OIX5i0SAUxUCMTHRcbxqQujgCby7aHn72dA34CJV+xgo
         59q8OeFcY/9IWkqRdZc2nO6BFMWte17JvSb6KtkbwcyNCgSuV7V1f1I5TnB0oGDHbLwi
         xzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1lvnZRDBY+QqCszElvqzfXUD36KMQAFLJctTSYyNnFw=;
        b=yUF0zS4ni5hM9EO9FmMC9GH8XHa1+Lc+LiVL26dUIyS5ShVpigNvBZ0IbIo9xVXFxm
         oQkooV6Voa6Yz2NQFUbcTdHn2gOBIUU9NkLtX3Aai36lH/PiVvIzuMiUWq8nWAs4fD3c
         Fpp1TNgKBpYRMsgoN6O5ZDI34sFJxr4ihxX7XMj83Aht27Pt6YiWwtIUGTnc8HN/C1RW
         kg4Lm13W8axB4NvlyBO9mWBfY64TQaSB7/sJrQArVWJ6LuuGZbmPKoqL+H5M7op4ol88
         dArWedctQTGv1XOGLEypeKI2DMUYakaZuQNO02WCxmQ12U6D7ZyfTinFPLf/4axd0usd
         QCyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KlOwBBa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si2875009qtc.8.2019.09.04.10.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 10:14:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KlOwBBa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5YrF-0001rd-JH
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 13:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqV-0001Mm-MC
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 13:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqU-00071J-JV
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 13:13:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35713)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqS-0006zr-9F; Wed, 04 Sep 2019 13:13:24 -0400
Received: by mail-wr1-x442.google.com with SMTP id g7so22152408wrx.2;
 Wed, 04 Sep 2019 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lvnZRDBY+QqCszElvqzfXUD36KMQAFLJctTSYyNnFw=;
 b=KlOwBBa3KvDzeE+NmXwIAS0i/EzRwkIeqV1tPmVMLEkp6M+CsD4POgqa0w1//AkBni
 ILUQOnqULXbfmkxVvQx72WeOAnKZfa8bJeVwc1S/P7hL3NrvrZMw2AvRnAK7c3dCSOjK
 jFnY4elPjAq3xiUrVdA0s85uoGU/V3pgl8mujkNhcZ7ec0NLX+fVOthI91yZCYYbdBg+
 h9HUHJb5vLlPWm3DN2ERtAueQ/7tNVAsInUWuC29gTim2kGPpmgvgNh8uOIcgUfLe6XV
 SlAxUytVnmUA76m3cVjcKbd/M2rqYMGbnftWTl+NXxrNSLeuueAsX0iO77obYfquTi4h
 aqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1lvnZRDBY+QqCszElvqzfXUD36KMQAFLJctTSYyNnFw=;
 b=cWZwUtIg1wN8VVX8Kidz46S5jUhpsldiciQOg2vVE9Sc9TD7HQvUsmvhjKZjV9sHQB
 Swx+ISGSt/pFUDFgnRjBTrmiteGBXszNuxnkdGjayacX+fx1VLEbm0fott9QFNezFcna
 Y6paHa+WqCuDGQmLWdblIb4QujsMzWRuTmrvT8lKxBkhkKbNSC8Ihjnp3+JNUNeZvm0L
 tfhFOTVZ+L/68U60pWa7g6BltAnzzqa+AfywbO7XFa9LqsYM8meYhL43JrROncJlygTK
 mecu1FzW3oOa4F19SnRDpg2iPcOKwzMJF4qzvPu7Kw6RAGeP9x4pszaTnOLaVQwd7Bit
 Ol4g==
X-Gm-Message-State: APjAAAVfj0WlpFS8aQMSd/Bu6nBXIj71Qq6hT20ec59FHTbZGE+bhHXd
 ajR1E0ocYQkblHywyhEsXGc=
X-Received: by 2002:adf:f48e:: with SMTP id l14mr32580480wro.234.1567617203331; 
 Wed, 04 Sep 2019 10:13:23 -0700 (PDT)
Received: from x1w.redhat.com ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id p19sm2339512wmg.31.2019.09.04.10.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 10:13:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Pekka Enberg <penberg@iki.fi>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>
Date: Wed,  4 Sep 2019 19:13:04 +0200
Message-Id: <20190904171315.8354-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904171315.8354-1-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [RFC PATCH 03/14] hw/misc/bcm2835_property: Handle the
 'domain state' property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cZkwC2A5r319

The kernel is happy with this change, so we don't need
to do anything more sophisticated.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/bcm2835_property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 399f0d9dd5..d8eb28f267 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -127,6 +127,14 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
 
+        case 0x00030030: /* Get domain state */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: 0x%08x get domain state NYI\n",
+                          tag);
+            /* FIXME returning uninitialized memory */
+            resplen = 8;
+            break;
+
         case 0x00038002: /* Set clock rate */
         case 0x00038004: /* Set max clock rate */
         case 0x00038007: /* Set min clock rate */
-- 
2.20.1

