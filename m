Received: by 10.25.0.147 with SMTP id 141csp723018lfa;
        Fri, 24 Feb 2017 06:58:56 -0800 (PST)
X-Received: by 10.223.141.148 with SMTP id o20mr2928419wrb.191.1487948335979;
        Fri, 24 Feb 2017 06:58:55 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id j26si10659217wrc.16.2017.02.24.06.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 06:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x236.google.com with SMTP id t18so9067823wmt.0
        for <alex.bennee@linaro.org>; Fri, 24 Feb 2017 06:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=atoLI5ckv+n9BIVSlsFlcSa16bcYKlnKXrJFilsdvjI=;
        b=FhFJtSzTUkdTXq247kLxxa45uns+C3dr+IUJLx1bIkVTMyfzLk5+Cu16Ip9ZBnxkLF
         iTnZOZQ3ziBRQkzPdJ7g1mrl4P4PonV5uK0m3f0FceHrhXVOKp5ck3czJc0CTdiHEMSO
         mRd7VtIi6t8Ch/GoyPbaCj4Ctt4JG4J2dibB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=atoLI5ckv+n9BIVSlsFlcSa16bcYKlnKXrJFilsdvjI=;
        b=dXcQSF4i6INBeJTAE5SdCEXDDIbxNrp6EGcCDWvZ5DGTanghCJzdEjukvTBUE49Dqp
         USSJPskmHFWV5XFtNVw8wJkfsOBNdrVGoWL/EYPQH3Gdm6UpEcrpzwSMm70KkZjNNhxZ
         TEYpz29PUxYxrtnF05B7gCzB0bPPJu12qpvpsXATSYjCksLscpIO1F6F3XQoiTymUSzE
         LTuojzU+A9pTqd+sUWDB5OEQfxLWhTM4jforgtFCJK1Ij7CAyWobiRIc9BisHTxHFCIJ
         JNwLJYnkBCavyJXdMJYTptPczVloF7ggS27VoM+vaDqNTKfiXbO8EcsqQNmBAK13UavJ
         sAug==
X-Gm-Message-State: AMke39kwsriXOlaoG0BnrqASGa4Gkj75hGniUZ3iqSHucZUTFim0sv4nhbtXHlCAsEyzGMTnsn2iH74f84S05w1/t+4=
X-Received: by 10.28.55.199 with SMTP id e190mr2881616wma.92.1487948335749;
 Fri, 24 Feb 2017 06:58:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:58:35 -0800 (PST)
In-Reply-To: <87varzll0r.fsf@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
 <1487604965-23220-10-git-send-email-peter.maydell@linaro.org> <87varzll0r.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:58:35 +0000
Message-ID: <CAFEAcA-qNT=5yQVMoB4GSpsDYXFTAHOHktGT652eNKBCBS-wYw@mail.gmail.com>
Subject: Re: [PATCH 09/11] armv7m: Split systick out from NVIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Alistair Francis <alistair23@gmail.com>, 
	Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sY3Vv6YW8Rrh

On 24 February 2017 at 14:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> The SysTick timer isn't really part of the NVIC proper;
>> we just modelled it that way back when we couldn't
>> easily have devices that only occupied a small chunk
>> of a memory region. Split it out into its own device.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "SysTick: Bad read offset 0x%" HWADDR_PRIx "\n", =
addr);
>> +        break;
>> +    }
>> +
>> +    trace_systick_read(addr, val, size);
>
> I'm getting the compiler complain:
>
> hw/timer/armv7m_systick.c: In function =E2=80=98systick_read=E2=80=99:
> hw/timer/armv7m_systick.c:81:14: error: =E2=80=98val=E2=80=99 may be used=
 uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>      uint32_t val;
>               ^
> cc1: all warnings being treated as errors
>
> I suspect the trace function could pick up garbage if we take the
> GUEST_ERROR leg and default out....

Indeed, missing 'val =3D 0;' in the default case.

thanks
-- PMM
