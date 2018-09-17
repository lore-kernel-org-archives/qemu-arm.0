Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655873wrd;
        Mon, 17 Sep 2018 01:42:58 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ1qp3Lz+CKCiUWF/jJhcLITfmIJM3nv7LZg/Nh/IdSHEEiQ3ao6CHGHjnCOSOD42UhVUGq
X-Received: by 2002:aed:3f22:: with SMTP id p31-v6mr16462980qtf.185.1537173778340;
        Mon, 17 Sep 2018 01:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173778; cv=none;
        d=google.com; s=arc-20160816;
        b=M5iiZCZhMPH7FYqceFia0SxVM8P4inP/3Kv2FH/qxNgORRSFzNdzSFzaqDeUjbWgZ/
         Ts4aiMtHRnBI+fYtdo+fwvK4PwzUNo9ZBCm3MVEOYnMwWEMWh0mz7zUbXh7OWyiJrJ72
         U4u9MGE3M4OsHDxrcUJW1/vVKjpN7CrLKVrq4xkbGvqft2BoK0ZsrWVb8k5WcI/Fv806
         Or6iMs30iJ4LQiZwEgseGtwPj/Qo5ar8pqBB8c54oDMd8Llm9fEwU4Cl8mHr381/Qnv2
         sg7Qv0VTVskDNP744MNIs2WD37HXqmnEhWDFPqUhy/sslyuNoDkRgjwsq0fe7auoqAST
         1JQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=e0AlLtXtpt7ckXqqtBRaq2urqalEDW79N3na7ZbfxEc=;
        b=Xe8ZhRmV9xDBxCIQtjMyippP3AvIIPqzlOxErrnwEaYr2amFU4Ms8nVZ0Q5/TY2JtW
         nIM03AG7bqSzWA+o9oH06TSxNIn2+lFBJQwR+8jfuueCy04DLHyZoIHLlUPGsUMY/fKG
         Tg5WKJOnxHj4SV2AXkPZPI3lQZyW7cjyLCqAJ2KVzy+lmW2fLUZJrAMx8xYybFnFnPof
         k7rgq5VHyytZK94HA/zlynF8nmTR59TOfEW20WrYHUwlNt/xZJqdrYT50AtHUtx3ss79
         elrUjNJ75/SjpLfI5C+Ywir4B0AoUYDvSMuWTnlHCXie6mpUNOv2YKsxyF1IyuKS5h9n
         kdpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YYfRC5aB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=niD2QUNx;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=niD2QUNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c66-v6si1115029qkb.392.2018.09.17.01.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YYfRC5aB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=niD2QUNx;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=niD2QUNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p7R-0007Nb-PQ
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069P-TJ
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5p-0005V2-LB
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51709)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5o-0005TL-Vi; Mon, 17 Sep 2018 04:41:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9B0B1521A8B;
	Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173668;
	bh=G3V08Pd8CExDt3vE7KWZVAcf+teFqN+gTkEUW2F0Ul4=;
	h=From:To:Cc:Subject:Date;
	b=YYfRC5aBLL8uJ6803ONYonEbSr+PGFJyizsn5JfX9+zOt7jSSxkMc+/9x3x4dug5k
	GgDJY2hOg1zCkNCkdMSbTPj3Y/meINX1EV6RoYS7I1MyA3Bq2lgOjMlSJ6FzcpI7c8
	/M3QjE25vNxnfiPudPmUIQPyFpTWehqZYhlSpqAI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=niD2QUNx;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=niD2QUNx
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCatboRPb-gw; Mon, 17 Sep 2018 10:41:07 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 876F423878C; Mon, 17 Sep 2018 10:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173667;
	bh=G3V08Pd8CExDt3vE7KWZVAcf+teFqN+gTkEUW2F0Ul4=;
	h=From:To:Cc:Subject:Date;
	b=niD2QUNxA5LF7b004/83/Wyt6sR2O8V6Gxo8OvHjCzQro6Ci80gJgQgsv44isyf5Y
	khCAEkVkmI2I3dgfEGSCImfJFWNnLQTX0ib8aipJTIFdUeEH5ymGNq7RiEIc5uq9Hu
	wgKMfU7u86J+D0ypfq7i8kqnjbgvWl3iXpkIZ+zw=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1FDE02386FB;
	Mon, 17 Sep 2018 10:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173667;
	bh=G3V08Pd8CExDt3vE7KWZVAcf+teFqN+gTkEUW2F0Ul4=;
	h=From:To:Cc:Subject:Date;
	b=niD2QUNxA5LF7b004/83/Wyt6sR2O8V6Gxo8OvHjCzQro6Ci80gJgQgsv44isyf5Y
	khCAEkVkmI2I3dgfEGSCImfJFWNnLQTX0ib8aipJTIFdUeEH5ymGNq7RiEIc5uq9Hu
	wgKMfU7u86J+D0ypfq7i8kqnjbgvWl3iXpkIZ+zw=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:06 +0200
Message-Id: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 00/10] Clock framework API.
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
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eF/nZPKJemJd

From: Damien Hedde <damien.hedde@greensocs.com>

This series corresponds to the v4 of "clock framework api" patches
which were discussed in 2017, here:
https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg07218.html

It is a big refactoring trying to respond to comments and to integrate the
clock gating cases I sent recently here:
https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg05363.html
Note that, for now, the power cases are not considered in this patchset.

For the user, the framework is now very similar to the device's gpio API.
Clocks inputs and outputs can be added in devices during initialization phase.
Then an input can be connected to an output: it means every time the output
clock changes, a callback in the input is trigerred allowing any action to be
taken. A difference with gpios is that several inputs can be connected to a
single output without doing any glue.

Compared to v3, the following notable changes happen:
  - Bindings are now fixed during machine realisation,
  - Input clock objects have been removed from the point of view of the
user, i.e. nothing need to be added in the device state. A device can
now declare a input clock by calling qdev_init_clock_in() (similarly of
what is done for GPIOs),
  - Callbacks called on clock change now return void. The input owner is
responsible of making necessary updates accordingly (e.g. update another
clock output, or modify its internal state) (again, mostly like GPIOs).
  - For now, internal state have been removed. It could re-added as a
cached value to print it in info qtree, or to avoid unnecessary updates.

Behind the scene, there is 2 objects: a clock input which is a placeholder for
a callback, and a clock output which is a list of inputs. The value transferred
between an output and an input is a ClockState which contains 2 fields:
  - an integer to store the frequency
  - a boolean to indicate whether the clock domain reset is asserted or not
The reset flag has been added because it seems both signals are closely
related and very often controlled by the same device.

Regarding the migration strategy, clocks do not hold the clock state
internally, so there is nothing to migrate there. The consequence is that
a device must update its output clocks in its post_load to propagate the
migrated clock state. This allows migration from old-qemu-with-no-clock
to new-qemu-with-clock-support: newly added clocks will be correctly
initialized during migration.
But it is more complex for input clocks handling: there is no order
guarantee between a device state migration and the update of its inputs clocks
which will occur during other device state migrations.
I think that, for most the cases, this does not rise problems, although there
might be some jitter/glitch during migration before hitting the right value
(with consequences such as the baudrate of a character device changing several
times during migration, I don't think it is a problem but may well be wrong
here).

For example, if we have 2 devices A and B with a clock between them:
| dev A  clk|>----->| dev B |
There is 2 migration scenarios (this can happen in our example implementation
between the slcr and cadence_uart devices):
  1. A before B:
     - A is migrated:
        + A's state is loaded
        + A's post_load restore the clock which is propagated to B
        + B reacts to the clock change (eg: update serial baudrate with
        migrated clock value but old B state)
     - B is migrated:
        + B's state is loaded
        + B's post_load reacts to new B's state (eg: update serial baudrate
        to the final right value)
  2. B before A:
     - B is migrated:
        + B's state is loaded
        + B's post_load reacts to ne B's state (eg: update serial baudrate with
        migrated B state but old clock value)
     - A is migrated:
        + A's state is loaded
        + A's post_load restore the clock which is propagated to B
        + B reacts to the clock change (eg: update serial baudrate to the final
        right value)

Regarding clock gating. The 0 frequency value means the clock is gated.
If need be, a gate device can be built taking an input gpio and clock and
generating an output clock.

We are considering switching to a generic payload evolution of this API.
For example by specifying the qom carried type when adding an input/output to
a device. The current implementation is poorly dependent on what the data type
is since only pointers are transferred between output and inputs. Changes would
probably be minor.
This would allow us, for example, to add a power input port to handle power
gating. We could also have the basic clock port (frequency-only) and the one we
have here (frequency-reset).

Concerning this frequency-reset port, we can obviously go back to the simple 
frequency-only one if you think it is not a good idea.

I've tested this patchset running Xilinx's Linux on the xilinx-zynq-a9 machine.
Clocks are correctly updated and we ends up with a configured baudrate of 115601
on the console uart (for a theorical 115200) which is nice. "cadence_uart*" and
"clock*" traces can be enabled to see what's going on in this platform.

Any comments and suggestion are welcomed.

The patches are organised as follows:
+ Patches 1 to 4 adds the clock support in qemu.
+ Patch 5 add some documentation in docs/devel
+ Patch 6 adds support for a default clock in sysbus devices which control
the mmios visibility.
+ Patches 7 to 10 adds the uart's clocks to the xilinx_zynq platform as an
example for this framework. It updates the zynq's slcr clock controller, the 
cadence_uart device, and the zynq toplevel platform.

Thanks to the Xilinx QEMU team who sponsored this development.

Damien Hedde (10):
  hw/core/clock-port: introduce clock port objects
  qdev: add clock input&output support to devices.
  qdev-monitor: print the device's clock with info qtree
  qdev-clock: introduce an init array to ease the device construction
  docs/clocks: add device's clock documentation
  sysbus: add bus_interface_clock feature to sysbus devices
  hw/misc/zynq_slcr: use standard register definition
  hw/misc/zynq_slcr: add clock generation for uarts
  hw/char/cadence_uart: add clock support
  hw/arm/xilinx_zynq: connect uart clocks to slcr

 docs/devel/clock.txt           | 144 ++++++++
 Makefile.objs                  |   1 +
 include/hw/char/cadence_uart.h |   2 +
 include/hw/clock-port.h        | 153 ++++++++
 include/hw/qdev-clock.h        | 129 +++++++
 include/hw/qdev-core.h         |  14 +
 include/hw/qdev.h              |   1 +
 include/hw/sysbus.h            |  22 ++
 hw/arm/xilinx_zynq.c           |  17 +-
 hw/char/cadence_uart.c         |  73 +++-
 hw/core/clock-port.c           | 145 ++++++++
 hw/core/qdev-clock.c           | 166 +++++++++
 hw/core/qdev.c                 |  29 ++
 hw/core/sysbus.c               |  25 ++
 hw/misc/zynq_slcr.c            | 637 ++++++++++++++++++++-------------
 qdev-monitor.c                 |   6 +
 hw/char/trace-events           |   3 +
 hw/core/Makefile.objs          |   3 +-
 hw/core/trace-events           |   6 +
 19 files changed, 1324 insertions(+), 252 deletions(-)
 create mode 100644 docs/devel/clock.txt
 create mode 100644 include/hw/clock-port.h
 create mode 100644 include/hw/qdev-clock.h
 create mode 100644 hw/core/clock-port.c
 create mode 100644 hw/core/qdev-clock.c
 create mode 100644 hw/core/trace-events

-- 
2.18.0

