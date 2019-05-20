Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp381516wrg;
        Mon, 20 May 2019 09:36:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywLpBQi2rakAhkpBS7UjLN2zGxkKoASUYrxTEv7nJH77m3RCsUx8za9R1QLv789erzCnpr
X-Received: by 2002:a05:6402:1696:: with SMTP id a22mr78470839edv.219.1558370206296;
        Mon, 20 May 2019 09:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558370206; cv=none;
        d=google.com; s=arc-20160816;
        b=YevbiddsgdnsKbPraV/Bq13pv8VGIXVe8/Si/e5ozqUDR/270MgU8HUzSgU3BZ/mu9
         QTy4LzFn9pxAnG8/WD0AOHZH/Dc3GEAPV1g2SgY6jqWc2bcMS3DqFjjzHTXDd3/RU/4+
         EW7t4B/OOlemgt6bA3rq4+6szrUKy+jcSAC71wtkGdjRnkrFSUJit5fIZz+sl4rwUL0i
         o5v3Q47qjAt8zrm4LVbuhq+V4mYvNPyPDlCuGJCc85uByykqLbrEW7elsbu392zgetxT
         XsuijT3QAYmnjcun2lPmVcM8WDJfwCDM2Xa2qI10Of2lK1qQ7TziniEaVnO1DmUQkdcH
         cfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TQvN/mWAlK741QKpEKQhjF7DDPH0rKnlVOvBsAJinxg=;
        b=Qe/8VIAcw/iCp0J+IFuiulfifHnp9qRukC1C0hq6WcTQSn5ZBYuF3I4metdqTtoudR
         qe84XKpSoNONFSQFeq1rAm8Y3rpmyINLvGOSRYP6+A+IO31Po6PrTWU411iPFFAMTKSJ
         MlCRq7iKKx17+EWunDkm5AdkdgaQCfLFYeLTZk603+aMdPf3wOvUH3Co67JbkGIB4+iW
         cQQQcU7p1pdfqsXnQvBOF2SDwr/U0V1Fm+RzTsSssig1vPtMBd5Ynu7XjqviWxlFVJgA
         73/Q1z516o6HRRoC7Ze4olblXy2lg3r+2oIOv5d8xv64YiZEF9ft8/De8bsNVt3ZC44A
         xa+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eE858BT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si3784339edu.283.2019.05.20.09.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 09:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eE858BT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSlHJ-0000lK-9J
	for alex.bennee@linaro.org; Mon, 20 May 2019 12:36:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl9B-00031X-KJ
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl98-0001Fn-26
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:19 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55846)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hSl95-0001Er-Tx
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:17 -0400
Received: by mail-wm1-x341.google.com with SMTP id x64so13935436wmb.5
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 09:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TQvN/mWAlK741QKpEKQhjF7DDPH0rKnlVOvBsAJinxg=;
	b=eE858BT9oM4qVPLyFxNriaIXSVdrnnIC54UhLvK6faBWTZWEzMUoFiT/poR81eWyS1
	2qpzy4F0kw0P5T8vl+FniHqUywhjV10HmSXj9XdOJUKPWzOjCVbrcDUQmcBAjPvDNA1D
	5SkSTki1k3qBeIxZORGAF5d9j6zOnjdjXyPx4KEzvkBDu+Q5UfnjqYz+Dyk2MjMDP7vw
	tBCEZKgyvS9yEML1uWVG7ANz9kbAYl2dLKepWkwqVrBtAPL5aqI3pwDfIkZEf9Wktr0a
	bvgna8UcEnrj4vzicr7S5pIEuwsqdLcbDCQCwMt7o0XbHRQBR13+KAE92GowwTFK2EpD
	N8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TQvN/mWAlK741QKpEKQhjF7DDPH0rKnlVOvBsAJinxg=;
	b=A53jk/WRbPHCoya/8S66P5yeogBpkEalq2276CHQjggg4QKkaoMWJpXi0c6ynTdwJ2
	cJqnKz6qxm4p+Tz1/YMoQI+JaSTB5bISiSPq3fF0aNFU4+miEN74yWJr9WpstxZ0wkLS
	ol9KvYcEs80lO4tG2VTRRpN5ZxUp5hdJ8GxnBN/QTl7S0cV6/KKZWI7bbpNLj9CyDPVd
	DNaoQTEkdYurPkeg79gYF5CzqsOIHzTF6O8k4n6BTD4GdczE/cytAdY7mes3v7kayYMx
	691/nrJ8rsasb8esQWnhO0rUxpKSBSHbbf8Rq6m1kbJBck8gtreLKnrWrb74YPhtUCKt
	r2Kg==
X-Gm-Message-State: APjAAAVMgE5RPUEFgmlpuynDJmzZCgBV9qI/UKUbVGlVof8Q5wdZSoSV
	IU94I8+1IpGpdvzIempNQgDUFaQPqvg=
X-Received: by 2002:a7b:c549:: with SMTP id j9mr4712wmk.114.1558369694777;
	Mon, 20 May 2019 09:28:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id x2sm5830394wrs.39.2019.05.20.09.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 09:28:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 May 2019 17:28:07 +0100
Message-Id: <20190520162809.2677-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520162809.2677-1-peter.maydell@linaro.org>
References: <20190520162809.2677-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 2/4] hw/intc/arm_gicv3: GICD_TYPER.SecurityExtn
 is RAZ if GICD_CTLR.DS == 1
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8gUZ1fO4yrvU

The GICv3 specification says that the GICD_TYPER.SecurityExtn bit
is RAZ if GICD_CTLR.DS is 1. We were incorrectly making it RAZ
if the security extension is unsupported. "Security extension
unsupported" always implies GICD_CTLR.DS == 1, but the guest can
also set DS on a GIC which does support the security extension.
Fix the condition to correctly check the GICD_CTLR.DS bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 335386ff3ac..d6ae576110d 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -378,8 +378,14 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          * ITLinesNumber == (num external irqs / 32) - 1
          */
         int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
+        /*
+         * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
+         * "security extensions not supported" always implies DS == 1,
+         * so we only need to check the DS bit.
+         */
+        bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
-        *data = (1 << 25) | (1 << 24) | (s->security_extn << 10) |
+        *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
             (0xf << 19) | itlinesnumber;
         return MEMTX_OK;
     }
-- 
2.20.1

