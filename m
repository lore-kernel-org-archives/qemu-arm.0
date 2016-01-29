Received: by 10.25.159.19 with SMTP id i19csp1120439lfe;
        Fri, 29 Jan 2016 11:17:50 -0800 (PST)
X-Received: by 10.55.73.68 with SMTP id w65mr12659309qka.68.1454095070187;
        Fri, 29 Jan 2016 11:17:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y200si18480256qhy.25.2016.01.29.11.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 11:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPEYH-0002aQ-Lo
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 14:17:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPEYF-0002XK-Fw
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 14:17:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPEYE-0004rq-Is
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 14:17:47 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPEY9-0004nF-B1; Fri, 29 Jan 2016 14:17:41 -0500
Received: by mail-lf0-x244.google.com with SMTP id e36so886923lfi.0;
	Fri, 29 Jan 2016 11:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iAxWY4XsPoJLymqciUnsOibsSsQDl6PwAghMkTLJtpY=;
	b=B/mmVz7ax8HbJ+XZjfiAM2OXyl7KFZt6rqbJ+oDQLFxHIowcEzZ1OM46zkwBw7w67X
	JsSQtnsRzTrutRJ93lSl/kY/+d8u7KYZ9ZDS/jxBz41/PV74yxX+Cis0JXnHAby27Tgb
	Oz/hLGKeoM9BtaAdzzoAeHITdRX8YIlpi9geHmWcKAmWyYqecHcAPfjW27iKsxy+r3Oj
	o2kTEgBB8eIQl/kMFZSX/hyUerR2ac1MXyr3SxZC2/ZRvYu0fJvFP2LTY8M56RmSG3N9
	trw6NjrwRWEQDpbtP4enZ1JSwjuEObX8abGyOxloUR4cQGMeBgWnHcPqBcshvx95o2gM
	Jrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iAxWY4XsPoJLymqciUnsOibsSsQDl6PwAghMkTLJtpY=;
	b=LCjaIKWua/KE46XsX9vKwCQCA0/fOTPr4FIfQ48WcBtJd19xt3WOm8wjUFrsiFYe9+
	jSBS/6WR9ws13YgZ9nptMvriVZGpVbv0cv/cQPqDKNPAkq8CNx8WRz2OTmUhrbyy9Xut
	5kPmw0waXrGmwYUC9o832Lot67RjWTU12/j9zoarfxjjjuig9JfPYQK9sh8LwtXSWD9k
	/CIMma/RrMimcWZtTXLusitRuUToQSCj+/CyOwdNrOzku8OdD2PpvOZ/HnASqcaS8ipj
	5PUcGyz2/WgXaNr1qb/EE/g2Wc0wLCWIsK3P6vGDbtE3AxMrqZNBaWJ1naB6RaXqBCFA
	rjAw==
X-Gm-Message-State: AG10YOSRguBqYBtuUWED5n1GTlNdqBk/F0ZgyCy44+xHRM28t/32Bfl4W8s2iVkM17ARtg==
X-Received: by 10.25.167.208 with SMTP id q199mr3199927lfe.140.1454095060343; 
	Fri, 29 Jan 2016 11:17:40 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id
	i192sm2270550lfb.14.2016.01.29.11.17.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 11:17:38 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jan 2016 22:17:30 +0300
Message-Id: <1454095052-17149-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PATCH v2 0/2] Architectural watchpoint check
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x3COBqJmU8NL

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
 * Comment for debug_check_watchpoint() callback improved

Sergey Fedorov (2):
  cpu: Add callback to check architectural watchpoint match
  target-arm: Implement checking of fired watchpoint

 exec.c                 |  5 +++++
 include/qom/cpu.h      |  3 +++
 qom/cpu.c              |  9 +++++++++
 target-arm/cpu.c       |  1 +
 target-arm/internals.h |  3 +++
 target-arm/op_helper.c | 35 +++++++++++++++++++++--------------
 6 files changed, 42 insertions(+), 14 deletions(-)

-- 
1.9.1

