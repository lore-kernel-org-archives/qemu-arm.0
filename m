Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1495326lfc;
        Mon, 8 Feb 2021 13:01:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxD6v/lgZKD/rRvIgHcY72hkOAb8SDXe2TKTdI/KBj9ub+p/dQ55DMTgt6sd/D4Cz0AKYT
X-Received: by 2002:a05:6102:31a6:: with SMTP id d6mr2203803vsh.48.1612818106158;
        Mon, 08 Feb 2021 13:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612818106; cv=none;
        d=google.com; s=arc-20160816;
        b=LGv2NE2h2BM68tVRBtwNpNfWF0RHvrgMw0gr27cMM6TGCB3k5cBbGqJOKYDBwD/H4+
         tJm0ZPoxXTi8IUgqs9pFaA3fk4k5gQ1fQB/r+tg1z/CXcBPBQ8C7b+hrxOsJcAh6vBVF
         6z7HAm5CGalECGiAVM3Dn/DOZJyKdeuBBnuVoou0VvHnj2CnmIPLiZUzWtPyEfEo8gUs
         pliUqiHKeCIDCaNe+LuPU6G76gadqwU/MOlAMMtSVBZnt5V6GUhJzLSa88FddyJs7lFv
         4B4wEMzx2GytAfwTrwGfi9hph4zYRmQO1xEfolv+N27NbBdu32wqrnSN91AoYeiUOFRo
         Ho/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7/Xs1pLgvSKkOtLyjMO6kYUrCGzcsI9GeSPUPWQq6Ag=;
        b=q3BPi+CGwmMqMmEKs218ZIgcwYOj+qseSLQCMkBojPpW3QIGLR0dnqeQH6wqsXc/+3
         znnDZscDdE2U6fE1+wRon0ZIk5zW5kldgF0rXan2ivSfmnRT3vS7YDo/QqZVfKVjd832
         eiOQXoKHjkQrSxCMkA/5GIGtqRvD1hyFiQKYP62IuEeWGT+e5+eq2hAR18Y1OrHFG43q
         6liXH9qkzu2wPng0+2j1YGbdM8fAUTDM60bdlIL8CDqZXamfLVfbf0YyJGc8YapiD1uW
         psYtwSqDmuRZmyLonKhbPhGk3apiu+URQJFqWicVBYK547xL3mfIlLQmW2Ded7FxvQN+
         vmBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AtsAH4sD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w190si3018604vsw.302.2021.02.08.13.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 13:01:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AtsAH4sD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9DfF-0003Qr-CH
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 16:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97k0-00058R-Jo; Mon, 08 Feb 2021 09:42:17 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97jw-0004q7-96; Mon, 08 Feb 2021 09:42:16 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id i71so14782161ybg.7;
 Mon, 08 Feb 2021 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7/Xs1pLgvSKkOtLyjMO6kYUrCGzcsI9GeSPUPWQq6Ag=;
 b=AtsAH4sDznVKW59ZW755NmjuCSdtoJPfhuEbXsrSUJ+22KwP+EBx/9t7oLNqjLf3PZ
 cKm4dN+eKfK8npCVaV7pUOEPRuAisUeGr24l5Py7YLN4ROyif6IJ+0LMIsIh1FINnmdj
 6sWBjqIwyOAY0hCt6ul8rBxFq9f8jm9uJ1M2n0RujtuI9L4VcYuHNjNo3VRf+mreTpoM
 kA0LZDzutIs3iBJLBfIMeX5DaJnk6hUiY+KBg/WTF+dpinOcIEKUOe27Y+/IFp3oOQtA
 7H4sQCyKCnyIbTQ6XdlVwl8XTDQsIryEntKu+H0FttCfSb4zKDBXhf1AgOu+xl4NHzcy
 JRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7/Xs1pLgvSKkOtLyjMO6kYUrCGzcsI9GeSPUPWQq6Ag=;
 b=Jh8pOIFpFrFrn5VsmnA1ajsE0zWVB3/Of0hCDK1myRpUdgQgmekGTJKMkO1M1RQswl
 zv3A/1DWQmgE0x8GYh6fzNQVu24JyQAOUdZXD3OfwAZtY54ifZGJUGoDdY7KogI9sdmU
 jbHMzDa6fdy3QvVSPKjQXXwe/mS9IFX8YCmMzZ4SEDa77fltnuAi+P3B0cZtHl88KvuL
 jBFKLbNKBGZdC92ZB2PhmPLBRAD8Il0v2ZIyuO7olkD6E03xxmnrAhsPOmKX2aB8m21U
 +hmmXKE5P41DQ0Pw/hLh6rkohfKY76lwqs4po+ByYQ1OpdUnk2iPjmhPvhoIZVDeUWF3
 W2qg==
X-Gm-Message-State: AOAM530ge53POyLos+GOX7htIrKWdyrP4NgfCFzaog0R7TC8YChphl/L
 HS77eXGYYtUTQFfKO+6hFN8v4ZLsvLQwEePuYGE=
X-Received: by 2002:a25:3bc5:: with SMTP id
 i188mr25930281yba.332.1612795327317; 
 Mon, 08 Feb 2021 06:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
 <20210115122627.GB29923@fralle-msi>
 <CAEUhbmVYgP063iqY0c10y9zKBmx00Z6vr3BO3RjoRo-CXQpYDw@mail.gmail.com>
 <20210118100557.GA11373@fralle-msi>
 <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
 <20210119130113.GA28306@fralle-msi>
 <CAEUhbmUBAgF4D__jsfbE7yGd++5ZH3YOutTiOBOot52sNCV-eg@mail.gmail.com>
 <20210121085006.GA10391@fralle-msi>
 <CAEUhbmUh54vqXmtkjnTzk7Y6U+oZEbw-O3ode+CdKbfZ0Qs+9Q@mail.gmail.com>
 <20210121141844.GC10391@fralle-msi>
In-Reply-To: <20210121141844.GC10391@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 22:41:55 +0800
Message-ID: <CAEUhbmWT9QPa-EFRdQme2L9hiUJSYWZWfmzQTShQN86WMW93ew@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Francisco Iglesias <frasse.iglesias@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+QQFhsJyfYe

On Thu, Jan 21, 2021 at 10:18 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> On [2021 Jan 21] Thu 16:59:51, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Dear Bin,
> > >
> > > On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hi Bin,
> > > > >
> > > > > On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
> > > > > > Hi Francisco,
> > > > > >
> > > > > > On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
> > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Bin,
> > > > > > >
> > > > > > > On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> > > > > > > > Hi Francisco,
> > > > > > > >
> > > > > > > > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Bin,
> > > > > > > > >
> > > > > > > > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > > > > > > > > > Hi Francisco,
> > > > > > > > > >
> > > > > > > > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Bin,
> > > > > > > > > > >
> > > > > > > > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > >
> > > > > > > > > > > > The m25p80 model uses s->needed_bytes to indicate h=
ow many follow-up
> > > > > > > > > > > > bytes are expected to be received after it receives=
 a command. For
> > > > > > > > > > > > example, depending on the address mode, either 3-by=
te address or
> > > > > > > > > > > > 4-byte address is needed.
> > > > > > > > > > > >
> > > > > > > > > > > > For fast read family commands, some dummy cycles ar=
e required after
> > > > > > > > > > > > sending the address bytes, and the dummy cycles nee=
d to be counted
> > > > > > > > > > > > in s->needed_bytes. This is where the mess began.
> > > > > > > > > > > >
> > > > > > > > > > > > As the variable name (needed_bytes) indicates, the =
unit is in byte.
> > > > > > > > > > > > It is not in bit, or cycle. However for some reason=
 the model has
> > > > > > > > > > > > been using the number of dummy cycles for s->needed=
_bytes. The right
> > > > > > > > > > > > approach is to convert the number of dummy cycles t=
o bytes based on
> > > > > > > > > > > > the SPI protocol, for example, 6 dummy cycles for t=
he Fast Read Quad
> > > > > > > > > > > > I/O (EBh) should be converted to 3 bytes per the fo=
rmula (6 * 4 / 8).
> > > > > > > > > > >
> > > > > > > > > > > While not being the original implementor I must assum=
e that above solution was
> > > > > > > > > > > considered but not chosen by the developers due to it=
 is inaccuracy (it
> > > > > > > > > > > wouldn't be possible to model exacly 6 dummy cycles, =
only a multiple of 8,
> > > > > > > > > > > meaning that if the controller is wrongly programmed =
to generate 7 the error
> > > > > > > > > > > wouldn't be caught and the controller will still be c=
onsidered "correct"). Now
> > > > > > > > > > > that we have this detail in the implementation I'm in=
 favor of keeping it, this
> > > > > > > > > > > also because the detail is already in use for catchin=
g exactly above error.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I found no clue from the commit message that my propose=
d solution here
> > > > > > > > > > was ever considered, otherwise all SPI controller model=
s supporting
> > > > > > > > > > software generation should have been found out seriousl=
y broken long
> > > > > > > > > > time ago!
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > The controllers you are referring to might lack support f=
or commands requiring
> > > > > > > > > dummy clock cycles but I really hope they work with the o=
ther commands? If so I
> > > > > > > >
> > > > > > > > I am not sure why you view dummy clock cycles as something =
special
> > > > > > > > that needs some special support from the SPI controller. Fo=
r the case
> > > > > > > > 1 controller, it's nothing special from the controller pers=
pective,
> > > > > > > > just like sending out a command, or address bytes, or data.=
 The
> > > > > > > > controller just shifts data bit by bit from its tx fifo and=
 that's it.
> > > > > > > > In the Xilinx GQSPI controller case, the dummy cycles can e=
ither be
> > > > > > > > sent via a regular data (the case 1 controller) in the tx f=
ifo, or
> > > > > > > > automatically generated (case 2 controller) by the hardware=
.
> > > > > > >
> > > > > > > Ok, I'll try to explain my view point a little differently. F=
or that we also
> > > > > > > need to keep in mind that QEMU models HW, and any binary that=
 runs on a HW
> > > > > > > board supported in QEMU should ideally run on that board insi=
de QEMU aswell
> > > > > > > (this can be a bare metal application equaly well as a modifi=
ed u-boot/Linux
> > > > > > > using SPI commands with a non multiple of 8 number of dummy c=
lock cycles).
> > > > > > >
> > > > > > > Once functionality has been introduced into QEMU it is not ea=
sy to know which
> > > > > > > intentional or untentional features provided by the functiona=
lity are being
> > > > > > > used by users. One of the (perhaps not well known) features I=
'm aware of that
> > > > > > > is in use and is provided by the accurate dummy clock cycle m=
odeling inside
> > > > > > > m25p80 is the be ability to test drivers accurately regarding=
 the dummy clock
> > > > > > > cycles (even when using commands with a non-multiple of 8 num=
ber of dummy clock
> > > > > > > cycles), but there might be others aswell. So by removing thi=
s functionality
> > > > > > > above use case will brake, this since those test will not be =
reliable.
> > > > > > > Furthermore, since users tend to be creative it is not possib=
le to know if
> > > > > > > there are other use cases that will be affected. This means t=
hat in case [1]
> > > > > > > needs to be followed the safe path is to add functionality in=
stead of removing.
> > > > > > > Luckily it also easier in this case, see below.
> > > > > >
> > > > > > I understand there might be users other than U-Boot/Linux that =
use an
> > > > > > odd number of dummy bits (not multiple of 8). If your concern w=
as
> > > > > > about model behavior changes, sure I can update
> > > > > > qemu/docs/system/deprecated.rst to mention that some flashes in=
 the
> > > > > > m25p80 model now implement dummy cycles as bytes.
> > > > >
> > > > > Yes, something like that. My concern is that since this functiona=
lity has been
> > > > > in tree for while, users have found known or unknown features tha=
t got
> > > > > introduced by it. By removing the functionality (and the known/uk=
nown features)
> > > > > we are riscing to brake our user's use cases (currently I'm aware=
 of one
> > > > > feature/use case but it is not unlikely that there are more). [1]=
 states that
> > > > > "In general features are intended to be supported indefinitely on=
ce introduced
> > > > > into QEMU", to me that makes very much sense because the opposite=
 would mean
> > > > > that we were not reliable. So in case [1] needs to be honored it =
looks to be
> > > > > safer to add functionality instead of removing (and riscing the r=
emoval of use
> > > > > cases/features). Luckily I still believe in this case that it wil=
l be easier to
> > > > > go forward (even if I also agree on what you are saying below abo=
ut what I
> > > > > proposed).
> > > > >
> > > >
> > > > Even if the implementation is buggy and we need to keep the buggy
> > > > implementation forever? I think that's why
> > > > qemu/docs/system/deprecated.rst was created for deprecating such
> > > > feature.
> > >
> > > With the RFC I posted all commands in m25p80 are working for both the=
 case 1
> > > controller (using a txfifo) and the case 2 controller (no txfifo, as =
GQSPI).
> > > Because of this, I, with all respect, will have to disagree that this=
 is buggy.
> >
> > Well, the existing m25p80 implementation that uses dummy cycle
> > accuracy for those flashes prevents all SPI controllers that use tx
> > fifo to work with those flashes. Hence it is buggy.
> >
> > >
> > > >
> > > > > >
> > > > > > > >
> > > > > > > > > don't think it is fair to call them 'seriously broken' (a=
nd else we should
> > > > > > > > > probably let the maintainers know about it). Most likely =
the lack of support
> > > > > > > >
> > > > > > > > I called it "seriously broken" because current implementati=
on only
> > > > > > > > considered one type of SPI controllers while completely ign=
oring the
> > > > > > > > other type.
> > > > > > >
> > > > > > > If we change view and see this from the perspective of m25p80=
, it models the
> > > > > > > commands a certain way and provides an API that the SPI contr=
ollers need to
> > > > > > > implement for interacting with it. It is true that there are =
SPI controllers
> > > > > > > referred to above that do not support the portion of that API=
 that corresponds
> > > > > > > to commands with dummy clock cycles, but I don't think it is =
true that this is
> > > > > > > broken since there is also one SPI controller that has a work=
ing implementation
> > > > > > > of m25p80's full API also when transfering through a tx fifo =
(use case 1). But
> > > > > > > as mentioned above, by doing a minor extension and improvemen=
t to m25p80's API
> > > > > > > and allow for toggling the accuracy from dummy clock cycles t=
o dummy bytes [1]
> > > > > > > will still be honored as in the same time making it possible =
to have full
> > > > > > > support for the API in the SPI controllers that currently do =
not (please reread
> > > > > > > the proposal in my previous reply that attempts to do this). =
I myself see this
> > > > > > > as win/win situation, also because no controller should need =
modifications.
> > > > > > >
> > > > > >
> > > > > > I am afraid your proposal does not work. Your proposed new devi=
ce
> > > > > > property 'model_dummy_bytes' to select to convert the accurate =
dummy
> > > > > > clock cycle count to dummy bytes inside m25p80, is hard to just=
ify as
> > > > > > a property to the flash itself, as the behavior is tightly coup=
led to
> > > > > > how the SPI controller works.
> > > > >
> > > > > I agree on above. I decided though that instead of posting sample=
 code in here
> > > > > I'll post an RFC with hopefully an improved proposal. I'll cc you=
. About below,
> > > > > Xilinx ZynqMP GQSPI should not need any modication in a first ste=
p.
> > > > >
> > > >
> > > > Wait, (see below)
> > > >
> > > > > >
> > > > > > Please take a look at the Xilinx GQSPI controller, which suppor=
ts both
> > > > > > use cases, that the dummy cycles can be transferred via tx fifo=
, or
> > > > > > generated by the controller automatically. Please read the exam=
ple
> > > > > > given in:
> > > > > >
> > > > > >     table 24=E2=80=9022, an example of Generic FIFO Contents fo=
r Quad I/O Read
> > > > > > Command (EBh)
> > > > > >
> > > > > > in https://www.xilinx.com/support/documentation/user_guides/ug1=
085-zynq-ultrascale-trm.pdf
> > > > > >
> > > > > > If you choose to set the m25p80 device property 'model_dummy_by=
tes' to
> > > > > > true when working with the Xilinx GQSPI controller, you are bou=
nd to
> > > > > > only allow guest software to use tx fifo to transfer the dummy =
cycles,
> > > > > > and this is wrong.
> > > > > >
> > > >
> > > > You missed this part. I looked at your RFC, and as I mentioned abov=
e
> > > > your proposal cannot support the complicated controller like Xilinx
> > > > GQSPI. Please read the example of table 24-22. With your RFC, you
> > > > mandate guest software's GQSPI driver to only use hardware dummy cy=
cle
> > > > generation, which is wrong.
> > > >
> > >
> > > First, thank you very much for looking into the RFC series, very much
> > > appreciated. Secondly, about above, the GQSPI model in QEMU transfers=
 from 2
> > > locations in the file, in 1 location the transfer referred to above i=
s done, in
> > > another location the transfer through the txfifo is done. The locatio=
n where
> > > transfer referred to above is done will not need any modifications (a=
nd will
> > > thus work equally well as it does currently).
> >
> > Please explain this a little bit. How does your RFC series handle
> > cases as described in table 24-22, where the 6 dummy cycles are split
> > into 2 transfers, with one transfer using tx fifo, and the other one
> > using hardware dummy cycle generation?
>
> Sorry, I missunderstod. You are right, that won't work.

+Edgar E. Iglesias

So it looks by far the only way to implement dummy cycles correctly to
work with all SPI controller models is what I proposed here in this
patch series.

Maintainers are quite silent, so I would like to hear your thoughts.

@Alistair Francis @Philippe Mathieu-Daud=C3=A9 @Peter Maydell would you
please share your thoughts since you are the one who reviewed the
existing dummy implementation (based on commits history)

Regards,
Bin
