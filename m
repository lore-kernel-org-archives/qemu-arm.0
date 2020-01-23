Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp239222lfp;
        Wed, 22 Jan 2020 21:28:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqySBhVf3Oi4X2s8B/ZDyKR7onYq1ljRgrfiWfGPSJtoK5uV+anQKCUFdtXcMMlBvkVvgVBP
X-Received: by 2002:a50:e607:: with SMTP id y7mr5625770edm.213.1579757331986;
        Wed, 22 Jan 2020 21:28:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579757331; cv=none;
        d=google.com; s=arc-20160816;
        b=XN6L4wpTK7SuG/XuPl0aRBx7vEz7Co8GIqW1lg9dC18Og52e6z+/t0cn4NAsXW7G2A
         1B0tyWDqcxyZuqhH/PO1F+jPctFa9nYKAhhCRGaeIRtVNXBPheFVtzBUmaj3Z9zdaF3o
         lg1Qi5qdPchG3G0TPz+4DIlBDqT82LaRPoPJn/CVh9iQDVH/0Xwj0NaAg2oRj7U1IcPq
         9PWRvfENs2+FQHCGtUkUT7sTN/90PvushGZUlHVn55ATR0oNp1JDDkOAX6uN82NPmTzH
         KTcTDikSiZ456HscpxSkTGCn4RZ+6HikQvYAtBQpiqA4OtyZuZPnQ+Ooh6yB1H8qnXxK
         YqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=EE9FLYTtkS2cjxl4sIaS2Sb8cPUkAts34EXvkmAm2f0=;
        b=eZbiFXTRYUkd4UroLXBKj4kqQeyHH61jJzEi+zj+fEKOsIktuZjELIMRvbNCWLOWeH
         SNWJUJKF8QREjudr07vkATZzfJkcpa3y9HrM4ZW3mMICkWwxzXg2CpmTiTXV91gbeBXs
         podPsRmPvPaypSsRCb5L52jT6kRoOZt/3mCEycph7f4hOeAO0IcbK/ERLrAGWnSZvn34
         Slw7R3Taiqnga6ZD063hbnp7Xu2zPa58QCfLzMwcCh1vbWfAep3C8otEb1jwx6rV5rAX
         o7kH6ZFJwyIVVTf8vDY81ffM5R5PKZIEeCWYAYRmkISo2TirrO3xbrokVHGkr00ez9nT
         9Gtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cQqWiAFt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si484774edq.162.2020.01.22.21.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2020 21:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cQqWiAFt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuV2w-00088J-SA
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 00:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iuV0D-0004qQ-NN
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 00:26:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iuV0B-0001pw-MU
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 00:26:01 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42246)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iuV07-0001n3-HM; Thu, 23 Jan 2020 00:25:55 -0500
Received: by mail-pf1-x441.google.com with SMTP id 4so967897pfz.9;
 Wed, 22 Jan 2020 21:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EE9FLYTtkS2cjxl4sIaS2Sb8cPUkAts34EXvkmAm2f0=;
 b=cQqWiAFtmbtlEoBR2IEJ1ZSEKlIRW2Pf1WOpTgVWzhuC2Rq0WusFiCIV143SD5uNBI
 s7sJ+2Sd2Xxu7Z0AEjd80hjD1SVzXAVyqzKBHe0cc+CDQKNA9hKlE5WOFo9Vw82nPvLf
 dn5eOYSzbtjhSTLYydjnAoQJfRG4A6lchLxO0oDvbBeuir/dZf50T3JbfBofxDjJedxb
 ZwgSDjlIqdSeNn/pCuA9gMRPcWjz87zuOiXY5JcaMYAkVayMCYX21FITrMmQmViYruGQ
 cS8KBVPovmMIkyOgF4hNtDFOPy/mWU0PBi5wsvfG4XiN+5MRhUGVSFYnfvNOlo/Y5i/E
 RUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=EE9FLYTtkS2cjxl4sIaS2Sb8cPUkAts34EXvkmAm2f0=;
 b=FvszVJd1xOlMDmVvLRr9xnoOI8ypzBqWknTOSO52/Mx3jCzW/TrvTUfx13TWljx3Zz
 nvmKnz/FQNDSaUiD23NMpBpjhXMHlcD+3GLsTokoCHn/o9lTu6SUto0ua9jU7/0nbFS5
 lw5k4957NWJtrXq19YU4bvKYW878+cBOWwBn+pCTqverLtpnwnAzcpa00cuUSxHdhPY5
 r4csLpWLkPs/kvUnMufrY49ZLVFVyQyFVVT/n05UTVBOSkGMyxvVt209viZBsGGCa4vy
 CdqUgCV6YMiQvZIEzj1oxeGGdfMl4UqdTUNw0+Fjyfod9Fyz+NVf0/2UzEvNn9j52gX7
 JeeQ==
X-Gm-Message-State: APjAAAUVqtGa9C8IwBFIs1sJoPmuuUnhW7s4huiGENO92NFXS4uh+XcP
 2bXE7GCxl12lTUpUQvTJaZk=
X-Received: by 2002:a63:3f47:: with SMTP id m68mr2068459pga.411.1579757154683; 
 Wed, 22 Jan 2020 21:25:54 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 100sm768803pjo.17.2020.01.22.21.25.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jan 2020 21:25:53 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 5/8] hw/char/exynos4210_uart: Implement post_load function
Date: Wed, 22 Jan 2020 21:25:37 -0800
Message-Id: <20200123052540.6132-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123052540.6132-1-linux@roeck-us.net>
References: <20200123052540.6132-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gUYZRE8vc6ID

After restoring a VM, serial parameters need to be updated to reflect
restored register values. Implement a post_load function to handle this
situation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Added Reviewed-by: tag.

v2: Additional patch to implement post-load functionality
    in exynos uart driver. Required for next patch in series.

 hw/char/exynos4210_uart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index fb7a3ebd09..5d48701b6d 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -522,10 +522,20 @@ static void exynos4210_uart_reset(DeviceState *dev)
     trace_exynos_uart_rxsize(s->channel, s->rx.size);
 }
 
+static int exynos4210_uart_post_load(void *opaque, int version_id)
+{
+    Exynos4210UartState *s = (Exynos4210UartState *)opaque;
+
+    exynos4210_uart_update_parameters(s);
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_exynos4210_uart_fifo = {
     .name = "exynos4210.uart.fifo",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(sp, Exynos4210UartFIFO),
         VMSTATE_UINT32(rp, Exynos4210UartFIFO),
-- 
2.17.1

