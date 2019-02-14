Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp956752wrp;
        Thu, 14 Feb 2019 05:08:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYVZ+XmmpQh2y058+7JEXsNB112ecahO5cMbQLLat3RCd3+BBInjvFCmITSn6Nqi11Qh/6W
X-Received: by 2002:a81:2e96:: with SMTP id u144mr2887271ywu.333.1550149686829;
        Thu, 14 Feb 2019 05:08:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149686; cv=none;
        d=google.com; s=arc-20160816;
        b=nvMYaL5NGm2rQoeGxRZsviE0GOS2UpJdw8K0wOpuPgfVskwjvhEy2/tqvSW+kpNS5q
         ZWAOCusNdw2+9ijUk8ak2NPHdVEoEmR1lgi+0hXvFziLVlW4X2GhzEGTyLIhji+vCJ0f
         LgPjuNkk257aj1Gb4Z9JPTL1/VxmTmS/S7ANUMF7PrUl7aJUAUu8FVZndK8Zp1JTuSAr
         Ft7eLN0eeGZS+lF3LSSD9ecWOV7lQ0RKwehA/wiNJMAsBvJMAw0ECZsxoHDnIAAf3NUe
         MKUaXnuPXuui+Tek1zclcIg8+zybtXsEXTijmMib5Xc13+Zh5o97kZibbIngVosBG/oW
         MgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=xO0SmjJi87cMCHBDYE6Aqyprx2bqu1BuqChTWfqFWYg=;
        b=W0ZhVQwjHacDyyoXDFi58f9oSKDMeO7hRnbNSytjr9p6CdH9SsdviFzdthCbi2i4Pt
         X3o+N43XNC4TmVtZF5+vUdrenHQPBqH0Q0hZAMKq/lb3xqdfzuBaItJ57sMus7rpREHh
         +AGdR0YgnU75Gp7Alrk8E0ZbE56XrLBWFuNeGSI1rCnCFIVKCyG4SW6md/RZXgaKzSBN
         65vd40A3p3Fz6eAT9U4NwX31A0rXLwUehzvh+1jfzXNxc5BY51iBgo4ERr5BGXkC+B43
         sYM73TFMEiVXY8ufxQHaVO3uefpSBEp/dOeDSZ0xd90MDVU8P7tyI/H69S06OGSh2D4W
         jPWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jODasDd2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x204si1383045ywb.236.2019.02.14.05.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:08:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jODasDd2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGkI-0007EJ-4i
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:08:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeW-0002tY-E1
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:02:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGTv-0006Pi-Mj
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:12 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGTv-0006Ov-GU
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:11 -0500
Received: by mail-wm1-x341.google.com with SMTP id j125so5992535wmj.1
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 04:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xO0SmjJi87cMCHBDYE6Aqyprx2bqu1BuqChTWfqFWYg=;
	b=jODasDd2CprkDE+SMmDJ85XKzxN4RW0kLA7p/4H/kR88P23aVkEW5u39Liy0jXgBfm
	67fWPG3UMDqN+EK9ujfMGKZg3fEpDRYmtBkjfy709q8nPFE1sNzCc04I5QbIRcUkDCkT
	pOlOgUNYvQrH97+f8fomIEqpbkHLUQPj7DtVQ7N1haFuo2pLFkiYAYJteBfqXY3dDCUp
	iSqOBum1ac9DtwjksTyyRGjxg1DnS4/3K0IKfXPyydLv2kH6+w80P+Co4QfDoXqbIJKU
	PU8O+zIidJEx0D0qz8mdp4/xoZ2rWPdxdcUlRyDVuQXTkeMZuL8a6dZoR/SlgqIBnOJP
	8BPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xO0SmjJi87cMCHBDYE6Aqyprx2bqu1BuqChTWfqFWYg=;
	b=rUHW4mhHHj65qt5wqOYGRRuWXkwOBSPYcums19nhdkNSZ9cZdJrcAOr9sMCyBZwQDT
	Kc16XqZ2s+Sf4pH9FlkfH/wdpSoSeHejSMLx8Qo5vbscZSeIFQHFQAhGcLBFKDiOcN1Z
	OJ9qOlcJVnmjBd2d8q9PL3bIyfH+EOcGa1T+HQXv2VJqry0DV1Z2aacQDO4U6q5XeW/x
	VZVuIEtvAR12pY9NMbqSg6BupA3jluT2EOdBbdwXJaLbV5/5GuPIVCrJASJhHx6h4C9W
	uhtZPQgDMpcyptysRBP/zKgRNNoMr2hDR2IKOfM32HT/KKVjzreW+2PgSy9KBY+c7Y3I
	syMQ==
X-Gm-Message-State: AHQUAuZbQeHHfmBK4qvBi1MzQtaScZVv247o3020HRWRz77U+4fgJBo3
	dMG5z7KBqdMw3Gu7dM1ZmzVYSQ==
X-Received: by 2002:a1c:6442:: with SMTP id y63mr2469483wmb.143.1550148670479; 
	Thu, 14 Feb 2019 04:51:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:50:54 +0000
Message-Id: <20190214125107.22178-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH 01/14] hw/arm/armsse: Fix miswiring of
 expansion IRQs
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
X-TUID: W6+d66TVOIjA

In commit 91c1e9fcbd7548db368 where we added dual-CPU support to
the ARMSSE, we set up the wiring of the expansion IRQs via nested
loops: the outer loop on 'i' loops for each CPU, and the inner loop
on 'j' loops for each interrupt. Fix a typo which meant we were
wiring every expansion IRQ line to external IRQ 0 on CPU 0 and
to external IRQ 1 on CPU 1.

Fixes: 91c1e9fcbd7548db368 ("hw/arm/armsse: Support dual-CPU configuration")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
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

