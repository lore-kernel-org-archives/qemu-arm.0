Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1319746lfp;
        Thu, 6 Feb 2020 03:27:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqyrkN0sRsoMjSXij4IXCBawndWV4dJcIhmlPnC51hz/hGvApj19fqe8T3q7HB3Ytg8IEBVa
X-Received: by 2002:ac8:4b70:: with SMTP id g16mr2110027qts.296.1580988438059;
        Thu, 06 Feb 2020 03:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580988438; cv=none;
        d=google.com; s=arc-20160816;
        b=HYqePvnvyj1Uxy3Kz1mCm50bG2+dNfG5u8xdI9sUQAQwlolfNfEHM+7+m7tG0F5D+B
         8uizHXFQpET+U5SJKaM+IvS7eabLRlf63vG2PHcPMbmRT70uQg+7+9MtX5OUlbLqVVJv
         NpRXIz6Ol/gxnq+QbBId2tj88CTdz1OS1n+LaXW61jLOvT+T3RzNszFH7Ll8DaF+uVrq
         Le8EkeMktTJZgnQAb5GSOYybx0vhe7P8+91gSs/w7J6YFjAzbVj+y9SCN4cdeNEDpyfQ
         fjhB/oTEYJQY2bGAuR+d3Jcwu0N8llYGmVMqcJWXk1xJEY5TB33Rdtb+aaJNGYrTQjZ/
         rX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=fwzVIJ8PnEgKfBwjNHPGCmK4pM+IYq4IvDGaQJVRu+U=;
        b=vNQiR/fExiZSbbdjTfAsWATv0afQ7TiNgrlFT7w3k1DdwjrQU5lfLnMZZqLP9ugyS3
         5h0j9TaMEla1upegZrG+LLZTNcQOY7XuNnr+GLyMoO5SkOzoERYeI2kbH88iK302JW+a
         oSHhDR+J6DUDF3Vf8E2zwRjcUcR7hp23r4WOl2czoskZuSVmVWGs12jnIo/hm0xHfeJ2
         Mh6/Eo/wBgDPXL87i3GV4g6hUOkbHdCjaSzK6stLoKw83gldfQRSi6R7po3aQeUJY3+3
         9swLjbXDpHNIAt8PMjpsVn4j3R3jJnSTrvq0ir5DkxvGAZ9mtB/pk1v9unTpLCnuomzL
         nyOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si1410676qkc.336.2020.02.06.03.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 03:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izfJV-0005bo-GL
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 06:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izfJM-0005ZT-56
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 06:27:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izfJJ-0007ho-Ve
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 06:27:07 -0500
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:42568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izfJJ-000705-QD
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 06:27:05 -0500
Received: from player788.ha.ovh.net (unknown [10.108.42.167])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 2E6B71FD260
 for <qemu-arm@nongnu.org>; Thu,  6 Feb 2020 12:26:56 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 553F8F1A6CFB;
 Thu,  6 Feb 2020 11:26:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] aspeed/smc: fix data corruption on witherspoon machines
Date: Thu,  6 Feb 2020 12:26:43 +0100
Message-Id: <20200206112645.21275-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17870283324729756433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheefgddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.150
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dcr9cXFL/cE8

Hello,

We have been seeing a squashfs corruption on the witherspoon-bmc
machine for quite some time. It boots but quickly after boot
corruption errors start to fill the console. This machine has two BMC
chips with UBIfs on them. The romulus-bmc machine has a similar
problem when both PNOR are enabled.

After some investigation, it appeared that the SPI transfers on the
two chips were getting mixed and after more investigation, the User
mode select/unselect scheme of the Aspeed SMC model proved to be
broken. It's been there since the right beginning of the model. Here
is a fix.

Kudos to Andrew J. for the time he spent on this and Andrew G. for his
patience.

I pushed the code on my github branch aspeed-5.0 for more testing.

Thanks,

C.

C=C3=A9dric Le Goater (2):
  aspeed/smc: Add some tracing
  aspeed/smc: Fix User mode select/unselect scheme

 Makefile.objs       |  1 +
 hw/ssi/aspeed_smc.c | 56 ++++++++++++++++++++++++++++++++-------------
 hw/ssi/trace-events | 10 ++++++++
 3 files changed, 51 insertions(+), 16 deletions(-)
 create mode 100644 hw/ssi/trace-events

--=20
2.21.1

