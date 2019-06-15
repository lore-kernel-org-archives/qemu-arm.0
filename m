Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp206056wrg;
        Fri, 14 Jun 2019 22:19:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3Bq7eNUbrwJfa1zdj1jYOjYiq5tRsH+Ox3y5TG/R4eJbB4de9c9DhhsiXArdaNHJek3p5
X-Received: by 2002:aed:21ca:: with SMTP id m10mr77788939qtc.97.1560575986745;
        Fri, 14 Jun 2019 22:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560575986; cv=none;
        d=google.com; s=arc-20160816;
        b=Of/ZmoD/kJgh95eca7Yt0TZGrik7mqcRZpdiDfujHAbHKdz0JNV6RvQXdSN8ySkKiv
         Zp6c1OADdOgoU9J4rzqvHXkdTAvDkbCH2mirArJvoxAB85uvMeRq2hww236yd5wiJa+D
         WjR63egI8DlCrykWTjtVrp8mY0ziEHLnEGgbd0kSXhgQ8IUYQrg5H2F+YSbBsoixUhK+
         J2b6Rq7yfhXxJrBp3iZj1GgaNP/4LnILKyZL0ocYIQgrhl6HaSTPjfgtiGhCiDp5M2IK
         Ftnl212mQrsMZTPEnJ/ytFpzMxe3l/I3CDF/L3YOKuRgST9Tk+BGXPb+IafSqXA4HdfX
         L8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=0bUB7uKNls6xaJY3zOblGfvogGIyYkXLiWGhdwSVXCg=;
        b=PBjNFKAK59EckQgWS01fpLwbQHyi/uCLxlKhL+4sDA4LO9yzt8+qp5nahgskp/rLGj
         kjorIisCzo66J7telhQYUAvhDJPp42yUWT2gE71iZ+iFuu3BrhO1cw+NZ+yqztI2lYCP
         2hivVaSXAmZ+oejjxQAUk62bAPWOrW6D/YjzrpHwwNpJQYZUS84D8+WwHfhrOLHw1QDc
         zrnt7aAKy7/nkwawi346qIaM0GQhO7/kCHHqpLSHoAeL7mEMBI4s2fJ/hS/1kperiHFt
         lsYdU5qacUuENFInah2IL0gBvLHhZoAtHFZ+v0Ti2fCLuhHqA7Ipb6w+8CdZBKuhwVSa
         UHUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sA1A9QAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si2973779qva.8.2019.06.14.22.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 22:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sA1A9QAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hc16Q-0006Tt-A0
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 01:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50362)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hc15y-0006H0-Nz
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 01:19:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hc12v-0004D5-BV
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 01:16:10 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hc12t-0004AY-6P; Sat, 15 Jun 2019 01:16:07 -0400
Received: by mail-wr1-x441.google.com with SMTP id x17so4502503wrl.9;
 Fri, 14 Jun 2019 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bUB7uKNls6xaJY3zOblGfvogGIyYkXLiWGhdwSVXCg=;
 b=sA1A9QAW1AD0lERRtksYeJAEdb3pu8Sgo/6beN6tKJJozlUcmrc5Ku0ahjk1aKs8Yo
 jDOLov12XVIfTyXbeL/hCNctHyNqfYZRivaGYnl/ylNVe8Sq9yYI+NCJ2ESed3LwYDjk
 bO5+ka8gdt+kEiN8ZUhUxkC/sa5J+R0Bbr3OthzuwRbogVfFwAGB6/24jBX27Dd9NzM3
 O093rdDJLvlp4mpYzNo4CDqv9IQtsGwvRhHFs4jScbZiRWUmCiPXHv9Rf+FW1Qw2y3ON
 JMccGU4AhbpRw/farBoy2Ob7y3J25iNJBf3QRxuUU8dDlfsx4Tm8C+syrwJySFWdBrph
 62kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bUB7uKNls6xaJY3zOblGfvogGIyYkXLiWGhdwSVXCg=;
 b=MymUix7mR+BngAB+DrhG7nJUbRxteN4xPKThUwjyPWLi4VHQFN3WddFY/1CSbTWvz8
 jJTg7KEsFB7p45VSbpRfdnVk8lAQk+TX6l48ujCgI3zD2PbuJcQO9MeBmI6L9Vr8ewLE
 0jQaNoDE5RlfRonAuHNreNHkijBvK3CkcWxGfVGT/vAT6WdLbn7aJPDXnwbQxnpZlLKr
 +VW7KHpR22TskTwJma4BxQRvB11EefLnj+0AKE/ZyaQjShMCKzEaeRScd3nusgZafO9r
 E71dfpe4WnLrT3XUWcaf682pB0cS+N8CyzH3C5Sb2qiWzPFvcZhG5LWwW7P5TGG6j/sS
 Rsjw==
X-Gm-Message-State: APjAAAXTYNpeLBm2+Ad/9dJUHWn0wOuOsa0qwaHp1mWLyOqiy8Ph7ZSJ
 04YQH3/rBTAYFciMMg2XrlWRKdI9JW4=
X-Received: by 2002:a5d:63c9:: with SMTP id c9mr20483738wrw.81.1560575765885; 
 Fri, 14 Jun 2019 22:16:05 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
 by smtp.gmail.com with ESMTPSA id y16sm3553540wru.28.2019.06.14.22.16.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 22:16:05 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sat, 15 Jun 2019 08:15:59 +0300
Message-Id: <20190615051559.13767-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v3] net: cadence_gem: fix compilation error when
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
X-TUID: jNPjaA4uGu3w

defining CADENCE_GEM_ERR_DEBUG causes compilation
errors, fix that.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v2: change %lx to HWADDR_PRIx and %lx to %zdx
v3: change %zdx to %zx

 hw/net/cadence_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7f63411430..ecee22525c 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             return -1;
         }
 
-        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc[q]));
+        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n", MIN(bytes_to_copy, rxbufsize),
+                rx_desc_get_buffer(s, s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
         address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
@@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
             if (tx_desc_get_length(desc) > sizeof(tx_packet) -
                                                (p - tx_packet)) {
                 DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
-                         "0x%x\n", (unsigned)packet_desc_addr,
+                         "0x%zx\n", (unsigned)packet_desc_addr,
                          (unsigned)tx_desc_get_length(desc),
                          sizeof(tx_packet) - (p - tx_packet));
                 break;
-- 
2.21.0

