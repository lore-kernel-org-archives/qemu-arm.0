Received: by 10.25.77.65 with SMTP id a62csp87691lfb;
        Sat, 11 Feb 2017 05:15:11 -0800 (PST)
X-Received: by 10.28.37.195 with SMTP id l186mr29599609wml.73.1486818911408;
        Sat, 11 Feb 2017 05:15:11 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x231.google.com (mail-wr0-x231.google.com. [2a00:1450:400c:c0c::231])
        by mx.google.com with ESMTPS id m73si5095120wmg.161.2017.02.11.05.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Feb 2017 05:15:11 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) client-ip=2a00:1450:400c:c0c::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x231.google.com with SMTP id k90so125168942wrc.3
        for <alex.bennee@linaro.org>; Sat, 11 Feb 2017 05:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SOptE0kQ+Ct9cIGXY1Q4nf7eBuGadJ0OYRdtuElChHc=;
        b=SQgfAFXlZROdZfw2xPMnx11+kRw+FD6Mav/CEC3sYLwQZCMsx0tMc0SGStrPUaIKp4
         Pqt73j9IznX+gz5HWJsTYnSJcoghhRtfTJRxsehhfaR3om2dv4eex5ik96Fvr7fOp8No
         cgAJn8Uzc+x5IhN+Jenf7LierAzSYcNhuJSVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SOptE0kQ+Ct9cIGXY1Q4nf7eBuGadJ0OYRdtuElChHc=;
        b=G39DYbdBuH483GCrCDBS3luKs+jJSIHFzKexsGBr96RBG2xk/dPp1se6uJ8oAbbb8S
         U4VCtqErBOtj77lFZIbT4OPJu906WoJRPQGKiOAeBIjpkU/ojkyuslLPGrf/zyGAzRun
         kt4Y68SaZIYrk6fM6dpaYmk9X+C8qyeAZGkdbsf6Uqkq+22m3IzgoF22FSKTdSwi38p0
         /ZKMJ3uadVTkhzueM1wtwMtAncWXRrBTlksKPYjWMRB/ebYcPO8jJOn9yFyK6opTU9UQ
         1ww4ekaipTjb6B3OLvMSijX7EoKqN3siyNtJN+hf823BdKg0DD3xmyyG0RVgw8onfoA9
         FI5g==
X-Gm-Message-State: AMke39njfpSKKA8ktr17sihkFfCHSSnq7/kNa+l8dh+e/jn/BuwehEoRS3UylW0JioD8i79k2iBZWiA5a5pyI+zY5D0=
X-Received: by 10.223.142.131 with SMTP id q3mr11783478wrb.195.1486818911132;
 Sat, 11 Feb 2017 05:15:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Sat, 11 Feb 2017 05:14:50 -0800 (PST)
In-Reply-To: <8737flj70j.fsf@linaro.org>
References: <20170210210857.47893-1-marcinch7@gmail.com> <8737flj70j.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Feb 2017 13:14:50 +0000
Message-ID: <CAFEAcA-_wAWiewc2NX7RrfBN3UFc=9dY2tDri-rkNTs2=pFs2Q@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Implement BCM2835 hardware RNG
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Marcin Chojnacki <marcinch7@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JetnOWHCVrQa

On 11 February 2017 at 11:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> I know we are running under emulation but is rand() the right call to
> feed data to the guest? There is the virtio rng and PPC spar RNG which
> both use rng_backend_request_entropy() to collect random data. We should
> probably make the Pi RNG as good as the other guests.

See discussion on v1 of this patch -- the rng backend is probably
the right idea but its API is a huge pain in the neck. I suggested
Marcin do a v2 which still uses rand() so we can get everything
else reviewed, and then deal with the rng stuff separately.

(Notably I think that for the rng backend you have to on the
command line create and wire up a backend, which is a lot
of pain. There doesn't seem to be any kind of "use a sane
default" available :-( )

thanks
-- PMM
