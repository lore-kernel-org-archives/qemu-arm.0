Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5139826wrt;
        Tue, 2 Oct 2018 07:44:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62F981RA9YN2yh3HlxnWMSDi/OlK5gEwM6eskIYUC57sF6/xB8VDoQR3c0Tpy37ELH1WO9v
X-Received: by 2002:aed:2dc6:: with SMTP id i64-v6mr1687869qtd.229.1538491459418;
        Tue, 02 Oct 2018 07:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491459; cv=none;
        d=google.com; s=arc-20160816;
        b=hSNzLB1QdRpXCbR0XXTtHSqA6Eap/lkByJEGnNiNsv1p953zTSOBuEiEITYMyn73om
         eJKJJ0N9BVyeYC4VbDHS8ugMyRlzZ9rGg/b93+h7tdqaPStNWH3oQmegqzjRwhz+/jUX
         m0k4v89Gs33E9cslcuJ9+CNdu/HhBRa6YIl1UADLZ+RZbBW8w+zeU8G83pkGbl5EDZ6W
         Zrunwp+IO8Xo6hkREdHM5H4yt9YycPB0fCF63BBgtzefFX8uuRy9580x/pTntI4sEXVe
         xaQslxPcMyY1AnLGrFQkf7VuWIjMziIeIcTnmt0nO7aUFP3Po8Vao6ucZoiyXteikqhV
         SfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=I9ZLj/NtS0kdQltuO8Q8MPhEXzxFbDeAzYaPbgAb2g8=;
        b=UrCW/IhzsBIMrNpRMZtCsacUcSJlNheE8EuA1RGsZDAX9o5tb1zzNLvG+ySQ9vcI+q
         Y4sgLJE91WVBmobwSit97b86KVI4jpLDcIcijpHgjet0nOPsKsaeMMGV55p+mKWZ3n//
         EJR3xgq3aYDLsGiWG4i0Dy9C9EfJV6sc+zFGL3fqPMYTSTwsXqKe/0wpG8DOgyKAk772
         Wrn58Sa76F3Le844T30Jm571vGAzYJcgjiigOb06Zmq3x9J9ST+BSxu53a8BfN4y+2iq
         qPcsFxRraEfTaRuwO+lQzg67dl6QlDe+O9QfbxsqsChAgekocX9awZN1KWXFeVnKILTX
         zSSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="RD5P+Te/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ta+Iw0T4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ta+Iw0T4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w31-v6si7030617qvc.31.2018.10.02.07.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="RD5P+Te/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ta+Iw0T4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ta+Iw0T4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7LuM-00040v-Mh
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:44:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmx-0005FG-BF
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 10:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdA-0004OS-2R
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 10:26:34 -0400
Received: from greensocs.com ([193.104.36.180]:53817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7Ld9-0004Kx-I1; Tue, 02 Oct 2018 10:26:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 066EB442AFA;
	Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490365;
	bh=Rj+LQKOr/CARHnnwCLgfILflgsrhF78CdLwcQENxrts=;
	h=From:To:Cc:Subject:Date;
	b=RD5P+Te/7L6GI/RqijdlAw5OcynmZ90meyuU3xO2JIxrpSAY8KyuUl5A+B+SNK3QW
	fNeAD2JNvBVuF8wz/puWx14I8v7hM3rY9YDWisb4AFkrlGRr/xhfZYA+dz/S/SeSe9
	KV6pJ6bFTXPf60nMgo0CetePcBAs5IL3Ohs6jj9Y=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Ta+Iw0T4;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Ta+Iw0T4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LB0CuEOOwpsE; Tue,  2 Oct 2018 16:26:03 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E06BC442ADA; Tue,  2 Oct 2018 16:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490363;
	bh=Rj+LQKOr/CARHnnwCLgfILflgsrhF78CdLwcQENxrts=;
	h=From:To:Cc:Subject:Date;
	b=Ta+Iw0T4NdkMe1+AsSvnQoXcW7d764Wld56lviOy9SLgNZezbOLyEhFNEgR56spKU
	MPGFZfF6ujUn2qAl/qwXwHmAroPM806V9kGvXAJc8obqesRbdEUEAr+mL44MBebQoP
	3CZfaJzPdLRtuO8ZmP/ziKoAsPTZUxbveoFppOi8=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 753F0442AEC;
	Tue,  2 Oct 2018 16:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490363;
	bh=Rj+LQKOr/CARHnnwCLgfILflgsrhF78CdLwcQENxrts=;
	h=From:To:Cc:Subject:Date;
	b=Ta+Iw0T4NdkMe1+AsSvnQoXcW7d764Wld56lviOy9SLgNZezbOLyEhFNEgR56spKU
	MPGFZfF6ujUn2qAl/qwXwHmAroPM806V9kGvXAJc8obqesRbdEUEAr+mL44MBebQoP
	3CZfaJzPdLRtuO8ZmP/ziKoAsPTZUxbveoFppOi8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:34 +0200
Message-Id: <20181002142443.30976-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 0/9] Clock framework API.
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r4STcLT9ZZIH

This series aims to add a way to model clocks in qemu between devices.
This allows to model the clock tree of a platform allowing us to inspect =
clock
configuration and detect problems such as disabled clock or bad configure=
d
pll.

This series is a reroll of the v4 sent recently without the reset feature=
 as
requested by Peter. I also took into account the reviews about migration =
and
other suggestions.

This framework was originally discussed in 2017, here:
https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg07218.html

For the user, the framework is now very similar to the device's gpio API.
Clocks inputs and outputs can be added in devices during initialization p=
hase.
Then an input can be connected to an output: it means every time the outp=
ut
clock changes, a callback in the input is triggered allowing any action t=
o be
taken. A difference with gpios is that several inputs can be connected to=
 a
single output without doing any glue.

Behind the scene, there is 2 objects: a clock input which is a placeholde=
r for
a callback, and a clock output which is a list of inputs. The value trans=
ferred
between an output and an input is an integer representing the clock frequ=
ency.
The input clock callback is called every time the clock frequency changes=
.
The input side holds a cached value of the frequency (the output does not=
 need
one). This allows a device to fetch its input clock frequency at any time
without caching it itself.

This internal state is added to handle migration in order not to update a=
nd
propagate clocks during it (it adds cross-device and order-specific effec=
ts).
Each device handles its input clock migration by adding the clock frequen=
cy in
its own vmstate description.

Regarding the migration strategy, discussion started in the v4 patches.
The problem is that we add some kind of wire between different devices an=
d=20
we face propagation issue.
The chosen solution allows migration compatibility from a platform versio=
n
with no implemented clocks to a platform with clocks. A migrated device t=
hat
have a new input clock is responsible to initialize its frequency during
migration. Each input clock having its own state, such initialization wil=
l not
have any side-effect on other input clock connected to the same output.
Output clocks, having no state, are not set during migration: If a clock =
output
frequency changes due to migration (eg: clock computation bug-fix), the e=
ffects
will be delayed. Eventually the clock output will be updated after migrat=
ion if
some (software) event trigger a clock update, but it can not be guarantee=
d.

There is also the problem of initialization which is very much like the
migration. Currently, in the zynq example, clocks outputs are initialized=
 in
the clock controller device_reset. According to Peter, outputs should not=
 be
set in device_reset, so we need a better way.

It is not simple, since we can have complicated cases with several propag=
ation
step.
We can't initialize outputs (without propagating) during device init and =
uses
inputs value in device_reset to complete the initialization.
Consider the case where we have a device generating a frequency, another =
device
doing a clock division, then a device using this clock.
[DevClockGenerator] -> clk1 -> [DevClockDiv] -> clk2 -> [Dev]
I don't see how we can handle such initialization without doing some
propagation phase at some point.

Regarding clock gating. The 0 frequency value means the clock is gated.
If need be, a gate device can be built taking an input gpio and clock and
generating an output clock.

I've tested this patchset running Xilinx's Linux on the xilinx-zynq-a9 ma=
chine.
Clocks are correctly updated and we ends up with a configured baudrate of=
 115601
on the console uart (for a theoretical 115200) which is nice. "cadence_ua=
rt*" and
"clock*" traces can be enabled to see what's going on in this platform.

We are considering switching to a generic payload evolution of this API.
For example by specifying the qom carried type when adding an input/outpu=
t to
a device. This would allow us, for example, to add a power input port to =
handle
power gating or others ports without modifying the device state structure=
.

Any comments and suggestion are welcomed.

The patches are organised as follows:
+ Patches 1 to 4 adds the clock support in qemu.
+ Patch 5 add some documentation in docs/devel
+ Patches 6 to 9 adds the uart's clocks to the xilinx_zynq platform as an
example for this framework. It updates the zynq's slcr clock controller, =
the=20
cadence_uart device, and the zynq toplevel platform.

Compared to v4, the changes are:
  - no more reset flag, we are talking frequency only here
  - name changes to better match gpio api
  - migration strategy change
  - sysbus patch removed (was becoming complicated due too migration chan=
ges)

Compared to v3, the following notable changes happen:
  - Bindings are now fixed during machine realisation,
  - Input clock objects have been removed from the point of view of the
user, i.e. nothing need to be added in the device state. A device can
now declare a input clock by calling qdev_init_clock_in() (similarly of
what is done for GPIOs),
  - Callbacks called on clock change now return void. The input owner is
responsible of making necessary updates accordingly (e.g. update another
clock output, or modify its internal state) (again, mostly like GPIOs).

Thanks to the Xilinx QEMU team who sponsored this development.


Damien Hedde (9):
  hw/core/clock-port: introduce clock port objects
  qdev: add clock input&output support to devices.
  qdev-monitor: print the device's clock with info qtree
  qdev-clock: introduce an init array to ease the device construction
  docs/clocks: add device's clock documentation
  hw/misc/zynq_slcr: use standard register definition
  hw/misc/zynq_slcr: add clock generation for uarts
  hw/char/cadence_uart: add clock support
  hw/arm/xilinx_zynq: connect uart clocks to slcr

 docs/devel/clock.txt           | 163 +++++++++
 Makefile.objs                  |   1 +
 include/hw/char/cadence_uart.h |   3 +
 include/hw/clock-port.h        | 136 ++++++++
 include/hw/qdev-clock.h        | 129 +++++++
 include/hw/qdev-core.h         |  14 +
 include/hw/qdev.h              |   1 +
 hw/arm/xilinx_zynq.c           |  17 +-
 hw/char/cadence_uart.c         |  92 ++++-
 hw/core/clock-port.c           | 159 +++++++++
 hw/core/qdev-clock.c           | 166 +++++++++
 hw/core/qdev.c                 |  29 ++
 hw/misc/zynq_slcr.c            | 607 ++++++++++++++++++++-------------
 qdev-monitor.c                 |  12 +
 hw/char/trace-events           |   3 +
 hw/core/Makefile.objs          |   3 +-
 hw/core/trace-events           |   7 +
 17 files changed, 1289 insertions(+), 253 deletions(-)
 create mode 100644 docs/devel/clock.txt
 create mode 100644 include/hw/clock-port.h
 create mode 100644 include/hw/qdev-clock.h
 create mode 100644 hw/core/clock-port.c
 create mode 100644 hw/core/qdev-clock.c
 create mode 100644 hw/core/trace-events

--=20
2.19.0

