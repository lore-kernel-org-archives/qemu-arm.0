Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3839565wrq;
        Mon, 25 Jun 2018 06:55:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIFo/CudOUCVlDepkqsRHuN9S2NFShbEOatmBXXe/xb7BxkEZNuNEzm2kvANsw1wyfCGNCD
X-Received: by 2002:a37:4917:: with SMTP id w23-v6mr10506381qka.328.1529934910219;
        Mon, 25 Jun 2018 06:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529934910; cv=none;
        d=google.com; s=arc-20160816;
        b=SJAp13QjqYu9EsDVnFOM/qsru9zp2+5ldd/7PfNf4iD4cfirhJBgO9eMZDJH82TkWg
         h2b8vE+hV2R9WWa64pDUMOyrPDFapMxpry6PA51mgiG5xFr9EAqFR92UB0iXdtmITfTN
         GJzFgxeUh93BA1wIt8Nl44xe5n1W4S+tBYjdG4Cz2GSf4q5EiK1lluezNgpVi0qe5gN4
         6q/BI7fK5t88CeL02gbWgeARuNOQMKhT7SvSzu7ACKbb8qiPa6ZVp1wZ/REOIGRPJcjo
         oE2IefOC7aNzuEFRhD2dvfkJ1p5wzDV+v3mVN8XnoCk4KzghBVdLU2x6KXw8uA/pbBL/
         KzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=9pqYFUIWlD1dGhkOd0hRG6k1MWXs5b06kBXu3k0sto4=;
        b=Es4XEPpZS1U58EgxRZnfYTtWmvSTxeDgeVgKKQopnpspFYluoPPpfHEVmkeetgjQyH
         22b7kFdVVX5T7X+zDG0GOsOoIg3X5Tc/RohARDXfxbwFGQGocanDiBnttIN8vyMxslwh
         9CjMWi7hWrCrhlwQkaaIDdP9JfxOKPK0YXr6rMZV1N063aBR7TJww74S5zMVy/eEa7pU
         9kE7NBihQ6jWnPl/ReDGkFCqoaCdOQNRi3QHNtF7qcFKur/GtycmKwdOaz4O1ryI7+9c
         T8czWwAyQd0Ipiuos+wB2ASLjCXpo1qJMpXtgfjavWcvRRO9RFL5/V7EfNoOA0OgSB6Y
         YQMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m55-v6si7497712qtc.214.2018.06.25.06.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 06:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXRxV-00072B-F6
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 09:55:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fXRxJ-000700-V5
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 09:54:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fXRxF-0007ct-JY
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 09:54:58 -0400
Received: from 10.mo177.mail-out.ovh.net ([46.105.73.133]:33938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fXRxF-0007cN-Dj
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 09:54:53 -0400
Received: from player778.ha.ovh.net (unknown [10.109.105.29])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 1AEAEB5D06
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 15:54:50 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player778.ha.ovh.net (Postfix) with ESMTPSA id 4AC641800B0;
	Mon, 25 Jun 2018 15:54:45 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180625110721.22485-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <98b1f333-2348-9703-cf79-3375194455cd@kaod.org>
Date: Mon, 25 Jun 2018 15:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180625110721.22485-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17593874897398958912
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrudefgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.73.133
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Add ASPEED BMCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lTDrJbBMz3WX

On 06/25/2018 01:07 PM, Joel Stanley wrote:
> This adds Cedric as the maintainer, with Andrew and I as reviewers, for
> the ASPEED boards and the peripherals we use.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2874ddce6097..14bcf2ed3e3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -644,6 +644,17 @@ M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>  S: Maintained
>  F: hw/arm/msf2-som.c
> =20
> +ASPEED BMCs
> +M: C=C3=A9dric Le Goater <clg@kaod.org>
> +R: Andrew Jeffery <andrew@aj.id.au>
> +R: Joel Stanley <joel@jms.id.au>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/*/*aspeed*
> +F: include/*/*aspeed*
> +F: hw/net/ftgmac100.c
> +F: include/hw/net/ftgmac100.h
> +
>  CRIS Machines
>  -------------
>  Axis Dev88
>=20

