Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp825690njk;
        Fri, 29 Nov 2024 07:42:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCg6AV+pB2oJK3UBNZcuryY/2oLRxDL94DGPjG9LyaFVKzvmLLtSGelDyjbVrlsAtO9DKyFzFWiw9Eew==@linaro.org
X-Received: by 2002:a05:6402:278e:b0:5cf:c18b:b0c0 with SMTP id 4fb4d7f45d1cf-5d080bd9f5amr14558209a12.19.1732894940242;
        Fri, 29 Nov 2024 07:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732894940; cv=none;
        d=google.com; s=arc-20240605;
        b=F1luXXNomwpBuuAucWn9miHCGANPYPQ9PzsXyjkPfD0iyAcuKddgqbQj+g/l1vTIP6
         qRP6v0hAGo48bc8ClPtXmcNiBJt9tiV9+i0LMfbIu5Zu2teXfvnIXXqJs7RCz4uJk1O5
         DVaUe5muu4UykB8XvAswFZoR2XJkcAi4ArpRzWzmIenUC6SBU2NUZskftZYMmtpExzj8
         oPSyzbqx3r4CZseXdrkmftL1jzv9RNIdxlC+BI5TKH1B3webasJVQipWaeVGlNjSQPmI
         tVAzbW6PSpuUPPWL3uViQDIuXofEfkwkHGBqmsfGtPmsDEwDGuQ80p6P0badrPO2/uLC
         fxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UhwMp6LZ6FzsyEphdvEGwu2rBtsdacgIuy/U+/WBjQg=;
        fh=vYoKBwBrJ4PUOSBqIF4JW5oDLvAKLOUS6IPfgiCQ1lU=;
        b=J3Vhq54O9Tx71NCPplqQ9iQaGSa67M9uN/SXKu6Mvp5vJAmGQOT+pAF+4ElrXqd2x0
         2q5VGFVgWnQk5iTSAEhcQdPQpufz6J9Tr9CA9zSFJCHs7h3rqeDr3xbL37pV7GXht9Qr
         bWUS9nHjGsbcD0uNO/95CeCCAnLsmYKrd5a0qSIJr2qTFY3N4vmMYBY5ClbuHREpQteH
         1NJo6tEbFN6edzeMBWRsnCTp+LIXTS5hVeycWZeLyZX7ATTLHQea1kbpnPxOUW13tngQ
         0ZrgXuEBP4q8u6gqjudiZ2B/c1LbSyX2gKC/+hZF7zxTApjULQYgt1wD7JO7G7O0fVRR
         FaDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Epamu08h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5d09867c10esor1061224a12.0.2024.11.29.07.42.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 29 Nov 2024 07:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Epamu08h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732894940; x=1733499740; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UhwMp6LZ6FzsyEphdvEGwu2rBtsdacgIuy/U+/WBjQg=;
        b=Epamu08hVH9LaA9b1rs0mOfojo/7kGaC+DvpEr/dAOIR2WyeFrft2Y/a9bsKVnVSLS
         CmZ5USpvpZGidYPkyvk9rwB2/+7dU2+eRk7982gPhQOuO0rHCTsJKrYvut9uS+qYiRNw
         nL93E7gMySJ79etm79t3kz6AbZTwIagx7GtqpDBS0eyliUiaYPynl5n4L5v0fZzVuT66
         WNbrFtEaDrnKIYfUuygd1JlNkdEt1ubhPAQIhN/WDgS3EG4X/HdkGpwMi08xTH+7IW1/
         iLSY8iLyOVaABPI3QS4J+4jfwblePWG/qFTwD+FKnh6mo9NDKOyjXQQOuz19A7gikGJm
         G8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732894940; x=1733499740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhwMp6LZ6FzsyEphdvEGwu2rBtsdacgIuy/U+/WBjQg=;
        b=i0h1hc7bRVy8YF/P6ehhDUeAh//I4CZZRoCm1Cj1EOmHIcE2TXuQiLFUKX6jJ8vDWK
         Qyk86QnXOu7+z2IjLvGVIF/FPNHoj+5k7dGOJpVkmAw5ZqJY3pK1zfjdTKEeBZ0gHajJ
         CmyceotmWbThkcSIKvtIRdryexPcUhYy7bz/UDqxDz6xHPZyWs4Ct2NYyrARjN6mPO5q
         vsWVLp/Vn0MdeLEwHnRx3yJU7vW/4GoXx7QqXOLIg9w76xWs8rauJ+dlyDHElkX3fhXs
         eX7wgnkI2LmIXLhhurUeESfonSQ7uAyldfIjB/aNsjTM83rbnELwO7puK0lxCbkKZS5v
         ocnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhnuozcWMjTIMLvGYKk0OohL54VjmIM+MU6bdDDTRObR+fNcMSZGNbGpQcyZ1BfdZqSnrCArUCbgpp8Q==@linaro.org
X-Gm-Message-State: AOJu0YxvOqw09wC6jP9rd3owo4D0kajKzzBRpuAB1E0M9VhPDbqArnu5
	w7uyyRGhSBBiXn9tdGG2Kazo2Fhc365YcevwXv9udszDqVTH5om2y7udaQikNKy/GAdqsbnrNWc
	Bhvoay6+lH7SpYdlBZZECKvy5ELy4UPOesGMKn0pU
X-Gm-Gg: ASbGncvxRFE96H2YzrHjBbyPqYmSx0WnWc5abyKOfsZoYtkL1VjzefibG2eMz3ZOP/m
	LACurkJipSEK6MfzfFpsXCkw9F0L4ZyLO
X-Google-Smtp-Source: AGHT+IGLUvSKDH+4UWkxaWi8YnuLMe/vbJeTiNyrWy7eOGtt6PR+y7mTJNIziLOVYADYe6pHiOAUq59zWmrBSrZaB04=
X-Received: by 2002:a05:6402:13ce:b0:5cf:ab23:1f07 with SMTP id
 4fb4d7f45d1cf-5d080bdb609mr14641790a12.15.1732894939616; Fri, 29 Nov 2024
 07:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com> <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com> <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com> <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_EGxj2aqc_2-kY@redhat.com> <63c232c2-a325-48d6-8ed4-753a7c6e3b4e@redhat.com>
 <87ikstn8sc.fsf@redhat.com> <87frnwmn2v.fsf@redhat.com> <b7f25d3b-6ba7-4924-9383-74c1169dfe86@redhat.com>
 <87ldx2krdp.fsf@redhat.com>
In-Reply-To: <87ldx2krdp.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2024 15:42:08 +0000
Message-ID: <CAFEAcA-Pi4GRXyY3Lf-rCYk0CDZ5cT22orHT6JDxK14k9JMkng@mail.gmail.com>
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger@redhat.com, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	kvmarm@lists.linux.dev, richard.henderson@linaro.org, alex.bennee@linaro.org, 
	maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, 
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, abologna@redhat.com, 
	jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, 
	philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: O/sYLOeW/NkX

On Fri, 29 Nov 2024 at 15:10, Cornelia Huck <cohuck@redhat.com> wrote:
> The good news is that in many cases we only have differences in bits
> that map to a feature (and are actually writable in current KVM.) The
> bad news is that we have a number of exceptions.
>
> Comparison #1:
>
> ID_AA64DFR0
> f010307009      #of breakpoints:7
> f010305009      #of breakpoints:5
>
> BRPs does not match to any feature (but has a different meaning when we
> have FEAT_Debugv8p9 and 16+ breakpoints)
> [this is a whole can of worms in general]
>
> ID_AA64MMFR0
> 2100022200101026        FEAT_ECV, FEAT_FGT, 4PB
> 0000022200101125        mixed endian, 256TB
>
> FEAT_ECV -> may be 1 or 2 in ECV, with different capabilities (I guess
> we would need to allow something like FEAT_ECV=2 to expess this?)

This one was an unfortunate oversight; I expect that there
will be a separate feature name for the =2 case in some future
spec release. But as you note for FEAT_BBM below, not
every different ID field value always has its own FEAT_ name.
(FEAT_HAFDBS is another -- it allows ID_AA64MMFR1_EL1.HAFDBS to
be 1 or 2.)

> support for mixed endian -> indicated in BigEnd, no feature (how
> relevant is this in practice?)

ID_AA64MMFR0_EL1.BigEnd == 1 is FEAT_MixedEnd. Relevant if your
guest or its userspace wants to use big-endian, which is probably
approximately nobody in a KVM context but is theoretically possible.

> PARange (52 bits/4PB vs 48 bits/256TB) -> no feature, but some values
> depend on other features -- we care about this when creating a cpu, but
> migrating to another system with a mismatched range would be
> problematic, unless configuration outside of the cpu model would take
> care of it
>
> Comparison #2:
>
> ID_AA64PFR0
> 1101011021111111        FEAT_AMUv1, GIC v3.0/4.0
> 1101001020111111
>
> GIC == 1 indicates GIC CPU sysreg interface for 3.0/4.0, but no feature
> (I'm not quite sure how we handle this in QEMU)

We basically defer GIC emulation almost entirely to the
kernel (which will set the GIC bit in the ID registers
according to whether userspace asked it for a GIC or not).

> ID_AA64MMFR1
> 1000000010312122        FEAT_ECBHB, !FEAT_ETS2, FEAT_PAN3, FEAT_HPDS2, FEAT_HAFDBS
> 0000001010211120        !FEAT_ETS2, FEAT_PAN2, FEAT_HPDS
>
> both ETS == 0 and ETS == 1 indicate that FEAT_ETS2 is not implememented
> (ETS == 2 would indicate FEAT_ETS2) -- I guess we would want to
> standardize on ETS == 0
> FEAT_PAN3 implies FEAT_PAN2, and FEAT_HPDS2 implies FEAT_HPDS2, so
> probably fine

Yes, in general if the number in the field gets bigger
this should be a backwards-compatible improvement in
the feature.

thanks
-- PMM
