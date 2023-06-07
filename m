Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp77360ejb;
        Wed, 7 Jun 2023 00:54:02 -0700 (PDT)
X-Received: by 2002:a17:906:730c:b0:94f:956:b3f7 with SMTP id di12-20020a170906730c00b0094f0956b3f7mr4957538ejc.2.1686124442701;
        Wed, 07 Jun 2023 00:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686124442; cv=none;
        d=google.com; s=arc-20160816;
        b=is3G/1oN7CyZlHXfbehsgFw5gfnLOvHCs7VceL/3JBtSNCDuxyleAbfZoolaIi9wtR
         i705b0tnwjGr+sIOfKgWT5N4If/yo4nAYUBRN8kWTzrN85pv4Dhm2fK6Ok9SgUr8ryQV
         L6r9Mnv3CgM3v1wcD4PoZKO1PZLUFDL/LrqT7BaAf4xXw9GB9vjj+GrtvYLKmgRd9tnz
         iHn4dgg89nym8MfDxvfqnfDiwLxfEAeDqZNxUV+f1r7sebEe/mJF+yy7uiUQvALqPsBm
         IhPrFdZD09Sgs2tTdCRpbYh57zPg52iykz/5BWYLhYQ/Q3HVCkLMjVWgIB9KLsA+2yCJ
         JSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xfuzmuAuP3RR4ZsC7WG9jVcLx4gB5TI2PD98uD8BcDw=;
        b=njhKO2v9ZQM5xbRowKcAYFgOYkoluoYcE1rygoehYEdgdURQJpSfvThodlvfP5yjKu
         5O4mISncqXZN3qpgvyoQxmj3xIySmc4wikDUp/8L7XJbEUzYdm6A6YS1MKG9PY5gj3WA
         fLMEu7frhlpat2+hICToFGuQ4ivkPk/pjyyTQZT9D4DZyoZoi6wyEk7T3eF2kyVHLLL1
         Wub/NVf0y5mnlf6dZSHCL/8jbBuFt+XbG50olBNJK8T4zvtWNXxdXWol16e3us7pQ9aO
         5GHwrQ3s+CTvMLVAiyF9goemAd5l02FRpCNLo7wAe2slX8ucr5gVx2S5joC6PIjKm0zv
         TQBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=FIDvUgi1;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mx9-20020a1709065a0900b0097461f17db7sor4152325ejc.1.2023.06.07.00.54.02
        (Google Transport Security);
        Wed, 07 Jun 2023 00:54:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=FIDvUgi1;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1686124442; x=1688716442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfuzmuAuP3RR4ZsC7WG9jVcLx4gB5TI2PD98uD8BcDw=;
        b=FIDvUgi1mFm8aS7FEPicb6QopwKMD++7sWM4pY0s1g61xYVNkdCly29J6dTBJwpedp
         nxhTqkAXZBV7o5ncjXRMIfoo3xk1vnUcl1SXRCXUuiGCjy+hY7oX1PCgKfdbTfSgb7vi
         6aAjAzmdYI1Ms1WEYQSYCRl1UDvcliO0HP0EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124442; x=1688716442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfuzmuAuP3RR4ZsC7WG9jVcLx4gB5TI2PD98uD8BcDw=;
        b=LrUW5+mE9mu/AqLvYrrnD6c/i/8VQYNItOZFC+9uvclH8G47SpAh01S1Jpvm8M3aEK
         bWc8fBOU88V6j4xRnG6OJ4lAs9q8fo/VHUhV0C3U+eiC+SHesSurQCozRXjHT9ikahQD
         C9AMYcuNFXg5+0Zq4Y/wVXYC89//vyoYmtd6VXmm1sJIUXpMyEI7aVVNswc/v0Kv7rG/
         adhSJ10xPJkDHl59tEx4lSBKa88HGcJb1FUIpHh0/HOzzON1Qxo5M08L2VI5tTwYI99E
         uTq8Oi4gHSujObbgOC8u+kScorefEhPAJf7YMbMHN9dzT1sj9FWMM+0EmzlJaYuc6mCq
         PjEA==
X-Gm-Message-State: AC+VfDyCqJwlS03EROx3qLdEWyOeifIezNasxefQIiv7MvhofNb80VqX
	5FSlFxVL7LBnZ1kG882My84DGb5KkSFWIMJPdT4=
X-Google-Smtp-Source: ACHHUZ6nUNVqLVceMfZ/lYyekJkMD6qN0MS5V9qOi02P3LJ5Q9qgTtx6NqyybKhGTl5PWdC0+tFYb5fy3j/wfIfvQkU=
X-Received: by 2002:a17:907:7f93:b0:96f:bd84:b89c with SMTP id
 qk19-20020a1709077f9300b0096fbd84b89cmr5692744ejc.70.1686124441590; Wed, 07
 Jun 2023 00:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org> <20230607043943.1837186-2-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2023 07:53:49 +0000
Message-ID: <CACPK8Xe1GcR8d0=_aYQbKtVxGMnA_jeJc9fd7BBD6g+kWwxyKw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] aspeed/hace: Initialize g_autofree pointer
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Steven Lee <steven_lee@aspeedtech.com>, qemu-stable@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xtKi+Z2s93Fz

On Wed, 7 Jun 2023 at 04:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
>
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
>
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Was never a fan of using this magic :)

>
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-stable@nongnu.org
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> Message-Id: <20230421131547.2177449-1-clg@kaod.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/misc/aspeed_hace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 12a761f1f55d..b07506ec04ef 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int=
 algo, bool sg_mode,
>                                bool acc_mode)
>  {
>      struct iovec iov[ASPEED_HACE_MAX_SG];
> -    g_autofree uint8_t *digest_buf;
> +    g_autofree uint8_t *digest_buf =3D NULL;
>      size_t digest_len =3D 0;
>      int niov =3D 0;
>      int i;
> --
> 2.40.1
>
