Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp3426705wrr;
        Tue, 12 Nov 2019 16:52:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhKKv6ooJNNnf2JpuaVdow5TlaVJgRgbSuuACqXnA3JGjDOccrZox7wHdXK0V/HPJ0vdII
X-Received: by 2002:ac8:e42:: with SMTP id j2mr191487qti.131.1573606371137;
        Tue, 12 Nov 2019 16:52:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573606371; cv=none;
        d=google.com; s=arc-20160816;
        b=QAazDDlL/diVeAG0524SpPSf+6UmrVxlyxJ6VB8KTWgJ/fADk/wWwv7iAFW7BrJ+Xg
         heZQZ0ofsEnSnfO6B63+meW3ZQOx69l2N8TeNWfM7ql90bjVzn2PflNQlpgorxwZJxom
         6z/DsshWZsk+ZISVO6YtjODkH5kf5l2wSaedhlojJdWezhOuK/yMmTV+7hl2D01f9ITA
         AF7iYeGAgyKXKZ9pa4ej/mnNQNSmgO+6aZWMxeSCwJpJ7+kHyR3wcksFoSEvKuUJH+h0
         WsXOVJBV1/IMzAA/M7Pd3uEaQc9DKm1xDEhd3msx9OnMiN2xwXQJaYGVfUhjI+ihABlV
         e2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JHNUboLiwnMy8/zIcCYpOfkRFQBDDIonvvSVwq8TfVc=;
        b=Iiun3uPylZtoKMKjK7Su/PdQ8G9+IGyhk+0D+hsdq6llBWJ+OqWGB7RiRdwsxoNJsQ
         wmHPEbf6qFJpbVWH6C0pEHsmAGwf5BDWCr6nW0LhoA0HPbZ0prFoyg+9UhL3Fj0SQTkN
         bdyDIhu8AXfJQey4inHbjC8gZRG+D7ZpbKuxgwrA00ldvMrhjNkp8Cl+/Q00OucgQ673
         RsPBqm2bNMXwjFYYcD1D/m02ERo0XVf9sCRe1uOWWN4SlJeAIWdTZ6FYCCM3mLYAHAmS
         8BsxXdAvgt940NzsAW1/8OzvoFX8Totz6bSCarHthVC+o9hgihCyOELky6Yzcpj0FfcC
         5gDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NawExmep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si196593qtj.45.2019.11.12.16.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 16:52:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NawExmep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUgtu-0001T7-FG
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 19:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtP-0001QI-96
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtO-0005Ie-8P
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:19 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUgtO-0005IL-33; Tue, 12 Nov 2019 19:52:18 -0500
Received: by mail-pl1-x642.google.com with SMTP id d29so276768plj.8;
 Tue, 12 Nov 2019 16:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHNUboLiwnMy8/zIcCYpOfkRFQBDDIonvvSVwq8TfVc=;
 b=NawExmepWfryxT3Y/BhVLWQa2IGjmfPs+mdklEQWUOPEdzj5gosO64tZi2xG+reloB
 5vgMpEC48H0yB2HLEZueLFc0Y8PzNtwGDUN+r12fBJtqaML0b1QaC0e1TeTAZvuFPWPV
 gotPJl8ZggkteY9LvZc2/Cb4WsXTVpqyU6GZRAfmh+gxzy2n7jrHWrzISIrlF2DfB3p+
 wnI1k9Zxiw8Nuo9cg/yqs0tqVdS2geIl/fyyLKG6UmC02tKE0/hRSoP7eb+UscROQ4ol
 Aj9FdHH/VPji1e0375IS5DIK0MsdyEJHTbcgIxdshBDd7zISJSqOVM8yaPc5gf5QuApH
 74Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JHNUboLiwnMy8/zIcCYpOfkRFQBDDIonvvSVwq8TfVc=;
 b=ozPSR6HrXySNaN7qUMZ2zUKFmzRKNqqjhrp3L/NdSjpRZSIMLz9IIOhRNgKKbGDFiI
 dKSH4jLXBHmzR/34xVIPiL0UqWeV68ENVhvcMiMyLB/rNrxdMjfcOUwQCZBACRkA7uoS
 tYRQPiyQ68QWGpNzMzy51t7qpYTB8sjj6VLFbmQ1bbraeRY3Ge9tMg6sM/Lo7QpoXk+s
 HvHUmE7dvNCu3YNHYQIaaYq5Ebpt8t1QepO7tBudlKnd3d+Tp2VM96XugYhtkSMP9kD7
 KBlSrw1Z54kv0717TGt2axJk2wddqsjiMphrHCEa8fCrIMnahQ9oIovS1eCxQWjTYPta
 Pzrg==
X-Gm-Message-State: APjAAAXbZyB2RSYfn4jj86089Wae12t6EIhKetHRNWHvzA1+Z1n7tbPX
 yX+AxqjwS1Lkr1xqYDykEeo=
X-Received: by 2002:a17:902:ff0f:: with SMTP id
 f15mr747220plj.52.1573606336867; 
 Tue, 12 Nov 2019 16:52:16 -0800 (PST)
Received: from voyager.ozlabs.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i13sm169848pfo.39.2019.11.12.16.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:52:16 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/4] aspeed/scu: Fix W1C behavior
Date: Wed, 13 Nov 2019 11:21:59 +1030
Message-Id: <20191113005201.19005-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113005201.19005-1-joel@jms.id.au>
References: <20191113005201.19005-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tGEQjkYrevTS

This models the clock write one to clear registers, and fixes up some
incorrect behavior in all of the write to clear registers.

There was also a typo in one of the register definitions.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_scu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 717509bc5460..aac4645f8c3c 100644
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
@@ -532,11 +532,12 @@ static uint64_t aspeed_ast2600_scu_read(void *opaque, hwaddr offset,
     return s->regs[reg];
 }
 
-static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64_t data,
+static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64_t data64,
                                      unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
     int reg = TO_REG(offset);
+    uint32_t data = data64;
 
     if (reg >= ASPEED_AST2600_SCU_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -563,15 +564,19 @@ static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64_t data,
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
         /* W1C (Write 1 to clear) registers */
-        s->regs[reg] &= ~data;
+        s->regs[reg - 1] &= ~data;
         return;
 
     case AST2600_RNG_DATA:
-- 
2.24.0

