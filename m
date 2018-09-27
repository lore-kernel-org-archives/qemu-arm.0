Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1694160wrt;
        Thu, 27 Sep 2018 01:52:14 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63joJceMOEg8o1O33VveS5C61De+IGNsOwVN9J/vvwRxs2qbiTHR11Qqr6qvHQd9fjLUsT1
X-Received: by 2002:ae9:e64b:: with SMTP id x11-v6mr7235973qkl.41.1538038334639;
        Thu, 27 Sep 2018 01:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538038334; cv=none;
        d=google.com; s=arc-20160816;
        b=aJosejLSaP/0oCs12KnL+YJukhjOlFHjQ1KWvh7ARPs8WRaRhRli2lkXO7slp8nX40
         b3igD/Sv1GdLWJlPqFOAvvKSKYiaWlkV3BxtI5N7sDtNw4NJ0JDzEgwmji9VmjHGvksN
         /6aLpW5O7PqEccPsCMmseH6JLoJr2Bis4q31K25OjQG2R03ip8vKoI2T6iuASNyZLCR8
         BN91IBAQNJtlDmLicM8ad/4R42qnhekDl4vMMOnUQTgTThhYUc4URhBVVndrC9nGF1Xb
         a//ksLxB6HqaNv6FQ3X81wima5cW3RPlAmaYYhS5hxoExxs3j8oA/QSeyOH+VOQrg4Je
         8fgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=SBkcXo6WXKy/Ad9Zd9Z/ktzqNbRbeHfSnpiCiPYfzys=;
        b=OYTP8PpP0WetjXw8MFxwE1PoTWBiPO39xIdce6RxPgENGpTMp98KtOgxWmyAPvYPYp
         3i27QtifsRwqFQREc+Peb9dDkRMXN2jJiI4FVjwhdiicrN79Vn92sUCfuMgPNFtlYwat
         O//EhZTbY91O7Iq+uThZwLTIu3uV1GNJF6pq6rgDnTvJchHCBDZa6s8DZurX+XCVqLxg
         uwuEwB659wvj+F2OUgERIP03gOxTphAthXc3FxUFvzp6hvxWR/sJzNSWFGCzFPA/Imiq
         C0dJMmU+Dg4FAfSAzcUvOvL60RrXW4RnOXlAgml22Y4ygIOY996Uye8IfE48/6JLYold
         58PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p43-v6si932647qvf.115.2018.09.27.01.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Sep 2018 01:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5S1t-0007DZ-KG
	for alex.bennee@linaro.org; Thu, 27 Sep 2018 04:52:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5S1h-0007DA-AT
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 04:52:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5S1e-0004pT-5o
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 04:52:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2567 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g5S1d-0004fc-Nx; Thu, 27 Sep 2018 04:51:58 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 345FC2E97D93F;
	Thu, 27 Sep 2018 16:51:52 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.399.0; Thu, 27 Sep 2018 16:51:44 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <drjones@redhat.com>,
	<shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <zhengxiang9@huawei.com>
Date: Thu, 27 Sep 2018 12:55:49 -0400
Message-ID: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH RFC v11 0/2] add support for VCPU event states
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
X-TUID: 5YO+Y/KZqCbf

Support KVM_GET/SET_VCPU_EVENTS to get/set the SError exception state, and
support the state migration.

Now the VCPU event only includes the SError exception status, it can be
extended if needed. When do migration, If source machine has serror pending, 
the target machine is also needed to pend this serror regardless of whether
target machine can support to set the serror syndrome.

Note: Because I do not have arm32 environment, I only this patch in the KVM64,
not test it in the KVM32. So I need someone else test it in the 32 bit KVM platform.
Thanks.

Dongjiu Geng (2):
  linux-headers: Update to linux kernel 4.19-rc5
  target/arm: Add support for VCPU event states

 include/standard-headers/linux/input.h |  9 ++---
 linux-headers/asm-arm/kvm.h            | 13 ++++++++
 linux-headers/asm-arm64/kvm.h          | 13 ++++++++
 linux-headers/asm-x86/kvm.h            |  1 +
 linux-headers/linux/kvm.h              |  2 ++
 linux-headers/linux/vhost.h            |  2 +-
 target/arm/cpu.h                       |  7 ++++
 target/arm/kvm.c                       | 60 ++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c                     | 13 ++++++++
 target/arm/kvm64.c                     | 13 ++++++++
 target/arm/kvm_arm.h                   | 24 ++++++++++++++
 target/arm/machine.c                   | 22 +++++++++++++
 12 files changed, 174 insertions(+), 5 deletions(-)

-- 
2.7.4

