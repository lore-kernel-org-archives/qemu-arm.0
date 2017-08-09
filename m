Received: by 10.25.221.202 with SMTP id w71csp636680lfi;
        Wed, 9 Aug 2017 01:59:17 -0700 (PDT)
X-Received: by 10.55.164.17 with SMTP id n17mr8832350qke.325.1502269157579;
        Wed, 09 Aug 2017 01:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502269157; cv=none;
        d=google.com; s=arc-20160816;
        b=u/6PcJLDBCaw6KdR6EkHo2mjovx+RZz53P4bYrCwytj5+BEbtMMYxbe+y+1FSfzabT
         uIZc0fL7xBfyd86Id+dGB7ml4p7FCIJlTKGeWXFqblOeZmo5pb6bI6lckyxii20KeF1Y
         ngwDVLsMbdj2CX7OR39xo0dLoC2/isPG4bf87IVIIob4yAMcG3wyfDCECT+C3xu1hnKE
         rrUpuEmsf1gQe18SdgdVUsPIYO6YPtF5UF7pZCO2j94389VlAeB+qO2aDqe6Ijt5HlTM
         Vasm+QyLxKDL9qGPh0KSJkNX+DXOXE2elrUyIahWxFO8aOzvjJ1LPtHKKiwGXxA2mpRj
         E7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=K87ierkmkaorR/YMe1kAbuaVDv3wWy0on8f0BWNVTts=;
        b=BbfuHyVuD+hRLfksGzmY21MyE7RvzGP7LxsID1PDhN+4gjCca+qof3ujvKFoGr1wEC
         i5edyOgJVc1KmzssF7C7EQwFKxobHH1m1Uz94ZvjyUcUVEY7HP/Ptkc9ulk8Ad8uZ5Cf
         /AiToSJ5VOJ+WZI+wYCI+ZkYh8C/huw0ZMd36NA3ygkUOTKAxiRezjcciB6dGna06e8V
         uojEVtq8W2sjUA/lxc0rSsWJcibM4W+nUamsTjt39HN1hxjJRjAIlE52kO3+xQU2ramP
         1SD3iOM6KPSYXMvsEwJoszrHffhIi1BkjgdTLnPupULuB0Jkrl9P+8lq/R5HCA20Zy3Q
         mqrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j23si2753207qta.267.2017.08.09.01.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Aug 2017 01:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dfMpe-0002TS-TM
	for alex.bennee@linaro.org; Wed, 09 Aug 2017 04:59:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dfMpX-0002Rg-OE
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 04:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dfMpT-0004No-OC
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 04:59:07 -0400
Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154]:44102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dfMpT-0004NQ-HO
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 04:59:03 -0400
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 2A4D9743B2
	for <qemu-arm@nongnu.org>; Wed,  9 Aug 2017 10:59:02 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
	[90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id E273D7C008B;
	Wed,  9 Aug 2017 10:58:54 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20170809062828.3673-1-andrew@aj.id.au>
	<20170809062828.3673-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78e09d93-ba07-c882-8830-737691f83a3c@kaod.org>
Date: Wed, 9 Aug 2017 10:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170809062828.3673-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 14904100021060471554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrkeehgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.39.154
Subject: Re: [Qemu-arm] [PATCH for 2.11 v2 2/2] ARM: aspeed_soc: Propagate
 silicon-rev to watchdog
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com,
	openbmc@lists.ozlabs.org, f4bug@amsat.org, qemu-devel@nongnu.org,
	joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ycPKvs6JiU0Z

On 08/09/2017 08:28 AM, Andrew Jeffery wrote:
> This is required to configure differences in behaviour between the
> AST2400 and AST2500 watchdog IPs.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed_soc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 3034849c80bf..79804e1ee652 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -183,6 +183,8 @@ static void aspeed_soc_init(Object *obj)
>          object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_W=
DT);
>          object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), N=
ULL);
>          qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
> +        qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
> +                                    sc->info->silicon_rev);
>      }
> =20
>      object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC=
100);
>=20

