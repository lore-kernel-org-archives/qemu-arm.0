Received: by 10.28.71.27 with SMTP id u27csp2341920wma;
        Mon, 5 Feb 2018 02:57:59 -0800 (PST)
X-Google-Smtp-Source: AH8x226jLP4/81xMlJoGfrhF6luCfF5J99lehoN123npihrZRcVSqZ/iguSSD4s2sQt9Ou/uS0ur
X-Received: by 10.129.99.4 with SMTP id x4mr31078772ywb.493.1517828278984;
        Mon, 05 Feb 2018 02:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828278; cv=none;
        d=google.com; s=arc-20160816;
        b=oGTAwoX/FI99j2kZiZsig212v4yQ7cstKx6adNh9mLW+xqrpK8DFTwJjVxCL7OtAJl
         VITPpO2GoTghE9rmrItEkECdI7v2cN+XpBfSII4DxW44SznX/REw/O50ezq8SR1apdco
         ISgVdg98XS0ru6rS6WbSgoQP8ESEtvt5dnkWPWF7UiXe+aILkIKk8Usk7TBCqusJf6/+
         NHkJmI/+O4DeknDe24TTQkvjgUDv0Gu4WPqbILUr6nv5Sq+bFsau4NzER1mxlio2++LE
         wEqURBTr/hgxPPQS4aaL5MFs3mFQoMMD1y86pRW6CJSMuzVEtihMWRKf1LqOJnOMipXN
         hPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nJX7xxzAAsqCDvuWW36gZwfMrwCmRJAF00tXRJ43hF4=;
        b=IyV47IofifJynGKRf1E8MvlodC4QHngTG/jf05Ql4qjTMaQ4b9jXB2FbKVvZSHPdqL
         kR5xARnmB4bBEF3Edutyuf2d0fVM1+4nSs1AH8gvNop4DJyZpyWesmXKCBaTmg/hgyOk
         a7P9W8N4ZvkUxGWT9oFe9sEl16bCOXTwWrBGG79AYzXnUDZHF3LaKv4Tv5LyXHYxpM8Y
         5m1jsu34mxQ+dfWbi+0ZIwgu+z7+OVcJpXFJaNf/05UdcPLwC7DCRLmhf5RMIWz3kRIW
         2AQB3iNTFjtEBIux5QtiM3iaCUb8w+l65qvY8ItFMGAyNjf2koT+UL/nMTtulJSbeDFj
         /cZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u73si1417857ywu.224.2018.02.05.02.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:57:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieTG-0006DT-DM
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:57:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSq-00061j-Ny
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSp-0007Am-R0
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:32 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSp-00076t-KK; Mon, 05 Feb 2018 05:57:31 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSm-0004G8-4y; Mon, 05 Feb 2018 10:57:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:20 +0000
Message-Id: <20180205105720.14620-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 8/8] hw/intc/armv7m_nvic: Fix byte-to-interrupt
 number conversions
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
X-TUID: SxCGN6B2D/t2

In many of the NVIC registers relating to interrupts, we
have to convert from a byte offset within a register set
into the number of the first interrupt which is affected.
We were getting this wrong for:
 * reads of NVIC_ISPR<n>, NVIC_ISER<n>, NVIC_ICPR<n>, NVIC_ICER<n>,
   NVIC_IABR<n> -- in all these cases we were missing the "* 8"
   needed to convert from the byte offset to the interrupt number
   (since all these registers use one bit per interrupt)
 * writes of NVIC_IPR<n> had the opposite problem of a spurious
   "* 8" (since these registers use one byte per interrupt)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 8726be796e..9433efd1b8 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1721,7 +1721,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
         /* fall through */
     case 0x180 ... 0x1bf: /* NVIC Clear enable */
         val = 0;
-        startvec = offset - 0x180 + NVIC_FIRST_IRQ; /* vector # */
+        startvec = 8 * (offset - 0x180) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
             if (s->vectors[startvec + i].enabled &&
@@ -1735,7 +1735,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
         /* fall through */
     case 0x280 ... 0x2bf: /* NVIC Clear pend */
         val = 0;
-        startvec = offset - 0x280 + NVIC_FIRST_IRQ; /* vector # */
+        startvec = 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector # */
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
             if (s->vectors[startvec + i].pending &&
                 (attrs.secure || s->itns[startvec + i])) {
@@ -1745,7 +1745,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
         break;
     case 0x300 ... 0x33f: /* NVIC Active */
         val = 0;
-        startvec = offset - 0x300 + NVIC_FIRST_IRQ; /* vector # */
+        startvec = 8 * (offset - 0x300) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
             if (s->vectors[startvec + i].active &&
@@ -1860,7 +1860,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
     case 0x300 ... 0x33f: /* NVIC Active */
         return MEMTX_OK; /* R/O */
     case 0x400 ... 0x5ef: /* NVIC Priority */
-        startvec = 8 * (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
+        startvec = (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0; i < size && startvec + i < s->num_irq; i++) {
             if (attrs.secure || s->itns[startvec + i]) {
-- 
2.16.1

