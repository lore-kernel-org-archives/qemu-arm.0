Received: by 10.28.71.27 with SMTP id u27csp2342296wma;
        Mon, 5 Feb 2018 02:58:28 -0800 (PST)
X-Google-Smtp-Source: AH8x226N9sog9kkxFXignzhZ2pic5KykRxuS1ti5yW9h+TbxDqtokYYeBHgWErpc/hBjoLX1u33f
X-Received: by 10.129.199.71 with SMTP id i7mr30827072ywl.332.1517828308026;
        Mon, 05 Feb 2018 02:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828308; cv=none;
        d=google.com; s=arc-20160816;
        b=RmOb+pWscCrr14sUqI4vc/sikDuj3/f24sRGlQyfJISAJe7bssDaK23HdeO01mk+zG
         /n5miado1czFSN1b9VZCHfKeI6JW6FSLn5ugLJLdP80RcfFM6Hr2PLLvZAEH0oBdVfiJ
         FAnRTFaq/Qz8tWLLWJUfRKq6zv0r0j2wRlD+SRqhmGOc9T+FarYoolVAfCD7NLxxVisd
         cKWmnbQeCg+5E4K5i7zJnAIxmJrlXQ1AJWNJlBdAPDu0SUMg7JG00+7N+ou3EcpYR71i
         E1sbo3H8UKLM/nJ1CRJ4QDcvMSNZHbplgUA2jno1nSnjdbAkdmwsQX1Tvp9tza/c/omT
         HDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=FUh6YGRZJt0fIcLf6srobD9JR+wnm0STumkuBDvc77g=;
        b=TQmuV0f2KvY+RcWjQfnDEJ8uaXU98ij14zhjs9kRgEZ6bcNUPx9A0iVd7EH4+q5sin
         aKwGW7zkvzfVEPJI1m8jxvI6d4E/NHM2E1sOHjIDgSojFYWePaK/8mDx0YSS1KjfvRCp
         M7wcFCLbQ2eKTEPNfm90JGglskY73JM85A0GTBkQniUL1Akw5rOjaEnzCR3UZRfDuHCm
         oFZ0siSKyDXYzMQHEcBDnoCJKSaal3o8Ywgrn1bL63igilhcR648K7ca1ctEtG6p4A0i
         uvL08noVgB/KD+lhXvuxT6sFKdBg2vpRVK/AcjSSernztZWRg95rOEHYehd5XH2wYgGw
         eGWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186si1409801ybi.437.2018.02.05.02.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:58:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieTj-0006cN-DN
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:58:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSw-00065s-Du
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSv-0007FH-O0
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:38 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSv-00076t-HE; Mon, 05 Feb 2018 05:57:37 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSh-0004Eg-GZ; Mon, 05 Feb 2018 10:57:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:14 +0000
Message-Id: <20180205105720.14620-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/8] hw/intc/armv7m_nvic: Fix ICSR PENDNMISET/CLR
 handling
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
X-TUID: ZLpcTWFHX7St

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

