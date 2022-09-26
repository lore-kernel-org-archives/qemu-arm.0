Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2216527ocs;
        Mon, 26 Sep 2022 07:34:28 -0700 (PDT)
X-Received: by 2002:a17:907:8a04:b0:782:5277:2bac with SMTP id sc4-20020a1709078a0400b0078252772bacmr18418830ejc.128.1664202867903;
        Mon, 26 Sep 2022 07:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664202867; cv=none;
        d=google.com; s=arc-20160816;
        b=ToI9GgNO/X/DmiJ+U/Z42I3vae2OpWqUeg0z85mz5XsL5HEjgO2a6wO6/zrDYWgjve
         S2wJKmUWW9kSA57UbfDvCfZ28rvCZ1iPzAyiN1gYiOVlGz/K5uL3co1XutBrxVXkQLTb
         R4h7se53PQ4UnE8UYvqDOKKkjBUSA1dGvklI3qzANHuCWFWqtnqsEVrU/2SFwcVXKNoM
         0zjksDalU3el0TcxbtLFOTlv800/vJ0ovoo80Y/XhQWuXtASPvYwuESK074wRSkDpeKb
         3d797Io8WHSAs6mcc/JZDXPJlHLUExJvH43yyy/6M+r4tL0AhPXa9dD7sGNmp0h2wngx
         KnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wx1S3Igs58VzDESNamzMgnXVPNzPs5LzlY97a7v4iaU=;
        b=Z0T4Q6l5uBqYyUZfESi/ZSC9BYJ+BkTodr+1/fnwMZbIODQehB01qk97Gn97tpXmke
         tMUmduzL9Mq6eTzIE1a2+r7S3Tq6+CC7uv+g6zkm2lt899v26G3k8bbulDrA5BT/XYJ0
         66GfRsbYFUSdHfjS5kyAr5aoOF1reVkxzPI0pyGKPrQ83ptGkB7i776aEG9LaZ5x5R7n
         Z6WQa95CgKGPHbxTgrtTcGRoRv4P07gdy82CPP1yEiME8zOH24GcabubGFYfCErWDGCd
         LUijfA3PkxWNSy8A4ynde5dcCZMsMGaMMhnIQpRYBC+Zx/exhb1Z1Fa0jrszEv7lBbWL
         C6Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNudQFDB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g23-20020a170906521700b00783a85af831sor1051639ejm.118.2022.09.26.07.34.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 07:34:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNudQFDB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Wx1S3Igs58VzDESNamzMgnXVPNzPs5LzlY97a7v4iaU=;
        b=cNudQFDBeHyKYeum50rnmY+j28kDvHVU8oIJO4mOFuRckrTig5g7NNSJ3qfwt5035a
         15UPaUSkfdCQE0mgg7Z87psK6W25hKJbr9521TjSTm7mQ02+fb4Q5wZCIxKezT9muvve
         OxefeHCEI8NuDnYSF2B19uHq242vzwiJMIB6FOlCXLbyiNtbexk3D947MSGA7p43AAoe
         x+hV6E42itXFAcBp+s4IrPDSZ3Sxz+MPnnNmZNmiHUTcq7RE8rm8qxPBKgxo/vGFJRlj
         geojtOPRLqpa2HCNrnD/8oHilQAk6I23z16DmE09C3GSL0C77H5hL0kbH9rPm0YT1DH3
         /ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Wx1S3Igs58VzDESNamzMgnXVPNzPs5LzlY97a7v4iaU=;
        b=QvZyJ1P43v5SFdhJpwO5hm7bhpr0i5Y4EG3XKwC+lIgDwoYgMaiSTSFgiQZ7RdxDhK
         d6Yb/C1weOCHqlClfgjW6MgYMqnIgkksAb/PICKYceN6lr21HdiQyq5Mj3qsUZHstLHZ
         nJ82JoIyON5JqH8tqmMDbA/muQwo73EW7ZEBD8mF+H3FcvgvszRzkV9eabW9N+/0ZTU8
         V61/OuoviGHRSZ9ikOkXfKhbXmFlLH4Lkr2JL4V4HJD/NccEiDdFb3KOGviMH1bHLrwY
         hzsxhgY9Jo+aG81DpUnpk6r7WBbMPaOKUBR2foPjYnL2HrrXiYL82IRqXAP4VTRCRK3j
         LFXg==
X-Gm-Message-State: ACrzQf3pkD5R9ksYnUAvvWvVLFwnUloHILPS+Ziz3tkKtFGRjWM4QDfd
	y1msHO58sKuhe36m0iHPKPhwgM33Mzx2T31RoDikTjURhMsJJw==
X-Google-Smtp-Source: AMsMyM7JBsaLr4cL7H0UZiQk5j20JuRrBKzsbkQLqY4PC8A3wPGhoyPc4zdgaUgnVXslRLpH5U5UfgtLsPXWrGA+3oY=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr15471198ejc.36.1664202867490; Mon, 26
 Sep 2022 07:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org> <20220926133904.3297263-2-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:34:16 +0100
Message-ID: <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: lqf8FW2oqjfP

On Mon, 26 Sept 2022 at 15:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it to mention if this is
> a CPU access and which one it is.
>
> There are a number of places we need to fix up including:
>
>   CPU helpers directly calling address_space_*() fns
>   models in hw/ fishing the data out of current_cpu
>   hypervisors offloading device emulation to QEMU
>
> I'll start addressing some of these in following patches.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - use separate field cpu_index
>   - bool for requester_is_cpu
> v3
>   - switch to enum MemTxRequesterType
>   - move helper #define to patch
>   - revert to overloading requester_id
>   - mention hypervisors in commit message
>   - drop cputlb tweaks, they will move to target specific code

I still don't see anything in this patchset that updates
the code which currently assumes requester_id to be a PCI
index to check that it hasn't been handed a MemTxAttrs
that uses requester_id as a CPU number.

I also still need to go and look up how hardware does this,
so please don't queue this patchset yet. In particular, we
should think about whether we want this to be:
 * a CPU number, but only set opt-in by some target archs
 * a CPU number, valid for all target archs
 * a unique-within-the-machine identifier of the transaction
   master (i.e. which can be set by DMA controllers, etc,
   not just CPUs)

I would also like some input from Edgar since I know Xilinx
have some more extensive out-of-tree uses of requester_id.
We aren't obligated to not break out-of-tree code, but that
seems like a bunch of experience and knowledge about how
real hardware works that would be useful for informing
how we design this.

thanks
-- PMM
