Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3006753wru;
        Fri, 3 Aug 2018 02:26:42 -0700 (PDT)
X-Received: by 2002:a24:94f:: with SMTP id 76-v6mr5509650itm.113.1533288402531;
        Fri, 03 Aug 2018 02:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533288402; cv=none;
        d=google.com; s=arc-20160816;
        b=TI6kwxThEFKbS2DK3ixnHdbWHwZO3/sCP0XsJ3M+XKkY7fPzCNn6M8mOQ7Yv8cs1hk
         cLoboWrnnS4X7z/E94RCtQsyz5mtNcHtC5KLAwGfiyYYihm4n6kMDIfARi9B8fEO/4zC
         undHdWHAhzRgdRN2OenaUjLiCwk27/wd+TQwaqJLmZuc9yWu7yyvl6o1DgcRBIB5h0NF
         bjzD6x6mxXeYpLt79VxnbprWOr8OydfgYpYAP73a77T0UUIv6G+Bbs2IYaAZAzhzvnVc
         WlQITAxo193d+AtlrPOXIJsiGdACPdenjLXvgz+G456BiCq29EAFXMA5p1Nj1fNUM7Ag
         L+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=uGhYuD3M5oFrczOMNANvfXQfDfbSMv6fE1vVXCD8h+o=;
        b=VaTAz/kmUgrENKBfvSWe5CKObUwS1WwkQxsBu9L4NuU1nQoO5pmwbtwENc+B0gwHlN
         ZOczIegbvbe/OklAml1KOT4QLnLT3wOK2wZwA6hetoXB+t9j6LKIx6zwBRx57BSjywA4
         i+BS3krjISxaTznmK8ghoBIcM3IArSZRZD+0na3v1HKEN29uPHcyJsOy3FTgoAhHcNu4
         5vCodCXNg7CzvjyEb4cYE79YNDlTP8UL6QDj2ESxg9CCt1UDb9dqRD+ErVEbX8QA1N2D
         mdVWNFcv6D3fR5Sx3nZsx4UrfvYT1y99GNjVih4XgszmkkiXFXoweurBTDNf1DpKZoQq
         JsAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbecfmm6;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n81-v6sor1648027itb.99.2018.08.03.02.26.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Aug 2018 02:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbecfmm6;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=uGhYuD3M5oFrczOMNANvfXQfDfbSMv6fE1vVXCD8h+o=;
        b=cbecfmm6pHYQ1bwgbjzxLRpsY3PCHGXzUNH8qa+v/YkL9R7NwM6k47WbL7qochQE9g
         f3p150bUSVhrDf++OmxQZcgkU3Bh6KSaLsQ1zqLninzMvF8trFKN+S+w1SzaTYubZuv9
         rlAfrkJj6BJMY6y8B2MUjyAVALX2bhYwaKyd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=uGhYuD3M5oFrczOMNANvfXQfDfbSMv6fE1vVXCD8h+o=;
        b=Usa6LjArg1tieXpkxQrSiv1N9qKpMQSdsUF3rZqDKDBiIdw7muZPDeUvM2PR5tjFG1
         FZth7+ly3YWMy7l5xqUzW3dIS+VXJPbolvFb3IB7THZdS0XCFd3XOJy2HdLLTfz3614S
         mZ+QLTcdDJqfp4O9Jm1B28soPhbEyKaozAUqIpXrdiFEkut+3o2UHxZhbDjItARxi8Xl
         pr3Je+J6kFegDv19M6E1uVwDLPuT8KBIwWQZcKIzpQatjpmHVqmsQAat9v30q/eSuUIM
         wvrw4gQNgPekhceudvnkct77JvEYzGpKfMLxsiwGL7XInlLkHPxrfkKaja0f4+4R+49V
         x0rQ==
X-Gm-Message-State: AOUpUlHNSf2oqx8ncvGkoW/vnk3eWF6VERedkMbPQezPu+QBLZCuVwEz
	e4dSvkRh9ewnlpOsVqwKvmRO1wlcBlA+gvaZyUKLZSzD
X-Google-Smtp-Source: AAOMgpf2nukvbHkwjtj1eXzSvtvd9XiWzvaxQx5s8f8x/dvfpUEPf8Ap1PPxdb2jgYU4gwPXwFpdac0DqPE6vHiRPeM=
X-Received: by 2002:a24:610d:: with SMTP id s13-v6mr5715143itc.68.1533288402143;
 Fri, 03 Aug 2018 02:26:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Fri, 3 Aug 2018 02:26:41 -0700 (PDT)
In-Reply-To: <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com> <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com> <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com> <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 3 Aug 2018 11:26:41 +0200
Message-ID: <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Andrew Jones <drjones@redhat.com>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 3o4oUxBYAiYz

On 3 August 2018 at 11:23, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 August 2018 at 10:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> The 'sbsa' machine won't consume QEMU generated ACPI, so it won't
>> touch or add new ACPI tables.
>>
>> UEFI relies on its ACPI to load OS, but currently it still needs DT
>> from QEMU to pass some info, one example is CPU number.
>>
>> So, the 'sbsa' code implementation should be like this:
>> A separate file, no ACPI codes, a little necessary DT codes.
>>
>> "Necessary DT codes" doesn't include so many peripheral devices nodes,
>> so the code overlap with virt won't be so much (contrary to sbsa.c
>> with all the DT codes), then no need to separate the common part to a
>> third file, and virt.c can be untouched or only a minor change with
>> few lines.
>
> Would the real hardware you are trying to be an example
> for use DT for this? It seems a bit unlikely to me.
>

Yes, as a matter of fact. There is work underway both on the EDK2 and
the ARM-TF side to rely less on static descriptions, and more on DT to
instantiate drivers and ACPI tables at runtime rather than at build
time.
