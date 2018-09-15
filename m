Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1682925wrd;
        Sat, 15 Sep 2018 02:28:49 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda/VMb9t0W6x3ONnq5NxvZFRAW/nOyL+P+N6MRhh8OD9nAvEEj2w+p0WZhSRvcQBED+x6f4
X-Received: by 2002:a0c:9aef:: with SMTP id k47-v6mr11900056qvf.134.1537003729911;
        Sat, 15 Sep 2018 02:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537003729; cv=none;
        d=google.com; s=arc-20160816;
        b=xnvwuntGjzxgCaFFIwkXrrWpgKOtxVuxno/poKDRO/t/U29649WrpWsHXkiZCypRcD
         bT7IbMZq+QxFr/FBaIKY5Q2hJ2dKh6FL4VmMmFlq1lMjymgLlS6udOQnjb+Mngc7u+Pz
         QEV+tTip/6cp2S03GoACSMrephcVc0jzjwccQmcS89LmWrZAurewj4jQMH640nSV6Nl7
         e8y//t5nuwzBMRnyOl7UIOzQ45EzfoFrp+lOqBnc+XfJrhlpcmrgYi3WsL0gyCSUqVQW
         uH0X4F6/RV9u7xDJj3BFWuwUa2FmKwiRFeBPUpsqZj8qi6hbfHrKmXaq3JK+pCoVyMuf
         Bf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=eH43taA3VvYvWE07TUrEdF/A8oZncNdW5NLKiki+FFQ=;
        b=FrGWt6WZe5g45Rt2qg9UI6fo1wxRbGmUCP+ctafCdihQFLRy89Vwc54nF+0Hkh5Fwv
         UMPbAPOzSQmRDMqTtfuk/EUHz1J9cfFzAri7PjtEzAbU9oLHS2vw7qwsRx58T8n1Qh7P
         8sv1B29/oD0t6QhPPQgpeQeB69NGqf9GFxYbJCpJQ4f2V/+xEizyM+ts1C667y+wD7tl
         jXWqvZmecxxc/EQABBJqsOvNEcfrH9vKD5WWwD2MnPKjxbFa/IffFKOJh9yLk7Sc9FYs
         tCv9vt9mkVxKODMSFSHoDWwzEgtehjio8wx9Z9pVlAmO1HKzOD3S2Y2KiIZw+6Smp6ud
         Tlug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7-v6si4796426qkc.322.2018.09.15.02.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 15 Sep 2018 02:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g16sj-0007SF-Du
	for alex.bennee@linaro.org; Sat, 15 Sep 2018 05:28:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g16sI-0007He-VA
	for qemu-arm@nongnu.org; Sat, 15 Sep 2018 05:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g16s2-0004JC-In
	for qemu-arm@nongnu.org; Sat, 15 Sep 2018 05:28:11 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2564 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g16s1-00047E-J7; Sat, 15 Sep 2018 05:28:06 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 499BAB93C0060;
	Sat, 15 Sep 2018 17:27:53 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.399.0; Sat, 15 Sep 2018 17:27:46 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 15 Sep 2018 13:32:05 -0400
Message-ID: <1537032727-29397-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v9 0/2] add support for VCPU event states
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
Cc: gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q7h3PuDBveDi

Support KVM_GET/SET_VCPU_EVENTS to get/set the SError exception state, and
support the state migration.

Now the VCPU event only includes the SError exception status, it can be
extended if needed. When do migration, If source machine has serror pending, 
the target machine is also needed to pend this serror regardless of whether
target machine can support to set the serror syndrome.

Dongjiu Geng (2):
  linux-headers: Update to kernel mainline commit 815f0ddb3
  target: arm: Add support for VCPU event states

 include/standard-headers/linux/input.h |  9 +++--
 linux-headers/asm-arm/kvm.h            | 13 +++++++
 linux-headers/asm-arm64/kvm.h          | 13 +++++++
 linux-headers/linux/kvm.h              |  1 +
 target/arm/cpu.h                       |  7 ++++
 target/arm/kvm64.c                     | 69 ++++++++++++++++++++++++++++++++++
 target/arm/machine.c                   | 22 +++++++++++
 7 files changed, 130 insertions(+), 4 deletions(-)

-- 
1.8.3.1

