Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD01606A326
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+WyAx1v
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xObYA-0005II-Lu; Wed, 04 Nov 2026 09:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xObY2-0005HK-H2
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:01:06 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xObY0-00076Y-DJ
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:01:05 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-677bc4704cbso874283d50.0
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 06:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793800861; x=1794405661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oWjP9TaVJLspcyTTKOYzm0TyKqIJXml7Jq2J79eYhRA=;
 b=Q+WyAx1vycQFAOziiHxkoJE8bRlbnVBvoFlXjX7s1WR0asb3OesE+r7LpqyvxuEoaZ
 OIxhhplHF5xzY/16BMuOdjKeQlTaBgQ4xCzBjewg2nBJXEj9sp281HIbBNm8H8ZNrLhM
 OvZCgyYH3L6Mwy/BX1v68PwesWbUKvNn0gR00Lj6JkhYpqMfSa7giLO4QlbmAGxoNteE
 GPoETfWlf3VGLIOclij8BqRBqzDOWWm0Q+l/+QJQYfl04MsbQO6CHsaYaeeu7MiNyxW4
 5gROba0mb2y8aotNFXzIsqY7NLC0uql7KfnqNpkXWB238WEZ2kFxfMTxklxnighODH1U
 tdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793800861; x=1794405661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oWjP9TaVJLspcyTTKOYzm0TyKqIJXml7Jq2J79eYhRA=;
 b=dNaRPjkgwt8yXoIL7nEPR9vKtwOsMV1ok228b7Q67JyypjfJS1uQ2smVrj6XeGWDUc
 //U5vVd9Hl/w7Rxmf7cCOeSMthB5r6LuskZV1E/nGGK/hjl0E+Uu88aiqKVKtKaTDzNg
 5QjpH6DKutnyCFFai/1XPqpcCzLiV3EzDRzhFt+sx0bmGk7N7bQmfkam4Q3aC4uHtgjU
 XeGB0KhGCbZZzXZPlYNy236J2QnqzdvOnGxxsQN2peDug0NJxi3zjhQc5/N/I/NLOV/D
 xrzZmSL+7/T3w+VfHF6eEx83796mtT4SK2bouR2wa9eavRl/T0kXiUXiUzQKHG3mHVE9
 LnvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByc2O059X2Hs5eoLdKeWUqf1LvlHAf8b84pKquIW2z47I7gLNQhOZJjwsSigLsmSVyRfVfJBAODjg==@nongnu.org
X-Gm-Message-State: APuU4Z9WJ9grB4ifN1209zS9VSiLPqsV+J7jOfFKrQBJMKHe8VBLjGAQ
 qqQB1Jm5Xd8x6IGNud3s9rJHdVBOHfME7d0hTEJtYVDoCIOM8yK+yf5v
X-Gm-Gg: AYBFou32Zgjj+U38mPX0KAcDiiTaAzOFXpsvz5YCurEHudf+RhJndGkgVKBN0ZmLf4V
 8j64wDI0HvejamFx+EZQ3jeOpGhKewWno8MTuMkVX/KcHpRx+xgRt2B0yXpmFrIVcl+rDl+xbCr
 cSiyrNOVBieEbzyXnvgSA9sAgvkjy7+NxQ8IdM1TCCg9plQc2kfdx74SAp6wM2tEkBhWbjEKSS+
 Khx3IEalibklRP0PqU9iM7ZDsXGm6L4QFJf4HKew3L6tZcdFCoxBrzKh5KCfH1esfgj6uMuNd9a
 Y8WrXUJ0wJfcOuXTRxINRi0nvT/INN8fe7Kf6iJx4eV9Y2cHbS8ZrhwlMjosqTbGEtSHFL/IcOM
 uWqpn6plDdbKzmmxEdpvhIogPts6NXQI8ISz54N5UkmetX4vi7TKTSEcwSW+Uw5nBHpFRV7Uq3z
 EtjTS4/dFe8bMrUL/8rUIloRHGZN4GOE6mNmhRyREltJsra+Zyo4TVTLuRMickUt76E3rexNPZb
 5etEdD9badk3DMDNcoWPTTqcqw88fW1XKh6QlA+WQJNyM04SHltNIZIJGYkOm4yI+ZJXh6eCj0U
 EqhWGXiZlWY5cPhlquUvxMXUdxkV1EScuVSS4Mbm4PuZtOvd9PzscEviYeQftnjDGbc/0HloVKL
 hCen2Cl3Z04qzaghVRHSFTSTndA==
X-Received: by 2002:a05:690e:428d:20b0:679:9394:88fc with SMTP id
 956f58d0204a3-67ba5017f4amr7225537d50.83.1793800860580; 
 Wed, 04 Nov 2026 06:01:00 -0800 (PST)
Received: from localhost.localdomain ([2606:6d00:159:2900:6d2d:2c92:88b1:11b7])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e896f09e3sm9369666d6.25.2026.11.04.06.00.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 06:00:59 -0800 (PST)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH] hw/net/bcm2838_genet: fit the RX frame within the guest's
 buffer
Date: Wed,  4 Nov 2026 09:00:58 -0500
Message-ID: <20261104140058.24068-1-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=marcelomanzo@gmail.com; helo=mail-yx1-xb129.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RX path clamped the payload copied into each descriptor only
against the whole RING_BUF_SIZE register (whose upper half is the ring
size, not a buffer length) and against the size of the rx_packet
staging buffer. It did not account for the status block and 2 byte pad
that precede the payload, nor for the 4 byte CRC that is added to the
reported BUFLENGTH when CRC forwarding is enabled. The BUFLENGTH
written to the descriptor could therefore exceed the buffer the guest
supplied.

Clamp the payload to the guest's buffer size minus the status block,
pad and CRC. BUFLENGTH is then at most the buffer size, which is at
most MAX_FRAME_SIZE, so it fits its 12 bit field by construction.
(It cannot overflow today, because receive() drops frames larger than
MAX_PACKET_SIZE, but nothing in the descriptor code made that obvious.)

This also fixes a hang: with a buffer size of 0 the old code copied
zero bytes per iteration and never made progress through the frame.
Treat a buffer too small to hold any payload as a guest error and drop
the frame.

Resolves: Coverity CID 1690161
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/net/bcm2838_genet.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 53bba99b38..ce55dc27ac 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -870,15 +870,24 @@ static ssize_t bcm2838_genet_rdma(BCM2838GenetState *s, uint32_t ring_idx,
         uint8_t *frame_buf = dma_buf + frame_off;
 
         bool crc_fwd = FIELD_EX32(s->regs.umac.cmd, GENET_UMAC_CMD, CRC_FWD);
+        const size_t crc_len = crc_fwd ? 4 : 0;
         size_t buflength;
         uint32_t prod_index;
 
-        if (l > ring->ring_buf_size) {
-            l = ring->ring_buf_size;
+        /*
+         * The buffer holds the status block, the 2 byte pad, the payload
+         * and (with CRC forwarding) the CRC. buf_size is at most
+         * MAX_FRAME_SIZE, so the BUFLENGTH computed below always fits
+         * its 12 bit field.
+         */
+        if (buf_size <= frame_off + crc_len) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: RX buffer size %zu too small\n",
+                          __func__, buf_size);
+            return -1;
         }
-        /* Never copy more than fits in rx_packet after the status block */
-        if (l > sizeof(s->rx_packet) - frame_off) {
-            l = sizeof(s->rx_packet) - frame_off;
+        if (l > buf_size - frame_off - crc_len) {
+            l = buf_size - frame_off - crc_len;
         }
 
         memcpy(frame_buf, buf + len, l);
@@ -889,10 +898,7 @@ static ssize_t bcm2838_genet_rdma(BCM2838GenetState *s, uint32_t ring_idx,
                                          GENET_RDMA_LENGTH_STATUS,
                                          EOP, !!(len >= size));
 
-        buflength = l + sizeof(BCM2838GenetXmitStatus) + 2;
-        if (crc_fwd) {
-            buflength += 4;
-        }
+        buflength = frame_off + l + crc_len;
 
         desc->length_status = FIELD_DP32(desc->length_status,
                                          GENET_RDMA_LENGTH_STATUS,
-- 
2.55.0


