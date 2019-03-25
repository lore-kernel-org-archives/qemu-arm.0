Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3712300wrx;
        Mon, 25 Mar 2019 04:03:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTrJM44XHTiiBqvpNKSMkSCL7zeiqMx+WzgzWqNQ5eV0vChW06CcIOEseV4vkFHLYmqleO
X-Received: by 2002:a25:2002:: with SMTP id g2mr18812072ybg.515.1553511822605;
        Mon, 25 Mar 2019 04:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511822; cv=none;
        d=google.com; s=arc-20160816;
        b=osreCIY87c6rkjSGiKC/qlB4krqcHkYj22PUV8Sppk20jFhEJNhCPa8Iv7OvyqAY9L
         6+GkONBD2IFYecdqrjhVQy9Gba4hhMbwjKRE2m8N+6zHSChiAEcBqE7hKGXZcqGq+U0Y
         NGiA13/ZRZakb9joFTTOoihyxL/de1bmmr1X46YeRUARZRhc+omU+oZYD3kgnh97WoXN
         RsuRjZ8eHil3Z+IPyysObg8+4mh+S7NxhlnTODuttTBnJTTZokv6XidaUW9WSNgXCunN
         SmIDym+iqs57GDoU0dFJAWErbDcQDk3GAfrtVfJ7P12k/UQyI90GB/XfH4VhfEcuN6x/
         jf0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=u6Dlto6nq45rbp35iemcn67/R5Im2rykKFbQ0Sx5+aA=;
        b=aBy6DRFKnbmqdO9px/iSp7Hb+91IJix5O+1hg1L3agZuF/e9NeY7TVOwZJcBR2WdLA
         mFbp0q0y1znqebpPlw66q11h1m+4Gujwp/TAhCNHpnurZ5A7NtrnhgPk+Fsn/tMFd0ZS
         xUal6s7+z8HIaiWOOX3BeTu+TbUu8wIG2E8wDfcYnEOsT//OvVfeJZNqzzMcZADOc29k
         UhnFrs0wutjXH2kX3Rl223Dbah2U7JM6n1UyKgfImJVDJjRHisyhK/KwoeLdBsqQ5wV4
         j59j6TrFMnj1eWn6fKqcVYvzh/Cz2bzXC9ZUP9nKFhdNMxSGy/6r4rLengduClMsdvTw
         kj4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hTyVhbgj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ycuzEF9V;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ycuzEF9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si1731783ybk.468.2019.03.25.04.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hTyVhbgj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ycuzEF9V;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ycuzEF9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NOI-0005lJ-1r
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:03:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNA-00056o-Gi
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN8-0007o3-8n
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:32 -0400
Received: from greensocs.com ([193.104.36.180]:38262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN7-0007lR-Jz; Mon, 25 Mar 2019 07:02:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 8F2517D78B5;
	Mon, 25 Mar 2019 12:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511743;
	bh=IS8Q7eQYYRGqchNkuuXScu5rArhulynhwNtImOr6IYw=;
	h=From:To:Cc:Subject:Date;
	b=hTyVhbgjfSil5bDtpaw/SlrQkYgkY/euwfpGd+e1JlABrtRvSCWR+Zqeape3JP/JS
	gwtvbP+ngTOF7LcgfksW+bBMu5EKYx/6CAFUEN7UwHML56mJBGbUVBVUoMt6Fw5MhM
	IIXzyxBJf5tkuVK2pwjGft00UJ9k1b06W98u7UeI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ycuzEF9V;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ycuzEF9V
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipc_TgrmgPba; Mon, 25 Mar 2019 12:02:20 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 7930B7D789E; Mon, 25 Mar 2019 12:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511740;
	bh=IS8Q7eQYYRGqchNkuuXScu5rArhulynhwNtImOr6IYw=;
	h=From:To:Cc:Subject:Date;
	b=ycuzEF9VnUkKcCGV8NFSFzK8uoSijO0uFbmYjRzrVPB4W7gYGBE/Ie1Sv8FJjZ5Mg
	UZcWRLFuWvPKca/GMHYj+BoEf76E6owSdcCLGa+OOgBv61dmYhC9GGh/8BwHBxDljx
	38Hh2j/RpBPiFSmUr7Zt0HTmiFBq4QWRA/dqr6VU=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D5CBB7D7887;
	Mon, 25 Mar 2019 12:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511740;
	bh=IS8Q7eQYYRGqchNkuuXScu5rArhulynhwNtImOr6IYw=;
	h=From:To:Cc:Subject:Date;
	b=ycuzEF9VnUkKcCGV8NFSFzK8uoSijO0uFbmYjRzrVPB4W7gYGBE/Ie1Sv8FJjZ5Mg
	UZcWRLFuWvPKca/GMHYj+BoEf76E6owSdcCLGa+OOgBv61dmYhC9GGh/8BwHBxDljx
	38Hh2j/RpBPiFSmUr7Zt0HTmiFBq4QWRA/dqr6VU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:43 +0100
Message-Id: <cover.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC 00/17] multi-phase reset mechanism
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EU4Ui+/a1GUW

Hi all,

This series is a proposal to implement the multi-phase reset we've discus=
sed
here (https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg00310.html=
) and
more recently there
(https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg00081.html).

To summarize, we need a multi-phase reset to allow for a more complex
initialization of a platform. In particular we need to "propagate" a cloc=
k
tree, but we have to ensure that every device is initialized first.

To solve this problem, the following 3-phases reset mechanism is proposed=
 (I've
removed the 4th given our last discussion).

#DESCRIPTION

INIT PHASE: Reset the object internal state, put a resetting flag and do =
the
    same for the reset subtree. No side effect on other devices to guaran=
tee
    that, in a reset domain, everything get initialized first. This corre=
sponds
    mostly to what is currently done in the device/bus reset method.

HOLD PHASE: This phase allows to control a reset with a I/O. When a I/O c=
ontrol
    a reset procedure based on the I/O level (not edge), we may need to a=
ssert
    the reset, wait some time, and finally de-assert the reset. The conse=
quence
    is that such a device can stay in a "resetting state" and may need to=
 show
    this state to other devices through its outputs. For example, a clock
    controller will typically shutdown its clocks when it is in resetting=
 state.

EXIT PHASE (previously named 'release'): This phase sets outputs to state=
 after
     reset. For a clock controller it starts the clocks. It also clears t=
he
     "resetting" flag. A device should not react to inputs until this fla=
g has
     been cleared. During this phase, outputs are propagated in the reset=
 domain
     (and outside the reset domain).

To implement this, this series add a Resettable interface containing 3 me=
thods:
one for each phase. The init phase's method takes a boolean argument allo=
wing to
distinguish cold and warm resets.

In this series, Device and Bus implement the interface. A vmstate descrip=
tion
subsection is added to allow migration of reset related state for device.
3 methods (one per phase) are also added in Device's class. They correspo=
nd to
the local part (see the code example below) of the reset. They avoid devi=
ce
specialization to have to handle the sub-domain part and "resetting" stat=
e.

Functions to add gpio control over the reset are added. It is possible to=
 add
an active low/high reset pin to control the warm reset and an active low/=
high
power gating pin to control the cold reset.

The bus/device reset tree is converted to this 3-phases mechanism. I also
added a new ResetDomain object which is just a Resettable container. It i=
s
used to have a global "system reset domain" to handle main 3-phases reset=
 and
replace the current single-phase-reset handler mechanism.

As an example, in the xilinx_zynq machine, I've converted the slcr (the r=
esets
and clocks controller device) and the uart peripheral to this 3-phases re=
set
mechanism. Gpio are added between the devices to transmit reset control f=
rom
the slcr to the uarts.

All changes have been made so that existing reset behavior is not modifie=
d.

#INTERFACE CHOICE

To be honest, I have some doubt about the interface. I've kept it minimal=
 and
the consequence is implementation is complex (and kind of duplicated in e=
very
base implementation like Device or Bus). One of the problem is the `reset=
ting`
flag, which in practical must be a counter to handle reset "reentrance".
Indeed nothing forbids to reset some device that is already held in "rese=
tting"
state by some other means. As an example, in the zynq machine, there can =
be=20
a global/system reset while an uart is reset by the slcr. It it also poss=
ible
to cold and warm resets triggered concurrently.

The Resettable methods implementation have to looks this (methods are cal=
led
with iothread locked):
```
void init_phase(Device *dev, bool cold)
{
    /* call sub-resettable init phases */

    dev->resetting +=3D 1;
    /* do local init phase (eg: state reset) */
}
void hold_phase(Device *dev)
{
    /* call sub-resettable hold phases */

    /* do local hold phase (eg: set some I/O level) */
}
void exit_phase(Device *dev)
{
    /* call sub-resettable exit phases (independently of resetting value =
since,
       every resettable have its own resetting counter) */
  =20
    dev->resetting -=3D 1;
    if (dev->resetting =3D=3D 0) {
        /* do local exit phase (eg: set some I/O level) only if the devic=
e is
           really leaving the resetting state */
    }
}
```
Since I don't think specialization should care about sub-resettable and t=
he
resetting counter, I've added the local init/hold/exit phases as DeviceCl=
ass
methods.
Otherwise, I see two other solutions:
+ keep the interface as it is
+ add some state knowledge in the interface (with some kind of get_state =
method)
  so that resetting counter and some kind of sub-resettable list are hand=
led in
  the common code in the interface. The 3 methods will then handle only t=
he local
  actions.
+ have 6 methods in the interface, one for the local actions, one for the
  sub-resettable so that sub-resettable is not handled in the common code=
. And we
  need also a get_resetting method to access/update the counter.

#DEVICE RESET CHOICE

The Device is a special case, it has 2 reset entry point: `qdev_reset_all=
` and
`device_reset`. The latter doing a device reset only, while the former al=
so
reset all buses hierarchy under the device.

I choose the put the sub-buses into the device reset domain, so that the
behavior of the resettable interface on Device is the same as qdev_reset_=
all.
I don't know if `device_reset` has some real meaning (resetting only the
Device). It is not often used and I think every time it is used there is =
no
sub-buses so the behavior is the same for both functions.

If I am mistaken about putting buses into device reset domain, it is poss=
ible
to make a special bus-hierarchy-reset-domain for every Device/Bus that di=
ffers
from the Resettable interface on Device/Bus.

# SYSBUS SUPPORT

Regarding the sysbus support Edgar mentioned in the prevous discussion: I=
n this
series, there is no support in sysbus base class for disabling memory reg=
ions.
Having each sysbus device specialization, in every memory region handler,=
 to
check if `resetting` is set or not is not user-friendly. But for we can't=
=20
modify memory region `enabled` flags since devices may already set/unset =
them.
Maybe we could have some kind of super-switch to disable all memory regio=
ns in
a sysbus device but I don't know how this could be done.

The series is organised as follow:
Patches 1 and 2 adds Resettable interface and ResetDomain object.
Patches 3 to 7 converts Device and Bus to Resettable.
Patches 8 to 12 handles the global system reset domain
Patches 13 to 17 do the zynq implementation (patch 13 is an already-revie=
wed
patch from the clock api patch series)

Thank you for your feedback,
Damien

Damien Hedde (17):
  Create Resettable QOM interface
  Create the ResetDomain QOM object
  make Device and Bus Resettable
  Add local reset methods in Device class
  add vmstate description for device reset state
  Add function to control reset with gpio inputs
  convert qdev/bus_reset_all to Resettable
  Add a global ResetDomain object for system emulation
  global ResetDomain support for legacy reset handlers
  Delete the system ResetDomain at the end of emulation
  Put orphan buses in system reset domain
  Put default sysbus in system reset domain
  hw/misc/zynq_slcr: use standard register definition
  convert cadence_uart to 3-phases reset
  Convert zynq's slcr to 3-phases reset
  Add uart reset support in zynq_slcr
  Connect the uart reset gpios in the zynq platform

 hw/arm/xilinx_zynq.c           |  14 +-
 hw/char/cadence_uart.c         |  48 ++-
 hw/core/Makefile.objs          |   3 +
 hw/core/bus.c                  |  64 +++-
 hw/core/qdev-vmstate.c         |  27 ++
 hw/core/qdev.c                 | 166 ++++++++++-
 hw/core/reset-domain.c         | 121 ++++++++
 hw/core/reset.c                | 149 +++++++++-
 hw/core/resettable.c           |  69 +++++
 hw/misc/zynq_slcr.c            | 515 ++++++++++++++++++---------------
 include/hw/char/cadence_uart.h |  10 +-
 include/hw/qdev-core.h         |  97 +++++++
 include/hw/reset-domain.h      |  49 ++++
 include/hw/resettable.h        |  83 ++++++
 include/sysemu/reset.h         |  47 +++
 vl.c                           |   3 +-
 16 files changed, 1195 insertions(+), 270 deletions(-)
 create mode 100644 hw/core/qdev-vmstate.c
 create mode 100644 hw/core/reset-domain.c
 create mode 100644 hw/core/resettable.c
 create mode 100644 include/hw/reset-domain.h
 create mode 100644 include/hw/resettable.h

--=20
2.21.0

