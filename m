Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3765397wrg;
        Tue, 14 May 2019 02:05:48 -0700 (PDT)
X-Received: by 2002:aca:c649:: with SMTP id w70mr2199014oif.115.1557824748286;
        Tue, 14 May 2019 02:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557824748; cv=none;
        d=google.com; s=arc-20160816;
        b=hIeez1Jy6j0s0Su2h0YOO96g3QFUMak8RifpdBvCP5elkq4rrnFN45Hf8oyoh3ITvx
         rlXhJllqQS55KeKWc1end5PbfKwbQ+T7xFBhfdgSF61Nx6SxV8Xd1sZgMOPy9NinZjnH
         AsYzkIzOvauzkWiLq6TDcKlusLO3KeDViNs95gt/FpDMOI9rofN60l1Kjl1QGTHy0mVT
         I/+6VIZbJQ0OvOPuwHLShgRCeI54RYbUhdIdrfSuN2eL4bbQobZ8D/C0pgclKpxYDFT7
         yZIxbCnMXlDIJA34jdekzLzDZhDpolmi6Ml+s9eEy/UEXFsIXxIR9716bM6E2D+EL2Ds
         UzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lQfHjVoUdY/Zjg/bbAHFtmht1fdfMgXRH2qGBcHEpvE=;
        b=vGnFSx71pCNYbkWfSFQNk74nOkAbo6r7iRcjtuAobfeuP+Rg9Kkfak7rv7xt2h4Wv+
         tYOgs594qK8P02v9WoHGoDaheLwAqI0NgqvbxJMvDbgI/XaaNMLefOvoX7kOx+rHzdUT
         c1i0TMUR+It2Q6gI8qXvR6V4VgbfKpS2jpabQ9SyHNDK0JjHUywifGnqJJZ/fyvQ1Lua
         13py8p48Msx6VPvNfz1zFhbQfawnccfWGgTiE0Av3wELP7uaxKy/b035uePDw8xFrfOd
         Fav0OObnI37nUYdtTkIJiXcZXVUBAfmZWJdzufv48Dy0/ZjivYkuLM4AAJ2lAvDKnVfO
         j74Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhrwDZBG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c5sor3341153oib.114.2019.05.14.02.05.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 02:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhrwDZBG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQfHjVoUdY/Zjg/bbAHFtmht1fdfMgXRH2qGBcHEpvE=;
        b=uhrwDZBG2gHuinTkNp5th8+X9YKd+maFSk1QWjRg8oIF9ayjx6qo180vgykJO9XhEJ
         Bs1IxYz/uwYP0J0p97H6tAcwNxBilEleALrmcGlJ1j10l+e2iGQMzeeuZJ2uGA48ceCt
         F7RKo0P8VlQXkIDTUcqX6BeU8tY8Rc/xhPIVtNJEUvCyYv0yEON8po3/PgbI076Sg8ec
         9SKLI+56yaxXQyHpJUSKTXqzdBa2qbCGVcycVanwH/lenyDP2QBlnBHMpgEQKsV6X1mv
         7ILPnrKdPwB1KaXn+ZQZ/iPgpsIIAZOgsg/neUFlnSddqrvirfmJ/3vo+vJC1+9BXB3I
         s7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQfHjVoUdY/Zjg/bbAHFtmht1fdfMgXRH2qGBcHEpvE=;
        b=cmRSGc75xCJe/Cppo4jsrQKUHuxVQPFfFPyqkjMboKww3u+xT163jlyO+abCjzoiQ1
         wlo9tdsn5a+uipVore9QsPySywSTIA8FqU9EgswAJ4UwQH8tK56gGfo5SoWthKZR2pTv
         xXlHAJHTPFWagau6xkaEsYEPRxOxWOcTHeG0M/YAKw0g3PJsVNw2Omj6Qaatp9ILYL83
         AOTh4Yju45nZUJiE5Oj5HqTJQMjQVQxOh0gHEcCaljtc3WwV6mE6+aeLbsrMj2NdFB1R
         BEM8P3DjE0lGSKK0oLWKmOJODadfG1RISeSuJ3JeTi43uaWg/qwKgP29VCw1OYI3tasq
         tA/A==
X-Gm-Message-State: APjAAAV+sGg88S93ppfDRlHS71AaHXRg8IwLA8N7R/VKulNhPDYGR3uw
	t5/CuCSIJvPyrUmLXvoPTt1KahCWJ52Mx16W95w022PT
X-Google-Smtp-Source: APXvYqytDZ/5esP1ofaBsoAxcYWiw+cbSIns04Do8eZn5fnClWYK7A4LMT9RHXqGU2LrK5GIWnzx/HxP5LJSS+BsZfo=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr2265638oib.170.1557824747870;
 Tue, 14 May 2019 02:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190512083624.8916-1-drjones@redhat.com> <fa220ee2-b4bc-cdfa-ddde-90206e417cf3@linaro.org>
In-Reply-To: <fa220ee2-b4bc-cdfa-ddde-90206e417cf3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2019 10:05:36 +0100
Message-ID: <CAFEAcA96qUkfW1nHxm4U4S8z6B_87E=ZZfyXTgD3r=CVeyJGOg@mail.gmail.com>
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Dave P Martin <Dave.Martin@arm.com>, Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: dtTDkP4Dp+DP

On Mon, 13 May 2019 at 19:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/12/19 1:36 AM, Andrew Jones wrote:
> >    CPU type | accel | sve-max-vq | sve-vls-map
> >    -------------------------------------------
> >  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
> >  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
> >  3)    host | kvm   |  N/A       |  $VLS_MAP
>
> This doesn't seem right.  Why is -cpu host not whatever the host supports?  It
> certainly has been so far.  I really don't see how -cpu max makes any sense for
> kvm.

The point of '-cpu max' is that it works and gives you the
best thing QEMU can support regardless of what accelerator
is in use. This means that you don't need to do tedious
workarounds like "if KVM then -cpu host else -cpu somethingelse".

thanks
-- PMM
