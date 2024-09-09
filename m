Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp878396njb;
        Mon, 9 Sep 2024 04:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGNfqkSbvIsbtSYZ+B3p+XUHcAMFlf22xa++eZrto2K1puiKEnsf080soJNfp1nycqslyAXjaM4/zvNw==@linaro.org
X-Google-Smtp-Source: AGHT+IGJZxC+1SWU6+mmELgTm8dZNqyI0lUZpg4K9NS/4dYaZaD08/kNPwxkzEV7zQYbtTOqaO4P
X-Received: by 2002:a05:6358:7212:b0:1b8:3635:f1c2 with SMTP id e5c5f4694b2df-1b84bdfe79amr903503455d.7.1725880878622;
        Mon, 09 Sep 2024 04:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725880878; cv=none;
        d=google.com; s=arc-20240605;
        b=DavO5jQqLoqQxwfmeU2wFa/P/yzJ+IEiBp0llFywZrnWHOb9IzVJRdFS88vCTpSe9H
         L2Y1gOJkoe2+e/Fz1dsZP6qrTCzcVVCt7jPW69BmrtOibz5xICNiNyAdcesQqvpD4Wrr
         U7NW1GRRwtkUr5U8HSbJjSqw0WVEN7a00FtGwYHgm5MzrHTTzjMXBt8n5glMKgWcJKEC
         qZVycAS1DFTlUjvkvvNChX4dNlq7wSI65umXE8Hh170NynNlLiM2a0l4V6zkmlDAlVJC
         GwCla4rWl4DdvwrKXlvKGFpSkeonOpOMuJlDkG99tHG/BYEx54RF5dmDNsNUbOshRy/Y
         PWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=irer1V6l7mG0hprnra+r4ztdIPPVdoCTIegsCYsMWFo=;
        fh=U6elvkaaQXSnExlHdvvHQcW6Hh0L0TluXfvYnyrfxpk=;
        b=QacslT/lTkTBFzVSoqFl/j5nS4CbGtCIVy+qfW7PuhxTaT+UztViPNZyV3A5nktHT5
         DrbawNVqSKSDj/1YQ65/cWglZgy4NLICL9ua/np+g0H8IHcNhU4W0gKlSsiiDQDvyhSe
         N3uGCbqSy8mZaQneRq54VWqggnQ6sYbHIjEcIBILSIsGPIBDXkx483FNKSaOKKfoFul5
         o9A0ZROtv0Sa1zHEy/SDRV2jl2t5fAfMVaCMT+26l4dct7DQ608rer/qOw6gaYGbgTti
         Q7Fi9qBHbOBIecpk81QfKhWQ2CtN9QPDI/FPxzJP1BuxjmjJQeI1WOsj2/NrQI38lVsQ
         WYqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=ILti6BCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a4a8b5si517939485a.533.2024.09.09.04.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 04:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=ILti6BCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sncS7-0003UJ-43; Mon, 09 Sep 2024 07:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1sncS6-0003Sj-50; Mon, 09 Sep 2024 07:21:02 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1sncS3-0008EH-85; Mon, 09 Sep 2024 07:21:01 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5365c060f47so3182138e87.2; 
 Mon, 09 Sep 2024 04:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1725880855; x=1726485655; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irer1V6l7mG0hprnra+r4ztdIPPVdoCTIegsCYsMWFo=;
 b=ILti6BCU0eKH9KfBSht+LlcCeTcf1PAkwGLwTgIc4MtRZurfhqo/UC4S5ixXtfbI0r
 p6OSxKmVcSrxox6+e4Ba+g1oL9dFMnWS4P6ramPnsDKbRyhoTrzOdDNoT3a633nNxGY4
 M4tBbGaLkx4edOpWcWZDbtRyVamEF2QIRSB7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725880855; x=1726485655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irer1V6l7mG0hprnra+r4ztdIPPVdoCTIegsCYsMWFo=;
 b=AO9rO7dgI0UXpMsL9jxf9eujmfwLcKw8tf7u8+BS7jFnMvZ0uriCRAU5vQZsjUtZO2
 9zBHwsu8G9qlipdo8IXsXebRNNuxRoWj1f0v96X58eZQhKF5Xy1+eyHo9dyCGr6n5txr
 hjcewaE3tifvgFMqmaEKIwiA3gtHh9lu8W+cvDJ0WIQaK82dsCrWZM8ThhRRetbLM/BJ
 sdZiYxabXtNC0v3TC9XU0zCIokR4i3cYsfwnr2c6V4sev2z+ZASxYVQNDVEbmeMyGt9W
 qTRud04t0Ut1R5ga3lb6TyHMbW65K81D8tOko3c/j94Tbk6/sH73PjwaF+l696zCIHGe
 Q2AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULgqSTDQo81bWUq5C5bS27oeAoKz9heSbWw6oBGG+Jacm6JUX/59Sp+SXbvwjuAxlLT421OSV6pLnzmw==@nongnu.org,
 AJvYcCVKnCy004cHVdVQZLVrOTx0pqvzpta7VewFjjVmJAPSUFXYFRtMqU9cJnRSzSkrJik0ZWT6rXY4pA==@nongnu.org
X-Gm-Message-State: AOJu0YwRztPaaPsIYbQtCS2JlY2QtnUkWeSKhrnGkIsNqEnoomxN+SB5
 JOeNSLoWZ1ZFOon35A68RDJFvSfgIcmeZouN7ZPGhIILuyjyeih/IeNSTQOuem7uFtjCRbFgJsg
 7TATT48XHtPCDEay50PtCAjQfR78Oyg==
X-Received: by 2002:a05:6512:280d:b0:536:536f:c663 with SMTP id
 2adb3069b0e04-536587aaf32mr8596744e87.22.1725880855167; Mon, 09 Sep 2024
 04:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240625070830.492251-1-clg@redhat.com>
 <4e04f930-e7af-4084-99a8-2a3139e2bf43@roeck-us.net>
 <5fb7342b-fa67-4cb2-b6fd-2241b7b76d03@redhat.com>
 <f70cb39f-3567-4322-b1c4-1bc5991d91fa@roeck-us.net>
 <8d1fd867-647b-4827-a2b2-a239618a7743@redhat.com>
 <014b83a8-d733-442b-ba33-a24c35e46f3f@roeck-us.net>
 <bdb443f9-376e-4d4e-8c06-9ba0c5482c5e@redhat.com>
 <09457da7-e692-4d9f-92b8-361f14b7a1c2@roeck-us.net>
In-Reply-To: <09457da7-e692-4d9f-92b8-361f14b7a1c2@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Sep 2024 20:50:41 +0930
Message-ID: <CACPK8XfqOE-GJWgUwC+Kh5r9nT2Jo42R2zdka54sURDiR70j5A@mail.gmail.com>
Subject: Re: [PATCH v2] aspeed: Deprecate the tacoma-bmc machine
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=joel.stan@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H/bFOmhQdAbj

On Sat, 31 Aug 2024 at 05:41, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Aug 30, 2024 at 10:09:25AM +0200, C=C3=A9dric Le Goater wrote:
> > Hello,
> >
> >
> > > > > I solved the problem by adding support for IBM Bonnell (which ins=
tantiates
> > > > > the TPM chip through its devicetree file, similar to tacoma-bmc) =
to my local
> > > > > copy of qemu.
> > > >
> > > > Hmm, did you copy the rainier-bmc machine definition ?
> > > >
> > > For aspeed_machine_bonnell_class_init(), pretty much yes, since I don=
't know
> > > the actual hardware. For I2C initialization I used the devicetree fil=
e.
> > > You can find the patch in the master-local or v9.1.0-local branches
> > > of my qemu clone at https://github.com/groeck/qemu if you are interes=
ted.
> >
> > Oh nice ! Let's merge the IBM Bonnell machine. We can ask IBM to help f=
ixing
> > the definitions (strapping). Enabling the PCA9554 is good to have too.

Instead of adding Bonnell to qemu, could we use the Rainier machine? I
know the kernel device tree removed the i2c tpm, but there's no harm
in it being present in the qemu machine.

The bonnell device tree should boot fine on the rainier machine for
your purposes.

Cheers,

Joel
