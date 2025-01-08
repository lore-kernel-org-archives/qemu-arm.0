Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp715190njb;
        Wed, 8 Jan 2025 01:26:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWeihEjR6J3+RRqe/dt010HFn41PhcxItCN8OZHrYTK6ol/wMrtFI2HkAUIJQVrLUDIqA8vayplvikRA==@linaro.org
X-Google-Smtp-Source: AGHT+IEumGl/CuAxZ+4aVVre4gHwffS+c8gzTQJiQKV09XFz3OcaaVJCACsvnuHvSHnMARgeoGdi
X-Received: by 2002:a05:6214:2dc6:b0:6d8:fa8a:af7e with SMTP id 6a1803df08f44-6df9b1e0f56mr36170586d6.12.1736328400045;
        Wed, 08 Jan 2025 01:26:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736328400; cv=none;
        d=google.com; s=arc-20240605;
        b=JNTF0NE84KSfaRlFsdVQPNN8+4I5kUwkHat08rF9BVRTMrk7/xvaAhNQrAk2swveDH
         NkDp7ts0D9OhRnb56C7+d6XOknB33QRl9AIgWLu1+iDxk4cWXWTmlaIqolVGkeRtraRU
         zO2cFuN3JZ1UsUdPJDzFRgDZK1zW5kH9nga8mZDNalP0SPDQlWPh597JmwRVYEPX/j60
         Nl1rA1gWaJiJRMQ9r6+Pncjg7qZDKA6R8RqIsa2DZAp77cOgPnjZHfls10pBwfmYdHbT
         a+aEpcg3/9lSnbCrQF7afAlyBNtgBw1G0g2tIdMOlwzilxeso416hRtPAQEpnmo2CvkT
         ko7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WARyL/sIptXT/6LU6CvnimThOZH1GGz60bhERGh4Qio=;
        fh=pJajhjkxBosrn8Zuey/3ygGWtCCC2yWWSg2c7dRq6Fs=;
        b=aN5eqJLvq64eswF7ZzfecixL78PJLfd65rUtayrGNg7Nb6vtBu2xHQooV6qsfZdiQR
         8W+v2pzQWkS1y18wLaM4dDxSdZJXK+SWXEDJXJyFDnxO3wCuMmxiz/i9wuJ7MDj7y8Wl
         QG8+hYTAQsvS4+NWZaHAPuZt39vO/hChp2v9k9Q97ljb9Cy8ZFHoycECcS8XEoac3gf3
         O2ZLC510TIJmc7UKJFjj1T0F8nBtZ1lKYLtlsvfKSqeIQtIG3a7j5vOXwZxRa6xgwcUK
         spOoMSSTxmpB7Kov8c/7b+wgmn6gR1MacED1HhI3ZcgSHVylAEk9g/ULQY/nJDlMpBsv
         gy0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ll+7BDf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1835b56fsi459929216d6.438.2025.01.08.01.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 01:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ll+7BDf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVSKg-00045u-DX; Wed, 08 Jan 2025 04:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSK6-0003v7-MD; Wed, 08 Jan 2025 04:25:59 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSK4-0004m9-GP; Wed, 08 Jan 2025 04:25:58 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so4477484a12.0; 
 Wed, 08 Jan 2025 01:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736328354; x=1736933154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WARyL/sIptXT/6LU6CvnimThOZH1GGz60bhERGh4Qio=;
 b=Ll+7BDf1I7g5wbiOCuj5bDsiQMrAcGsJx8M+3h7w5V5oflfrVCIj0LAd4GXTOJsyRd
 C9cl/Mfsmg3AvcfARaBAGnOub32Jg/syNdDpALDYIBN2Ce8r5JzgIWEMlPegNfLpBfTm
 lT4JzJFfNTP0yIYz21F4WT9PmOgzJ937XMNHwSXxC8dYxDDhRHbl0h9A+3Y7q7VQAZnd
 w85ugBX/aQEHN9HRGDUJqyejNIM5p4zICYfxmk2FWWAU2OM2fJTF1i5rTENumLpJX1N3
 NKo/4rrcfuYmVuzq7optpbRxm2sTy4gQgXfVejxxdRlWLMy4pM4nmDAcDvHPnBBOHrWf
 wUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736328354; x=1736933154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WARyL/sIptXT/6LU6CvnimThOZH1GGz60bhERGh4Qio=;
 b=DmfA4hLKAxgYgid/oxtJw0Pxpk8pACMT0rt1PUFWx8O0eNXXVNqmtYX8L3+H55n+Bk
 LZrrKqoBIHUcRy5wzHohfq/aRAdRCEyWYQORlN2RpNbbdImHZH9XFlF11XFS77LOe7LL
 /krSUYLopVsGc+0SouJCbojG07J9kljwbMmsTXKRg4ahwC/wJI+g6RPxYcGhvu5NANwl
 bt9bIZdyGXsaNBkF/xEJmSTQU6RzRi1ctDSJ7A5qsoCXSY29xmJsNj++hwQzh04OV9/Q
 IYvDFRtKg47aixzLhkcJ1ouoTXr52OUHVspIZ0/9wea0D0LVKi9hZVNFKu7EAEAxG9HP
 1mxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ZIdoEaA0Xv/ZzK3fgTm5ISSspF2gmfTW2z1tbBvwnlsLV13BBYFRQPBweq0ayBQhdae1SaRW8U4FcA==@nongnu.org,
 AJvYcCWYEXTd7XoEWKdUeDZCFSDb7oTBRVnXe8/OrS9rzDrRX7hrNAhKTZ5EdUzJ13UbejQGC4OHObh3gw==@nongnu.org
X-Gm-Message-State: AOJu0Yyt+Ch9o5G8vl3Q6yJnXK8aW2ip/XJV34QFOE+cPN/RM+JDXraH
 9lEgdlNXLSOZtpMbYCh4s/+A3F2LbbIXq5kbmQGEkjke5tYHakKyGJajHnS1
X-Gm-Gg: ASbGncuAMTxunaEX5lI4TuVbCzeH92Q/qWmKjqQ8aiuSFHxMP2gYTI/c8jxnHY4tSoN
 iyGKaufjbV+SaeyZDJLtoPVBQDPQaee/ihyEQWHf3Ta3Ip9KAhkmSvRmZSrkIDIro1iETmGhkko
 xut6YoNHr9r/bud4wnBbbMzu8F1De9WXYTZ8xjeYtZaENS4woIcb02WCUQwFgulSD6XuBKFoOxi
 eAXN9BqLchCzSalNufBDIxaCX0kDUNU7TBGVSuacLbooc+3ua3mF6tiCy7L1rHPpT3JVNFNpFYl
 oWajpg1phlW14OOC6CG3TqY7wOZgx+rRlR2iZ2j/xBs3ApY=
X-Received: by 2002:a05:6402:90e:b0:5d3:ec6e:64bf with SMTP id
 4fb4d7f45d1cf-5d972e6f92amr1699829a12.34.1736328353712; 
 Wed, 08 Jan 2025 01:25:53 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-188-106-228.77.188.pool.telefonica.de. [77.188.106.228])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806feddfasm26116096a12.58.2025.01.08.01.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:25:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 03/14] hw/char/imx_serial: Update all state before restarting
 ageing timer
Date: Wed,  8 Jan 2025 10:25:27 +0100
Message-ID: <20250108092538.11474-4-shentey@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108092538.11474-1-shentey@gmail.com>
References: <20250108092538.11474-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tCl05FL9Ap4B

Fixes characters to be "echoed" after each keystroke rather than after every
other since imx_serial_rx_fifo_ageing_timer_restart() would see ~UTS1_RXEMPTY
only after every other keystroke.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/imx_serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index f805da23ff..be06f39a4d 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -381,14 +381,14 @@ static void imx_put_data(void *opaque, uint32_t value)
     if (fifo32_num_used(&s->rx_fifo) >= rxtl) {
         s->usr1 |= USR1_RRDY;
     }
-
-    imx_serial_rx_fifo_ageing_timer_restart(s);
-
     s->usr2 |= USR2_RDR;
     s->uts1 &= ~UTS1_RXEMPTY;
     if (value & URXD_BRK) {
         s->usr2 |= USR2_BRCD;
     }
+
+    imx_serial_rx_fifo_ageing_timer_restart(s);
+
     imx_update(s);
 }
 
-- 
2.47.1

