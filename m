Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2253568ocs;
        Mon, 26 Sep 2022 08:31:00 -0700 (PDT)
X-Received: by 2002:a05:6402:370a:b0:456:d006:6948 with SMTP id ek10-20020a056402370a00b00456d0066948mr16638116edb.90.1664206260681;
        Mon, 26 Sep 2022 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664206260; cv=none;
        d=google.com; s=arc-20160816;
        b=cw/C+u9569/3+A8t4hH0g8AEw2EQgtAyQhqQHySbcouWdkQDpf5qTk/SvrcRbGaIEE
         thJ9K4oIKK9Bz8Dv10hCIAgqWw+XfsSsI2z3DSuVlem7lSyOm9KrCXY0KWrZf2ZE2+oj
         1A+KSAdygVE0d+NH+BOlXD4nnqOcZtDtEZxdEudXMPfSKmrLNvbWT83XOge9yI2EpuKI
         VyN8PVNba5Wes0idN+UNrcLvwDIsN6T7BVlUWI7JMoKIna12Yx/7z2WclRGJaAqF7VKx
         b6oxjpEAWymj7zNwrtYD6TkWe/WQOociMoAkNCDdD1ylQZNhlsuLtw2Xy94IgdTcPE+4
         e9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i1w+NHuQMhjljZjgndrbvMVA/Y+/4lKXcc//Vrj9AcU=;
        b=uL1PGIcuxZKRgqJJuLQTCDJmyCmFKvQGCjshRmfFN7TQBkP30FqUNZHecLFVSvDTGE
         eyBO6S/THgksCEnVUJKIUrCirquOe2HH3Izh8QvrOpZYU0IAGhhu3XpbX7BhkmA84pA4
         cmrQ9K3xAg0B7yvtP1C+z65PIW4GOCcprJMqV9aHzVVLs4wImu7vrFEuzlz1Vap7VtoU
         QDIVFQSnSzGbTEAHhXOwPvAQC5Hx4qG1z8At3a6QVISH+lnp3Lih65UdMQAq/bu6aeSb
         e/DO4uDrOdRMM03gBWTgZ+FqtJAsCau2UKrREYlwz3RLlSa+P2Jenf2zjzg+jXopta/M
         nGpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evAOoLqx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v15-20020a50c40f000000b0044ecac7be0asor8435780edf.27.2022.09.26.08.31.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 08:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evAOoLqx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=i1w+NHuQMhjljZjgndrbvMVA/Y+/4lKXcc//Vrj9AcU=;
        b=evAOoLqxDHUyK8vBDOt65xJhE65aIo5TZekdWhRuq8gFzsi3krxQnUCzpMlXVCWXXe
         hlDo3RVNDBzliaofuwZb93fwFQXZ0m9IYafKaS/LuRzfqd/TUddyIsi80RFCVbucSQQs
         PloweiewpKaBxgd3OipUSynr3G9rSJKmVN59WgBhkQxxY1uSsSlmhuzHPek0LSJehOzA
         Z410hxgaGBvHhIUPpsYUVVeDcMyV4A0CW1IcuvrFztrThuo5InUPmY3EFnG8oGjOOaxv
         riPJxhPvcSDT2pfqdUl9WM2J1Zo0Nf4xJEtR+OliLllDUjYaMbISVGDAgeftgegppNTp
         Z8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=i1w+NHuQMhjljZjgndrbvMVA/Y+/4lKXcc//Vrj9AcU=;
        b=uEm0ahgpst5x2WAm4tztXVUAeFhijbzTp/ChHIA2woVzq8JbN6VVy4ger/7r4AXvVa
         8bspedit2gClVVYs5KGP76zs30XUgtfzS8X3i4I97uQERZgLZt0WixjfIEUv3TFqbAJm
         Czp5Rr2gju4ZofGQTWd6y/t6fXAkhuxeYY2VHeylJEyUL20P4RSQH0mQPv9HDiCpyKRN
         NGzaxXv02fgbn6lz/oY8DfGvoJ9hxRq1CpYmwnzXXN4DXkCLD9eFyeBdIkW1GRI1s0EH
         ecw7QIoE4mF16MF3HRR3lmRcjHY6BUX4BB5jOTkP85Th2AD4kVj4Fu1GylD3AmaetfVZ
         NyCQ==
X-Gm-Message-State: ACrzQf1Mu+0bAs4U1tZMJlAs4g1w4JvCHhRJxRQaFY9BUF7diJAKslC/
	OfEUF5sNNsJedTwDwyDJLKMlPoqrpd2R8TaQ/a80KkKFco41+g==
X-Google-Smtp-Source: AMsMyM6zr0hi5quIaxXHxVo7TLMAeH2Yq0Iwplm2f7iGpNq0bxzqBeaDhFn20t1fe1uriOj8m1vht1F9pGzcXWcMsBs=
X-Received: by 2002:a05:6402:350b:b0:452:2b68:90db with SMTP id
 b11-20020a056402350b00b004522b6890dbmr23150939edd.255.1664206260225; Mon, 26
 Sep 2022 08:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-2-alex.bennee@linaro.org> <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
 <87h70u40ql.fsf@linaro.org>
In-Reply-To: <87h70u40ql.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:30:48 +0100
Message-ID: <CAFEAcA9NeO2MZpybhA8voH-3o5k9Cqa4EOg-0nk91gzQ9JJrPQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: s18OV2vFrHs0

On Mon, 26 Sept 2022 at 16:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I still don't see anything in this patchset that updates
> > the code which currently assumes requester_id to be a PCI
> > index to check that it hasn't been handed a MemTxAttrs
> > that uses requester_id as a CPU number.
>
> OK I'll update so all the existing cases setting requester_id also set
> the type to MEMTXATTRS_MSI.

The problem is not the places that set requester_id (you can
arrange for the default to be MSI for back-compat if you don't
want to explicitly set it), but the places that *read* it.

-- PMM
