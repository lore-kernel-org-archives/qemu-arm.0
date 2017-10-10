Received: by 10.223.197.9 with SMTP id q9csp3706257wrf;
        Tue, 10 Oct 2017 08:56:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB2FY3lMG8XJ5d2mwHvh+3Rg9CEzGAA9vgJBPe3LKH/MpJ9iiF0yklGcSb8Rg44g9mf1Ct9
X-Received: by 10.200.41.148 with SMTP id 20mr18659624qts.69.1507650967993;
        Tue, 10 Oct 2017 08:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507650967; cv=none;
        d=google.com; s=arc-20160816;
        b=Yur+1NYUCHF8Ulk0m8pO/hHuukXN35u0xhd3DtI83p+1qhxr8yyFSIaq/z3GEyU2R+
         fKMGp8ImsqVVzmFdiCFZzfHc71Cvbvj9k9nr1G15xhz18lJGmcIQGiBMzos9NuJhAEjL
         ykeAW5QcYglZNxMQfBSOONBJZhYOUhkYj3qiymyCBROIuqQKvNvrGgxqlNmfw+e9vJKo
         gE72FRTUFAfkCqv80nWDUrgUZsRR37iu3d5f5A+82TKjizXcqLpjZ6uxyklqnRLz8ORV
         FxFYtXKcprvUd3JiZ4DthPfuKzbbYukM7L8eZ4hdQfXRfwnpv4Kpp95sBVMzHE8c2hov
         SD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=phcsxhWQPzFIZye2+yGJRp/GBT9+5pAr2y8jnKdAbek=;
        b=XM79+GyDbXFOMDGE1VlBi+mNil6RjXhM+THqY8cxytBPVMdnsNKjYJeEE3vQnGUrTj
         LV2kLbhWdNeCuuffpRHx9ZtEPDt+taH/GVF9/IZwKfbCLVrFvk9YsaZJj3iEFal1i5Nx
         T4Y4YvNcWVzIZD1NPr9xeO0tQlfBwj6gCKLmMbt6r18s/emnY7EAD5td5i2gmeBuQbF2
         uQy3XiuO3O7UuZs1uBd7OifrIkF6IFmfGY9KpYfjhzoSLRhLYmKb77ubRpXLIjYKEMx8
         NbmXgzMFTpk6mHjU3DZlPIp6Q9WF6JI3FyT5sgL1Ufrz8akFAkohR6ktNEh2AiIf7beD
         6Ytg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si145523qkb.293.2017.10.10.08.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 08:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1wt3-0002RJ-RO
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 11:56:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1wrX-0001PK-1T
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 11:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1wrR-0000Yd-LT
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 11:54:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1wrP-0000Vy-3w; Tue, 10 Oct 2017 11:54:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1wrG-0005wO-9i; Tue, 10 Oct 2017 16:54:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Oct 2017 16:54:16 +0100
Message-Id: <1507650856-11718-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] nvic: Fix miscalculation of offsets into ITNS
 array
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xy3BpQDfT2TK

This calculation of the first exception vector in
the ITNS<n> register being accessed:
        int startvec = 32 * (offset - 0x380) + NVIC_FIRST_IRQ;

is incorrect, because offset is in bytes, so we only want
to multiply by 8.

Spotted by Coverity (CID 1381484, CID 1381488), though it is
not correct that it actually overflows the buffer, because
we have a 'startvec + i < s->num_irq' guard.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Oops. I guess this is what Coverity is there to catch :-)

 hw/intc/armv7m_nvic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 22d5e6e..201e90f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -698,7 +698,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         return ((s->num_irq - NVIC_FIRST_IRQ) / 32) - 1;
     case 0x380 ... 0x3bf: /* NVIC_ITNS<n> */
     {
-        int startvec = 32 * (offset - 0x380) + NVIC_FIRST_IRQ;
+        int startvec = 8 * (offset - 0x380) + NVIC_FIRST_IRQ;
         int i;
 
         if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
@@ -1102,7 +1102,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
     switch (offset) {
     case 0x380 ... 0x3bf: /* NVIC_ITNS<n> */
     {
-        int startvec = 32 * (offset - 0x380) + NVIC_FIRST_IRQ;
+        int startvec = 8 * (offset - 0x380) + NVIC_FIRST_IRQ;
         int i;
 
         if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
-- 
2.7.4

