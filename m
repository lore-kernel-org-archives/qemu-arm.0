Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1ECC61DC2
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 11:58:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wypmu-000479-7F; Tue, 25 Aug 2026 07:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPy-0006d1-E0
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 00:05:46 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPv-0007fi-Ey
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 00:05:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-381c51fde6bso5371001a91.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 21:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787630742; x=1788235542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xDc3uriN8ejBNB8eMT6Kj0ZXRhTp2iKJ4iNyMAkgAig=;
 b=NEd/3xak4MxMHhNM/0tcSVhHdwEFdxQXx8qNLiJrAtH0rj/5ZzfHanSC5TwUt39pgb
 iCOFgp1qvDVEy0TRulGUkQA0jvFF++CPxgTpqnm12OPB4dEPDTvXVyvVg6aDlqGldiyJ
 Blghtv5p1jgITBGFjWOQbiJJvCSMNZp4kGQBDW9y+yJzKuv+5aUWDg6frOT2URdlPexJ
 6zIRPKLziUwPpHjkcudLXjk/wTndHMzQo1+u8i4mTsJK7xWQfows/3Ki615uMc4hlxt4
 54YbDleq7rrkYQj6lgmR3Qi8R4CQhqQyVLjGkHZi7Idn4VPnFzg+QgNL3tMUIOxUeDbj
 bXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787630742; x=1788235542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xDc3uriN8ejBNB8eMT6Kj0ZXRhTp2iKJ4iNyMAkgAig=;
 b=kxRcMj7ehWkJpB7fF1iBTl+dPrpoxFAk9xJLt9EJooGCuyOmFN7tCK+kRJoiR0zwNz
 POTBZWaOACuUa9Ab61paLa8tG7TFaoFBzTqJmiDBm/2qBQmdUTFf4Ai35CJjyjLs+Bt7
 n7qTRcnU5FBe+0YXGKzLwHmB2VzRvVvWyMcww3CiLaS3vw3XKVgseyBwdG55dKZqMU9q
 VEQPoYksKlp51y1jqM3QXggyAAyWndc/5sGialJ3hUjIB3cvh77Ec2rSMTiFtPgiQG6j
 d0L1qqSua4wnDoP0NnPKbgszUC1JBp473bxjq/RXjZDFivwN4YC9flRCZdsJ2w2oDvP/
 2FoA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoAw8GsZDd0KqvhHkqzAccJYKOZFf7RZQ94RGLlA/tof2uUSr9q16WgdigEVecIkzMheBquUtLW7g==@nongnu.org
X-Gm-Message-State: AFuF++lLhhpAkBGgFlmiBMi7ECytrjgWMxbWxh2zAUIs0EttmXzZ9jht
 IYPeHxAQEJy0WcxrQQAljJPxeUawEKVBvp/x0c/3Iex+k73uBnJJOE/8
X-Gm-Gg: AR+sD13PEfXZsGu0eBtWzoqGDzv7vPfIPcn9t0+7Ca1FK+DArHXL2E6/SGcBQcPKLDO
 dElxe7xdxUnCxu9aHgB8FqUh0L+dOCTa1YOFmtd/4/Jm4oleT0vrh9hAjO9ulZMKBnJtWbzRXBa
 O9V5PN/BTyGnuHMamVTACxkKtqTSawxxbKDSVJSE0Ht29rHFJt4NqnNK5O02a8YxiEqYFgrXmcH
 lRsRJcGeDmRHb6BFnklBveh7mohCVeYk3KPCIIRsaCZPV1SRzo+b6zR/v/6Rz3xd8jMVIu9RF7l
 pjpk8mmEcfQXvLbtPo6QW1PQNmfBhqEEzX/1vj3lCd6lYpJGSVj24ySntZHdJn10oO09kiQbpmU
 atVal3BC8Li7INERxeiEr3uF0/ENmo5306Q8DCou5xo+4O2pfBTzYB1FVwFlD3Qjn0of8FPic9z
 +piU2regOxax/6OiTLTXIMqkFI4qhc4YXPqPIXsMjIQ43TF+S8wyBf5awFYy+Lex/zZDRh4QWsj
 ywB1FKaP2Y0YHhXqcC7MwTkzKLNNBD4AhoeB4diNf0A
X-Received: by 2002:a17:90b:1d50:b0:38f:dec8:f7e9 with SMTP id
 98e67ed59e1d1-395df29b3c5mr47931074a91.12.1787630741938; 
 Mon, 24 Aug 2026 21:05:41 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f909adc8sm34104212eec.2.2026.08.24.21.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 21:05:41 -0700 (PDT)
From: stephensportia@gmail.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Troy Lee <leetroy@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Alistair Francis <alistair@alistair23.me>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>,
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Joel Stanley <joel@jms.id.au>, Hao Wu <wuhaotsh@google.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-riscv@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Subject: [PATCH 4/4] hw/ssi/pnv_spi: Fix dropped upper bytes of ssi transfer
Date: Tue, 25 Aug 2026 14:04:52 +1000
Message-ID: <20260825040452.1322251-5-stephensportia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825040452.1322251-1-stephensportia@gmail.com>
References: <20260825040452.1322251-1-stephensportia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=stephensportia@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Aug 2026 07:57:54 -0400
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

From: Portia Stephens <portias@oss.tenstorrent.com>

The pnv_spi model supports transaction sizes of 4 bytes however there
are no in-tree SSI peripherals that support this. Update the model to
use a 8-bit transfer function.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/ssi/pnv_spi.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/hw/ssi/pnv_spi.c b/hw/ssi/pnv_spi.c
index e2a8a710da..481798b1fa 100644
--- a/hw/ssi/pnv_spi.c
+++ b/hw/ssi/pnv_spi.c
@@ -194,32 +194,26 @@ static void spi_response(PnvSpi *s)
 
 static void transfer(PnvSpi *s)
 {
-    uint32_t tx, rx, payload_len;
+    uint32_t payload_len;
     uint8_t rx_byte;
 
     payload_len = fifo8_num_used(&s->tx_fifo);
     for (int offset = 0; offset < payload_len; offset += s->transfer_len) {
-        tx = 0;
-        for (int i = 0; i < s->transfer_len; i++) {
-            if ((offset + i) >= payload_len) {
-                tx <<= 8;
-            } else if (!fifo8_is_empty(&s->tx_fifo)) {
-                tx = (tx << 8) | fifo8_pop(&s->tx_fifo);
-            } else {
-                qemu_log_mask(LOG_GUEST_ERROR, "pnv_spi: TX_FIFO underflow\n");
-            }
-        }
-        rx = ssi_transfer8(s->ssi_bus, tx);
         for (int i = 0; i < s->transfer_len; i++) {
             if ((offset + i) >= payload_len) {
                 break;
             }
-            rx_byte = (rx >> (8 * (s->transfer_len - 1) - i * 8)) & 0xFF;
-            if (!fifo8_is_full(&s->rx_fifo)) {
-                fifo8_push(&s->rx_fifo, rx_byte);
+
+            if (!fifo8_is_empty(&s->tx_fifo)) {
+                rx_byte = ssi_transfer8(s->ssi_bus, fifo8_pop(&s->tx_fifo));
+                if (!fifo8_is_full(&s->rx_fifo)) {
+                    fifo8_push(&s->rx_fifo, rx_byte);
+                } else {
+                    qemu_log_mask(LOG_GUEST_ERROR, "pnv_spi: RX_FIFO is full\n");
+                    break;
+                }
             } else {
-                qemu_log_mask(LOG_GUEST_ERROR, "pnv_spi: RX_FIFO is full\n");
-                break;
+                qemu_log_mask(LOG_GUEST_ERROR, "pnv_spi: TX_FIFO underflow\n");
             }
         }
     }
-- 
2.43.0


