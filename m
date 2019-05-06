Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2467093wrh;
        Mon, 6 May 2019 07:21:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIoE1QRS4Bjb/M7EjQPOsMnltjg9F8qldoJhl57eZWpnwSEQR1ENePgIKS5hEj7Nd7Ap3O
X-Received: by 2002:adf:dc4a:: with SMTP id m10mr17783139wrj.0.1557152474045;
        Mon, 06 May 2019 07:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557152474; cv=none;
        d=google.com; s=arc-20160816;
        b=Us85Wk2tKyYICQ8xtp2vaxyKBrWmwA4uZWOgMKBONl9ADRyUHeL5Koq4PYCnRGBQs/
         MDZ1r9rKptTXz8+Um/qawRRclitwcW11Geqa6NNHdJf/IjZStCsOKdYJ9WGCOLQVDm8X
         feuLs7KilIxPLYixeb6hiJSGuHYfXzJAaV/fvw563lIt+YZqR+skYAHsEzTRWXJp32wb
         phfsEl1J2ECbBEw88zixzaE93VuwS5Asbx5oWh08USlrpmsJwesVu8qzv3g7G40/ZG8p
         LZiyAI8XmHAwxw41jD/k12ok3qpMvHOzOglEtHGWb4wuKMyx3Ib9va3du8vAQUjiIFQL
         WvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=28N8qkhF/C6P6if4xC3EuyXOD9qVlZOUnXJIlaJCBPk=;
        b=cSVqvEAzKrsp+l1G4QMmvFYIleizCkJ/gxhbWkXy0avaRSSVcuCPlRR6IagKq3ILX0
         5zWQ3rdiiX0uPzeI9EDeQDdJljPMhrua65wO0BtH+kh2XwH2x1xsNn5t+HQjnm59SfGl
         CVicMID5sarrJ/U+VAdLJeTvVdblCEG+fPQlOYZ8MNEj6Js1/5p6atdjJdF9o9LUKtKY
         doIuKTU+WQ+OQWfP9kShzOUl5m9oUsIeRRY5wTHRV+9ba6tBP1TFGUtPJmbh5AKdhXm+
         SAWH89iiRIjn6x4Vr8cKHoYg2uyeCrNK0mUE3jJ68ZhlEdx+neuipOjDBxWTJJQ15Tgb
         08JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si3424855wml.51.2019.05.06.07.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 07:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNeUT-00013b-2x
	for alex.bennee@linaro.org; Mon, 06 May 2019 10:21:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNeUE-00010i-0q
	for qemu-arm@nongnu.org; Mon, 06 May 2019 10:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNeUC-0004Js-1Q
	for qemu-arm@nongnu.org; Mon, 06 May 2019 10:20:57 -0400
Received: from 6.mo178.mail-out.ovh.net ([46.105.53.132]:58363)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hNeUA-0004E9-Gh
	for qemu-arm@nongnu.org; Mon, 06 May 2019 10:20:55 -0400
Received: from player779.ha.ovh.net (unknown [10.109.159.140])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 154945E992
	for <qemu-arm@nongnu.org>; Mon,  6 May 2019 16:20:51 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id F1BC855A9826;
	Mon,  6 May 2019 14:20:45 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  6 May 2019 16:20:39 +0200
Message-Id: <20190506142042.28096-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4810688827171834641
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.53.132
Subject: [Qemu-arm] [PATCH v2 0/3] aspeed: cleanups and extensions
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
X-TUID: vk11PkVhkS9L

Hello,

Here is a series adding a couple of cleanups to the Aspeed SoCs to
prepare ground for extensions and new SoCs.

Thanks,

C.

Changes since v1:

 - moved enum defining the Aspeed controller names under aspeed_soc.h
 - removed AspeedSoCInfo 'sdram_base' field
 - fixed clang compilation

C=C3=A9dric Le Goater (3):
  aspeed: add a per SoC mapping for the interrupt space
  aspeed: add a per SoC mapping for the memory space
  aspeed: use sysbus_init_child_obj() to initialize children

 include/hw/arm/aspeed_soc.h |  40 ++++++-
 hw/arm/aspeed.c             |   8 +-
 hw/arm/aspeed_soc.c         | 226 ++++++++++++++++++++++--------------
 3 files changed, 184 insertions(+), 90 deletions(-)

--=20
2.20.1

