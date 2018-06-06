Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp589357wrq;
        Wed, 6 Jun 2018 02:32:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIY0fXhFNFbLIiQnUY1VyBM1adpaNHorU2F8LDMgsdU/px6yv/WWmEbUzRfVLJrp69L2o3E
X-Received: by 2002:a37:4946:: with SMTP id w67-v6mr1843203qka.394.1528277555188;
        Wed, 06 Jun 2018 02:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528277555; cv=none;
        d=google.com; s=arc-20160816;
        b=oOH9uax0bbW2bgZqwEnD1um487si5CtQj3ho+rgEHIqrNub5cLqoVQlEWfVNF+nBFY
         Lq7tQIhc5DOx4NnORRXmRCDHq7mDL1QSfw11l8I9sWJYk0uvHkmrTw4I4+ai+N3m6XWs
         Y7H7/p2xR1sP4Y06RCv8cNSnk6stqe1RuOzLQlGYybPQnqYH+VApC/R+ZdQoWYPHK98Z
         +xor8EZuQU0qL5zan1oOiEMOA68ZdrErkmaherS2hVxXxh/VUoG9k3vsyjkx6oLgbwBt
         EWpIn6Ue9cG8m+/knOR+Arnu8oWSWGmzp+hpdpxtSRKqwzfpdMnQjq2jaAuKNGA7fkSm
         QdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=yr5afgsjuY0t5WPGlFYmK7e51EUHbpOnDHGdPv9Vl9M=;
        b=SlRu6PUK00Tg6ZI3s8fm2/9CmvUHb84dnbn8rA79gbSyp67MosZH6yUl75dC9AZ36m
         PFAsP75J4RqY+kQBRYSi1Oe0kJ/RrYMALWv4EKuVfMYH1OFOxXGKhiS1EOF6K0BrOVoa
         9jABxzJzOrAND2bV74SLhtmIjdEiXFPALYULSdy7JlQ48wxbU17CQz7wLcsKG1mBZfaq
         HZ/kpRoeYOTSNV+kYVCnZLiNBC34kuFRwiMXQ7zdfbuThq2fwWDHmjavXWFX3Gqf5cm+
         MGAO8r8e3Rmsa45e79YyMGNpVmgLqhKIuHG9llC+w72pJcKSyRxKTNpB2fnf/BD11D6k
         Gyvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OHmMxhYN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O86gLhfU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O86gLhfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g66-v6si220095qke.363.2018.06.06.02.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 02:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OHmMxhYN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O86gLhfU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O86gLhfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQUny-00028n-KR
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 05:32:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnG-0001iL-5v
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnD-0003gi-0p
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:50 -0400
Received: from greensocs.com ([193.104.36.180]:53690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fQUnC-0003fV-IK; Wed, 06 Jun 2018 05:31:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AF850443558;
	Wed,  6 Jun 2018 11:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277497;
	bh=v5lQ7vnr2Oq6A1weIYVOnQOowCQ78eh+eBRjN5DbVfI=;
	h=From:To:Cc:Subject:Date;
	b=OHmMxhYNKuyz8oux2bAfBnprmK89eBkcrMG036TeWgC7Id2MclRjGtADdx1XEKjMv
	NVQpKkalatI4rDgLgdN/BWXoDfFo7ORk/WELMIuZ/23+cQSROyc+32X3d9YmtkdQew
	6doS1hET5S5btBnkm9/P1BlADrXmFMYTqRHaAIQo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=O86gLhfU;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=O86gLhfU
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fyrli0RT4jdi; Wed,  6 Jun 2018 11:31:36 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E0827443552; Wed,  6 Jun 2018 11:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277496;
	bh=v5lQ7vnr2Oq6A1weIYVOnQOowCQ78eh+eBRjN5DbVfI=;
	h=From:To:Cc:Subject:Date;
	b=O86gLhfUKzd+NI4O+IjJ3LndcDVaWtlY6h6887rcy5zYYeroRcEaWsWlM2EaYE1Hp
	vTCCLcaWV8ax52y7X8+YzRnkU2+EkYQaATmumiF461BBBP3DGxu7z0f4eQKXXDLU2Z
	xLqInseJCJULrq1mEQEAmh6sY8kj9PG86enAmG3A=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7BC9B443546;
	Wed,  6 Jun 2018 11:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277496;
	bh=v5lQ7vnr2Oq6A1weIYVOnQOowCQ78eh+eBRjN5DbVfI=;
	h=From:To:Cc:Subject:Date;
	b=O86gLhfUKzd+NI4O+IjJ3LndcDVaWtlY6h6887rcy5zYYeroRcEaWsWlM2EaYE1Hp
	vTCCLcaWV8ax52y7X8+YzRnkU2+EkYQaATmumiF461BBBP3DGxu7z0f4eQKXXDLU2Z
	xLqInseJCJULrq1mEQEAmh6sY8kj9PG86enAmG3A=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Wed,  6 Jun 2018 11:30:55 +0200
Message-Id: <20180606093101.30518-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 0/6] arm_gic: add virtualization extensions
 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zpK6wMkAwLXg

From: Luc MICHEL <luc.michel@greensocs.com>

This patch series add support for the virtualization extensions in the
ARM GICv2 interrupt controller.

The first two commits do some refactoring to prepare for the
implementation. Commits 3 and 4 are the actual implementation. The last
commit updates the ZynqMP implementation to support virtualization.

The current state allows to boot Xen (tested with 4.8 and 4.10) with
Linux Dom0 guest properly.

I also tested in SMP. It does not work directly because Xen expects to
find CPU IDs in the GIC ITARGETSR0 register. This behavior is not
documented in the GICv2 specification, and is not implemented in QEMU.
By hacking this register, I was able to get the whole thing to boot in
SMP properly. This hack is not part of those patches though.

I also tested migration, it works fine AFAIK. I had to add the HYP and
SEC timers in the ARM CPU VMState though (Xen uses the HYP one) (not
part of those patches).

I want to thanks the Xilinx's QEMU team who sponsored this work for
their collaboration.

Luc MICHEL (6):
  intc/arm_gic: Refactor operations on the distributor
  intc/arm_gic: Remove some dead code and put some functions static
  intc/arm_gic: Add the virtualization extensions to the GIC state
  intc/arm_gic: Add virtualization extensions logic
  intc/arm_gic: Improve traces
  xlnx-zynqmp: Improve GIC wiring and MMIO mapping

 hw/arm/xlnx-zynqmp.c             |  92 +++-
 hw/intc/arm_gic.c                | 768 ++++++++++++++++++++++++-------
 hw/intc/arm_gic_common.c         | 159 +++++--
 hw/intc/arm_gic_kvm.c            |  31 +-
 hw/intc/gic_internal.h           | 258 +++++++++--
 hw/intc/trace-events             |  12 +-
 include/hw/arm/xlnx-zynqmp.h     |   4 +-
 include/hw/intc/arm_gic_common.h |  52 ++-
 8 files changed, 1128 insertions(+), 248 deletions(-)

--
2.17.0

