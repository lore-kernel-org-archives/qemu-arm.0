Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp575022wrp;
        Tue, 12 Feb 2019 02:52:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbzwL/URYHu9tHtQMVOAJUeIqs5sYO2ZDXQl/1Kz94brNRSgJLURUY3NNyDkf90Fks8MIXl
X-Received: by 2002:a0d:f642:: with SMTP id g63mr2304972ywf.412.1549968739418;
        Tue, 12 Feb 2019 02:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549968739; cv=none;
        d=google.com; s=arc-20160816;
        b=bCl3nyLIYyeAi68aBFIm3bNY6n1Y/Hl0Oi0Ist17RXtcXgqUTlTTnNuk3hQzXYL948
         WkXUYFArOaqo3PiI7fI08ECx3qv9LfEjWYIVqW1zxXFciax5a7KJW9MrqcyIJwhMiSBY
         yXZvELwS2NzdX73Mg/xtBBF2cwXEyfo7IxPXAz8AfN65hn8XVyH9NuOHqROeHwoljPYR
         BcwA9B8z56Abtm0CBBLBC3BhGr9eU/3uVvipe6iLGXfJE6rhMDwq2O1BS5AUpLSkhw56
         LAV/2mCU2VIGmhGn3yinmDmUIfElc8pgL0wYpICWSxoHYO1OUM/F/P9kKV5P1hW4erTB
         iEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=AOHCEzaG9WfBckXKUn2kLpZrQ8dSCiXc16/6UwtDWoA=;
        b=scxPFLdDqX4Q8yohE7KVXuBEWOLb8nqqVr7Mo1knVmto4msNX0IO5vAdN5tdIX0P1k
         /VqClRV6gmEVZ5gKT3ThlxezDc0h/GM+CDQ0CN7t7GtxXB7ZSgv8JMxQA+GG6cPS+fgj
         GC7vrG+MRwEAbIkbN/bNV5kGcCe6g33DOcgBfoKRe/UYBenFBejDL32s+S872sxWzLTM
         n1K7S4dTks9LXmiKAG0k/sMP0YO6eo/HuTUAki+pWzgNeFPWXJIm+/mfkwk10TsiZUeL
         D45OBtQxn+E+oFQ3FErD0rexvz6Mw87sYLzI2RkttTQsaa7qpb4SA/s2TOT0QHxTxyIJ
         Dfdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kjhrgo4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si3679597ybi.412.2019.02.12.02.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 02:52:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kjhrgo4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtVfm-0000bw-Ul
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 05:52:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtVfe-0000bb-IZ
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 05:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtVfc-0003qX-KE
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 05:52:10 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gtVfa-0003gx-Ly
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 05:52:07 -0500
Received: by mail-wr1-x443.google.com with SMTP id c8so2148272wrs.4
	for <qemu-arm@nongnu.org>; Tue, 12 Feb 2019 02:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AOHCEzaG9WfBckXKUn2kLpZrQ8dSCiXc16/6UwtDWoA=;
	b=kjhrgo4VswMtKt1JpfzWWWzkx1KVGoe6fbeygfEzubE1WzVwsbIlAY8NAJUxjqJAn6
	wn6Xx0O2YVt1r0oLzthgMGluILf4SZk4WZqoRvXCKw1TpWaokzUS4yRgwJEudUVd7Cm8
	mnaqHvszapzi6SfBO8hTpKUI+bCoEAdyeDzBWJS7/jnK7RqGWTCnDjTx6voJfMZlh4Sh
	c+RygfCdsGQ7Kr2oKWJm+roKqmTpcXL6nQixMpfp7gPzyEzLT8AUj8lUd9ivMA40l8Q3
	1bH38EWKYc/wNcxAn3RU7IORKE6gnYixb3lwGzJ3emeWLOAXNUuLfdovPKKXC75iJYBu
	6UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AOHCEzaG9WfBckXKUn2kLpZrQ8dSCiXc16/6UwtDWoA=;
	b=FTKA1edLJl+r5PeQKBORXsHHUq9osenbevJBE8XWzxgrqIE8ICdc8agxuQfkY0KQjz
	F3EbyIf4s79vG6m7ib/HQ/cUkD+skoGfyOnpMYs03oXUL1Ati4aW+AIaRfwPniOLNIIK
	c2jiypY555NBXewro0LLCZ6O2i0gG6egj3PM32TfTfxbV9H3d9TaG+HMkt6tzpsBSHdk
	VEsxzZGjdCoqp6hbJIyeQ8o4ILU+dw6kTcJD5/zWGRdEeTzzEqqQhKmSsQOKffzz8/jX
	w+RZj5Muv2xKaUkQWlFEfEwRH/Brx6CCQid6/vpfqFVaaUrvIQZmoUqABth9mQNs2mVx
	8GOA==
X-Gm-Message-State: AHQUAuYtyFGTQmuwnSVaRhyNus6Rmw0hUtyl40jsozDWZu9v4qaYVF+P
	0vJ5xh56DNogclRyxjBJZj66s7Lw6Xj12Q==
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr2360550wro.249.1549968723483; 
	Tue, 12 Feb 2019 02:52:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	90sm21262078wrk.95.2019.02.12.02.52.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 02:52:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Feb 2019 10:52:01 +0000
Message-Id: <20190212105201.13795-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH] hw/arm/armsse: Fix miswiring of expansion IRQs
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
X-TUID: KSbpcAZ/xrtf

In commit 91c1e9fcbd7548db368 where we added dual-CPU support to
the ARMSSE, we set up the wiring of the expansion IRQs via nested
loops: the outer loop on 'i' loops for each CPU, and the inner loop
on 'j' loops for each interrupt. Fix a typo which meant we were
wiring every expansion IRQ line to external IRQ 0 on CPU 0 and
to external IRQ 1 on CPU 1.

Fixes: 91c1e9fcbd7548db368 ("hw/arm/armsse: Support dual-CPU configuration")

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It turns out that the ARM-TFM image I was using to test that
I hadn't broken the mps2-an505 doesn't actually rely on any
interrupts from the external devices...

 hw/arm/armsse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 5d53071a5a0..9a8c49547db 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -565,7 +565,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         /* Connect EXP_IRQ/EXP_CPUn_IRQ GPIOs to the NVIC's lines 32 and up */
         s->exp_irqs[i] = g_new(qemu_irq, s->exp_numirq);
         for (j = 0; j < s->exp_numirq; j++) {
-            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, i + 32);
+            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, j + 32);
         }
         if (i == 0) {
             gpioname = g_strdup("EXP_IRQ");
-- 
2.20.1

