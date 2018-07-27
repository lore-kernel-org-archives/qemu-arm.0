Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp783183wru;
        Fri, 27 Jul 2018 07:43:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdkrG5fGPYo2rfNm0blZt+eWMh6UQe9Fn7Lqr2PPsVgkwQf5lknLBsxmsrkWTCL7eJ8bTH0
X-Received: by 2002:a37:a650:: with SMTP id p77-v6mr6357702qke.256.1532702622758;
        Fri, 27 Jul 2018 07:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532702622; cv=none;
        d=google.com; s=arc-20160816;
        b=F0wJgk3O5vHr3XAQAmhoA+ruwsRkku+J9QJ3+50P0vQXbb+rD/qBJYjCcdA8MO8FEx
         PE+ogIjOOgKI5udDD6pTMGpXlDJp7QJeehfJKrrBh/p8OaIrzKK7hPyHAyUGnGEPwcXB
         Tvggd5d8aUT+ivCbIwaCDSq6ccXo57AzJNoSS320ljZTefPI1SkqI9ClGTxXs/N6MeQM
         rRGPKTKsxU0CiRJwcAPAP8bxLx6J7iX5/rYR2f9woKYXRQK9YBVyeUoS9SmbFL5FcbJr
         winQVugfZbOuxS9jH0Gr1EixqjlJ3y86AVK5uwQL31IA6mZoUfu+gvSagoosAHIgLBTW
         umRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=YLvHHdCORB3jDisQPPjtxFHmFLVwDTx7X8HncYmyd6c=;
        b=NoTdNKKHnIlVYuRTd/Y+UcdZajUJ24+80G7D/vyTf0l9kz4QcJw4g2sSrWLvO4E8rA
         zl4NtMEajdojE1yijS7d/kXugi/h5zUTc1ZeDEMYrZHskFEcMDmP9II9q1oYNReqroku
         wNdhE467Eq1hQgkFkN5tAiq72BrzacwYjJgvhJSb9t4rnJJJVW/vLIa0q6WD8PQrT4JP
         Ge/6rkqL85u+b36JeVVIQJyaf/FPHmcs7E9ceqXBE1mNDclkY1Y4XSjnltQxvzmvCVNu
         DiBZBE/YH1EY1xMjTARthkDEItbQOn1ld2etJxyX3ggSsB896Yc9sXkNyeeKqoz8PSYM
         mqmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YFia5PFv;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gvzxIhcN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gvzxIhcN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1-v6si547832qvn.128.2018.07.27.07.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 07:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YFia5PFv;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gvzxIhcN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gvzxIhcN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj3y2-0008Lc-Aa
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:43:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sF-0003Ee-2w
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 10:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sB-0008DS-TE
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 10:37:43 -0400
Received: from greensocs.com ([193.104.36.180]:50604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1fj3sB-0008Ad-Ff; Fri, 27 Jul 2018 10:37:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 61D094434A7;
	Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702250;
	bh=oKkibQCsQWapdPkP4zGCcL7dmTPjrZpJ/zBixSp29OY=;
	h=From:To:Cc:Subject:Date;
	b=YFia5PFvBPZVi9f7X4EwYr8YTr5fzQ2lDtFwNvfqMbN2ujv3NOpp8qN/IbLwkq26f
	TwaPfViPGyup3SmnHv0tcZzN0yAQbtNIkdTCxkolbziAxgE/Q67m6CK1XtzuxmE+vl
	Rw9bNumQdPPaHPf93CE0T5QBEVpT4wQOpkgrVrp0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gvzxIhcN;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gvzxIhcN
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpAR8q9YXP2B; Fri, 27 Jul 2018 16:37:29 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8AE98428994; Fri, 27 Jul 2018 16:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702249;
	bh=oKkibQCsQWapdPkP4zGCcL7dmTPjrZpJ/zBixSp29OY=;
	h=From:To:Cc:Subject:Date;
	b=gvzxIhcNCrrflPQlf32RuBvEkJg4l488vKEno0DTdcnrkUtvATDsu8HJ2QkHmitHL
	iZWZfk47D2fE9VOyXgAcS9PG6DdNcA8QOSK5MjNRsLQPIZSDAj+3gM2FQNC55CXE3+
	gIRJxQUaHPOIJJceXVLdIIuNsZwfq7nBDydQkljs=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 20713400DC8;
	Fri, 27 Jul 2018 16:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702249;
	bh=oKkibQCsQWapdPkP4zGCcL7dmTPjrZpJ/zBixSp29OY=;
	h=From:To:Cc:Subject:Date;
	b=gvzxIhcNCrrflPQlf32RuBvEkJg4l488vKEno0DTdcnrkUtvATDsu8HJ2QkHmitHL
	iZWZfk47D2fE9VOyXgAcS9PG6DdNcA8QOSK5MjNRsLQPIZSDAj+3gM2FQNC55CXE3+
	gIRJxQUaHPOIJJceXVLdIIuNsZwfq7nBDydQkljs=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 16:37:19 +0200
Message-Id: <cover.1532701430.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 27 Jul 2018 10:38:41 -0400
Subject: [Qemu-arm] [RFC PATCH 0/6] Clock and power gating support
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
	pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUe8cL2CEIj0

This set of patches add support for power and clock gating in device objects.
It adds two booleans to the state, one for power state and one of clock state.

The state is controlled trough 2 functions, one for power and one for clock.
Two new methods *power_update* and *clock_update* is added to the device class
which are called on state change and can be overriden.

Default behavior is the following:
+ Device are initialized in powered and clocked state.
+ reset method is called when powering-up.

This set also implements this support in the cadence_uart device in the
xilinx_zynq platform as an example.

The 1st patch add the gating support to the base device object. The 2nd patch
add functions to act on a whole bus tree. The 3rd patch overrides the 
*power/clock_update* methods for sysbus devices to enable/disable the memory
regions according to the state.

The 4th patch updates the cadence_uart device and the 5th patch adds
uart clock gating support to the zynq clock controller *slcr*. The 6th patch
finally adds the support to *xilinx-zynq* machine.

This is an RFC as it remains open questions about the strategy to implement
this kind of support. Here's some remarks:

+ This set adds power and clock, some reset state could be added too. Although
  default behavior is tricky to implement because there is many kind of reset
  (eg syncronous/asynchronous).
+ I used methods which require to store links of controlled devices in
  clock/power controller. Using gpios or specifics child objects to
  achieve the same functionnaly is possible.
+ Power and clock state could be merged to a single 3-state (powered-off,
  unclocked, on) since clock does not really matters when powered-off.
+ Regarding migration, it's problematic to add the VMStateDescription in qdev
  so we let it to the specialization (eg in cadence_uart) to handle it. Is
  this a problem ? Anyway support of clock gating requires modification in
  specialization. It may not be necessary to store the gating states in each
  device, since it is stored already in the controller registers. But we would
  then have to set the gating state of devices in the controller's post_load
  which may occurs before or after devices VMState load: It seems tricky to
  ensure device state is correct at the end if gating update do side-effects.
+ theses patches add a simple vision (1 power, 1 clock). Devices can be more
  complex. For example, the zynq's uart has 2 independant clock domains:
  1 for the bus interface, 1 for uart operations. I'm not sure if we should
  keep 1, add the bus/device separation or do something more configurable on
  a per-specialization basis.

Feel free to comment,

Damien Hedde (6):
  qdev: add a power and clock gating support
  qdev: add power/clock gating control on bus tree
  sysbus: Specialize gating_update to enable/disable memory regions
  cadence_uart: add clock/power gating support
  zynq_slcr: add uart clock gating and soft reset support
  xilinx_zynq: add uart clock gating support

 include/hw/qdev-core.h |  50 ++++++++++++++++++++
 include/hw/sysbus.h    |   3 ++
 hw/arm/xilinx_zynq.c   |  20 +++++---
 hw/char/cadence_uart.c |  25 +++++++++-
 hw/core/qdev.c         | 103 +++++++++++++++++++++++++++++++++++++++++
 hw/core/sysbus.c       |  39 ++++++++++++++++
 hw/misc/zynq_slcr.c    |  63 +++++++++++++++++++++++++
 7 files changed, 296 insertions(+), 7 deletions(-)

-- 
2.18.0

