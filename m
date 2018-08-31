Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp445944wrd;
        Fri, 31 Aug 2018 03:44:51 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbyN0v/+XSMRCPRAmLvTObWQxK3m2gXDygRoKOyglgAuIGBlSC+9C/RE9D1ZKMOgpW4niOz
X-Received: by 2002:a0c:e083:: with SMTP id l3-v6mr14967217qvk.1.1535712291780;
        Fri, 31 Aug 2018 03:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535712291; cv=none;
        d=google.com; s=arc-20160816;
        b=DS6iZPqvz4202T7FH8iPwcgNuEKkhL1KIuWAEBCNYns1TU8qiyh4bM96M9+XjP4rKu
         NbCvxpkVZuv1UTzs4UqEeDzlAAbyau4P913T8+4FSHn0dl5Gp3R6d95Rp16sfESFSDs0
         c/rOkv7YlRRHoVKnrNktA0y8EwdIDy7ix6R7PoS5aPjHARB6164MhmLJAau+XJKzRQiZ
         nAWtb1u/yHL1T2qKC1b5PqX7t2RgzUiqS5cSItwPCIJp3XiCS4876Ot+KWTlIwo3ds31
         2bBXT5nzukOuxZFuKisXQ9bOkK6ahu+Di+XerJuBXLfg8fUsa7MUvliU70goUpnc6gJb
         biGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=eIxbo72WQB4doFx/dG/3X/kwgkwWHs4ZdlHfXowHdQc=;
        b=h33IQI6xiPgTHKTUss+gfGIXDxTvGa+lmksfd2SyNuD8hQNTa9pU4ECx57VslIqg60
         ROq+KS2CAL2txsb74a5fh0fzKlqV0eWxpRpJdd1f7Nh0q3rTMlPmHrU0P5XWeIuU4BKZ
         foe26smmv6oCDhcweiUk3zavdR2g3hp/yeACsyiOmbhAffJsMs4jZac59HURiQJdIg+f
         5Mj4fOJ9XyPVWTOUDWNtbiwzZDKyV5x9KbF6SO2caBnPtPJ8CxxBOmHguHpCEAFsXaKk
         NiZKa3hZebjze/2OcD1F9IiLQN+Y7BaWSTlCCrToiGBNM7RYHDnwNNlkJd0SdWKFvuIS
         0hwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17-v6si490832qke.302.2018.08.31.03.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgv5-0000uK-7e
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:44:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgqD-0003VW-GJ
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgq9-0002To-5b
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:49 -0400
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:56735)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgq8-0002TG-S1
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:45 -0400
Received: from player168.ha.ovh.net (unknown [10.109.160.251])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id C9638C4561
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 12:39:43 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 6DE8A42008C;
	Fri, 31 Aug 2018 12:39:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:16 +0200
Message-Id: <20180831103816.13479-10-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1940769964799331136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.172
Subject: [Qemu-arm] [PATCH 09/11] aspeed/smc: add DMA calibration settings
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2FkH9YXt8cNO

When doing calibration, the SPI clock rate in the CE0 Control Register
and the read delay cycles in the Read Timing Compensation Register are
replaced by bit[11:4] of the DMA Control Register.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 534faec4c111..983066f5ad1d 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -695,6 +695,56 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
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
+ * Register and the read delay cycles in the Read Timing
+ * Compensation Register are replaced by bit[11:4] of the DMA
+ * Control Register.
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
+    /* Only HCLK/1 - HCLK/5 have tunable delays */
+    if (hclk_div && hclk_div < 6) {
+        s->regs[s->r_timings] &=3D ~(0xf << hclk_shift);
+        s->regs[s->r_timings] |=3D delay << hclk_shift;
+    }
+
+    /*
+     * TODO: choose CS depending on the DMA address. This is not used
+     * on the field.
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
@@ -709,6 +759,10 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
s)
         return;
     }
=20
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_CALIB) {
+        aspeed_smc_dma_calibration(s);
+    }
+
     while (s->regs[R_DMA_LEN]) {
         cpu_physical_memory_read(s->regs[R_DMA_FLASH_ADDR], &data, 4);
=20
--=20
2.17.1

