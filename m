Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2867432wrg;
        Fri, 24 May 2019 03:56:38 -0700 (PDT)
X-Received: by 2002:a9d:3c2:: with SMTP id f60mr164792otf.74.1558695398784;
        Fri, 24 May 2019 03:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558695398; cv=none;
        d=google.com; s=arc-20160816;
        b=gtPCcMUY3sSA6Cakd+Gn2wFa2a62Asoyda4nlI7rYkrmV8HNiQGhN3kLd+6nm/wINa
         msZ+OEfK0zHWt0cv0jEyI9BsXNzXXdLqcwMkjTaveVuoVk702HZ6gdDAC+6zCqtttbcG
         HTY3B2mvu6/cJAvOetmYLj2q9N4vTgyhfxQhp591srqlZWJ1QdYZ2g8vh0sAsWBG2oAe
         RLilZ+Yh485IM0KvW94pypATrazwADj+9/bfQsk/+w3Qv4CeC1JvUuheZlSw2g8cj/pI
         QSGPTZOnu5y+QuVrTmYBpLUdtk8HcBgNYgx++SPKxPMA+CYi+NyDK/a2Q5/JaJoGBBc/
         VZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJGUWQzCyBfav+i0AdQnhQAz8aaBzTAkRWNXH5JSs7U=;
        b=0xbK+ueRPUB5iLAuUXvICYZumos6xoQFrKJB1LU1aqGuIeYfTbRriwOoWbbo25V2cJ
         v7Z6XrIsIka5nZWaEHASpBAEYRmqQSNXhEUPV+i4Hz4GWdjOwglkoeILJ8JWJSf/H118
         GvDiJZFbF+D9syr2wlNBBqzgKT+8Q0wAby7FHe4vWu4hwrX0cjJ9UYxJzCXRv9vpAPz/
         gTCx8Xp1Tb+ZGnL5xmuPdW1svZ5Pj5SuWFfGDuj+5lVShGZcv89v+jufnSm/rKDHYBgr
         AsuoBANXqsEBcGl1qxOkyBxamiN6NcVRRwKfZJuuz+0l/vRAzKI2luNGqxJygbjrKyNm
         hpNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B8rH0BRt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g83sor802526oia.42.2019.05.24.03.56.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 May 2019 03:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B8rH0BRt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WJGUWQzCyBfav+i0AdQnhQAz8aaBzTAkRWNXH5JSs7U=;
        b=B8rH0BRtgBuS9PXBjpzIp2B8gZI1ed6cZ0Jb3nk7QsriEb7UyrTh3dPwvhX38JAtai
         ybnhf1zpjd6rGd6EW4+Z6SG26Bjbj+DxHHvL7RJpzMfPbnkTr3EZTBm07PyFsvZE38Iq
         aA625CohmYtJHNwizdqVFdq8Y/uf3KhR8ZLQFPXANkuYtesYHh6tG7QOt+Pkz0TV/8GJ
         Anc+DYGLr4SMWjuhGfoofFQTgQy+SXK/VRafj2QwXjMLdTk+G4Ltx9N117k1RtFRnht4
         hCEzFuC3eoAa9F8OgS+GF1jUp1J8gfjxznjRX152WpuOiTlne1lG5SArHlBADKNcTeMY
         QEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WJGUWQzCyBfav+i0AdQnhQAz8aaBzTAkRWNXH5JSs7U=;
        b=nJGk3ExPylNrRf2VkRaBsCbRCPmxbgP53DCSLxrEA14N+U+TJ6WF6SyjvppDU3G0fF
         NDI2gRT+BT+YQpBA9fdvGQfVaS+N2nBJLCOkqg2GGCJ2RIr8suqwmHKKI/kxl5ejJXUl
         KuIoVinV4dWbevS+ImkHFk897j36mN/7uDvtUsD98l+6JjZqXFvUbOlBOVf+xOPei5mh
         mPfxhtBDowSMLC8s/bDJwIEzEz2BdLzLb2/hvGC0nhJNazFGElQRYCoIaEWEF9MmDJE6
         HtT9UigCN6G8E5xvfQn9rsZ8MY9V7Nf3SKPrK/z2uvtEIBa2fgeE7ig86oKUpahXTGYg
         lYkA==
X-Gm-Message-State: APjAAAWeCHwtLR3q/ghiM98edWUrdstaC18u+bXsLqffRIPBYYosLeoT
	f4Kw448pqGeCSCdqdIxznc4EKpoS3sDxe/ypR97wKwbgSybcgg==
X-Google-Smtp-Source: APXvYqxVbmHOuT+SWWRgH8UNTYbywGrrZysLm2+EBf7oh9cRtpkun0F9oyS7Z0juIDMZ7B234QkhM0ahdUfN6uL/wLA=
X-Received: by 2002:aca:b1c1:: with SMTP id a184mr5911488oif.98.1558695398200;
 Fri, 24 May 2019 03:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-4-alex.bennee@linaro.org> <CAFEAcA_+=7VfvZRc__q9L3vuHO6YgetrjTPAYJx4eo0mAdcPXg@mail.gmail.com>
 <877eag165o.fsf@zen.linaroharston>
In-Reply-To: <877eag165o.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 May 2019 11:56:26 +0100
Message-ID: <CAFEAcA_Fu3Ep10NooU5-XcAqQVjJQE5o1L2JTdYTatjcOptPUg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 03/28] semihosting: implement a
 semihosting console
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ynGqgEixVst8

On Fri, 24 May 2019 at 11:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 23 May 2019 at 11:39, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> > I'm not sure about the "no callback" part of this API. The operation
> > here is genuinely asynchronous and providing no mechanism for the
> > caller to be able to say "ok, now wait til it completes" doesn't
> > seem like a good plan.
>
> Well the caller doesn't really get a choice. At least in system mode
> gdbstub does a vm_stop(RUN_STATE_DEBUG) and brings everything to a halt
> anyway. All we've removed is the ability to tack on a callback (which
> can get run in all sorts of contexts) when we restart.

gdb_do_syscall() is asynchronous -- it arranges for the syscall
to happen, but makes no guarantee about when it will finish.
At the moment the gdb_do_syscall() API allows the caller
to cope with this asynchronousness, because when the callback
is called the syscall has definitely finished. As it happens
the callers are buggy in that they don't actually do the
sync that they need to do, but we could fix that bug (ie post
a semaphore in the callback function, and wait on it after
the gdb_do_syscall() call). The API for this new function
doesn't allow us to do that.

> I could just drop the API here and allow the semihosting API to call
> gdb_do_syscallv directly?

I think we should either make the implementation of the function
properly synchronous (ie do the post-semaphore-in-callback,
wait-on-it-after-gdb_do_syscallv thing in the implementation,
or have an API that lets callers do it.

Perhaps we should just make gdb_do_syscall really be
synchronous (ie have it do the semaphore stuff)? We
only actually use it in semihosting, and I think all
those cases require that the operation completes before
we can resume execution of the guest CPU. So doing the
synchronization in one place in the gdb code would be
simpler than doing it separately in all the callers...

thanks
-- PMM
