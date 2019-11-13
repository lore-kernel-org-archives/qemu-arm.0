Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp4667962wrr;
        Wed, 13 Nov 2019 14:13:20 -0800 (PST)
X-Received: by 2002:a17:90b:110f:: with SMTP id gi15mr8300157pjb.128.1573683200707;
        Wed, 13 Nov 2019 14:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573683200; cv=none;
        d=google.com; s=arc-20160816;
        b=O813rBfNEDPrYEZa4EA90R7nTLAfkkLgZ5gdZtWf4DvImyMil7n8O+jNSXd4QoO/Pg
         CIDElwcvmzkv4gGbQFIu0mfTBoJDycJtkUcozfDQUhqOqW4E+SE7IBE2Jjh5/LVciT4J
         HRQQYMgx3vVSYvUauNPF7rzALTs9ii5vyxCGvzYHdBwNk5f+JN0pZRxN7dAi7SZq+9PE
         k56hbnSBDZ29d6T3bClxXjB+MQlAqWizdR0+LdF6vyFbHhkEzC1yiorTj3SpdSLBjCG5
         QILwivYQW4Z94Yg3K86YqTehEs5+C0sYXGI2wfNB5Bztdxswcj9ugB6yOZaXPm875d/D
         7Gbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=thDO08iuJthlIoDRnaZrctxgEQ0GtnTwsT4oxGR+A5g=;
        b=AdUVjEOsHlYD/DG89Shv55trKt3DTNdIP4eCOZMGpdW3QpfeenH5Sr1V5qOA8AW8oT
         x5gjBtkdQBPXeGNBAuUhONK9uWTZrt7u2189jJhAFZSMi75MOxy6k2Y4Rhez+y1CGC5X
         4Nm2/4IPdp+efzhsW9qCR3SZdJwmLFJKsR2IaFZdCacaVmvN/c/IVoJy4yUe8qVaTnVg
         41Ur7p6mYcjgtI2HrFyNQ8G7h5dXVCI3NggQAwMEO/w/obMZg5QQNJ9hxviVGvoye6x0
         tKCjDCtGtojJZttp3ySpEQM2UxmsfdrFqpWcJWkM/jGHE2jBKxt+zHoQHiKxi391QFr6
         TV3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f3yHZL6i;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x7sor3197898pgp.55.2019.11.13.14.13.20
        (Google Transport Security);
        Wed, 13 Nov 2019 14:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f3yHZL6i;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=thDO08iuJthlIoDRnaZrctxgEQ0GtnTwsT4oxGR+A5g=;
        b=f3yHZL6i3Bz8BDMXLZNwm6n9ggNx06bqe0BMu8NBTsvphxSlBtTrRur1Ck++FwZT8j
         69dxTztU2y6r7D1Y8NUWPH1HcqRnRZ42LYJvjA3hhUFRB+GgIV05t3TxSLo0sNG8jovS
         5Ud4mShPBZTm55SnDdJ9sekg6j9wvM1ra2JSF0p8a1EG9WGKNvAdQGb/16uzMswISDSl
         jYZjyiOgLL8Ccd1CZYLR7bNflKyZ7JpmO0oZsG9aqI6whHBqjL0JXPr2p29aptYJ78nf
         Jb7wTPIraZ9O9jyeBA5qodOHNHKl3E4J+4vLbBMFzj6OwxK1wbsQD8LmKSzNkuv6bIPe
         gBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=thDO08iuJthlIoDRnaZrctxgEQ0GtnTwsT4oxGR+A5g=;
        b=fqA+fLjQHGNHZtu5QodeP8m2Na6W5xM/bL6wQ0UzWO6sxStddy3L05diiVridt6RWY
         CbVbyRup9QPI3jtJ2RPyoW8ZWZsC1Dyzd9F9z6IwE5vvPz2nOfcV/9jjwqPZs3q70aOl
         jWABJZ+SxFggB3mnL5dbQeprWHYzGEtWq8wfKUUNtHQF+HUXgwqHGRHlvdZrnJQrqvmK
         rnifKIzjYLDM290ELyKWKzZwReE2LHNhe6UEfyaf6SJa/DP3ynLuPWdYgHaRv2KLnMg3
         MMiYcXDpHmxuI9WqD8ACUAflRZuag36v0XrFRucFcs5l66Jca1jfIIWsB7XYJvDyy0Ph
         u1+Q==
X-Gm-Message-State: APjAAAV86PBl6wjGSbZ6w5HcUwE0g5g4BVqZE/klQWWuZx/tJoQvawUi
	gMCzUnNJfU31udfwIuxlrYoNIoGWsVY=
X-Google-Smtp-Source: APXvYqz8d4rh92+HTJVxoMIitfjVp01ZwiF+WzZ8OQ9LhKCwmgwgy/MnxjpfaVKGkEn6N0uz60AAWw==
X-Received: by 2002:a65:624e:: with SMTP id q14mr6221514pgv.277.1573683199705;
        Wed, 13 Nov 2019 14:13:19 -0800 (PST)
Return-Path: <joel.stan@gmail.com>
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w69sm5252005pfc.164.2019.11.13.14.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 14:13:19 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] aspeed/scu: Fix W1C behavior
Date: Thu, 14 Nov 2019 08:42:59 +1030
Message-Id: <20191113221301.8768-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113221301.8768-1-joel@jms.id.au>
References: <20191113221301.8768-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: issfJ25KAhnM

This models the clock write one to clear registers, and fixes up some
incorrect behavior in all of the write to clear registers.

There was also a typo in one of the register definitions.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Beef up the comments
---
 hw/misc/aspeed_scu.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 717509bc5460..5518168e48b4 100644
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
+static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64_t data64,
                                      unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
     int reg = TO_REG(offset);
+    /* Truncate here so bitwise operations below behave as expected */
+    uint32_t data = data64;
 
     if (reg >= ASPEED_AST2600_SCU_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -563,15 +565,20 @@ static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64_t data,
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
+        /* W1C (Write 1 to clear) registers are offset by one address from
+         * the data register */
+        s->regs[reg - 1] &= ~data;
         return;
 
     case AST2600_RNG_DATA:
-- 
2.24.0
