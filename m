Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp626738wrt;
        Wed, 26 Sep 2018 05:43:58 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61AQQyxc7pllIVpeLgp98/tKtwtS7iyIBSD+aUuo6WZqvp95dCz66FhjQq/863a+mCTcFjy
X-Received: by 2002:a37:6d44:: with SMTP id i65-v6mr4073449qkc.142.1537965838020;
        Wed, 26 Sep 2018 05:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537965838; cv=none;
        d=google.com; s=arc-20160816;
        b=c5m8cMh4xsCoryuk0zrgvmvgU7HFnX3J+SescMevlKSZUB8Rhc9xu92qe3rpoHE+wF
         pkVE31HEgpTSxwXm5XcDNqVfndqN30cp9ojpz8Hu+8hE1lqNlnxvF7qf/lUdb72XjZiu
         f4zlNeOvAyaQM5NLwEMMOuLOOzoa0qx/pBeqdNFEAw1LsoJaKEFAfKnwjCoVnVgX/7PO
         wLdohhI/fRlYcXW3Bq86ZueqUyLU6TTd9Kl/Nx+AAvsjaYhZ3C9G7K5VchWwAWRCVCyp
         Q986luPL+2fKro3Zr2EKsQSTuEWdp35VV7n4NtA9Dmi6TIAyGFLDUM+SuIN0OL0UxZuj
         FsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=jw81W9Z6wUkkGsF3WpZpMZmWsB4cNv+oOuNr1juksFM=;
        b=M25yPsfqdlE64q48PCToP2lIJG3y72Fi7/EEnUFV09W/nIqL17pfnlT9hiRY/QlOCi
         Wk8g7bkMzD3YaQxWgsPpMw+i1Xtoz6sMRJSiuT/aAfBc3iE0fekc3NHCytYRmSKQuCOv
         GpEPD2jXKUEmEjX53cqs3jdvD0H7a1aWPx+CfrxE/YbV3mazqGj4rfbqLV2UcIaC2uPt
         Q8bXPqeZo9IVbdznFBR1/uGynws3vILGG5z86c5h6oAjuV+reqRbC+z4heVVEO+5n4q0
         +PHph1Ss5UE9cJK+879WO4xKwJfG1yV+GEdQR1xxNXWlF78tPNhA/Elz0MYCDAsCNeru
         ceSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w17-v6si3743534qkf.277.2018.09.26.05.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 05:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g59Ab-0002KR-FM
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 08:43:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59AN-0002JC-W2
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59AJ-0003WL-Po
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:43:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2652 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g59AJ-0003Tb-BS; Wed, 26 Sep 2018 08:43:39 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4449D4D57AFB5;
	Wed, 26 Sep 2018 20:43:30 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.399.0; Wed, 26 Sep 2018 20:43:23 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <drjones@redhat.com>,
	<shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <gengdongjiu@huawei.com>
Date: Wed, 26 Sep 2018 16:47:29 -0400
Message-ID: <1537994851-36254-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v10 0/2] add support for VCPU event states
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
X-TUID: XQnWoGjknF36

From: g00384164 <g00384164@huawei.com>

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

 include/standard-headers/linux/input.h |  9 +++--
 linux-headers/asm-arm/kvm.h            | 13 +++++++
 linux-headers/asm-arm64/kvm.h          | 13 +++++++
 linux-headers/asm-x86/kvm.h            |  1 +
 linux-headers/linux/kvm.h              |  2 +
 linux-headers/linux/vhost.h            |  2 +-
 target/arm/cpu.h                       |  7 ++++
 target/arm/kvm32.c                     | 70 ++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c                     | 68 +++++++++++++++++++++++++++++++++
 target/arm/machine.c                   | 22 +++++++++++
 10 files changed, 202 insertions(+), 5 deletions(-)

-- 
2.7.4

