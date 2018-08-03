Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3027026wru;
        Fri, 3 Aug 2018 02:52:52 -0700 (PDT)
X-Received: by 2002:a02:b5ce:: with SMTP id y14-v6mr2733070jaj.128.1533289971954;
        Fri, 03 Aug 2018 02:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533289971; cv=none;
        d=google.com; s=arc-20160816;
        b=GpDo2HWMH0FIodsmtGcdjQnryEQ2LzCQQzNF3A+pqN4KvbcGZAs6R6DbERilcJq2q6
         aEnJLlpP0iBeRTZg9w2RsFPMHr8nSmUC1wn0rLok12wKn1B06AmBj4G0rbPHiKrw2SVn
         0KYhHgWyLSzcUhuh4CKYuteqVn3x3pzR+6OyuI6Y8rY36F779ZhW/MXQuJbQtPLDDA8x
         YkA1u7NiIq5oTdNU4ISVNujXwf79ZkYz4fbcBdQjO5yE+QhxPZ5a9XwBXHaYrOPrWOjm
         UCWWCVoWpAaO/H3iOiJ1PpwJxowSwyh4YtOxLNtCtSvSdD8o1yvUxXh4FLpzhCXVLIzE
         anDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=wQNF4eaV0MFccCASqK0xliXYAC9ZRw9DVzAPWLRXaeE=;
        b=bPSULhYk8W+B9kyyvU4Eo7R2KbtSIs0IQxS5hLsDAkcpISCpr0EnDtruz+kQMCyQ37
         TiE6BJkDCjMRGUlpVT/I8VG5MAl3/RSYSN3KmUatKJgsZgm4k5nywBOOj8lTjQpeE41x
         QPbrrWCwJzUDRAbZGHIBWTwrijHeLCbbAWDXROBzmXfGkQHnS9XE035y/n1AakwvN7Jz
         ucYzNszYu43RYINrOKmHTfNq8ZIocyHNq76LkUpsYZlvni2WznATxywsSGcZOaFtYGte
         PcEZkgWU8vrf5Srxwrn8mdyz19V7jcXlG1K3Umom0dDI4yKQvyIJM0/PlYcn/zp/+YMg
         DZJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YD3HiJmd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m15-v6sor1663401iti.89.2018.08.03.02.52.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Aug 2018 02:52:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YD3HiJmd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=wQNF4eaV0MFccCASqK0xliXYAC9ZRw9DVzAPWLRXaeE=;
        b=YD3HiJmdbyAEX8cMpY2p1OEjsFc+amhFumMSZ1RyPtPpnc5WSmWsJ33MEGdYQvTD7c
         sr9KOvsuvUetkMQpRRfktJCMSw9n/jcoMamu55/LMdxYcofzWSOQO5YRh1y7Y10aTN+c
         SgmFoxdWSvSlJbgOUHyDbGJAjYTN99NkxZYEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=wQNF4eaV0MFccCASqK0xliXYAC9ZRw9DVzAPWLRXaeE=;
        b=dc7sjOpHw390Qa+q/cy0HHRp6sTMGYSEuyPo/kd+tVUHhICHeh6Ei+dzqdJ+MAWrbh
         VwXe0tIdQcnAd6ax8hRAhAXMPGXke+yymIL2c5J7D+mjJ3JSET6DbvdLCjIlPpaFo0OC
         IKQ7JPpxIgKljvpMIxPKQVS12YGQkMpvb6YEEPsl9uU6VQS5Xuw9vTGy866XGlP91KME
         w1U5ivME08HtefwxS8i4xd3bBcxeQTGvalIOAWFUFLC+rhdKFcJz9pTlmcSSOJZhhh1Y
         h2aj7S4vZCL1oMxc2q0Wb5m7GRHtHWLDMKi9LNnxV8I/5ei1rh3/TS9VHYiZi+CxKDFt
         Otsw==
X-Gm-Message-State: AOUpUlGs1X5dbUCeFHvpXii6YRIBJqZitr8g6cEuCuPq+Od8lYr+iTOJ
	aftftrom5dHoVsMJ/V2GMuuHElooKlkkjEMoJV4FhIxv
X-Google-Smtp-Source: AAOMgpdSMY4lurCWqXZX1IuanFvZwBBvi15Or4Iuyoc3LC6WcTEtU15wzIFsjJcCU90Yyhm/OXCTsDidtREyNFKqffU=
X-Received: by 2002:a24:cc07:: with SMTP id x7-v6mr5640396itf.3.1533289971686;
 Fri, 03 Aug 2018 02:52:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Fri, 3 Aug 2018 02:52:50 -0700 (PDT)
In-Reply-To: <CAFEAcA9WM0Z_JgGZH_oynJYgo-F-Z18uKvz9rJjDQEtGy=Z6Hw@mail.gmail.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com> <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com> <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
 <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
 <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com> <CAFEAcA9WM0Z_JgGZH_oynJYgo-F-Z18uKvz9rJjDQEtGy=Z6Hw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 3 Aug 2018 17:52:50 +0800
Message-ID: <CAHmQWvCV6bxtoJr-xhSNVV-A2mhkjyN+HSBsR8-xZX6YNbe7kw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jones <drjones@redhat.com>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lFwWWcsqTXNs

On 3 August 2018 at 17:39, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 August 2018 at 10:26, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> On 3 August 2018 at 11:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Would the real hardware you are trying to be an example
>>> for use DT for this? It seems a bit unlikely to me.
>>>
>>
>> Yes, as a matter of fact. There is work underway both on the EDK2 and
>> the ARM-TF side to rely less on static descriptions, and more on DT to
>> instantiate drivers and ACPI tables at runtime rather than at build
>> time.
>
> Cool. (My motivation here is mostly to make sure that we
> build a model in QEMU that makes the right design choices to
> be an accurate reference platform, rather than doing things
> simply because 'virt' happens to do them.)
>
> Where would the hardware version of this put its DT ?
> In a flash memory ?
>
I would mention that smbios relies on fw_cfg to be passed to UEFI too,
so without fw_cfg, a flash becomes the way for it.

> thanks
> -- PMM
