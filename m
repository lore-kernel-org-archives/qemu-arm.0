Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4140438wrv;
        Mon, 5 Aug 2019 08:53:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyH664oVAH2qzn8XgyyDnSDfcbkzF5KAj0aCdFbwlT2BIXN0OzwEJSIk+BSjQA+W98j91Kg
X-Received: by 2002:a37:9d0b:: with SMTP id g11mr102095319qke.460.1565020413149;
        Mon, 05 Aug 2019 08:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565020413; cv=none;
        d=google.com; s=arc-20160816;
        b=vycQLTPjiaiKNvz+nU0X8qzivzALiCZiVb4T4MoJDBtb1FfZ1DJOnTDvboS0PXEB9f
         5q+wNi8O+FErbyJHqixpCu2S3MzPV8KbzJaK9Cr/dCVDO0f0Js/LVG/iUS2gXsRJga+Y
         j3IVSzmTEAFAgRoiNJxzKpo95rNGKCwRtdn0FD5y6ST3wlnOlLuJ7NAEL1yZjT7FVSkg
         xcBOT7PNXV1zGWrTmS2nhWPMgqJqNyolCOEfLFoVweHoycNVpFw9Tl7VaBWgd2Zn08Fz
         VGUr/X/ZM5q4NFP9ggvhn9KJLJhmGL9u14uSAKPxorhioEke4Rox17tSLcoSgox1HDhF
         HtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=4SPPJgNtAYWlUS/b4VSRjowngisQkXo6hrKl8n1KWO4=;
        b=nDhE8bW4N+RazEh9Bp9hrQtH5S+alZyG5hKe78X3MN0NqzKPX5kBA9ls7J1yyMHyN/
         7ynSSfilVCiLgyeSDaL47nsZhCmpWGSxOvsVj0UumsqgJe+ZA3/spbMxrvchB6rDSBGU
         gK6PBX8b9yFpc/n34IuBXTVdvL49DTn2aTH1DY2w8F7eaT9WWPiZAdHp2ImxLCJfqx1B
         C5myVIhLz0YZdjDViwFwHErfU8j1hUnkj94OJ7JcbPHFIt8KWlwqyCQ9rbGZojqdTqR5
         5Ipw1LUiZOaJ8dQpZSVQfn1fyIPOV9kwXNijqresD5pRYPtrpnkaTEmgt8LIJmkQQXHz
         VnqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uIffK0z2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d53si48306206qtk.9.2019.08.05.08.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 08:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uIffK0z2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hufIi-0003B8-NG
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 11:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufIG-0002gw-Q5
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:53:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufIF-0007B5-Rw
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:53:04 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufID-00079C-J1; Mon, 05 Aug 2019 11:53:01 -0400
Received: by mail-pf1-x444.google.com with SMTP id b13so39862427pfo.1;
 Mon, 05 Aug 2019 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=4SPPJgNtAYWlUS/b4VSRjowngisQkXo6hrKl8n1KWO4=;
 b=uIffK0z2uDgH2P8uHHWrRt5I4VI+rjfRYoDXUFMhC42dC5R6LWwsPldemY26wUrLeJ
 uO11zxkVf3WFGm1yOHNdfecF9m9Izsst0BA9VQ+vtiBIX0kuKxAc2mfThZop21Is07Ut
 Wo6hjvdYbKAh36jbGVyr546yYyoUBIsve+TUsC1vLLTAq6vWJqfXgEwIPhiVUCZ0DN3/
 QMP9oLxQx9yqrovdhV6wcIz4tK25jspiKnWBTG8UcLS8HufJmx+owX5tPczIxwaFG/3e
 2SXvVn91qTfiVuD1IPCz7d3neE3/klRuniiYj19QPVgR0Cd7Y79leROKBOYaGtaP6n+/
 Z+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=4SPPJgNtAYWlUS/b4VSRjowngisQkXo6hrKl8n1KWO4=;
 b=NrZLmTx/AUS2UpYtPtjvjFCzWh+YqiVLRB8NX6zWgqiKQ2nZSyPcU+tRX5LdL5eQ5T
 TGTN6NSQOyVUmq5xJ8Dk4/J2lEcCcKXaMhIZyVHID/Ola/fIpTWPiKp74med4EnQ27UF
 Zy0WOUnSypzCQ0t4k6Aw//iYrh0V/vn8dopxlXx4QP6gqEHJCs3GglQ4ZkvPk4kfyXAK
 VloWkwJ4vw5roOYxjEDGZsF1G3VjwKBmc8LNkNqodD9wsyYW9lNXVRkU5MYb+6Pfkk5J
 tlYFUC2nIHXhEc8BxMo77Bs/7jXzysMZ4z+pwzjCmjZbiANnHSVBGIupds//u9l2JNYG
 dzjQ==
X-Gm-Message-State: APjAAAUY/BTuuwhJ8m+rBA3FUbzIPRI8714rUB4MEKFkQwyO3MBNDCEN
 BQxQtTOTsZg+/o6BJfx6L2Q=
X-Received: by 2002:aa7:9254:: with SMTP id 20mr76151944pfp.212.1565020379724; 
 Mon, 05 Aug 2019 08:52:59 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id y11sm86499328pfb.119.2019.08.05.08.52.58
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 08:52:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 08:52:54 -0700
Message-Id: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH] hw: net: cadence_gem: Fix build errors in
 DB_PRINT()
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /caE0HTZ+vn/

When CADENCE_GEM_ERR_DEBUG is turned on, there are several
compilation errors in DB_PRINT(). Fix them.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/cadence_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d412085..7516e8f 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             return -1;
         }
 
-        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc[q]));
+        DB_PRINT("copy %d bytes to " TARGET_FMT_plx "\n",
+                 MIN(bytes_to_copy, rxbufsize),
+                 rx_desc_get_buffer(s, s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
         address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
@@ -1157,7 +1158,7 @@ static void gem_transmit(CadenceGEMState *s)
             if (tx_desc_get_length(desc) > sizeof(tx_packet) -
                                                (p - tx_packet)) {
                 DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
-                         "0x%x\n", (unsigned)packet_desc_addr,
+                         "0x%lx\n", (unsigned)packet_desc_addr,
                          (unsigned)tx_desc_get_length(desc),
                          sizeof(tx_packet) - (p - tx_packet));
                 break;
-- 
2.7.4

