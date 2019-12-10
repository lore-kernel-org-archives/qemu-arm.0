Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5525443lff;
        Tue, 10 Dec 2019 00:53:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxuO5bwXuFwc5h4+T2cq0G8TK2U27A62qNKN4Zb90RMnYGbS9HM7tKpAeFDKV9weq5fL6l
X-Received: by 2002:a54:460c:: with SMTP id p12mr3131855oip.18.1575968026619;
        Tue, 10 Dec 2019 00:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575968026; cv=none;
        d=google.com; s=arc-20160816;
        b=EywRhY/egeulqIqPH8zq/oWd9iZm0RsX2cOprq3mlSIaEYdcBfd6+jMhF/qbyr9ftm
         hvpQr+99fmjv31JfCE2yBsKIwUglZH9LCoZ8zF/D/dytumSeHG7HendtrPVIjpKQh81r
         bnC6fT7kfXBClX6uWtLhcmA2ITJ3zRk68eRTcL+NZM8573iyyK2feKxqwWE3QoGvhKHB
         nHBaJhuyb+LHtZGLZd+wWHBslYeluZyDKM3d0JJZK2TjFkYmsvCZ30oTIDBxZC+5y1za
         nn5HE0i3S7EyTA+5450KVYEvWcOpfgTBG3pmM4hcuHcwqZmC2Y4eebSoHv0D/7I+HTwl
         VwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=MzcB0jR8kH6wumyJOPvA2DDN0bYA/+wE/ojuOV6tYwc=;
        b=Ltct5dv1bmhoACmNRcQVH87i7t3OTyWCG5iCN1QcpRrqQ4YPexdXluLEv8DMYXuF6k
         CWRS4peHTThMSw5M64ZRsb4/W5wm7I9lMKMfoFRPbniuPgEfgl76PRpn0rk4KgMQ2CiJ
         Bfh7ZKGsYfrg3ZDUDWk6FcP3GShFesSn+ClT0cWU8d7OMapGlOxV0exhmKoyx5AZ3jWz
         h0/PeZjzImXvkNImYyYNmnJJNpXgfReWcO4i+CloBFU/RNG+o8mI682sdRZ06/H5vc6t
         lWSk4itvLdAw+V65rhxS3JIYENE5Id4Eon0oBHNsv5Ilg4o/QiFfW9ZcYAv7K9hzA9iA
         6pfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si1551887oti.47.2019.12.10.00.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 00:53:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iebH7-0004PK-RI
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 03:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iebH0-0004P4-Bc
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 03:53:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iebGz-0005r7-EE
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 03:53:38 -0500
Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146]:57768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iebGz-0005qb-7k
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 03:53:37 -0500
Received: from player711.ha.ovh.net (unknown [10.109.146.86])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 4C5E8147515
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 09:53:35 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 35262CFBD502;
 Tue, 10 Dec 2019 08:53:30 +0000 (UTC)
Subject: Re: [PATCH 0/2] hw/arm: ast2600: Wire up eMMC controller
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <cover.da2612e7c1835c563b20851f0ac26c7b175428fc.1575938234.git-series.andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <378a875a-17c8-3b35-9753-2158e86c5412@kaod.org>
Date: Tue, 10 Dec 2019 09:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cover.da2612e7c1835c563b20851f0ac26c7b175428fc.1575938234.git-series.andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6705296898481425216
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelvddguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.41.146
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g1J3WyRcPt4f

On 10/12/2019 01:52, Andrew Jeffery wrote:
> Hello,
> 
> The AST2600 has an additional SDHCI intended for use as an eMMC boot source.

Have you also considered booting the QEMU Aspeed AST2600 machine 
from the eMMC device ?

C.

> These two patches rework the existing ASPEED SDHCI model to accommodate the
> single-slot nature of the eMMC controller and wire it into the AST2600 SoC.
> 
> Please review!
> 
> Andrew
> 
> Andrew Jeffery (2):
>   hw/sd: Configure number of slots exposed by the ASPEED SDHCI model
>   hw/arm: ast2600: Wire up the eMMC controller
> 
>  hw/arm/aspeed.c              | 15 ++++++++++++++-
>  hw/arm/aspeed_ast2600.c      | 23 +++++++++++++++++++++++
>  hw/arm/aspeed_soc.c          |  3 +++
>  hw/sd/aspeed_sdhci.c         | 11 +++++++++--
>  include/hw/arm/aspeed_soc.h  |  2 ++
>  include/hw/sd/aspeed_sdhci.h |  1 +
>  6 files changed, 52 insertions(+), 3 deletions(-)
> 
> base-commit: 6a4ef4e5d1084ce41fafa7d470a644b0fd3d9317
> 

