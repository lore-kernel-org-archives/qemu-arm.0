Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4148053wru;
        Tue, 7 Aug 2018 05:31:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcPlSZI3Aos6SHMo15jZUV+XhnHKHlfUhphQuIM8pZiPKz+lze1FWkR0fkLWTx34SLgIjQM
X-Received: by 2002:a0c:e5ce:: with SMTP id u14-v6mr16375409qvm.6.1533645073556;
        Tue, 07 Aug 2018 05:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533645073; cv=none;
        d=google.com; s=arc-20160816;
        b=joOmOiFU1mf6M2Kn3/g83a9bBCP2Tt9IbAtxClBQOb7PIxYkD3hD4rI7mnc8d4PNtP
         GWL6twbz7A2GnmQzKP5WuxEVKxpc5xowfstP/Bvddm5GmHiVF2Muk75fOssRyIOO2jGD
         NLTWRGnqDkRUeJn5L1NZm9LRLBIQvC18FHFiE8cjfAZUafDOxsiTtuEeeBxWLnARG0l9
         HUtVJl0aPcCZfVEChmGJ0oK/dEqN4+SLW5i8lsswzkDfRoTazJBCghq0VtqB/vXhMR4A
         GrSXLj/qJHybmT797lxUstG0hLguQyduW6g606eZPZCXHI0GGUr95gq4ASizACFiZpP5
         pqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=mz7IqIobheRWJv3OT2qgo/sYeQHuP6jcYaMweKj7ULE=;
        b=BTbESJTYubUyt2xy7IPKUNZI75sap29NagiYdF8YHSGTJJvJxlX/QmbDyui+6qrv7y
         FUKahWUkrw/cUe7pfz8GdNp4pk0cRd6SSD5SDIZLQp95vsZIdbHI+jZ0YRtWmmQoqgK6
         U0uokTgPEI21cTwdZigZZxs+QOLzbeKd9SAMzVWJmYlcR7CGeIUrsRbNRMRkZ68xx8fQ
         LctbZTZv1K/idmVzeJJkQw3zP+hpEx8F6suBc9qgd4OlQwDX6dFfnBlVWXJ3N+eERdRP
         dUzoQVXGbTVEMOPmtxeUL2rVMyUWY9tQPuOzwC3gqpbUVAWgqLBALcRrcfhKT/fXXJAs
         xafQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c32-v6si1145458qvc.108.2018.08.07.05.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 05:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn18r-0004P0-4m
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 08:31:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fn18l-0004Oj-1U
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 08:31:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fn18h-00075t-Tc
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 08:31:07 -0400
Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146]:54218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fn18h-00075M-Mq
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 08:31:03 -0400
Received: from player759.ha.ovh.net (unknown [10.109.146.32])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 2F45CF26FF
	for <qemu-arm@nongnu.org>; Tue,  7 Aug 2018 14:31:01 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-237-83.w2-11.abo.wanadoo.fr
	[2.11.96.83]) (Authenticated sender: postmaster@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id E51216400BD;
	Tue,  7 Aug 2018 14:30:55 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180807075757.7242-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fd6f2874-d73e-f0b4-83a2-cbac5c9b3f19@kaod.org>
Date: Tue, 7 Aug 2018 14:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10449758513879550784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddtgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.41.146
Subject: Re: [Qemu-arm] [PATCH 0/7] arm: aspeed: Extend SDRAM controller
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
X-TUID: Szbi7Ps4RsTH

On 08/07/2018 09:57 AM, Joel Stanley wrote:
> This series allow us to run upstream u-boot on the ast2500-evb model.
> They have been tested with upstream u-boot, as well as openbmc's ast250=
0
> and ast2500 images.

For all patches,

Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

Patch [1-6] are good to merge.=20

I think patch 7 is a good start. It enables support for mainline=20
U-Boot that we can use to develop more U-Boot drivers (flash).=20
But the device reset model needs a little more work to take into=20
account the Reset Mask Register of the watchdog.=20

We don't have to support all of them, only the SoC and SDRAM to=20
start with.

Thanks,

C.

>=20
> C=C3=A9dric Le Goater (1):
>   aspeed: add a max_ram_size property to the memory controller
>=20
> Joel Stanley (6):
>   aspeed_sdmc: Extend number of valid registers
>   aspeed_sdmc: Fix saved values
>   aspeed_sdmc: Set 'cache initial sequence' always true
>   aspeed_sdmc: Init status alwlays idle
>   aspeed_sdmc: Handle ECC training
>   aspeed: Link SCU to the watchdog
>=20
>  hw/arm/aspeed.c                  | 31 ++++++++++++++++++
>  hw/arm/aspeed_soc.c              |  4 +++
>  hw/misc/aspeed_sdmc.c            | 55 +++++++++++++++++++++-----------
>  hw/watchdog/wdt_aspeed.c         | 20 ++++++++++++
>  include/hw/misc/aspeed_sdmc.h    |  4 ++-
>  include/hw/watchdog/wdt_aspeed.h |  1 +
>  6 files changed, 95 insertions(+), 20 deletions(-)
>=20

