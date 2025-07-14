Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CEAC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 18:00:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubNT9-0003aS-Ek; Mon, 14 Jul 2025 14:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubMSi-0004YJ-J9
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 12:55:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubMSf-0001If-Aw
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 12:55:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so2614860f8f.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752512127; x=1753116927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=br77uvVKOnYwvQwak2uW9KVzgHfO7SuJ2lzjCWhl6qs=;
 b=G3YEEvUWKJ3AOY4gEmPlS/DgnbN1H4pTa6ynFGJT7m4XdmB8SHT+ykLG3yWZP4kehH
 hbpCy+CPOX9urjKy+gjbWeB2vGzk+SvHaDa/FZEAL0S9e0AdJmn07nA4Kme9DgoWI8WW
 zt3rJmsjlxhsoghwhZf+3HATVY2CuaTNLlLxtnPZV5xkDUPBo0BcKq2zrKZ8P1kJMwWY
 4I/y6MEUI/alEsF5eCgncOv17qlz8M+PgJCfCt0CJ+6NGEEJWS0owW7BQQXf4JQIdSC9
 nQAn39ymVl+Zpb0AHib9WEX/bGo8sN1q9XhZrqGh4Zwm1p3RCWgt00mDAjqrk8k8hs8e
 8Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752512127; x=1753116927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=br77uvVKOnYwvQwak2uW9KVzgHfO7SuJ2lzjCWhl6qs=;
 b=PuaslOYpm84RmIFQ6rzDMEEpK3FwKbeSkdbkdFZOqKVaOERafI9R1yZuKXdXvrIBP2
 8Ruuhlb1A/noxIpmpCZj3Iim84KHOdYwQo9VigZgOa5FlkA6nRekP3AHB2ZERvPCq40m
 52oY0OCHVDtG+9Xqh6h7G5Q5jLd8oUt+3A43zOlEjh5HAD80w6gCe4e71/Xvyi9bmJ8R
 fZZaBeZBBcjA/mX9Cj+N4maOV2Ozy48tLZmR09kLVWmFr0658Z1Jx3dP1LTCCYRoJ5XR
 whbW254tBBe/iwx+uKUIwsBgv5l+bqwPC7w5PDJEee0E93snCBZHZzKxPF1SbBJ1kva1
 1tcg==
X-Gm-Message-State: AOJu0Yy1y90MZmMKN3DsL6MdNH7tOqYnWxaOQdHei3tF/YxoyKhE0pXi
 dyWLtvFTK4wLaOepb/ZmisBfoMY8bW/xVwlpuHM9OAJ5RWDBn3zVlTKkrhhYAhMumfW+Y/+K+B0
 aP7DM
X-Gm-Gg: ASbGnctmlf7li8tBW05rbhfQPtzvwbrk4KRqrlAJFoUc5DgYgN5lZZH4YT8B38N7Y7T
 9io4nKqG7DmOdSiqtSF9SpnKRKWKdCg/yqHJdqGiUguD4mgK+YIFtCICAYl1jE4UlEGzFFuD8j9
 NAJtnjjuEvOBDg9W8C5plCxbQwdstUvzxBuaRWuV/2u8qS2tnAKMi1P2YNH378V5EFHeUzVhmL9
 gsOHaXZcXdqOIBDkSujzo1h8diMZL1bR0HKXaAktbRIy5/Ha2syfcPhb+XaCd4BjaU8425ORFMS
 Hq3m9nQAjOGuFZLnfbA9hlwevTPX7EqUR8JIQq0Oh6DCWieq+uW5TwOPGz9SWQfoGsvIuiGTthU
 Dw5/63kwRASM25CpIIGsUoo0/72IBb28yD7fthmc=
X-Google-Smtp-Source: AGHT+IEakqGm2fH8gUqKbCg3UjkAETP5OJy/JmVK7JIscCSCLq8PRvnDUgQx1RTkzyBLahVu/ZRzrA==
X-Received: by 2002:a5d:4389:0:b0:3a5:8905:2df9 with SMTP id
 ffacd0b85a97d-3b5f18cebf9mr9849495f8f.37.1752512127319; 
 Mon, 14 Jul 2025 09:55:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd15bfsm13164665f8f.19.2025.07.14.09.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 09:55:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 1/4] hw/net/npcm_gmac.c: Send the right data for second packet
 in a row
Date: Mon, 14 Jul 2025 17:55:20 +0100
Message-ID: <20250714165523.1956235-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714165523.1956235-1-peter.maydell@linaro.org>
References: <20250714165523.1956235-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The transmit loop in gmac_try_send_next_packet() is constructed in a
way that means it will send incorrect data if it it sends more than
one packet.

The function assembles the outbound data in a dynamically allocated
block of memory which is pointed to by tx_send_buffer.  We track the
first point in this block of memory which is not yet used with the
prev_buf_size offset, initially zero.  We track the size of the
packet we're sending with the length variable, also initially zero.

As we read chunks of data out of guest memory, we write them to
tx_send_buffer[prev_buf_size], and then increment both prev_buf_size
and length.  (We might dynamically reallocate the buffer if needed.)

When we send a packet, we checksum and send length bytes, starting at
tx_send_buffer, and then we reset length to 0.  This gives the right
data for the first packet.  But we don't reset prev_buf_size.  This
means that if we process more descriptors with further data for the
next packet, that data will continue to accumulate at offset
prev_buf_size, i.e.  after the data for the first packet.  But when
we transmit that second packet, we send length bytes from
tx_send_buffer, so we will send a packet which has the length of the
second packet but the data of the first one.

The fix for this is to also clear prev_buf_size after the packet has
been sent -- we never need the data from packet one after we've sent
it, so we can write packet two's data starting at the beginning of
the buffer.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Disclaimer: this bugfix is based on reading the source code; I
don't have a test setup to confirm or test it.
---
 hw/net/npcm_gmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index a4341125809..921327dd8ca 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -615,6 +615,7 @@ static void gmac_try_send_next_packet(NPCMGMACState *gmac)
             trace_npcm_gmac_packet_sent(DEVICE(gmac)->canonical_path, length);
             buf = tx_send_buffer;
             length = 0;
+            prev_buf_size = 0;
         }
 
         /* step 6 */
-- 
2.43.0


