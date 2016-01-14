Received: by 10.25.159.19 with SMTP id i19csp1945596lfe;
        Thu, 14 Jan 2016 10:28:07 -0800 (PST)
X-Received: by 10.31.5.134 with SMTP id 128mr4441837vkf.29.1452796087771;
        Thu, 14 Jan 2016 10:28:07 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com. [2607:f8b0:400c:c05::22a])
        by mx.google.com with ESMTPS id t187si7084315vke.170.2016.01.14.10.28.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jan 2016 10:28:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22a as permitted sender) client-ip=2607:f8b0:400c:c05::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22a.google.com with SMTP id a123so255424849vkh.1
        for <alex.bennee@linaro.org>; Thu, 14 Jan 2016 10:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=w2gkMPz3EHRbhXIxK3+ZqmhIwIb+M6AJetYukHgbYh0=;
        b=YQDZKGhqP/U4FTIKaSMmGbRsLCUE/tf6tUdNfRSNiPWq74fIEHTmcg5oqm/qv3C3qC
         jPLZNbxVgFqHzcVPIVI7Y9QjcBt5ffYBdirSlTb7xuyFnYPQL41bvuMaCTLO4W2+2aEq
         ZJSOm8/8MiSEmpV4ZwPnqcrxp5xYeJ1pzFI7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=w2gkMPz3EHRbhXIxK3+ZqmhIwIb+M6AJetYukHgbYh0=;
        b=gQ9lRQ3mgy1zdSNQAI3wUzyhXwP3BTEq9PHOCovg2T59yfAbzoLNpq1gwhLl8xN/SE
         JMcQ0LYNdnjq1RvHfcjBXYK0odRdY78OfBn3LMhtwDbdyxBj8XwKAmqPuT64SFsgZkLP
         hsP6KrSufJr+jIuUTDsOrtBKl5yTCTnFvzwbED+5i0dtRzED7g4kvFfJU+6cTcdrcP3X
         KL/MjHupzF4fYA4vYv4IdXbxbBIGM3iGGgb6Mo4oCt/pXARaJTYsFA+jwSdUIqs/IcMU
         2zg1PMHrILT9rtHYFHiMXkQ2BJ5XnIDmdyV+R+mQJ6JHtd7gpAyvoRbulYM0NZ2Mxf8n
         gcDw==
X-Gm-Message-State: ALoCoQn9lVjvrj8QKeltFIqVhAExnqRNtOlVahCSZre4KkTKUsLaOja6pI7tnMqsPx3cYyVFfr6Jj+nBxO6B8/XuamLeyedCbK2pVekHaDsilCyrH7i8QwI=
X-Received: by 10.31.131.203 with SMTP id f194mr4602033vkd.90.1452796087415;
 Thu, 14 Jan 2016 10:28:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 14 Jan 2016 10:27:47 -0800 (PST)
In-Reply-To: <87fuy0chki.fsf@linaro.org>
References: <1452783202-576-1-git-send-email-peter.maydell@linaro.org> <87fuy0chki.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2016 18:27:47 +0000
Message-ID: <CAFEAcA9T05PpwW_2Z3-dnHAdauWMjfWjmn5tuNL6M4y+V2+amQ@mail.gmail.com>
Subject: Re: [PATCH] disas/libvixl: Really suppress gcc 4.6.3 sign-compare warnings
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, 
	Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1ylMiwK9zxbp

On 14 January 2016 at 15:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Commit 8acc216b956 attempted to silence some sign-compare
>> warnings in libvixl by adding -Wno-sign-compare to the CFLAGS
>> for the relevant objects. Unfortunately it was ineffective
>> because it was placed before $(QEMU_CFLAGS), so the -Wall in
>> the general flags overrode -Wno-sign-compare rather than
>> vice-versa. Reorder the flags so the warning suppression works.
>>
>> Thanks to Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>
>> for pointing out what was wrong with the original patch.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Alex, is there a way to test this patch against Travis before
>> we commit it to master?
>
> Mea culpa:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> and a conditional:
>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> when:
>
> https://travis-ci.org/stsquad/qemu/builds/102371704

Test travis build completed OK, so I have pushed this fix to master.

thanks
-- PMM
