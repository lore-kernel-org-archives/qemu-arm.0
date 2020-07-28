Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp432456lfy;
        Tue, 28 Jul 2020 02:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg+//TwGOgR8Ktl9AuhNatBYTTf3dARpU6O4PnBwoULJQBVgDSKj5yyLrXhWpgUGALSlvi
X-Received: by 2002:a25:dd84:: with SMTP id u126mr45900761ybg.269.1595929758347;
        Tue, 28 Jul 2020 02:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595929758; cv=none;
        d=google.com; s=arc-20160816;
        b=rxo4+xBxSD5OO78mfgV2L9iVcGYLPMrrfeqoAZwFsJYaniB+Tpo1yw5w20wScTL/Mt
         YI+T4YkftC9kWfIL3/Th/PsLecs5npI8MR+WkvbO4J+dz4GF0MIHYt238Y32hmjs2+ln
         qD0EiCxTqQQps7GRdih2O/uKQCxPr65dLWZHT6VE7WQFHxUmxveuSbP3Z8iyaTAtgGFQ
         X4VCNB0RLHPAq+0ZHnmtdW1ALVXDRDdJqsLOQKPQIZzKRI4hfXvw0wNVws/WyxUuJc9S
         9DKoPgYZ7OlCrP3xfd2Ru3U4YI5gWSlLYsJnnqgl6GCaM8FId9ER/9t2yKDkcQJLHL1Y
         gdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TdyyyqywWUMdnHNVZWGjksiBBFcyc3F5QM+a5cnsI6M=;
        b=gsF1MXkm309r6ko/x4lGh0kpX1t1SIwP+qzMAXE2NugfENkx32O7+hrxAcNr6rb79y
         Tu0wi9roi2bg34b2bj6DdrkWHLdoICfQKriafh4eB7drkm12xUC6ONxEm+c1alesOEyp
         GapdIU8ZXy1PSy6d0FIBrZD9XwCbvZlZOLzDFDWyIwKNZYz7vbMpzPteTzEg4Nf+s8wD
         LSwE+qjfejrOR/SPmQ01eeB6KJmBJitcKi+zKFbnkKXAxhkH9PyTvM4N+Ff2nbo6mfLp
         roi9SPkX5Td1F1YSCBNx5vrDnl7geqojH4l78d1FQgDqKKfLZspgR/uNjt0mDVTuFxR6
         x10Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZcmuQz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si12716667ybm.274.2020.07.28.02.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 02:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZcmuQz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0MEX-0006mI-Pe
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 05:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MEQ-0006l0-TU
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 05:49:10 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:41710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MEP-00047F-1U
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 05:49:10 -0400
Received: by mail-oo1-xc42.google.com with SMTP id z23so3697558ood.8
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TdyyyqywWUMdnHNVZWGjksiBBFcyc3F5QM+a5cnsI6M=;
 b=CZcmuQz0+fChzJYgANcCMKOFWNVO3nbzqpsuahJiXsM/laZXIVdLxMRAHt4npoyRCl
 70G3mD52PI70p0JWv0qRLs8sRNY6sA4RyQWGw0MhGSduBQkCTvCGR1jNVR9bi0lH5ybf
 Evlj0B7Upx7JgYHHY58hGzlQsFFUm3zQDtIkvPv/D7MBcmSNVl2fyfmzl/Gd7vstKUNC
 +Q6IlTvmK7gSlUG/vvNFgj3BYV4Qi54EAJFd1o5lKGeBn9brO4CCmePhvSA0P6cG2H3w
 AdS7niyV6lK1U7v/HaBiz2L7Nt4FroG0yuyFvZ0kWuIOOyQABdSk5N4wb458V5r3HnkS
 7XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdyyyqywWUMdnHNVZWGjksiBBFcyc3F5QM+a5cnsI6M=;
 b=lUHK8064XaCmL6raoPYJN0httoza+/CAlH7OQKbxJn7zQIWgdgFcs2DL/9zNGLBb6o
 zwZnkv1GAtWcm5hufJk+xlvoSyvxAg7r0T7nJSxDlO4dBCPXyXhHH9m4htwchJllq8iz
 FBG09uk4NhOYssEEcUp1oqkMLPav98uV1b3pLitlm2Lx+mCqlFKqTsrufKMluk1jd6ZI
 3NuVcCkoEhVl1rYpczj99IBzdPVWHauiSfPRRUMXLxY+KoJuCKsCJTl5GkNeCFqrRMab
 sVAx4icKWRemRYjO42QMnJOTOPgctx7u4MlwIIJrE1Yc6QOYDn9GpiXsBNJQwfNVoJAz
 et0A==
X-Gm-Message-State: AOAM532NgEzukcUUfYh8atSzditxwe2MdS7dQpKh55DSYzE6YKT8YDOZ
 ZtUmV1nRhW+RWopM1zqmicajLJqPifMW9Oan50e9pg==
X-Received: by 2002:a4a:4c44:: with SMTP id a65mr16107989oob.20.1595929747785; 
 Tue, 28 Jul 2020 02:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200727130225.32640-1-zhukeqian1@huawei.com>
 <CAFEAcA9vQMP0YLAuzdPW2m3RcRNySxA0gJQZmeXBUYRy4=Dk+w@mail.gmail.com>
 <92e8dc9b-deed-afb8-89ae-f50b68bbafa8@redhat.com>
In-Reply-To: <92e8dc9b-deed-afb8-89ae-f50b68bbafa8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 10:48:56 +0100
Message-ID: <CAFEAcA8myew9LM=ARwSwJybzWQu5=uOn55VrF=SX2xZr=bkRFA@mail.gmail.com>
Subject: Re: [PATCH] bugfix: irq: Avoid covering object refcount of qemu_irq
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, yezengruan@huawei.com,
 qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vdh+7b1pUFBN

On Tue, 28 Jul 2020 at 09:48, Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/07/2020 16.41, Peter Maydell wrote:
> > On Mon, 27 Jul 2020 at 14:03, Keqian Zhu <zhukeqian1@huawei.com> wrote:
> >>
> >> Avoid covering object refcount of qemu_irq, otherwise it may causes
> >> memory leak.
> >>
> >> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> ---
> >>  hw/core/irq.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/core/irq.c b/hw/core/irq.c
> >> index fb3045b912..59af4dfc74 100644
> >> --- a/hw/core/irq.c
> >> +++ b/hw/core/irq.c
> >> @@ -125,7 +125,9 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
> >>      int i;
> >>      qemu_irq *old_irqs = qemu_allocate_irqs(NULL, NULL, n);
> >>      for (i = 0; i < n; i++) {
> >> -        *old_irqs[i] = *gpio_in[i];
> >> +        old_irqs[i]->handler = gpio_in[i]->handler;
> >> +        old_irqs[i]->opaque = gpio_in[i]->opaque;
> >> +
> >>          gpio_in[i]->handler = handler;
> >>          gpio_in[i]->opaque = &old_irqs[i];
> >>      }
> >
> > This function is leaky by design, because it doesn't do anything
> > with the old_irqs array and there's no function for un-intercepting
> > the IRQs (which would need to free that memory). This is not ideal
> > but OK because it's only used in the test suite.
>
> I think this could better be done without calling qemu_allocate_irqs():
> Simply call qemu_allocate_irq() (without "s" at the end) within the
> for-loop for each irq instead. What do you think?

Well, what are we trying to do with the function? I think that
your suggestion still doesn't really fix the leak in the sense
that there's no mechanism for undoing the operation and freeing
the memory allocated by qemu_allocate_irq(). The whole concept
of the function is pretty dubious because it's arbitrarily
re-plugging IRQs, which in the whole of the rest of QEMU are
assumed to be something that's wired up by board code or by
an SoC device that "owns" the two devices it's connecting.
That's fine for test-case purposes, and for the qtest code that
is the only in-tree user of this function we could construct a
(nominally) leak-free version of the function by having it return
some kind of handle that could be passed to a
qemu_irq_remove_intercept_in() to clean up [this would fix a
Coverity nag, which would be the main benefit...].

I agree that copying the refcount here looks wrong, but in
what situation is the refcount on any of the qemu_irqs
involved changing anyway?

For non-testing uses of this function it gets trickier (what if the
device on one end or the other is destroyed while the intercept is
in place, for instance?) So I'm a bit sceptical of ideas about
extending the uses of this function to non-test-code, and I think
I'd want to see what the intended non-test uses were...

thanks
-- PMM
