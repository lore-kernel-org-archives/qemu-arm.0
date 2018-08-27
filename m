Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5238104wrd;
        Mon, 27 Aug 2018 06:09:27 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZuUgypO3D926CukOLgHMEEwT3S6yBOROiY8eQnmQ9MwSgQKoA5t9zMZXD+2neZBpTNBmFU
X-Received: by 2002:ac8:34e1:: with SMTP id x30-v6mr14032805qtb.115.1535375367510;
        Mon, 27 Aug 2018 06:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535375367; cv=none;
        d=google.com; s=arc-20160816;
        b=DjePbFMyM0nMDusDSlXV2R/UoVFmwViJc7qJohfd9S210lJbYAFPZ7CBrC7nJLW9LV
         t69r+Vn5XOrEEA9TKDq85Zb8dWiMxe0DDwu5iR9AYVRQHoJpr4i+EbCAApq7IcT+pWF4
         W/4XGoHSIpTLZbjiAxC4+0wpg37CzKWoIPNGk88cYQiu32L0Zl+rgItSekvSfuw5N4oU
         VgaVTDWWYC49EREzUQKwrrTDlaDLLuZXn1ew3Ku1MwX9cjTR93kZwKzmpkKWUoFToplA
         XhD1BE05+skJj8Acp4CeFkqxdHZZutyfryu16Ne31lnUyQIqliiM5dk43WJfD0tg4nVu
         Zq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=W9cM6I+rDWkeuPgVcn+g8hGYD6XL9s1Swq3Qmq5V2go=;
        b=ax8XmYCvBHkztN6pvZ8SIV1xQ/ihkGPoiQ7tL8Vv60VDhJE1/BWcZlpVlFSJRHFZEk
         nZMIgv9Ie5Kq1HqHqJN8daVooz8WAoNRnflsg4N1H7VlgdBuOj4kenB5YG0tHF/AGBnO
         Y3KCMA0a0WVngzKu/m0lneGChXg9aKR3WWWIp3GtH51QaV4lcakJ4FMU1nHrFqHNooQo
         qc9kTFYSRHzltjc6SzUxpc5RV1FaK6HO0iMHui1ht5YBj0o3Hag193j7W3beMpM4VKcd
         hEH3wKWUWlYZN2vmaYERV6YOSf7RuiXABsomPJT4haz1O8AIT28nRL383Xa4+ED2JIsI
         BN6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si7351038qvf.138.2018.08.27.06.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Aug 2018 06:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fuHGp-00052l-0z
	for alex.bennee@linaro.org; Mon, 27 Aug 2018 09:09:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fuH6q-0003EV-Bd
	for qemu-devel@nongnu.org; Mon, 27 Aug 2018 08:59:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fuGqG-0002lB-8E
	for qemu-devel@nongnu.org; Mon, 27 Aug 2018 08:42:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2642 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fuGq9-0002cQ-TN; Mon, 27 Aug 2018 08:41:54 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 68B1844695437;
	Mon, 27 Aug 2018 20:41:44 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.399.0; Mon, 27 Aug 2018 20:41:36 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 27 Aug 2018 16:46:15 -0400
Message-ID: <1535402777-46620-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v7 0/2] add support for VCPU event states
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
Cc: gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kED/CTFJrTFe

Support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

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
 target/arm/kvm64.c                     | 68 ++++++++++++++++++++++++++++++++++
 target/arm/machine.c                   | 22 +++++++++++
 7 files changed, 129 insertions(+), 4 deletions(-)

-- 
1.8.3.1

