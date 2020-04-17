Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp539189lfm;
        Fri, 17 Apr 2020 07:24:38 -0700 (PDT)
X-Received: by 2002:aca:88d:: with SMTP id 135mr2218486oii.10.1587133478432;
        Fri, 17 Apr 2020 07:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587133478; cv=none;
        d=google.com; s=arc-20160816;
        b=t/A5e7kDqaIqwOVgce/v6LAe68RNBNQY+GKo0xs5UVwHR6/TNgI70dSmuzV6UYg9Kf
         W0F/CKFaQakFYf+MeNUq/LE4JrvHSxCZVUbtxXBu3tWDEPidW0dRznqh0ZOkveMcrZsq
         bpmh24Kh+EXPY60Ioxx3FRZMOCNNsCKKTSg6NjRtBXy71k7vekS2jyinuT6pvYqXUu5+
         5tlWRqSb073h2CsvefbmiywHKaBwbMjUwch2MVchOfwXPzS06LH8JpqGoQXqszXpENLE
         SCbGj70K+5Abk++/AcRQ7tEuN2USM4raJi7cIfmQAtinWrkNa52/oi6zxltW/RF3b77Y
         YAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bINL+whMY8JUFNkL3EiY+3GJ5yVCYEGHi/PyCcCo5+k=;
        b=cv3Z6Saylm0twDHqYCCKSRgKG+Rwu2a5phNU0Ghj19VTObHuRUnujV18DDD/8c7Ega
         Gf0CkZg7QcjAdFHUcRDm+AR6lSWVgIkYh3Dn+0ldS2N3G3fTJOCPYP2vpU66NWpodtYQ
         0iNz1GUC6Fvx8hPCgSe3C/mgnrKP92WHxSwO2nYCkY9VpJBR6P0Zf+xVp3FgByGi+Orm
         o8kHn4ZyTRPzEFLHNY2c3aSZtPTKCnVW99DsojXssKw/1z+6dd33Preo0JdPH32bUhg9
         nNSJMIYuFvncteODqQIAAIgJ4q+8WPBpiJTk4Hd7FXPxK8/AWKgAMuTKgjCXPF2TysPV
         LeRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ti9Tqq+x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e14sor17062882oti.91.2020.04.17.07.24.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Apr 2020 07:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ti9Tqq+x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bINL+whMY8JUFNkL3EiY+3GJ5yVCYEGHi/PyCcCo5+k=;
        b=ti9Tqq+xRiQSWOwWxj9UiETP/8S5aSWAzJtPZGbwp13sUdiugCAYbDNg4qDfP2L8kt
         KmgoOP1EvbVb2qC23VbUoqiuoJlFtXf1IeIJAvqcGaJ9aj2cVMHJWBzna/o+A2lyaM+D
         Xy8xZVYie4n0Xi8VIzZly8CXlsByG44AsvHodxnXIrJHHeYKayPWK5l+5iVH+DeV11mp
         mm6qKLsQwp0M2ivD9rRfo+AJDn2ycxxyfXX5/K9dEk6W87HtZKKLH62gtYUtQHsK3ZEk
         qtOufeaXyvVOUB0N+eOhQqKG3tWGkB26G/mnYiPp6/cyGoVo1Xd/Bwq5cEaZqmj7ugJ3
         2bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bINL+whMY8JUFNkL3EiY+3GJ5yVCYEGHi/PyCcCo5+k=;
        b=YYqA5sd9yctHGsH+O52mem7BtLsHmHCdbE04TVWXgcenrgrYZMK18ih2kaYfCGLmGx
         uxbWE3jpsUp1AyUW2mECnyMmN4cTIpVFX8JDrp9hUQUmwoXeU/N4sk1roICVcUOCTkVx
         m2/zvpINJEksWYSY6WKVDVuPGaIsv4yvbN9YW0GIuyxEcj5WK2FxgQFxX6yzL9YFwLsF
         y43KJEqJxvcoyasjAmkXEyvpfy6WM7n6SM9FKA6uUpKa/EFc7WmwsNb0ReAru14hxRQt
         oFTD3km4COn8IFdrzZyDZnq2lHA5P7xMjBt4cLm67AwKBPir5VhJ2lHap8FOkPSXkinI
         XolQ==
X-Gm-Message-State: AGi0PubbB5oPiD+1ppZB1jsWa1IC3EGpi6IwblwlADtUKzJ63UqYdDnd
	t2JuXBlKb4HDNeoH1TdQRLgfMcrFOCLMJuWnKOW3FhnK
X-Google-Smtp-Source: APiQypJpUD2IU+gWxhauJfjP3/9GfO2pNn3i5Xg4of5Pd0BY0W3WBFVh2xfJeJThB9c+RV8vwtMhU7lGMJ+qioXhUz4=
X-Received: by 2002:a05:6830:22dc:: with SMTP id q28mr2594814otc.221.1587133477203;
 Fri, 17 Apr 2020 07:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com> <20200316160634.3386-4-philmd@redhat.com>
 <f570579b-da9c-e89a-3430-08e82d9052c1@linaro.org> <CAFEAcA8K-njh=TyjS_4deD4wTjhqnc=t6SQB1DbKgWWS5rixSQ@mail.gmail.com>
 <5d9606c9-f812-f629-e03f-d72ddbce05ee@redhat.com> <CAFEAcA-4+Jcfxc5dax8exV+kBJKYEnWZ2d-V1A6sm6uJafZdPg@mail.gmail.com>
 <16bd73d1-ec39-7da6-77c3-a18eea5992e0@redhat.com>
In-Reply-To: <16bd73d1-ec39-7da6-77c3-a18eea5992e0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 15:24:25 +0100
Message-ID: <CAFEAcA_1F2hpYp9TkKRGKgjQ7kjJ787s4Wr_6P+7fGBKeAwZPQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/19] target/arm: Restrict DC-CVAP instruction to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: i1XDodo9xxDW

On Fri, 17 Apr 2020 at 15:19, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 4/17/20 3:54 PM, Peter Maydell wrote:
> > Your suggested patch isn't quite the same as RTH's suggestion,
> > because it puts the assert inside a stub probe_read()
> > implementation rather than having the ifdef at the level
> > of the writefn body. I have no opinion on whether one or
> > the other of these is preferable.
>
> I'll let Richard modify the writefn() bodies if required, as he
> understand what they do :)

RTH is suggesting

static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
                          uint64_t value)
{
#ifdef CONFIG_TCG
    entire current body of function goes here
#else
    g_assert_not_reached();
#endif
}

If we take that approach then the stub probe_read() would
be pointless, so we should do one or the other, not both.

> Btw since we have this rule:
>
> obj-$(call lnot,$(CONFIG_TCG))  +=3D tcg-stub.o
>
> I'll use the following patch which is less intrusive:

This is temptingly less ifdeffery, certainly

-- PMM
