Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3016730wru;
        Fri, 3 Aug 2018 02:39:51 -0700 (PDT)
X-Received: by 2002:aca:f58f:: with SMTP id t137-v6mr2562676oih.244.1533289191529;
        Fri, 03 Aug 2018 02:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533289191; cv=none;
        d=google.com; s=arc-20160816;
        b=YbLBdBYkcOwXF6jSPTkajRnm0HER6c9Vi0QCWwcaYgRwwjGgUB1yf4kVPe0D4P8Bmc
         l/oEBuCUeP5ziaF6kVZtq1hHKp7cIH0/yBe+XrhMbG5/4zH6Abgd0hRwb8PtgCBHD/r1
         gPatHDQMqPjZYYd0sEaMm+i202h7AmY/Hhl05/s//e9oXnVu8B8pjh10/9Qrikg0Oxzc
         u8p08fXWu40EjmZjR0XzJdqWDiSQ8UZKYzcRQ+3dj3q/eeiHuQoYTBUEvl7GNQaWDEhD
         2hUvnECo3gJTM5dmQ3P8BGS6qYMso3WYgy2JoncYbsX845nwWUtzwsrE8F+tb4tEQequ
         G6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=KBOCIpt/qXv36ScXGOiaSCQesVEG7UFx3Jkm27Mb36M=;
        b=h+YEkl8qVn9nr8uYegnGjiFnJUIl8lUnc7NfyWXFTq01e/5M6dB8+1PjW6VjxS1UBW
         80653Z61e/K7FNYB25NY3d/4AwD68Qy43AvKACODNnAUINaqEB3dJJFYJWdLrqgLCRDj
         oSQMYqk4Z9ceIc++LM9YKYg0DoSYtxu07yq56WKf3ildexVQBGcFsFlO3YmnfXjddALE
         +xUBNvJJcjV5KgUVnzlLrgucwQO9AxPrTiOrnK4BZd1RrgLVhTlGYHN5NshJdiSaSMdi
         xI0It3c2NOocDiqmYRHiGOqh8dR82VbadxsiG4SBTwDPebqLvhAiAt8ENiB4RMbfbff3
         IdIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmId2EHO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s195-v6sor2356160oih.51.2018.08.03.02.39.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Aug 2018 02:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmId2EHO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=KBOCIpt/qXv36ScXGOiaSCQesVEG7UFx3Jkm27Mb36M=;
        b=jmId2EHOKxz7HOyGrY53eVYAoGsZIrNXNO65UboYJBHeDE7dUQVJ2XxS7dUu45Y20k
         q/3HajIVsbtrVMQpKR0UkTj5mxolm98UtYNPiu1+1UNq4zrrdnvNmZuXveNR+X6//0pJ
         387LYJSEm4Xm66ziEDkIYESnlEx6NiAdcIjsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=KBOCIpt/qXv36ScXGOiaSCQesVEG7UFx3Jkm27Mb36M=;
        b=Y4LsC51cW0OazZwBmy5p25TiNKg3qZk4djVuuXgN6I+ToYIqay796hMirr4xYN5asu
         6tlf0ZDmlBhOKH65Hh1/tmtKx5TK6102YEbtJwupyxXbq0j0tWq49XV9hP0sghcJqstl
         2uJMGQKZbCgTrcOAXu+zO+bB71IudRe7HHE67pZIU0IVyUsFTp/zoQerUQykMWnaO2uQ
         IhEM6VfvSDs1AAc53AXIxsDB/dI3jxdbEzZQqRBmxSWpDnboFjXVOa4m0AbODxxKYlKv
         CASFnlH9RKhOAhLEhF5s46p73erk8m8/EGkS1yP+w4f8tO9yZz+yHyGt6hiAEHaMAqjG
         /qng==
X-Gm-Message-State: AOUpUlFenftBssv+4DCtRob6rRHWY3qJaGR3VH0r9MCFBZXcQPLOIwtb
	LEJCGSKnjrow6psIchnCII86t39oOZYdEX5R0IBxw7xl
X-Google-Smtp-Source: AAOMgpeAo2QRTF3HCCSb/I8K0wHG+iQwjurPCsgZQeAwpufbUuCnOpNaOlDEG8PKaLaWasQxRbehxT7LLfxOdPvC7qA=
X-Received: by 2002:aca:4c14:: with SMTP id z20-v6mr2216471oia.164.1533289191233;
 Fri, 03 Aug 2018 02:39:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 3 Aug 2018 02:39:30 -0700 (PDT)
In-Reply-To: <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com> <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com> <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
 <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com> <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Aug 2018 10:39:30 +0100
Message-ID: <CAFEAcA9WM0Z_JgGZH_oynJYgo-F-Z18uKvz9rJjDQEtGy=Z6Hw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Andrew Jones <drjones@redhat.com>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: XQg82aVX/39y

On 3 August 2018 at 10:26, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 3 August 2018 at 11:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Would the real hardware you are trying to be an example
>> for use DT for this? It seems a bit unlikely to me.
>>
>
> Yes, as a matter of fact. There is work underway both on the EDK2 and
> the ARM-TF side to rely less on static descriptions, and more on DT to
> instantiate drivers and ACPI tables at runtime rather than at build
> time.

Cool. (My motivation here is mostly to make sure that we
build a model in QEMU that makes the right design choices to
be an accurate reference platform, rather than doing things
simply because 'virt' happens to do them.)

Where would the hardware version of this put its DT ?
In a flash memory ?

thanks
-- PMM
