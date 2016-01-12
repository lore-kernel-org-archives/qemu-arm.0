Received: by 10.25.159.19 with SMTP id i19csp640053lfe;
        Tue, 12 Jan 2016 09:37:18 -0800 (PST)
X-Received: by 10.31.56.133 with SMTP id f127mr72484331vka.56.1452620238489;
        Tue, 12 Jan 2016 09:37:18 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com. [2607:f8b0:400c:c05::22b])
        by mx.google.com with ESMTPS id g20si110868515vkc.23.2016.01.12.09.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2016 09:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) client-ip=2607:f8b0:400c:c05::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22b.google.com with SMTP id n1so92618026vkb.3
        for <alex.bennee@linaro.org>; Tue, 12 Jan 2016 09:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=UIEuAgRB4dG+zM45dDuVik6J7aBf1x1qN8jud1veRmg=;
        b=VPA/E3It095gPF9hmOMkDUJ2GtihHIbzleM68QeqydzQi7/hRe3mmEp7ZP+RKLbVVl
         oi/X75IXyZDF9y6EaC9gHeTG2MsYsEnPrllOSpFcsGad6KOwv94LR2UoVE7VVyKOe5w8
         V7k8v+VIuAlnaRXsc6O5ACqsgzW3IrAnG05rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=UIEuAgRB4dG+zM45dDuVik6J7aBf1x1qN8jud1veRmg=;
        b=isB6qSCs0xY4n+WvB9JzBe4mT1kP5CLlw7QPUFQUGlog5gWsexJOpHQz9QWtxiNqm/
         /SmvDsUf/Mjz9HWCYmE/VtsR5fqDFcaBpPENSAOYF8cFv9+RMDz7+whWEcpPi3eSPY1G
         dtq9yarLabKEIMnRqtRWKr41R8IfDyPqa+uKu/GFMDG887hrrq4qevWlh7C6LC5Reb9s
         y7/96BhbSLZn2dherBjfXFX8hFuXKZH5gOJxTNtVdLcbAFVLbexDHo2+IlY5JdCQxBdi
         16+EMWHeNNvnLEUDVcdCToPb1cnL2EphhhnGCrqktK1tKBi1OfHBfz2iEhEMPeFHUvWW
         153Q==
X-Gm-Message-State: ALoCoQlBZT24jFZyU8wrzCE3emmVj8y0DveL2RRg4bsSQ8oRV8yktKso0hNVSQswFCnvttRXn7LXPZ97HPRxO2xdvfcP/4OS2seiKCW7IrVqNzKpQRHz7Lc=
X-Received: by 10.31.107.138 with SMTP id k10mr86639728vki.27.1452620238077;
 Tue, 12 Jan 2016 09:37:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 12 Jan 2016 09:36:58 -0800 (PST)
In-Reply-To: <87r3hmdacr.fsf@linaro.org>
References: <1452604204-27202-1-git-send-email-peter.maydell@linaro.org> <87r3hmdacr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2016 17:36:58 +0000
Message-ID: <CAFEAcA-KL0=EXywZXO_xo5Rjw-Whadyfyrg2njUGWJ1zWVUPYw@mail.gmail.com>
Subject: Re: [PATCH] disas/libvixl: Suppress gcc 4.6.3 sign-compare warnings
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jW4Z73RsXaQm

On 12 January 2016 at 16:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> The VIXL code includes some equality comparisons between signed
>> and unsigned types. Modern gcc and clang do not complain about
>> these, but older versions of gcc such as gcc 4.6.3 do. Since
>> libvixl is an upstream library, the simplest approach is to
>> suppress the warnings by applying -Wno-sign-compare to the
>> relevant files.
>>
>> (GCC 4.6 is not quite yet irrelevant for us; it is the gcc
>> shipped with Ubuntu Precise, for example, which is an LTS
>> release not yet out of its support period.)
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I had mistakenly thought these warnings only happened with
>> the totally ancient mingw gcc, but it turns out they're a
>> bit more widespread. In particular this is causing our
>> Travis builds to fail:
>>   https://travis-ci.org/qemu/qemu/jobs/101813358
>>
>> If somebody could review this then I'll apply it to master
>> as a buildfix.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks; applied to master.

-- PMM
