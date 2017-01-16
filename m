Received: by 10.25.205.13 with SMTP id d13csp1289683lfg;
        Mon, 16 Jan 2017 01:29:18 -0800 (PST)
X-Received: by 10.237.62.9 with SMTP id l9mr30685621qtf.198.1484558958544;
        Mon, 16 Jan 2017 01:29:18 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id r49si13868012qta.172.2017.01.16.01.29.18;
        Mon, 16 Jan 2017 01:29:18 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2CE51400E9;
	Mon, 16 Jan 2017 04:27:27 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rBuXoUDN+Gu; Mon, 16 Jan 2017 04:27:22 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7319D40692;
	Mon, 16 Jan 2017 04:27:22 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B538B405CC
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:27:21 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4zblEUc8IkW for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:27:17 -0500 (EST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 19B6B40501
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:26:51 -0500 (EST)
Received: from 172.24.1.136 (EHLO szxeml426-hub.china.huawei.com)
 ([172.24.1.136])
 by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DXW50571; Mon, 16 Jan 2017 17:28:09 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:27:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH RFC 0/6] target-arm: KVM64: Cross type vCPU support
Date: Mon, 16 Jan 2017 17:26:55 +0800
Message-ID: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020205.587C922E.0190, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ac3bf7f0f7d51e53ea9d1759f7ff6059
Cc: qemu-devel@nongnu.org, wu.wubin@huawei.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: FnuEdfQrlvrk

From: Shannon Zhao <shannon.zhao@linaro.org>

This patch set support use cross type vCPU when using KVM on ARM and add
two new CPU types: generic and cortex-a72.

You can test this patch set with QEMU using
-cpu cortex-a53/cortex-a57/generic/cortex-a72

These patches can be fetched from:
https://git.linaro.org/people/shannon.zhao/qemu.git cross_vcpu_rfc

You corresponding KVM patches can be fetched from:
https://git.linaro.org/people/shannon.zhao/linux-mainline.git cross_vcpu_rfc

Shannon Zhao (6):
  headers: update linux headers
  target: arm: Add the qemu target for KVM_ARM_TARGET_GENERIC_V8
  arm: kvm64: Check if kvm supports cross type vCPU
  target: arm: Add a generic type cpu
  arm: virt: Enable generic type CPU in virt machine
  target-arm: cpu64: Add support for Cortex-A72

 hw/arm/virt.c                 |   2 +
 linux-headers/asm-arm64/kvm.h |   1 +
 linux-headers/linux/kvm.h     |   2 +
 target/arm/cpu64.c            | 110 +++++++++++++++++++++++++
 target/arm/kvm-consts.h       |   2 +
 target/arm/kvm64.c            | 182 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 299 insertions(+)

-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
