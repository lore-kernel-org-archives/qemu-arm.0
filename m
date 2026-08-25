Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C1EC61DBE
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 11:58:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wypmu-000476-2Z; Tue, 25 Aug 2026 07:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPe-0006HE-9k
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 00:05:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPc-0007dL-MB
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 00:05:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cab973140bso54702655ad.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 21:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787630723; x=1788235523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r9YZtJePZ3XT7IoRh5uSQAmm2CNF2ALweHO4SvoI3s4=;
 b=FIPwN1mCqMpPRzI7qAiRnstt843eeHXP4thBPy6SIU/pk5cmGaWzNiv6fnkJYReM32
 uvEHYaWoN3MCrmX32m7S+CTF4eZ95n1vHTqmfAaw2Rtpd4PLjI63MrR/6BadJmxKOh19
 2iEJlLiQ2RWUTpsw7r4Xzf92T/Uxxi0UPADXNxP+8jVrMWOWM1r8jEcBvzGWvQDpqTgo
 WCHY4VkxiVp+UBZlJqo4jktXvCBbGmRQ8fDy6my3uzkW4Jneyj3v5W/Q0Jw4N/GObF9n
 DVJYd04jHh6tzVcWMWxKObkVD1pBPS/fCqwtgMq/Kl9TCCWeqIFOmDqx8EyX4vrM9yt9
 3t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787630723; x=1788235523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r9YZtJePZ3XT7IoRh5uSQAmm2CNF2ALweHO4SvoI3s4=;
 b=fbDlTgHcHNFVnyS5E+qmOH7mnLMULXWcX1/J1oxz5GTN/tn4zdNhIJsxxT+nCKYKxm
 qO4c+kU/HPdkNIzHpPthKxlk8ijH7DZMsFdDJgaVwZc+275OZUvhyYoJaPM5+QETm1I8
 sLZa9i3VF/OgIZMykb2MKl0e+OF9d460+INdjTcnTuYDepdJRgTOuL6uR4J7eTSbZY6v
 XPxFCp9mmSP86a30HnYfEMYOJ0GRnoDGnLIY2xgimyKRpLmbciPcpT+oAHywf0zH/KpF
 0BH1HKeM/xrAXOVNOPd85SfmU9YLV7kW5CJCic826x6xVnn0ZT8zOLHb05qVdKan+ji0
 WjLg==
X-Forwarded-Encrypted: i=1;
 AHgh+RogccvjCE0QI55hYdOI1TVxX/ioHLuWJ7CDha8aykGlzU60FNWGKquwwk57UfB/Tw3oW34lMxJoUg==@nongnu.org
X-Gm-Message-State: AFuF++ncazPwgg3UYT05NB0ztLGsengrNdYRiS6auVDZQ7BKSIAl4Jxs
 azM7b8UFEAN+LHYK3EDJx8xN4wQFWhDUsenTqTs6L7XjGtibOBz/glJB
X-Gm-Gg: AR+sD11La+GhMSQQa4PWWBSHenylzx8kK/Q/bOoIHlAOFqOX7ZcEvu9UM37cV974T05
 iDtsfTm+rUHtTHgjF4c3pfnuHzhElh7lOpaw06V5m69TLhIBbp3ov5MWvnDTDFEwVUZwmw8XNtv
 p+NQNkHbUq1P2AUh17dqn6VDT8KhcL/PY88KNjq54o5w6hE05qwh/0gTsK4k9DxKMm0rNOhR7me
 GqYOiSxz5g062VUyWIU6CNkBSCA/6nc8m/PsvvemZeoGIFscjFT6T42s+x7ODNL2etp8OPOZhUi
 uSokUqmfVeBSFWeetq4VILwph668tFYzXEtrIMPir/WDUNDW5uzVHXDASZ7RIdaun33cO3Badaw
 3LJgpzZJHiGmMOF0eIIvXGMKg1wkqNlAi3xNIwP8IKBZp3Pk6+Rz7TAzw7bNrv0tpaj0VMTTDmG
 Pq5y0ganAer6B8iSpgY0UHX4FPodxw+24Svu7egM5QTlFniFdO5zgTOyyYuFaUv+rpe15K6JbNS
 ZiQQK5pabU4k9i71Kg54eRl6bl4lVbVsg==
X-Received: by 2002:a17:903:3888:b0:2d0:cc92:f7c2 with SMTP id
 d9443c01a7336-2d670b4cdc9mr431321115ad.1.1787630723312; 
 Mon, 24 Aug 2026 21:05:23 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f909adc8sm34104212eec.2.2026.08.24.21.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 21:05:22 -0700 (PDT)
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
Subject: [PATCH 2/4] hw/ssi/pl022: Fix dropped upper bytes of ssi transfer
Date: Tue, 25 Aug 2026 14:04:50 +1000
Message-ID: <20260825040452.1322251-3-stephensportia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825040452.1322251-1-stephensportia@gmail.com>
References: <20260825040452.1322251-1-stephensportia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=stephensportia@gmail.com; helo=mail-pl1-x632.google.com
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

The pl022 model suports transferring a 8-bit or 16-bit frame width. The
16-bit transfer is broken since the upper 8-bits are being dropped by
the SSI peripheral transfer function. Fix this by adding a second call
to ssi_transfer8() when the frame wdith is 16-bits.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/ssi/pl022.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index eaac664ec5..f4ade45ca9 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -74,7 +74,6 @@ static void pl022_xfer(PL022State *s)
 {
     int i;
     int o;
-    int val;
 
     if ((s->cr1 & PL022_CR1_SSE) == 0) {
         pl022_update(s);
@@ -99,13 +98,18 @@ static void pl022_xfer(PL022State *s)
        the transfer has completed.  */
     while (s->tx_fifo_len && s->rx_fifo_len < 8) {
         DPRINTF("xfer\n");
-        val = s->tx_fifo[i];
+        uint16_t tx = s->tx_fifo[i];
+        uint16_t rx = 0;
         if (s->cr1 & PL022_CR1_LBM) {
             /* Loopback mode.  */
+            rx = tx;
         } else {
-            val = ssi_transfer8(s->ssi, val);
+            if (s->bitmask > 0xff) {
+                rx |= (ssi_transfer8(s->ssi, (tx >> 8) & 0xff) << 8);
+            }
+            rx |= ssi_transfer8(s->ssi, tx & 0xff);
         }
-        s->rx_fifo[o] = val & s->bitmask;
+        s->rx_fifo[o] = rx & s->bitmask;
         i = (i + 1) & 7;
         o = (o + 1) & 7;
         s->tx_fifo_len--;
-- 
2.43.0


