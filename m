Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3348404wrd;
        Fri, 21 Sep 2018 09:40:49 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZpJbxf+sFmtVLl/GT046y4vdPVRrFe+pavysp2asf2fiG/JmnGxi2YFnKTf8ANMek6CD/0
X-Received: by 2002:a0c:942f:: with SMTP id h44-v6mr32822503qvh.0.1537548048992;
        Fri, 21 Sep 2018 09:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537548048; cv=none;
        d=google.com; s=arc-20160816;
        b=tMn9vjLXMC2tMpDvxwWXXhbsnJq4v7A1iH6pvjHSFvmdSijwhPndbGDU2OouqTssPY
         fBGsww0FVRyRjyUWW3KHXDQC04FTlsSlvgULMWRFmb0L1OBdgy0GZP+pPPh4xJVltaIX
         uRetn1hCxVbGnrycQpO11KDAZjJ05ZWh5/KZDLm18fNxpIiTRN85ojETKqaM9J6rHARM
         qOIkt5q+zDzeXR2nj2jCjxN/QSbO3+3vjfLJudMz0tLogCdEB+o78jS9zpeofGDpMMRp
         yGTcOdbtUOklxdmYkP6WN95bxb7fzty1q7Up5aDBALbhB3fLxJ8ISd6lb79pWAsLewYA
         GvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nUQzp4kKeJ1rvxUnGavwhwv88o+QFMb9faHG/B3bQR8=;
        b=UsBndpDv401ykMP2/mZCQ7DMCB+iBV7gkMHsC9/8rYOj2rxW1m0PGhhhjwwbnbiFn3
         RkWzs0ZL7TM4HDY8lvBtMtTTliBGfRBuoVSURyyb+cmkDqMHp6Yxdl0meeAYhU7egUi2
         dgsWHLB9XI/BsEwCfJFF13RAWZoQm4iNMfm/ywGRIVpVokgtnoQtP/Le9GoaUheAXIsw
         YRyLufiS0xiWwUMaqVGJFkOIaVizdd11W4s8KWAU77Y9VqNzGB18Xan+lLm2YnJKuMtO
         fSDeHOXRo1XF0v7OEWDYVlBfSIHTenJT8jaSCJkdjwrBDfhi/vi+L3S9n7+yJV00UKOY
         JMKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y15-v6si441478qvo.281.2018.09.21.09.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OU4-0005It-GR
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OQn-0002f4-8m
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OBH-0004Yt-3J
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:21:26 -0400
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:36975)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OBG-0004YY-RD
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:21:23 -0400
Received: from player799.ha.ovh.net (unknown [10.109.146.137])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id AC6A4DA7F0
	for <qemu-devel@nongnu.org>; Fri, 21 Sep 2018 18:21:21 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 5BBD6520093;
	Fri, 21 Sep 2018 18:21:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:37 +0200
Message-Id: <20180921161939.822-10-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1909807720689470272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.111.180
Subject: [Qemu-devel] [PATCH v2 09/11] aspeed/smc: add DMA calibration
 settings
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hBBA2eA7yUl0

When doing calibration, the SPI clock rate in the CE0 Control Register
and the read delay cycles in the Read Timing Compensation Register are
set using bit[11:4] of the DMA Control Register.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 625c29ba4ad2..db89c54dfc9f 100644
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
@@ -693,6 +697,60 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
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
@@ -708,6 +766,10 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
s)
         return;
     }
=20
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_CALIB) {
+        aspeed_smc_dma_calibration(s);
+    }
+
     while (s->regs[R_DMA_LEN]) {
         result =3D address_space_read(&s->dma_as, s->regs[R_DMA_FLASH_AD=
DR],
                                     MEMTXATTRS_UNSPECIFIED,
--=20
2.17.1

