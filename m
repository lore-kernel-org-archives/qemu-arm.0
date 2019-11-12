Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2308502wrr;
        Mon, 11 Nov 2019 22:41:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxduiaaLdOZFmCktYwIhzR2qS13F/uBjyriGsQBqSnXOOwrFtn0tpolfwnVLEqtFebHwfiv
X-Received: by 2002:a17:906:1354:: with SMTP id x20mr27238073ejb.131.1573540912199;
        Mon, 11 Nov 2019 22:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573540912; cv=none;
        d=google.com; s=arc-20160816;
        b=LvM1Kyz+ps7ze3DZF+OYdwSTCoC+tgFg0OHDAyamPcLC/1WtvzXcva8V78K5nFPAjH
         BNU4F4LRswC7B8k95o3dXWGQ+UHkBICWcw1DrdEz8y6ibPgQdBeFEdY7qQKLovAn5aQn
         C5WqDWC4qbDP3P29DKumnBjOf7C7eP/8D3I4FVUKj5di2CCchbbxOwivA/NO3WaffiJc
         zCtp0AfnaQBmwI+qkeo6nW7dzj1bltBbb5JGibsa9U6D9mHbTqcH/zph0QDPOi/UgWYL
         4bT3hmYcPk62lQ/wAleLE/h2PIJW4dclMj0trn8qSoo+vZ49dsjrj6e4K59gt5j0ihwf
         pZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hyG32yXenzdMQwklj1Cf+goAGOB3P8VjL1+e16W2tTQ=;
        b=qZ9iRT8/kA0EwTsCbnvNg72TnYEvk8AHOrBVchGXPGK/epOVoFXq5ETCX3KjInkzjf
         n+OwvdRXgcncxXlKFY4ZkUNeHcGfCBmnvXCa2uXy8TMHZMsa2Mv64fYnwidlb6uAIbmf
         X1S4fwbF2Olb6xAVYMhVRytbxeqUMIVnC1/T31QvnH5S3TnyrJ+jo5zbPISsru0PYpOV
         eu3WLWyq3QZj+VhpBJDw3QK1HE4JjDCHPqainK8oK1rSBQsD87sIC/wWHMBjxvQqOoYY
         d+wEoTRjBZOazqlMOOjuQ5ujg+zyS5v0RmmiUvOE7UveaW1IpeerEts6n47N6tvzYEv2
         fzvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T25XHkQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si13414767edf.71.2019.11.11.22.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 22:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T25XHkQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUPs7-0003L1-2f
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 01:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrW-0003Jl-6g
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrV-0007Mp-6Y
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:14 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUPrV-0007MQ-0u; Tue, 12 Nov 2019 01:41:13 -0500
Received: by mail-pl1-x642.google.com with SMTP id j12so8930771plt.9;
 Mon, 11 Nov 2019 22:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyG32yXenzdMQwklj1Cf+goAGOB3P8VjL1+e16W2tTQ=;
 b=T25XHkQuMFS//SzEMcFFkzcPzeHMHwW+FKXOVP+xN0WKIFl8gO9B6p6hXKp+67ICUX
 R6v40fhNnvTS3addm2IwaiHazkqNHvD21omuB18oDhF+4oX2C3qudc1F6Qw4BCT75yTE
 tDHyLao8IRlCTproIzoc+VvOSclCnnNZyhXk9CwaVxezkMoZToeFUxxUg5fEwcZHpEO1
 54GytjunDddPrvyDYnu/oLaRj8g9v0XJ3riXrSiu8oH+peyHu4R0S4dTIwzyyZsYh9Rn
 RDYdFwGlTQDC7hbmwFzbZbpMZOoORjL2GZOdklUfdmNqBqCgXjKtXytzUWS99mw4aXCI
 Ga2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hyG32yXenzdMQwklj1Cf+goAGOB3P8VjL1+e16W2tTQ=;
 b=OGJArxSJPVoQyfXi5Tk4/zg87P5cZ/EBPFV1549FSusrpRH0ltFiXOxuB0olJTxKxA
 wKwjKbqlMbBwqTwQgqmsDktx2xg7o42d9SXDqUzqbZ6vr91JX2ofj072NZ4NPuSrH8mH
 MDmdaYCou12o4GAhQj+Py8tyMlpPXGu2gHXazG0ehSmlaGPhl8UQdCfcys/5RHj7GZ03
 nLYf3PwSExdfaO+eUZTESsQOJB+LSlfZJ1k7xb1/xqPn7GqhUp8QnOYfmfA840mmHL3g
 2tohzKUwoQlUGEIDn+w++cAh7/cfsL+Ub009PWBQLBMVfM7UbeI21kx2yBmsIBIKYUuu
 8SYA==
X-Gm-Message-State: APjAAAU2mdOcUiP+spkzwr2M98Aa42gcD05tHYhZWA2HF591ctitxWQu
 IBExbBDqUqnU4IXyP3lnvthsquSNmHg=
X-Received: by 2002:a17:902:8208:: with SMTP id
 x8mr30463850pln.6.1573540871933; 
 Mon, 11 Nov 2019 22:41:11 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id q8sm16375590pgg.15.2019.11.11.22.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:41:11 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/4] aspeed/scu: Fix W1C behavior
Date: Tue, 12 Nov 2019 17:10:56 +1030
Message-Id: <20191112064058.13275-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112064058.13275-1-joel@jms.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 231CZcJpfJLJ

This models the clock write one to clear registers, and fixes up some
incorrect behavior in all of the write to clear registers.

There was also a typo in one of the register definitions.

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

