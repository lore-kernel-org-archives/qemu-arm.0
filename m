Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4997102wre;
        Wed, 30 May 2018 10:35:46 -0700 (PDT)
X-Received: by 2002:aca:5d8a:: with SMTP id r132-v6mr2133712oib.41.1527701746302;
        Wed, 30 May 2018 10:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527701746; cv=none;
        d=google.com; s=arc-20160816;
        b=bfTPKs7zdLyEx0AILqg6CmFnA4xh6vMFz+E6TSA6msXTLfDn5Lo2qUM2M3stbXfkAe
         L+kpCS7cfyyrn3zTPQXZH3ciZ5yPEcuDRDQpzv6SCw85lHMjsFBwiuXgUcEfe4iLT7CK
         JByTnhjyP2ABv6wazJjWJohbFcibsUrSoFO4++anfIcSsmPe7weL/a/U2Qsn4nC+A0+3
         TfuPpSCMo5QxPIwDq7CszArZD1rFiYh4tfL4Aw+hExJq59OMzB77U7MPlMfsxktYEKml
         +fmwsbnpAGRzSpl8RQjZ+BDye6bh+FjYoqnBXF2hinM8LN+v98NY7QMW/Q6I3qp4xphY
         2CUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=SUX8D75PwDZrFduRFNtRIhp+nQ5a91O39vfR/kdPEiY=;
        b=wulBNLN7xvtXTbBeWCVBoLtMr+1nc5u7j13Tt5Cs29HCn9x57KPkNSbIuzf2T0Y9r6
         wnJn1Ax28NSN1CCwgcJzffPo6P0lTGaeXo3NvZvB+U6NDQlRrHByNq0Zpm90YJ2ZLsDK
         GsUvwHDihej137+UL4lNUAlD4kXSRLvcIsYisHzuX5gMIlNpack/9BJDPlXHfTaSdB/D
         FvJnKqRePTGE0MOB5WiznUYkEXSAdUHYX0DmZf1RUGnw1oea9iDnypmQD/8XlOJR96VW
         31hRry5Kp+tDgoc9a40p/8mQJXxNBJ3LcqcnR8NdJjnd0YsZjN0KAYwvfRttqnXZ3Pbp
         CY2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=de+92RBe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g16-v6sor16343475otj.234.2018.05.30.10.35.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 May 2018 10:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=de+92RBe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=SUX8D75PwDZrFduRFNtRIhp+nQ5a91O39vfR/kdPEiY=;
        b=de+92RBedkP2by3pd4DN40x6FlmCudzb9fQadXrjc6A5e21aaRDxoOB6CZzL9MFQ1U
         XVHLCHKsOCHk4GNBhWTaxSfca0yjHcUJ2s/S1GOfKo61DV0LeZDj6Sz/ko/N8Eqz8gJI
         024F9ghbAHexOD5a/QqUg3TLZx8m6bq8IKbRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=SUX8D75PwDZrFduRFNtRIhp+nQ5a91O39vfR/kdPEiY=;
        b=ebjjT8B91j9dgm1a/qq1vDjH+u5CydDAZ3bPfTHTgSfM6jsPiI5gdKZl1ZVHnrE6cZ
         NSuTK9/IlECXmu7e5HRhGIBbwZzRAy8P0FhbCIozV0dEY241YqLxcWJIr/FUyYXgG4kh
         3vszkUtcXyyqQM+dqrsWfupXd/Ap5q2kWweqkAjx6H2ihdptUck207rX1Hxc0dNnVYuN
         Rtx7oLtfRcPPVmFysROyHIuRnO9sFHyIAL4+cnHhrpF48wxHiDqFKt/4WbsZXkOaFAVR
         a5DSiCnfLNDRekbrK3F2+FARDtFBTkJJWZkG3COyIIKk2zXOMnNmbSyENGO1aaB5Lno3
         raCA==
X-Gm-Message-State: ALKqPwdnACFjPTOWnDywQxBagihf+qmBxu9cOohz8XRn7z6R8nWmSYNX
	l6r8X/gi7MjbbyEPVB9tewxgDlSRPy71F+xVV0sBppG0
X-Google-Smtp-Source: ADUXVKLzDzYztc6BoOJnBWTvM4LVEGeZVSpdzzRUgXXGSAJWoUQXXtONXzCoGherI1czfAjJ/o0gqXoOUyLXL3HH+pg=
X-Received: by 2002:a9d:2371:: with SMTP id k46-v6mr2572417otd.210.1527701745895;
 Wed, 30 May 2018 10:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 30 May 2018 10:35:25
 -0700 (PDT)
In-Reply-To: <530bef1b-a143-1566-3089-32629ab250b8@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org> <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
 <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com> <530bef1b-a143-1566-3089-32629ab250b8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 18:35:25 +0100
Message-ID: <CAFEAcA94JAccGhbhSrBkTHUV+dLR-EvYQW_nuB9FodtLTDQPZw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 23/27] hw/core/or-irq: Support more than 16
 inputs to an OR gate
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: UAXICjjiD8Ct

On 30 May 2018 at 17:59, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 21/05/2018 17:02, Peter Maydell wrote:
>> On 21 May 2018 at 15:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>> Why do the levels have to be migrated at all?  It should be enough if
>>> the IRQ level is either migrated manually, or restored (e.g. in
>>> post_save callbacks) through other data that is migrated.
>> This is standard behaviour for devices: they track their
>> inbound irq/gpio lines, and then that becomes internal state for
>> them that must be migrated.
>
> But or_irq's input are another device's outbound lines, so tracking them
> should not be necessary.  The other device would do it for or_irq.

There's no mechanism in qemu_irq for the destination end to ask
the source end about its current value. The information flow
is strictly one-way.

thanks
-- PMM
