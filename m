Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1260467lfm;
        Fri, 21 May 2021 08:22:53 -0700 (PDT)
X-Received: by 2002:ac8:7215:: with SMTP id a21mr12214247qtp.306.1621610573737;
        Fri, 21 May 2021 08:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621610573; cv=none;
        d=google.com; s=arc-20160816;
        b=xQa1Ci89y8fkNMD5e3ssrcyOQDNDHfXsrjTaBEXmYVjyF/K9pOnzGbsF2FmxtKw/kG
         hRqyUZeWV+BAhuHpgJn+vFE3l2cVPDJ9gXLwug7h9QRjRLM2BFfi22XEsnsse0DwIfda
         vNyCMALG+vHufAg6Y4XYmXZrjoF1x/Lifeyi2+RR8zak5aQsce5hDHf325hf5MZtef5Y
         3NemPaHFuTXFnVFFw1Fccto5sNPV8HXk2bXebIjRQQ2gm1spdUmh9M/qzdk6tvkEEkTV
         9ZI9vOeSlrBHEqHfo0qOs+ndH5CYBMua0JDUr1xVGwhTHQT778B0K5hlvxVjDNtB9Tr4
         rRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bpJ3eD4/8uWL5SKJxSPL/aVLAM+9AR451TFn29/xKSI=;
        b=yLpMX9kZEh0bIm+l9x7trzpFepcDXvgpJOgmyQ+k8RzMBTdMPcag1jlw7kwo7KDUkf
         9mcP354F8QYnbmSA4ONmXu7Y6N24f8MrmZo9aYN9878Xxl0V8ci3XikEGiBfUi/LCm8Z
         JS+gPaFsRF9tnyfbUut7hvEo5JleBNfRGjBtN6mTlyckzhcZHpVlrI8iD4ljwu6BrRGQ
         aP4HDRwuMyKMyV9aJG6Io/2tQ/pBHbLq6Go7+Z/7ihNi/9meQHlv4cs2COGTfbxzqlO7
         yIzVHniyzEl6E5AZWu2j4vauoRxiHCEo9IIicsyIADWzO3WqxrgndXGivR0lsrhy9KFE
         dAIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tytRNf1E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t18sor6017635qkp.56.2021.05.21.08.22.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 May 2021 08:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tytRNf1E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bpJ3eD4/8uWL5SKJxSPL/aVLAM+9AR451TFn29/xKSI=;
        b=tytRNf1EbL4RpEFOVCOtXkdlnyPrLfIOGZKyI7IuAGQSErNWgmo1ayfAI3hOJRx6sL
         0tbeH/GxTuoaSK4luUcHPOoTZDs87c8J0TohvO2zx47MdeK64LtjBmzsvcF/iY4CCRCz
         cxdlNF1KNfE+OahGKfZ0wt6s/noGrBq1fdv1dzoVlFOZwFNFOHtqNvFt4KCb1EaKkRru
         jG3VSdWaLfwaA8epHxVrb8no9vC7P92UX+nYVhOxN453RcZwl+rglzTGGhz4cn9FuvGF
         SHLdrkmbMZK3Ew3f9+VREz8iX6MhhFIt5qOaf5+nKY6KhtAXRmmKoKUGjlN2w51i9nEx
         qgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpJ3eD4/8uWL5SKJxSPL/aVLAM+9AR451TFn29/xKSI=;
        b=ohMt2f89ihjrVZa0f9Cd+0SdSE6uCI+BKT0YtGkU7qxhlHO/Jvef18afENo8aZcJJw
         jDBbrrLENPHeNggwc33rcwiWJobYsqGXaenJOvJiWzChw0XZvAGNSZKinDP3GNdNFGht
         qEn3gj8sN/gUr0SxbN6BDGfl3xgmGTkkfVLZB14E9v8SK0stNrSh/XsfPIXArxJTzEao
         hFhqF0aNT/clWiK9CwhOeSU1ViRWfNTZqD8YXvZvWK0iqTYW7FZ8bfKwYwE9UK0gdltv
         QKGv2v0GvMn54i+mbKXKfVkFk6XAZavjpClvjQtOcZYKRmi9nYx0uYNyYLb7aUlnqLD+
         VQ4Q==
X-Gm-Message-State: AOAM531+o9cKiLVZIH3uGmuxd2LC8P6EMzzD5szUPeKM6eB9QIaqx3wc
	9U51FvMakRhIqtjBvokBx9oDidR4pWtUgheBAVLNjlkj
X-Google-Smtp-Source: ABdhPJz4zVZcBJdTjO3y2aA0znOxozMpOgf/QiA+jMV7hHkqEOr3x5Xv5MNchk3WgM6av63urkBtnTT6E8sW4IpmU1M=
X-Received: by 2002:a17:906:9bd6:: with SMTP id de22mr10709717ejc.382.1621610573255;
 Fri, 21 May 2021 08:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com> <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org> <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com>
In-Reply-To: <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 16:22:33 +0100
Message-ID: <CAFEAcA8kc=x8KTtW+Qg1wgdPNSvN-_13FEbmF2TPK8xC5q-GfQ@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Willian Rampazzo <wrampazz@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: cJxiBYe0c/wr

On Fri, 21 May 2021 at 16:13, Willian Rampazzo <wrampazz@redhat.com> wrote:
> On Fri, May 21, 2021 at 11:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > This does raise the question of what we're actually trying
> > to distinguish. It seems to me somewhat that what tests/acceptance/
> > actually contains that makes it interestingly different from other
> > tests/ stuff is that it's specifically "tests using the Avocado
> > framework". On that theory we might name it tests/avocado/.
>
> I think the updated README.rst from this RFC, inside the system
> (originally acceptance) folder, is a good description of what these
> tests should be: "This directory contains system tests. They're
> usually higher level, and may interact with external resources and
> with various guest operating systems." I can improve it, if needed.
>
> We are using Avocado Framework as a tool to accomplish the above
> description, but I don't think we should strictly use it if there is
> another way to accomplish what those tests are supposed to be. Calling
> them "avocado" tests may restrict the intent of them, in my opinion.

But the main reason IMHO that we have them in a separate directory is
because that's where we have all the avocado machinery. I think the
sharing of the machinery is what dictates whether a test winds up in
tests/acceptance, tests/qtest, tests/tcg or tests/qemu-iotests
much more than whether it is "usually higher level" or more of a
unit test or whatever. If we ever added some other test framework for
doing system tests, we'd probably want to put it in its own
directory rather than lumping all its support machinery and
build files in together with the avocado based tests.

thanks
-- PMM
