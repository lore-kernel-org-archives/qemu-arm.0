Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1587345lfr;
        Tue, 6 Apr 2021 08:42:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrLZbIPrpDi5a4pB/V4wuY5i1rkc260aUv5urs7H9+riFO0PAKna9mw5Cetmvw3sOLPy+u
X-Received: by 2002:a92:c108:: with SMTP id p8mr7229255ile.48.1617723755700;
        Tue, 06 Apr 2021 08:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617723755; cv=none;
        d=google.com; s=arc-20160816;
        b=tjrZhfXZ+zLOAcQCvDbGeA6FzLkqYh4obLggKGyo7H/0KEWWPCJczz2FFbCeDSLCn+
         GIgjDB7/19wgutbZROJvXONiWnCybU5AafutwoKSugrLOgwEagABWOdcBVN5YSPhSYmT
         3pWncUI0uTsA467a/1KQpX5nGQdW3r4VPOmp3iq5d+31gW5P3MbV/0r2Sf3wQPQbD87h
         s/6PU8Gpsp0l9TbATI9WClFKxNS6JlWAIPmdiiwu2c/jmIgJDacJ5CzJyZ4nRuUUCMkO
         yqFUztj+ym9HGebGVWe8b0uINn2u7WeZZ1PSCGQHkubiwSK1bzr1pmSgQwMsfxrfz0po
         j2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AQHeRWlXoYMigQP9Nogt5vpbocAz+3D6eLlnMEiGwdA=;
        b=T5+Ew5IJLCCgHS62qKGiACdcprz+yTuhQ10v+rWHypnO7/TyxKeZFw6cozQnyFky8C
         tD+UGdG16fNAGTXE1JktyQKtrCSoTzt0k3sBXUldwS82NtAeSTJXHNbN4RrCFdVT4pnx
         CZLfKXvXuxeBGOwYwIBb9mdo8iXt0kt69akZjvEUtcF0N5HRtwJOF1x5F1NHyKhRbikg
         Oxk6IlH4gaP/L8XYLKjoiVUZ/GpMTY5kvhqkfbJfyRIq2MrfS97UKyIvkulJeF30AspB
         szzvGJfGfJZ5TsX3JcjK9rIyx0975kUWpkY6ZAz38QF3fMORG2aQjrTkQ7v9UCXjeMKr
         bd0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="JG2v/dFm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si778119ilo.127.2021.04.06.08.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 08:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="JG2v/dFm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTnqc-000352-VA
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 11:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTnqB-00034F-G4
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 11:42:07 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTnq8-0007VW-Bl
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 11:42:07 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so3809128ook.2
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQHeRWlXoYMigQP9Nogt5vpbocAz+3D6eLlnMEiGwdA=;
 b=JG2v/dFmDKRkjOqwnxlBdi2mEuYxTRJN94YScHHnU5Q04dyb5QLY/UMMSC7Ip5gJVh
 XTGVhKuHAHWGbbYxQE8PJzjKSb6kPiJMZJ4ULtufrvgo1vfdGA+C7Wmd/081G5m0p7pj
 wRldejXDd07EMK7NuSkN7Yf0n5JO3oZo5oFbSDtfb6iL2a0R0o2Y/G822GolYd5lc9/Y
 rS4X/26qO8FqGx/DR0nrKNnorKMsxNIhPpIl75jZW2iqVXcTRqIrqFDN1VAz9jgH/ufq
 E9res6s1VKjirZ+ecwlJVOKb+Ss4rFMlKBLRa22c1YghUpitNMyKqhLHKF1gO6yH0Ktv
 f4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQHeRWlXoYMigQP9Nogt5vpbocAz+3D6eLlnMEiGwdA=;
 b=JuQSq0t6xgvlvUsxDtrApIfQTv1oJA7ayFAVwhQU/VZBNMMvajHL4/8yk4aXqxH04a
 Axdp+tNk3bFKDRlQbTtXwbt4HnJRSlzyQDwktM4mP55bHIcBltpJtlzd6wNLvr4eKgfc
 AESq1l99T9rARUgvW5saazdr+HM19+RLu2LIwbgRySEDGx3aKN0+h7H4bw+XEGyTamis
 Y8IBWcKDLLbbM4nflbQ5ZQk3TTktfgbk0PbTRM3l42A1JlQIQL2b/a4gkaE9kAEmT5+Z
 K55fC2t2uMO65UTGnv5nAhNQ9E2M4CNItR5A+ukELAIAl/CksUGMSbZuRgJclVrjPR4F
 Ttgw==
X-Gm-Message-State: AOAM530us9NpRldgOnGowZd2NFuUPBA3FhzkEXvWpfxtw9/4LclhFChW
 t5eeZR38uDkDSMpqhl3iD5V4gyJre+1EFQ2PdbGC/A==
X-Received: by 2002:a4a:b102:: with SMTP id a2mr26958316ooo.30.1617723722046; 
 Tue, 06 Apr 2021 08:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210403222810.3481372-1-venture@google.com>
 <20210405195834.GF7167@minyard.net>
In-Reply-To: <20210405195834.GF7167@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Tue, 6 Apr 2021 08:41:50 -0700
Message-ID: <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
To: cminyard@mvista.com
Cc: Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=venture@google.com; helo=mail-oo1-xc32.google.com
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
X-TUID: lGFyiQtAsMgD

On Mon, Apr 5, 2021 at 12:58 PM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> > The i2c mux device pca954x implements two devices:
> >  - the pca9546 and pca9548.
> >
> > Patrick Venture (2):
> >   hw/i2c/core: add reachable state boolean
> >   hw/i2c: add pca954x i2c-mux switch
>
> Looking this over, the code looks good, but I have a few general
> questions:
>
> * Can you register the same slave address on different channels?  That's
>   something you could do with real hardware and might be required at
>   some time.  It looks like to me that you can't with this patch set,
>   but maybe I'm missing something.

If I understand the hardware's implementation properly you can have
collisions, and this allows for collisions.  I'm not sure what you
mean by having both accessible.  For instance, on hardware you can
have a switch with N channels, and on two of the channels there is an
eeprom at 50.  But you're unable to talk to both eeproms at the same
time, because the addresses collide -- so how would the hardware know
which you're talking to?  My understanding of the behavior in this
collision case is that it just talks to the first one that responds
and can lead to unexpected things.

There is a board, the quanta-q71l where we had to set the
idle-disconnect because there were two muxes on the same bus, with
conflicting addresses, and so we had to use idle disconnect explicitly
to make the software happy talking to the hardware -- not ideal as
having two devices behind different channels, but ultimately it's the
same idea because the devices are conflicting.

>
> * Can you add devices to the secondary I2C busses on the mux using the
>   standard QEMU device model, or is the function call required?

I added the function call because I didn't see a clean way to bridge
the issue as well as, the quasi-arbitrary bus numbering used by the
kernel isn't how the hardware truly behaves, and my goal was to
implement closer to the hardware.  I thought about adding an I2cBus to
the device and then you'd be able to access it, but wasn't sure of a
nice clean way to plumb that through -- I considered adding/removing
devices from the parent i2c bus instead of the boolean reachable, but
that seemed way less clean - although do-able.

>
> I ask because I did a pca9540 and pca9541 device, but I've never
> submitted it because I didn't think it would ever be needed.  It takes a
> different tack on the problem; it creates the secondary busses as
> standard QEMU I2C busses and bridges them.  You can see it at
>
>    github.com:cminyard/qemu.git master-i2c-rebase
>

I'll have to take a look at your approach, but the idea that it
wouldn't be needed sounds bizarre to me as nearly all BMC-based qemu
boards leverage i2c muxes to handle their PCIe slot i2c routing.

> If you design can do the things I ask, then it's better.  If not, then
> I'm not sure.
>
> -corey
>
> >
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/core.c                    |   6 +
> >  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c.h             |   3 +
> >  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
> >  8 files changed, 267 insertions(+)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> >
> > --
> > 2.31.0.208.g409f899ff0-goog
> >
