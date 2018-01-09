Received: by 10.28.173.206 with SMTP id w197csp3160371wme;
        Mon, 8 Jan 2018 18:03:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBova6U4lE9jAB9uQ1/tRHtuvoxUvmc8szI4HPRTCRE2ll35aA2Qh2rZwuJ9gTdMoMjPN1kG2
X-Received: by 10.37.208.66 with SMTP id h63mr5684914ybg.35.1515463437980;
        Mon, 08 Jan 2018 18:03:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463437; cv=none;
        d=google.com; s=arc-20160816;
        b=ncRz8rwhgZxoplRjgl4siJHOsTrA6uSFA0cNGF9UTLFmfBkw0lLP7/L+/ZSqrCqPen
         m/G81qZDrlTLq0EnEIPWzYBiQ9CiVtywPaifxAvSe2mhFm3W0p1FY/mT/k26qPuas37Q
         fjJcfOACVJR5OgDsjWjVdIgEJFBOwXUmLqA6Cn/p8NYCWDG0At04J2m6mv3VmohkEzgW
         XgPRTZ4cQkDHLKKQxX8sXNP1oZLQJQmRB5F7Ra2nmBWSu2U+ZeCWhuZg4zMme36QHJL7
         LdyHu3wdOwYpP/BsREFYwkJPNdQ0ajKX9yDTHB1aygU17FUZ3DHfedQ5aBZ99M5VnjXQ
         8jDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Dp+MmA72TXkkA48djEvzrt8uUiWWiYVwWvUVpJdB368=;
        b=YrSZFYs+NRQhS0kC8Zs5f4/mLcPkUD2NQeBIXlYL+qYTlNaVVDYpJNhtHMutsTlWYU
         3Fx9N5IzXdOcBFLrRrgQNEJ2/tm3yaNUOWAbPmSYP/PKuZH0asYK7+5A8doVZ31YMW1Q
         OU+SYPlnINMikeftHYJNGY2MzSQaRQbtHPZZ7Z/65/CL6HlwEAVjc+ZsxmIUWxofq8rq
         cPRK8sFFswrGLlfJHlJZ2wJ65gkLhEY3sQoWtCHAyri2msNR/nmQt6lh4HOvLG2ABSOy
         BtCzOmXhZYMcF7U/sIc2KqBzyPZTouHNmPx5L0g8Qd8pNSwCBDcGDESNLliq0v8XI+bm
         qcdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kwqyC3ND;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8si2798452ywh.118.2018.01.08.18.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:03:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kwqyC3ND;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjGf-0003Jr-6q
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:03:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjED-0001oh-1G
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEC-000275-6T
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:25 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44454)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEC-00026E-1z; Mon, 08 Jan 2018 21:01:24 -0500
Received: by mail-qt0-x241.google.com with SMTP id m59so16098320qte.11;
	Mon, 08 Jan 2018 18:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Dp+MmA72TXkkA48djEvzrt8uUiWWiYVwWvUVpJdB368=;
	b=kwqyC3NDmOzZsR1dRgKONkz5HMedZGyNnB4U1kE0L8PaKU9E8Nnzg/iYhyWK2wX0mw
	P0r1yB6g1jr6ClAufBO46rLkAbetK95GympkBjwynMyV1v9A3u4HLIL3sYG6zY4hIdq5
	mOhCVgVDb++BnobZwEfC2dHdCEte4DjTEBdGAaXxhm6clGw9ADM/SaNswp8mMIf2Z5mB
	JwLXY1pAfAqAtEmR93GyoEyTLWPWyIpqmueKmuTtGAkDluI9wSyo7DR4msiKJ8cGbnOc
	XBPQpNYM7s4+w07TRFQC05rSUWXscUYLjwZ59KpSu17JimdFHL9Yjb3sBGUIRwdr/bx/
	zs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Dp+MmA72TXkkA48djEvzrt8uUiWWiYVwWvUVpJdB368=;
	b=Em6cmI/37/ljrdlR61RkmXOMwr3dmYQ+zv6lLCvZwO9fowRv64/kzVG6Q1fULZV/GE
	QqddS39YZjeM9QuIQ1ebCJSYA2Gw3slKWoACNS0oUNZaR6b2x6ff5nSKnfnQSHhrVWdp
	Nwrw2jLwZ1+wUhgI42BLnTh5JZxPFPwyx4hdtUy6Go8LntMJrrgczQyiT+vdRffqD7zr
	zotcJX6uxBJaQkmwO18VczsJgMvnx1qriwOXj1Toj++PKzmVoD3unMLwmhUXVA6I3sfD
	AnXERh/m1ODY+88BE9X8qpJq6E6nXgrfINtRR8QYzo45ug6qs3Dc8vd2SAkSKxA14/XL
	r8hQ==
X-Gm-Message-State: AKwxyteBoLj3kBqgnB8JQzBdhifjkNtAUBakgRJnTtEntNYBN07hDbJO
	Lgu2TrijR4wCHlIixtSFyPo=
X-Received: by 10.200.11.67 with SMTP id m3mr18452479qti.186.1515463283467;
	Mon, 08 Jan 2018 18:01:23 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:47 -0300
Message-Id: <20180109020054.32553-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [RFC PATCH v2 2/9] hw/char/cadence_uart: add FDT
 aliases
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kv+pNBi0F27H

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/cadence_uart.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 6143494060..f164cee61d 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -23,6 +23,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/sysbus-fdt.h"
 #include "chardev/char-fe.h"
 #include "chardev/char-serial.h"
 #include "qemu/timer.h"
@@ -560,6 +561,17 @@ static const TypeInfo cadence_uart_info = {
 
 static void cadence_uart_register_types(void)
 {
+    static const char *cadence_uart_fdt_aliases[] = {
+        "cdns.uart",
+        "cdns,uart-r1p8",
+        "xlnx,xuartps",     /* Zynq-7xxx SoC */
+        "xlnx.ps7-uart",
+        "cdns,uart-r1p12",
+        "xlnx,zynqmp-uart", /* Zynq Ultrascale+ MPSoC */
+        NULL
+    };
+
+    type_register_fdt_aliases(TYPE_CADENCE_UART, cadence_uart_fdt_aliases);
     type_register_static(&cadence_uart_info);
 }
 
-- 
2.15.1

