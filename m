Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp7285385lfc;
        Thu, 28 Nov 2019 00:48:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNt/DFU17P34Jo0//ffPSEbpzvm8V9uHOubHQ3KQUilNRZRT7FyysbtQKbJju0w7HigN1B
X-Received: by 2002:a17:906:240c:: with SMTP id z12mr54657316eja.35.1574930910165;
        Thu, 28 Nov 2019 00:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574930910; cv=none;
        d=google.com; s=arc-20160816;
        b=Tci6Qq2MoX35T4S4KhuMp+2ZGVSCh7ZIM7ZR9kqe8W+rHHcZN4CZYU4xMpXrx3eGn6
         hm2n9a/jcX/P1KKdD2YULuG/JSyyZP9qzLwguw2gQI6Jr1X0Q+INReoU57vh5Pvy/bdB
         G+m1VSBJavvAyKKLp7L9l0nSVzloTxalaJL6Dh5JFKjiJwv48qsaXjq8RkZhCql++Hpl
         H3fu7D+sSPZjsK62/pdj3ZDlG2b8ISDbAP+sILwxbokawYhFh4JFDvRsJfkGgoIZyovy
         nJ+gzgT4/RkI/ElmIhmAvxlE+nmGpETjXXeRX/Y+6Hzm2zZdfPWGIuWIbL4w6ZlmmuB7
         51Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=WyZ/8NX01owDBUWfu97x3OS1maU4D/y4vz06XVtv+mI=;
        b=Pn6PFpI3Xs8qcgyJPje5VjianbYXqwS2WQ+GAX7mmrW5bAvz7V1iRu2wIf6fENtVer
         0EpfL+jWMWyplrrRjWaEN9ZFGwfuWDmy1WMxNKmyQdKlpsMr/K327fLE4GZsWx+ho9ys
         rHNXeHBtu4/qDERZBxbzYL6e4QxC0N1tt+YBfb646R+VxEv7mHgCo/qT/Sgy3zkZM83g
         bhlEuslej+YOa6/8R+Pyn1YV8vomYTOXC59W+/ifRgR/ndtGcbX53UcxfAU/oKeP9SGi
         wi7v2q6YyXJfbIIbU2UdA8ry84q29DvqgN6Br6BLt413L+u+q6DHj1anJxZFFphmWWP6
         vkrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si12405769edw.361.2019.11.28.00.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 00:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaFTQ-0004yv-RZ
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 03:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iaFSw-0004xP-LV
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iaFSu-0008HN-P0
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:47:58 -0500
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:56745)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iaFSt-0008Dk-Ib
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:47:55 -0500
Received: from player711.ha.ovh.net (unknown [10.108.35.103])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 2EA43121D7F
 for <qemu-arm@nongnu.org>; Thu, 28 Nov 2019 09:47:53 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 39B5DC86E684;
 Thu, 28 Nov 2019 08:47:48 +0000 (UTC)
Subject: Re: [PATCH 4/4] ast2600: Configure CNTFRQ at 1125MHz
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191128054527.25450-1-andrew@aj.id.au>
 <20191128054527.25450-5-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a63f07ca-8d20-5c72-196e-15ac38855936@kaod.org>
Date: Thu, 28 Nov 2019 09:47:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191128054527.25450-5-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9923681779062508352
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.43.93
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
X-TUID: Mv4HuXDSIAKp

On 28/11/2019 06:45, Andrew Jeffery wrote:
> This matches the configuration set by u-boot on the AST2600.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed_ast2600.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 931887ac681f..5aecc3b3caec 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -259,6 +259,9 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
>          object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affini=
ty(i),
>                                  "mp-affinity", &error_abort);
> =20
> +        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfr=
q",
> +                                &error_abort);
> +
>          /*
>           * TODO: the secondary CPUs are started and a boot helper
>           * is needed when using -kernel
>=20

