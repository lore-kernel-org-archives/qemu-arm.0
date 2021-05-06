Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1412924lfg;
        Thu, 6 May 2021 09:04:41 -0700 (PDT)
X-Received: by 2002:a05:6402:3126:: with SMTP id dd6mr5035199edb.379.1620317081340;
        Thu, 06 May 2021 09:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620317081; cv=none;
        d=google.com; s=arc-20160816;
        b=ilX+iVIQEx1knxrxhSnqU0V5WeCXIGn3WQ30PSViLhElezroMsAUAV80ZTVogeDQF7
         ol+3Ojyg9BOe6cA3i5fLB6yLAC47yxj041OywdF3NO3/WpFdoz/70x2vUVsUUxqD7163
         VWmdsz/6fn4RcKlmBw9GONCxNq7CC9Vzm/p8H/ZSliUQjhjHXSzcP1rotZf0122SiaQU
         /InMF8RYH/UDEB3ULAmLFNEfEqsj0L9FgjltY55g22IkO73hejNlkPjKrPM30U3/u9sJ
         KJu4qJhMwaI7TrCKjTT7VckxZJDK8yE6iJh3eet0HcgYKSggjcg4svJ5wqAbUo1yHYaa
         FcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C736AuqidzDQYfgZUZZB0PARKzaD4iAVzFxsLnZvVFc=;
        b=0OefZIbgvcDOmyZo49ld6oGtKkYNZxxyuMovi1+eduqUR46dWA9vUZ8lhoMpVwuUXy
         5ckyOO2bslsGGxg832fSEQu21tB0OpFZ/EdiBhDhT2k+KXLhJZ7TlbV26+AsO8BnsOTA
         vbEShk231u2Zwq7biEVEC47+eAiVRQCSfkYCh9rrRNNXar3CYvtRMHf/z/X98401ZOcy
         QtCpz36lVO9zUGvsILDQpMN/4gc+1HVgHCuZ1B6oOyIFWj/BWuNgQuVSI63RRDwcqLJ9
         FOezWQSbdgkai/SH36O0oNBY3aYNksLDTKO8yGwzSSn/aZcl/GjHPYctK3lRM9sfuy4y
         /AgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1fAETre;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id pv22sor1895225ejb.57.2021.05.06.09.04.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 May 2021 09:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1fAETre;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C736AuqidzDQYfgZUZZB0PARKzaD4iAVzFxsLnZvVFc=;
        b=n1fAETreJFQdC7wXEx5ii+pfu/gGH9b/X8P5A9SX9BGHF7EutNs8G9WP/6DeQ2UEEz
         lf3SV4glmo9fE8fMqGf/+JMh4m+fmRshQpmQh79Olzk5LYno3JkeOfytqEKfk/VclzzJ
         of6IX46ugieYUfWu0eEiMPC/A/nIUtuPLE3+dgdoXM7BCZ5ZEewe7BI/qNpNP4P7/eqh
         x1uCSUJPNDOvt3uq/6X68SpaE2eiJRn/D2v+9sJrdNQqvEXBFt5cxsJ77XFujzRe9E0u
         dJSkDbtfDPNtAd+q/qcFmWTw3MJND80Z31hpZSed3D3dtCJNSiU41yxdRE0pLc5YIdKB
         vSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C736AuqidzDQYfgZUZZB0PARKzaD4iAVzFxsLnZvVFc=;
        b=fCdWlCE7C11fUw1BHTkEpJwiCjn/+PXEICMzh8bqDvMiu+oKxSMyG5MP8QM32aP/eC
         rZvCF2/DIxamu7KFYDBzVgLLtXXEA5N1kAolsWndVXe4F+mhc66vybR6bBuKmyaPF3UO
         xgiaQvxDgW+wMbuqODQjiw37fTpOX8aj/aBpQgeMHxoFGvnYRvTzzaL6XbcRpXzOSSkm
         5FrJ2GnHbpnth4TRppym5vBUHYz2fNC3MC6hsQZazyNc1pt9G5XX02buHU+ubtAj+2pg
         bLCG5LwILEZIwlcsRxWcxxL7Dr2OkmOaszgPrR6+e2O+TG+4xHGxVwAxKGXY5h0+CeRL
         L7VQ==
X-Gm-Message-State: AOAM532lHcks3Isoqrkey1/mHZl7Fahb7u3seg1A/EsxxzN/VtuTVFPB
	sdK4xiivxI7fA1R/Bp0MUZrNxIfopXbtVEYMc6l8dzZG
X-Google-Smtp-Source: ABdhPJxWQt3yjMYSuWKONmSU3rQ4pt6tgqkHulEIhHw9fFhEGRGThw0EfZS8dZ2aVL+Wv3z1hTcsyguw7VV4nt7m6PE=
X-Received: by 2002:a17:906:b1cc:: with SMTP id bv12mr5163395ejb.407.1620317081062;
 Thu, 06 May 2021 09:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com> <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com> <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
 <7a96d45e-2bdc-f699-96f7-3fbf607cb06b@redhat.com> <CANCZdfrcv9ZUcBv7z+z3JPCjy0uzzY07VLmC4dqr5r8ba_QPLw@mail.gmail.com>
 <adfc5da4-a615-24d7-0c67-f04d4eaec9a6@redhat.com>
In-Reply-To: <adfc5da4-a615-24d7-0c67-f04d4eaec9a6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 May 2021 17:03:33 +0100
Message-ID: <CAFEAcA98KHKcGam1nukspYOQvPNXyq+hfsNbATpNvmDGoODN1A@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Eric Blake <eblake@redhat.com>
Cc: Warner Losh <imp@bsdimp.com>, kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: UEtpldsg9Zl+

On Thu, 6 May 2021 at 16:46, Eric Blake <eblake@redhat.com> wrote:
>
> On 5/6/21 10:30 AM, Warner Losh wrote:
>
> >
> > But for the real answer, I need to contact the original authors of
> > this part of the code (they are no longer involved day-to-day in
> > the bsd-user efforts) to see if this scenario is possible or not. If
> > it's easy to find out that way, we can either know this is safe to
> > do, or if effort is needed to make it safe. At present, I've seen
> > enough and chatted enough with others to be concerned that
> > the change would break proper emulation.
>
> Do we have a feel for the maximum amount of memory being used by the
> various alloca() replaced in this series?  If so, can we just
> stack-allocate an array of bytes of the maximum size needed?

In *-user the allocas are generally of the form "guest passed
us a random number, allocate that many structs/whatevers". (In this
specific bsd-user example it's the writev syscall and it's "however
many struct iovecs the guest passed".) So there is no upper limit.

The right thing to do here is probably to use g_try_malloc() and return
ENOMEM or whatever on failure. The use of alloca, at least in the
linux-user code, is purely old lazy coding based on "in practice
real world guest binaries don't allocate very many of these so
we can get away with shoving them on the stack".

thanks
-- PMM
