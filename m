Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp896568wrq;
        Tue, 5 Jun 2018 05:48:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKyWxMbdSFpH6VGDnFIZsH3wfprNkFqt+FGGA++uL6F/wB/Yw1OAE2OTnocVP73+haAG1ns
X-Received: by 2002:a0c:c206:: with SMTP id l6-v6mr18871431qvh.17.1528202890886;
        Tue, 05 Jun 2018 05:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528202890; cv=none;
        d=google.com; s=arc-20160816;
        b=D6+YMQWrrPwL0/SP7MQPqcI9H9XfZshNRuknUQby0gF76M0YYr1l4WBpKutggNtDva
         RROdEb6QhNF4MV0rKUpTTOk3wrLeFgOxFmTzlsO9J8K0xGbdzB5wvbxP2OTLfDIJr770
         S5b2cw3JOQoZaXmR1oP1IH5RA5K0/SnbqIrM/uuCqCOH8o9/DVyHHUQNqr0Bt8abQoZc
         y/rfzOSVqvtSqVb9Z+duvIcCXJ0D4suS/Vwz4KoprJlsuPvdJrEHfno8HX5Ke/Irt+20
         yNUTfMLSjM2OJkhvl6uDnFpvba1w0kNeYdA8o+Kk31gbT3wjsj5dWm1HJviGu6FoUG2S
         bJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=baEiS22ZI2Ny1ArSpdYlqmM57HXLRpSNbv2IpEBW0kk=;
        b=oxStWaaKSbdIUcRsKKHvr0v0VczOLJHGGWLLGxVZ8p+iqbuq5tY+A8fK8b4GQLVzDi
         gf6xQ4o4RBxYLc2N9+EtSDQIr6kyNQMaYMWMCPUbhwLZ5NIwPxUcCqBH9x0twSGRdtUh
         5nYhkdiuuDZGRo9iVCLkoEi1vs+GjqIvkfI7IpmvgL/tad9QpOLUSzxFy5lw/Wz2lhbt
         SllGHf/5IUAgMTjLOmykf6caZIn0hbUYjs8e0nEh2DkXNJkxCbcq1rDFBIph4hKkn2N8
         hVrVRlByAC2biXGbJ5TDIGssH/QMZ1BNZ7ikEigwGT8LJdMeoEAW1FpL1f9RWpZ1VaX+
         jvkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17-v6si1030831qkm.198.2018.06.05.05.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 05:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQBNi-0007Op-BQ
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 08:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQBNP-0007Mx-A3
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 08:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQBNM-0003Bs-6n
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 08:47:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2108 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fQBNL-00038r-Of; Tue, 05 Jun 2018 08:47:48 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 82C34A487712B;
	Tue,  5 Jun 2018 20:47:29 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.382.0; Tue, 5 Jun 2018 20:47:23 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Date: Wed, 6 Jun 2018 04:52:47 +0800
Message-ID: <1528231969-19584-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v2 0/2] add support for VCPU event states
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5JcDNoTx1/xD

support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

change since v1:
1. update the code to fix the build errors

Dongjiu Geng (2):
  kvm: sync linux headers
  target: arm: Add support for VCPU event states

 linux-headers/asm-arm64/kvm.h | 13 +++++++++
 linux-headers/linux/kvm.h     |  1 +
 target/arm/cpu.h              |  5 ++++
 target/arm/kvm64.c            | 64 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c          |  3 ++
 5 files changed, 86 insertions(+)

-- 
2.7.4

