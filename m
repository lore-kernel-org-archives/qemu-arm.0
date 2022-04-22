Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp476643lfk;
        Fri, 22 Apr 2022 07:04:12 -0700 (PDT)
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id bd2-20020a05690c010200b002ef48d824c3mr5040177ywb.153.1650636251924;
        Fri, 22 Apr 2022 07:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650636251; cv=none;
        d=google.com; s=arc-20160816;
        b=XhVk6h1MipfN3CBA3S9I9yOz3lF+cFcbHQ2tzKZYeEqY1asFdRCTbh+91yTGcXINYr
         rK2hDWiiiwFEf++QWGBJMEx4Mz5gK/C8k+xM3Jf48Bw+0QWWLfGMpLVx7bWvR+SfVS05
         UNUVlnz7f0TnTx12WoVjHCUtfCSYvhwABDcU5HDqQ6TwVS5VrJKXEWpDrGIsVUsEgthW
         i9vgxN7sKDnIlhZBDAll8Y7qkRgDgbIIpwDTpJAIxcTodOZA2m76uDf3olVlpA11KCUS
         Tsff+XSdrrwDyreTVhi0h7Q2P2tsJXZ7O2+XVlJzqsTYMb/4Xaio023WRc6YRyA3eg2y
         dZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DvjpuFa6exvvLwJ8+EreIaqheaPFNf/vzBAIb9uV+4M=;
        b=eJLRC+n+q1p+9gfe8tCuFM59iFoK0Fdhk68ikNh+0KSCaREQ0o9cMCxQpR/Pfatkjt
         15PZCViPsZHkQ0oQlMh62lHGivSxeG88VxTFCdbPa8DCJdCXuD53csoqYeGaH+O114No
         PBgwZVAsMLOS0RtrIHx1Rk2M7GkkUmoht4Ql68vFxA4sN9M3zDxnxh6kXIRXCjPHt1qe
         aoodTCqDxKHwMMi7oX8diE0X18T/YcVBUIUUI3F0LH/e/xdZkpU3KlUA/d0/P+Ix0Jle
         3n8eGQl+TYaWrBqJZ4/WEXEw07Fmul52lkDFLX8VDD0p0LGoBkajyNgoKIyHp1ooHcu4
         AATw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DidfI+Uk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c20-20020a25c014000000b006457bb43a2fsor2049462ybf.29.2022.04.22.07.04.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Apr 2022 07:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DidfI+Uk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DvjpuFa6exvvLwJ8+EreIaqheaPFNf/vzBAIb9uV+4M=;
        b=DidfI+UkaxIvPGw1WbJzHpwLzaSzexuj/dsFjQs0wXu91398dHOYm+2MaitQAOo/z8
         RVa2HOF3bZ0XRuRAQ6mZDP1geHGpONQKj1b4wtE0hrYC9R6DBK04gzcjxzS7J7p40Go5
         h4CMfy3VeiDGGzb06DQPg648a/uGarw/KlzxexOdGDP1BRxgpsQJNtMPMHI+8oIE0M8U
         gploX4UI+FOjhKj64suRV6ulFpcWHsIHj2tIiyp2SVbWyWS2hqwUVIez7hpCJD9gEeDY
         4noSXGKHMAEmn3WZs3p8eRaWZ1YB7KX2xypASP9Zm/P9OGOevye/+DDTSvfW/NaKTmP0
         1ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DvjpuFa6exvvLwJ8+EreIaqheaPFNf/vzBAIb9uV+4M=;
        b=r/LbuCrcXYQZTyZj3nH9n0TRTdp1oGYBcM5UqyfCtLl960VhbaLTsrwdb3vWXzdXEN
         9N8CDvkAVzoiuVElq4MPhC/jpd+8Fu6UNhMv3nW7uu4OufUjzxoah7FY+VBq9V2t7Zvd
         be9ORvnaJgpy36ItXe/BhnSAKvz4xdDpbOui58jqSzJaWgQ+D4nOSgWm/SmOdab6zJpz
         r6nB7ZE7Gh3Tp86nySMcJAClOZjF3bo/i1eOBRHITPc1ACdZ+epYvf5dhW664kQz7vFb
         RD1ZnENHUR2IT13+9ZpkatudMVqgCH8HxioIj2W6l5KLFGV5HD1uQpbBc3yXnq8McoL+
         L2xw==
X-Gm-Message-State: AOAM530jDyl6vADR1G/bqZPtV67G1Ohq8rHbczGY5Jq20aH+my+sZ97/
	XuL2E2mEyigEvzsoayfzMaKqXrcHzTaAA3N3HhMC6KMY5bciCw==
X-Google-Smtp-Source: ABdhPJx6wQJMpg8WPCVpPrv5H6uOuAXcrjEj3Oo/sFaA0GlsplnN9y9z5N/2eRwJFJj93TkT6kyN+/LkbqJEXLZrZSk=
X-Received: by 2002:a25:c60a:0:b0:645:d925:64d3 with SMTP id
 k10-20020a25c60a000000b00645d92564d3mr1509169ybf.288.1650636251403; Fri, 22
 Apr 2022 07:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org> <875yn1uskp.fsf@linaro.org>
In-Reply-To: <875yn1uskp.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 15:04:00 +0100
Message-ID: <CAFEAcA-Evh0mTHOzsk=dv9MAKjPcKmSVTFfKzV42zzRyZ4hUfA@mail.gmail.com>
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FfbjQi9pcSkO

On Fri, 22 Apr 2022 at 15:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > Bool is a more appropriate type for this value.
> > Move the member down in the struct to keep the
> > bool type members together and remove a hole.
>
> Does gcc even attempt to pack bools? Aren't they basically int types?

It's impdef, I think, but it'll typically be a 1 byte integer
rather than a 4 byte integer, with the usual struct packing
rules for 1 byte type sizes.

-- PMM
