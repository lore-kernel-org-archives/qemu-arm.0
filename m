Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp237254wrp;
        Thu, 3 Oct 2019 06:03:51 -0700 (PDT)
X-Received: by 2002:a9d:73ce:: with SMTP id m14mr6576207otk.135.1570107830912;
        Thu, 03 Oct 2019 06:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570107830; cv=none;
        d=google.com; s=arc-20160816;
        b=YWbinvQbGp6zK6gHJWA+1UOId78fsPf/ZVjcXUQ0EpFFJfan4EKIcZpk/4vQLEbVtq
         +i6LltR2Rrb6tW8qKl9Yd2+R9JdjyM26UWxZ5wIKhNbguZ7sXyhxRTIedluTr3kNYmU9
         LZa5WP93rY6SLcJY4ZthbXWlhpyxoJbO1Db4i6izSqvaMrB6DfHU1rQQ0OKzzOvPlHcP
         Jqb8qiDELnscIJdwlJ/GYf5o/xe1aOZMIc+nrbzuhJHWt7Ucul+cx+Jln6AC+4cGC5ax
         R0Qe2Khcu7SXM9059U5/TDuCE1Ku1rnKYYWd3XYDloticBYtawiF8eYGetTGFPp/RloW
         WKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ipghaSDRH3YnZXK1nkRDDiCycPJ/rQxJ3f4sjT7herY=;
        b=Gt0s+ac/PWxLSs3QkvrJzMNlxiBztnCz+gSVcBrYLW0SNCp/trf8PUyp5xCpL49nRR
         iY1N5k5vxsEubYJ4w33ssON2Yx6mThuXqggVCxVlIxVv1C5sgEvYB4X+dL77z2mcKn3j
         oUv8fHFZN5rix0abZ+ktEr7Xm2p76iEBheW052oOZfoc2FOwCv4wC6IsxTW2ZzImwdxi
         Rtf77hzUGlWWzxCnwFbs52zoIzZFO3g0wuNkBquxTjD+5F+c9/JeX2NxjButJnf4/6fS
         9WyyQ8sl4uXV8yauk7hba7esXPg87/g8A2usUMZMhgPP4nqUJCAmJuz3EvcSg3qSvV4r
         Pfow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nMDrk/Au";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t18sor1042615otm.111.2019.10.03.06.03.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2019 06:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nMDrk/Au";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ipghaSDRH3YnZXK1nkRDDiCycPJ/rQxJ3f4sjT7herY=;
        b=nMDrk/AuwiorZpFQW/VJN4lPDP3F8E04MZlm4T3Tipjf8H4p8r8U1HdnVbFxjSxPFB
         DHHUKHVM70tMzNywW1W7hO5URlWvqWu25rxPmtPW25QgSwxBaSIi3pUJj2cMdtX8vhcp
         /OfgrMGADawAX3ztzna35maOtiawZTbNggTfEvWyzky6RuzudZCnpwME23AV2qwD9zX4
         aHcqr/yXIjkZPES8PUsvt9I7c/IStMKfiiMXL/jz7ofMJSCTeIwoSyzRfPgYU9CquZGX
         od3n6Waj8EFj0JspcTmDOgfN+Y1H344H28fZyAT2nORsh2SqH6n2pLz9XPTkGKJeGuMs
         /uwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ipghaSDRH3YnZXK1nkRDDiCycPJ/rQxJ3f4sjT7herY=;
        b=hp3qq4OQ5VW90Kkj/rLAryRUUXDSMhNCMCV8a7ZjGY4nxAYZVVgz4FTJ89jlj1k3cL
         RLvVNI1TQsiS/Jpx9GPmVwNT9rojOIGbrrrjiUulx6ACiKoeaJKWBiOMTaGADUoobRDE
         ciG7IszoDRffJEniu0hIUGS4WT1COtO7D4nCJdTZByiOQ1SzzlXw04McwQbTZC7yHs22
         8AeK/Pp9ZpgbxcKCkXMhuhNXC/EXzjyIMbmJjNQy4KLmWtXBPSlAMcE0lUCW03IHxOMq
         dJrdoXDh+eRIy6xF3MXMtyl+PQg7lLoF+r27K5oW4JZC8XZN/To/HJAdi23tTW9XKLmc
         v4xw==
X-Gm-Message-State: APjAAAW5kEZRV09SN5djrZ82r5mKs91rU+tsBexnST9irqoCT0H/8RMM
	tQFS0yyuRvZaeVva+CZM4H97mYZCIQ3AYk5KPy8eLgjh
X-Google-Smtp-Source: APXvYqxO5Wzft4nIjec+vUoP6tXA/o5iAru/G7hppGwN2pbYBDVpe7ybD7FKZ2HJ8jUODWDTrgXgbSFaRKwucqEz0+g=
X-Received: by 2002:a05:6830:1357:: with SMTP id r23mr6670747otq.91.1570107830223;
 Thu, 03 Oct 2019 06:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190916141544.17540-1-peter.maydell@linaro.org>
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Oct 2019 14:03:38 +0100
Message-ID: <CAFEAcA_deKRqVfn+P5HBQrTcHFjdSnHdcuzvFJsQC3jUP=dFww@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] target/arm: Implement semihosting v2.0
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: L32Y4lWuKq5n

Ping for code review, please?

thanks
-- PMM

On Mon, 16 Sep 2019 at 15:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements support in QEMU for v2.0 of the
> Arm semihosting specification:
>  https://developer.arm.com/docs/100863/latest/preface
>
> Specifically, v2.0 has:
>  * a mechanism for detection of optional extra features,
>    which works by allowing the guest to open a magic file
>    named ":semihosting-features" and read some feature
>    flags from it
>  * two defined extensions:
>   - STDOUT_STDERR lets the guest separately open stdout and
>     stderr via the ":tt" magic filename (v1.0 only allowed
>     access to stdout)
>   - EXIT_EXTENDED lets A32/T32 guests exit with a specified
>     exit status (otherwise only available to A64 guests).
>     This is something that people have been complaining
>     about for a long time.
>
> (Technically some of the things we already support, like
> having an A64 semihosting interface at all, are also part of
> the v2.0 spec.)
>
> This patchset:
>  * fixes some bugs relating to errnos in some cases
>  * makes semihosting hand out its own filedescriptors rather
>    than just passing out host fd numbers
>  * abstracts out the fd-related semihosting calls so they
>    indirect via a function table based on the type of the fd
>  * adds a new type of fd representing the magic file
>    ":semihosting-features" which is used for feature-detection
>  * implements both of the extensions defined by the v2.0 spec
>
> I've tested this by improving my semihosting test suite:
>  https://git.linaro.org/people/peter.maydell/semihosting-tests.git/
> (if people have other guest binaries that make much use of
> semihosting then testing would certainly be welcome.)
>
> Changes v1->v2:
>  * Added a patch which corrects misunderstanding in a FIXME
>    comment about the when the callback function is called
>    for arm_gdb_syscall()
>  * in patch 4, if the SYS_open is going via the gdbstub, we
>    must do the associate_guestfd() work in the gdbstub callback
>    function. This is because in softmmu mode the callback will
>    not be called until after do_arm_semihosting() returns.
>    (The v1 series effectively broke SYS_open in the gdbstub
>    + softmmu config)
>  * Pass CPUARMState* to set_swi_errno(), rather than creating
>    an odd local-to-this-file typedef of TaskState for the
>    softmmu compilation
>  * New patch: avoid ifdeffery in gdb callback fns by
>    using set_swi_errno() rather than doing it by-hand
>  * The various 'factor out SYS_foo' patches are basically
>    unchanged, but all the functions no longer need to take
>    a TaskState*. This seemed kind of borderline as to whether
>    to retain Alex's reviewed-by tags, so I dropped them.
>  * Since we need 'env' for set_swi_errno(), we don't need
>    to put the variable declaration inside ifdefs any more
>    in the host_readfn() etc.
>
> I do plan to have a go at fixing the odd FIXME surrounding
> arm_gdb_syscall() which patch 3 clarifies/states in a comment.
> But I thought it better to not tangle that up with this
> patchset, which is already pretty long.
>
> thanks
> -- PMM
>
>
> Peter Maydell (15):
>   target/arm/arm-semi: Capture errno in softmmu version of
>     set_swi_errno()
>   target/arm/arm-semi: Always set some kind of errno for failed calls
>   target/arm/arm-semi: Correct comment about gdb syscall races
>   target/arm/arm-semi: Make semihosting code hand out its own file
>     descriptors
>   target/arm/arm-semi: Restrict use of TaskState*
>   target/arm/arm-semi: Use set_swi_errno() in gdbstub callback functions
>   target/arm/arm-semi: Factor out implementation of SYS_CLOSE
>   target/arm/arm-semi: Factor out implementation of SYS_WRITE
>   target/arm/arm-semi: Factor out implementation of SYS_READ
>   target/arm/arm-semi: Factor out implementation of SYS_ISTTY
>   target/arm/arm-semi: Factor out implementation of SYS_SEEK
>   target/arm/arm-semi: Factor out implementation of SYS_FLEN
>   target/arm/arm-semi: Implement support for semihosting feature
>     detection
>   target/arm/arm-semi: Implement SH_EXT_EXIT_EXTENDED extension
>   target/arm/arm-semi: Implement SH_EXT_STDOUT_STDERR extension
>
>  target/arm/arm-semi.c | 707 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 577 insertions(+), 130 deletions(-)
>
> --
> 2.20.1
