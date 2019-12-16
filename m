Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4432497lff;
        Mon, 16 Dec 2019 03:46:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3pH4euoAa+a5wjseKgetsDqLsPij9loEAMLgXBRLh12bOsjLPjdGwgJjDRjr5A3o/lpIK
X-Received: by 2002:a9d:7cd9:: with SMTP id r25mr29503073otn.326.1576496809714;
        Mon, 16 Dec 2019 03:46:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576496809; cv=none;
        d=google.com; s=arc-20160816;
        b=HB2l2g31v8lfe/6unBFnJaVtlWUxssS3D+CvsMQw67AmXy6jMzCOoDbsP2igqx+ho5
         8BMfnVKe9/5nxuUdz7cl8RZ42cTpFZYfs2AQCrWcqfRPg5k0VCLliSGhDnt/D2l7ntjq
         pwvBMacNbeyfKAxKE2d0uM+ccGEPyIurL63W7k12XfoDSssAvLauok1/leltCFQ+AIxn
         ge06m+tJMNdaoauDXYGi9hgYrU8pkcDVOMRoPc33m0SC0WWF6TKKlTx3gw6OXAc2absN
         KS6uIVQOlOfVjwNY6zxjpmewpDVQrC3lqbCnjaMrOV7YVSZ6TesLETF1uO/gQf5MDDON
         21Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8I5trJBGTW4luMb11Ffwe+Tyg+F3aLb9Oz/+hKtjAZQ=;
        b=T964AwMCj82wcju3Taoalde2bPTnUCfEfEg0dqaEQkgRswHp8CSu7MPvaX/YOVTt3T
         42RRgg9ZLq5FfKezo17XPdfp61caDvBxbwrcR6XvgiE78mTK2iuRxbkpM8mF1rlEvqJ9
         ua6QRrcC+iyVc74QazkQyHBpbYsGsLReuj6FMRE9fS4i8t9ISwQ+dhMdDdZrplRUNdoG
         MfYlq5qUAw1E/QYWvirTzjpcb+2ZjmAs1UHAXFOEHheHtwnVIVGAbnA0O9CZMoSvlhB9
         jgAd/yjeUPEuOgZYgxyv0nrLHOXBjquXbc0crKKtOuDsPRzDKR9dM/W9XaD9y6SYD6qF
         i4Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yfj+MJhP;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i13si9705554otc.228.2019.12.16.03.46.49;
        Mon, 16 Dec 2019 03:46:49 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yfj+MJhP;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfLPLqs (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 06:46:48 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41693 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfLPLqs (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 06:46:48 -0500
Received: by mail-ot1-f66.google.com with SMTP id r27so8843542otc.8
        for <kvm@vger.kernel.org>; Mon, 16 Dec 2019 03:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8I5trJBGTW4luMb11Ffwe+Tyg+F3aLb9Oz/+hKtjAZQ=;
        b=yfj+MJhPaUOx7sxyWSVqpAJ3fhdorMc3yaCPiBcoJGHf3s50+RFX6CsD4btsF+xSNc
         epRtGKgGbnJcYr0b+57Psp8tbjWI91A+UwqXMW8IC/oT7eShtLBIxYb7eKq1wMyKwPQ7
         hDHK3B767lDJVvofvKZem/Aqt3PKjOSZNDB1JlLc4zYu+HdTtUx0gF31MlGxOPJ7M7ha
         Z+iDvgWzgkUF498+wFV8G9EUAcZ6xu5vn/w+H8bCbsk1CeEoLt0xYd/DPhZEXGjqxCMF
         oLZb9t8B63ZeKqB1WI752r0JJh7BkK5f9q4W1HbKLXetzOwI8GmThU55YSrFU9rPVH+/
         2aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8I5trJBGTW4luMb11Ffwe+Tyg+F3aLb9Oz/+hKtjAZQ=;
        b=apt0/bz/+n9WJBC7j2oZFxobVaVoWXi0lV0Yn1IA5j+x1i+ilPRVfV9DwfdfeXM/X3
         ToabQpyKi0KdjkptrrpmGnk9SqFHZ5G6KGNsRfWbJ1zJAcytM1mEsuO83yZeVV06Ws5i
         3TRrzK2J6DuksEtGXqex4sm/Zxa/7FrX5iYHmyNIHFBDcgpgPW0OiFTmUQOdqT8fyBqS
         8sxNTo6IbRgILvr0lY2i/Hexxo5JxebgptOAo9o1a+dNkFOY/Kmo9MLuRfsXTK0w8ttB
         CGgnHPRlj2EVK/MEG91icIlrSX+n3ip8k+1AzyrbepGKbRrXVyGtoZQeRy/yRFpbLFqu
         yrmQ==
X-Gm-Message-State: APjAAAWwJEYZ7ooJOQ0t/iWryVunI2TzShlQ4ezR7jKJjM1waphZ8AqD
        rP0JzRzVzQbdAjpyRAwSO6gi6Rib/J2xwrISFC/8Ew==
X-Received: by 2002:a05:6830:13d3:: with SMTP id e19mr31703782otq.135.1576496807419;
 Mon, 16 Dec 2019 03:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20191214155614.19004-1-philmd@redhat.com> <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
 <20191215044759-mutt-send-email-mst@kernel.org> <CAFEAcA9ZF3VTR7kG_D-cJ+vPFTgd8zjmt2VPfJC7urNemF-5AQ@mail.gmail.com>
 <20191216063529-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191216063529-mutt-send-email-mst@kernel.org>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 16 Dec 2019 11:46:35 +0000
Message-ID: <CAFEAcA8RLOOT+0Bad4PfU0Jubp9MDOTTt1rHBQYABAfd9oMRLw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Simplify memory_region_add_subregion_overlap(..., priority=0)
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        kvm-devel <kvm@vger.kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1J+ai1cmty2h

On Mon, 16 Dec 2019 at 11:40, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Dec 15, 2019 at 03:27:12PM +0000, Peter Maydell wrote:
> > On Sun, 15 Dec 2019 at 09:51, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sat, Dec 14, 2019 at 04:28:08PM +0000, Peter Maydell wrote:
> > > > (It doesn't actually assert that it doesn't
> > > > overlap because we have some legacy uses, notably
> > > > in the x86 PC machines, which do overlap without using
> > > > the right function, which we've never tried to tidy up.)
> > >
> > > It's not exactly legacy uses.
> > >
> > > To be more exact, the way the non overlap versions
> > > are *used* is to mean "I don't care what happens when they overlap"
> > > as opposed to "will never overlap".
> >
> > Almost all of the use of the non-overlap versions is
> > for "these are never going to overlap" -- devices or ram at
> > fixed addresses in the address space that can't
> > ever be mapped over by anything else. If you want
> > "can overlap but I don't care which one wins" then
> > that would be more clearly expressed by using the _overlap()
> > version but just giving everything that can overlap there
> > the same priority.
>
> Problem is device doesn't always know whether something can overlap it.
> Imagine device A at a fixed address.
> Guest can program device B to overlap the fixed address.
> How is device A supposed to know this can happen?

That's why (the original intention was) only one of the
regions needs to be marked 'overlap OK', not both.

thanks
-- PMM
