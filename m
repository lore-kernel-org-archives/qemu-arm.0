Received: by 10.223.197.9 with SMTP id q9csp218819wrf;
        Fri, 6 Oct 2017 17:22:14 -0700 (PDT)
X-Received: by 10.200.2.147 with SMTP id p19mr5086739qtg.242.1507335734751;
        Fri, 06 Oct 2017 17:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507335734; cv=none;
        d=google.com; s=arc-20160816;
        b=JKfvHq8vBrRDwxxx1uvixas2/SoJeOysxc0N/2bOkEYAyYoU57h+Xb6uERuvfmmDHH
         NyuBcGiChINZn74OkPk01U4C2+RZL5HyLaM6XbeXYUFBS9z9L2LXEaeZofcKMWhd8uNs
         wC5kvbSMCM012lev4FUcli8Zuye7gcEHIuE8cw+DiUVb5Fac7hJbY2uNGIIYHqD0DRuC
         CIQ0lM+Ij5ufgtdnmPlLiu3FB/s7WARmjmRy44XkwDa6L5RoigivQ4xUVZKxjNSA4Fk6
         x/RJbB7TUWe2C3St8APX/Zz8G3TGQUKuOr28arp+yyQZ/L4OJXY+w2wvXrDPB0sht6e4
         l4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QnSAemlhAlxePX2Db1XfE+qraoQWJcXTmefuRFTkacs=;
        b=r6HlPGhiJmwzvY9vx7PXNKF9CSpjm0hNhd13Bg8ynl52Jimo3Ek/dGl/zSS3nJDOf+
         Ak2kQ9/vJ6G6JqniL7hWJHqtWIIUYlNFQHrVCYG1jfRycqEiUAGdFWKtllhj5I19NLCp
         o9WkWWxsFAwXOHEwutwIXUBlue91+Tr3LXpSzjzCTtYxgNP/IjQHzaNv3FdAonk7Ig08
         ewfAEbo3hSul0pRy9XTHmoIBB0ppz2+0BzUpHum8C8Niic9//bpmp7Vxz9/P2YTyi0Vb
         C6/hFGgh2aPi/eSgvo7s8VJe3ACLFMq8NqdmDLIiodqykXVYDVigbNaYXMGuqBeUWw7V
         JDwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uea+WMpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si426584qtv.532.2017.10.06.17.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 17:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uea+WMpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0csg-0000ar-3V
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 20:22:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQb-0000ZC-VH
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 19:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQb-0006Ur-7B
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 19:53:14 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:51472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQX-0006Qk-3S; Fri, 06 Oct 2017 19:53:09 -0400
Received: by mail-qt0-x241.google.com with SMTP id q4so34332092qtq.8;
	Fri, 06 Oct 2017 16:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QnSAemlhAlxePX2Db1XfE+qraoQWJcXTmefuRFTkacs=;
	b=uea+WMpgJ2R3yhnRA7aE+r7vHGeU4xHH/Xsq+f7M2cr8VjuTEV9iCpX8u40e5xN0D1
	VHPErV9NVm7w6a1khNF7IvKfHtScci+4f/gWIL1Ds734Sz1xKItYn9a0qpbn0qUJ04xL
	1LTlO0BGPKhZVuzgqPasPA82QS/VM/09Oz+ooDKhOQwLydfVOWv+XCgU1VLzw7TLVP55
	tC1Mbvl7YLc7OjDS2mZbZvBqEuK6gC3sZE2QR5ARMvjrGk/QdKcpto1H6Sjr62U5Cnen
	GBb+U2qlbMabERi4v+sLYa9kdxrxKVvV4xCvU9EYOaPe1Qy3jkoK6CmLJmkzFThWVbv/
	Wfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QnSAemlhAlxePX2Db1XfE+qraoQWJcXTmefuRFTkacs=;
	b=d3YRwrTV+xD5lnrQlb22D5j9j3cq1kMedpcpmVn9CMDklvFPGPh5QDmnm/Sj7XPSb1
	nkSsyM7aEjbKXwRk8q4WjselpAOh7/Z9b3qSzXzu+nceU6SCOHTGvOYKWQ2fqwMD6lsg
	aBe/+tug27cYGGZwGzxNmuTyeAGCOktM6rQER/dXhura68xOD3HQnS2DJ6BgC9WmpBa/
	S0H7/IDRKp33lYt2YjKq2bDIJ0ILY5iV1f40NHKm9g2ClzEadYv2hSR6HzhylHKT2+UZ
	B0QZRHNzagjXvpeK+iuvM/hpN1pe2cADpNTIaFLJBp6huEg1ZDullvZ9xmq9/bDUdiGZ
	Rm3A==
X-Gm-Message-State: AMCzsaWG2qezMmbDqFid1u67iV+mrp8GRa0vJqgMtklMNxBigpNtRFWt
	TuNzBTilTh5yLSbAvo7dXjg=
X-Google-Smtp-Source: AOwi7QBm4i8k6Z/+UAqZRtzUQKQBxF6BurSmrLZMTKfIxQkVYrnRZFw7CFplYAlUn0O/EFKl3O/WlQ==
X-Received: by 10.237.60.101 with SMTP id u34mr5153388qte.153.1507333988567;
	Fri, 06 Oct 2017 16:53:08 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Fri,  6 Oct 2017 20:49:40 -0300
Message-Id: <20171006235023.11952-46-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH 45/88] hw/display: use g_new() family of functions
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu trival <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3d3Ls/pnKxj7

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed pxa2xx_lcd.c]
---
Andrzej should the tc6393xb files go under the PXA2XX section in MAINTAINERS?

 hw/display/pxa2xx_lcd.c | 2 +-
 hw/display/tc6393xb.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 845521c5b2..0ca997cae2 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -1006,7 +1006,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     PXA2xxLCDState *s;
     DisplaySurface *surface;
 
-    s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
+    s = g_new0(PXA2xxLCDState, 1);
     s->invalidated = 1;
     s->irq = irq;
     s->sysmem = sysmem;
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 74d10af3d4..2bd73a27e0 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -570,7 +570,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
         },
     };
 
-    s = (TC6393xbState *) g_malloc0(sizeof(TC6393xbState));
+    s = g_new0(TC6393xbState, 1);
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
 
-- 
2.14.2

