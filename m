Received: by 10.25.21.156 with SMTP id 28csp192849lfv;
        Wed, 24 Aug 2016 01:04:44 -0700 (PDT)
X-Received: by 10.55.53.3 with SMTP id c3mr1768152qka.38.1472025884819;
        Wed, 24 Aug 2016 01:04:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m74si4940511qki.327.2016.08.24.01.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 01:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcTAy-0001Vf-DS
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 04:04:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bcT9R-0000Mh-8Q
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 04:03:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bcT9L-0003oY-F1
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 04:03:08 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:48845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bcT9K-0003lI-PF; Wed, 24 Aug 2016 04:03:03 -0400
Received: from 172.24.1.60 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DMC33640; Wed, 24 Aug 2016 16:02:48 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml430-hub.china.huawei.com (10.82.67.185) with Microsoft SMTP
	Server id 14.3.235.1; Wed, 24 Aug 2016 16:02:37 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2016 16:02:20 +0800
Message-ID: <1472025743-11484-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.57BD54AC.0024, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 39315201e223e8d819bf3804a21a7c85
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-devel] [RFC PATCH 0/3] target-arm: Add cortex-a72 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sjeADqvNzkLj

From: Shannon Zhao <shannon.zhao@linaro.org>

This series add cortex-a72 cpu support for target-arm.

Shannon Zhao (3):
  target-arm: cpu64: Add support for Cortex-A72
  target-arm/kvm64: Add cortex-a72 cpu support
  hw/arm/virt: Add cortex-a72 cpu support in machine virt

 hw/arm/virt.c                 |  5 ++++
 linux-headers/asm-arm64/kvm.h |  3 ++-
 target-arm/cpu64.c            | 56 +++++++++++++++++++++++++++++++++++++++++++
 target-arm/kvm-consts.h       |  2 ++
 4 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.0.4


