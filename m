Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4035212wru;
        Tue, 7 Aug 2018 03:29:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc5nibhU19hGq7McUaUWOskjr9b0uMif4Zt2tX8i2+WffSPKTqafIUPiEYe4p7X2PNkxyPp
X-Received: by 2002:a0c:b9a9:: with SMTP id v41-v6mr16085847qvf.63.1533637781708;
        Tue, 07 Aug 2018 03:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533637781; cv=none;
        d=google.com; s=arc-20160816;
        b=06UsSiMxIERQYECHARjrYz/5LFgUf3jMz84ODTw9C+QkTKghIYHqpUZL2CpyYqXJmV
         5mi+ULvCOzxswznY/IvtYWbsF8YNFXx6dWsjeZQwPCJzVSG8K/iWt/3A9ZUnzFYVSBPr
         qI4RdFDH6jytzSDWis9TTVkItFMZ8TdpvwCfyjNzzFkNtspSjELnXbLutObhTeZ5h+Hb
         xIbKDtJV8igGBX/QvYbXFr1vQG/umx0VayX2+0OuD0kB+aZeBRjcdunsiwlZ2KY3PWl8
         5hS+JlAXjMv1Fq5qy+Q27FeNCkOn9p18aFyjus9tmo4fPAE5RFvK0tgOIlFA+iFpwPtL
         I6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=eUw925LKPCgd5qaUzKox8EQEYOwenVEA7WxDNyyf97Q=;
        b=iliX+TStPjzwyfCwB5VXKcqZPM/fNJ0nsOPaMJdbtJEXIQojGJ/cIiZz9C2sfqdfqz
         5SZcj1cd2/Ro6ErQKXLcDr1CDKo5iqlyvKmOI1mt6HhgCltNQLOcGM+6SC5MoI5AXGYC
         JvbnTzfnxg9ZwMLG+jIgAUetV6A2g/83jBgJViWl19NZuGzaHCZUIAu/yN7JSBmVdlVe
         5cflX14uKUHYXy7HdLY0RQV1YODgnYLOAHZJRDQHu25fr1ilVc2zHhDA/lWaxv5mr3+j
         OEk8pGffWL6VKJ7szHGGem8Lg0poWhDSg+kjU+gg3cVb+rAuHqXvJD+8ROdnqpTSyp97
         kVkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v21-v6si934629qtc.391.2018.08.07.03.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 03:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmzFF-0000Zj-4n
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 06:29:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmzF2-0000XF-TM
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 06:29:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmzEy-0005KP-NA
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 06:29:28 -0400
Received: from 11.mo7.mail-out.ovh.net ([87.98.173.157]:55721)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fmzEy-0005Jq-GE
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 06:29:24 -0400
Received: from player799.ha.ovh.net (unknown [10.109.146.1])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id CB9FFC3326
	for <qemu-arm@nongnu.org>; Tue,  7 Aug 2018 12:29:22 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-237-83.w2-11.abo.wanadoo.fr
	[2.11.96.83]) (Authenticated sender: postmaster@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 80B1C5200AE;
	Tue,  7 Aug 2018 12:29:15 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180807075757.7242-1-joel@jms.id.au>
	<20180807075757.7242-6-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c47d59ac-c6bf-8404-020e-8dcc4c98758b@kaod.org>
Date: Tue, 7 Aug 2018 12:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180807075757.7242-6-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 8395272659168561984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddtgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.157
Subject: Re: [Qemu-arm] [PATCH 5/7] aspeed_sdmc: Handle ECC training
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
X-TUID: JWZeyucAbEmM

On 08/07/2018 09:57 AM, Joel Stanley wrote:
> This is required to ensure u-boot SDRAM training completes.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/misc/aspeed_sdmc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 522e01ef8c0d..89de3138aff0 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -27,6 +27,10 @@
>  #define R_STATUS1         (0x60 / 4)
>  #define   PHY_BUSY_STATE      BIT(0)
> =20
> +#define R_ECC_TEST_CTRL   (0x70 / 4)
> +#define   ECC_TEST_FINISHED   BIT(12)
> +#define   ECC_TEST_FAIL       BIT(13)
> +
>  /*
>   * Configuration register Ox4 (for Aspeed AST2400 SOC)
>   *
> @@ -148,6 +152,11 @@ static void aspeed_sdmc_write(void *opaque, hwaddr=
 addr, uint64_t data,
>              /* Will never return 'busy' */
>              data &=3D ~PHY_BUSY_STATE;
>              break;
> +        case R_ECC_TEST_CTRL:
> +            /* Always done, always happy */
> +            data |=3D ECC_TEST_FINISHED;
> +            data &=3D ~ECC_TEST_FAIL;
> +            break;
>          default:
>              break;
>          }
>=20

