Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2451720wrq;
        Sat, 23 Jun 2018 21:19:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIs+3+aN0s7iBTElNERjXBeV0SPu6EBd8WSAMAVNojb7BJ0gqCWmkg4HrTipMvx2U6q5srD
X-Received: by 2002:ac8:388:: with SMTP id t8-v6mr6649603qtg.194.1529813948796;
        Sat, 23 Jun 2018 21:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813948; cv=none;
        d=google.com; s=arc-20160816;
        b=HPXG8Auz7dBuTJtug9fwJ7Lx8B74qch+9XUfehxRvBD86rTgCwiOUPsvZXAvoellki
         M54dZpjohOwZW+vTDKTgyMZ0Mdfoj6wpVKX5m1mdQdYpCcXnkkED97KXA6q/w0uAFQQ+
         ps6VftANr1Bx1K8/dQELw51Oawob9ytejuzs9aUdGyaSQ5bwjkGBLiHCvmBjGDMWDyny
         WLEfkbhZeWKFLkpPheLKuCT8JI76sm9ba3vRGGbO4OZ3R2E385/CXvPdvkfhB6zpKA0l
         oe8buaEr6YonSfWM/LOL4yy8GZnHoFJ6rmFKHfH/tkh3GUUuz0BSp1+kqJasOCSxIQTn
         pjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vxqTVJOLmR8PB0jtklnVhYLlbJq8FYLX5wti/CVLsYo=;
        b=Ys9sxDanh4c/zpsm/0uIZhMwI7sy5ezyC2aqupmUhDuOYgc2CFvImMzzGnl3x+phs9
         ej3KOYVrL4Xx2cNPCrkKBTsUcCIuSxganWsY0gV4ckIPH5afEcY2gk3P2v9UdIqN8KN4
         fNoxkrfFZlNgauDW0Cx1zE76EQnQj5j3zwTjlPBcyZIVTABtoVUt8YLD1xUSrQY0NLVY
         nnplEATJ8KR3R0qOo+0Nt0ACPGCziFouYZBFMpRoJx+JLEccgkoCAGrp5hrrDtad382G
         pbUMHHTEEouTpSkuePdnAEv0qruWOgbqBRq/Y52/AVSg4lrstQTb7nBG2Igvem0Ceson
         p98A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JRroiVHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5-v6si7239856qtc.150.2018.06.23.21.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JRroiVHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwUW-0005DM-94
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:19:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIs-0004J1-Nz
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:07:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIs-0004Mt-17
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:07:06 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:38494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIn-0004Hu-29; Sun, 24 Jun 2018 00:07:01 -0400
Received: by mail-qt0-x22e.google.com with SMTP id e11-v6so8765864qtp.5;
	Sat, 23 Jun 2018 21:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vxqTVJOLmR8PB0jtklnVhYLlbJq8FYLX5wti/CVLsYo=;
	b=JRroiVHf4/kdsIImQj1Kw5bQt49Uie0JFm0CHYJqPOkt8uij8yYppxr+UemIO/XR5t
	0eLDenKJQoBesVUVYXr6DI55iTcnqYS4+/42A41kNc7/A9seCCeIFTo9LTso/eK3vxd5
	RHJsOfEncFQNGx1onl4INdzPZzlrdO1Uj32H4Sz392uqmesjfQSTIyVLr3cQdGzs3o3H
	ef6eV31TI25RDHnqPxTQP6v3B8g/9Cb6iJ1R7I9Duj5nyd/t5kXjKMknLBjfHFkxp1MJ
	zsoJIfrrjGc3nqJx/D3Z8W0324FFth0rmHl4+hu2JXLx4RVDP8FCNX9oZQkkPmwIbsIQ
	Rxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vxqTVJOLmR8PB0jtklnVhYLlbJq8FYLX5wti/CVLsYo=;
	b=juYK+6NihNk+xhFXeTppcVvgDQjoeMZUeecjVHBsdiU8OTqIB5vT8GBYWzIun7VDHI
	IEAJGHIFCI124DCqLWfv+HaNNT+WfmVjJu9obdnZrtX+eVIH4wTKa8OBMSwjtAP/O7mv
	fyqFlF9BrWAlvmCHILFTcfcZexQDxdt/ozg6qWYcydrph8iFg3ABwtYEyJbGz3+v/yAg
	oGujWyEcoVPYLXj1VJI69Pf1Zi+rvAT+BPLgFvZ6WvEY9lOOmgUn5H6ZiXMRvlMnnVuF
	9TlUmfS1TB/UdDX2VL7WznzwTfH8G9FWHUeS9Yo0K42IqBMMJ0LkleVckuDTVMsvhNWt
	FR/A==
X-Gm-Message-State: APt69E3k0+CFHOIxzDb82RN3t9L4+OSS4KizV8xkIQg4Hz5gVUICeqlt
	O6mLNlOurD9jpzLEX3gv2Kg=
X-Received: by 2002:ac8:1b9a:: with SMTP id
	z26-v6mr6607134qtj.344.1529813220581; 
	Sat, 23 Jun 2018 21:07:00 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:07:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:06 -0300
Message-Id: <20180624040609.17572-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: [Qemu-arm] [PATCH v3 13/16] hw/net/smc91c111: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M2Krqkaz47jM

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/smc91c111.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index c8cc5379b7..9094c0b47c 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -11,6 +11,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/devices.h"
+#include "qemu/log.h"
 /* For crc32 */
 #include <zlib.h>
 
@@ -478,7 +479,9 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
         }
         break;
     }
-    hw_error("smc91c111_write: Bad reg %d:%x\n", s->bank, (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "smc91c111_write(bank:%d) Illegal register"
+                                   " 0x%" HWADDR_PRIx " = 0x%x\n",
+                  s->bank, offset, value);
 }
 
 static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
@@ -621,7 +624,9 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
         }
         break;
     }
-    hw_error("smc91c111_read: Bad reg %d:%x\n", s->bank, (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "smc91c111_read(bank:%d) Illegal register"
+                                   " 0x%" HWADDR_PRIx "\n",
+                  s->bank, offset);
     return 0;
 }
 
-- 
2.18.0

