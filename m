Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp925683wrq;
        Mon, 4 Jun 2018 11:26:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIAYunAH7NU6bm194m99ESSDZqRVAyOM0Dbbt/aYOeG8dxS7p9/0DwnpJIxpZIvC9G0kTGe
X-Received: by 2002:a0c:b753:: with SMTP id q19-v6mr5719552qve.82.1528136805662;
        Mon, 04 Jun 2018 11:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528136805; cv=none;
        d=google.com; s=arc-20160816;
        b=j3FL++EH/5cgBn6J4OEzaaZvQYlK5fR6QKE4BSgVFNheJC4wFzZb5AtRQbDzi9JZCm
         DT4XX4kNHLo6fi3YtqX7mhNgws7AtreAkKb62d8e5Gx8MA5JDVnHCrImWUwQZXb9F/Jl
         5hxLu7d/uWoBMYOXi4rdAnkW9Wy/6z1hkfw2klhs8QQEUxVqeqXRC6c1YfpjzfyM6OhD
         U1fv4Re07DkN55wjMTQv9kw0Y7zdovFUlPKg4tlFljFZpehbqBcc0jvFhuUge4TnsFYe
         MxNeyYAyzVQ4AKd0VkdBVQgzF4xNHeDhz8uldXIyI2H7BEk21ohkncrysuA2/8SO4y8c
         +clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=znNTupQMpEXwVj5kKHgADbl0V5ZFdUAP+pn/zWe1fLI=;
        b=yM4aaZ8X2XySVt9Yzyw1mWezDPNuxpOY/NXHGIizZ3wrX0pppiuMduXmy9yhTnBBU6
         EqSB/EF9IIbA0vIMKpkFrieOsKlyv0AZEdRIqssEEa3v1KiDjCX8pxzRZmb4jslYJ6jA
         kSHmmMwcY7Yp/MuFB1w5xEd/drEAUBdctpbAVWEqJq+SGvUKoxiLxm/Y+aDABxcgRSWM
         qMveviYEPtTe+5hOnTadVSkAJnX4lKdqSgLPJRC9bo3LI0MTYCkFq87a+R4XakxbggbG
         3asPJHQNtzftWjODiHIZhFnVGhJtzjnnfEPgl1HNqkllionb6GLGE4QwWdkB8dWiE5hg
         n4fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F7evDW3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52-v6si3270671qtv.160.2018.06.04.11.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 11:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F7evDW3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPuBp-0000bt-6a
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 14:26:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPuBh-0000bm-U9
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:26:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPuBh-00027t-6y
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:26:37 -0400
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232]:38195)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fPuBg-00027V-VR; Mon, 04 Jun 2018 14:26:37 -0400
Received: by mail-lf0-x232.google.com with SMTP id i83-v6so14584616lfh.5;
	Mon, 04 Jun 2018 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=znNTupQMpEXwVj5kKHgADbl0V5ZFdUAP+pn/zWe1fLI=;
	b=F7evDW3+bXLwP3Fpg4HVNj7UQXZudaxRh9TCTkrkCkajuCrRn4W9ECsmhv4eUdM8V8
	cCh8fKE/ivQnOkRyptmovGvx64YhMoDSCnIDMpVX9PKm9/ZlIFK9fW3khGi4o0GF6chz
	5ytwbG7wsDffDXdwHL9viuARO8T+FXNYPA2KLjsa80cDEjqdgaFKzGIzc6MNAMLj+9Gu
	sQ7Xlo4fxnjbm9IuFJ29Gwffpm1O53I2UiS2ocI1xuLwyqZ8RnMbQ7RF/tTj8bOucsDQ
	gCkz2OmIhfQs53xMvdzlByEPwvIHlanf4aXFGuNFRjakH33KqypI5ScNsYKMv4JvwGhG
	qm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=znNTupQMpEXwVj5kKHgADbl0V5ZFdUAP+pn/zWe1fLI=;
	b=eQGorqEsXlYmQ+PmhUQ7lPhfBQtCNzAwu5LgpXzQy1A6RKIfvE+n4K6PjfXZQohWkT
	AtFU+f7eH6K9QwKsRq3dCiXNhgFMpqqVHEKkeHzv7v0z/hCpYD+t1rJ35U7b25jHSshw
	A/HL66LkgHu+vx0XUVW/6miawveWpgZxGr3jz04/tBCnWGGjNvA+uVwbCmUqmQGWKcKD
	/jPp309JyJWsEYpTf982WcmAB2fgkkZ1Bb0U/RqRXZolW/iyvde3h65Q+hlZ1O1Y5rGU
	cXSBwDKUvzoOLE6PelxFXWkp6g1uUOAQaN+cOMWFExgEACKniWhlHf5PbGX4UvxSQ7Hb
	DL+Q==
X-Gm-Message-State: ALKqPwfKrEPnAvUGr1aLzdGV3wtGHajPysBIdr4xRBh+8t9Veh2X0hQB
	0e6QKllNm9FSk6Noa1v4Eefrb7SwW6+5glHR6Po=
X-Received: by 2002:a19:eb4d:: with SMTP id
	j74-v6mr12861689lfh.1.1528136795723; 
	Mon, 04 Jun 2018 11:26:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 11:26:05 -0700 (PDT)
In-Reply-To: <20180603000827.30872-6-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-6-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 11:26:05 -0700
Message-ID: <CAKmqyKPRbvPF8gSwpZ3e4xzbpvb0sii=HF7Av==F-chDqBojzA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/8] hw/sd/ssi-sd: Force cards
 connected in SPI mode to use Spec v1.10
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QbuhrnFa78ma

On Sat, Jun 2, 2018 at 5:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Can you add a justification for this in the commit message?

Alistair

> ---
>  hw/sd/ssi-sd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index ae04b6641b..c62fdc871c 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -253,6 +253,8 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo =3D drive_get_next(IF_SD);
>      carddev =3D qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
> +    object_property_set_uint(OBJECT(carddev),
> +                             SD_PHY_SPECv1_10_VERS, "spec_version", &err=
);
>      if (dinfo) {
>          qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo)=
, &err);
>      }
> --
> 2.17.1
>
>
