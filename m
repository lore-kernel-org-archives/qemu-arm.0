Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2335413wrp;
        Thu, 26 Sep 2019 09:16:04 -0700 (PDT)
X-Received: by 2002:a19:4347:: with SMTP id m7mr2661472lfj.146.1569514564557;
        Thu, 26 Sep 2019 09:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569514564; cv=none;
        d=google.com; s=arc-20160816;
        b=TG91p8uNr4EaQ9NGtXyHp5Pr8fsAeouLRPhVSYQSL4ypU6uNbVlCvPNyFoZ2zAniSf
         6Xg9uEgzMS3viVfNGFzm/HopEN+nSiiJRSdWTVKfbW3PWpJwBNRZ5M3xIdfVLdFhdbiG
         oLCfy2/rc59BO+4zfLQCQiEaW1ntOniCyFl0xmzMhi0C2ITeAS9/utaVJ2mPBA40F9vt
         NR4GURUHfQjPwOu//Nc2DDR5NZl0MiIvuA7O57oo4K8QvfjjtdbaEz2SVS4FoQ5H6/Yb
         Cnp880b65DJGFasu1WPwGIOgKnOpWIEAhebf66o+mg2XwaxCtmaXxrgHLlBbpnQ17ZzH
         nJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqsguunlShpqJNqDpG6lT6Vkk/vUY2GxbBa3kyTdV2Q=;
        b=T+vd39uqUDySPh6lUTMIkXZk7gJ6sca/I/fdKeXj82d8k2pUQyc8mDnaJ47Hc3UEsm
         CzrJn4mFSXbcqTTepyP6nX/od4nCeYdQH3pElL4ZIANAWTNv1y6VdWmjv0rQNVrB2LQi
         6iDZeFzxEaQ26tfWIroal2GRalXdHou/KuTA7/TZY3bGgGWCrxvTqiE1w9sfldHD6CjM
         ibhP4C6VbtDiY25L4mukOmSwux1Q7l3RCi0NCvvnYUr6XXiekLcQpuW+EBC9f5Yqqg1e
         60aprCKyPpUoqGEksbSojs902WPTKKNEdhE4CuvKXmlVqtaDcf9lkQn3fIcOjmU4Qw6V
         DitA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l2pYd1Ak;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f21sor1912623lja.10.2019.09.26.09.16.04
        (Google Transport Security);
        Thu, 26 Sep 2019 09:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l2pYd1Ak;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uqsguunlShpqJNqDpG6lT6Vkk/vUY2GxbBa3kyTdV2Q=;
        b=l2pYd1AkoxmHr7LHM4VVfFpuHI0MY5Uv5wtL1RSWoNnWPKicoIU7khFPfKHu/0hs+4
         cY05pyOOlCBsH+nACIq9802l+7N4pkXHL9EZPkByVdiIOi+z597Gq+BL1q3t8xyLmvuG
         Xxp7GdQOflqcZE6qoUHTWbgGCDbnucRmXtyCFueYnZAM5cr/dUsGLLdIA+TvtJ4NocF6
         T+Xk8bnuXUVR/5dMTDPRk9vnE1zMo/o4yhGtfa3co5fEPdiqw60oJhoYsVE/wxWSte80
         0m1Wtv1y4HMgtyQ9mfpgc9QRF2c9RIZU01q/9jiuZ0GMqI7mDc2m0PqoRJ7Ev6y7W0Ch
         1EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uqsguunlShpqJNqDpG6lT6Vkk/vUY2GxbBa3kyTdV2Q=;
        b=VBqhCF/3UuHZGiAB7hzlh4f2qZgBFA1IFXlvbbHjWJVPfhThiYP3gJwl+7p44gN0/z
         3fLdYvn4sljHGDR/O2dY5MmUvjcYo31YopX9Q24YDQ54dFnoUKtEZ2PiPnEajYbvrVkL
         lesWwU41EDUkdRpIPqBc3G1W1REggL4iEf8PFLOU0CgEZKDTOZBjr3hBB+nbOpJx0rza
         883if8oMIh9Sil0OMy31/cmsuVuy88UDnJopCy3wuyzYL1TmebRPE16006a4XI+pu+qg
         zYrHj+D3ngkka80LKXzSPnqJowW7mO8ZDRdfCfzuowmlpCrXsNENXwgefG95+SyWqb1U
         HCTA==
X-Gm-Message-State: APjAAAUVbLoNF8ItQ+c2CIkd9RehQpE3ZyDacuohEWOgtmUur8omhu+H
	yn9SVdOb1POB3dYpIYaN+wmna0KatI1+4OhY350ncchx
X-Google-Smtp-Source: APXvYqwkHW3JOaT++fWR+7HZQXosIMjUu9HNmt0jS9yHUo48urz3VedxfHaMj56jBuxlb9yiRCeqDKZxg5C4MPtRfP4=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr3249154lji.85.1569514563687;
 Thu, 26 Sep 2019 09:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org> <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <20190926125817.GB19660@redhat.com> <ea6b671a-0c05-d880-3b9f-62a4f8626ec1@de.ibm.com>
 <19efe3ee-a532-cf66-a5a7-03a7c053737c@redhat.com> <87d0fn9ix8.fsf@linaro.org>
In-Reply-To: <87d0fn9ix8.fsf@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 26 Sep 2019 09:11:17 -0700
Message-ID: <CAKmqyKOSyhd5zv0hOa_THCX8g1fxN69NXWxCw0m+=TA+8h0Wug@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-discuss <qemu-discuss@nongnu.org>, Christian Borntraeger <borntraeger@de.ibm.com>, 
	qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: u1ZcZLnYDzqb

On Thu, Sep 26, 2019 at 8:41 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > On 26/09/2019 15.46, Christian Borntraeger wrote:
> >>
> >>
> >> On 26.09.19 14:58, Daniel P. Berrang=C3=A9 wrote:
> >>> On Thu, Sep 26, 2019 at 08:50:36AM +0100, Peter Maydell wrote:
> >>>> On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg> wrote:
> >>>>>
> >>>>> The 32 bit hosts are already a second class citizen especially with
> >>>>> support for running 64 bit guests under TCG. We are also limited by
> >>>>> testing as actual working 32 bit machines are getting quite rare in
> >>>>> developers personal menageries. For TCG supporting newer types like
> >>>>> Int128 is a lot harder with 32 bit calling conventions compared to
> >>>>> their larger bit sized cousins. Fundamentally address space is the
> >>>>> most useful thing for the translator to have even for a 32 bit gues=
t a
> >>>>> 32 bit host is quite constrained.
> >>>>>
> >>>>> As far as I'm aware 32 bit KVM users are even less numerous. Even
> >>>>> ILP32 doesn't make much sense given the address space QEMU needs to
> >>>>> manage.
> >>>>
> >>>> For KVM we should wait until the kernel chooses to drop support,
> >>>> I think.
> >>>
> >>> What if the kernel is waiting for QEMU to drop support too ;-P
> >>
> >> For what its worth on kvm/s390 we never cared about implementing
> >> 32 bit.
> >
> > Looking at tcg/s390/tcg-target.inc.c :
> >
> > ...
> > /* We only support generating code for 64-bit mode.  */
> > #if TCG_TARGET_REG_BITS !=3D 64
> > #error "unsupported code generation mode"
> > #endif
> > ...
> >
> > ... it seems to me that TCG does not support 32-bit on s390 either. I
> > think we can remove s390 (32-bit) from the list completely?
>
> It's the same for riscv32 I think.

I think riscv32 host *should* work, although I don't think it was ever test=
ed.

Considering that we have enough trouble keeping the riscv32 kernel
booting it's probably ok to drop it from QEMU.

Alistair

>
> >
> >  Thomas
>
>
> --
> Alex Benn=C3=A9e
>
