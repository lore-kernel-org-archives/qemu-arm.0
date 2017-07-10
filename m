Received: by 10.25.44.15 with SMTP id s15csp3328432lfs;
        Mon, 10 Jul 2017 05:20:19 -0700 (PDT)
X-Received: by 10.223.164.29 with SMTP id d29mr6864313wra.183.1499689219047;
        Mon, 10 Jul 2017 05:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499689219; cv=none;
        d=google.com; s=arc-20160816;
        b=QNqAd4inbA3fAIP92FLi4JaUaFZMvdMg6mi2jdMZIApSFGkvuj8LIlix1ABjMvSobC
         7v1uO1xFSm7Cew7B9OYjDGJKoYvbAyNJRqN3msV6fw0odAfv/CIw4rf3cZx0cfqXvlAU
         yNliNL1tU1i0ztxnHwfygdPb40U5YhtH3Y9N2Yia60aJjoUMq2+lodRgzzYT36NNy2LY
         hJCtEMhe/3lql9ZcyNQcjEqx1msi36f/YlGehF7FE6+jkbhrXRY4SUvOHAIPduCeLGf5
         81J3M9nJoCiRaZnRYFltB7oklNj4tvZyYIJNgtzRVha4hpaRyAspQD0/fk80oxd2ElRH
         sVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4MM1K55TRN5qgS5mLtWM2pRPZNpDqAY1UnD5C+pKxxU=;
        b=A5ClIapwzixE9tc7i8ZoJ9aCaYyYCXN9/VjZd8x5sXIlzMY8mvKaJpE5hyXRL4K0nn
         zcSc+rO9BUswytrfYGhmkL1zBzpyOj7v4GeKbiOVSi8WPwalKTnErcruaWQxMf4NA2bE
         K0zxqtDX+bJgr4eMOxCSiAC9dgia74iBDwHVFY4UMhyupKjThlH9SiPSwK7kwtAyphSj
         eU5mGSYQ+HwlyMSplpWwg/AAkVZoYha+C+GrcrlVx+84+LUApUMC0HUnuRg8Ns3ZCjI7
         /cWUm89NBIRqHq1Gp1x/YibusDNhoxwHwj3rt/AqP3H+DAG1vHOb138NT17gCoLNaC1M
         H4jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=H8oVsZ9l;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com. [2a00:1450:400c:c0c::233])
        by mx.google.com with ESMTPS id r186si6611598wmg.61.2017.07.10.05.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 05:20:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) client-ip=2a00:1450:400c:c0c::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=H8oVsZ9l;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x233.google.com with SMTP id c11so136451540wrc.3
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2017 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4MM1K55TRN5qgS5mLtWM2pRPZNpDqAY1UnD5C+pKxxU=;
        b=H8oVsZ9lzTgSiCuzdSdoPwMnYREeXpEZw5BDpQPWoze+/BsuBtt+9ctK5zOtpjOa/d
         bHWzEZK79MRy8GhUxcBPQa3UCSE6IOgKqqeuVJdiwlr6fvPiKqxm9+LGeTfMpjrhglWl
         VCGwjheEkey0ufkdj2GgHRZPGhA6exF0njdbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4MM1K55TRN5qgS5mLtWM2pRPZNpDqAY1UnD5C+pKxxU=;
        b=t15sV+dN5MPx74OlMG+bWR9CVQciMlUhXkXlQj31en2c0ukaQriH2bNS04qSVwenho
         jJtqtk09gYNQkH5AtqxN5di4GCJ04Z/lk84lSkW92e9sItAQFiBE9of4+IcQB0UN19Pd
         SNpSlGENapsFSrzBVwkSJqhwLwhUt3s4fM1pP/bM2WTl+WrOoNqDKhAEwc5gsiWJSLTi
         KCCfAIrzYDh/HpwXzBY8pVjLOLzdg87StaKg8A/eQoa5AVibIf5lruQXCPnxCqNBhSaj
         cXJA6TSdPpyMwEvqYWHOxaZXwZZzKyWSCzt5WK9K+FSXJM2nZiK3bPfcoCyA2INnpdt1
         p3qw==
X-Gm-Message-State: AIVw112TF8Lo3Z6Q+VM11pYnogYj/xjX9ac5d+fbone6c+InSakhMuWE
	FxDtydNUWzEeFDEbEFQmNEPs5QNee4peT8xpjQ==
X-Received: by 10.28.16.17 with SMTP id 17mr7575758wmq.1.1499689218445; Mon,
 10 Jul 2017 05:20:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.50 with HTTP; Mon, 10 Jul 2017 05:19:57 -0700 (PDT)
In-Reply-To: <87tw2ka3p1.fsf@linaro.org>
References: <20170707161822.29659-1-alex.bennee@linaro.org>
 <87inj49mr1.fsf@linaro.org> <CAFEAcA_YvS8OQVTPnvRtWyVuAKO2bccyNALOs1Oq7snTO1WwkA@mail.gmail.com>
 <a391e7e5-0be9-0863-bfb7-88d9168484f3@twiddle.net> <87h8yo9k2n.fsf@linaro.org>
 <638cda88-5bd8-2a86-d720-04005fa1c1c8@twiddle.net> <87tw2ka3p1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 13:19:57 +0100
Message-ID: <CAFEAcA_+q-bgKwSRq-rmZ190vVEcq+DXWt-WohJm3=RoJc_99A@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: ensure eret exits the run-loop
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Etienne Carriere <etienne.carriere@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, "Emilio G . Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YFTdDv7kaguv

On 10 July 2017 at 13:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Looking at translate.c (32 bit arm), we have:
>
>   gen_srs
>   gen_mrs_banked
>   gen_msr_banked
>
> These all manually set:
>
>   gen_set_pc_im(s, s->pc - 4);
>
> before their respective helpers. I think setting the PC after the helper
> is superfluous given we are will at that point be exiting the block.

No, you need both. We do
  gen_set_pc_im(s, s->pc - 4);
before calling the helper because the helper might throw an
exception, in which case the PC needs to point to that insn.
We then call
 gen_set_pc_im(dc, dc->pc);
before exiting the block because if we leave execution by
falling off the end of the block then the PC should point to
the insn that comes next (ie just after the last one in the block)

thanks
-- PMM
