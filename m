Received: by 10.25.15.230 with SMTP id 99csp1235318lfp;
        Mon, 20 Mar 2017 04:05:41 -0700 (PDT)
X-Received: by 10.28.45.212 with SMTP id t203mr8992673wmt.37.1490007941061;
        Mon, 20 Mar 2017 04:05:41 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x231.google.com (mail-wm0-x231.google.com. [2a00:1450:400c:c09::231])
        by mx.google.com with ESMTPS id t23si22510381wrc.41.2017.03.20.04.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Mar 2017 04:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::231 as permitted sender) client-ip=2a00:1450:400c:c09::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x231.google.com with SMTP id n11so60255315wma.1
        for <alex.bennee@linaro.org>; Mon, 20 Mar 2017 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7r9Hy48lP47Q+i+FleGx0CelyblJ7byn7kDDsurPaLI=;
        b=PUN1XIwIFxeLnn16He9x2aeKpn1t3cDmcgNECc478svl05HOFBmc0LydUCmgg3IUWd
         h3s8+/GCsNfbmS3mHbvuFMAI/pGm1lNyERxZHrdHvHOqOjMfDr5Y4364iYJ9drYSXMyS
         u5vocC58mtn2oPOtKkPVOVBnEXa//kUUh/65Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7r9Hy48lP47Q+i+FleGx0CelyblJ7byn7kDDsurPaLI=;
        b=rs5xveYPFOLZo/NZAfjKGrPBr9wnsKm8+iYzOhvm9cIvO3kHuWWvv5f7YT8aWjuBn6
         FVP++ZXe0Q93AElXHR+Ud1igTviEq5a/VcRfxo5ckuHTKuUi93JiWJhGSpTdvd9WBmGa
         nIEuUt8BoHl48sz/xDsZ09I0TOAjeNdr6N7d5c0EsloC9iq64nvCDaFazDB/J7zoE8S8
         M76J70yvxQfyFRLwaXDQybJaX1mohca8A2JW31VG6HxynN5Q97/FoGT0+WLD6CnZu0uD
         7kX8kiBs9Vy4bu8bMTIq0AHb4H09bG1DysR4kxhQoILtw9Hse9qS7NP73XKUkJQXzhJf
         O20w==
X-Gm-Message-State: AFeK/H1QGtLBndb0gtY6SIEVB8LuhGI5LHJRhc80NoUeHrS381lFzJOdTJim1lgIqErdb6jWCvsTxyjze876XS3u+tI=
X-Received: by 10.28.6.6 with SMTP id 6mr9527279wmg.111.1490007940759; Mon, 20
 Mar 2017 04:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 20 Mar 2017 04:05:20 -0700 (PDT)
In-Reply-To: <87pohcnrlu.fsf@linaro.org>
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
 <1487616072-9226-3-git-send-email-peter.maydell@linaro.org> <87pohcnrlu.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Mar 2017 11:05:20 +0000
Message-ID: <CAFEAcA967QpqPygNGO7977=uj1xz9hG4-_FhuRY89HHksCu_6A@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm: Don't decode MRS(banked) or MSR(banked) for M profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Aj0t2iOWAi0l

On 20 March 2017 at 10:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> M profile doesn't have the MSR(banked) and MRS(banked) instructions
>> and uses the encodings for different kinds of M-profile MRS/MSR.
>> Guard the relevant bits of the decode logic to make sure we don't
>> accidentally fall into them by accident on M-profile.
>
> The ARMv7-A documentation talks about banked registers being a feature
> of application processors with Virtualisation Extensions which make the
> sense of the test a bit weird. But I guess they are functionally
> equivalent. Are there in practice any -A cores without virt?

You can have an A profile core without EL2 implemented, yes.
In particular in ARMv8 this encoding is legal (and has defined
effects) even if EL2 is not implemented. It's introduced in
ARMv7VE, and there's an argument for allowing it even if we
don't implement EL2 for those CPUs which in real hardware do
implement it, because system software might assume it can use
these encodings.

We should probably UNDEF it for pre-v7VE cores though. For
this patchset what I really wanted was to avoid the different
decode used by M profile getting mixed up with the A profile
decode path.

thanks
-- PMM
