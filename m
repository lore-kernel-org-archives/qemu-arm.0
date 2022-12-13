Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4365761ejb;
        Tue, 13 Dec 2022 08:21:20 -0800 (PST)
X-Received: by 2002:a05:6a20:6983:b0:a3:9d91:b6a6 with SMTP id t3-20020a056a20698300b000a39d91b6a6mr28906942pzk.35.1670948480548;
        Tue, 13 Dec 2022 08:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670948480; cv=none;
        d=google.com; s=arc-20160816;
        b=d/Wo4cAhzT6LoK8pyNa++ii4SSUpO8AiQeqHbtDXpzZPs/Gbf+7rbkl9zAZZWi7xX4
         uJVrFHuv1uYWBrtMgs4EQpv1VY73oNHmobSFOesotaHdHVpypFUmeT9rON0RZVEwiuKq
         y0ojntoFAJ/mivCnJiUYWXxO6aXUIHpW8wQ5DMOjWc4tZwrv4jMbJwMQvMscIuDusnT2
         6wYahcw7Q0eF0LIdwkT/EwrO6xUxhPROjN8hJl5TenTmlAcssIKDkcYxse4fAKN5YtrH
         S3WaLib7QjWYLhfcqvtt0vfj46yztNFCjiH8Y7TWAx/IJEprS8XV65xfSa+J0eb2Nh0M
         7M/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUJzdVuCSqgpXDZzQl1IW/XtnWjDNJ/FhnO4CajH7c4=;
        b=oHqGKxXC66onDJm4F2+1CukpEuILS5JlHNgvy4faN0khZdyz+24CxqkquYDPxMR5RZ
         5gqS3GA49jtU8MjwtZ7KUwLGJeXQZ6C8MWXRtpRBdgbhBa/TgHONnzKoVBM8HHXvy0Y2
         f/gvCgF510L0tc5kNCBL5dqZB16O2rC8CfmQRY3m8p4tp8ON5QKjN5ZrGhn94SINlejS
         rnLxeVeAXqa+bR1TjNT9rynVSZQxPZl3WEZ+J4pVpla21dWFOGOH8Dm/mbriezJ6pBU1
         ejrRvRI/5hwgw+bNMHu4xuLZ4zG24r7LHMlLiH10wNamC2FX4AlWsajqwcbIFM2/zzqQ
         PkCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxNVF9Wa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x1-20020a170902b40100b0018931c105a0sor89149plr.169.2022.12.13.08.21.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 08:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxNVF9Wa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUJzdVuCSqgpXDZzQl1IW/XtnWjDNJ/FhnO4CajH7c4=;
        b=PxNVF9WaIlRjhCmohmXFXGxH4oH5z0ZGHSrJ6EVF4EZGaEGonrzvCa+yD5qdCG7vKe
         UwXZxPSFEnPiiQ33sHqRJClayoVWjNSag5tGfcHFmYkirzbpjKHX96yltKu11MCwKGf9
         8VAeyf39rH5PmqPiFVsJABt2USj9FtlUdtuJGhRrD9mWXEq1poPZH5xkkGBILK1+mbvB
         k5jYZd2J2criWG1wFZL/2iksBEZJDOXDJsAWaI4LBBkJW3EF9aQQJgHWqrkZeFREMztQ
         1DADO0WixVRVRFXMHRV/Z1ecVVVHoJFo7VUW6DXMsK5HZD0821MiOiuQVObRGmBYQcqY
         OS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUJzdVuCSqgpXDZzQl1IW/XtnWjDNJ/FhnO4CajH7c4=;
        b=PDfvpR961ZDZOMG0MOaPzpme+5hEIhWyw0NTtBIhHfNs+w7csVzCDOAaN3Z9hItT9F
         kxRBMXARts1PwRbzc8tDeUqmNqhJbn/EIICTH86MK9k2JY+kSe3ZvJcSGNtjS/RXFeWw
         6/LUxCHzRtyg7xctLg7KOHBik7GULwsHX4qWeolcPdJLI0x3VKYvNOQYctEa7G/DdN+v
         EALKKy7DUCs4z8Olp3ILNMEWp1JDJX7sUGFfvZ3UXf9h0z5mQmzXXXdv1zx/0ZA7QOby
         FUHnL/Z/n2agpKxhmzKJkms7Qm9ALC2VwwTI2ZUfylZ09pk6RhBfrnG+t5uqFAw1QmKA
         /Jng==
X-Gm-Message-State: ANoB5pmxbJfEvl683fnX25Z3HBp3QC0A/9S+gLczwHlr8hO8KSHXelqj
	hX1/utXkx3yloX4me1MyjJnxBL/8zS79Cvif900UcdD9
X-Google-Smtp-Source: AA0mqf7c9lCl5V+TRz055X9bAdbeLcXe79ZFrecTimgw/c9yc781viiG0Z14kTi2aa8o/TRdAoSss4J+lxv28qTsHWs=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36106389plt.60.1670948480099; Tue, 13
 Dec 2022 08:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org> <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
In-Reply-To: <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 16:21:08 +0000
Message-ID: <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: pyxpaom1EWMD

On Tue, 13 Dec 2022 at 16:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/13/22 10:10, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 13/12/22 17:00, Richard Henderson wrote:
> >> On 12/13/22 06:52, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
> >>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
> >>> aCube Sam460ex board") were testing on a little-endian setup,
> >>> they meant to use const_le32() instead of tswap32() here,
> >>> since tswap32() depends on the host endianness.
> >>
> >> tswap depends on target endianness.
> >
> > Yes, it depends on both host/target endianness. What I meant
> > is we shouldn't have system code depending on host endianness.
>
> It compares host vs target endianness, to determine if a swap is needed. =
 But the real
> dependency is target endianness.

It does seem odd, though. We have a value in host endianness
(the EPAPR_MAGIC constant, which is host-endian by virtue of
being a C constant). But we're storing it to env->gpr[], which
is to say the CPUPPCState general purpose register array. Isn't
that array *also* kept in host endianness order?

If so, then the right thing here is "don't swap at all",
i.e. just "env->gpr[6] =3D EPAPR_MAGIC;". But that would imply
that the current code is setting the wrong value for the GPR
on little-endian hosts, which seems a bit unlikely...

thanks
-- PMM
