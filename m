Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4329284wrg;
        Sat, 25 May 2019 08:33:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3OaNY1DgbdRAsC6qd0KeayffC12YN2SjwNycgqt3fJ2xVXPYpEDTEtq6hylHeJt/FLkPB
X-Received: by 2002:ae9:ec10:: with SMTP id h16mr46300596qkg.215.1558798427908;
        Sat, 25 May 2019 08:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558798427; cv=none;
        d=google.com; s=arc-20160816;
        b=HtdEfjK76+aLeGCc1qkZvx2qhjzwO6lR25sDBh0QLWsaqH8OOpZY3q1EU5fzeiRyBA
         vElx4g1jbNAWLSIYCdt4mzBHaA0iqtQw+TwL6wm27RaRupSAwIBvU94CnbsRHsT5ddww
         AjAZf8yF6bPRP4z1NChkcLPplSXKY52aicTcHIDC84u8oSKbym5GsF28ivuTozM8ZtJE
         pVmsYziL8iRmz76zki6bMpAaGoBsQaZMD1UJjKxNWrWmls/ae9Ufp3TyC8b20q/vcWZs
         QCaW8pTH1HezA7yT+7h5lzN0uFa0ca+ihW2WGl9FSUFtUA/xGYGvbmPZGDx8yRqoFLmz
         a1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZULtlUckg5VdjupyLGYzvK0YW2443OwCY3fUq4ryCmI=;
        b=hWsxcbROAFxLRSsPyV5sjBFKexci8XROXN7wbfHYUcgl66NNIFQB4oATQR3TG23UL3
         +HrDt9RbDYwEIL6qv8SQfCQwYjzKFvjJQAH63P5argNBmbrtGr4dfIg2Jxm6ceMzj2jX
         5N4u0WSTx+QrJqs/YHPcZICM15zm+Db1kEX8EJZ8HsJIAxUFMkUDQAgjyeB+Z+1/z/Bx
         J3nO6Z8q/kRg0fWV7ZTrwvty/J6NIOb5YskG4JulT3nGqx3ofEemx1oogpksHtO6ZByp
         0czyIPcVMwyv4ko1O3uvzz1WZkhsyQzHnt52/7DHMamSY1nUjQFbg9Rj5OWrE46t4m7+
         vTuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si2197278qty.139.2019.05.25.08.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:33:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYg7-0000fj-Cg
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:33:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYdr-0007i4-Cn
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:31:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNq-0003AJ-Tb
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:56 -0400
Received: from 13.mo7.mail-out.ovh.net ([87.98.150.175]:54279)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNp-00035e-LP
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:54 -0400
Received: from player698.ha.ovh.net (unknown [10.108.57.150])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 1AC5211C41A
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 17:14:49 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id BE5CE625A8C2;
	Sat, 25 May 2019 15:14:42 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:39 +0200
Message-Id: <20190525151241.5017-18-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6622824727025912593
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.150.175
Subject: [Qemu-devel] [PATCH 17/19] aspeed/smc: add DMA calibration settings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iqpXd9/lT2YD

When doing calibration, the SPI clock rate in the CE0 Control Register
and the read delay cycles in the Read Timing Compensation Register are
set using bit[11:4] of the DMA Control Register.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index b3c8e0a84f8b..406c30c60b3f 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -74,6 +74,10 @@
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
@@ -109,7 +113,7 @@
 #define   DMA_CTRL_DELAY_SHIFT  8
 #define   DMA_CTRL_FREQ_MASK    0xf
 #define   DMA_CTRL_FREQ_SHIFT   4
-#define   DMA_CTRL_MODE         (1 << 3)
+#define   DMA_CTRL_CALIB        (1 << 3)
 #define   DMA_CTRL_CKSUM        (1 << 2)
 #define   DMA_CTRL_WRITE        (1 << 1)
 #define   DMA_CTRL_ENABLE       (1 << 0)
@@ -808,6 +812,60 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
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
@@ -823,6 +881,10 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
s)
         return;
     }
=20
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_CALIB) {
+        aspeed_smc_dma_calibration(s);
+    }
+
     while (s->regs[R_DMA_LEN]) {
         result =3D address_space_read(&s->flash_as, s->regs[R_DMA_FLASH_=
ADDR],
                                     MEMTXATTRS_UNSPECIFIED,
--=20
2.20.1

