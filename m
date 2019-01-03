Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp614624wrt;
        Thu, 3 Jan 2019 05:06:55 -0800 (PST)
X-Received: by 2002:aca:f44c:: with SMTP id s73mr33409141oih.102.1546520815351;
        Thu, 03 Jan 2019 05:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546520815; cv=none;
        d=google.com; s=arc-20160816;
        b=zJJmycUdxzC4sHxnY/dDH0YZGyox++UwKhja9wviHSrBNh0T4rre32gCujDIfue6co
         Yn+56GwC54BMxHcYFusHi6fznVM51MiSMn6N78qkGRqrjQbgt5Uc/LiJ5NN17aRakxUZ
         82ZGCWE8fYhHpjfPSTHEYw29g1D0OvoyD3KpVFyFODpu9bDVFrATD81iv/6Y8WbwQfR6
         PyORFTcZgCgv08P6t19W+ll0WkRrFwiN+rmq2UZZogXZbe3iJYX53OYZriFIZXzPbrHj
         WyqeduuEUZ8hh8So4NIqw03Uxvepwntb8wOYBzxYVBqLMxcnJ9KIXFAFxVPZEZsVm69H
         zUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Wut+KLN/OKeeGP0Qss2cbkMB3XDM7E/DKsgHlpemK8=;
        b=Fbt2ynnPtA7Y64XMVgfbZqDOpjAaDG+NLprzhPO0Y8+rMJOApEA1JyigKXaupvZJJK
         9euECAxu0qiLSuGkHTVc/CWmyILSf4qxWZNo4Zpx13VmhBS8WGn/aoZfURy+t+Rrs7E7
         EWzgEv5wegSwxeaH19Ryem+VcjGKpMbZnvEsAuVuFdUlDs8VSZSyt3s7WarAmw8MtL2g
         QbaxmoX+qVbVW5YP6IaafvdjUBwarkuo5bwNDxQb44e//5qZVcEQgAhn9VeqsKIc9ksw
         zIfu7kWxO7T+LXCzVtRF/xvuTiyUBINIQ+kFtYCCbwBMp8e1tt2JnfGR8bTca6PvbqLj
         5+nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LK9e8Wmd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t22sor19736861oie.57.2019.01.03.05.06.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jan 2019 05:06:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LK9e8Wmd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Wut+KLN/OKeeGP0Qss2cbkMB3XDM7E/DKsgHlpemK8=;
        b=LK9e8Wmd048C2Ao+PDQQihBLQuFuqc21CLNICCt9UtLR+M+tzMYpBajiemRPKwgrmW
         DkYjZD9yO5FcAD+eZUynGBf6JLao5pVjLNOQzRpBdW9uG2KkpsUQqxUoO8l6LGbYtFSv
         ssJHLbqJVxmkJ2vOnZc9LREfNCU6S3R0QYtio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Wut+KLN/OKeeGP0Qss2cbkMB3XDM7E/DKsgHlpemK8=;
        b=Dtlri2vhw/zkjbrE4Vwa4TnCRLiYb4ocJSmgcyEtVeTwVyl5ad9wP7N/JtWhuz3lvg
         7qLTumTVy85ZDfyDVHwtxzlimCHOrwAbxgvqKspfOWO+cRKbksIWWpNhkYA/QvZFbXVZ
         D6PGHtQ4RtbjoHnQ1WXI1HVamRNHujyAebCl/1oKDCaX42FkDKsGBSrHLLTRoxr9JCBB
         3HHdwfPHum8X+RityeCEAmmb6R6V+cMS2XOgvk4UffYItb9O52nDHbqPXNys9+mN/cY3
         7OZL3xdMMG0KLWUY4qB3ukTyKqGvm4cNuGhyqQavmTl1elA6FriH+7dvt/4QfTqmGsSj
         UhGw==
X-Gm-Message-State: AA+aEWYuky0kAVz89098v52Bjjor93O0KUh8xt8q3pQ1SqIOCwN2ktuF
	lTCiHV5LJsWfeB8Iwt531BkP6fmvo03b8byL2Hhd7tp5JM0=
X-Google-Smtp-Source: AFSGD/UAkeE1EksWPAe5CWu42QxCIYCln7dZadUgWUEUNIMyxpgkrdXjlqbqNuE9wzDUHPoMHXtCTAeVdEUWLllSpLU=
X-Received: by 2002:aca:bcc6:: with SMTP id m189mr33085453oif.337.1546520814870;
 Thu, 03 Jan 2019 05:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20181214145152.27250-1-stefanha@redhat.com>
In-Reply-To: <20181214145152.27250-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jan 2019 13:06:43 +0000
Message-ID: <CAFEAcA9OwKJQ0iWtuxMJrNPL5r_qtuZz57H=Dtcr6X45XqQ3TQ@mail.gmail.com>
Subject: Re: [PATCH] microbit: make -kernel optional
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Julia Suvorova <jusual@mail.ru>, Joel Stanley <joel@jms.id.au>, 
	Jim Mussared <jim@groklearning.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Steffen Gortz <qemu.ml@steffen-goertz.de>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: SV25Rj3KJy9N

On Fri, 14 Dec 2018 at 14:51, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> ARMv7M machine types support -kernel for ELF and raw image files.
> Microbit programs are typically in Intel HEX (.hex) format.  The generic
> loader supports .hex files but it doesn't work as expected:
>
>   $ qemu-system-arm -M microbit -device loader,file=microbit.hex
>   Guest image must be specified (using -kernel)
>
> This error comes from armv7m_load_kernel() but we don't have -kernel in
> this case.
>
> This patch makes -kernel optional since most of the time we'll want to
> use -device loader instead.
>
> Note that we need to register the reset handler that
> armv7m_load_kernel() used to register for us.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Hi, Stefan. (Happy new year :-))

Looking at this, I think I'd prefer it if we handled
this in the armv7m_load_kernel() code, since having to register
your own reset handler to reset the CPU is a weird thing for
board level code to have to do. That then means the M-profile
kernel load code is in line with the A-profile load code, which
if it has no kernel to load will still register the reset handler,
and let the machine run however it ends up running.

I think this basically amounts to "remove the 'insist that
kernel_filename is not NULL' check from armv7m_load_kernel()",
aka "revert commit 01fd41ab3fb69971". That commit's commit
message is correct that the behaviour if the user didn't
specify anything to run is a bit unhelpful, but it predates
the generic loader so it's no longer necessarily true that
a kernel must be specified, either for this or for any other
M-profile machine. (There's also the case of "board has a
flash device that was populated via a -pflash or -drive
option".)

thanks
-- PMM
