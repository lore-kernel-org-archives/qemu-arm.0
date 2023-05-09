Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2601245ejq;
        Tue, 9 May 2023 03:00:59 -0700 (PDT)
X-Received: by 2002:aa7:c719:0:b0:504:b228:878d with SMTP id i25-20020aa7c719000000b00504b228878dmr11197317edq.25.1683626459776;
        Tue, 09 May 2023 03:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683626459; cv=none;
        d=google.com; s=arc-20160816;
        b=N01CMXxJJso6ecTqfmrniPOuAZ5mSEUx5/rHjJlBlgm8d1Z5zuqD7Fjv3AkAmCe6jl
         iQjbQOVhxkVWNbTJHWbiZxsZGUKK5zZX5A90vzEmQ4Sd10A3JZOPr4tpylAQXkUtq8/E
         ikL/Z9/0QoLqwGGzdEZaciga770vAc8a1MMo7DaOsGNig/BSGvw+kIooKRpxr/NhFih7
         mxWnIHNA/i8JUhj4n6MX6265GaL1S+AUSjRv/VvNJR+9Hoi6kb+WVOhl1fDB0ycxc8VO
         DAvLWQCjCdSReZjvYvLNebyh52VALUbm0+BxSAn6TSH4ZTmy4oSESZUwCb6kUBqn38EX
         QYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0waNw8QfZtGvUnFAHT6nFszZ8Xke2PavESgDWvCj1hE=;
        b=pRKUYQnSDQUsYYemnrEMDSURQFqtdPHn843kknT227Y+6k3DIU4oVmtPPpV3iLNQG6
         xrGVINXea8ZBOO6HKNcfx8HR78p00BZ/6tgUAe8Sn7SouK8ywQO0lPSnkRdd3/c0XvcD
         prjpAm+M+NSAivl6AYKOMFUua2nb495CGyx622aVBPKPuOoWNNComSKe6eOfpNwl2GhX
         IlVnSeumvEPoum67InHdA8brh7EJsn9x1bfBTRRMDkiioGkIqE8lf9bO+jGfUBr0JoeU
         JfX3aeSSei4rdKpjKFHo1OYEJCpXCQb0R8+yLJisavgUqHtyM7NYU4qL/THXBt8DLzc9
         z3xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8bH2cgN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u17-20020a50a411000000b0050bc4e04fddsor608634edb.0.2023.05.09.03.00.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 03:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8bH2cgN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683626459; x=1686218459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0waNw8QfZtGvUnFAHT6nFszZ8Xke2PavESgDWvCj1hE=;
        b=M8bH2cgN3T89nEhZqBFKzLD5ZP1GGUpSpeve9pK8T6xBuHnBSW9UXefPlxu8oXXn+S
         Fc5kV0VGWRxXgKXsKBAiyR77/KXrlNjL66PXx9QidYbRFHgv8VeFAuPTdm6xq/e06JqG
         DjmGsS297VcfKeLsA11NKaenofLIz9utYCVEMkyvyAcdAd8F+pYJurRyy7H/F6C4UiQ6
         P+nUPXrij7D3wwlAbCuyj0DhRhG+rSuoVzWkNxFQmzJZhUDqPS8Uevxu3pDGVEIzbXVm
         0RZ1fc0n5JY+qBQ5IWtyGaTUZQfKtVcIiCW5g7L9odfKpUuHzO6yvlP7cTCcD863+SoN
         QVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683626459; x=1686218459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0waNw8QfZtGvUnFAHT6nFszZ8Xke2PavESgDWvCj1hE=;
        b=Lo2KhjcwNlU68Bo89Qfoh4d90VLDT2FhG6KsHdigmueX3BFc61RJlYQ1SPyqyP8NzN
         m2z0kHE9kHBXALJJgCD656zROiNugdGCNPqrMxidU92j6isqqrtvbQqhqczr9wlWRUI9
         STm0UAhUcJC5PNUQ4T3tz+ctWkdRJ7kCBhX7nQFta2FV0Lo/YJPfhn40jXiEqYcy/MZn
         YGlXq644egCsVaTjBh5KDkjM6qlSdTfAQW6xPd6n0FMZJfEaUQXqR/C6/26tyCdqCcyB
         XcgTVilrLC7llsygMUS1kYB6yQc83cwGxyl6/l6Tuk5ZQZyddv3bc9N4efC62nznpdsQ
         f1IA==
X-Gm-Message-State: AC+VfDy/8ljCl4ou++2CTyBYedcrLx7iEZ0sPRYcTjKNua2jK0owURwb
	BHxsve0v5A/j5Xx9aVpx8eW151rG0f2r9zM1bvWX0CTZ
X-Google-Smtp-Source: ACHHUZ5hqEMKV9p/wUJ4Yv6gIy5d3/cmUVuwNMnKbqIOZbUWHQxO0PvBpk7bEBwMP2jMS6S7SZD2YesuKGgizyZE64E=
X-Received: by 2002:aa7:c7d0:0:b0:50b:c62f:9ff0 with SMTP id
 o16-20020aa7c7d0000000b0050bc62f9ff0mr9977432eds.30.1683626459393; Tue, 09
 May 2023 03:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org> <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com> <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
In-Reply-To: <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 11:00:48 +0100
Message-ID: <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Andrew Jeffery <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal <bleal@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, 
	Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: W2vJzsQNV4UB

On Tue, 9 May 2023 at 10:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/9/23 11:27, Peter Maydell wrote:
> > On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> --without-default-devices is not about choosing to not build
> >> some devices; it is about making non-selected devices opt-in
> >> rather than opt-out.
> >
> > Hmm, so it's basically "the person doing the configuration needs
> > to know what they're doing, the Kconfig system will give them
> > no hints about what devices might or might not be needed to
> > make machine type M functional" ?
>
> It depends on what you mean by functional.  I would say you do get what
> is needed to have a functional machine, but not what is needed to have a
> useful machine.

If you need to pass '-nodefaults' to get the thing to start up at
all, that seems to be stretching the definition of "functional"
to me.

thanks
-- PMM
