Received: by 10.25.159.19 with SMTP id i19csp695655lfe;
        Tue, 12 Jan 2016 11:38:12 -0800 (PST)
X-Received: by 10.31.6.17 with SMTP id 17mr93201104vkg.75.1452627492375;
        Tue, 12 Jan 2016 11:38:12 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com. [2607:f8b0:400c:c05::22f])
        by mx.google.com with ESMTPS id p143si111168875vkp.178.2016.01.12.11.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2016 11:38:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) client-ip=2607:f8b0:400c:c05::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22f.google.com with SMTP id a123so218638912vkh.1
        for <alex.bennee@linaro.org>; Tue, 12 Jan 2016 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=KIb0Gf3g9dB+pK3F6TfZLOocMGrXi0FutWJQmGb3t+0=;
        b=RSCgmSleiDhHbK2FtCw3UIzAS3nWCiKMRmHIW4q+ewKZSWWNdc0vOWeVedfyoUDX55
         opCGg0CCCyeTgYlABj27DB8aOJSevRkIJ22cJOSGi2j89f8zuu3nYWj6VjcujirFXyfM
         Nh3CKnmyCyVB9gmTL5EAHsOwAtx5iZI8U3Tqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=KIb0Gf3g9dB+pK3F6TfZLOocMGrXi0FutWJQmGb3t+0=;
        b=dVCBcdmcQqL9bu5aO0uMtHn2xBMJkVKTvCbMLbsX4olyIibOVeRFFmLeRffS9Yr1Do
         kS2k3B9heFIcb1TRzL6kVj2stUr3Dfh228bpGN8jbhj55ikYJ7gES17cM2bUIgYedCxr
         IZOqXSOy7475oLUJfqLANBvAbgk1g9KRRh00u8lAC4bAcWlwBCbA2c2s05qgWEELv3uc
         c8ZtzHjbNhw4SyR4LJ8X/cdVpLZEADdSvgXTHpyd/K1nRXv+x2xyDJnKWYqinD/O2Aek
         KsmkohHudvDhA4D1EWXt6B/allDGmLM4+PgMj4TNpikBzr2ckxbDmXIZLCrY6LQsuhia
         Pjtw==
X-Gm-Message-State: ALoCoQmiIFT7qUn7OrozfLEsFkgda+I+YMTAXTccAqDFjdkzDAreKW6WUfYcdU4hd7Rykm4GFuh+rWiFVlYak5q6d5D1we7K7eTNHEH2ad1Luuc0CnJSTaQ=
X-Received: by 10.31.194.21 with SMTP id s21mr93153355vkf.92.1452627491959;
 Tue, 12 Jan 2016 11:38:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 12 Jan 2016 11:37:52 -0800 (PST)
In-Reply-To: <CAFEAcA-KL0=EXywZXO_xo5Rjw-Whadyfyrg2njUGWJ1zWVUPYw@mail.gmail.com>
References: <1452604204-27202-1-git-send-email-peter.maydell@linaro.org>
 <87r3hmdacr.fsf@linaro.org> <CAFEAcA-KL0=EXywZXO_xo5Rjw-Whadyfyrg2njUGWJ1zWVUPYw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2016 19:37:52 +0000
Message-ID: <CAFEAcA9VXvk-BQzFcMpU=ex5=C4+Y3J2Qm-XRcybJSUhaDOF7w@mail.gmail.com>
Subject: Re: [PATCH] disas/libvixl: Suppress gcc 4.6.3 sign-compare warnings
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: okCPH5zdO6XC

On 12 January 2016 at 17:36, Peter Maydell <peter.maydell@linaro.org> wrote=
:
> On 12 January 2016 at 16:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> The VIXL code includes some equality comparisons between signed
>>> and unsigned types. Modern gcc and clang do not complain about
>>> these, but older versions of gcc such as gcc 4.6.3 do. Since
>>> libvixl is an upstream library, the simplest approach is to
>>> suppress the warnings by applying -Wno-sign-compare to the
>>> relevant files.
>>>
>>> (GCC 4.6 is not quite yet irrelevant for us; it is the gcc
>>> shipped with Ubuntu Precise, for example, which is an LTS
>>> release not yet out of its support period.)
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> I had mistakenly thought these warnings only happened with
>>> the totally ancient mingw gcc, but it turns out they're a
>>> bit more widespread. In particular this is causing our
>>> Travis builds to fail:
>>>   https://travis-ci.org/qemu/qemu/jobs/101813358
>>>
>>> If somebody could review this then I'll apply it to master
>>> as a buildfix.
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Thanks; applied to master.

Unfortunately it doesn't seem to actually fix the travis
build; not sure why...
https://travis-ci.org/qemu/qemu/jobs/101902544

-- PMM
