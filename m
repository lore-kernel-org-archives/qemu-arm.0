Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6102285wrt;
        Tue, 16 Oct 2018 08:49:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62EdGTmkoK11b44wwzarEr/wp09WhUjqVUBqOY5XY0/57GGGu++p8gVPXFwz72Ol5HV0cNe
X-Received: by 2002:ac8:3a22:: with SMTP id w31-v6mr21040688qte.142.1539704947936;
        Tue, 16 Oct 2018 08:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539704947; cv=none;
        d=google.com; s=arc-20160816;
        b=dxvBlYwyq0BkaCFcn833N/t2h4SpQcmtyJtF0wi9GcTIlcdxMRegPGgSVUqrRFexMu
         lQ4REW8sJ5X4g+TssqcGrts0PTqlBjcBvb7le1VMWRp353yNJMjkbeC4iVb3giZm/y9/
         Inrx/eKJJXdzChOaVp94gd9Nw7EfhyzFc6ima3qCMil50GjtRpcSZdw+TpEnq9/nASVl
         z3Y6jBh0srkrB+mymxAskNV0KAD0BaiAGDIpZBwaTL+pP/o9WKZPNu1MiSJ9tGJgbewo
         xoOym3EGWEzxWz4SMRXAkGLjG+lw+ZrgQywjs/q7Q012msPRnYplVf7ZThcwNCLQgjTV
         HBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Z33+AvCMKuSCUgajfIeVJCDksFen33qG3dRcGmVLjR0=;
        b=0TC3mLOxzaJWbFlNok4OEUs4+FcdiPHQKrpQDa3oGPhu+E5XwJF+Bp8zmxEKdpia40
         QxUevRdb1nyOSg6R/jwVqvqI5oLbElp2hpasnKdy70jWL6t63yEhcinX5LgUG8J0UdE0
         gG+bYJ0PYpzDP7SRLm0z3WxmOf33xH4QUr3mR18fgANJbjoYizm6BsB8gpgKnbVINkkW
         msw5HG4t4ev49FdJMVt9cWqLynCW87maDTI4IMxrLbmySDVCa1p9+FdVSbck54QSumSw
         DTO8yqcShDwLeePZcSPYS3BZgt6O2e6OMzxZ7NGOhb4VH2TOiy6tle3ho/ZKOZMqTq/x
         eTZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K5kvWz9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m54-v6si3628798qtc.111.2018.10.16.08.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 08:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K5kvWz9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCRak-0005Fd-V1
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 11:49:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCRaT-0005E3-DM
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 11:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCRaR-0006PP-5F
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 11:48:49 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCRaP-0006Lj-Dc
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 11:48:46 -0400
Received: by mail-oi1-x242.google.com with SMTP id s69-v6so18433610oie.10
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z33+AvCMKuSCUgajfIeVJCDksFen33qG3dRcGmVLjR0=;
	b=K5kvWz9WgeCJJA1+CDGw1OeMHcsT4+dF5RsAqDPLlskgDThZXUokKFNUH17a+/4TqH
	0ji9K7iS4NR1lMKFh//2CDzN/HCSYJSShyrusdjq9GCBu/hEcVoM8+cT43qIaCvcLQR3
	4Nfz0vkbBCFhwRQnoGzKt5xFHfT8m3g3HPia0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z33+AvCMKuSCUgajfIeVJCDksFen33qG3dRcGmVLjR0=;
	b=kp0kUKOvIEgg5TCrN6NCAIShmZKIu4k40dlFlksFamQxywQK2YWEhYbXABRHe4Exzn
	tM/xq6q2SZJcomMkbT3UVWgx6z3WOpU5+/gZqK5dipvJoT2xrYxcBWGu7IanBquC+e3t
	cYq571BQrMA4pFRMXP3oLP/unUvSO6m1EAN5gGd6D7oLukl4eylqcNA914kmsJ/dyZVX
	lgMzp5IOtoBFtn8og7FTARIyGr+hzBYtmUnQtqFHRrbeWnx9P1557+dT2SI+6ZtlnOcu
	dn00qdblzHipifkuAnDkGYOeLNsFuHzvTKukq1HxbP2Uu0ayNHW40rOl0VzA1bDJFgqO
	TdcA==
X-Gm-Message-State: ABuFfojTWuLXBnUodRtqygRShlvZBcrFmtnAMuVq+lUzRsDAifkrMVgM
	Jk3rD7vMtJi0lAeJ8m31/BfRuLoHru9j7/9Ae2KAdQ==
X-Received: by 2002:aca:53c4:: with SMTP id
	h187-v6mr11082427oib.48.1539704923221; 
	Tue, 16 Oct 2018 08:48:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 08:48:22
	-0700 (PDT)
In-Reply-To: <09e1483c-298e-d41a-f9c9-4f186f530dcb@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<09e1483c-298e-d41a-f9c9-4f186f530dcb@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 16:48:22 +0100
Message-ID: <CAFEAcA9cNMiB01hSerawnfZsyXbJsrJYs_vFfWMi294XYeV8Zw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v5 0/9] Clock framework API.
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, konrad@adacore.com,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9DkGCpyhcFf

On 12 October 2018 at 16:26, Damien Hedde <damien.hedde@greensocs.com> wrote:
> Hi Peter,
>
> Sorry to bother you with this, but you said some time ago you would
> write something about reset.

Yeah, sorry about that. I haven't found (made) the time to think
the issues through yet. Let me just dump to email the notes I had.
This is a very "raw" set of notes, so it's not very organised and
has a lot of 'todo' bits in it...


Overall question -- does anybody know of other device modelling
systems that do a good job of modelling reset, and how they do it?
If we can borrow a proven design that might be better tha
thrashing one out ourseles...


My idea was roughly that we need a multi-phase reset, something like:

 PHASE 1:
   Devices reset internal state. No calls out to other devices
   (ie no setting IRQ line state, etc)
   Some common bit of code (dev base class?) marks the device
   reset as being in-progress by setting dev->resetting = true.

 PHASE 2:
   Devices update their output lines (calls to irq line setting
   functions, clock setting, etc)
   In this phase devices may be the recipients of callbacks for
   IRQ line level changes, etc, and must cope with this. A
   callback can tell it's being called for a level change during
   reset because dev->resetting will be true.
   (They can update their own outputs in response to input changes.)

 PHASE 3:
   Common code (dev base class) sets dev->resetting = false.
   (Individual devices don't get to do anything here, unless
   there's some painful case that requires it.)

The theory is that by decoupling reset into multiple phases
we can avoid most of the reset order issues, by having the
two ends do things in the right phase and/or by having
the destination end be able to identify when a change is
happening in the middle of reset.

Compatibility with existing device reset methods:
essentially the current rules are the same as the "phase 1"
rules, so we can just say that the current reset code in
all devices is phase 1 reset. Then we can adjust anything
that needs a phase 2 (which is probably not all that many
devices).

Places where reset order currently matters:
(this is just a list of things we should make sure our design
copes with)
 * wired-high IRQ lines, and device outputs that are asserted
   as the device comes out of reset
 * setting PC in the generic-loader device vs CPU reset
 * image load (rom image reset) vs Arm M-profile reset wanting
   to read the reset PC/SP from memory
 * Arm M-profile CPUs should have INITVTOR as a config signal input
 * x86 CPU vs APIC reset order ??
 * anything else?

We should have some sort of "reset domain" object which can
contain devices and also other reset domains. A reset domain's
reset is simple: its phase 1 reset is "for each child, do
phase 1 reset for that child", similarly for phases 2 and 3.
A reset domain has an overall "reset" method that says
"do phase 1 for all children, then phase 2, then phase 3".
This allows things like "this SoC has a reset line which
resets all its internal devices". (Do we want to give
reset domains input gpio lines to trigger reset, or is
being able to call a method on it sufficient?)

At the moment we have reset methods on devices:
 * each bus handles reset for the things on the bus
 * the (one and only) sysbus resets all the sysbus devices
 * devices on no bus don't get reset at all unless something
   takes special measures! (notably the CPUs are reset in
   a very ad-hoc way at the moment)
I guess this should be cleaned up by making each bus be
a 'reset domain', and having a "system" reset domain which gets
anything which doesn't have a parent reset domain (and which
we then use for whole-board power-on reset). Calling the
system reset domain's overall reset method will then do
the 3-phase reset for everything.

How would direct qemu_register_reset() calls fit into this
scheme? (Some of them are devices that could get QOM reset
methods instead. Perhaps we could get away with dumping the
rest into the 'master reset' domain, or leaving them as-is?
Some are for CPU reset which we definitely should clean up.)

We need to handle different types of reset somehow, in
particular "cold/power on reset" versus "warm reset".
Can we do this just with reset domain objects, or do we
need/want to pass each device's reset method a "type" argument?

thanks
-- PMM
