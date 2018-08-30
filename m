Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1805890wrd;
        Thu, 30 Aug 2018 06:29:03 -0700 (PDT)
X-Received: by 2002:a02:3f11:: with SMTP id d17-v6mr9242348jaa.36.1535635743806;
        Thu, 30 Aug 2018 06:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535635743; cv=none;
        d=google.com; s=arc-20160816;
        b=tnaDDreVVQxOFJ/KyUIOYcEpdk3yPWOyMWFNaw8ItPy4cUqdELt6MjkjcjAJzJ/6h1
         3fIIE7zt62ArmZ7Y9S1vT0bO2HMNEN0IBLMw8b23HfoVBO+fF2vyVXK4bHZ/fspWM74C
         cMDh4XtpwpV0RbDfOmaTNEdkLuUAUkTf5e4flKd9EY/T78K3S6QOL57P5f+7Bupo250L
         3r4cCdMEaRoRfIR1t699VKdk9+wevZF0OHLAL9ErI6bs6md5gfEz4pLaMHd7sRS+7sZy
         L6iJbC0rXR9/JViH2rw1l/CK4/p7e5FK41zb3UrXg8mK2Pk1dFPOfIzSEyGm3jyGnXY7
         OwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=UlOhFhNFUGUe03ZiyxSHrX8u+DTCOvNVAV98qGDyCbI=;
        b=dIZZgYe35y71dMeJTA3xCxqqiLoHVU1s3otc7UzSzJ64fFczYHh5nQAzdQRUdhwEjn
         PFifFosCVIbZc911JDwaaLUAc161ota+faZ7m9GCSb2qchAW+vvQbSvhx/eG7wef1v+w
         9ry2TuGg+LrnHZJaaIN4o7paMdk9VLs79s4pkiHl6Rt3UYgtOHRpfjqHlc8V3r2MqLhl
         ir7yqb36/WIIRDO79xauRs1ArQXhBqxyjx+cc9/dE9h2FuYDyvJgHgdYb8al+VABjaku
         Yk+S1Ehpsuyz8m/FtFgloiqP50BXVOUXtKSXTmHIoeKquNnVET/C6hsgUs0p97XS3aDL
         J9GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKI8Xd7P;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q82-v6sor2347531jad.38.2018.08.30.06.29.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 06:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKI8Xd7P;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=UlOhFhNFUGUe03ZiyxSHrX8u+DTCOvNVAV98qGDyCbI=;
        b=aKI8Xd7P7bwm8/fh5RiAboneNJt6YY9fxHBaqDuNYmB0bGL18Iza13judeXP+0UKA7
         Xt7/d4Q1U3IBlgVyXYinzLmNw/elQjSoRKIt1kuPfUOhvkXlNebMwnr6qV1I5aDp9PHl
         VcZpdyQ+JgehsBIrpAMIs1JCA2+D6pgRz8C/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=UlOhFhNFUGUe03ZiyxSHrX8u+DTCOvNVAV98qGDyCbI=;
        b=pzCYTo/Zmle7geT5qzewUgqZHKVgTvPwRub8XawbA5cY8qIaV2Cr9hxzEvmjOw3NF5
         QmBGtWVRy2WL0gEBMXkwYQSmNpxnf5vbIk1hcxQt07vY5SDNUNTXAz531X717MzOq7fx
         RSVHGAdU2kVylZN1DwdhCUua3/aM3LxwVl107Ca1d//+uCt3lQrkKVjsvKuqPdOjzghp
         4gxcrK4QH+4wifsu+EztYsTH4uACw457yCFk0Dba1+lh6oULd0/sdIjNQiFCRmm3usHk
         P/FtlLjgYz/2Dp3MI7J4jZeHTo3Fkz8O5/jmiuOwsyZiahSc1VSvsday7ekaKFvc8Omf
         msrg==
X-Gm-Message-State: APzg51DE+6Dv7kMerUZTxvs9N4Y94wBcBqYmLfn/lI5rioOOX+zWp7tU
	L6KLhMbNhbMKnCqqXjGbBGlhxamfVg56R/zWZXvUCg0r
X-Google-Smtp-Source: ANB0VdbzrEwUORJ0ltYFuNFiTMyeNGnZEd4o8Ebkp+Rm0Kb4gBYwfIKwVkfYAV3bMdbiacjwYFJ7tbtFwl2KY/TDke4=
X-Received: by 2002:a02:4d1b:: with SMTP id l27-v6mr9280267jab.86.1535635743278;
 Thu, 30 Aug 2018 06:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 06:29:02
 -0700 (PDT)
In-Reply-To: <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net> <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 30 Aug 2018 15:29:02 +0200
Message-ID: <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: u1VLDbeu1kT3

On 30 August 2018 at 12:02, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> On Thu, Aug 30, 2018 at 09:39:33AM +0100, Peter Maydell wrote:
>> On 30 August 2018 at 09:31, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>> > On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
>> >> @Ard, @Leif, is there any possibility to remove all the DT nodes?
>> >> On real hardware, how does UEFI find the memory size and CPU number?
>> >
>> > Usually by asking some form of SCP/PMU.
>> > So until we have rock-solid multi-cpu-instance (making terms up here,
>> > there may be a proper name already?) support upstream, we need to take
>> > shortcuts.
>>
>> I would expect that you'd want a "faked-on-the-QEMU end" SCP
>> communications endpoint to start with anyway. We have one of
>> those for vexpress, for instance.
>
> Ah, I wasn't aware we did!
>
> In that case - sure, that is probably the more sensible solution.
> Does it emulate SCMI?
>

The purpose of the SBSA/SBBR qemu machine is prototyping the
interactions between rich firmware and the OS for things like RAS,
secure variable storage for UEFI or capsule update.

How exactly the firmware figures out how many CPUs and how much memory
we are running with is out of scope for this, and so I don't think
there is a need to build something from scratch here: DT will do just
fine, given that both EDK2 and ARM-TF have working DT code for these
things.

fw_cfg, on the other hand, is unsuitable for us. Generating ACPI
tables in a different way from actual bare metal is not a good idea,
given that things like RAS interact with ACPI as well, and fw_cfg is
also exposed to the OS in the default mach-virt configuration. So we
could tweak fw_cfg to be more suitable, but I think that does not
improve the usefulness of our prototype at all.

At some point, it would be nice if we could get UEFI to receive its
platform description from ARM-TF in a generic manner, and it would be
good for EDK2 and ARM-TF to align on this. So even if we decide that
SCMI is more suitable way to convey this information from QEMU to the
guest firmware, I would object to implementing the client side of that
in UEFI, given that it should be ARM-TF that provides this
information.
