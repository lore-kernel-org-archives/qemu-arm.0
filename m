Received: by 10.25.30.65 with SMTP id e62csp1237035lfe;
        Wed, 25 May 2016 04:01:48 -0700 (PDT)
X-Received: by 10.140.195.69 with SMTP id q66mr2770361qha.79.1464174108120;
        Wed, 25 May 2016 04:01:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h140si7276908qhc.40.2016.05.25.04.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5WZP-000313-FV
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:01:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQh-00032c-JK
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQf-0000ym-Ii
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:52:46 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b5WQZ-0000wv-S3; Wed, 25 May 2016 06:52:40 -0400
Received: by mail-wm0-x242.google.com with SMTP id f75so14168286wmf.2;
	Wed, 25 May 2016 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=97jvJxsfuP4G/xJKOMFl4GPLYyltc/ObL8JHGWLJDJ0=;
	b=oaGpPB5sFZXLdmzn8CeQRUVlF3RhZKgEEvMS0TdqYejUXOsUSfKBhGhkLhKvPpV/Se
	bv9NcX33znDRlL2ge7e2GsNvJxWH5lq1JSM2dfBaO41du/pLd+NLBjJLuFZD8xL3BqJg
	hkikHP3iB6l1WmRYkAe9RidEpmaY2H3a/YZ+8n3x4yIJTySn6WmwPcTt/OWkFA2Cez9m
	PteULBsl6W5FJmzBSP3kD45qiVKjZJqmaM7Id1c2/DscqfkiuG6FXCLjq93Si+W/2NR2
	vNTetfvYl70j0oPNIb94htq66sYc9vguvKQNSdKNlpY5Iybj3ZZ7ThUibxUCnDRql9y/
	9MQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=97jvJxsfuP4G/xJKOMFl4GPLYyltc/ObL8JHGWLJDJ0=;
	b=YSb9P6+c3deXy0C6MoVpWIg+lc5zfRsBgBUTrTm0xskNH394DJTvuRxDroXzqCAPYl
	YXx0ObllcFg2C4tvrP9nfPAta+qne+ovfwU5HzAUO6vuGd4G8fNyIIgye8IeYUONcvIi
	CkwBCkawz3QmLUTmI3J21HnCxgPUIywLvBst236d+5o0oRg4fY3IMEv8HNQLVtCWmizC
	AIevepG8uRsrWkvEYAd7EP3nLb0i5Tnba7ZydcSv6ax/ZjB8nOMbq2z+NDOMCsjXzSPq
	Sy7EZ7TX8tXQkCtSyjtsoFLDfzdTdBm3cCTdqJ0+6TAWJIHH186NNhDN7f2SYgxoI0Db
	VMfw==
X-Gm-Message-State: ALyK8tIi7sGCzvNnynUcRJYiHygc0IXvmbugycT24imQdo8DllV+kU2djm8T5ZDtoHDvFA==
X-Received: by 10.28.0.84 with SMTP id 81mr2842075wma.23.1464173559028;
	Wed, 25 May 2016 03:52:39 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	d195sm2024625wmd.12.2016.05.25.03.52.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 May 2016 03:52:36 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 12:52:31 +0200
Message-Id: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-arm] [PATCH v2 0/4] xlnx-zynqmp: Fix various issues with KVM
 runs
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z4aT+fPAvZXV

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This series fixes a bunch of issues with KVM runs using the ZynqMP
machine.

When using KVM, we don't have support for TrustZone, the RPU subsystem
with Cortex R5s and we also need to use the in-kernel GIC model.

This adds a set of properties to the ZynqMP allowing the creation
of the KVM friendly machine.

I've opted to default the ZynqMP to the KVM friendly machine for
consistensy between KVM and TCG and also because some of the options
are currently of limited use (i.e the RPU) or were actually disabled to
start with (e.g TrustZone sneaked in as we enabled EL3 on the A53s).
I'm OK either way though, so if people think differently we can change
the defaults.

Comments welcome!

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* Create the RPU in ZynqMP realize()
* Bailout on errors when creating the RPU
* Mention default setup changes in commit messages
* Fix spelling in commit msg

Edgar E. Iglesias (4):
  xlnx-zynqmp: Add a secure prop to en/disable ARM Security Extensions
  xlnx-zynqmp: Make the RPU subsystem optional
  xlnx-zynqmp: Delay realization of GIC until post CPU realization
  xlnx-zynqmp: Use the in kernel GIC model for KVM runs

 hw/arm/xlnx-zynqmp.c         | 121 ++++++++++++++++++++++++++-----------------
 include/hw/arm/xlnx-zynqmp.h |   5 ++
 2 files changed, 78 insertions(+), 48 deletions(-)

-- 
2.5.0

