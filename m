Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41B4CC6B1C
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 03:38:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHCI3-00055f-BF; Wed, 14 Oct 2026 23:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCI0-00055E-NC
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:37:56 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCHy-0008KR-Rw
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:37:56 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-cc52c1b8286so2973285a12.1
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 20:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1792035473; x=1792640273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cel5+2eqrSaSNQE0/ea7lfr60XbLmvN5Ji76fJ0qJK0=;
 b=AbpUBY0TPgnXnYuvshrXZgneOSvilTW4IFe/9I1uMjRLfegqcCqwbcaSnMnf7EebeF
 Fd4SuzxsfwCa7FAMoLHX/C3aP36iSSoBPhtZVYRZWAthAZJ6wsFdlxkIeBh0k8GpoSfJ
 +IKkQtcQz+84F1G44qLDRK7fmCWF0WPxz+slHPXvFUmKfVbE2XZIwpvxe9RB+/XmEw3E
 HjPiM+n9ogSTzuaeoM//kYXVLvifP7fZqmhUj/qG6NgxvUcBnnhdxnyCUoIg+2xKWZxG
 KSZaglg4ogzpE37xNOyK8SI0IGs/GuGqZ/AlN+WVo6k49ASVozP6ZL9oKbORdLJ7PRsC
 3VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792035473; x=1792640273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Cel5+2eqrSaSNQE0/ea7lfr60XbLmvN5Ji76fJ0qJK0=;
 b=uvFVy6XqLNv95ZTkOIDsiuoaZAPqRD4n+a2LMjxwc6kHSaL233858jdmxnwrJ9Xmc7
 g8enmIm6azG7b+qycBBpX3y9yttg1y3NAvJgbqGWTDN7dJfm0wlTr7ZI9zwNPHiDkd5C
 0GbBjPYQSJTKb1lG2q53dbVXGvlGoyQQK1ydAiVlF/JDFm0EoHK21wECeAX0sIHmQy13
 4lMb/gCOS90zOf0GvJiLUOt4UHkCsVrvIaJV6inWy7HLiOFLtyL1HQ6LKNF9vW1axY6h
 0yR7MiuJGwtT5ajruftvSn+aoe0dwml09O4Yr+FD0Rv0Lkj0nvAIoO7FLNqiz9HxmLnT
 pEkw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvRo4i+kqNVqfreKeh0vpDhaWL8yPaDzjJFmKF1Or7LVsi+XAyHje0r2zw5WRhz+aJesN0t3HQMQ==@nongnu.org
X-Gm-Message-State: AFq9FYIS+fYjtBWMvVATm41kRoTDRMeBfzBe6QXOoiQxT1d+Th2EZ1lh
 wv/fZjI3st4oNr+srfx3keFQEBmEd0z28WF5R5hz0L6M7TFKiHYePuMzUJHlWmwY7AM=
X-Gm-Gg: AYBFou1dMqS7+SdUf8eb/J/iBFNHDwMIyxu72wTxDMnQEmudwlgr8E6GfcmAPDKN08T
 C5eKrS0VTr5q+hH6yIL3pj+XSwBIQUtag9/lL5OnZlI3xuK6xNgyWmkl5U9DKXCC1hxggU8VePK
 XKIHLgNYvFcfT0noCTKedfyYPAvZJUu3fmtB70a42ieWrwvLkJ9z7t/PXui8ntOPIn0TtFIUCy/
 WJqN7ECHAxqD1ZbAxRZW7eyPRrzDg6fCHdvPlLx8aW66ycqLLI3UmJTkdzX57Fc9/dz09oT2c7A
 YKQJahWrrC0HkWTWYb0DbYOmb/U52OOmdZJJWGTEncRZHOQhSpB+VoUJwORGMMBeaOiBNqod3/V
 W32e2pJF4ND7R1XfyDGXU2/4plOak3kfkL5s+qgGs5nbbubEj1ovudR1FScf+kxkSlHEDT6Ggb6
 pG+3mT0f+0eT4ehcnMRIDRX7zfIlKZTElLF25mFRyvd2koz19tx6+UMpKohON3WlCbekYLztJhn
 q5nZ5MsVd170W91AFTnFUq+GBRiHGWp5i9+
X-Received: by 2002:a05:6a20:a10e:b0:3e1:37c9:5ca2 with SMTP id
 adf61e73a8af0-3e164f2cb92mr11336303637.19.1792035473338; 
 Wed, 14 Oct 2026 20:37:53 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.181])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd635c612a9sm559188a12.17.2026.10.14.20.37.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 14 Oct 2026 20:37:52 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 Jay Chang <jay.chang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 1/6] hw/dma/xilinx_axidma: Support 64-bit descriptor
 addressing in stream processing
Date: Thu, 15 Oct 2026 11:37:28 +0800
Message-ID: <20261015033733.35116-2-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261015033733.35116-1-jay.chang@sifive.com>
References: <20261015033733.35116-1-jay.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=jay.chang@sifive.com; helo=mail-pg1-x534.google.com
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

The Xilinx AXI DMA controller supports both 32-bit and 64-bit descriptor
addressing through register pairs (e.g., CURDESC/CURDESC_MSB and
TAILDESC/TAILDESC_MSB). However, the original implementation only handled
32-bit addresses correctly in the stream processing functions.

This resulted in MEMTX_DECODE_ERROR when the DMA engine attempted to
access buffer descriptors at invalid addresses, breaking network operations
like DHCP and ping.

Signed-off-by: Jay Chang <jay.chang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/dma/xilinx_axidma.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 22dec8b3eb..45fd2e45c1 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -181,6 +181,11 @@ static void stream_reset(struct Stream *s)
 {
     s->regs[R_DMASR] = DMASR_HALTED;  /* starts up halted.  */
     s->regs[R_DMACR] = 1 << 16; /* Starts with one in compl threshold.  */
+    /* Initialize descriptor registers to zero for both 32 and 64 bit */
+    s->regs[R_CURDESC] = 0;
+    s->regs[R_CURDESC + 1] = 0; /* CURDESC_MSB */
+    s->regs[R_TAILDESC] = 0;
+    s->regs[R_TAILDESC + 1] = 0; /* TAILDESC_MSB */
     s->sof = true;
 }
 
@@ -194,6 +199,16 @@ static inline int streamid_from_addr(hwaddr addr)
     return sid;
 }
 
+static inline hwaddr stream_desc_addr(struct Stream *s)
+{
+    return s->regs[R_CURDESC] | ((uint64_t)s->regs[R_CURDESC + 1] << 32);
+}
+
+static inline hwaddr stream_tail_addr(struct Stream *s)
+{
+    return s->regs[R_TAILDESC] | ((uint64_t)s->regs[R_TAILDESC + 1] << 32);
+}
+
 static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
 {
     struct SDesc *d = &s->desc;
@@ -290,9 +305,9 @@ static void stream_complete(struct Stream *s)
 static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
                                  StreamSink *tx_control_dev)
 {
-    uint32_t prev_d;
-    uint32_t txlen;
+    uint32_t txlen, origin_txlen;
     uint64_t addr;
+    hwaddr curdesc;
     bool eop;
 
     if (!stream_running(s) || stream_idle(s) || stream_halted(s)) {
@@ -300,7 +315,8 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
     }
 
     while (1) {
-        if (MEMTX_OK != stream_desc_load(s, s->regs[R_CURDESC])) {
+        curdesc = stream_desc_addr(s);
+        if (MEMTX_OK != stream_desc_load(s, curdesc)) {
             break;
         }
 
@@ -314,6 +330,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
         }
 
         txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
+        origin_txlen = txlen;
 
         eop = stream_desc_eof(&s->desc);
         addr = s->desc.buffer_address;
@@ -334,13 +351,13 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
         }
 
         /* Update the descriptor.  */
-        s->desc.status = txlen | SDESC_STATUS_COMPLETE;
-        stream_desc_store(s, s->regs[R_CURDESC]);
+        s->desc.status = origin_txlen | SDESC_STATUS_COMPLETE;
+        stream_desc_store(s, curdesc);
 
         /* Advance.  */
-        prev_d = s->regs[R_CURDESC];
         s->regs[R_CURDESC] = s->desc.nxtdesc;
-        if (prev_d == s->regs[R_TAILDESC]) {
+        s->regs[R_CURDESC + 1] = s->desc.nxtdesc >> 32;
+        if (curdesc == stream_tail_addr(s)) {
             s->regs[R_DMASR] |= DMASR_IDLE;
             break;
         }
@@ -350,16 +367,17 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
 static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
                                    size_t len, bool eop)
 {
-    uint32_t prev_d;
     unsigned int rxlen;
     size_t pos = 0;
+    hwaddr curdesc;
 
     if (!stream_running(s) || stream_idle(s) || stream_halted(s)) {
         return 0;
     }
 
     while (len) {
-        if (MEMTX_OK != stream_desc_load(s, s->regs[R_CURDESC])) {
+        curdesc = stream_desc_addr(s);
+        if (MEMTX_OK != stream_desc_load(s, curdesc)) {
             break;
         }
 
@@ -388,13 +406,13 @@ static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
 
         s->desc.status |= s->sof << SDESC_STATUS_SOF_BIT;
         s->desc.status |= SDESC_STATUS_COMPLETE;
-        stream_desc_store(s, s->regs[R_CURDESC]);
+        stream_desc_store(s, curdesc);
         s->sof = eop;
 
         /* Advance.  */
-        prev_d = s->regs[R_CURDESC];
         s->regs[R_CURDESC] = s->desc.nxtdesc;
-        if (prev_d == s->regs[R_TAILDESC]) {
+        s->regs[R_CURDESC + 1] = s->desc.nxtdesc >> 32;
+        if (curdesc == stream_tail_addr(s)) {
             s->regs[R_DMASR] |= DMASR_IDLE;
             break;
         }
-- 
2.48.1


