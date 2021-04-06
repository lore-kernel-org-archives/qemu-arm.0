Received: by 2002:a0c:9b97:0:0:0:0:0 with SMTP id o23csp155678qve;
        Tue, 6 Apr 2021 11:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVOdRMwt7EAsfbv1qQmNQpG8o7KsQ22jQkOmSTQ2SRp25QY79akTwKom7BP51eWNTb8dKL
X-Received: by 2002:a05:6e02:1a4e:: with SMTP id u14mr4020712ilv.304.1617734179504;
        Tue, 06 Apr 2021 11:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617734179; cv=none;
        d=google.com; s=arc-20160816;
        b=kgGfqk6PXVLINDuZRgznrFp+LlQ3ZugKNkX/Yl/n4uz6b1CA3hpD15n8Ti+g9gs/qD
         wGl15ZYnvhlHoJEOOxNxb6DVP5KKfo1YKsL3hpgasubyyYNOAbdGFLOk2P4hAFnRDtFp
         dVyFUvPrFWAlfkU2YqBURDO9H2TkwMNYLyOBsy7oXSZfdFKXCN9yj6gdfb35tKJtv//3
         0l4GaCeo2WiEU9wX/xW7bhCZ1TtzYUxmEfbH3hfGf7yGXDUL5Zs5VnNhrN9lNEnDo5Az
         EycsF4W3n3xOClpMw/94jApO5hgwoBwq3CnXIWi4o0SIrUKgtSRwHkfURrpawAYdWR0X
         0vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=3IS0GqaJSzAj4m16iIli26RhfNK+rV7qKAAnWkRlDcg=;
        b=KHb7aoi5G/B++g/NX1HYjwbpEILXE3b8HFYQK58y+dUfyFas0TYa2W4jYXdg0sPfnR
         4cjPAsJQQ/wQdR3zlGcguf7cL1GNJfQgOw6XsGLStOfo8aZ8klMfJ4hEWxz3xKORHUk8
         uAquRMWKf2Q6GCuoez51A5Vqy/mIIaNycG5dw/gBOS+oZYSTw6piQdETqPBw45NPZkiR
         OdZQV8Y2KF6EjXnX0F5gMt/bHZjtAAN0Kwz82b/geiXOIM/A0v7/Vz8qEgVoFSAslnw7
         UHj0enBiGBMp7ipGsIul/YGpisOjMJuPwLB1A+niN5fltzh8JNzCLOpYQ1/43XVZBFsB
         xKPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XKIKaiWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si17206050ilu.55.2021.04.06.11.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 11:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XKIKaiWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTqYk-0007Ao-TS
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 14:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lTqYb-00077v-8f; Tue, 06 Apr 2021 14:36:09 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lTqYY-00039w-7Z; Tue, 06 Apr 2021 14:36:08 -0400
Received: by mail-oi1-x230.google.com with SMTP id x2so16141526oiv.2;
 Tue, 06 Apr 2021 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3IS0GqaJSzAj4m16iIli26RhfNK+rV7qKAAnWkRlDcg=;
 b=XKIKaiWSQaD1P3OVmCV5wYhk11BvrURT62OMWW4tCFc6dE9VIJexBF/Lqq3ZSdEYs/
 Tzuo2OcAfBri6eREkjiCn1T2MovDpTHO/DhTDlbLBIskHAygtJhk978jt1bgVqo/6CSJ
 E8dEDj3nYd49E7KRyohCQeZULsbtrCGZQOAS8yeMHwDNZ3QQ7wZzpaF5SJyqhO/v1aNG
 l6IsdSRyMZI68C5wcGca78XCz0xonRpcBKtZb61iW+hrHcTfTbLxrbiTbJjblb2mt/6a
 o7u592B0OkcVUncpMZfacsbWOvIKMF+hb42yYFC2d4U2DMNj4cCvvsWmyUO07QF7UcY9
 wkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=3IS0GqaJSzAj4m16iIli26RhfNK+rV7qKAAnWkRlDcg=;
 b=kKndriqicYjeG8TLaS+1DLLobkgnti270mwjrd8BxHS+BjaZgiLTabD5hR6B/Lm+Os
 p+WdcbeHZiNL7mwm2MGrB3rdolUR4sdSwUAV53ZiCJliexuPIYGg+/rbIWP9ScPYebJ9
 arWPupF8u7M2K87XxkWNxZHqtSIkNk5aKcFBfOy3VFzxAaz8NPx9TzkVJmapJFxZlyzl
 piWgBcoqoV82pEUDfvSO+esrh1hoPCb9baDy+u918JfZ+vl8K0/MUtStIRv/iQsuQzU2
 3zK1E2JcwW9tujWqwD0AL7TVvdnbu6frKARslYOc+MOrU1SNNfzq9fS7bnjAL/28d7Ei
 7I+g==
X-Gm-Message-State: AOAM530lLTLvNo9n0VdfTg3oQTDaesdJogvXXml8kbWG9SOuhIxQ+jOw
 UyCClIvNjC8izKh3fxoT7Q==
X-Received: by 2002:aca:1a19:: with SMTP id a25mr4249475oia.167.1617734164307; 
 Tue, 06 Apr 2021 11:36:04 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id a128sm3845275oib.7.2021.04.06.11.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 11:36:03 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:f584:ff80:e7e9:e850])
 by serve.minyard.net (Postfix) with ESMTPSA id D00FE180052;
 Tue,  6 Apr 2021 18:36:02 +0000 (UTC)
Date: Tue, 6 Apr 2021 13:36:01 -0500
From: Corey Minyard <minyard@acm.org>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210406183601.GB7166@minyard.net>
References: <20210403222810.3481372-1-venture@google.com>
 <20210405195834.GF7167@minyard.net>
 <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
 <CAO=notyrcWX59UqVP4=jueUvenx9b4NiTzk-wifa1s7wPypJsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notyrcWX59UqVP4=jueUvenx9b4NiTzk-wifa1s7wPypJsQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Hao Wu <wuhaotsh@google.com>, cminyard@mvista.com, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jvy8aCkWj6TA

On Tue, Apr 06, 2021 at 08:55:14AM -0700, Patrick Venture wrote:
> On Tue, Apr 6, 2021 at 8:41 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Apr 5, 2021 at 12:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> > >
> > > On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> > > > The i2c mux device pca954x implements two devices:
> > > >  - the pca9546 and pca9548.
> > > >
> > > > Patrick Venture (2):
> > > >   hw/i2c/core: add reachable state boolean
> > > >   hw/i2c: add pca954x i2c-mux switch
> > >
> > > Looking this over, the code looks good, but I have a few general
> > > questions:
> > >
> > > * Can you register the same slave address on different channels?  That's
> > >   something you could do with real hardware and might be required at
> > >   some time.  It looks like to me that you can't with this patch set,
> > >   but maybe I'm missing something.
> >
> > If I understand the hardware's implementation properly you can have
> > collisions, and this allows for collisions.  I'm not sure what you
> > mean by having both accessible.  For instance, on hardware you can
> > have a switch with N channels, and on two of the channels there is an
> > eeprom at 50.  But you're unable to talk to both eeproms at the same
> > time, because the addresses collide -- so how would the hardware know
> > which you're talking to?  My understanding of the behavior in this
> > collision case is that it just talks to the first one that responds
> > and can lead to unexpected things.
> >
> > There is a board, the quanta-q71l where we had to set the
> > idle-disconnect because there were two muxes on the same bus, with
> > conflicting addresses, and so we had to use idle disconnect explicitly
> > to make the software happy talking to the hardware -- not ideal as
> > having two devices behind different channels, but ultimately it's the
> > same idea because the devices are conflicting.
> >
> > >
> > > * Can you add devices to the secondary I2C busses on the mux using the
> > >   standard QEMU device model, or is the function call required?
> >
> > I added the function call because I didn't see a clean way to bridge
> > the issue as well as, the quasi-arbitrary bus numbering used by the
> > kernel isn't how the hardware truly behaves, and my goal was to
> > implement closer to the hardware.  I thought about adding an I2cBus to
> > the device and then you'd be able to access it, but wasn't sure of a
> > nice clean way to plumb that through -- I considered adding/removing
> > devices from the parent i2c bus instead of the boolean reachable, but
> > that seemed way less clean - although do-able.
> >
> > >
> > > I ask because I did a pca9540 and pca9541 device, but I've never
> > > submitted it because I didn't think it would ever be needed.  It takes a
> > > different tack on the problem; it creates the secondary busses as
> > > standard QEMU I2C busses and bridges them.  You can see it at
> > >
> > >    github.com:cminyard/qemu.git master-i2c-rebase
> > >
> >
> > I'll have to take a look at your approach, but the idea that it
> > wouldn't be needed sounds bizarre to me as nearly all BMC-based qemu
> > boards leverage i2c muxes to handle their PCIe slot i2c routing.
> >
> > > If you design can do the things I ask, then it's better.  If not, then
> > > I'm not sure.
> 
> Corey,
> 
> looking at your design, I should be able to do something similar with
> a small tweak.
> 
> I think my design follows the hardware where there can be conflicts,
> etc, but what I didn't know how to do was add the faux I2cBuses in a
> useful way -- but if I add the I2cBuses to the device, and then on
> add/remove it registers the device on the parent bus -- i can still
> use the reachable boolean to control whether it's present.  The faux
> I2cBuses would be a simplification for adding/removing i2c devices --
> and would act as the device list in my object.  So then setting the
> channels would change to walking the devices held by the bus that
> corresponds with the bit -- but _still_ using the reachable boolean.
> 
> If you'd like, I can update my patchset to use an i2cbus for the
> purpose above, then it would satisfy the requirement of leveraging the
> normal device process and no longer require the special function call.

That sounds reasonable.  Your implementation is quite a bit simpler than
mine, which is a bonus.

-corey

> 
> Patrick
> 
> > >
> > > -corey
> > >
> > > >
> > > >  MAINTAINERS                      |   6 +
> > > >  hw/i2c/Kconfig                   |   4 +
> > > >  hw/i2c/core.c                    |   6 +
> > > >  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
> > > >  hw/i2c/meson.build               |   1 +
> > > >  hw/i2c/trace-events              |   5 +
> > > >  include/hw/i2c/i2c.h             |   3 +
> > > >  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
> > > >  8 files changed, 267 insertions(+)
> > > >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> > > >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> > > >
> > > > --
> > > > 2.31.0.208.g409f899ff0-goog
> > > >
> 
