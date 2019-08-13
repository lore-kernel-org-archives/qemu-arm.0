Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp684893wrs;
        Tue, 13 Aug 2019 01:52:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQPESzoJBXvAVp0aAuNeQtgbwtHeO1JNXKihsnZHzKIBEiNkEdtLl8yDzERu4g21LpWs7X
X-Received: by 2002:aa7:9edc:: with SMTP id r28mr7387563pfq.219.1565686379868;
        Tue, 13 Aug 2019 01:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565686379; cv=none;
        d=google.com; s=arc-20160816;
        b=cvNT/tm0OsFyr9Bb0BqA+h80iKJ71IWtZo2iX3iDV7p40EfHgQTE65QSxclq8fllxj
         X+VaSxpu/rCmJGG7nXUpzAzFTbnv6Qqr+0NgE+U1u7RFj9iZOFGwWGbCfaOxNCfFptod
         T5abb7FvLHtP5sA9uQpSA0tMpczrm8i30H5DXRRlaa8HeueBgI06/dkDQYvD8M71aoxB
         4N+ZuPkANiFuxwOBWG9V+T/eqNj+R+nq+DRKxxLy3CK/ZibCNuuzzoIaP2lODx2wNUfG
         TbsVej7C613Bwb08lIflbEk/EbcjBEW/cTdUxZmwhD4VEoeSdMKqJTTBsfo7I1G80756
         XWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject:cc
         :to:from;
        bh=5A/L+Vkv7alHgURz/ckl5JD+YVAJ+HVE3O4ACNKrfNQ=;
        b=HCIxJFMAK1iR8ULF+8Ud6dTCZiWbH/zW/J6VqlbnYO3qdM4C7kAF4YLe5VfDDexoQv
         qnIPxCigymTD5vpUT+XHbf0qiB469iqu6j3mjZRGUG0mtaRNFeJjtGyY4k0cx0jM+Si3
         oXwJ9XrZ57xht/FdUBifl6LeOTw2xHjih0BsAs6rKTHC7Tal5Q31Fv9lK4sFPQx+VTBR
         vHW0UZj35D0uMAtptnBzvORfUEs5KXZeYltVYKxLR4cM2pSCbT/18lhQKaiL4u6b0EzC
         J81csgWkIozNuGVdJLvnjeZcq+u9YefbShAKWGegjKSnXLplF2xoaxI7uz4jq5Y/zmpk
         7tJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id q13si573469pjb.13.2019.08.13.01.52.59;
        Tue, 13 Aug 2019 01:52:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfHMIw6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 13 Aug 2019 04:52:58 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4239 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726890AbfHMIw6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 13 Aug 2019 04:52:58 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 124E0E3933AC374F08C4;
        Tue, 13 Aug 2019 16:52:57 +0800 (CST)
Received: from [127.0.0.1] (10.184.12.158) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Tue, 13 Aug 2019
 16:52:48 +0800
From:   Zenghui Yu <yuzenghui@huawei.com>
To:     <kvmarm@lists.cs.columbia.edu>, <qemu-arm@nongnu.org>
CC:     Marc Zyngier <maz@kernel.org>, Eric Auger <eric.auger@redhat.com>,
        "James Morse" <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        <suzuki.poulose@arm.com>, <peter.maydell@linaro.org>,
        <kvm@vger.kernel.org>,
        "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
        <zhang.zhanghailiang@huawei.com>
Subject: Can we boot a 512U kvm guest?
Message-ID: <86aa9609-7dc9-1461-ae47-f50897cd0875@huawei.com>
Date:   Tue, 13 Aug 2019 16:50:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
 Thunderbird/64.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.12.158]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: dBbLWwXs5cAW

Hi folks,

Since commit e25028c8ded0 ("KVM: arm/arm64: Bump VGIC_V3_MAX_CPUS to
512"), we seemed to be allowed to boot a 512U guest.  But I failed to
start it up with the latest QEMU.  I guess there are at least *two*
reasons (limitations).

First I got a QEMU abort:
	"kvm_set_irq: Invalid argument"

Enable the trace_kvm_irq_line() under debugfs, when it comed with
vcpu-256, I got:
	"Inject UNKNOWN interrupt (3), vcpu->idx: 0, num: 23, level: 0"
and kvm_vm_ioctl_irq_line() returns -EINVAL to user-space...

So the thing is that we only have 8 bits for vcpu_index field ([23:16])
in KVM_IRQ_LINE ioctl.  irq_type field will be corrupted if we inject a
PPI to vcpu-256, whose vcpu_index will take 9 bits.

I temporarily patched the KVM and QEMU with the following diff:

---8<---
diff --git a/arch/arm64/include/uapi/asm/kvm.h 
b/arch/arm64/include/uapi/asm/kvm.h
index 95516a4..39a0fb1 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -325,10 +325,10 @@ struct kvm_vcpu_events {
  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1

  /* KVM_IRQ_LINE irq field index values */
-#define KVM_ARM_IRQ_TYPE_SHIFT		24
-#define KVM_ARM_IRQ_TYPE_MASK		0xff
+#define KVM_ARM_IRQ_TYPE_SHIFT		28
+#define KVM_ARM_IRQ_TYPE_MASK		0xf
  #define KVM_ARM_IRQ_VCPU_SHIFT		16
-#define KVM_ARM_IRQ_VCPU_MASK		0xff
+#define KVM_ARM_IRQ_VCPU_MASK		0xfff
  #define KVM_ARM_IRQ_NUM_SHIFT		0
  #define KVM_ARM_IRQ_NUM_MASK		0xffff

---8<---

It makes things a bit better, it also immediately BREAKs the api with
old versions.


Next comes one more QEMU abort (with the "fix" above):
	"Failed to set device address: No space left on device"

We register two io devices (rd_dev and sgi_dev) on KVM_MMIO_BUS for
each redistributor. 512 vcpus take 1024 io devices, which is beyond the
maximum limitation of the current kernel - NR_IOBUS_DEVS (1000).
So we get a ENOSPC error here.


I don't know if the similar problems have been discussed before in ML.
Is it time to really support the 512U guest?


Thanks,
zenghui
