Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3200395lfm;
        Mon, 22 Jun 2020 06:44:01 -0700 (PDT)
X-Received: by 2002:aca:d60c:: with SMTP id n12mr11771778oig.167.1592833441566;
        Mon, 22 Jun 2020 06:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592833441; cv=none;
        d=google.com; s=arc-20160816;
        b=utBuFg4y4rXbcvoLGilyNb3EM1Mb+oCIhgu7K1HxhBaq689i75hFdoTh09S8wlRCdL
         rQ5ak9WkOrs3YJ/0Cswst1lbIHSL5FsmGKFwHut3a7hJGHSo7UKe8vLwcJnQkZMXeMTx
         VaaG21WKNLJoeKLOZVUA4i71oYN2ylH1mVvhmg+sFCbL0ZfK2ZZGndMFynBew5kxvdDt
         nRQL6jomJaBBJcjzjvDnd8bZrJobj7D+63tE3soJtM3kEtJPqL/1vh5+g6uLf+Yu9gJi
         bqm0inVItHTI7MGAobiMSPtxKeZ0lVXCOQchK8eRUqM3F4Raz+TSSmAgpqJwSvypNuMP
         c8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=clXht2FD3ZQyJ9fSrZaYDQB0DuTsOzdhCbD5hQGoKXg=;
        b=Z1NR0CLFAAk2CTvwMaZuo0/dua5IfA1S3rGFIFK/fJK2zXJlArP/61rcmyoKXQ5Rx3
         eAex+GxLEYSxOzNen5SqKfvJQ4ebi4VWvXASlyqA54roJhUbAtuD6lsBJ0r1rfOcH+UX
         X0W0UVC7f6jJwgmauCY5v9e24yaw0zOw0xTBODQ/rDfRNYK0qcAf/MAruufM6pra0DVz
         TIL35F5LyGQDkINkeWlctgUI2uBr06oHRML3nlL335wg7K+FjebGifWfM8ksQggApPRe
         a0Ba3drozMMTEpNhvqkQd7hUJj6pl3dtLZ0e+LdJuLtKnsoevrBOlH3rRol7CHQbwcYU
         qEww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVRdVz4+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5sor9827719oih.94.2020.06.22.06.44.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jun 2020 06:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVRdVz4+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=clXht2FD3ZQyJ9fSrZaYDQB0DuTsOzdhCbD5hQGoKXg=;
        b=dVRdVz4+t7X1btLspPnh01UuB77k91MkpDoW7Do1E7EWx310g+JQfHuMvoNuVFXwm2
         NmU/TzQyxBejZTrbS1HiC+rnAaJnd5ZLuWiQTaqGnYyfMzWzz7XDSrjzRp4XPGfm2upW
         3sbyQucRT6t4mOniuEf86xkqrzSRGpa59q3u5REULhht8ddwwp3CrotHQZ9jirZNqXS4
         6IP7MmL5rKJjeGDjbHK7xR/vc2ugw5T0dKQjwM2pFlQzHeXZYKlURBqbku5TP9BARC8J
         oVPFcWfmqw3iGE73KiO7Wc4WmJgD0Wg+Bp2C4ZtWiAm7RN1nS7px81kvI+btlPjfTRPE
         9YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=clXht2FD3ZQyJ9fSrZaYDQB0DuTsOzdhCbD5hQGoKXg=;
        b=h+73YAgYP7xR0Av7zWM2NpABZY++nnfdkwJo+KCkNagaFsiCxL43hV/UIWlP7t0mwa
         44b0y1/s/JN/fliGE3ytEOwCM9cslYuZocDTUN3PYXaifQKikwcv+SCTaqVvzg5NDVZK
         f3GNo1gvwku8ybStQePJOwlMesHOrQunpCGzpv6o9k+XmK2Nu5Nn5cBEO4nexVZ1rggq
         VCMxhOnQ4Osu4L1TurRP6KPCwPBXRaDdfF1TQbkUHHDAKFWXUdwyXp5JZBsY4sc3qeQk
         VVuPZgiBPYvOanw/brVv9ZADxXbtHbyE3LNm2CclNR5g0OrmQsRSM6vGLNpu2JGruml8
         sm8g==
X-Gm-Message-State: AOAM5302bRCsaNp6WF7Z4fHMNaC/m7qBAZYjWtdkON5BDCpqm3Immf5K
	2lz0XR1r6CW9UUCaCG554anzH95UDx3JA+XRWpPMcHCwuoZONw==
X-Google-Smtp-Source: ABdhPJywH9aq9zVx+WPuea8lhoCLyMqmyYxMoKK2h3DYQqpIKQZQOx8mNoq0mqieYA+7pK3pcxfcbcfMd7AysjaNrzE=
X-Received: by 2002:aca:568c:: with SMTP id k134mr11759332oib.48.1592833441119;
 Mon, 22 Jun 2020 06:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru> <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org> <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
 <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
 <CAFEAcA8G3ngwUXMSCEN6UVEJ6Na5sBpHqYv1qh7PEn5uMAhGqQ@mail.gmail.com> <e9ad4bb6-e8c9-55f5-565a-01c3f35aea92@trusted-objects.com>
In-Reply-To: <e9ad4bb6-e8c9-55f5-565a-01c3f35aea92@trusted-objects.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2020 14:43:49 +0100
Message-ID: <CAFEAcA9RAXmMeHFWX0La8yLL3M4mjC+mpsW6AvJFfsP8aGnfqQ@mail.gmail.com>
Subject: Re: Role of qemu-arm
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 595KcUF+m0vE

On Mon, 22 Jun 2020 at 14:03, vincent Dupaquis
<v.dupaquis@trusted-objects.com> wrote:
>     It is a shame, so I suppose I'll have to stay with my emulation
> using netduino2 or so ...
>
>     That was the reason why I tried to use qem-arm, which is probably
> crashing because what you just suggested.

qemu-arm is for "I'm a linux userspace binary"; if your code is
a userspace binary then you can use it...

>     Is there a way of pointing-out the interest for the feature ?

I'm afraid we don't support or have any plan to support
"just run a CPU, no peripherals". I don't think there's much
utility in it -- M-profile needs the interrupt controller,
almost any setup wants to have a UART for I/O, and you need
some actual RAM, which then leaves you with the question of
what address to put the RAM at. At that point you're not
really "just a CPU", you're "a minimalist board that doesn't
correspond to any real hardware". We've found from experience
that emulating things which don't correspond to something
in the real world is not really maintainable and supportable
in the long term.

If your code will genuinely run on any M-profile board,
just pick whichever one seems most useful and ignore
the devices you don't need to use. (I like the mps2-an385,
it has a bit more RAM than most.)

thanks
-- PMM
