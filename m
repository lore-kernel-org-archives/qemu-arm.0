Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2193460wrg;
        Sun, 9 Jun 2019 06:19:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXWLJwIMqB+x0YNglekadh6qwSIT768GsQ5wiF8meEmUxEuBrIPoCEOh29pIgK5efiRLDl
X-Received: by 2002:a0c:ba0b:: with SMTP id w11mr5095037qvf.71.1560086346357;
        Sun, 09 Jun 2019 06:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560086346; cv=none;
        d=google.com; s=arc-20160816;
        b=yjh/VIpusCTDz930He2OWOJ5ipFlt8F2xJ2yaYS7XwoUpGteM/ofG6nyg4yaODR/ay
         2jzCx7e7nSCzpHRyZxUb/xVHiLq3DuP8ZiDn8d0ggOYez19IyY380XFhf9/dqgx7iLNC
         +jKNZnWHcwg6r2EGU2KbkgjC7dWJ+y9/PFwmZI0JAZbnaxERd0rqYM3e6d4KsFrnKDx9
         wcp53gRfBU0BlCk5+g9BoAhpPpX++hDH7iW/kFhZFrOWGFzGGsfz3qDAuRSWcZ0LnVME
         GdayoVGmT+JqXKl6rpaP7/Lwti1jEw5vP/9qTgqnOSrrDgooXWn82oFnt2yG58MCYi7D
         hc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=kaWWm0ENYxNgcYgQBzQeXcaAs8MtTpRpm/vY6XfUhz4=;
        b=XXHeVKOw98X6bMKjGpm5lYit4SrxHovyA33TnoIWFQxk+oHo0t68V5d1eJURh/+iA8
         5Mast+VatvP+Hv0zRGNy1tKT64q3l9cqQwtV0wqO5ntVp8YgKJdCc2b3Z/8lu91yRBlL
         8wCJ5uFdqmhqOnwaIMXkefr4oZzTOEjt1XdmOjU3+tBIkyFU3BBikkkT7cxEpst8aMsk
         bpbCUwseTzCfPUXxsufF4oqB+wd7HN3uoGB5U8BgQprOE7vtYLVnOxH7T8cd81cA68Nx
         EYFO7z8/QZYpQpViV441ZcoetP4gUBYOa/hh4Zk+MIKRSSph+PoZUE7XBwjiFPQwD3Y6
         DGUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qaimbRc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g55si1979805qta.91.2019.06.09.06.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Jun 2019 06:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qaimbRc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZxiz-0004Mm-V4
	for alex.bennee@linaro.org; Sun, 09 Jun 2019 09:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43671)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hZukr-0002G9-PY
 for qemu-arm@nongnu.org; Sun, 09 Jun 2019 06:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hZukq-00022H-S3
 for qemu-arm@nongnu.org; Sun, 09 Jun 2019 06:08:49 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hZuko-0001zV-8f; Sun, 09 Jun 2019 06:08:46 -0400
Received: by mail-wr1-x441.google.com with SMTP id r18so6218344wrm.10;
 Sun, 09 Jun 2019 03:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kaWWm0ENYxNgcYgQBzQeXcaAs8MtTpRpm/vY6XfUhz4=;
 b=qaimbRc96cSGFiPbM8dpCk8yeYaLpBBNbLXjz5ZWLeUcy10hajOPZcLYt8uLu/l6Ds
 cCgEH8JIsg5z1MrIjPyd0oVCxPMcbalC2C0md+tGYnwio1Oxw8XvKtRj7psIO/5DHk54
 czc2oDWwhuTOI/O16DxwPWRZMgSbId9VPKPHqa/lQRoUJHuOC4AVY8fdv2Zj1Cjk3igY
 GKC0JPEeW/nT/2L2dG7GZ7kv8d8BpZBWfup53TDO76c6aQIapZmQnmX24JkvMdqIe6Po
 vMbYID9Xv4B7YLCMLvP2oyoIXaRZO4Jmy7FCsexWOyHDDfOzXpFufJQucghet9TV1viF
 h0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kaWWm0ENYxNgcYgQBzQeXcaAs8MtTpRpm/vY6XfUhz4=;
 b=oGVyHyCOxHLdGikHvUx+Ru3MbAhRYGkRrCGHr9RWTbatVe5Dfbn5LzLbGDJVZB0nDh
 Vj+tPnWeC2Iw4SAyvVjkFQ/jfCURJS1Xa7v/bLP0KqROk18nb/YW349fu2jq1K6fTsa+
 whjZdSsttGZx9o6Hu8SmjxQJolupp44bOjc6eicbkfSuo0++k6A9v1IZb+D/JHqbRgXb
 gmeUrkqq8aXTP+es9aldLDJeAH6jj3XtgtjtYOueuPPoqW55ARgqAwSybwsBQrav8CC9
 rlsDOG+5A3BedL6rU0R/nySZzUT3C1mE9qWI+YAVIxKEpZR/TzokQ3rgbX96Ngq8EvwF
 XQEA==
X-Gm-Message-State: APjAAAWSS3HtT06FXt2CfQWyv1zPWICpsm6SObfxC25b0uBWh4SSp7J9
 27owrnopB4FYijWqy3FU3Fay/p7Wo+k=
X-Received: by 2002:adf:f50c:: with SMTP id q12mr13423140wro.300.1560074924479; 
 Sun, 09 Jun 2019 03:08:44 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
 by smtp.gmail.com with ESMTPSA id u12sm6667304wrt.13.2019.06.09.03.08.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 03:08:43 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  9 Jun 2019 13:08:37 +0300
Message-Id: <20190609100837.17586-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-Mailman-Approved-At: Sun, 09 Jun 2019 09:19:00 -0400
Subject: [Qemu-arm] [PATCH] net: cadence_gem: fix compilation error when
 debug is on
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Ramon Fried <rfried.dev@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W3tsFSFYkMoS

defining CADENCE_GEM_ERR_DEBUG causes compilation
errors, fix that.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 hw/net/cadence_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7f63411430..5cc5a71524 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             return -1;
         }
 
-        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc[q]));
+        DB_PRINT("copy %d bytes to 0x%lx\n", MIN(bytes_to_copy, rxbufsize),
+                rx_desc_get_buffer(s, s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
         address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
@@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
             if (tx_desc_get_length(desc) > sizeof(tx_packet) -
                                                (p - tx_packet)) {
                 DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
-                         "0x%x\n", (unsigned)packet_desc_addr,
+                         "0x%lx\n", (unsigned)packet_desc_addr,
                          (unsigned)tx_desc_get_length(desc),
                          sizeof(tx_packet) - (p - tx_packet));
                 break;
-- 
2.21.0

