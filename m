Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD7BCC6B2F
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 03:39:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHCJ3-0005ZJ-CV; Wed, 14 Oct 2026 23:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCIz-0005Pq-Rb
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:38:58 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCIy-0008NE-2X
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:38:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-88bd2b44f3aso2336672b3a.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 20:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1792035535; x=1792640335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mnmgL5smVpvugTu3WcIRulBbVrBjhwYgYfVh1+OgDAk=;
 b=Z1YycaMKtEM0HIvaQbaWqSEoJ/edSY2Y1BnKSTeicGSjW8p3m2TOIcVXXtxDtvupiJ
 yXcSR07jbxyd3hukIYl1macD/oPPS/b/XSWFFbFZnBd8YPrSe1H+VNXEs3iSHdN8RYPX
 QIxcFgrj//AWwo2gQlFC/HPp77Z0rc8pEE+mi1TFxLLK+1JsQOGZQDHXqKMRqNTxVAM/
 mBg+NIr4Hgnn2NYo4zkjAFP+C8qDkisPBntjgddDWnEe9jD6atYQpt0DmTuRoZMmAMkI
 FjFvtPAaDozxzQ3jSWsylcpkVVsubJ76gUtSMHiXawSoTbEMfjpydkJyscFHCuzS3sh6
 v5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792035535; x=1792640335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mnmgL5smVpvugTu3WcIRulBbVrBjhwYgYfVh1+OgDAk=;
 b=pW8Bg0X8tVfRR+x8yCjjkd5DJi8jwwozq6QeTzG6s0t5fFxKQEyk9fDxvA5OwvgWxG
 AMxXmX/E4Ez7VocJvWYmieZDiy4J6yogj3TbrJ/vsnITpZs21/s9q+yWqQqN55yi7Bc+
 zZ378+G5kq90IvvnT5ACGQ7B7Ojz6v8dEE8RoI/VNzgRDGE7uW5mhEXLkdzEdfQpcw0D
 FDq7Lc59F0RCIN/VOm9u5YR5TpdHDpi7CHo9H0V+qAI6JexVPtdtfKEXJ8L5bKKr/Kl2
 MhqExuTTP3/fyqUIh4OAw9XbcLjumWKatE0VGWdjhZznYM3h9SVyZvg/wsKhMGOMG/xc
 oFhA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwPQScyzRukZuB55SyNnbOBVG4SlGH2gQLjfO1S0eu+yoJl2GmQsdsQtOHCA/pBnnrZco0YMIXNyg==@nongnu.org
X-Gm-Message-State: AFq9FYKMxdhYTP9kMpndPrl0KL0MikfWWEooCfN6M9fRtnuwDwsvfrrt
 M9KfSFzR5nbp9a7QYh1PcqIRPKkFCvuf5DooksRwBL0ajKQGV5TJR8uZ58y0lv+QNhkkFPwQU7n
 Wcjt/ne4q9w==
X-Gm-Gg: AYBFou0G3xJIWXl5wFnA2rCHuOBs3hu40f0j8jJ6YAM5pOxUU5XU+Yquh12TS4Sk0yW
 TXs0TM5GvpucMg4+Y2AuwXEl0eUP8LfmHMmKQCi8/9zvHw2lZczekSeFmWKw7OM/1sXDkLOJdXj
 QlFJvOoNIZKS47JXeKikkkX7Vs/8X+SxDmKtqk3jpjfeiyrwCgeIhdADyoErnSmaDjiMB1Ztdgh
 925E3rlEQwskfq/xyCugJGDvo6pHZh6toY4xN+faq1wFwGn0x5Z7K4RsY4uuS2SXjxa3EG4+1HS
 fG3g6KQRfvj2YvosEFb3jTDCDBadlz/hiSQOADhyBGwsyCKNHSPWduYV7r2JuAafjYyMYrpIfop
 dJeN/ptZNHVW8NrlJUkQAR7cbgj7Li0HLePJQnkFDLPfWZmLRERLT0KQTfGeZIZ/CmL7al8mCVq
 zgZrufjph0+UCgFaLmtcbynIVmqxfG9gXoxIV2azn+AXuQJC0nuvjIT9/m0Xe6MYsNGXlHhbjh/
 xvIC5KTfEKz376NphJ3ttiZNs1svoDV4EVU
X-Received: by 2002:a05:6a21:4506:b0:3e1:d869:1075 with SMTP id
 adf61e73a8af0-3e1d869146fmr3519669637.44.1792035534744; 
 Wed, 14 Oct 2026 20:38:54 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.181])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd635c612a9sm559188a12.17.2026.10.14.20.38.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 14 Oct 2026 20:38:54 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 Jay Chang <jay.chang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 6/6] hw/net/xilinx_axienet: Fix packet double-buffering issue
Date: Thu, 15 Oct 2026 11:37:33 +0800
Message-ID: <20261015033733.35116-7-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261015033733.35116-1-jay.chang@sifive.com>
References: <20261015033733.35116-1-jay.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=jay.chang@sifive.com; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In the Xilinx AXI Ethernet device model, U-Boot network commands
(ping, dhcp, tftp) all fail due to a packet duplication bug.

The original implementation had a packet duplication issue where the same
packet could exist in both the internal buffer and the incoming queue:

Problem Flow:
1. eth_rx() receives a packet from the network layer.
2. Packet is processed and stored in s->rxmem buffer.
3. axienet_eth_rx_notify() is called to push data to DMA.
4. If DMA cannot accept data immediately, the rxpos is 0 and wth_rx
will return 0
5. Because eth_rx callback returns 0, the network layer queues this
packet again in the incoming queue.
6. Now the same packet exists in TWO places:
   - Already copied in s->rxmem buffer
   - Queued in the incoming packet queue
7. This causes duplicate packets to be delivered to the guest
8. Network protocols fail due to receiving identical packets twice

Root Cause:
eth_rx() did not check if the DMA stream could accept data before
copying the packet into the internal buffer. This caused unnecessary
buffering and potential double-processing.

Fix:
1. Check stream_can_push() at the beginning of eth_rx()
   - If DMA cannot accept data, set need_flush and return 0 immediately
   - This prevents packet buffering when DMA is not ready
   - The packet will be redelivered by QEMU's network layer

2. Move need_flush check outside the while loop in axienet_eth_rx_notify()
   - Ensures flush happens even when rxsize == 0
   - Handles edge cases where the buffer is already empty but flush is needed

Signed-off-by: Jay Chang <jay.chang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/net/xilinx_axienet.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index d35f4a847d..cb9aa47707 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -699,6 +699,12 @@ static void axienet_eth_rx_notify(void *opaque)
             }
         }
     }
+
+    /* Check need_flush outside the loop for an empty RX buffer. */
+    if (!s->rxsize && s->need_flush) {
+        s->need_flush = false;
+        qemu_flush_queued_packets(qemu_get_queue(s->nic));
+    }
     enet_update_irq(s);
 }
 
@@ -722,6 +728,12 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         return 0;
     }
 
+    /* Check if DMA can accept data before processing packet */
+    if (!stream_can_push(s->tx_data_dev, axienet_eth_rx_notify, s)) {
+        s->need_flush = true;
+        return 0;
+    }
+
     unicast = ~buf[0] & 0x1;
     broadcast = memcmp(buf, sa_bcast, 6) == 0;
     multicast = !unicast && !broadcast;
-- 
2.48.1


