Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3473196wrh;
        Mon, 29 Apr 2019 05:54:00 -0700 (PDT)
X-Received: by 2002:a37:5ac4:: with SMTP id o187mr46909542qkb.356.1556542440567;
        Mon, 29 Apr 2019 05:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556542440; cv=none;
        d=google.com; s=arc-20160816;
        b=tlygz1VuVWqvC59cVaFg+K2WxwhB0zGB4WkJuHhrRcU9MC2iUdGm45PCYlNNpX9v3E
         zR6X4bfXh7tjKlSa5Ui7ahWpbtWeNZc1r2mss+bjM3i8rjU00eoT5yv08vLTSpL59un8
         /TXkaokJHutLzCtoF9ezstLtzez/oXYrVfKeaQMiStCrTIw74TWJ/mGgGjz72xkT8Rox
         cnpji/q7s5qu8NihA/RuJ/J3BRz8l0nBJR4zzCJ2t39labTIH/5Q+rxAu07GeCrqLdzv
         gN9W3WAt9Og47v0ulR55YNLH+jmkfZwuNwm4P6IPbklG+GN0P7LaH4mv4u5mZvoeGuUy
         aQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lB18pEzl0Tg8zg65WCwpHy2hjsy9JyOMljdQvpZbb/c=;
        b=KTM5iVyTz5JBeASg1FEjuhO5fibtt5Q72SU8Ibn/SKjiYU4HneZo40t4IiC8YRGVrB
         QVZB/+YDTSqsheMAEP98Ulg3cNfqlhXOLroQyuRe7pXlc0JUEmdf8Nd3sIXqqc54xEXQ
         0FEic6RTgE90eVK8WdTTuTG+6v+zs3Y1m9ZtUnyygQ1xjPYq+u8i2Gm/lDv9lkl4Xumo
         9bFcLMKADei47obMFpU2AmPA72L1o5IsidleP9kwybZ/zqDfl8+MNiCXGX4HCbKG+cZE
         N3AZ2vzuziEa2sSesnbDiTUzVZBVul4/q4AmDOA7zu5ItfUbdQ3xcgIwTIRVTtLgyqY8
         C5rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=jrCA7bbs;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i19sor45208059qtr.49.2019.04.29.05.54.00
        (Google Transport Security);
        Mon, 29 Apr 2019 05:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=jrCA7bbs;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lB18pEzl0Tg8zg65WCwpHy2hjsy9JyOMljdQvpZbb/c=;
        b=jrCA7bbsAL7pN2qn11KNcCfFC5kSUIyyFUFEIGjuSO/ANYSc/URbbDmvvemEJPVZF7
         kaiuYUoMD/f8VBTyooJT1QMylzeG5w971hR9IY5CKfOeQF9rBbvyNrnEq+BHTHpIZDCZ
         4FxRGYh/+0m/ZUGDuybf8k6HI/tT7V+Ld6Ukg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lB18pEzl0Tg8zg65WCwpHy2hjsy9JyOMljdQvpZbb/c=;
        b=XKsWHztBXYq7tLJbAZ9eFOlOYqEv5IA8+bOzGJIQIbTLUrOOEKe0He4iWJD3krf4ge
         gKP89h4iBRB5pJbi1lOGFROrKaVZfrLmh2sy4zCSRLjOJOy7OzcsPEKUybLyILufkqCi
         J+KNVcCXwxJAT8yvxKa71wpkTI/FGwS376x4McQOHfefpFMghONFJ3la+B2GMl5Vd3w0
         oiRp31ZQzra+18zTS6oHfwMe+b9/p55+ezGuiwuWiYlxX1cfOPVqS/Lp4KdJJ58uR01O
         JS9dmEpQR26eIyfSJwznf0i7Nl4YL/VsW0Bo/ZFUmIVgxKG33fujpvEGVI7zXNlvfn71
         IQkg==
X-Gm-Message-State: APjAAAXi7NrYF+aWKYSUgE0GZB1gbxNsYeEQnP8zpMCfLqWQnzh8rd1N
	55q9ubFywR4ux6IYu64pNDepc+AQ/iGPk/krT8U=
X-Google-Smtp-Source: APXvYqzEhJhjTKUMWByG/CtGyr2sIsU7aUNGY0W++RiIfDr3GdmLeSXbvwmCsngkwuGmleZExNAt5qwzA+603zeHUK4=
X-Received: by 2002:ac8:169b:: with SMTP id r27mr34536234qtj.235.1556542439964;
 Mon, 29 Apr 2019 05:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190103144124.18917-1-stefanha@redhat.com> <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com> <20190426091702.GA2071@stefanha-x1.localdomain>
In-Reply-To: <20190426091702.GA2071@stefanha-x1.localdomain>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 12:53:48 +0000
Message-ID: <CACPK8Xc5KgiaYCTs=8ceRu_hV=vC3M6pGV0=7jJNsbuz2a6LDA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel argument"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Jim Mussared <jim@groklearning.com>, 
	Julia Suvorova <jusual@mail.ru>, QEMU Developers <qemu-devel@nongnu.org>, 
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: nR7lkjtUgSB6

On Fri, 26 Apr 2019 at 09:17, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> A user-friendly error message is needed here.  The check for -kernel was
> too specific and is not desirable for microbit where we use -device
> loader.
>
> Old boards probably want to continue using -kernel.  New boards like
> microbit may use just -device loader.  Perhaps there is even a group
> that wants both options.

FWIW, I used -kernel exclusively when working on the microbit model.
Other users may chose to use the device loader/hex file.

I am all for usability, but getting rid of the ability to use -kernel
on some machine types would be a step in the wrong direction.

Cheers,

Joel

>
> A solution is to introduce explicit checks so that we can tell the user
> the appropriate option for the machine type.  I can work on this if you
> like, but probably won't be able to send a patch until Tuesday.
>
> Stefan
