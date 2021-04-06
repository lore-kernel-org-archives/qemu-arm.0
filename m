Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1598701lfr;
        Tue, 6 Apr 2021 08:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5+wGGw7kkSQamJPD/6DGQAOYjFAlGjwQDcIP6M4+IhJQJ3wR+5an+MSQXsr137Ph+yshb
X-Received: by 2002:a5e:980e:: with SMTP id s14mr25011474ioj.63.1617724554142;
        Tue, 06 Apr 2021 08:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617724554; cv=none;
        d=google.com; s=arc-20160816;
        b=CM19f6UksBRCynn6XcArOlbWkZwj2GXRghugs9j9P86dwj/06WI2JOVvOYNAwyPQ+x
         zvsTKfydopXOUfLmZAalWwnPM/eG5r1FkgLm5Dud8DAsISqoUN/EtJpVRyxpU4j/GvcL
         p0t/LOrpjYWmDveSFdinzn3ERQiDkotIqsw+sl6iwBcrJM5p58ollyorJl0BH+3Jhj8X
         wo/Tfb9CvvmWnqXlR2csw1SWUDIEhMenpbmUVlqaTJUe8szUsuW4nNTurHvxHWgjoTyP
         oirqqPN6CMgVrJH/wLgZrTSiyZ89EpMnaQkuZaMqDUsOWTUWqlYyltafhHagfASd75ZO
         kBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/kJjfFyy+TViyLsITNqhXdvX+WwoV8Nmp32W10Ldurg=;
        b=SRFEDu6srafiiIn3Ziq4RSCnussstU0kFP0tcWfhNtKCS77Kwc/gaHxS8uRv+4UB3C
         cdYEU8BHcS+cRjwfN2+ifwnOxijMC9ajBz1j/aTZXAp2+cQwud6hTI1+H87BtAv/GYHh
         l41eV0dwY20mMJFLiRng3pBS5mSI9aFzUoiCSUjcfoUSP5WdC+Bs8Cc0GjpNLOAarvLR
         X2yblA/ntMyHr+zhdskk/W3MAoGXcC38y48hweTb4QjTddPJNrfnYPhuAwB3v01d629q
         wsLWZJPU0shbDWfpCexMrXvUY9CRzFY9zJ0f7SDtte1qXYDHn4Mm3saPLGqEYbPrIjqz
         ed9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=qstyIVdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si19284714ila.124.2021.04.06.08.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 08:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=qstyIVdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTo3V-0001Pt-Ai
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 11:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTo3H-0001MA-SQ
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 11:55:41 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTo35-0004yI-2T
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 11:55:36 -0400
Received: by mail-qt1-x830.google.com with SMTP id y12so11489728qtx.11
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/kJjfFyy+TViyLsITNqhXdvX+WwoV8Nmp32W10Ldurg=;
 b=qstyIVdREm4lYZvH6wM8lG3ISiIwQnzg2SRDGcqYJEQr8D2S4bfP03KdeE0Yk3abvx
 4JER222FlhzKZMd4ZrXa2f2eLrOVyxsorGogL64K02XNLty0CqAUDgVEq8a6n9+R6YDe
 eQ+7qVRXII2EHhpFGwHwYAvdzoai+qHC0PPK58o0WaYxMrmaN9vBiGNuwQstGHA7mQpU
 fw1i2zSHgESSEFx7ZW/FM0PvOtXy9eI0z2VbNdMv0tVnAZe3+YYsTO1i3QIw+q/Yzn8N
 FpUwfZ9AmIvi47S4Nb4Mekn6W9YJexfyzvUNz155QTeiDv5iPmE1MqjImhbCfSiPg8It
 rRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/kJjfFyy+TViyLsITNqhXdvX+WwoV8Nmp32W10Ldurg=;
 b=kyeeRmIRXfgSTxt8nDLQZpQG0IBbw5s2S/H4jh7Nfn3G+64I+kbGtHo4nlzV6ye0yZ
 1IrLZnD21yjMs6tub5xeurW5PeN/5+W4SHp18GbmiAIZa1pPJcluVATiwNfB/4zuq9Qo
 qx7IPABjdY7OUv4XFB5HuV6rQbyKTNLQuEwzROTjCHvowCtwZwnWtV9/0/xYgyRdREMc
 98wvXZxMS1WWXqA8Wgun172H+DVlLHBKTefMa793Lf29k0IKlS1NbwspScFaod6lRxWe
 vSn+UbZKo23AgZ57QPmZhE3rfxHjVSkzS8/wq91cJhGfCR+qVXSk4iG8NUcphjYGP4Lb
 EiZQ==
X-Gm-Message-State: AOAM531RfJBAi97Mt5B3IV3Ct9kKVRLdDqPT0sN6sXXqSKyqqEyx0uOg
 3U5xebDuoctKwyzbFIjK5QitCsvm0d6ehQpK9y5jEg==
X-Received: by 2002:ac8:5451:: with SMTP id d17mr27875379qtq.193.1617724525650; 
 Tue, 06 Apr 2021 08:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210403222810.3481372-1-venture@google.com>
 <20210405195834.GF7167@minyard.net>
 <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
In-Reply-To: <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 6 Apr 2021 08:55:14 -0700
Message-ID: <CAO=notyrcWX59UqVP4=jueUvenx9b4NiTzk-wifa1s7wPypJsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
To: cminyard@mvista.com
Cc: Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=venture@google.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BO1I9iBpOiW9

On Tue, Apr 6, 2021 at 8:41 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Apr 5, 2021 at 12:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> >
> > On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> > > The i2c mux device pca954x implements two devices:
> > >  - the pca9546 and pca9548.
> > >
> > > Patrick Venture (2):
> > >   hw/i2c/core: add reachable state boolean
> > >   hw/i2c: add pca954x i2c-mux switch
> >
> > Looking this over, the code looks good, but I have a few general
> > questions:
> >
> > * Can you register the same slave address on different channels?  That's
> >   something you could do with real hardware and might be required at
> >   some time.  It looks like to me that you can't with this patch set,
> >   but maybe I'm missing something.
>
> If I understand the hardware's implementation properly you can have
> collisions, and this allows for collisions.  I'm not sure what you
> mean by having both accessible.  For instance, on hardware you can
> have a switch with N channels, and on two of the channels there is an
> eeprom at 50.  But you're unable to talk to both eeproms at the same
> time, because the addresses collide -- so how would the hardware know
> which you're talking to?  My understanding of the behavior in this
> collision case is that it just talks to the first one that responds
> and can lead to unexpected things.
>
> There is a board, the quanta-q71l where we had to set the
> idle-disconnect because there were two muxes on the same bus, with
> conflicting addresses, and so we had to use idle disconnect explicitly
> to make the software happy talking to the hardware -- not ideal as
> having two devices behind different channels, but ultimately it's the
> same idea because the devices are conflicting.
>
> >
> > * Can you add devices to the secondary I2C busses on the mux using the
> >   standard QEMU device model, or is the function call required?
>
> I added the function call because I didn't see a clean way to bridge
> the issue as well as, the quasi-arbitrary bus numbering used by the
> kernel isn't how the hardware truly behaves, and my goal was to
> implement closer to the hardware.  I thought about adding an I2cBus to
> the device and then you'd be able to access it, but wasn't sure of a
> nice clean way to plumb that through -- I considered adding/removing
> devices from the parent i2c bus instead of the boolean reachable, but
> that seemed way less clean - although do-able.
>
> >
> > I ask because I did a pca9540 and pca9541 device, but I've never
> > submitted it because I didn't think it would ever be needed.  It takes a
> > different tack on the problem; it creates the secondary busses as
> > standard QEMU I2C busses and bridges them.  You can see it at
> >
> >    github.com:cminyard/qemu.git master-i2c-rebase
> >
>
> I'll have to take a look at your approach, but the idea that it
> wouldn't be needed sounds bizarre to me as nearly all BMC-based qemu
> boards leverage i2c muxes to handle their PCIe slot i2c routing.
>
> > If you design can do the things I ask, then it's better.  If not, then
> > I'm not sure.

Corey,

looking at your design, I should be able to do something similar with
a small tweak.

I think my design follows the hardware where there can be conflicts,
etc, but what I didn't know how to do was add the faux I2cBuses in a
useful way -- but if I add the I2cBuses to the device, and then on
add/remove it registers the device on the parent bus -- i can still
use the reachable boolean to control whether it's present.  The faux
I2cBuses would be a simplification for adding/removing i2c devices --
and would act as the device list in my object.  So then setting the
channels would change to walking the devices held by the bus that
corresponds with the bit -- but _still_ using the reachable boolean.

If you'd like, I can update my patchset to use an i2cbus for the
purpose above, then it would satisfy the requirement of leveraging the
normal device process and no longer require the special function call.

Patrick

> >
> > -corey
> >
> > >
> > >  MAINTAINERS                      |   6 +
> > >  hw/i2c/Kconfig                   |   4 +
> > >  hw/i2c/core.c                    |   6 +
> > >  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
> > >  hw/i2c/meson.build               |   1 +
> > >  hw/i2c/trace-events              |   5 +
> > >  include/hw/i2c/i2c.h             |   3 +
> > >  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
> > >  8 files changed, 267 insertions(+)
> > >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> > >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> > >
> > > --
> > > 2.31.0.208.g409f899ff0-goog
> > >
