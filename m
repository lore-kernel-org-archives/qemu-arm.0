Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2001765wrd;
        Thu, 30 Aug 2018 09:37:06 -0700 (PDT)
X-Received: by 2002:a54:4805:: with SMTP id j5-v6mr3483585oij.210.1535647026406;
        Thu, 30 Aug 2018 09:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535647026; cv=none;
        d=google.com; s=arc-20160816;
        b=T8/26PdTQqe7PmaRnoH3nM5JNcO8oXVr6BGcUoU2MrTWh9HBzePPji59apLPSES1IV
         2H+HmDQSoOVmCiciELDV3JXq5Kk2B8tG1HZcPG7ZfZwuRp3+kKpJAS1J2vnWL5IH793W
         4rLHpHWvMM1Hszd7RWU6XIFDT3m30cz1yDIgnDcF0aEun1YurBtU4vQpjO7w9eFU23Ht
         bdIP/vtlQFsXxCQtfexYY/p1qEf55dOPqDQqZmmIgf5/niocxVzO2nnRU/aEZkE9azSW
         /KZW4GPKUCjpAYTvQravWvDDtSmWMt8BjbbgWf3R8VU3JCoGZ93SDMFh0+ynUcE1mr2d
         JZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=YeAtTgXStM1Iwp1ex+2ybV1t+42PSxPhcAWDRiiAInw=;
        b=Mu3OYgMiarlXtjibknfSvMbdcSxtcwKoGovQ9YDslI4p0UKg3iAQZzuu+iZ0y3P6ZS
         DsEJQa5UtNs60NRM5pPCgHZqZcMqCzETOO1WH4pUtzau8D/kFQ8vGj8LG9hywAvBJd9f
         CTSgoaTyzzornr0XJcZLbhBv3XlC7xCqbGQr9M5iu2HXfK7AXzX+8SbGguj6PzXhwKeD
         5FgT1M4RNwh9wLQEI2zPf1KFMTCwbARMvEfAh/gineLxv0+7/bdAMadyt7BstWFtsEMI
         auQzIMHzT88nfhXfZMPPHDHUFbt7eMW3YYaiIZHV5iWJaaL3GAVkYcqNk9KLX9wWdOzR
         HGPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QaXXqe12;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 9-v6sor6769282oid.23.2018.08.30.09.37.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 09:37:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QaXXqe12;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=YeAtTgXStM1Iwp1ex+2ybV1t+42PSxPhcAWDRiiAInw=;
        b=QaXXqe12Vce95D0k3npsM1Z0N6J0QiI2kBwhysPhAP8CM4g0qLm893AVglsskyM0JQ
         7btW/gV5lFVo4bBqMybxIzA/ggLPytfVaMttGDG+Hh7c4rRjHvYRg/ycAP8ANQi/XhMx
         8rA+cP/JsGoe/5LB/stNOyiLx6olo+24fx6i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=YeAtTgXStM1Iwp1ex+2ybV1t+42PSxPhcAWDRiiAInw=;
        b=FlILD4+P66V+pKWgGRvFpjgVrsMu0HqGPWht6AxJ+7DybrGGoqecfSaqnI2CPssjU0
         w4w8Zt9RppdKMFEiIv7vxwbQVdGVen95c9u64V0g/wQAxvNelBkgPa3inzyUjvkPpopN
         zbndwVlDs5wVqKdTtlJuRWwZiKr08+MaqtzcJ5vB0WeLUpAqbBkNuH45f1s/yzmjoPjS
         OP8O8vWFnMJpYuXAJGJQNhjM6hCKpT0Y8DIFYQjH24hpIJcqYN+fW93/x/wvb2fSK8VH
         nhSvnJFJWbOdoy9DpfPqLM2CP15w6ZNnESxx3oy+jMsQy5LLpyxC1H1ifv/AC203wKJG
         tBww==
X-Gm-Message-State: APzg51D7BpV8O7VvHJq/xjoPcHp4JeHQ6P7tIpWndp8Vi0jjqtARRvXP
	KjjNbnO9Z4GSFS/238aAYYEQeSeQV8zTtJWx2EcRdysj
X-Google-Smtp-Source: ANB0VdaJu4RDXTaGhe0nULuNbBwtIuoJ+v0AHKJr5KfUf7G9BMk4cFMTN3b0UqFWZ9Tdvirc8uuEG4mA6Mlsm0wBfSk=
X-Received: by 2002:aca:6142:: with SMTP id v63-v6mr3478326oib.137.1535647025921;
 Thu, 30 Aug 2018 09:37:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 09:36:45
 -0700 (PDT)
In-Reply-To: <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net> <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net> <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Aug 2018 17:36:45 +0100
Message-ID: <CAFEAcA-83-mQAbAvsypXBjFRD9h_St5Sjy+ntAc-jyZ7uDssAg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Leif Lindholm <leif.lindholm@linaro.org>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: fy8ScEJAoaii

On 30 August 2018 at 14:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> How exactly the firmware figures out how many CPUs and how much memory
> we are running with is out of scope for this, and so I don't think
> there is a need to build something from scratch here: DT will do just
> fine, given that both EDK2 and ARM-TF have working DT code for these
> things.
>
> fw_cfg, on the other hand, is unsuitable for us. Generating ACPI
> tables in a different way from actual bare metal is not a good idea,
> given that things like RAS interact with ACPI as well, and fw_cfg is
> also exposed to the OS in the default mach-virt configuration. So we
> could tweak fw_cfg to be more suitable, but I think that does not
> improve the usefulness of our prototype at all.

fw_cfg is an entirely generic transport for passing named
data blobs from QEMU to the other end. You don't have to
pass ACPI table fragments over it the way we do for
virt and the x86 PC platforms if you don't want that.
It's true that it's visible to the OS in the sense that it's
a physical device in the system, but so is a hardware connection
to an SCP.

thanks
-- PMM
