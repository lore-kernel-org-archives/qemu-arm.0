Received: by 10.28.71.27 with SMTP id u27csp1158978wma;
        Fri, 9 Feb 2018 08:58:57 -0800 (PST)
X-Google-Smtp-Source: AH8x224wmOZxmpYXuUDGmA4qOVP2R0mPOqtbumHjjHYVjn1XpxCYUqlWhzJNN4dJ6FdYcIK15b3C
X-Received: by 10.13.210.69 with SMTP id u66mr2422965ywd.183.1518195537312;
        Fri, 09 Feb 2018 08:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195537; cv=none;
        d=google.com; s=arc-20160816;
        b=HbRaFhC7joA+5yuZOaAA4M4xC9opbbxQDvrNmQczL+y1C0MIgXp9V9Bi1Nvoo79GR9
         0Kr5hEvp29N+1OncXHqymryH60iMJ3OOJnZRd5JrEP6nogs+38aB4sYVBwFeKqSkNFdc
         QtziYLyZGMCSH/wcEURW8LdNZfO5C+PsVaFgB9Y2v+25r2HSuODNmM7uuvrK20B7UGxm
         91mrkXyKHgVZb/CLEetFoM++o4YzQcyIkgeFIG1QuLPymIMtdjD7j8qte7wdtfKPUI3S
         Y6LEm0s/GbqSRXb4/bOkVbGQ7nt+kg5nNeYwi9Sb6dFtACn0/uZOR/LRf4InyeBevAVD
         9OxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=FUh6YGRZJt0fIcLf6srobD9JR+wnm0STumkuBDvc77g=;
        b=Z1TgbUqp5R/yjfo8Hee+L3oX8yP2YpOx0T5r4lG4bHF6vYOa88OWXCUAGwLlITxmcX
         0XlogXR384fxcQU7y1F2tse6+BbH81EGeB/0RGQJKKYgCfGCtudR4exHmGbl70FyjfJT
         aL0RNk0tk9eF14ocwggh2Qi3k2NoVZIOjzM+fMqdn+WfRM1AlV+vh+fRAVEqf2IvIz77
         ziyG9l1z4avnFfmB+saqqXXYGm8tnI94sYM9AyBbktYyK5j4RdIMOMRNs01lr4rxe1bS
         RugW4ani4LZ2ExvNc4miIIRdm4LZ5+ODEZ8pBO4y9dtHvsNYkDqsEBIQF/0oH87KW3HD
         GBDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z13si469096ybm.30.2018.02.09.08.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 08:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC0m-0004JY-LB
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 11:58:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0B-0003vQ-1G
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC09-0007kr-Vj
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:19 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC09-0007fy-OE; Fri, 09 Feb 2018 11:58:17 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC05-0002zZ-El; Fri, 09 Feb 2018 16:58:13 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:01 +0000
Message-Id: <20180209165810.6668-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 02/11] hw/intc/armv7m_nvic: Fix ICSR
 PENDNMISET/CLR handling
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A/BpHnqWP6KY

The PENDNMISET/CLR bits in the ICSR should be RAZ/WI from
NonSecure state if the AIRCR.BFHFNMINS bit is zero. We had
misimplemented this as making the bits RAZ/WI from both
Secure and NonSecure states. Fix this bug by checking
attrs.secure so that Secure code can pend and unpend NMIs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 63da0fee34..06b9598fbe 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -830,8 +830,8 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             }
         }
         /* NMIPENDSET */
-        if ((cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) &&
-            s->vectors[ARMV7M_EXCP_NMI].pending) {
+        if ((attrs.secure || (cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK))
+            && s->vectors[ARMV7M_EXCP_NMI].pending) {
             val |= (1 << 31);
         }
         /* ISRPREEMPT: RES0 when halting debug not implemented */
@@ -1193,7 +1193,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         break;
     }
     case 0xd04: /* Interrupt Control State (ICSR) */
-        if (cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
+        if (attrs.secure || cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
             if (value & (1 << 31)) {
                 armv7m_nvic_set_pending(s, ARMV7M_EXCP_NMI, false);
             } else if (value & (1 << 30) &&
-- 
2.16.1

