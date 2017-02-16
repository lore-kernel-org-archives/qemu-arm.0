Received: by 10.25.77.65 with SMTP id a62csp2486767lfb;
        Thu, 16 Feb 2017 06:11:50 -0800 (PST)
X-Received: by 10.28.158.82 with SMTP id h79mr13302098wme.30.1487254310703;
        Thu, 16 Feb 2017 06:11:50 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com. [2a00:1450:400c:c09::234])
        by mx.google.com with ESMTPS id h82si710552wmh.163.2017.02.16.06.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 06:11:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::234 as permitted sender) client-ip=2a00:1450:400c:c09::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x234.google.com with SMTP id r141so16090640wmg.1
        for <alex.bennee@linaro.org>; Thu, 16 Feb 2017 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AfQuVE4p8Ik6K8pSke9vukGW3SrQt/YoSrGWqg7joHU=;
        b=TVAjkP1ubCIFQq6cu41IW2RP2jeW5IsgV/uvfQBuPVhIGGlWITQE36jkc4Mb269LPw
         NJ+/X7pO9PlJO22cnHf3GlEiHq/aEJpNRMhbuca2Dq+/BRRgften9ZYIviCDwPO3jf7b
         06c7CskG5oba1A5v/tjYYsib4q5SRKJ8IoHro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AfQuVE4p8Ik6K8pSke9vukGW3SrQt/YoSrGWqg7joHU=;
        b=JrL8FfrykYa2grb9STtd1xyU1z8jszseSs3JwW9PIGL8AGHLb0WbjnAde0nExR2WS7
         2Uc+L1Va+PWb82BQa739oYTcjWd45zKld+zMqV5sWAPaEA546X6WITSeu8uWHa6tCmI6
         OyAtqMpw28VxgPCUzyXGV/ZPBqCWIY3utsLhLoPGzU+XSH+i8N00jW6rEOlpW4B9x80k
         cVNbpaNguahAFlKSLAPHJKo64J2xVXEroSQBXW8N18pYn+XA1JOta1RAv3/1AoCHwt7/
         ZedXhDR3ByQ4YzHazc2ElHHCcSvhYPsjWOpxT8SFZvhGjkiUfYToRYFRTw8zYnjpJUMR
         D/+Q==
X-Gm-Message-State: AMke39nOKcGPU+GtG3oJjK3QBFCbNdjd6zu1R3RgLYlJTDrMmzlCRaisazKD6o3eYTGIptECh7oVujejVgKvcPWksRQ=
X-Received: by 10.28.157.70 with SMTP id g67mr12360744wme.111.1487254310376;
 Thu, 16 Feb 2017 06:11:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 06:11:29 -0800 (PST)
In-Reply-To: <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-4-git-send-email-peter.maydell@linaro.org>
 <87mvdnvcxx.fsf@linaro.org> <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 14:11:29 +0000
Message-ID: <CAFEAcA8X1qvweDHBWQjZwH68xWdn4K+Wfqv0yRhjM5QCxd=VBA@mail.gmail.com>
Subject: Re: [PATCH 3/9] armv7m: Rewrite NVIC to not use any GIC code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Michael Davidsaver <mdavidsaver@gmail.com>, 
	Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: B+6CO4rfFOsD

On 15 February 2017 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
> On 15 February 2017 at 12:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> +/* Return the value of the ISCR RETTOBASE bit:
>>> + * 1 if there is exactly one active exception
>>> + * 0 if there is more than one active exception
>>> + * UNKNOWN if there are no active exceptions (we choose 0)
>>> + */
>>
>> This doesn't match what the ARMv7M ARM says (for Handler mode):
>>
>>   0 There is an active exception other than the exception shown by IPSR.
>>   1 There is no active exception other than any exception shown by IPSR.
>
> They're only different if the guest code has managed
> to deactivate the IPSR exception without leaving the
> exception handler. This is bogus guest code and will cause
> an exception-return-integrity-check to fail when the guest
> exits the handler. It's also pretty hard to do: the only
> method is to clear the SHCSR bits for those few exceptions
> which report their active state there.
>
> Otherwise "no active exceptions" =3D> not in handler mode;
> "more than 1 active exception" =3D> IPSR exception and another;
> "exactly one active exception" =3D> the IPSR exception
>
> I would be unsurprised to find that the documentation of the
> RETTOBASE bit was just phrased in a way that forgot about
> the possible effect of the deactivated-your-own-exception
> corner case. I'll investigate a bit more what's going on
> here and whether eg the v8M ARM ARM nails down the behaviour
> more precisely, though.

The v8M ARM ARM defines RETTOBASE as:
Handler mode:
 0: "there is more than one active exception"
 1: "there is only one active exception"
Thread mode:
 UNKNOWN

The Cortex-M3 Devices Generic User Guide
http://infocenter.arm.com/help/topic/com.arm.doc.dui0552a/Cihfaaha.html
defines RETTOBASE as:
 0 =3D there are preempted active exceptions to execute
 1 =3D there are no active exceptions, or the currently-executing
     exception is the only active exception.
(ie it doesn't have Thread mode giving an UNKNOWN value)

I haven't actually checked real hardware behaviour, but I think
we can fairly safely implement this as not checking the IPSR
exception field. (We might as well go with the "reads 1 in
handler mode" choice of UNKNOWN that the M3 documents, though.)

thanks
-- PMM
