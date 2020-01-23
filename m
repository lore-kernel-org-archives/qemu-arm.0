Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp237420lfp;
        Wed, 22 Jan 2020 21:26:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMbgsT1bfr4IWNEBIsBXj/1kHMSrUhP/uevhj3aAcoHDYwS94M5z9kzrhiAxwttL5s5MI+
X-Received: by 2002:a17:906:1653:: with SMTP id n19mr5391065ejd.3.1579757176083;
        Wed, 22 Jan 2020 21:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579757176; cv=none;
        d=google.com; s=arc-20160816;
        b=iNYO6sPSej4/RioyPX6Plyi9/aEZyuPSZu4jBqnw+sVMa29xuzptXhhT3bPnim8Q0C
         GRSRemAlwlTsqkJOCWVmdqBnTUGhVF3p1WpR7LjrAG5V6oJq3qg8Y4WydjTX8zOPEOjN
         /a0mRxcDZmWPBZhLDXx30cyNWYOVNeTTEGoS6RFFbzM3meoizX31rs7UDRFGfWZMcQff
         UpLeXkIn0xUTKc87ES0OIm9LivdaRYjrLF+knS7GU7r168R4Dw5CgibnsPU+kFPaYlaa
         9vRV41qY4soy4RQmJM6vh4gDPMdT7jAst/lPujGYva9KAbTJV2oAlRfvKHdgA182ww0Q
         F7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=zmHKjnC247jc9vlKJYZDXG9jAMZekmio1XePlTMOT6Y=;
        b=UBfo6836pRmdKuojUstZlt1aKfAzm76UnQRXMjMTbVb6SVnzFws9wrtAvrGfVY1KgH
         wNAGlawfAxjf/2P3bR3SA2lMrj5uts2M0YIKHEwu5p4hUmoVwiBEhYx9bnmh1NNfbEw2
         Y3RCCtQAujHtQdoRwFVJO80qv4x2iz7Fv3IM7pvmoX4/oRG+sYoY/RC0elFsZuoJGYAh
         sDnk8y5Q/jvPqLAm/wSggYxFHwl+NZu80iBIW9Z85BL9cnvMgCi8g7jL83XDoXpBwIHM
         wClXfgEy5sMAlEeLbvUSU0NGf1q3XPKMgyE0ZsA6II5VpNwdKvuN2LGGCJCNbdzlZg+b
         zj+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SnCeoemJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dd6si548479edb.186.2020.01.22.21.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2020 21:26:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SnCeoemJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuV0Q-0004i7-Nf
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 00:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iuV02-0004cb-JY
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 00:25:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iuV01-0001kg-FS
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 00:25:50 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iuV01-0001kO-AA; Thu, 23 Jan 2020 00:25:49 -0500
Received: by mail-pg1-x542.google.com with SMTP id k25so766863pgt.7;
 Wed, 22 Jan 2020 21:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zmHKjnC247jc9vlKJYZDXG9jAMZekmio1XePlTMOT6Y=;
 b=SnCeoemJj5Yr/4O76Fc7eU6E98/NwPNHCJRt0trG5eceTVI1Z26p3vTio9GwYrbpN/
 YfjFQTcj3AtqIMSO6C6BOvMrtBIEENP2AfqeVaglip8/UDX8zcT3/vHyDq5KWsMCh0l2
 7SIPbxKg4BG507u8K5Z5LfaNHVP7MXKDSzPoGyR5OhbDicjfYNCYy+jvwxMvpCfM7cOZ
 HJwMpj6tU3g+JJUV/lSwr1FszqMr7fy0de1WAmCUWK+05iIqLCPSRjixQQ4sIZO8vmCc
 RgzgIsFFAEw5p34Dr/VIrP27tVECCuOD1SQ+PZPYCJim22nWosRzCLhK2EfcSwwtBgiH
 UBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=zmHKjnC247jc9vlKJYZDXG9jAMZekmio1XePlTMOT6Y=;
 b=LG9ExwoFT7syDKr067IKubK1XFJDV0+I+S1YYudx+guAAzDhTttL4tYs8lJ5oxyH/B
 A4YiOJ/jSlKWrbGtt4SzZSpgJRbKoResPxHj3AadWVYFNGFoPPqt0paoLUpNEHkCBFLv
 oJnRgizdq64nplzbLf9SfwXjs6kAzhJBPmCGsUzFEXOcm3MGIrOeRiForUJbG5JpjSG5
 zFTDpFKSouyyKuRANhfB2KWG+PrQgpQWxSRCheJkt0+CLrVEMqwMJJ0CcfXD4eGwqEWp
 N1TCV83Qcdk/Nk8fxyt0YcotwqfSCr02UAB6lxilq6MtqEABIj+hmku7O336ju3dlEx9
 5FVw==
X-Gm-Message-State: APjAAAX9Zrvm0F7QLuwf16dh4boaKsACFET7dV3/72SUr9PRPwqhOQMN
 P2z+CtaOqZF9EVv0Ay+p79PYGrmd
X-Received: by 2002:a63:d249:: with SMTP id t9mr2160009pgi.263.1579757148483; 
 Wed, 22 Jan 2020 21:25:48 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id j28sm930802pgb.36.2020.01.22.21.25.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jan 2020 21:25:48 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/8] hw/core/or-irq: Increase limit of or-lines to 48
Date: Wed, 22 Jan 2020 21:25:34 -0800
Message-Id: <20200123052540.6132-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123052540.6132-1-linux@roeck-us.net>
References: <20200123052540.6132-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PwkfqKsrMi3f

Exynos DMA requires up to 33 interrupt lines (32 event interrupts
plus abort interrupt), which all need to be wired together. Increase
the maximum number of or-irq lines to 48 to support this configuration.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Added patch

 include/hw/or-irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index 3a3230dd84..0038bfbe3d 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -33,7 +33,7 @@
 /* This can safely be increased if necessary without breaking
  * migration compatibility (as long as it remains greater than 15).
  */
-#define MAX_OR_LINES      32
+#define MAX_OR_LINES      48
 
 typedef struct OrIRQState qemu_or_irq;
 
-- 
2.17.1

