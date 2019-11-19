Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp584330lfc;
        Tue, 19 Nov 2019 06:13:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxowhiMFZe8Zi69OuoUijCWyLGUQbwjx3VHAiB79P0oGcOvbqy41j15B9fmtmcGekRXgp/T
X-Received: by 2002:a1c:7d94:: with SMTP id y142mr6344601wmc.168.1574172801179;
        Tue, 19 Nov 2019 06:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172801; cv=none;
        d=google.com; s=arc-20160816;
        b=cmd0X+5vnCzala1bD0JbHIzYmKPk2kp1HYrQFmavDwLsw2kWxYDtljn7UpaZlOmTSM
         fpl3uFGIuPs7LK4IWVK63edkjypwix9GLhozx1m1tSRaHqKTOtJXa4S3iZKmWFZWf4i4
         KgSKbOi3XzS3H9dAT4nwVrEIs6UcFNQ3mCZZ9A2bzEaSGb9gChmj5D+1u4qAUvMR5XqI
         MIGZzipcvWKHf1/StZw5D+aLuOGBY98DuoShQsKkZshY451UGxLb9DhSG3Epw5WlaJzd
         mhK+avJKH5oyXIWZYCH84wpP3VWvG9Ggugc/MFftK1VKLPplWTuIo7xuzU6+gHkqFtPf
         sNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Cw64o6iXBapNzumze8kc8aj69UM/+6AIvTmGQmhoghM=;
        b=SoD7L4WFuvEhrSNToRHajJAY1BC/tHfN6rlfLpXHlGdCdFX5LdUaNbuRj+RinSmXlS
         8X4lEe+yQNAXS1EVTJmO51LEjU+rjEJhwt5oqproblRy5h5wAxFhIxAr1t2jTgLl4V9a
         XLVUjYY3ic6Hit+eUp5jSMiklSDdfpjKKZxeZrRhdt2x80BOZgQUdoIG+wpGFNqkkzuc
         oKN6UYKWgrtJ+AMUdvAPuY43mu/wtYpr/l6berNVRfog2am3rSyR4CG6vdtAtBT9ZxKH
         DCv6g/66zEm5MV2bpGUshv1rN6lyP9pKbjitYezLWDbw4wQUf4HKdWfHwrxLydDOweBz
         lHOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.111.180 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 1.mo173.mail-out.ovh.net (1.mo173.mail-out.ovh.net. [178.33.111.180])
        by mx.google.com with ESMTPS id g14si3189312wmk.34.2019.11.19.06.13.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 06:13:21 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 178.33.111.180 as permitted sender) client-ip=178.33.111.180;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.111.180 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from player795.ha.ovh.net (unknown [10.108.57.53])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 89F5A1228DD
	for <alex.bennee@linaro.org>; Tue, 19 Nov 2019 15:13:20 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 9BA1DC18AAE1;
	Tue, 19 Nov 2019 14:13:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 07/17] aspeed/scu: Fix W1C behavior
Date: Tue, 19 Nov 2019 15:12:01 +0100
Message-Id: <20191119141211.25716-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17906312122056477457
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuihiivgepud
X-TUID: iJARYGLGRDQr

From: Joel Stanley <joel@jms.id.au>

This models the clock write one to clear registers, and fixes up some
incorrect behavior in all of the write to clear registers.

There was also a typo in one of the register definitions.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: checkpatch.pl fixes ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 717509bc5460..f62fa25e3474 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -98,7 +98,7 @@
 #define AST2600_CLK_STOP_CTRL     TO_REG(0x80)
 #define AST2600_CLK_STOP_CTRL_CLR TO_REG(0x84)
 #define AST2600_CLK_STOP_CTRL2     TO_REG(0x90)
-#define AST2600_CLK_STOP_CTR2L_CLR TO_REG(0x94)
+#define AST2600_CLK_STOP_CTRL2_CLR TO_REG(0x94)
 #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
 #define AST2600_HPLL_PARAM        TO_REG(0x200)
 #define AST2600_HPLL_EXT          TO_REG(0x204)
@@ -532,11 +532,13 @@ static uint64_t aspeed_ast2600_scu_read(void *opaque, hwaddr offset,
     return s->regs[reg];
 }
 
-static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64_t data,
-                                     unsigned size)
+static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset,
+                                     uint64_t data64, unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
     int reg = TO_REG(offset);
+    /* Truncate here so bitwise operations below behave as expected */
+    uint32_t data = data64;
 
     if (reg >= ASPEED_AST2600_SCU_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -563,15 +565,22 @@ static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64_t data,
         /* fall through */
     case AST2600_SYS_RST_CTRL:
     case AST2600_SYS_RST_CTRL2:
+    case AST2600_CLK_STOP_CTRL:
+    case AST2600_CLK_STOP_CTRL2:
         /* W1S (Write 1 to set) registers */
         s->regs[reg] |= data;
         return;
     case AST2600_SYS_RST_CTRL_CLR:
     case AST2600_SYS_RST_CTRL2_CLR:
+    case AST2600_CLK_STOP_CTRL_CLR:
+    case AST2600_CLK_STOP_CTRL2_CLR:
     case AST2600_HW_STRAP1_CLR:
     case AST2600_HW_STRAP2_CLR:
-        /* W1C (Write 1 to clear) registers */
-        s->regs[reg] &= ~data;
+        /*
+         * W1C (Write 1 to clear) registers are offset by one address from
+         * the data register
+         */
+        s->regs[reg - 1] &= ~data;
         return;
 
     case AST2600_RNG_DATA:
-- 
2.21.0
