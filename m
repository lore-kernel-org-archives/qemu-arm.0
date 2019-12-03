Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1099908lfc;
        Mon, 2 Dec 2019 22:20:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqylr0mzMZx+CkJkY1kptEdK9OA4zT5CspCzvHH4DXEuylrrBpJYtyo/0eY/WGpsc/popgl5
X-Received: by 2002:aa7:c595:: with SMTP id g21mr1304111edq.143.1575354038170;
        Mon, 02 Dec 2019 22:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575354038; cv=none;
        d=google.com; s=arc-20160816;
        b=lSC3KnM6dPYMwCZVzUJu78JlTuyFVJ1WBJBLZyE0c4WqHbehCN1f5NWpVm93PUaSCO
         zNP4qe0wnkE4xyS4wgFRdSz5iFv6ZXVNqdFSUXMQYqFMePtQ68O8C07ZbViFPJIbfw0I
         tDikyCzE+2OP/hiLJvAOHEaoPSTN2sdIOlufG+valTFIYN7sgt7FvZVvQoYcYhkSMyiv
         6g85VZ+NTcQg2V5nqmLfOWeb+b9bvZhn82Hqis+EU72AGcSQtZy2it/P1lOI2BnByAp9
         eQZQOIN9zXOXNVTdJtLjmWcqts2d9MHG019Blb8woVYZAo6wHorGX2H4oyuQBj1j0qNq
         9O3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IowVLIFpCNfUQQivs6ggVTO0eknpK2SZq4cU1OclQ1k=;
        b=oaoT0svbTL7JelUvUvdsPzwW20JHARVD9IjG64NiErBfFt69Sei7E4eV1WXsZf0w87
         oWj2z31Qhtma1VtZr+YfIvNZUb0+ejjJU2/KTKRAct3bvG8/aAG4WunLy+bl42WQs3KK
         ew+fq6IbPqsu9Mb31wxYcfTbLgYs6UEQ1MKxgPFvAk8PTrz9tcJP3QOEPmJD1enZsuBm
         a8XBdEQj47UOLkHWcsuCaijcKwLmfPASXBc6YUZtlwui6BosV5yhefZoOaOYPQ5guJ14
         Rr0g+bCkD8HaV+6JepfLFCIQPrWIfgMqTGse8mAR8HBL2Bfid/wbf59RA/U94DJZd95K
         mdkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bJhIdK7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si1468068ejj.307.2019.12.02.22.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 22:20:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bJhIdK7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic1Y5-0001Dd-1o
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 01:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ic1Xv-0001AT-1N
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:20:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ic1Xq-0007r6-TG
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:20:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28567
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ic1Xq-0007pX-Oc
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 01:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575354022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IowVLIFpCNfUQQivs6ggVTO0eknpK2SZq4cU1OclQ1k=;
 b=bJhIdK7bJutgMe4hB5ZPefgcvc/h4p3SxdIC3g/3LfgcsWhHqORLfIvaZ8q0k+oVwycs79
 S8659XHSpA7LhAK4gtSFLzGvjge2FxNczAhVyBhegZBzHpfzqIwPOTxu0XB1OuK23FHjn/
 fdoM73+v4x74yMbOqBBQNhrfx9o1MGk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-H_EgDfNpOBOuuu40N5RzJg-1; Tue, 03 Dec 2019 01:20:20 -0500
Received: by mail-wr1-f71.google.com with SMTP id z15so1245418wrw.0
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 22:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jWwm6mWogocAZy961+vligZwjtpQocl6XWYfy+GpYlc=;
 b=TEUDcyfLfWJZbRAueEIpZX23j9E8ujZ8qheazO1uU83tqKGmwLjUsalVBVeihmaBKE
 5zT+OwbbLEeDizhfKzGVF0d3evJ6PCiKK+EMygt0iLFXRpqHH0Do7OpxeLrnFKpFgBkV
 HXJKnPqc0RfJ2OtM2EQFuIebhUZjMCSYiQiGtsd+7Wbt2RAedl+HdLMVrA/u/WUGsdvn
 8ZId9kDVzlid0spTgDgi1iC1+74IvqOTW8GlTn7fw6N8aIA9NNLoJX+rW0p/02GaCw5r
 XjqFmY6MNmuLqv44P/uZ5WoydHx+iRhj8ICTuxuD/4zqAHpoNojGd2JfmfJ1v0eWA5NT
 yeRQ==
X-Gm-Message-State: APjAAAVhbx4FLmvSCLWBJaQ82qO3BejcEYJr1qlvnQlHQg00uL9aw3CA
 KztlkjvI1Pfc4eQw+/ZhBG6RPgELHrW80H1lAbZQAr65Qm3McYpy1lrDniE+FluumAqMrKWG5b4
 HBJ1Q/x97yOiE
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr30580687wmh.74.1575354017939; 
 Mon, 02 Dec 2019 22:20:17 -0800 (PST)
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr30580675wmh.74.1575354017742; 
 Mon, 02 Dec 2019 22:20:17 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id x7sm2157117wrq.41.2019.12.02.22.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 22:20:17 -0800 (PST)
Subject: Re: [PATCH v2 4/4] ast2600: Configure CNTFRQ at 1125MHz
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191203041440.6275-1-andrew@aj.id.au>
 <20191203041440.6275-5-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eb5b731d-0247-2427-60cf-35b9166f8de7@redhat.com>
Date: Tue, 3 Dec 2019 07:20:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203041440.6275-5-andrew@aj.id.au>
Content-Language: en-US
X-MC-Unique: H_EgDfNpOBOuuu40N5RzJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: joel@jms.id.au, peter.maydell@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CM7Kf/sF2Oy9

On 12/3/19 5:14 AM, Andrew Jeffery wrote:
> This matches the configuration set by u-boot on the AST2600.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed_ast2600.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 931887ac681f..5aecc3b3caec 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -259,6 +259,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
>           object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affinit=
y(i),
>                                   "mp-affinity", &error_abort);
>  =20
> +        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfrq"=
,
> +                                &error_abort);
> +
>           /*
>            * TODO: the secondary CPUs are started and a boot helper
>            * is needed when using -kernel
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

