Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3489183lfm;
        Tue, 1 Jun 2021 03:31:15 -0700 (PDT)
X-Received: by 2002:aa7:d54c:: with SMTP id u12mr30904654edr.242.1622543475227;
        Tue, 01 Jun 2021 03:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622543475; cv=none;
        d=google.com; s=arc-20160816;
        b=AVR77f+sqFmi5vm0pjmuUP/yM8rwwDkc19/dMvz5zneZt4f6n2u0UdtBVt37NgK0AA
         CU7jU7wqRij0R5WTXT7G7/Lq0dvPi1Qmd8qyFHnbPS3ADLdetU2/Z9GAEQCRfd30tq4v
         JvmvQO/V9qGpThMRWk565r7rpOsqMbr2PAePHM+eDYL6obQePUdThrtDLxK8QEml9mpB
         1HsqAaI3RL0rtpXUmn5hMxS48+vrFps7T52k3Um5pvyih9Y+K6TKyNj2NdO5UEoBJUAJ
         OR4P4QRCum872PFqecAvhI+ovJlx4M4JSlqIuVoINbjeQJxvxFaA3dlcZMFK66NdYk3E
         TX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PM6V/8ffXbbgYXotK9ACNapZ0BGTNYWm5iPNjsZ7hjA=;
        b=NDqdwJqCO4ZWmPEOAHVvoo0RKIistMpAG7JWzG7SQeAet1eSExOeatsLv0xVBWUJ+7
         HyO3TVq6hxFJUymSMTwsxm/A+WEFWAyTQgfJF5UzMYeKPVjv99FEH3rFiK9DR7J9NE3e
         PBuzcvnNfStgHR5qxoF7UH2gRYKXdlS/iUn9wyrkVT0njERptOBi6hPV0Q72g6bizBMC
         deujpyR8GaegcXffD2Wjz+lfYdtwmAXuOtSdrn8ZsYjOxvVbyj7B2D1iyFr/2ivnzp5n
         z1HL9LocG7GFioxUBXLf0UAg8o1/biSBtU8BCyEDpjVsNoMcu85dTAJAHIxZeBiQJ+Ja
         j67Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrpFqNzE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id go16sor6045994ejc.18.2021.06.01.03.31.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jun 2021 03:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrpFqNzE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PM6V/8ffXbbgYXotK9ACNapZ0BGTNYWm5iPNjsZ7hjA=;
        b=JrpFqNzEEGBeIFBJLOBFbRwpT5U1+xA79qQL6y4YHJuZQ7QhkxhdRn0DbDz/XfS1X7
         ujx63S8C3SrIvXSLNWW0QaRJGoCuX6bCnhxX/cDBJpEskR/YKkKfy6GwnoLTLVoi2ay6
         LRkfpSHu2slqemHXczw3AAeBWyei4daR0jf2PKCuyTBEO7spbmygfEMWNPB8tjbPtLtt
         ESn4nkKU3B5dvjRroGU07U7MYBq+fzTSiQT6cRDgHj4olHPgzNpiy4Mp27j+L+bIwJpJ
         o0Rx1msttbGVzn8g4U/i5nH9IwqBRQoLgp88xVp0MY3Ui3i2C6ox8H/ZhTo+H9S4vty4
         +Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PM6V/8ffXbbgYXotK9ACNapZ0BGTNYWm5iPNjsZ7hjA=;
        b=NG94H0oXbKh7WG8COmQ3ECGq/taLa4B/fIg0tmjpOwwcqGxBj2pzg27c8tFbc4lcTG
         AMx67UjBRKVCMqq+FHy1KEF3FNNCAgev4MDYSCJsXIdpzi5UWglkH1QDPWANukZntdJv
         TtkgYA+lIw1hbhy0nOH7/r1aZ5jrrt7wu8rSoTPXRjiswKbeirle6/F1aktEHVTBqj8a
         ZKNV93Y/kNOCfPaaAB73ejGpNF0E7Gk0/iaE1TLB5x2IOk7RPeLdBU8US00KBoE7K433
         EqKkfgU3jDo5WYLm8wV6pX478Do4H51qjEsdHyWymp0HcRMCm7NBIjOAOYB4MS1KAiyz
         o2CQ==
X-Gm-Message-State: AOAM5323U/w7a1v7zaSORONOq9a7IOAdkrp22oo2nYrxhjVlAAMKatPv
	mtcmpNsXQWNsCJCLDYw8PkFK+gYeeURqlnk+QM+kVa26AW9FZg==
X-Google-Smtp-Source: ABdhPJz9YIWeN/GqezjhAwuCBuIA3ER7g+btw5dHSE1Q8t3kyEetxCB3NqtGKfue7OROWEh2BR6x7XvVMNcT+MIQu20=
X-Received: by 2002:a17:906:a458:: with SMTP id cb24mr6524568ejb.482.1622543474959;
 Tue, 01 Jun 2021 03:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
 <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com> <87fsy1dhke.fsf@linaro.org>
In-Reply-To: <87fsy1dhke.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 11:30:44 +0100
Message-ID: <CAFEAcA8rre_ADS_x0TJpgeBOx=KeEzs1Q-pSiAtVK77G2tDLxg@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew <astrauss11@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PpjN8ZVEkteW

On Tue, 1 Jun 2021 at 11:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> The previous numbers were a guess at best. While we could extract the
> >> information from a loaded ELF file via -kernel we could still get
> >> tripped up by self decompressing or relocating code. Besides sane
> >> library code has access to the same symbols in run time to make a
> >> determination of the location of the heap.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Andrew <astrauss11@gmail.com>
> >> ---
> >>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
> >>  1 file changed, 10 insertions(+), 9 deletions(-)
> >
> > This seems like a pretty good candidate for breaking existing
> > working binaries. How much testing against different varieties of
> > guest-code-using-semihosting have you done ?
>
> None, which is why it's an RFC - but at least one user reported newlib
> attempts to use the numbers we gave it rather than falling back to
> numbers it knew from the build and getting it wrong. I suspect any code
> that doesn't have a fallback path is getting it right more by luck than
> judgement though. I'd be curious to hear of code that relies on the
> numbers it gets from QEMU.

Well, newlib is the main one I had in mind -- does it have a fallback
codepath?

-- PMM
