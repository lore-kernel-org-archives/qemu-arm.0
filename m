Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4295562wrh;
        Mon, 29 Apr 2019 21:41:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyy2TzC+NpIm3YeICOa8oAYQ14imgvXmbJ1VD13mdlpJqv0MscQNoFoR6hfCSUOHtBm7EVx
X-Received: by 2002:a5d:4445:: with SMTP id x5mr21362310wrr.120.1556599266702;
        Mon, 29 Apr 2019 21:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556599266; cv=none;
        d=google.com; s=arc-20160816;
        b=z/YAk+8VQYEwstGSz03j552qN/NIpuQAQrXzqh7elCObs+ccGf3bztj1pO5qXXZdzQ
         nWS9vJ6qj6bDw2ChOeZJ36ifa9UtCYJFgn3V30xS6PxU3CiIngQF4lyMsdq+lLiHRqhB
         cTVTjb/iDlUcKr8+TjLS6goUiw+0fsGjHaula3vCQBq1/GH5WlL9sPUAy8rGfBM1agSM
         dRdb36NyEbjOJuYPgOPADmB6SEiiJ2zACJthhD5hq0FR/oOTPoTWIPoHbxo2aFuUeN1X
         pVHOfKDoR6B90UGgFK7bPcl0N6yyDRPLVirMXvaZhR4Zqqlw7VPRt/baTf3Zd8LFh7qt
         3Cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=gFbCi86uIEW652j72gzX8jjTJZ5WmXcv260laN5+gkQ=;
        b=X9aNtCD/NazDM8v2f2egGlTHmYut5r4r1SCevoMQotVJpq7gr0g4AXUqb7/rOdZHKd
         hmiyyu6tOllvCOaNa1q0sd+sUI0iXet+yXFxPp6FWPBlHim+9NVxRG6AFcHSlSbVmwAh
         h33YPZKUgkX85KHB5Bfvf/NflxgovGKTZBEcglCyDcBtI/Mlqs5zT12go7+U6MgwZV/6
         AoV9/JZb976BNAE/tgTl0iNWjDbTImELIFNz1FixwsK0vpxOdDGO8tjM/W9dCVgYHp0c
         2Th9SyPmKOyFLJ/WnnfCeP7pla+XJwg5tEtYSQkl3QR430NT7CfFHoWF5HZlBkkRRF2a
         3wlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nsA8ij/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si14453698wrw.333.2019.04.29.21.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 21:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nsA8ij/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:39001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLKZl-0006cb-Pr
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 00:41:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hLKZa-0006bd-CN
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 00:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hLKZZ-0002bH-HY
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 00:40:54 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hLKZZ-0002aq-9G; Tue, 30 Apr 2019 00:40:53 -0400
Received: by mail-pg1-x544.google.com with SMTP id i21so2788250pgi.12;
	Mon, 29 Apr 2019 21:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gFbCi86uIEW652j72gzX8jjTJZ5WmXcv260laN5+gkQ=;
	b=nsA8ij/7y8hg+m8GN0iqRVa7Zh9WGVvC1rb1lC0CUVbrmNuM/1CbSjtPJ9a3UCT+iM
	/2/l3cYO7ctzW0OT5aHjjxjZn1ob/Z/KrRYv9azK9DoLppERS4NP4xBPV2HbndBcc5rr
	HwIzpIV2sLtGyGFciBN/U+BkrGSGGQhvFw2MhCLYO50ydFzzzFU00Q/ucNN6eAgxW5Iu
	NN7BzpJmYDyiWlvD/Y4HwyoYqHHuJKslFBYNtuHBTXlERmtBbG6rUhN+pherr6UBb4ng
	nW1iVYw1tsWEEHidffFxIXXzioDkz+bbMWTsk6kCLe6T2hK5fnuBpcj9Wfa6QbD7HM/d
	iJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=gFbCi86uIEW652j72gzX8jjTJZ5WmXcv260laN5+gkQ=;
	b=AJxkrbe855VjyoXqhLk16BS3g8JEDkXdErpYvNbKuk+slx7TDyRJhQaZ61hxWHRvbX
	Kx9o9prx2/9OeaBaoAX1ogjCXd03BkmbV5+GjMdQb69MJ60V0Y8AUVFQpk+GvT0Y3Ko2
	mYR9tkxosFAy3w5KWuAPvJfPRQVLWDkiK6ZOovcmf0SEs3Dd3TJVqw40PyXImLQKMV57
	04cz3NIHCOR9cI6BN3fko5CbAiSwKgZM2EXgM5aDI7mtIK0QLulCkXKO9tCGaHVwK2Ii
	w24Fn4F1Z2GXaNonq7fNElxB7vRVmwf5WImyJA/UTKsOYAVyU7IN58k+qVKGHXrYGu2e
	5/UQ==
X-Gm-Message-State: APjAAAUOiHp9cqO9IDFJYqQkoFAqaWh6zoEwKaiaeXvCzwFajRgX7MaB
	/ktzdEcYMTsdiqc3HmC5wXo=
X-Received: by 2002:a63:117:: with SMTP id 23mr34286pgb.34.1556599251288;
	Mon, 29 Apr 2019 21:40:51 -0700 (PDT)
Received: from voyager.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	e11sm25312107pfd.151.2019.04.29.21.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 21:40:50 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
	Tue, 30 Apr 2019 14:10:44 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue, 30 Apr 2019 14:10:33 +0930
Message-Id: <20190430044036.1144-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v3 0/2] arm: aspeed: Add RTC Model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tk2I8cA0QNlg

v3: Add some commit messages, resend as v2 didn't send properly
v2: Minor fixes, added vmstate and reset, and rebased on Cédric's series

Based-on: 20190411161013.4514-4-clg@kaod.org
[PATCH 3/3] aspeed: use sysbus_init_child_obj() to initialize children

A model for the ASPEED BMC real time clock (RTC). The model is sufficient
for running the guest Linux kernel driver, and ticks in time with the
host when programmed.

It does not implement the alarm functionality, which includes the
interrupt.

Joel Stanley (2):
  hw: timer: Add ASPEED RTC device
  hw/arm/aspeed: Add RTC to SoC

 hw/arm/aspeed_soc.c           |  13 +++
 hw/timer/Makefile.objs        |   2 +-
 hw/timer/aspeed_rtc.c         | 180 ++++++++++++++++++++++++++++++++++
 hw/timer/trace-events         |   4 +
 include/hw/arm/aspeed_soc.h   |   2 +
 include/hw/timer/aspeed_rtc.h |  31 ++++++
 6 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 hw/timer/aspeed_rtc.c
 create mode 100644 include/hw/timer/aspeed_rtc.h

-- 
2.20.1

