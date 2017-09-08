Received: by 10.223.172.38 with SMTP id v35csp1911105wrc;
        Fri, 8 Sep 2017 10:33:44 -0700 (PDT)
X-Received: by 10.55.155.6 with SMTP id d6mr1157842qke.55.1504892024532;
        Fri, 08 Sep 2017 10:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504892024; cv=none;
        d=google.com; s=arc-20160816;
        b=h9sJatEFwyo0lY2tCvBBwrkJsR1rOjYRuUCKS4c8xT3NAiSzhgVTWoGw8knw/ZizOT
         OKhZ8GVNlmtsjT8BgxIX9QuIzyR7PCtYD/yPdjw+zXQ0BPHu0UYnbo9ARb5U/gJOriN0
         R43+dnXvkvmqMdqIHeHJwTb/6qwQdm7RBWLoWBiLBP7sJeHp9Ql2tuer0hukPd8+wvaV
         RekbqqUtNhloQ/PdKGAXAHdYSAXXPs7R0L5yMhynM8x/zx56BKGb+ewudwsPKLUJKtD3
         Q97xQYsaEWRZU3qKyqIY3m+98O9iWGjfTLXuYCEjBiDlleLj9aEbUHoIWflXMPY3EJr9
         Gytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=WQfU7A5lU/yJT+aaarfC0QUkD/YRvh20owQ164qo1Mw=;
        b=q8rHV01lyLKbVkEmNQGea30xqmVeWXZyJ/HIx6qF2//RC5bVR79FyXKNmIxN5P+TLv
         ACQodU5lDWdRyOhw7qPys/OerFLWYeNd5mwc13YmE7Dg0XCz10lqZ9D11ugpJTNkikds
         2tndexyuEupcIBYBYduBQX/DiUNDNTYz23KN5gj754Ikt4QowrVi2xV3od+n6kgU7lJV
         Va+LoNUiHoJwgUkadjmpLjFB2+Jbiiy0taGxaNdAxdT0TjOjCc1JyUN3sseNNSc6Ko8E
         6Fa9zM1Wv0QK1QElH1466RyLvdDvlivYuwEmpQVYzDUfsrAihIq2ZK55O5pit7Wu01Wr
         xrkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O6W+F6ii;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g62si1403463qtd.225.2017.09.08.10.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Sep 2017 10:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O6W+F6ii;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqN9y-0003v7-Cj
	for alex.bennee@linaro.org; Fri, 08 Sep 2017 13:33:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8M-0002j2-Oi
	for qemu-devel@nongnu.org; Fri, 08 Sep 2017 13:32:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8L-0004Jd-Vf
	for qemu-devel@nongnu.org; Fri, 08 Sep 2017 13:32:02 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34866)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8J-0004II-Eo; Fri, 08 Sep 2017 13:31:59 -0400
Received: by mail-qk0-x242.google.com with SMTP id o77so1907849qke.2;
	Fri, 08 Sep 2017 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WQfU7A5lU/yJT+aaarfC0QUkD/YRvh20owQ164qo1Mw=;
	b=O6W+F6iivsG1h2+20+fGLVwa+GnaLQsqFnH5CblcZDSB/HEo3NNrsZovLDxnv1KTae
	YIIAwZ8oEVknju6wEbiGtoUqETZyPSKEphcTYohyReZmFdDFav0xiV3p9aJ66BYdF7VA
	WrP3svHxZ8rehuQacYZwPRr4Pn6JTeXMu3fuOJpxIaQWZ1TZCsOmd2l6I0hl0Mogr0ff
	YF8jEztDkjkduH5seqPblP9Mdi80zwZh8tlGaLEMf995v4Z3WxR27VPKRKiL5SqQ9T3x
	tweugGG5XdlOWoo64qFfxMmTxgJ5gJZd/x0XkGbt3JQLlHSu0Mtu4UyUiIjsRAGHmgDZ
	i70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WQfU7A5lU/yJT+aaarfC0QUkD/YRvh20owQ164qo1Mw=;
	b=KbFatDXraVqnDBz2fUQ4TQdpgc8IVJ4/af4XFOTfqGSGcANaCYL9R0aXzfOE44RU6M
	4/LEoou5gIx30eBVll1mPM8MW1NLazzZKNBCRu6Kr77vuj9+U/RF/+CdMxHIdS6GWHsh
	J20BxluVOqGcuxHk8+W1Tcd6GvlPEa3Tf2NngEIVR8Mvl4bpOAMx++JgrqDrRctEQYeL
	mXkqRq1Z3gUPnB8TxRlKxWUv2c8e1CwAc/BJbNiO5OLBLTLnZ7/sC8wzoZUwj+cdMJXN
	Y+/1YLqQ/+AWk4CzEdy9RRog8nd6yaRdIRHKblCC9iEsNNT6dmhTqVzIQ6SK+fTzDaxC
	LUxQ==
X-Gm-Message-State: AHPjjUjj8GKGomWfc29Ivu0XwPdbV4bkD50YQfe3+sxrtd4LYN8u86Yh
	l8wtfr6+lM3nc8zwnf5Q6g==
X-Google-Smtp-Source: AOwi7QDMqq7c6a/oGFTgJWsbiPWU1kaglmIDyHbZ1oyyoZlE8o/AbuWexFbywEf/WsU/Kgvb0c1jcg==
X-Received: by 10.55.81.134 with SMTP id f128mr1989855qkb.107.1504891918628;
	Fri, 08 Sep 2017 10:31:58 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 13sm1671505qtp.74.2017.09.08.10.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:31:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  8 Sep 2017 14:31:32 -0300
Message-Id: <20170908173146.6446-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
References: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v3 01/15] MAINTAINERS: add missing ARM entries
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ONPmbnBMypYG

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36eeb42d19..35c8c9c752 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -380,6 +380,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/char/pl011.c
+F: include/hw/char/pl011.h
 F: hw/display/pl110*
 F: hw/dma/pl080.c
 F: hw/dma/pl330.c
@@ -403,13 +404,15 @@ F: hw/intc/gic_internal.h
 F: hw/misc/a9scu.c
 F: hw/misc/arm11scu.c
 F: hw/timer/a9gtimer*
-F: hw/timer/arm_*
-F: include/hw/arm/arm.h
+F: hw/timer/arm*
+F: include/hw/arm/arm*.h
 F: include/hw/intc/arm*
 F: include/hw/misc/a9scu.h
 F: include/hw/misc/arm11scu.h
 F: include/hw/timer/a9gtimer.h
 F: include/hw/timer/arm_mptimer.h
+F: include/hw/timer/armv7m_systick.h
+F: tests/test-arm-mptimer.c
 
 Exynos
 M: Igor Mitsyanko <i.mitsyanko@gmail.com>
@@ -512,6 +515,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/versatile*
+F: hw/misc/arm_sysctl.c
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-- 
2.14.1

