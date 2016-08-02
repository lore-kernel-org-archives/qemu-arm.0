Received: by 10.25.21.156 with SMTP id 28csp103369lfv;
        Tue, 2 Aug 2016 03:20:54 -0700 (PDT)
X-Received: by 10.237.35.201 with SMTP id k9mr96132539qtc.92.1470133254768;
        Tue, 02 Aug 2016 03:20:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o129si1161905qka.188.2016.08.02.03.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 03:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUWog-0004yi-8m
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 06:20:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bUWoY-0004yH-76
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 06:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bUWoS-0003z7-6D
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 06:20:45 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:32902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bUWoR-0003z3-VC; Tue, 02 Aug 2016 06:20:40 -0400
Received: by mail-pf0-x242.google.com with SMTP id i6so12198481pfe.0;
	Tue, 02 Aug 2016 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ys8o49AKXfFMp1THvLwBqzqhp3sco8vOk32EHv0G5zo=;
	b=zHUBFTqxaQKlor4RjLzJx+NKpi/YiQMm/UXzleDGvsryTH4pntyEif0hD8JaLvBHw/
	xjDqv5/tR85jpIYtYNAhbqi468KYAAjM4UGqQsuTMh252w82+t6YNi0+BEZNb3OMd3yP
	/Xu7kkfgzGmGv8bCiYuswRt894oZ+iGGjPJ/pEbdXlF2LMJ5XBsYxAKuyXBu8Wx7eVfA
	fTQbCG6EiC1z7nnTpVU+UwoRbfrdhKfgG8BIhH96w3Z3EP1vbekpmVxkcZMao0pl+dwL
	Fw/PH4FKZZ64uJFVrrbOvzLfgc5G6nsEhv7EJ0i/QOgUP4AXevVFAHhQpApojtW94oS9
	ryXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ys8o49AKXfFMp1THvLwBqzqhp3sco8vOk32EHv0G5zo=;
	b=GE4EIjQRkDxDbWALZ74B11qPByesziw0fahW/CfHg+NQ9tA9xOCHJ03q/YNnikMHyl
	pzTuviNBZteUqcjeO7CQZOZGohLlEYlKHBtERr0aVuvvBGKr9stfwYRB/A0PACp6wmg4
	9n3kE4NBwh1IxaFgdKRbLLhDpzmqqbkd8CWte3+7asZW9HzLywtYLAPuzXqOp26Xsqmf
	m6SZSJ+vZ/DesRxvvtB64oxf+TrKGrUPXqt7iRb+nJSz2/k6G1Ne78ipwI5UESRNujI/
	fde2VQB/8lNiWrvOfcFvkkwdFJCJyMrdTVFrmcAs2vZVgcVoWYZY1JDgu3kH2mmKMQ4N
	EarQ==
X-Gm-Message-State: AEkoouuuA7N6ZrJ1segUTqeOEu/mozKz3v2gzZr4v2G3cknwjBve/zAoQj/+wwgKcwfAzA==
X-Received: by 10.98.73.131 with SMTP id r3mr104496243pfi.112.1470133238975;
	Tue, 02 Aug 2016 03:20:38 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	m78sm3580612pfj.66.2016.08.02.03.20.35
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Aug 2016 03:20:38 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Tue,  2 Aug 2016 15:50:14 +0530
Message-Id: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [RFC PATCH v1 0/2] Live migration optimization for
 Thunderx platform
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
Cc: Prasun.Kapoor@cavium.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHwx6AJsgSC8

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

The CPU MIDR_EL1 register is exposed to userspace for arm64
with the below patch.
https://lkml.org/lkml/2016/7/8/467

Thunderx platform requires explicit prefetch instruction to
provide prefetch hint. Using MIDR_EL1 information, provided
by above kernel patch, prefetch is executed if the platform
is Thunderx.

The results of live migration time improvement is provided
in commit message of patch 2.

Vijaya Kumar K (2):
  utils: Add helper to read arm MIDR_EL1 register
  utils: Add prefetch for Thunderx platform

 include/qemu-common.h |    2 ++
 util/Makefile.objs    |    1 +
 util/cpuinfo.c        |   90 +++++++++++++++++++++++++++++++++++++++++++++++++
 util/cutils.c         |   22 ++++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 util/cpuinfo.c

-- 
1.7.9.5

