Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp318633wrd;
        Thu, 13 Sep 2018 23:36:04 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYXZ7m28A0/uIIC7IvVoOgkrACUcmxCPzW8dVnkpqGqM30GnKpUYx7qLLKoI5P3OT2JlFNl
X-Received: by 2002:a0c:ec8e:: with SMTP id u14-v6mr687366qvo.173.1536906964781;
        Thu, 13 Sep 2018 23:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536906964; cv=none;
        d=google.com; s=arc-20160816;
        b=eOYXIbuSrykma0zMxFe4eAJMEvclH4qv7hUlo8LXTjGOIzSWqVaNqSF2EHpgtrb5H5
         9P26lj6xl+Q5qHQWPPs97N4UYvThleqa1uUYiD1I77uWrso2vLOUiZVWQmB924SmFv/f
         rXMpxaQRcQd/Ddai9NPYHHnynCqV9h+lhV0Rvl9HWIEtbqWXjxs5VeXsMQ3Lsq0yDWKc
         n4jxWcmvDWGXgNkGQelO31jSrwL6DPeNHoXqUrrdcPf8o4nI8fGE4RgoqPKJsrKpqD/s
         bM6l/o+a0WwnFy/ffBKPbPkk0IWWXWu2Ge+GjQ5qoaw9AKjemmOgngtUC23dHgMZWed0
         Re4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=IuCVp4PyR1VW7YbTNSxv/Ntbwjn4oDIt6QGu0vbvxio=;
        b=CXg7CWuoSIqtaU9s9MXyJsPaiC3kK7CroHFQ1HcCfGsc8nBK/0MLrUXmoQ3tp/nUrv
         rgEmW1s3W3fVqlb2JEeyB9WZLVqY+noalxLUuhGKeabXT0Lc8LbItincS0jCVdO3xbYJ
         FT4OQzjX9xBthVWKLtqJLIzloazVaFkvwt4FcLu8EryePbjz7W/6xJF8MvB45zGyIYj3
         YLgfgJLsXI+y+AiV0GGGcc3ssftsS8M/7kbi+0zbiB2wRx4QZODpeL7jLpGaZEBcLWPJ
         4AAiYb8DioxESvJUKVW5IUvrob+t/A+p9MV26U6+NgwF7PvjCBMGTfdMEkRiMEJW3nXE
         5hog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18-v6si958678qvq.4.2018.09.13.23.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 23:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0hi0-0003On-7W
	for alex.bennee@linaro.org; Fri, 14 Sep 2018 02:36:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhV-0003Me-81
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g0hhS-0003lR-0l
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:33 -0400
Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]:38915)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g0hhR-0003aU-JP
	for qemu-devel@nongnu.org; Fri, 14 Sep 2018 02:35:29 -0400
Received: from player759.ha.ovh.net (unknown [10.109.143.145])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id B6D8912D39C
	for <qemu-devel@nongnu.org>; Fri, 14 Sep 2018 08:35:20 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 99CC36400B3;
	Fri, 14 Sep 2018 08:35:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Sep 2018 08:35:03 +0200
Message-Id: <20180914063506.20815-1-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6244240885111688000
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrjeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.96.102
Subject: [Qemu-devel] [PATCH 0/3] aspeed/i2c: fix receive done interrupt
 model
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ayRmsHHSK1rv

Hello,

The interrupt model of the Aspeed I2C controller does handle correctly
the RX_DONE bit. As indicated in the AST2500 datasheet, the RX_DONE
bit needs to be cleared to allow mode data to be received. This series
fixes the behavior and delays the data reception until the bit has
been cleared.

Revealed by :

  [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq event=
s
  https://lkml.org/lkml/2018/8/23/1366

which fixes irq handling in Linux at high bus frequencies.

Thanks,

C.

C=C3=A9dric Le Goater (1):
  aspeed/i2c: interrupts should be cleared by software only

Guenter Roeck (2):
  aspeed/i2c: Handle receive command in separate function
  aspeed/i2c: Fix receive done interrupt handling

 hw/i2c/aspeed_i2c.c | 68 +++++++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 21 deletions(-)

--=20
2.17.1

