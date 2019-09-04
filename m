Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp356361wrp;
        Wed, 4 Sep 2019 00:09:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxOPUM9W5zR6RTD9MlwVJIyBQx81C80W+xvxC5fVAOFTe0Yo8VRjj1H8NMsQ2ui/IGmUdv
X-Received: by 2002:aa7:d945:: with SMTP id l5mr6597975eds.243.1567580966586;
        Wed, 04 Sep 2019 00:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567580966; cv=none;
        d=google.com; s=arc-20160816;
        b=t4ITP4kuyDAizWBuaV815+Aog9KvAXP6QsJy6FCWNvA6RRIjYfBO7QFnp9LTZPLBra
         0CO9T+IXd587kNfFyvZYyr7hkC4GhqUmU6i0mrOp6vpzdiQx4VTuo7dU41o/P0O7NYFD
         8xNLjSHii86fgM/5sCgxHaWkFFQRrSgD87MhKekcJRjzfMekGvngvZs4M1grjSCNh32z
         zsuTrY+pvGPS5bnnVZ1q862zimlOuesV0BqMwB7oZZ4VdPIsUypVMwVvQKdHpZ0Rso5s
         dBjRtOZrMXe4La1grEMFB+t48XMVg76l26k0SbUXChLBStBPkhur8vUOFGZ9ua/13nmh
         ZyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=v9S36bC1nedchqnp/BFCtS9tEZPgVdbIR+y20NwRHNY=;
        b=iSLcWHcV3DuNPJMNZGQTzyd47C/wH5ijy+u8oK5f77/+4IHRLDqMCSpY65CNRT/9Mf
         e3mIchget+qT2bQsqE910GzyWi3KTvy9YgliVZzQKsoacM5iGG96PT47bEMJBtkqhDsA
         ysa0LY1luU50fFJdGUIMAuBN99ivk5AxJmDIgePJJmXDBfj30WIet834Lql6kvWx+urW
         EfMSI7Shmdq/TJFL+pTD5TwQntB5Sz2D07+EMIYvGseDMM8ZW2iHf9hK5qmqkz12gdv8
         +CINnWduswRuBS+ACQfV5C8aasAlx4ob9IdBM16N3SDLelFGw9xzK2QTRfS5jfztJXnD
         XElQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f56si6736293edd.393.2019.09.04.00.09.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 00:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5PPw-00053F-TX
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 03:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PMw-00028f-4l
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PMr-0006dA-06
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:06:18 -0400
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]:56725)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PMq-0006cD-Q3
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:06:12 -0400
Received: from player690.ha.ovh.net (unknown [10.108.35.13])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 563D124C33E
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 09:06:11 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 1E2EC94DCA1C;
 Wed,  4 Sep 2019 07:06:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:05:03 +0200
Message-Id: <20190904070506.1052-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
References: <20190904070506.1052-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7089510239021271825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.182.191
Subject: [Qemu-arm] [PATCH 07/10] aspeed/smc: Inject errors in DMA checksum
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0TLookLpvaQr

Emulate read errors in the DMA Checksum Register for high frequencies
and optimistic settings of the Read Timing Compensation Register. This
will help in tuning the SPI timing calibration algorithm. Errors are
only injected when the property "inject_failure" is set to true as
suggested by Philippe.

The values below are those to expect from the first flash device of
the FMC controller of a palmetto-bmc machine.

Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 32ce6916f6cc..5176ff6bf95f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -88,6 +88,7 @@ typedef struct AspeedSMCState {
=20
     uint32_t num_cs;
     qemu_irq *cs_lines;
+    bool inject_failure;
=20
     SSIBus *spi;
=20
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7a0cd7607fd0..5c3436db5e8f 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -869,6 +869,36 @@ static void aspeed_smc_dma_calibration(AspeedSMCStat=
e *s)
     s->regs[s->r_ctrl0 + cs] |=3D CE_CTRL_CLOCK_FREQ(hclk_div);
 }
=20
+/*
+ * Emulate read errors in the DMA Checksum Register for high
+ * frequencies and optimistic settings of the Read Timing Compensation
+ * Register. This will help in tuning the SPI timing calibration
+ * algorithm.
+ */
+static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
+{
+    uint8_t delay =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_DELAY_SHIFT) & DMA_CTRL_DELAY_M=
ASK;
+    uint8_t hclk_mask =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_FREQ_SHIFT) & DMA_CTRL_FREQ_MAS=
K;
+
+    /*
+     * Typical values of a palmetto-bmc machine.
+     */
+    switch (aspeed_smc_hclk_divisor(hclk_mask)) {
+    case 4 ... 16:
+        return false;
+    case 3: /* at least one HCLK cycle delay */
+        return (delay & 0x7) < 1;
+    case 2: /* at least two HCLK cycle delay */
+        return (delay & 0x7) < 2;
+    case 1: /* (> 100MHz) is above the max freq of the controller */
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Accumulate the result of the reads to provide a checksum that will
  * be used to validate the read timing settings.
@@ -905,6 +935,11 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
s)
         s->regs[R_DMA_FLASH_ADDR] +=3D 4;
         s->regs[R_DMA_LEN] -=3D 4;
     }
+
+    if (s->inject_failure && aspeed_smc_inject_read_failure(s)) {
+        s->regs[R_DMA_CHECKSUM] =3D 0xbadc0de;
+    }
+
 }
=20
 static void aspeed_smc_dma_rw(AspeedSMCState *s)
@@ -1185,6 +1220,7 @@ static const VMStateDescription vmstate_aspeed_smc =
=3D {
=20
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
+    DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, f=
alse),
     DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
     DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
--=20
2.21.0

