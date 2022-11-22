Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3285453ejx;
        Tue, 22 Nov 2022 05:27:25 -0800 (PST)
X-Received: by 2002:a17:90a:6b08:b0:213:8283:ac7f with SMTP id v8-20020a17090a6b0800b002138283ac7fmr25043870pjj.220.1669123644926;
        Tue, 22 Nov 2022 05:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669123644; cv=none;
        d=google.com; s=arc-20160816;
        b=ojrnpLvMZsVmqTgKIm/2D4v+22G8h2UEafwcOUQNUbgmSFek5jL8XHl8QnxwHegzkm
         Domh6yBt2shJ82hnV22veRc/VCgsWlFaBXItvwZrmQDr2J4afzW4p+Gmptu6Lzfzz6ic
         m0AWWqGwNdH3sOCiyit3yw5zmCGMGNC6R3woi9kWzk95/IqzSr68TTB3y5y0po5Aq44l
         17Es9RyP11uLyE4HqW1zItKCQ9exILZh160DkultxoU7aP33G69Ey/boAJKBHEaRPTkc
         uQn259OGyOlu6ErghwcLvub0qFKWEmj+w9DbvIxEH0Kcnlt82p4W1euqtCrOr/oNDdCP
         UzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ofRCumZ3/37URAXPux1nonscFt8GPW/MI/AdHounDgA=;
        b=Rvp7DVdGRJYWcYFBKkwE6/b9kDpZ7F2kU4+C7VxBs81zdbag9lGDgkn4VNuo9hEfEt
         famd5jgTzpPBsfkbJkKSpDzwdgZrZ0sMkme30++E0+pZJx9HFPNplX2lz0JREBKjfM05
         GQIzS6GQJqbI41A8770ne8HMD8qluCr0F8CoQlPLVWEaVNrXDD+/SDmpTz7Mn7HTSJXn
         +mUTtEdBo9K2rOP7IdBhoIyeA31bUmH4Dq7k5aB5weumSmsrB+JEr7y5V89Wg5Z9ksHO
         joJIKb9In+9uqm9g/SzQrmMmSE4mVyWy2H5EVbQdevH0TWSOEkHTkyd5TSd3/4XA8f78
         hXng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wep2zsWz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v186-20020a6389c3000000b004774c8e0dbdsor4291284pgd.34.2022.11.22.05.27.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Nov 2022 05:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wep2zsWz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofRCumZ3/37URAXPux1nonscFt8GPW/MI/AdHounDgA=;
        b=Wep2zsWzJVoBSSdFcU0wY9ogu6uW9/1RzSUmtD8iYa+oB2vIfHa1idfOfoSw6YC5Kn
         GigZQMBoUIfjz5XTN+AM0ol24iZbfn8lCIb5QHXnwsJHX438MGJc41BpcHbi1HrNJl4V
         lBNG6irYITouPCeSIUjoUYXa//CmnUDkn/c8JevU94WYP3lMI3MjVtz6Lwa8JpBY6nh+
         vpne9OESRt5mq4qQiGsVNqNzlMMKhubhFvfF4v1fLzt1wiYKi2as2Z1h+9umldUruzlD
         Sh0ZrE+x/nCjndL2Ww8/sH+V2ZUHuQsWHX8iLGeQcqP95HFOojVqLeOgIKN+DUcF9T8k
         SRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofRCumZ3/37URAXPux1nonscFt8GPW/MI/AdHounDgA=;
        b=D3hCIR8q46Q//DSpSBvaCOILVqbt9hgc04Ag4BMxMKaQ/9iMhelVvFagIqlHLjTEGh
         2PV5b7C58WFpVgmt56zgWkgcCT8Y3+rQTmm8cjP15XM9T09+Oy/LtCnjZseMMuBusR9l
         nHsb5pfPWx81VxSeynGdbnyQ2RPIDN5hKz8Vr74oFrI31hMFK9GPSbTFvVaAOB7HT4XO
         bzCq0EEuXyWjvPeTPqT+BWiFLdkEEi+AWBAmkv5JFC43Z6DF5NmIHIIvypGL3kgE5ZYn
         27NEK9zflcpkrWne49+NvsV2P90YQDKdcPTwRiHZXrUfLdQPNRDL1eul2RgHc2f4mq9Y
         upwA==
X-Gm-Message-State: ANoB5pk1UtZVx2W8SSOuBMcLpw33q7JBalLmWQnn1G1SMsFIPtf+0UwE
	7R49B1/ht7OWB5iRiBMfAOCSrk4dbUGtfk+gJwcxstK7AgFMkg==
X-Google-Smtp-Source: AA0mqf6x5YeTLFzQg7THXYAjIDkDNdP8/J7tCm65rgPJJOcHKsWQ9rUQ2VNRT07IKmfcBMM/gh4XbPeynJIFDQX7H3U=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr3536391pgl.231.1669123644436; Tue, 22
 Nov 2022 05:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com> <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com> <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
 <m2edu3ig2s.fsf@gmail.com> <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
In-Reply-To: <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:27:13 +0000
Message-ID: <CAFEAcA95+NaE2Oh_7AKkibDObvpuifPOLw-Yh8u6qSXS6LiMgA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: WvDxD32Q4oyL

On Wed, 16 Nov 2022 at 13:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Nov 2022 at 06:11, Schspa Shi <schspa@gmail.com> wrote:
> > Yes, I think we should accept this patch, because it will not affect
> > 32-bit devices, and provides support for 64-bit devices to put initrd
> > above 4GB.
>
> Yes, I agree. However since it doesn't cause a problem for any
> of the machine models in upstream QEMU, I think we should leave
> it until after the in-progress 7.2 release, so that we have
> plenty of time to investigate just in case it does cause an
> unexpected issue on 32-bit boards.
>
> This patch is on my list to review and deal with when 7.2
> goes out and development reopens for 8.0 (should be in about
> four weeks).

I've applied this patch to a target-arm-for-8.0 branch, which
will eventually turn into target-arm when 7.2 is released in a
few weeks' time.

thanks
-- PMM
