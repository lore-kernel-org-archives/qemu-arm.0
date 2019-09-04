Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp358510wrp;
        Wed, 4 Sep 2019 00:11:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfNlsk79/5/LAPfagT4Uq4f3ONT3hmmhTY1zsodyeUuUrp/Vf3XN6veWmYpGd0XTWRlDi9
X-Received: by 2002:ac8:27fd:: with SMTP id x58mr38885238qtx.112.1567581111220;
        Wed, 04 Sep 2019 00:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567581111; cv=none;
        d=google.com; s=arc-20160816;
        b=XDLvR7QI3EWE+/eIjVo9x9ur5zf0Q/Z3bX7BxRRFlqfSrCV05FR76tW4tsb6jPChdc
         HJSRL555iVekWI5S6iBWznbTTE6TWGA3mu/R6Pum1UbfmmddQWAKCZpdrJe7k+KhIVjd
         /MYipnF0EnCRcLLql9SsvG+y587im6rWEzSA108tOX5dLkBX/9ooSwJbiIsmRvO1DopY
         5RlzMV5uVtDJsnKKdFt9+JFAXHWeaZIxvflbBA/rvMpeZRO9gb/9OACUC7h49MeCcKnX
         ubLfxtHUdejZlipalmQHwWtYOxPrdpIRLymrbjVBGOIxSwLMoPXjZkp70NVAEXUyOffD
         F0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KZc/b4q1d7k6B4oDiSg8iyuYbln6Ed4s4XB5cm0n9E8=;
        b=y9l3RIJgCjtpAkpYal8bqPOdGycZm5jVfvuNsTDB61nQKtcEYw+pH0FiR7HIxgNGo3
         9uq9eMiyBv/n3d6R0KiPSc62VpacRwrU0P+x7cTRw8Kk1dv/b6sOHTTcZTEa89DB0H6H
         o3M/TQJbI1oAiUzkVn55M+Gcqa+qcY9HlNxGEwWFpdk3KYZz51z45l/Eke31sDavht/w
         qGXqZ55lZnznnZFRthBozbLdBI1LmsLUJHnhm9Hq/SHxJt2RF61nUUrvIWdN67tKPrux
         EaXh9c3DrgMAUzrmNG+43qioOcU7rgNrgMBLLPVEXHJxCfMYjqeCdlXe6a3SiDmiY5ta
         rXIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v123si14557046qkh.374.2019.09.04.00.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 00:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5PSI-0007Lo-As
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 03:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PMj-0001sb-ST
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:06:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PMi-0006X7-KK
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:06:05 -0400
Received: from 7.mo69.mail-out.ovh.net ([46.105.50.32]:47490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PMi-0006WE-EZ
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:06:04 -0400
Received: from player690.ha.ovh.net (unknown [10.108.42.184])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 28A9C683BC
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 09:06:03 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 94FA794DC957;
 Wed,  4 Sep 2019 07:05:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:05:02 +0200
Message-Id: <20190904070506.1052-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
References: <20190904070506.1052-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7087258442873342737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.50.32
Subject: [Qemu-devel] [PATCH 06/10] aspeed/smc: Add DMA calibration settings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0jBj8PgqOg7+

When doing calibration, the SPI clock rate in the CE0 Control Register
and the read delay cycles in the Read Timing Compensation Register are
set using bit[11:4] of the DMA Control Register.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Acked-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/aspeed_smc.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index c1a45c10dc14..7a0cd7607fd0 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -77,6 +77,10 @@
 #define   CTRL_CMD_MASK            0xff
 #define   CTRL_DUMMY_HIGH_SHIFT    14
 #define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
+#define CE_CTRL_CLOCK_FREQ_SHIFT   8
+#define CE_CTRL_CLOCK_FREQ_MASK    0xf
+#define CE_CTRL_CLOCK_FREQ(div)                                         =
\
+    (((div) & CE_CTRL_CLOCK_FREQ_MASK) << CE_CTRL_CLOCK_FREQ_SHIFT)
 #define   CTRL_DUMMY_LOW_SHIFT     6 /* 2 bits [7:6] */
 #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
 #define   CTRL_CMD_MODE_MASK       0x3
@@ -112,7 +116,7 @@
 #define   DMA_CTRL_DELAY_SHIFT  8
 #define   DMA_CTRL_FREQ_MASK    0xf
 #define   DMA_CTRL_FREQ_SHIFT   4
-#define   DMA_CTRL_MODE         (1 << 3)
+#define   DMA_CTRL_CALIB        (1 << 3)
 #define   DMA_CTRL_CKSUM        (1 << 2)
 #define   DMA_CTRL_WRITE        (1 << 1)
 #define   DMA_CTRL_ENABLE       (1 << 0)
@@ -811,6 +815,60 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
 addr, unsigned int size)
     }
 }
=20
+static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_mask)
+{
+    /* HCLK/1 .. HCLK/16 */
+    const uint8_t hclk_divisors[] =3D {
+        15, 7, 14, 6, 13, 5, 12, 4, 11, 3, 10, 2, 9, 1, 8, 0
+    };
+    int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(hclk_divisors); i++) {
+        if (hclk_mask =3D=3D hclk_divisors[i]) {
+            return i + 1;
+        }
+    }
+
+    qemu_log_mask(LOG_GUEST_ERROR, "invalid HCLK mask %x", hclk_mask);
+    return 0;
+}
+
+/*
+ * When doing calibration, the SPI clock rate in the CE0 Control
+ * Register and the read delay cycles in the Read Timing Compensation
+ * Register are set using bit[11:4] of the DMA Control Register.
+ */
+static void aspeed_smc_dma_calibration(AspeedSMCState *s)
+{
+    uint8_t delay =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_DELAY_SHIFT) & DMA_CTRL_DELAY_M=
ASK;
+    uint8_t hclk_mask =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_FREQ_SHIFT) & DMA_CTRL_FREQ_MAS=
K;
+    uint8_t hclk_div =3D aspeed_smc_hclk_divisor(hclk_mask);
+    uint32_t hclk_shift =3D (hclk_div - 1) << 2;
+    uint8_t cs;
+
+    /*
+     * The Read Timing Compensation Register values apply to all CS on
+     * the SPI bus and only HCLK/1 - HCLK/5 can have tunable delays
+     */
+    if (hclk_div && hclk_div < 6) {
+        s->regs[s->r_timings] &=3D ~(0xf << hclk_shift);
+        s->regs[s->r_timings] |=3D delay << hclk_shift;
+    }
+
+    /*
+     * TODO: compute the CS from the DMA address and the segment
+     * registers. This is not really a problem for now because the
+     * Timing Register values apply to all CS and software uses CS0 to
+     * do calibration.
+     */
+    cs =3D 0;
+    s->regs[s->r_ctrl0 + cs] &=3D
+        ~(CE_CTRL_CLOCK_FREQ_MASK << CE_CTRL_CLOCK_FREQ_SHIFT);
+    s->regs[s->r_ctrl0 + cs] |=3D CE_CTRL_CLOCK_FREQ(hclk_div);
+}
+
 /*
  * Accumulate the result of the reads to provide a checksum that will
  * be used to validate the read timing settings.
@@ -826,6 +884,10 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
s)
         return;
     }
=20
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_CALIB) {
+        aspeed_smc_dma_calibration(s);
+    }
+
     while (s->regs[R_DMA_LEN]) {
         data =3D address_space_ldl_le(&s->flash_as, s->regs[R_DMA_FLASH_=
ADDR],
                                     MEMTXATTRS_UNSPECIFIED, &result);
--=20
2.21.0

