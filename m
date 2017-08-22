Received: by 10.223.188.70 with SMTP id a6csp5049086wrh;
        Tue, 22 Aug 2017 07:59:11 -0700 (PDT)
X-Received: by 10.55.156.13 with SMTP id f13mr1411388qke.141.1503413950947;
        Tue, 22 Aug 2017 07:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503413950; cv=none;
        d=google.com; s=arc-20160816;
        b=alT063Hs6CPlu2gvT8vowCaRiX3f9flogtMCZjIynl6DTpW0yZNVEyX0zPD49mIhWP
         mTO2t64qWX2zq2sUE08NjNr15kXFfPEfcYgcVrUmIMvZR5LnNPWn9rKA6NvEvhf5hsC2
         cHY0Ewm/LjAuTf22GGRN90QlVFvua9jfnJyZEe7LXKUWTDt3KhvTWNRMULP2UvDMQbNd
         H0aeaFetdiGCiAuEVl0Ik+8nBeOrudGmQHmPB7C/aqgHvAS02uRou0jlar6GxxK8SjDT
         OY8kIOSuH7yMMPd958HPIIg1wUip7vXrGIv179hgCm7PWMu3R2nhINUJiLljiOh90Cmh
         Xt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=X1KF/bN9NiYYgyq4/biIbGfrVrTs9kE+ZBAHFbkdDro=;
        b=R4VC+VIA5cp+SXuvQPt6j0KJvCLX2QjafrSP6XFlZpGoL14HbiVQyprv1k+C2Nz93J
         3b8COTvTXK8nDJsjYwzR7fMdlTYnpxEXob1dIuWCuKgpkGegSJKQGlikbxR8cEJEscCQ
         iA/BqmQ/fs6cMn5xPqWyyjXgiWUv17IrPJkQfPGVTQryCYQkuynkH+sIL+lPqO1lPx04
         rA+Xkny1RMEi8f8tgecXW6wh6vAx6km9PoJj+4AmHFgkgEH4C02h+paS7chJvJle0VI2
         HEW+EtrXIZ+331sPN1tiaM65h47kA9Yhf2apum4OlOjcm3muRuQQVj9f3nW/UKXpCOjJ
         o5bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n68si13965350qkc.220.2017.08.22.07.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 07:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAe4-00054p-Qo
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 10:59:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dkA75-00019I-A7
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dkA70-0006lb-QZ
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:25:03 -0400
Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146]:33930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dkA70-0006gu-KT
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:24:58 -0400
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id B6EFB76D9D
	for <qemu-arm@nongnu.org>; Tue, 22 Aug 2017 16:24:49 +0200 (CEST)
Received: from zorba.kaod.org (i15-les03-th2-31-37-69-229.sfr.lns.abo.bbox.fr
	[31.37.69.229]) (Authenticated sender: postmaster@kaod.org)
	by player789.ha.ovh.net (Postfix) with ESMTPSA id 5AD5426007F;
	Tue, 22 Aug 2017 16:24:41 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm@nongnu.org
References: <1503406059-7280-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dcd40ede-4c47-9f61-6082-c5d85e0903f6@kaod.org>
Date: Tue, 22 Aug 2017 16:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503406059-7280-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4517391902168943424
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrtddtgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.41.146
Subject: Re: [Qemu-arm] [PATCH] hw/arm/aspeed_soc: Mark devices as
 user_creatable = false
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WKcrcvveInKM

On 08/22/2017 02:47 PM, Thomas Huth wrote:
> QEMU currently aborts if the user is accidentially trying to
> do something like this:
>=20
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add ast2400
> Unexpected error in error_set_from_qdev_prop_error()
>  at hw/core/qdev-properties.c:1032:
> Aborted (core dumped)
>=20
> The ast2400 SoC devices are clearly not creatable by the user since
> they are using the serial_hds and nd_table arrays directly in their
> realize function, so mark them with user_creatable =3D false.

yes. I suppose we don't need to instantiate such an object without=20
the machine. And even for unit tests, we would rather use the=20
individual controller models.

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed_soc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 5529024..7f1be04 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -338,6 +338,8 @@ static void aspeed_soc_class_init(ObjectClass *oc, =
void *data)
> =20
>      sc->info =3D (AspeedSoCInfo *) data;
>      dc->realize =3D aspeed_soc_realize;
> +    /* Reason: Uses serial_hds and nd_table in realize() directly */
> +    dc->user_creatable =3D false;
>  }
> =20
>  static const TypeInfo aspeed_soc_type_info =3D {
>=20

