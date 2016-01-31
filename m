Received: by 10.25.159.19 with SMTP id i19csp1938283lfe;
        Sun, 31 Jan 2016 08:16:50 -0800 (PST)
X-Received: by 10.140.140.6 with SMTP id 6mr23652749qhm.29.1454257010764;
        Sun, 31 Jan 2016 08:16:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c69si25267091qkb.11.2016.01.31.08.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Jan 2016 08:16:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPugD-000563-RW
	for alex.bennee@linaro.org; Sun, 31 Jan 2016 11:16:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPufT-0004FZ-Fx
	for qemu-devel@nongnu.org; Sun, 31 Jan 2016 11:16:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPufQ-0000sA-9S
	for qemu-devel@nongnu.org; Sun, 31 Jan 2016 11:16:03 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPufQ-0000s6-0k; Sun, 31 Jan 2016 11:16:00 -0500
Received: by mail-lf0-x242.google.com with SMTP id j99so4186472lfi.2;
	Sun, 31 Jan 2016 08:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FFqZGkYlxElKDFIVl6ig1vPJVBpPsV4tFFui0hhiJDM=;
	b=Q55O31ev0ZwwUQGYkmFyx1MA6vJi/nEYZbdB5hsc8h7w+xgvO7Uk2r1J68bvMEnliu
	1kjKBexvFqPQ+l4aB0nG33rhs94738ITplhHqPfvM5Xou7Ta3btPzZMoJompQtIQ24AS
	dgrkHc8Jlaf3/ZysjlxhdUloOH7rxziImPy0NVHTenMtgHqxLKaQfQJHiht+AH8UECML
	fXFA1poEPLSHam9u/m2Ih86UkpckjeBXfUmkVTOA+Km3yUFnfknFm17z2xmjUp7+R+Sl
	368yQwTucyvqe1huCev606RHrF2aK8Q/og/GOunuyS9Dky7T/WKETuPqNzZRMfAdDC+Y
	8cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FFqZGkYlxElKDFIVl6ig1vPJVBpPsV4tFFui0hhiJDM=;
	b=Mx9GxQ3G61NspIrYhI1s4iOR4gVlmY06yhG9mpHZQexfetsP1FH0sU7V5yrc4IiFzC
	Bk3hhXFqiXPHtRZP7OvEL6Ku8MW6NLlH62q7W0HhhkRFzIO20ZHAp8KFGHXHm4o+QeWa
	6SfgORKr2zPfTWNw8aLEHAd445iiXC7I2x4ki7QJTPCQ+5sctP0Z40FBqfqX4pwAMBqO
	T/mRhYogJDEF4PRe3r7/BBD+BoP1ZWd4AsGRAQKukDRW4CQ2AkpJZ224uugshlcDKF2r
	llnv6Qu2PvIXsTkmhruiNHzCVUB4O75XD91aLH7UvfHgkDtvsMdNMtuPCIkxXm4c0Mnz
	N4tQ==
X-Gm-Message-State: AG10YOTmR/w5KCRtjF7KQ+yxCz2tQoyKX6a1YbXbb7NezdB1i8YErtph8mOm8MDUPLEReg==
X-Received: by 10.25.24.82 with SMTP id o79mr6884483lfi.144.1454256959226;
	Sun, 31 Jan 2016 08:15:59 -0800 (PST)
Received: from sfedorov-laptop.Dlink (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.gmail.com with ESMTPSA id
	zu7sm3418454lbb.36.2016.01.31.08.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 08:15:57 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 31 Jan 2016 19:15:46 +0300
Message-Id: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Sergey Fedorov <serge.fdrv@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-devel] [PATCH v3 0/2] Architectural watchpoint check
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qYJdE1HAeKxC

This series is intended to fix ARM watchpoint emulation misbehavior.
QEMU hangs when QEMU watchpoint fires but it does not pass additional
architectural checks in ARM CPU debug exception handler. For details,
please see individual patches. The most relevant parts of the original
discussion about ARM breakpoint and watchpoint emulation misbehavior can be
found at:
https://lists.gnu.org/archive/html/qemu-devel/2015-08/msg02715.html
https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg00527.html

Changes in v2:
 * Check moved before setting cpu->watchpoint_hit
 * Pointer to watchpoint being checked passed to debug_check_watchpoint()
   callback
 * BP_WATCHPOINT_HIT flag cleared from flags from wp->flags in no-fire case
 * Comment for debug_check_watchpoint() callback improved


Sergey Fedorov (2):
  cpu: Add callback to check architectural watchpoint match
  target-arm: Implement checking of fired watchpoint

 exec.c                 |  6 ++++++
 include/qom/cpu.h      |  4 ++++
 qom/cpu.c              |  9 +++++++++
 target-arm/cpu.c       |  1 +
 target-arm/internals.h |  3 +++
 target-arm/op_helper.c | 35 +++++++++++++++++++++--------------
 6 files changed, 44 insertions(+), 14 deletions(-)

-- 
1.9.1

