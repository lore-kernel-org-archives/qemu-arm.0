Received: by 10.223.172.38 with SMTP id v35csp7470581wrc;
        Tue, 12 Sep 2017 11:19:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDSgYziYJIjYlnAOzmmTC/Jx3pXCYOKMR8wB5sgiBlcjp9RX0OJVb8iHE2a/ERGIVtmI+0r
X-Received: by 10.200.26.52 with SMTP id v49mr14308855qtj.155.1505240348167;
        Tue, 12 Sep 2017 11:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240348; cv=none;
        d=google.com; s=arc-20160816;
        b=t8Zk7Vsk2W4GkBdDNNFsZf+Bbm0aGgraNPkhAOXqx20UxPXQSa9pynwRod7J/zbCK3
         ECZ3kKdhaxUYj4nty9FIHFt891uOG1S3//w6thiqS/j1pxJgpEYunxoZqyloR08KRcdE
         xF1pklqD1exMIKYjvtn2MLCVxZyxuyMFuoAWoL0sp5jQQf3ENe61sOx3DX8qW2S/V9lp
         CjZa18ByTtUHgEd2wdJ/mHheEQCrA3I8S2/5BuZyjPOJ0ifOnmCdmi8KEfd+5TCu0uMw
         rgD+pLslxSSIssmNLSFtnF/Tc2I9JKLSIfHt1xQ/XyuKXX1IBwn8Y8TrskYphBIRqsA/
         erYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1HELrp4XudSVWHWja2ay6iZ9jVuM5OnXb4hNo6vMgOI=;
        b=s1Zy+UEPSZCESUaqoIvIfz3/hFvAQ0C+SeChBxtOuiPaoLKQLU18g86vBhl/qjLqy4
         m5zKuhC9hcx5SR54myCdBw6NKUbA9hvQFHCjCY8cPd6yODfi8BgQDc1VYlDgnqQGSgV9
         wAXJ179tYdMtQcXpx7avtZVjZII4Wdrs8zdLasljJ0/hGz4FP0MJtuRVQFaZMXmSOQdw
         SvMk89OAm6b+Y2cw4S1SRSCuNFlRPKynpAsvJ15eQ6zA7qvvNNt7Zyd95S+nRyMyscJb
         aKNYGa1zVmiQ6DmHcT8OsiBg1cj5bpiGNBuaY2vAwhmoL2shioUdMzSKmKya+2iEWZUp
         A+CA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s28si13094675qth.411.2017.09.12.11.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpm5-0007rm-Pp
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:19:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph4-0003UT-EM
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 14:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph2-0006Sc-Lh
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 14:13:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drph0-0006QF-2W; Tue, 12 Sep 2017 14:13:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgz-00019A-1C; Tue, 12 Sep 2017 19:13:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:14:01 +0100
Message-Id: <1505240046-11454-15-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 14/19] nvic: Disable the non-secure HardFault
 if AIRCR.BFHFNMINS is clear
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KtERGz6Yw2L8

If AIRCR.BFHFNMINS is clear, then although NonSecure HardFault
can still be pended via SHCSR.HARDFAULTPENDED it mustn't actually
preempt execution. The simple way to achieve this is to clear the
enable bit for it, since the enable bit isn't guest visible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index db2f170..91d2f33 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -937,11 +937,16 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                     (R_V7M_AIRCR_SYSRESETREQS_MASK |
                      R_V7M_AIRCR_BFHFNMINS_MASK |
                      R_V7M_AIRCR_PRIS_MASK);
-                /* BFHFNMINS changes the priority of Secure HardFault */
+                /* BFHFNMINS changes the priority of Secure HardFault, and
+                 * allows a pending Non-secure HardFault to preempt (which
+                 * we implement by marking it enabled).
+                 */
                 if (cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
                     s->sec_vectors[ARMV7M_EXCP_HARD].prio = -3;
+                    s->vectors[ARMV7M_EXCP_HARD].enabled = 1;
                 } else {
                     s->sec_vectors[ARMV7M_EXCP_HARD].prio = -1;
+                    s->vectors[ARMV7M_EXCP_HARD].enabled = 0;
                 }
             }
             nvic_irq_update(s);
@@ -1562,7 +1567,6 @@ static void armv7m_nvic_reset(DeviceState *dev)
     NVICState *s = NVIC(dev);
 
     s->vectors[ARMV7M_EXCP_NMI].enabled = 1;
-    s->vectors[ARMV7M_EXCP_HARD].enabled = 1;
     /* MEM, BUS, and USAGE are enabled through
      * the System Handler Control register
      */
@@ -1584,6 +1588,10 @@ static void armv7m_nvic_reset(DeviceState *dev)
 
         /* AIRCR.BFHFNMINS resets to 0 so Secure HF is priority -1 (R_CMTC) */
         s->sec_vectors[ARMV7M_EXCP_HARD].prio = -1;
+        /* If AIRCR.BFHFNMINS is 0 then NS HF is (effectively) disabled */
+        s->vectors[ARMV7M_EXCP_HARD].enabled = 0;
+    } else {
+        s->vectors[ARMV7M_EXCP_HARD].enabled = 1;
     }
 
     /* Strictly speaking the reset handler should be enabled.
-- 
2.7.4

