Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp44707wrh;
        Thu, 2 May 2019 19:04:24 -0700 (PDT)
X-Received: by 2002:a37:88b:: with SMTP id 133mr5939127qki.25.1556849064743;
        Thu, 02 May 2019 19:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556849064; cv=none;
        d=google.com; s=arc-20160816;
        b=Rr79HV9jURSS/sYzbGXIvtqyAu7MUjuuPT8HaAFrufr8XfHPOaTSAYu/a9VMFVt2rb
         gVmkzoia2cysf97ZQmlaOntUX9ZotZEp7Xn9qS4Sju1+NhGTwQsR2xMjFEguIitEucTQ
         AaozGRXKQE2Kjlxdhou5iY8X2I1qdbHHsPpZA7pd+IepOPPTwXTv0YlM/Eg2VkaxC80u
         PRC8T2Xz5m/jGyHFZWryF4a3mOSBtPad+/uIhwScTGmd6Bt7nxK36QO9FwjBXJM22mKy
         vVoIbGw8tH1Yfk4GuXTsh6tUtNX74XNJdCS0k8SDgwTlvQr9vc1SsdsYh306a0cGV0cw
         a3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iLCJFceTJq9C8V46rQKva2rGkVweODOBqpcEY5lfNaU=;
        b=1BVHmH1YWg/744red/5j+HIN6FkmXgYF84Su+ZkoccjtTarhSiBli7TTbA7OAk0lr/
         sJD3YKm2xN7UqT3nNEwB2GDyNGGxkU5Y9fWGTqlkmouBrAPxq1133xSufWei6m9ssFjY
         BVhxiYCDvcoedq1atZCaYPFp4ofgZ11dEJgdLACu8w/GhYZZ58NaAWMXrDRT1APgp6ss
         DKCX0fry+ARCW19MmOtecZz3qEnjpxMCoXjozmd8Nm6PsidAPO7gGILnUy8jNReySM40
         E3Bhuuy/owabjSKnlepjRaY4lB84ucXz49ndd9iKfV037T3VKxDOqNl3K031bPK8fw++
         Vi0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b="LicIv+M/";
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g20sor1145277qtb.67.2019.05.02.19.04.23
        (Google Transport Security);
        Thu, 02 May 2019 19:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b="LicIv+M/";
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iLCJFceTJq9C8V46rQKva2rGkVweODOBqpcEY5lfNaU=;
        b=LicIv+M/WKUOYy0NB5TKYwFba2rAh9rsR6ops03H18mzjQSoOqyNn4eF3B0SY/KFOK
         fantdGGu62HyLnDk4/Elm2lVb2e1vZ5HzvV5P29TM/s3eOmrfTzSwnViGlV7beHhJMuS
         Aj2WQQw2Q3pEwbrOllwTLeT9gHCV8vefErTWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iLCJFceTJq9C8V46rQKva2rGkVweODOBqpcEY5lfNaU=;
        b=iLc73dynopeAehGtxKmFlxasOZOA1KDWicaTVna+fN91v/gX2a8T2wGalL0hi6j1zj
         dpGTdEzAB2S3xVvDAvYRU51e0w13H3ulZJ9+1NO3z01d8RMe7u7dAykPl7s0q35Ky86Z
         yoB0qDvvEPUc6n4M30hi1QUGBsrrbUPDZ1FCt8FBtF9iSwKIP1KRIDVjGgSrWNr3fJi5
         rABgyzT3QqAmU2OsU8ABTHA+H6KM/xlBp/Pn46H8ytfEF4epHrXrMZLdh9B34x8b6t4L
         Aur1hO7C5OXSAkxiFPAnA2GpC4gYj1cutURZcDh2r11htd4tHUWaKyA9gMFqXNLODQvY
         D76g==
X-Gm-Message-State: APjAAAWb+NU17g5Elvz5TNYOhyLDpKFz0cTm8TQNBtjMFrcg2m8MTo5b
	nVUyAz/GtC+yP/XaahrFPUCHja/6nXO/9HCzdgg=
X-Google-Smtp-Source: APXvYqyZk/wKiSz8jm8RZKTb5dRyWnqYoFoVNOCaVSrd7cRXh+AVeTf28lijNBAoW2tcl7CSBgMeTXUT1Alc8fyJ+6U=
X-Received: by 2002:ac8:2565:: with SMTP id 34mr6370365qtn.37.1556849062957;
 Thu, 02 May 2019 19:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190103144124.18917-1-stefanha@redhat.com> <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com> <20190426091702.GA2071@stefanha-x1.localdomain>
 <CACPK8Xc5KgiaYCTs=8ceRu_hV=vC3M6pGV0=7jJNsbuz2a6LDA@mail.gmail.com> <20190501162316.GD21155@stefanha-x1.localdomain>
In-Reply-To: <20190501162316.GD21155@stefanha-x1.localdomain>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 May 2019 02:04:11 +0000
Message-ID: <CACPK8Xc-7MOCMDKi=by0DVZrUW2vPL0QVT_G2NTuhi_fvwU1Aw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel argument"
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Jim Mussared <jim@groklearning.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Julia Suvorova <jusual@mail.ru>, QEMU Developers <qemu-devel@nongnu.org>, 
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm <qemu-arm@nongnu.org>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: R6OHyVOwahrh

On Wed, 1 May 2019 at 16:23, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Mon, Apr 29, 2019 at 12:53:48PM +0000, Joel Stanley wrote:
> > On Fri, 26 Apr 2019 at 09:17, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > A user-friendly error message is needed here.  The check for -kernel was
> > > too specific and is not desirable for microbit where we use -device
> > > loader.
> > >
> > > Old boards probably want to continue using -kernel.  New boards like
> > > microbit may use just -device loader.  Perhaps there is even a group
> > > that wants both options.
> >
> > FWIW, I used -kernel exclusively when working on the microbit model.
> > Other users may chose to use the device loader/hex file.
> >
> > I am all for usability, but getting rid of the ability to use -kernel
> > on some machine types would be a step in the wrong direction.
>
> -kernel doesn't support the .hex file format that is most commonly used
> for micro:bit programs.  Are you loading ELFs?

Yes, I am loading ELFs.
