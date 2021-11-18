Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp953830lfk;
        Thu, 18 Nov 2021 09:32:15 -0800 (PST)
X-Received: by 2002:a05:6000:82:: with SMTP id m2mr32667370wrx.202.1637256734958;
        Thu, 18 Nov 2021 09:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637256734; cv=none;
        d=google.com; s=arc-20160816;
        b=o0Ifiv39ue8hrhIxcluR3SPkyqDy+gA5KmkvkAWvaCjQqNvz/O/W4SUKONIWsaUHh3
         CuNzR9kdu3+v/CNB7DvrNlw0XmJKNBzkomCqEPbUw/4EdNU7VxXMpZV1j4xjnU1DiShQ
         Cf+FnJxXxKAQnUM/Qzc3nPz/NwS/wq5t+lYoGZ6Jwfeyr6gV6XKDCZLM50Ty/hhFjdAO
         PF4WuvolyCT6D6RVsyNDLutHotoemw2w+paZatHXnhIeBj4DwD8/rSjxZvwLF5vYHIC4
         kkXRRZfe3TOtPVJo9BIlKgkVLhLNKKWEO375BdxkShJiEcIOogQ+uBGnfDOeCZMGGLxh
         cmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aOehcb14RhaXPaTpNc46MrjGRSy4S3nYBvoh8EbL+DM=;
        b=hgveOXkHki/JRzhxdr1UBzZM3j5s6G/+33GqLMkxK2J1ul/OgyxNfndNd8fODAQ863
         SJWPZm6IB02//qNaIM2PGUTZ7M/XYlr2RTyRWu8ebENti5GKrIGc3UmgrdyDcRxRJ7MP
         KfKBjf39/CaAZgCX5+gXkCuhg8fLuk5EJN0Ve30FihCku5VWV/HoL7fcYmidQWrz1LPY
         BpUity7yCWcDegdLiiVUSHdIwfAKPE9uHFdtTnRm9QVl7rQt5jmf2hyehEgtMI9No67n
         Q4ZHKyiI1GFuOtzzNcWXCA0VfrkPVH2W+6BWOD+pC1s6UoQkuPOWbGw4G5nZKIhpcO6Y
         cz4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D2QEGGyK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l11sor374778wry.37.2021.11.18.09.32.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Nov 2021 09:32:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D2QEGGyK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aOehcb14RhaXPaTpNc46MrjGRSy4S3nYBvoh8EbL+DM=;
        b=D2QEGGyKSo3EYvxv8X0rUV38L6aCUD9qCq2w9W6YvuQuO9DqQWHwDYzjIOeb12nLZf
         eAFkue8Zf2aGz06M4qjOJZ1qSqW3h8XOCzSZofh3OzDAAeKGYjTBnsmlpx2ZAEsLoouY
         fOEpa+pf6iPhxm1wGlhKXKeuoYvIeqoGuWm8FADIwY/NE88u6m1OqhCtcaZGMSsKWudH
         hzNl/RD2hDmv+cHpLTlJUg7/i8pZrqGHJz6ZtMu9WIG0D2/l0WE57xaE8miCIWIycIom
         LA+lNHghqhPb2/WfnnPsLxpPWASQfgM9qfaO5LNw8dubpWOaOMYapXqoP33Bm5TS0Uz8
         eeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aOehcb14RhaXPaTpNc46MrjGRSy4S3nYBvoh8EbL+DM=;
        b=UzdqY0KErKbqV0t8aa9gvxoA4NVHz9riQbIfIdAqTGTSxH57AO2lZhQsqdkBblizUG
         wQj8jc34ijwD9KnzXIjb3r1jgJgLR5OiHEj0BRObPK0Z5bI99IwvEyboYK6OU6az5C09
         LSNTzqcXQrMon/hpbjZh/8xzDTcyXDoqsL/oQUBIvPhaWzY6sb749P+ZuajCJyEhd5bf
         Uwp4jOTLw9ef852UkbR6XJP0JSBKKUyfVjG3nT5NklVS1I56uLPsJHIL8bhGbLMwqY1Q
         QwTRYpQGiNKRz2ziLJiCfCAjJwzzCUSSNC6LFWk35b96MlYl2Aw3C3dZ2HZDjEMKHT2/
         k88A==
X-Gm-Message-State: AOAM531saQAjSOHmMAMv+0jjNcSSYf/MbXgYRFa0PecqcZomYAVa0J/7
	gmn7plrc8AK/1U2nE+yKRb0n3u8aYQY5F32oR5aA7k2WQtTQSg==
X-Google-Smtp-Source: ABdhPJzeWrgjBD+2qHtyVGJOokNchYJYQ32f2EMPlHzcvi2VlwbgCuhDoMN1F6Hbgt2ewHJxlU+DbvFDX1J58K/WUEI=
X-Received: by 2002:a05:6000:186e:: with SMTP id d14mr32883118wri.376.1637256734635;
 Thu, 18 Nov 2021 09:32:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
In-Reply-To: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Nov 2021 17:32:03 +0000
Message-ID: <CAFEAcA8+U-9OKYhGSm57dip-AhKpJq3AN7+aHoW9+b7NmTPaOA@mail.gmail.com>
Subject: Re: DSB does not seem to wait for TLBI completion
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WEMoq1NGy3nb

On Thu, 18 Nov 2021 at 15:46, Idan Horowitz <idan.horowitz@gmail.com> wrote=
:
>
> Hey, I'm running a bare-metal image on QEMU 6.1 and I've encountered the =
following scenario:
> After receiving a data abort and mapping in the correct page I try to inv=
alidate the corresponding TLB entry using the following assembly sequence:
>
> dsb ish
> tlbi vaae1is, x0
> dsb sy

Do you have a repro case you can give us ?
Does your setup involve SMP, or is this all on a single CPU ?

> Unfortunately this does not seem to have any immediate effect, as upon re=
turning back to the source of the exception I immediately hit the same Data=
 Abort. This cycle of receiving a Data Abort and then updating the mapping =
continues for 100s of times, until the TLB finally updates to the correct m=
apping.

Note that the architecture says that the DSB will guarantee the
TLB maintenance operation to be finished for *other* processors,
but that if you want to guarantee it to be finished for the
processor which executed the TLBI then you must do a DSB followed
by a "context synchronization event", eg a ISB insn, or return
from exception. (See the v8 Arm ARM DDI0487G.b page D5-2833.)
It sounds from your description as if a return-from-exception
is done on the CPU that executed the TLBI, though...

-- PMM
