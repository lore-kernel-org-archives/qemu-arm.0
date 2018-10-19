Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4054310wrt;
        Fri, 19 Oct 2018 09:25:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60z1+0sI+rM8YD3CuuTNW2EvJOfokyG8vyVef+fQK02k32UmqLgmC7zc/HT+znHnCMw0f+b
X-Received: by 2002:a0c:99e5:: with SMTP id y37-v6mr35241000qve.133.1539966336410;
        Fri, 19 Oct 2018 09:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539966336; cv=none;
        d=google.com; s=arc-20160816;
        b=iKsMn7ISrPePso41AZX4vWx4Ybut6QR+nkOMDmtALPodJNXLBlRG/Vr5UL/12qd3rI
         6Sl8DH/IheJiLq5HzPG6cg3Gk3WfpyoQEgo0WCh9qUzLF/cij5RA0uHm3sqCZ6VOfsAb
         1YCAEsfzWznk1CLNwoGwd3TAYBbDG0lSdNJSt3+Ti4KYVGCKGhIl4gqfVPWbgIv9QlEb
         RWKX70ikCxHLZKomWSk+ycimmOA83eaMjDlGhYtsapI2YOg0EmZlh/305XXfpYD+P1vW
         ldqNdEyTPyoHzfAAy/Bj8Hph3cmXcM2oa++byQ6OOXhrZTF3/lbMLs8hfQvUe60Strhf
         xVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/NeK2lMxnlR0IE9N8jn1l51uB5NoNwEuaCHz/gWg0Vo=;
        b=kCk1/chcazlldmNiIdgPMgKmxobgLvSs9L35GD56jzaEJWS1rJcAvZNfWBCLs2ca47
         kWbsGGOM8M9Nm+TlsSQJnAfvwv2HrdgNZPYzT5Ea/wvEzZDXrCyGxLpx/JctlVYO8aqY
         YEWhb1yubD4+CQP55RJLAkZztif/+trWkS6uzdgm3p1dum/8DAz6blPLJUd7JfFSds0T
         YbT6JS2pyW1qeAKq3sGqhPJKtSFBTQb3pzVvcI3ots+STSKg6FybAJIj5n0eIJkQv4FX
         o1dT+p8Cn1Z+dTQcWDFE6WHaNzp4kPdqSqVfklVskHfodoACPRUKI7QT7OlbYDFkvdRB
         +tDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c35-v6si7065417qtd.358.2018.10.19.09.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 09:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDXah-00082q-SE
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 12:25:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gDXaW-00080Y-SY
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gDXaU-0003XO-VT
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:25:24 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:37122)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gDXaN-0003Qz-9L; Fri, 19 Oct 2018 12:25:15 -0400
Received: by mail-yw1-f68.google.com with SMTP id 130-v6so2045151ywl.4;
	Fri, 19 Oct 2018 09:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/NeK2lMxnlR0IE9N8jn1l51uB5NoNwEuaCHz/gWg0Vo=;
	b=bAqHcPLKTVkRSzh1zzMmTV9edK1QFySOHnF6/Sii7nkUXSMa8IOXtHe1KGlJo8L46U
	y78YuhOlskUDtkpQ9tof2nEL6Tykyy/0Xjvi4liG4o+uoopPvTMaU2Q6LnB3a/iRfYW4
	OaBT30NMlE4L6fhb29LVzwbgSxZdaNP1ywWXdxVK2TITeSL4SvuU1Dkz7KNq0NIkJotD
	h8PXkj5r93wQnkb6M4ccwdIAcM+lfPPS/gYqZo3Ir1qF7Bj75Jvt1dDC52bdbVPUlYwS
	rTxHMzd58yF5GlMwh//PfgDGlC+WppVUkVo7xHIPDBv4oBw8a4bAGGG0d8haAdwHdhV+
	+B4A==
X-Gm-Message-State: ABuFfoiu0qnQ/6ShNJlnpKuJVNSjzvGsKgJcaal9Z676g9l4UdlcCDK/
	+RTS0SlNuPxxF98udCTLB25KEa7TMTXe4LzSTHc=
X-Received: by 2002:a81:ae64:: with SMTP id
	g36-v6mr4153242ywk.370.1539966314364; 
	Fri, 19 Oct 2018 09:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-5-git-send-email-thuth@redhat.com>
	<CAFEAcA-ahq3Y4sgs=Vijq_fsDPgX4JuG0gGdMwE5oOLOrsvxjQ@mail.gmail.com>
	<a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
In-Reply-To: <a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 19 Oct 2018 18:25:02 +0200
Message-ID: <CAAdtpL4M9zD3LPOMgQNtN50pKzZAsoKn0c_uBe5vajPFwUMJvQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.68
Subject: Re: [Qemu-arm] [PATCH 4/5] configs: Add a CONFIG_UNIMP switch for
 the "unimplemented-device"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +HihFf+R8nz3

On Fri, Oct 19, 2018 at 4:40 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 2018-10-19 15:57, Peter Maydell wrote:
> > On 19 October 2018 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
> >> The "unimplemented-device" is currently only used for one arm board.
> >
> > ? It's used in all the MPS boards, several of the imx SoCs,
> > the nrf51 SoC used by the microbit, and by the stellaris boards.
> >
> >> Let's add a CONFIG switch to make sure that we only compile it when
> >> it is really necessary.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  default-configs/arm-softmmu.mak | 1 +
> >>  hw/misc/Makefile.objs           | 2 +-
> >>  2 files changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> >> index 6f2ffc1..dc9730f 100644
> >> --- a/default-configs/arm-softmmu.mak
> >> +++ b/default-configs/arm-softmmu.mak
> >> @@ -7,6 +7,7 @@ CONFIG_NAND=y
> >>  CONFIG_OR_IRQ=y
> >>  CONFIG_SPLIT_IRQ=y
> >>  CONFIG_REGISTER=y
> >> +CONFIG_UNIMP=y
> >>  CONFIG_ECC=y
> >>  CONFIG_SERIAL=y
> >>  CONFIG_SERIAL_ISA=y
> >
> > This seems awkward to me. The 'unimplemented' device is supposed
> > to be an entirely generic thing usable in any board model.
> > If we only turn it on in the arm-softmmu.mak then it means
> > faffing around with the default-configs/ whenever it gets
> > used in a different architecture.
>
> The device has been added 1.5 years ago, and so far no other target is
> using it yet. So it's very seldom that you've got to expect any changes,
> I think.

I disagree with this (and this patch).

First because I'm using it heavily on MIPS and PPC boards, when no
datashits are available.
I'll submit that during the next merge window, although the MIPS tree
seems now reluctant to that kind of hobbyist work.

Second, because it is very clean when you implement a SoC to first
start with an empty UNIMP region and a cpu core,
then declare the mmio regions for each device (still UNIMP), then you
can slowly add devices one at a time.
This let you (me, so far) push at most a dozen of tiny patches in a
working series, instead of a small series of a dozen of huge patches,
or a series of 100 tiny patches.

See https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg06094.html
about this approach.

Regards,

Phil.

> Anyway, it's also not only about speeding up the compilation process for
> people who don't want to use the corresponding targets, this is also
> very useful for downstream distributions of QEMU who want to make sure
> to not compile-in more devices than urgently needed. For example we
> disable this device here and the others in downstream RHEL version of
> QEMU, and I guess it might be interesting for nemu, too. So having more
> flexibility here in the Makefiles would be really great to decrease the
> burden with downstream-specific patches...
>
> > In particular, there's a pull request on the list that uses
> > it in a sparc board, so this patch will break compile on sparc
> > once that pullreq lands.
>
> Ok, then please disregard this patch here, but it would be great if you
> could still consider the other patches of this series.
>
>  Thomas
