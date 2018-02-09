Received: by 10.28.71.27 with SMTP id u27csp1165657wma;
        Fri, 9 Feb 2018 09:03:55 -0800 (PST)
X-Google-Smtp-Source: AH8x224Hh/sjZ4rOQZNV2uLwx1wAAGAQhHdseHPL1mXnlm1rLM/u3ZJKCltdnG4vFbBIt2G1dcDe
X-Received: by 10.37.186.72 with SMTP id z8mr2255020ybj.33.1518195835460;
        Fri, 09 Feb 2018 09:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195835; cv=none;
        d=google.com; s=arc-20160816;
        b=MoUs6PP/GtdBwfxvyVNaX8mewN4fZBHhzorv1IGEXszkNStRSwJ8+gVFHLa/dUfXx8
         KAQ9iBKHUqvK6arE+5RLmf3uz6jL3hG78d0CRvwHkwUYuTWBSfXEJeSZtBKFevrfpoFR
         4l+KoTMUiv45hQ/hcibFQMssO8Nt7U1AZrpdfG1BK3Txm8WT/T+oO+i3iqg2WgY1Si6K
         umUQUdzGlbrzaA2uMEVHNrdgAzw4QZSXKREM1pp+4inNzQx5dye0LusbeSc74e3MQcdC
         iNYBa1fZSyRbfvK+lahHNb7TvFOKeZEkLBTxRkrOL3HLmiS0+2zvSIwuXU952fJn6BLk
         kr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fW+o3X2yhpfLWKA90r3Rw7yTLrwIWhhLNnYdCwyW9kw=;
        b=xM6lm4unCYi7znq59sfwKxaKgKQ6JVE1Wot2jm5Kivvb1829tk7zZv5/H6X9cCZPZR
         TvQy4bdztvNPqW9kzsrtiKAne8bi6xbszQeKujOfcb4mXh9DXEhcMR1kCIy4cs7xcU5V
         fOpZsgiWNOBQ7s/dCaoJQ4XKmJDWcNxnH2b5GzXdx3+ti2DhZqeCAHqElYWnU6HfvOHc
         WBwtNzhoghrEDwjUrfoAc+MuqeMzVfOIe2IgUtQrz/kxG7Yf0nbNahBpptUUoc8XKFP9
         unNKot9hd1hq3gZE3XoWsw4rz8KZH9EeyqChtNU2/XbDj/jB2KqlJh6XPtLEfvfSyr8h
         pwwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h26si471339ywk.503.2018.02.09.09.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:03:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC5a-00084O-Sl
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:03:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0E-0003yY-7n
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0D-0007qe-24
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:22 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC0C-0007fy-J3; Fri, 09 Feb 2018 11:58:20 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC0A-00031D-RR; Fri, 09 Feb 2018 16:58:18 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:07 +0000
Message-Id: <20180209165810.6668-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 08/11] hw/intc/armv7m_nvic: Fix
 byte-to-interrupt number conversions
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
X-TUID: vIL2B77Mp1BN

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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/armv7m_nvic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index ea3b7cce14..c51151fa8a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1724,7 +1724,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
         /* fall through */
     case 0x180 ... 0x1bf: /* NVIC Clear enable */
         val = 0;
-        startvec = offset - 0x180 + NVIC_FIRST_IRQ; /* vector # */
+        startvec = 8 * (offset - 0x180) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
             if (s->vectors[startvec + i].enabled &&
@@ -1738,7 +1738,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
         /* fall through */
     case 0x280 ... 0x2bf: /* NVIC Clear pend */
         val = 0;
-        startvec = offset - 0x280 + NVIC_FIRST_IRQ; /* vector # */
+        startvec = 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector # */
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
             if (s->vectors[startvec + i].pending &&
                 (attrs.secure || s->itns[startvec + i])) {
@@ -1748,7 +1748,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
         break;
     case 0x300 ... 0x33f: /* NVIC Active */
         val = 0;
-        startvec = offset - 0x300 + NVIC_FIRST_IRQ; /* vector # */
+        startvec = 8 * (offset - 0x300) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
             if (s->vectors[startvec + i].active &&
@@ -1863,7 +1863,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
     case 0x300 ... 0x33f: /* NVIC Active */
         return MEMTX_OK; /* R/O */
     case 0x400 ... 0x5ef: /* NVIC Priority */
-        startvec = 8 * (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
+        startvec = (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0; i < size && startvec + i < s->num_irq; i++) {
             if (attrs.secure || s->itns[startvec + i]) {
-- 
2.16.1

