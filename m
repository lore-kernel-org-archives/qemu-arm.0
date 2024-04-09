Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1912172ejh;
        Tue, 9 Apr 2024 06:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWnjlyq2kVTgcn2plQaX/R+Jf4iqurnpJg9Ev5/pU5ZmX9+1fgqITCO5BAoFw5YsbqLtBs7ng58xIBBFlPMpdIGe/x5j2A
X-Google-Smtp-Source: AGHT+IGnjbrif8Dd5KWazcRcd4aiGAlbF7KqHDD4U6fVSWBndz7IMo2k+9CLahsIX5Zi3T6WZMiX
X-Received: by 2002:a05:622a:1993:b0:434:62e2:74b3 with SMTP id u19-20020a05622a199300b0043462e274b3mr4808595qtc.0.1712669995557;
        Tue, 09 Apr 2024 06:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712669995; cv=none;
        d=google.com; s=arc-20160816;
        b=MSClWbNEHM1UXdeHKm70S85r7XgpGKduhDvGVJhAnY/zrtx308yAxViAcXbSJpWuGO
         QtrStQn2ncjImoFg1V+yEvFsUzggNFHbUxX527rwLW6eBK/+qRlI/lfZ/E5K1NjvQZNq
         UOVdryC1LroqUxy7hp0COzZ4OVuOgpD4sCy/rzRLDSAPk9ehWqmb/972nS08Z7CHjulb
         6LoR1QWPJx6RI2OWiTtT40S/hBTXGqg4hK/5UM7yOZc7yKm9xJY5PBQYww+P0iPEYcBZ
         JJ0+/uTQttwHAKpiV3a7+g35Jz3A5JH3JnTXzsUui2NeBbPXmAgfXdykwdRTUkpxFgAn
         kzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LWebOFnaO2YfqkM2Zqjj72nsNguBU6W//GqzHg4t0x0=;
        fh=GtmV8CpCxdRFAaUDh8SmHa8R0vtfNfHIz0+tP+e2QU4=;
        b=okTBAQEyDuVO8EU6ji+wtg7GZqpPH6FAnO4MZ3ldW/q14pxuxJ+9PQDk7qZDrHPjJ1
         KKX8C2pVDQrTZzhWarXz+pC1qPH5fqk40B8IO9kqV38vS4g0B7GpMrF3dTk8y7Ni5Vgt
         /TeewLykSmDoyX/mJLa01lw9bDbSbS2RwtWm+eDVvfT2zcVJ0W6Rf8O78epeyBlKSNQI
         Ur+tPSSx3cJcV7vCgxIfS6p50Nhq1hYGKTN0Xjdh5zxpPmDQMQIYFnRA+DBIANzsvXOn
         8TLgtlxjaUDWJIyhG4NPJiCH638r1k/x/3uGIs/zGyqp54cOC86G8EkOU+KrHiElw9OQ
         4weQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qmf28Bqt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ac87d48000000b0043448da0dd7si10524706qtb.95.2024.04.09.06.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qmf28Bqt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBh3-0006qy-KL; Tue, 09 Apr 2024 09:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgX-0006Au-LL
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:38:54 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgR-0008FT-3g
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:38:45 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d8b194341eso4265341fa.3
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712669921; x=1713274721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWebOFnaO2YfqkM2Zqjj72nsNguBU6W//GqzHg4t0x0=;
 b=Qmf28Bqt9/Lk8VbUT/Uc313cTBuk3nl4lQP5KX8ZeS8GuAWTX2MbYz9C9XPSO4O1fF
 I77tuA9SO39o+EDBWIOhWNAgMVHe24e+xckBxIjBA4nBXBAYlmuPJpPbwUgmEGKlrzcJ
 G+UKytPg3lxUkcbdbDaR1r9HLiXABHva30zAQn7oWA0uu3vVuJKMXDKW3HuiOH3Dkk/5
 tOhJT8LHescq/62o/EanEkYKghAPApMIjBMe3/1HNW6EDmND9hnM57KbmKRnYQn7QWD8
 v2yjfdHMHYzUpfZsH4G4RWuj72D+b6mgKx2JF6CnH4hy9FYjCHG0n2i47lIv93BTa6CV
 U+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712669921; x=1713274721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWebOFnaO2YfqkM2Zqjj72nsNguBU6W//GqzHg4t0x0=;
 b=CIaQlitKeq7cheIXIccSLQStCtSXuytiBq0ZSf5gipQTGoQ0+GeRkM0p7W7NF/iKC0
 NkSsVMse5kmsH2mAS5H5HCc1awVSRgUMWiT4z2WBvhdJyspdLagFDuM9vgaeangzq7zg
 gKxkjUm140gMVxHZvBSld/3bTUb24skpp5AtvB45tAfVPUlAz5U+V6J7JvFddd+RHOrh
 H1edvX6x0x9e47Folo9x6ImvWy/EBiZsv2c6m3G/CYZ9iVWKo34mG3JZhqXFYZn7L97r
 YaN5dkgzqLMHKaZquLacmJ7kty9YPwINocf5k819VEs4E4zOOWeFVF66sTCyyVl6SwUH
 xeVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlmPNvDIU3Q5i+TW7DhHp7q9vm7VdGzj1w3djQQ+epHeOiKjCOOAlF4T1BYb2vdnfkSJwXth6ln/36SMyJ81vXK9Fy
X-Gm-Message-State: AOJu0YzT7xh2X8QGCCoR2HLErdBmdYb3wRg0RZfa1GUzIfTCjgIlM4JS
 98tt761WXYW5egtj38zGHE7FZPHvGVgPY6RoIubTy7sdP5NT/2MtDFof5TbP5Jk=
X-Received: by 2002:a05:651c:794:b0:2d8:67ee:2a44 with SMTP id
 g20-20020a05651c079400b002d867ee2a44mr6899106lje.8.1712669921293; 
 Tue, 09 Apr 2024 06:38:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0041691379a84sm1446429wmq.1.2024.04.09.06.38.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Apr 2024 06:38:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 v2 07/11] hw/net/lan9118: Rename tx_fifo_size ->
 tx_fifo_bytes
Date: Tue,  9 Apr 2024 15:37:56 +0200
Message-ID: <20240409133801.23503-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240409133801.23503-1-philmd@linaro.org>
References: <20240409133801.23503-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: nWKL6LlspQ3U

tx_fifo_size is a byte count, rename it to avoid confusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index ba92681e2e..a983ce193b 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -251,7 +251,7 @@ struct lan9118_state {
     int32_t eeprom_writable;
     uint8_t eeprom[128];
 
-    int32_t tx_fifo_size;
+    int32_t tx_fifo_bytes;
     LAN9118Packet *txp;
     LAN9118Packet tx_packet;
 
@@ -322,7 +322,7 @@ static const VMStateDescription vmstate_lan9118 = {
         VMSTATE_UINT32(phy_int_mask, lan9118_state),
         VMSTATE_INT32(eeprom_writable, lan9118_state),
         VMSTATE_UINT8_ARRAY(eeprom, lan9118_state, 128),
-        VMSTATE_INT32(tx_fifo_size, lan9118_state),
+        VMSTATE_INT32(tx_fifo_bytes, lan9118_state),
         /* txp always points at tx_packet so need not be saved */
         VMSTATE_STRUCT(tx_packet, lan9118_state, 0,
                        vmstate_lan9118_packet, LAN9118Packet),
@@ -456,7 +456,7 @@ static void lan9118_reset(DeviceState *d)
     s->txp->cmd_b = 0xffffffffu;
     s->txp->len = 0;
     s->txp->fifo_used = 0;
-    s->tx_fifo_size = TX_DATA_FIFO_BYTES;
+    s->tx_fifo_bytes = TX_DATA_FIFO_BYTES;
     s->tx_status_fifo_used = 0;
     s->rx_status_fifo_size = 704;
     s->rx_fifo_size = 2640;
@@ -757,7 +757,7 @@ static void tx_fifo_push(lan9118_state *s, uint32_t val)
 {
     int n;
 
-    if (s->txp->fifo_used == s->tx_fifo_size) {
+    if (s->txp->fifo_used == s->tx_fifo_bytes) {
         s->int_sts |= TDFO_INT;
         return;
     }
@@ -1285,7 +1285,7 @@ static uint64_t lan9118_readl(void *opaque, hwaddr offset,
         return (s->rx_status_fifo_used << 16) | (s->rx_fifo_used << 2);
     case CSR_TX_FIFO_INF:
         return (s->tx_status_fifo_used << 16)
-               | (s->tx_fifo_size - s->txp->fifo_used);
+               | (s->tx_fifo_bytes - s->txp->fifo_used);
     case CSR_PMT_CTRL:
         return s->pmt_ctrl;
     case CSR_GPIO_CFG:
-- 
2.41.0

