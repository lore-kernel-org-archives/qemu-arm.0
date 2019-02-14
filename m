Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp950320wrp;
        Thu, 14 Feb 2019 05:02:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iba4CKkOMm7exBQ0gjjrzGEmzHA6AKHwkfULL9DloIC9c3cyhKPCdUb8iEJ64dELm+x/KTj
X-Received: by 2002:a25:558:: with SMTP id 85mr2859105ybf.139.1550149379130;
        Thu, 14 Feb 2019 05:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149379; cv=none;
        d=google.com; s=arc-20160816;
        b=wkRXk/D0q4m3+PAXpEATIS4P+Kiqvh5Xni6lIux/ZhkISv+/grD+vO4LFy9yD3DR29
         AQo8CPsNh3HR4TVEbxx+oVTe8i7s5cKw7RfflE6Dy5uzeyq+o6L5WV5whhZjfPpM1wBA
         C8NwqLo7PaOa8JNdIFsu0cPcCQo4CdVPe7RAsVV6/yIQqZFYJRR8q2xPq6uMlVfbyr67
         +G5ykSI1eOQrzDA5TzdHSR1KKdUK9oh7Ye5QG85yIBJUQbezjic4jn8jw7WBDaICgfqq
         RyAEsRWpbgW1bL+qRSaxsfzz1OxNOagBsoMRshTgaIwMqhkBjoRTJl68t+l2YMkzi1UO
         AqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ebn64XdcAcwAG7W2yYJLFh5oyBBZkjhw+yyDNY3aVQc=;
        b=kJhWt+TdnqHVPkMcDlUire3dz329yJN6BFujkiD8oISCvBMQRov/z266xi1VH5QM7S
         c/GZDnb10Zb44cem0WXVDggswuCchD2zVxrU/biFq+3eT2IF/DxmkeeC7/jrSSd5v36G
         jPx/pi0xWMCBlK+maf32fBCGb6FE+VuAqlmotegYCZ5t6TbxJ7NXy7YsVvhyYkefEWtL
         plYztKEoqzvFNsYyxaU34ty1JkybHyVVcaymGaQ38vf3yxM/1/tbNKeUm3i2fXQ+F82P
         3uwCYgvyp+05ZDZBLg6m3dYLIjHGAG1+WCfSMQAf/7PtycVY0UNt5/9e9+NO4JK498+Z
         0uoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nRh++iUG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si1335361ybl.52.2019.02.14.05.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:02:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nRh++iUG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGfK-0003Za-Hd
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:02:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeO-00034b-FP
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUe-000728-Je
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:58 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGUe-0006ZF-Ao
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id x10so5926232wmg.2
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ebn64XdcAcwAG7W2yYJLFh5oyBBZkjhw+yyDNY3aVQc=;
	b=nRh++iUG3stPiTw+pdpr5Sjc6NRsdcS/YRYk0cjIkqq4Zfi7Tal2abID+yOVEzYdgH
	iNbYbGfRHCR5TTx3rijF8pt9ppO6nI/FLuSCYr4peXGqYtozwQUssbzabDd41yrNJkhu
	ZRJSDanM7B0aKLxOpO3HLGEhC77JzU0VopJ2XmXY07xmjYosGiFtQuWtrA+xfNTP74JT
	aStUzcmODFLCFoYquJt80HI9Ts7GCs3z82+HIVevByLPKwU50YKcrQW8Jx9Rf7nTOdzC
	blfuOekfCQjAaNxGxZrpPmh6Mgukw0vGVYSG4os9nBiLiXbLGdXlD7eE9k8NRb/WmduM
	KpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ebn64XdcAcwAG7W2yYJLFh5oyBBZkjhw+yyDNY3aVQc=;
	b=izLHN41Q0D0mEiIwONsQSWe88Fcw8f/ZvW81IYK30H6yIsuGg6fLk+mZyeRKc6Qa6b
	9KW97EwTnqg5laeSws4X08P0jkHVZxtHmDvonkmNr9UeI13gXY3GNx3tExSFf58p83vH
	vwfZSHbj4gjdnUcyfM0JG/ROt9qKXiLFgolNz47fw8Y54SWuWnJkLOyJlnjjFl6RA+dZ
	lgmu8c3f7/qBFo3pg0bKkzIyyzrO0muRIbHyBQCtaFOaeZkmt+smIiLuBvsmArwUvJ4M
	2ly3O4T8tD91lUHivTSxeJlm3mAS+bhzTZ5uT3RaEh4qfDMWVcqeLnyQAzSWBc2rYbLQ
	wXBg==
X-Gm-Message-State: AHQUAuYH0SF14Xkm8zkoLRN9uuo0o5aSx9YrGhNj3KhbhpYdc9Trvo45
	LpXPRQHVlix4CPSnWIL+mSLP03Hr5AgnCQ==
X-Received: by 2002:a1c:e1c4:: with SMTP id y187mr2755729wmg.50.1550148678630; 
	Thu, 14 Feb 2019 04:51:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:01 +0000
Message-Id: <20190214125107.22178-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32c
Subject: [Qemu-devel] [PATCH 08/14] hw/arm/armsse: Document SRAM_ADDR_WIDTH
 property in header comment
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
X-TUID: 7oPw5wuYDF7d

In commit 4b635cf7a95e501211 we added a QOM property to the ARMSSE
object, but forgot to add it to the documentation comment in the
header. Correct the omission.

Fixes: 4b635cf7a95e501211 ("hw/arm/armsse: Make SRAM bank size configurable")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index f800bafb14a..444605b44dc 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -46,6 +46,8 @@
  *    being the same for both, to avoid having to have separate Property
  *    lists for different variants. This restriction can be relaxed later
  *    if necessary.)
+ *  + QOM property "SRAM_ADDR_WIDTH" sets the number of bits used for the
+ *    address of each SRAM bank (and thus the total amount of internal SRAM)
  *  + Named GPIO inputs "EXP_IRQ" 0..n are the expansion interrupts for CPU 0,
  *    which are wired to its NVIC lines 32 .. n+32
  *  + Named GPIO inputs "EXP_CPU1_IRQ" 0..n are the expansion interrupts for
-- 
2.20.1

