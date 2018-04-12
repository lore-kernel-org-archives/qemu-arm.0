Received: by 10.28.71.155 with SMTP id m27csp1726114wmi;
        Thu, 12 Apr 2018 03:15:16 -0700 (PDT)
X-Received: by 2002:aca:34d5:: with SMTP id b204-v6mr4949678oia.273.1523528115965;
        Thu, 12 Apr 2018 03:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523528115; cv=none;
        d=google.com; s=arc-20160816;
        b=qF9c0fR9aHiK4+l8F2ciJALBEZNV/wH/+10eIayI+BVuEdL7oaLD96zOh9LTxZF7sb
         hZtlvvEVraIUW9Pv+Sx4LbCT0EJf7KzFSZGuxDvkvq7Go3ZWNTj5Wou0j/1EVqVfDfZn
         3v6S43+rDTzVKMR+35cxkl82BGL7yuSwGFCsjI8DehSr/6kYWAWg4LOuxVQjH9wM+ELs
         HUuyNr9rt5VuxN5am2+KsRvai60jQBgf95XYOt7xSO3dkUrLb+J6TmrJPI6i6C82Zd6c
         Lr3blBfFLsGju3PoJLthG0OXxP7MysHyMWgjGjM1fvCh73hhBLwqHtilFDWMQRx5yktM
         mMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=IpI+Qgq10K0aL5O9pNdxuxP/YiGQZ8w8Y6d5VRICyCI=;
        b=uwH9qNv+zIRF7ypl3yTbodrjQlnLzfO7GLkxD4Ztd/pKw8gVobOkJ1znXMwHQtO2wU
         DQzb7xbX/70IFMcPQzWgubSIq+f/gvtJdCTyCQ2jBob8m3fdXbh3BCGCoU2MjnCkinSq
         SpPi9U67SfT8wc3Dt9mGR6VmH3jtn2oqo1VV5ueWn3LBq7DHDKddbRnlVUkrmHAiXBqp
         K5UbsxkEeJEF8BqL1aQHyPV0dtzTSXKgBG1dSgKLBRAyUuTNXGkbyZ4E5NbMsMyBwtrf
         OQZbfG6zK619rk+WG30aJOsCzfox9s/oZos/D5zeMjYIQXpJnzN1MFtTyYwebhbYOYY7
         ZwaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1t4oDie;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 23-v6sor1423241oix.150.2018.04.12.03.15.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Apr 2018 03:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1t4oDie;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=IpI+Qgq10K0aL5O9pNdxuxP/YiGQZ8w8Y6d5VRICyCI=;
        b=T1t4oDiemYhudRZonZv5YvAxn+ceOYh01r3nO00wIMDG+x25TpBirahEvdek6lXgsS
         XTIwnqO++gyboe5++XKcDARWd2BsHTZaH5vyBPt18DabddG/PMEU/+dbjGEYa+0nHaly
         azYf5rAaKmFTpV1sNMAYDj2I2LKUmS+I5hlmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=IpI+Qgq10K0aL5O9pNdxuxP/YiGQZ8w8Y6d5VRICyCI=;
        b=oDOT3e8/45b8Hq3xqGcjETPYbjwc+F2chZZzIkF815rQ0sUm+PEJhMyLB9oW3oB4Al
         4PWxs1Vs3YbCnKpp/N5wP8kY2AoG82tUVF9T4F7kJYG7k4uMzQAAqc7UA7EhK1hsZ30s
         bmwF3ISt85z9dwW4aTyaadCWpOh/+CoXzzrn2XzaPkiDkxtD5f0Pp2C5MeXAP8EsnyOi
         rPXK8P2j8iKGQZKqCfMv33IAPgEtLibusJCNABqIrj04Bt1UFMaQBskP2nxCl+hO+Q+G
         LvFBlMlurz7ccFGI0CMGapFeen4gfm+8dNUW7HjgTRQC5lQXM+9vU8jHD3z5akPfQcDJ
         cQlQ==
X-Gm-Message-State: ALQs6tBp8yraPUpOOqnwZK7crnyVqHBCMFAxHSxB30ZV8KERSa0G9ZsD
	dUWLA/SaMsj+ctKd8Y1Fm+ytADM4PmkJel7GC5Xh1bS1
X-Google-Smtp-Source: AIpwx48o9+/cUVO0101Ck3TaULnZ9M2xcM+vutCTDSxs9jeagwaU4wqtXDtuEf8UQ0EHlbGhL+VOXROkzjz2iz9yr3A=
X-Received: by 2002:aca:1c7:: with SMTP id 190-v6mr5538641oib.80.1523528115550;
 Thu, 12 Apr 2018 03:15:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 03:14:54
 -0700 (PDT)
In-Reply-To: <7a39d3f5-af2b-e21d-fa10-798b67fe4f63@lauterbach.com>
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <1521034084-17344-4-git-send-email-abdallah.bouassida@lauterbach.com>
 <87h8orcg3a.fsf@linaro.org> <7a39d3f5-af2b-e21d-fa10-798b67fe4f63@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 11:14:54 +0100
Message-ID: <CAFEAcA-2uZ_=POrmuHiXirTchUoxoD92ZfctrcMVj2s31XQXdw@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v5 3/3] target/arm: Add the XML dynamic generation
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Khaled Jmal <khaled.jmal@lauterbach.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: iL7t+b4fE/MM

On 6 April 2018 at 18:28, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> Alex wrote:
>> There is something odd going on here because if I run a simple little
>> features binary
>> (https://github.com/stsquad/testcases/blob/master/aarch64/features.c) I
>> get:
>>
>>   ID_AA64ISAR0_EL1    : 0x0000000000011120
>>   ID_AA64ISAR1_EL1    : 0x0000000000000000
>>   ID_AA64MMFR0_EL1    : 0x00000000ff000000
>>   ID_AA64MMFR1_EL1    : 0x0000000000000000
>>   ID_AA64PFR0_EL1     : 0x0000000000000011
>>   ID_AA64PFR1_EL1     : 0x0000000000000000
>>   ID_AA64DFR0_EL1     : 0x0000000000000006
>>   ID_AA64DFR1_EL1     : 0x0000000000000000
>>   MIDR_EL1            : 0x00000000411fd070
>>   MPIDR_EL1           : 0x0000000080000000
>>   REVIDR_EL1          : 0x0000000000000000
>>
>> However in the gdb output we see:
>>
>>   ID_AA64ISAR0_EL1           0x11120  69920
>>   ID_AA64ISAR1_EL1           0x0      0
>>   ID_AA64MMFR0_EL1           0x1124   4388  <-?
>>   ID_AA64MMFR1_EL1           0x0      0
>>   ID_PFR0                    0x131    305   <-name and value?
>>   ID_AA64PFR1_EL1            0x0      0
>>   ID_AA64DFR0_EL1            0x10305106       271601926 <-?
>>   ID_AA64DFR1_EL1            0x0      0
>>   REVIDR_EL1                 0x0      0
>>
>> So why the discrepancies?
>
>>  ID_AA64MMFR0_EL1           0x1124    4388  <-?
>>  ID_AA64DFR0_EL1            0x10305106        271601926 <-?
> I get the same value in x1 (= 0x1124) and x2 (= 0x10305106) when I execute
> the following instructions on the guest:
>   MRS x1, ID_AA64MMFR0_EL1
>   MRS x2, ID_AA64DFR0_EL1

Alex's test program looks like a Linux userspace one -- in
which case it will be reading whatever faked-up values the
guest kernel is providing, rather than directly accessing
the registers (since they're not EL0-readable in hardware).
That may be the cause of the discrepancies.

(As an aside, we probably need to add support for userspace
accessing of ID regs to our linux-user code at some point.)

>>  ID_PFR0                    0x131     305   <-name and value?
> This is not ID_AA64PFR0_EL1 - the ID_AA64PFR0_EL1 is not registered in our
> dynamic XML as it has "ARM_CP_NO_RAW" type.
> So should we add some modifications to handle this special case?

Hmm, this is an interesting case. I'm not entirely sure
this register absolutely needs to be NO_RAW. Deciding
whether we could drop the NO_RAW requires more thought than
I have time for right now, though.

In any case, it's quite plausible we may have registers
which we want to be not migrated (so NO_RAW) but which we
do want to allow the gdb stub to read (and perhaps write).
I think that handling those special cases with a .gdbreadfn
and .gdbwritefn as and when we need to would be the best
approach.

For the moment, this patchset is intended to be a "reasonable
effort" reflection of the system registers into the gdbstub,
so I don't think we need to do that now. If users have
genuine need to read particular registers we can add the
special casing code then.

thanks
-- PMM
