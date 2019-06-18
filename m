Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3980177wrg;
        Tue, 18 Jun 2019 10:30:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmud5S5JHZgUxZbm40aU40Lepxyd5efjKkgp55l+EjeVHtmzUzdNXht+zRBeHoh0UKoKCm
X-Received: by 2002:ac8:22db:: with SMTP id g27mr101564697qta.221.1560879000633;
        Tue, 18 Jun 2019 10:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560879000; cv=none;
        d=google.com; s=arc-20160816;
        b=icxAXufd9J0ugCmR2kQm+6JUO5QC9LGGUtRfqcQxMk3MMoevd3/AcFy45Uo9Q2oDmj
         37W9kwsaeHn2sTSUwWT+ultnR/mRD6u6yXMQmW0TynPyAA8kgmcKh1LbzZDsoRPLTBn3
         SAp8T/cuDcPlIavQ9On2YUo/ZQSOWnRz2y6oQhY9DNprnViCcYhezLe+OYgM7C0YGp0n
         ZLlkLPUvNVwkoLltB6vsigZjDZ+esS8kBCIUzgW0P31FdixjSlGE4ZddmsHsomuJ7r7a
         voSw3yNvjQPiMZkMAz0ZFJWn/u1eQn4VUcgRQL4WpCYEzZ11zPqz54Z9bF5endktQv6h
         Zk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=D/ljaVLcm0VGoDUrDYDOVpyV32K5PZFDfs83TRNNrRg=;
        b=JEpzDhvtwoIdsS3QoklgWyxlIVcOeDBFwsq9EcVpkS1Jm2kF52ba/TNnqK2i1i7tlK
         GDehZ04nfZwAH9QAtMZkBM7hPe49uFMnJUZzxNqk3HnJs57XEY+4IQ4QxGpk8+611q/x
         GqBg2QwvhXRMmVmt5Xy/5ZLgTDY3Ei5UefQhw0bMtRKofaKKwiAvOdRbJEJImfcrh2T5
         3uRPudiDM4gbQ6JMiptyVmcZwVHXYxDORGjQTc//QXsKIz4s5PU2ZslZ/es+88Us99pW
         cL+5kyre+ppxIm/HLU3IxVAs/84f9ZXgX3JAv3yImf48tdf+zjQ+lPjsHvg6XYJk9XDF
         t01w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si10484345qvc.174.2019.06.18.10.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHvk-0004UR-7V
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32869)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHOV-0001UW-U3
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHOR-00062W-5A
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:55:37 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:55903)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHOQ-0005gT-RN
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:55:35 -0400
Received: from player157.ha.ovh.net (unknown [10.108.54.13])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 555B421A672
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:55:15 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id AD4816EB549D;
 Tue, 18 Jun 2019 16:55:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:53:06 +0200
Message-Id: <20190618165311.27066-17-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1689694286381288209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.178.58
Subject: [Qemu-arm] [PATCH v2 16/21] aspeed/smc: add DMA calibration settings
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UNyAXHtYdBSz

When doing calibration, the SPI clock rate in the CE0 Control Register
and the read delay cycles in the Read Timing Compensation Register are
set using bit[11:4] of the DMA Control Register.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 hw/ssi/aspeed_smc.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index e00cdebae232..4a2e3a9135b6 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -75,6 +75,10 @@
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
@@ -110,7 +114,7 @@
 #define   DMA_CTRL_DELAY_SHIFT  8
 #define   DMA_CTRL_FREQ_MASK    0xf
 #define   DMA_CTRL_FREQ_SHIFT   4
-#define   DMA_CTRL_MODE         (1 << 3)
+#define   DMA_CTRL_CALIB        (1 << 3)
 #define   DMA_CTRL_CKSUM        (1 << 2)
 #define   DMA_CTRL_WRITE        (1 << 1)
 #define   DMA_CTRL_ENABLE       (1 << 0)
@@ -809,6 +813,60 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
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
@@ -824,6 +882,10 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
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
2.21.0

