Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3067691lfh;
        Sun, 22 May 2022 11:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxea1xijv+xstNs0yov3JbkLNzFZkI84zQ9MCb/tWW0PrTAO87OheXNHwFUEphiqV4aYF0i
X-Received: by 2002:a05:6214:5296:b0:461:d3bb:ba01 with SMTP id kj22-20020a056214529600b00461d3bbba01mr14669908qvb.12.1653244572778;
        Sun, 22 May 2022 11:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653244572; cv=none;
        d=google.com; s=arc-20160816;
        b=cehT2X1RStGa+fOlsdCeeYmJMlIxtCf0O7wK9SbLxrV/347Rmqy3dBUsbFE/SEUn/M
         yhy17kwjXi4gJKEE/of34PCkxDXkBt4HyzOnOiumpq4LcX18ngHlPeLpHvNr2avlZ/yP
         7ViWSR3a+Ppvg7MHX350tZWdeayT0D/0JxiiejKXQ7tuWZMTuTqMe6WTxGndqeARLydk
         d0OkANFd9HFyGwTGNRPCYlmzKHX9JAIZjfF1Lnx9tCpBaEGYeuhw0TsJqLDJioVW2PMD
         ycP8/6NOrqGNOKxRqiZieUx3sc00em4x71nViRC12GD+a1LgLm28wiYSWyWEvYllZfdN
         wOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TZon0gdjzrbgysDsnUGI7Gse9qftzLFgsCYzySKFTlo=;
        b=gXnLbt7sm+Bs+pVVSfJ8hdGK3qq/MRBEHILtuwh3EgLWIY15oEj3HUUtRyX0MOS9jh
         5tw7uFdk2w0IrOdV4SQwvAjWKlkzCKXzRcoMrEC78MQ8JczlfNT5Z83V5JblCDk5FWwD
         npCwdgjvts4oKzZ4la/XioUnbPi5FBjcMGgMVEY8Kp7DqcdQtY9AmHIFHWbdvKuO7+mc
         jeOCwtmw0Y4yAkQnqTA/aIZp5RlonInb7oTsnltAhYBXd1nHcMSHKY5ty/tSCR1YWXDj
         16ivvWwgrTSoicVbATwfJL1d7AKv0leiGlleX9I0ECgNhxI8z/qEB8U2FfgtYmB3+1oK
         EFrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=RzYcpPAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m127-20020a375885000000b0069f61c37afasi1870499qkb.548.2022.05.22.11.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=RzYcpPAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqR2-0006Xh-7x
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBH-0007VX-2E; Sun, 22 May 2022 14:19:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBB-0003Ze-7b; Sun, 22 May 2022 14:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TZon0gdjzrbgysDsnUGI7Gse9qftzLFgsCYzySKFTlo=; b=RzYcpPAhGktSEdj41W/POypRYB
 fhMEGoJquKKNdV4RxdNclALyBh0H26ujU138eqQtVJUnvwd9AHVsNxAZH39K/JnuC7z5AN4ZntObH
 xCdeat/OWAMoi5OZF5nhPDI9xPv0qeFzV+1/whIOZa4gk4lbv6tyFRXa9Q6+smZRgVqrjiFcQ5ALK
 htq/bntByUSbQRsg+jjsXanE4LeaJPPZR1dR7u9ciD0IMSdCUnsZRQQDhSZ0jnbpEG5pf/fhjnwwg
 7E4d7TBSYyP3pWDKfuUaEjZhgMhy8+4W3ygdcSKHb2WL57dVYECmwALgGs95uQVjRtZuAQgh5qCsR
 L+uqLvoezsMZF3W9zlONq9uWvBK5jMQ+Haaoe04OT6gufpJK1OhgzR2LdSJ0Q84uyEAIzSfDw9rXR
 mex0FTLdPW0lMjtPezHvutYGegk6EnBWtqtrwaGnZT3P2EDHgVQyV/oMGCY/cGfIJ39C6wGT+qIly
 X3QIelCh0ZK3mgruB0hC9IIsulL/8Q16v9tELSueY5b/sw31zOZ4pnscaW7pndH5gLxUtp/5kYH2Z
 haaXcEA2vT6pXDpTL+G+fG6P+TaqMR8+Y0QCvojoSG7ACdi2KfJ0uW+LXtRlFjF9YztAvLYZ2m+1P
 PFeKdToRCRxbtwV6+YCtJbavrV6Gan18+S89qqtOw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9l-0007pH-MN; Sun, 22 May 2022 19:18:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:00 +0100
Message-Id: <20220522181836.864-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 14/50] pl050: checkpatch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCEmZdv2uPZI

This patch also includes a couple of minor spacing updates.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index d279b6c148..889a0674d3 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -53,8 +53,9 @@ static const VMStateDescription vmstate_pl050 = {
 #define PL050_KMIC            (1 << 1)
 #define PL050_KMID            (1 << 0)
 
-static const unsigned char pl050_id[] =
-{ 0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
+static const unsigned char pl050_id[] = {
+    0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
+};
 
 static void pl050_update(void *opaque, int level)
 {
@@ -71,8 +72,10 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL050State *s = (PL050State *)opaque;
-    if (offset >= 0xfe0 && offset < 0x1000)
+
+    if (offset >= 0xfe0 && offset < 0x1000) {
         return pl050_id[(offset - 0xfe0) >> 2];
+    }
 
     switch (offset >> 2) {
     case 0: /* KMICR */
@@ -88,16 +91,19 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
             val = (val ^ (val >> 1)) & 1;
 
             stat = PL050_TXEMPTY;
-            if (val)
+            if (val) {
                 stat |= PL050_RXPARITY;
-            if (s->pending)
+            }
+            if (s->pending) {
                 stat |= PL050_RXFULL;
+            }
 
             return stat;
         }
     case 2: /* KMIDATA */
-        if (s->pending)
+        if (s->pending) {
             s->last = ps2_read_data(s->dev);
+        }
         return s->last;
     case 3: /* KMICLKDIV */
         return s->clk;
@@ -114,6 +120,7 @@ static void pl050_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
     PL050State *s = (PL050State *)opaque;
+
     switch (offset >> 2) {
     case 0: /* KMICR */
         s->cr = value;
-- 
2.20.1

