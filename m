Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp318357lfh;
        Wed, 18 May 2022 03:30:50 -0700 (PDT)
X-Received: by 2002:a81:1dc9:0:b0:2fe:cb2c:7032 with SMTP id d192-20020a811dc9000000b002fecb2c7032mr22688473ywd.413.1652869850202;
        Wed, 18 May 2022 03:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652869850; cv=none;
        d=google.com; s=arc-20160816;
        b=Ooj8nFTulVsDhQZZn6DwKtuNMBFqMDjl5qLsyPWiURuLE6QEzZD5Ma8dziyuezqAZd
         baneC72bu5RccoqzgbaZyYRx/hUOApMXadfk18sm9dbvozoyvM/Fhqb8lK+dM8H8SY8+
         hf9ElsxlABnZFyd8rDFue2I2oGYm8ETILQYB8AxjbP5r3m3eqztd3KKV16J6dc6UpvsL
         4yHfEzqwrWYVrWnCBZVKI/s60b1JfS0pLbaj3MKh0pYm+TLEz9PMTWT6yUrdI2ckcy8p
         3txKL2F0a92MMloDaYSkwx28Lwn8dZ2hC370QKTwuNTwcvjkkvG0/JLKpoKG6+canzX1
         7zpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6VYjo6D60ICm1Bsii96igdB78MhM+JPiWL5ypQJWn0I=;
        b=MFJu8TbLt0MmE1VHdWlTw1q/JXFJI7KeHhV+iLvdFNvNQBwZGB+1ncjbmA2qU30xGE
         qiNf3xiyJB2E50vyWR6ynKO3tQBzkOB1INi0WaA1z374qFKl6LJm1KJqRmtUHgG4RxPK
         PZMofsAkWaiEBwhTLwFQ3fE01dq20vKHdhU1ywYZHU8xC8BhPUmJI6LKd3lXfqoA4PqV
         BOFFFrH/OdSyyeHijBgHJb0p/LQT5xRs4c346e+VThNuVJbmvQYrYSDVd+jBgDTTuyOF
         NJqqWMXuXp5E+GvHWr7V6lIdMZgA9ooRy+JpYYJ0je+icIrifiW1SeZOkxxQdQ880Huq
         n/ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kg6uMKZ8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j131-20020a252389000000b0064da72842a6sor731448ybj.33.2022.05.18.03.30.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 May 2022 03:30:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kg6uMKZ8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6VYjo6D60ICm1Bsii96igdB78MhM+JPiWL5ypQJWn0I=;
        b=kg6uMKZ8PYSzzl/jtgWmPF1BstnjO3j4CwHCu0yKtJQy8oJCXs/O3+J2/Y5R3snvNi
         xJloCqV5gstk2dp8T//JI31ii1cOBlHI7+m/xH/KiRw7jLMWXxlik3Rtspt/NO91yc4y
         FX2U5KKqvzOJ7Stp5QzTs59nQci/u0LjCEsosgRsTG+hacBUzftXpDYrmQ0UfHvbqkNF
         Okj5DsgzvN8gTuAYS0vrlACH6H45ByxEnpAhI4YC51LTKq5F/wDfLYkxvqpRMTqXcfgk
         kPf8s1dSzUQjCM4DbDpgOn1oqQAfEVbEJvrBQ9QzQcw9ND/ukuCi48bcIr5w56Xs0mWW
         y/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6VYjo6D60ICm1Bsii96igdB78MhM+JPiWL5ypQJWn0I=;
        b=FkA/6myRRBU6Dj1Z57jVBnMj/6F2bq1isH6Ud6kgh4w+BUeTviATUxeFpVihAmdGrU
         qyBfumheiI9e8R/F9kk9eafbytd5/fUq/kqWSnsRAaIbGEyL38F8K0Oxqt+wBy1f5tVB
         ODOS5H2yYuTV1BpewmDPYKWIb6xAaSSMrhOULZ+UIPWIF9hV3T577Ok2F1JyxP68U4oH
         USV4tLB708vbjUNkJ2yx7nOfggQarBJE6wMdGiCcqhhKwpe62q6fGMQRxKB6Gg0zQ+vl
         5MUrZ5i2y0OPjwq5bvyf6iraVAaBj0LFDgXJAPGW5czKYsntVDVLTfmsn3ZUY+0bcUoH
         UFRw==
X-Gm-Message-State: AOAM532WaCopsGba+/bnviFviuJf1BcKGHKVRESK144swAVCKrcVcNG1
	cDbEQjuWBzyOaIl4ubjmUT9VpQmPRw0nWS7OplolV91v
X-Google-Smtp-Source: ABdhPJwo1r9S0IGK+pJQaPGkfyAuLx6mIZvjrk5TsYPoAj5DWpq7XkSIqGnM4jNpZZf4gxZD+bfA96zlOobty4SApmE=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr26435231ybu.39.1652869849850; Wed, 18
 May 2022 03:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220513122852.4063586-1-peter.maydell@linaro.org> <TYCPR01MB61604A48D4D67447A373F70CE9CE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB61604A48D4D67447A373F70CE9CE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2022 11:30:38 +0100
Message-ID: <CAFEAcA9FvZZjHcSWVVwDE_XxGvFs-rJZgpdkcB7UuSPZj__jUQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Itaru Kitayama <itaru.kitayama@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: UkyoVHUvNeXP

On Wed, 18 May 2022 at 00:24, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, Peter.
>
> > Shuuichirou, Itaru: this is another patch where we need to know
> > an A64FX register value...
>
> Sorry for the late reply.
>
> The initial value of the pmcr_el0 register in A64FX is 0x46014040.
>
> After applying this Peter's patch, should we submit a new patch as a64fx patch from us?
> or do you want to fix your own modifications to the patch that peter has posted?
> Which is the best procedure?

Thanks for looking up the a64fx register value. You don't need to
do anything more -- I'll fix up the TODO comment and put the right
value into this patch, either when I post a v2 of it or else when
I apply it to target-arm.next.

-- PMM
