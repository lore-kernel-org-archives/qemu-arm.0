Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp966527lfc;
        Wed, 14 Jul 2021 12:34:38 -0700 (PDT)
X-Received: by 2002:a17:906:c14a:: with SMTP id dp10mr14391861ejc.426.1626291278436;
        Wed, 14 Jul 2021 12:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626291278; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIJKdBEa27OELj4zm8xj/gHjdokciw9PwD9GCHtDQNqAeXdYucvdkR0gc2SRlIagrT
         bnlabF2vLa21hbYfBAbdqTcDdwO2scVIKbETx3hPCFn5Te8Jnv5S7l2axSmkJMm3DQGw
         4aWULaUhzd3xv9VvSu86qzx6Q6tzyD6bilgL/pspSwI4wHgkMV6O6nLccRdvz/rA+MvU
         0Wjs7vZ60CRKfSAT2pPWC20UoozCfQX4vr53qHuyzdfBPb76ZKY7FcnRkGX+MwXK6b+H
         lIquUpAglz8htRWKRibem15F1MBAhSxoe+h3/H38crs0iiNoirh1vEwlvIJAbneLpKRv
         EUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eh4JgfI4Zpsc/Nbe+Nx0saDA/eOx7RpzBk/3orzO+PM=;
        b=C9RSM9oq6FSUYgsJgy98oAM9hmem9uPcgpVbtklBk0FdFDqbFUaZ/SlHTRTdp9ygE9
         EGF4KhbfVbhXT92BWP9geLi8P9F9pNGSRJOXbnsaf9OaF3z1CpOeT0SeC9/40vXi81vz
         u8jT2YmpRkWwXgJPYfP4RqrneJ4yW65oi38RTkqK7qWQZTe0fM4ESChkYpImCzriZU8l
         rbeR3Pn0XY+F18gbKLPhyvDZ7UfZekfhB6S4yRVaLtE6QcJDEXYwbNFunlBFN5iu61OW
         vM6VTA+vDR357EdxnedGdRyN6Xh4YUcCXbEtsiFXqht/os65V8gefLVoiGHA9bw2PTfB
         55gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=redavroh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r27sor1944376ejd.26.2021.07.14.12.34.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 14 Jul 2021 12:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=redavroh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eh4JgfI4Zpsc/Nbe+Nx0saDA/eOx7RpzBk/3orzO+PM=;
        b=redavrohVXq+q3tp1GIsOI47qUD6g6rU2GSFhBvcT96c9MutGjp5ud/0hEEbq0AcG+
         p8C0Qu2ESP5zO0O7n8Mlw5Xkgu8HeSdXB929Mpt/6r/n4Ssk2nKsfkA8RDtP5ysRy+vV
         5wrdPJviBI60gJP12wqrbvCpGu/WGsq3QUHHSG9hFYeG6L/4geiW4x432AyeGVtRqQxx
         RWwy+0CVVJFYlslZcoOpitrpl6XA9QzvZGZTD6etYpA/Q+Id0TDaM8V4UktCrdEdBsLV
         pYjQ3MpJ+18DqsvtEYNhnvaoh+nfjMkyu4HtiP540aKnk8L8ajYlq9MrOqTe4Jkw9df+
         74WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eh4JgfI4Zpsc/Nbe+Nx0saDA/eOx7RpzBk/3orzO+PM=;
        b=iESm4+8hGS9U2JQ8SG/ME6/cM6s1pi7YhlTJ9HKVVosyHdzalWbE9pN+ciWlZMJeQ/
         AA6eTH9+ct5fsKDKyZ0E2EK5FSQGeRqVHZJaIFIAEpu/nL5SeFJJxr823OpblnLMcJPW
         lB8CEUXvHuqtV0bCtbE1RqSAt7Fu/ihkfSrqV8MLIHzUKWOchGvUNUST75zagVm/AprD
         icjYal7oHJJX4riaKzia9YqBkJpVLWwu3/QWvr802ST0elBFGBE4gFBhvCP6JbXPMrV/
         pTROw2pASJgagSw4xPM20eBGq2oBP/KRKedyJQ9bY/JI5tkh3i1sbuLSKOwr/cI7MTbW
         bzwA==
X-Gm-Message-State: AOAM531GtTXcg1COI9vTTkerIeKt2znJFA+9bUMMhgpc54SlFOw8DI/x
	xWdf+D9UwQlibnuRWJu5OlLEzVxEHKi4kCJStqS/DajA
X-Google-Smtp-Source: ABdhPJwEVSsiOdf1eBCzNA7W3PU4gwpPKHhJUw8Ma5yGysv/1pzInLnfm21mU2iwiHQt/yFzNv7GnzH8ueeKPsBqkDI=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr15654301edt.100.1626291278113;
 Wed, 14 Jul 2021 12:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210713211923.3809241-1-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 20:33:58 +0100
Message-ID: <CAFEAcA9corAMJPn4oZ13ovrdfdCR1ZFuRHRcfnFVOiDs7pxfPQ@mail.gmail.com>
Subject: Re: [PULL 00/23] Python and Acceptance Tests
To: Cleber Rosa <crosa@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Ryo ONODERA <ryoon@netbsd.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Willian Rampazzo <willianr@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	John Snow <jsnow@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Paolo Bonzini <pbonzini@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Reinoud Zandijk <reinoud@netbsd.org>, Beraldo Leal <bleal@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Eric Auger <eric.auger@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Thomas Huth <thuth@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: E6p/J2w9momT

On Tue, 13 Jul 2021 at 22:19, Cleber Rosa <crosa@redhat.com> wrote:
>
> The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request
>
> for you to fetch changes up to c4e2d499c94fb7d6ea43d28e2613559861ef5d79:
>
>   tests/acceptance/cpu_queries.py: use the proper logging channels (2021-07-13 16:27:43 -0400)
>
> ----------------------------------------------------------------
> Python and Acceptance Tests
>
> - New SMMUv3 and Intel IOMMU tests
> - Respect "cpu" tags and reduce boiler plate code
> - Improved logging of qemu execution output
> - Other misc improvements
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM
