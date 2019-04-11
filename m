Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7361344wrx;
        Thu, 11 Apr 2019 09:10:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywjL7R/fU6AD676jDkvT9EE8kPwITEJTO+bf+3GLAeNW8XJjeJMmveZqO+CxC7JLNdmXA2
X-Received: by 2002:a5d:4446:: with SMTP id x6mr31373568wrr.147.1554999055567;
        Thu, 11 Apr 2019 09:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554999055; cv=none;
        d=google.com; s=arc-20160816;
        b=bTjqdiD9zhlo/Dor54IOM8mIfSNnghH5Af1z1NqZO0kAQTNEpaYqhB20BaXYqjm2jg
         tNWoHEs5sl9WBk3bbCvT9p6nHWO+ZmIkIUeMKJGcXhaYU4+W/FzOSpLwKTebkS1KfRPF
         uSYIJpKyU4EG91aJ7F/76OgmQsBRexW4AWMQQs4OLOI4cdFJADbgvOe43lj6Ub0Kv9/p
         VsTkwg3e/7y9uuY4DWaYaD0O6NwtBobopJsU30F9SKtqx6I/Zf3qRca8+LwyE77Xi2tR
         77l4CcKT2q3doD51ZXORn+s8/tocTIwCWg1S+tER7Iee+Bn4I9cMHfiArMTFtiMb5gHm
         RSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=tvJvWz8yRgSQlPxBPPQ5246jvTP5OgGiEZonQ+vEeWM=;
        b=fSn5AbD44b7gK62rjg8Q7cnlj2/pnbefnGvzQ1yApEm4RYPJIuGf/WMNMLctx41C+s
         OfdGsHou0oLcgv+u/1IXGM/a4s6ZkzeS1oIZHjeXBgSFh+ZASuwdZcqKV66NE9zP1oJV
         lSVeKurTNl8MRNYTQNDjthEYKLj1XGbjdtk5rR2EZ2hXexYQfjXXRquVG6pSgkXX7Aft
         NQHVhhvX5RzuuZwYm4Kyg4K5zNDVCE2yJbhV1T0LPB5WFXtRisT6oTBj25nR1/IOHOMi
         DBJNaq2g2ZAHJs0GMqybU1AzJTF9ccbHuqqOwUbraiy65fsO/EGmC/D2/BVvm4zE/9Xv
         eYMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si24797705wro.194.2019.04.11.09.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 09:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:51681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEcHu-0003eH-Kb
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 12:10:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hEcHZ-0003XB-Ty
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 12:10:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hEcHY-0004px-Q6
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 12:10:33 -0400
Received: from 19.mo4.mail-out.ovh.net ([87.98.179.66]:41914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hEcHY-0004mK-Gw
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 12:10:32 -0400
Received: from player759.ha.ovh.net (unknown [10.109.159.154])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id C71B81E3A46
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 18:10:24 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-40-22.w86-201.abo.wanadoo.fr
	[86.201.133.22]) (Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 9C5474B4A903;
	Thu, 11 Apr 2019 16:10:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2019 18:10:10 +0200
Message-Id: <20190411161013.4514-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7417428589923371793
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudelgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.179.66
Subject: [Qemu-arm] [PATCH 0/3] aspeed: cleanups and extenstions
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
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nO4/l7tivVjX

Hello,

Here is a series adding a couple of cleanups to the Aspeed SoCs to
prepare ground for extensions and new SoCs.

Thanks,

C.

C=C3=A9dric Le Goater (3):
  aspeed: add a per SoC mapping for the interrupt space
  aspeed: add a per SoC mapping for the memory space
  aspeed: use sysbus_init_child_obj() to initialize children

 include/hw/arm/aspeed_soc.h |   3 +-
 hw/arm/aspeed_soc.c         | 266 ++++++++++++++++++++++++------------
 2 files changed, 184 insertions(+), 85 deletions(-)

--=20
2.20.1

