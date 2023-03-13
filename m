Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp506226ejb;
        Mon, 13 Mar 2023 10:30:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:c:b0:5ce:ef1b:a8b with SMTP id h12-20020a056a00000c00b005ceef1b0a8bmr30858239pfk.30.1678728646157;
        Mon, 13 Mar 2023 10:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678728646; cv=none;
        d=google.com; s=arc-20160816;
        b=FIE22Uotuapn/1ZZFSOHuXNpAhYGBgv8BcFQ+j6jLYjp1LXt40/3P/1mkzIQQfCIeb
         wRLy7FjoNPvv82GdzsqGSfU+4J8/FVl9OonDb0un2sABGmIcdODnr+aO6QSGUPa+cMNk
         kvbVtVkZXrj7DeuQl+hb1JlHIVSktOe8M+MO+qKI6cWf5UKYZlfslW+LujDSvp/xkZLN
         vbVYcILUFQuCOkwa51NaFeNywfc6tEY5ZzFdUKgY3fZME9NGH3aj5yPzmSUgevRUv8B7
         bwMaKsKbh10LAnx22liIIr4dh7qmUU6oypGa3xSv9GZQhrTPI3ly42izsYFIYnm02bvd
         3jBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i+hPFBDCgAXkGHwRRdx4xzCu36A6oA4pN630X3SQXOU=;
        b=oHK5S2CeURmcr7aQOxVCMfT9FQzS3lCMlNMbisnP0mLIG+w+F4wOjACcrJISrP6N9Q
         jgAJbAIdo6uGXHtJXvIMdFNppoOsjyKx1IAPpiLW+LSv+hEESQdo7/hNR65Y/56H/XT1
         OrgYSnm2DBn0TBRUBaFt5FKR0U4VApIBtn4sRiywqP0GaSfzcmrxWuCpx3kn6YFQMFc6
         RfuT0Z6NZouawv0qRi57g4FCvHgEC/3ncMow7OmlIwFmmLwKb6K3MpwJHvEEeskBXdkn
         1mXIUxPz4tic5cLUQHowKGeuOoUvcldbNc8b6C3z/tP9MlpBzOySsng5qGjd9KlPzV43
         A7Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4R400zG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b12-20020aa78ecc000000b00625538b505asor303561pfr.92.2023.03.13.10.30.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 10:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4R400zG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678728645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i+hPFBDCgAXkGHwRRdx4xzCu36A6oA4pN630X3SQXOU=;
        b=k4R400zG1kvC3OossUoz4uDgUhqsHSJce7eWQoSSTwntAJ7N0qnubCvGL8voGWK49t
         CuYYqFaPKBNMP0+vm0APP3BZh5uPBbGGD0q1VasSS9qsfKdbZeHnSil67zDscGetJZbZ
         WO+tPUAuFBbmLM5ZbCUaumRrPPk1vfe5UJOmRQAtZJbKKzrCn4Gj0Fi8CdW/C2fqy8A2
         7BYgn0jen/+SNbjXnDYqVUmvfMuVN1645LSJqeFbBlcome02YIpmkHYJgrgzcOJsxOpP
         N41TBA9mLTEgFsDiJT3hs97tYxeMUt1NQrhX/VnwPvMge9Z+deSYq5rphWe6Yk04KuOn
         xMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678728645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+hPFBDCgAXkGHwRRdx4xzCu36A6oA4pN630X3SQXOU=;
        b=SBxKdXQCQ+npjadkIlsDGSrJDa7VxC1tXplHYQJFN9ADFxwvuaAs9hTNyHfqsiruuV
         omAHUavIAuURYEsi+FdD+DPGbHYpUdF1zyeCy7MTsD7FmYMMvn4AkTL1o3XZm6LA1Clc
         3xc300NQZ2JIsQ4m0EOKwlSSvqrw9Kw4wJa+L0DiGJmQD1a16/AM1pTunTLkOjkAVMLo
         Mc20Lq/9UwhnA/x5CWeahuFSq4TMvGvkyZFI5kVn/m1W1hNu7gDrCNnsAVdah4WTt5d6
         wDIdG3bUUOFqV4iCdfLf6kwEFqAhNDlaaVAnCn+IjAGnLSepiUwzZbHvogMcePJfaK+Y
         20Lg==
X-Gm-Message-State: AO0yUKX+vv8TubWWE2nicvWzVZ+3h276nFOZ7GKqnuM2CeIXU6K9GpCS
	3qJyMcMncZ1lU9glsjuBKsRTml9EFnO9hN3dai8Ohba+
X-Google-Smtp-Source: AK7set+Uy7f1+v5V9LM/ctSSkweHNd0MJ2cUNCC1UrSVcwFihep8SwaV42purBHmWXllZTwRDWhrQFMw3Z26jcpjv7I=
X-Received: by 2002:a62:4e84:0:b0:625:4ff8:3505 with SMTP id
 c126-20020a624e84000000b006254ff83505mr473619pfb.1.1678728645658; Mon, 13 Mar
 2023 10:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org> <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
 <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com> <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com>
In-Reply-To: <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 17:30:33 +0000
Message-ID: <CAFEAcA9gdHi0QV1zj7nMNz1=NQjPyMisqU_Wqdc-HaLZg45HYA@mail.gmail.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: UxbUhSLDAwrl

On Mon, 13 Mar 2023 at 17:14, Thomas Huth <thuth@redhat.com> wrote:
>
> On 13/03/2023 18.03, Peter Maydell wrote:
> > On Mon, 13 Mar 2023 at 17:00, Thomas Huth <thuth@redhat.com> wrote:
> >> I also keep running into this problem ... I wonder whether we should run
> >> sphinx with "-W" to turn warnings into errors when configure has been run
> >> with --enable-werror ...?
> >
> > We certainly try to do that: docs/meson.build says:
> >
> >    # If we're making warnings fatal, apply this to Sphinx runs as well
> >    if get_option('werror')
> >      SPHINX_ARGS += [ '-W' ]
> >    endif
> >
> > Has that broken ?
>
> It apparently does not work in our CI, see e.g.:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3922732898#L1420
>
> ... there is a warning here, but the job succeeded happily.

Specifically:

/builds/qemu-project/qemu/docs/../include/exec/memory.h:1741: warning:
Function parameter or member 'n' not described in
'memory_region_unmap_iommu_notifier_range'
/builds/qemu-project/qemu/docs/../include/exec/memory.h:1741: warning:
Excess function parameter 'notifier' description in
'memory_region_unmap_iommu_notifier_range'
ninja: bad depfile: multiple outputs:
/builds/qemu-project/qemu/docs/devel/secure-coding-practices.rst !=
docs/docs.stamp

Also, what's that 'bad depfile' warning from ninja about ??

I looked at the build.ninja file (which you can fish out of
the artifacts for this build), and it shows that we are
passing -W to sphinx-build:

build docs/docs.stamp: CUSTOM_COMMAND_DEP ../docs/conf.py |
/usr/bin/env /usr/bin/sphinx-build
 DEPFILE = docs/docs.d
 DEPFILE_UNQUOTED = docs/docs.d
 COMMAND = /usr/bin/env CONFDIR=etc/qemu /usr/bin/sphinx-build -q -W
-Dversion=7.2.50 -Drelease= -Ddepfile=docs/docs.d
-Ddepfile_stamp=docs/docs.stamp -b html -d
/builds/qemu-project/qemu/build/docs/manual.p
/builds/qemu-project/qemu/docs
/builds/qemu-project/qemu/build/docs/manual
 description = Generating$ docs/QEMU$ manual$ with$ a$ custom$ command

So I think the problem here is not with Sphinx, but with the
kernel-doc script. That script has an option "-Werror" which
turns its warnings into errors, but our Sphinx extension
docs/sphinx/kerneldoc.py does not set it. I think we need to
have the extension say "if Sphinx was run with -W then
pass this flag along" (hopefully Sphinx lets us find out...)

thanks
-- PMM
