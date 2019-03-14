Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp577292wro;
        Thu, 14 Mar 2019 01:43:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyv955HSfoJnWJn87kHdkgcEUVwKYx3dytOqRfQJtWAFfPD4y0Km+FxM0qlccDYG3HyEhlZ
X-Received: by 2002:a25:3746:: with SMTP id e67mr40242894yba.42.1552552996263;
        Thu, 14 Mar 2019 01:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552552996; cv=none;
        d=google.com; s=arc-20160816;
        b=VIRafMXt8rqck+x6pAPD3tB20tgX5haFuO2gSbPqo0rFFRPG6mixCCG5fXBOVvR8uf
         ROQ/zyB1TObwOM3rSiciUQ/w1RublnxXLh1NDGtsqkW2HJxbhmixNjOiEzmdeWTiGgo0
         SCnGipKgclfyFZjlORt/HB9xJWd/l6BwkcIR7URbnp0RQRKOJguf0ig+x0i1cZtiTeNJ
         HPIClCL48zky22OS5qmjhtppDWAWviiVVoLoFmEq5EPM/KHSe96eLYC8xJPV9kc2IAn6
         f8YlqEZreSWdx8fdhWkXF2KFg7nI1zIRKZEmmg2nqXxeU7sVqKVK4fymoWvRmHcJm/wM
         vrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=m7QRWj/7dfkhtnczHy6d4LeNTudx3mCS3J34yv4X6WE=;
        b=MifYaRMHNR9SQzaukWW7bQG6UGZh0xGfC6RGolaGdbrr1iLmhXfG+IM3F2JJQhBeK2
         NwVg1LCw232an47hyhpj1oe7CwL23+jTB5Lw9xxMlgflal9+MnI0xkJV5UHgVZ33fbqU
         JnLUBziw4je29Y0A2DMzJkMAhg5W0TryXJ3cjZjJrCdkHOrNQpBfFWMnrG+DuO9j6IHy
         eJhLSEMFGS0QZb5vxhqk8Gh1juShST0Hz8vMnwvxP/bvDRX9tevR4Oymy+Wf9jlp4NN4
         Ek3jyUzp5ZXMO0ek92LXm30aF395VXFxengTDMy9/Y3TTuB+EbShqXHiXuLM8Eykei6u
         47iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n64si5856512ybb.433.2019.03.14.01.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 01:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4LxL-0008DN-M3
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 04:43:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4LxA-0008DE-Jn
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4Lx8-0002Hw-FS
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:04 -0400
Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22]:58723)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4Lx5-00028C-Aw
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:00 -0400
Received: from player762.ha.ovh.net (unknown [10.109.159.139])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 16DDB1647CD
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 09:42:54 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id 742023AA2D2E;
	Thu, 14 Mar 2019 08:42:45 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 09:42:30 +0100
Message-Id: <20190314084235.9887-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1445092532510034705
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.127.22
Subject: [Qemu-arm] [PATCH 0/5] aspeed/timer: Fix slowdowns in recent Linux
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ipTksraiYluY

Hello,

This series was initially sent by Andrew on the OpenBMC list :

  https://lists.ozlabs.org/pipermail/openbmc/2019-January/014640.html

We had an issue with the introduction of 4451d3f59f2a
("clocksource/drivers/fttmr010: Fix set_next_event handler") in Linux
where our QEMU Aspeed machine were becoming very slow.

The series' approach is to provide back-pressure and it has shown
significant improvement on the initial behavior which became normal
again.

Sorry for this last minute fix but I think it's worth merging for all
the QEMU Aspeed machine. It's a bit late for QEMU-4.0 so that might be
4.1 material.

Thanks,

C.=20

Andrew Jeffery (3):
  aspeed/timer: Status register contains reload for stopped timer
  aspeed/timer: Fix match calculations
  aspeed/timer: Provide back-pressure information for short periods

Christian Svensson (1):
  aspeed/timer: Use signed muldiv for timer resets

Joel Stanley (1):
  aspeed/timer: Fix behaviour running Linux

 include/hw/timer/aspeed_timer.h |  1 +
 hw/misc/aspeed_scu.c            |  6 +++
 hw/timer/aspeed_timer.c         | 81 ++++++++++++++++++++-------------
 3 files changed, 57 insertions(+), 31 deletions(-)

--=20
2.20.1

