Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3253046lfi;
        Tue, 24 Mar 2020 14:21:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtOCCVBcWLkRhbPD9hz+QC3aUFDZH+ju0ypF5RJHL3W8K6oW1pBXMcES7GJQLLGfuTClrAD
X-Received: by 2002:a05:6214:72f:: with SMTP id c15mr143067qvz.3.1585084880176;
        Tue, 24 Mar 2020 14:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585084880; cv=none;
        d=google.com; s=arc-20160816;
        b=bHm/2tIvkJLlTrjdJh+kIfleo1zmaltewL7+cNhZQtt3NQk/0njrwuHflvmCjzfYgr
         e6LvkvVkyDyyQRcbDKitsP0yqtBcajkOvVxaNZ9PCq+9jyAD4Y1tkeGQBnjkk/z8cIqB
         eTH82mxHIZ4oCkGPOMr4TxzQJJ8pp5BP2FBa/lBxwmRMTt2Bh+GDYLt5rPW9Sgybn0PP
         8Sfe09ZEduCsrKJ31gNGpLH/lVZ2PJYYAG71WqHs7R2irCpJOYegit3WNjQ0ix5vmKGv
         qduQysyFQoJHNJWuwg3G6JLMRQWZk0AqPMP7umP6HZHaPAOPvvxspKHi81EYF/EKsW8c
         5nvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CHQaOdNNxZcPioBS4lbMYM+C10vqbguaMyMsuR9H7ho=;
        b=TT2P+vn2U8Di2JCgzzgg5+y9P/TIcPosm+I5yNWJOTSx1M4jxN7rGVkwgx/27b+pl5
         KzbiG10yiotoNYOdCeEIaJxxqu+mOM4hItd+IWtThyODMpea06XAIf3KZUyBNOgvHAaB
         UzTYGf/mwLj1MxwjcCIv7JE2kXMOfYAME4USX47w/egd991sH4W5ftmatkGswxvZ/o0h
         Wsa52dSu2XPcIz5adlvZsRWbYU0sm6DnAGA5jhvLgzTZssEUlJUWVk7TZncG22dpv9dh
         XebmHiJblCozjFa2R8u8TDDKZiBk8CY1IdBg9kv1tO7gxKBna+4y3ohzUF+1eqn1t+28
         Gf1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4TQClT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g30si11406000qtb.44.2020.03.24.14.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 14:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4TQClT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGqz8-00013H-KZ
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 17:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGqyy-0000zn-Ky
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 17:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGqyx-0007h3-HO
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 17:21:08 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50420)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGqyx-0007g9-6L
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 17:21:07 -0400
Received: by mail-wm1-x342.google.com with SMTP id d198so181767wmd.0
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2020 14:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHQaOdNNxZcPioBS4lbMYM+C10vqbguaMyMsuR9H7ho=;
 b=A4TQClT3Jr1yYu94epxFZBwvGhI6RM39KuMrEIyeXucaHUwleisLFRVy3dCKcAu8XF
 U4U1cieOBPFiu6wrE0doBIV8E8sPY7S3TWHgjV2g7tHWXfxn8vO8/lBTjLJfXWlNgJMC
 GpA/92D2aX8xrnZVwoxr2pI97b99I5ZmxgT6Fg2O+NIrZbXr21af2oFS7r6wqq8AEQPU
 g1YzBcDSHohOPyJoAA/uKbzvfKaFkTikDUy6BCU8/AzeinQXDSZ5pbeGzquFlLd6QZzL
 6p+XAJdz99Ql6DDzIlVmOXS/oKnHqjsLe9XsakvjdO8JT2RUZKV04quFH+QnuUjNj5/l
 nQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHQaOdNNxZcPioBS4lbMYM+C10vqbguaMyMsuR9H7ho=;
 b=aCJwb7CGq3c2E8jYnojCR/IzYh5tIRk0Tos54U2/7Qro5uLbVkTos19USi/2ANwan/
 yxcpiNLjCYI70SmTgVkzOSEDyotnr+qFNkWLU/q9EfSpLfMoHG7Puj4rVoZiOVD8A5LA
 HPgdRqzie8vxtT2ANTxfVwTXGtGcarIaMu/+0SkuQmjrkd85Q96DV41mqnITwUON7nIz
 qHMhNUpOZWREnMMLVD92la2Mpgb0bEpB3s9xnClF5aQKO9xjsdq3kXuy6GwAqmF7ytkg
 v9XrBZIuR2hn6TqNTzZFgCM08DvjC3BbC4qV9QP15a35D+/KTOYDBgA2+biIk/SrmSFd
 LdZw==
X-Gm-Message-State: ANhLgQ25Oapof0eeMwsHdF3y0INGPUPjUaRmJFrgK0TrnGV7DeaGJ2Hm
 ma0lr5r1/+7LTiOjh0U8GQgstSZWeFIWFA==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr7764694wmb.89.1585084865736; 
 Tue, 24 Mar 2020 14:21:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k126sm6139942wme.4.2020.03.24.14.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 14:21:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/net/allwinner-sun8i-emac.c: Fix REG_ADDR_HIGH/LOW reads
Date: Tue, 24 Mar 2020 21:21:03 +0000
Message-Id: <20200324212103.7616-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2RXhu4V/ktr8

Coverity points out (CID 1421926) that the read code for
REG_ADDR_HIGH reads off the end of the buffer, because it does a
32-bit read from byte 4 of a 6-byte buffer.

The code also has an endianness issue for both REG_ADDR_HIGH and
REG_ADDR_LOW, because it will do the wrong thing on a big-endian
host.

Rewrite the read code to use ldl_le_p() and lduw_le_p() to fix this;
the write code is not incorrect, but for consistency we make it use
stl_le_p() and stw_le_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/allwinner-sun8i-emac.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 3fc5e346401..fc67a1be70a 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -611,10 +611,10 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
         value = s->mii_data;
         break;
     case REG_ADDR_HIGH:         /* MAC Address High */
-        value = *(((uint32_t *) (s->conf.macaddr.a)) + 1);
+        value = lduw_le_p(s->conf.macaddr.a + 4);
         break;
     case REG_ADDR_LOW:          /* MAC Address Low */
-        value = *(uint32_t *) (s->conf.macaddr.a);
+        value = ldl_le_p(s->conf.macaddr.a);
         break;
     case REG_TX_DMA_STA:        /* Transmit DMA Status */
         break;
@@ -728,14 +728,10 @@ static void allwinner_sun8i_emac_write(void *opaque, hwaddr offset,
         s->mii_data = value;
         break;
     case REG_ADDR_HIGH:         /* MAC Address High */
-        s->conf.macaddr.a[4] = (value & 0xff);
-        s->conf.macaddr.a[5] = (value & 0xff00) >> 8;
+        stw_le_p(s->conf.macaddr.a + 4, value);
         break;
     case REG_ADDR_LOW:          /* MAC Address Low */
-        s->conf.macaddr.a[0] = (value & 0xff);
-        s->conf.macaddr.a[1] = (value & 0xff00) >> 8;
-        s->conf.macaddr.a[2] = (value & 0xff0000) >> 16;
-        s->conf.macaddr.a[3] = (value & 0xff000000) >> 24;
+        stl_le_p(s->conf.macaddr.a, value);
         break;
     case REG_TX_DMA_STA:        /* Transmit DMA Status */
     case REG_TX_CUR_DESC:       /* Transmit Current Descriptor */
-- 
2.20.1

