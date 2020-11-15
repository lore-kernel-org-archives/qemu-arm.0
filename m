Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2978870lfb;
        Sun, 15 Nov 2020 06:31:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbKI1YEr3pnA5RNpCUVTtUwE8Yn4Ishm7XR+ABVESSp6bT4HXRL9kwujfl2Ey/j6FgbO1Q
X-Received: by 2002:a37:887:: with SMTP id 129mr10259735qki.499.1605450706633;
        Sun, 15 Nov 2020 06:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605450706; cv=none;
        d=google.com; s=arc-20160816;
        b=lS41XToYyiqFsx4wO9iMmbBC0mfXJ7BbOmvr6iPlUUqd8Mqj2b0DkURXUwkm+BgRaN
         5dSoH1HAHgb7KxCSbhhBzHkErgy8uydrhvPINSYk9d1bf1joQ8gG/c+gpczW3gkXgBMy
         44PB/PoQk3o9zy/sYQoOGUubVMe3RcZlnLR4NbsTZeXvr94bsAYpN8wNsKTrh0qHaB/Q
         Zoy2Pt/TdoqsJBrfEfGKZPA7qK1RhYx/m1ergkv+QRnBEmKET+OjT5UBr73yZeTCPIAv
         SaQxeNplw9cJYnHRjFCUIsBcsrRLWezksepTabYmqps8hVDFMDpjctjbC+iNBfLCHoP4
         4hLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:mime-version:user-agent:date:message-id:to:subject
         :from;
        bh=6fGKK/DZ7ZxoTzMVrzBLCRrWY7cXYhO3PMVkV6fgjdU=;
        b=ylSAYg+RWyTI4cTZm0ZymSliS04yQAAHGRKMXLmqGmRWe2P2faVP5r0ueByDmOYu3b
         XdVK0SRPip1IKZNLX/IoOOS9ET8QSdvzm+EOy4A/BFzJdWzmVcKfsA/jIhZM2SJ8t1d6
         qCVna599yHn50v7/DcjcCJkXKoFqYkSsajeX0GyYIFgQoO18slERZkQRGdGKgctBOWNn
         ly3Ag6uS2+qV8u8KveroWINFW/aBWJas7ckR/geEphyk6D04mWmJ+RBGu2SuXGNIL1CD
         a4AULLBkQN3RyNLtW5I+4s8nHDZQ/SwFSbi4g5bSya5gmmuzB+EfkDLpwDu4G1JY0EFq
         GNZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v1si6914998qvw.156.2020.11.15.06.31.45;
        Sun, 15 Nov 2020 06:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2866F4B954;
	Sun, 15 Nov 2020 09:31:45 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wSmkXoK70d3; Sun, 15 Nov 2020 09:31:44 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 170E84BC95;
	Sun, 15 Nov 2020 09:31:44 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 68B114BBC8
 for <kvmarm@lists.cs.columbia.edu>; Sun, 15 Nov 2020 09:31:43 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWkZ0zBCDq+x for <kvmarm@lists.cs.columbia.edu>;
 Sun, 15 Nov 2020 09:31:41 -0500 (EST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 02E264B954
 for <kvmarm@lists.cs.columbia.edu>; Sun, 15 Nov 2020 09:31:40 -0500 (EST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CYvlb2S1Zz15JTD;
 Sun, 15 Nov 2020 22:31:23 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Sun, 15 Nov 2020 22:31:28 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC] vfio-pci/migration: Dirty logging of the Memory BAR region?
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Message-ID: <fd18627a-e012-1af8-9d9f-9ae8a1415258@huawei.com>
Date: Sun, 15 Nov 2020 22:31:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Cc: Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: GavfPcgs59/i

Hi folks,

While trying the new vfio-pci migration on my arm64 server, I noticed an
error at the very beginning:

qemu-system-aarch64: kvm_set_user_memory_region: 
KVM_SET_USER_MEMORY_REGION failed, slot=5, start=0x8000000000, 
size=0x100000: Invalid argument

The reason is that we've registered the Memory BAR region as ram device
region (mr->ram_device is set) and tried to track dirty pages of this
region during migration.  QEMU tries to request tracking of it (via kvm
memory listener's log_start() callback) whilst KVM/arm64 clearly refuses
to do so [1]:

 > int kvm_arch_prepare_memory_region(struct kvm *kvm, ...)
 > {
 > 		/* IO region dirty page logging not allowed */
 > 		if (memslot->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 > 			ret = -EINVAL;
 > 			goto out;
 > 		}
 > }

If I understand things correctly, the Memory BAR region generally
contains internal device-specific registers which shouldn't (and can't)
be tracked by QEMU's dirty logging mechanism.  I've patched QEMU with
the following diff and it seems work for me, but all of these still
require for comments.


diff --git a/softmmu/memory.c b/softmmu/memory.c
index 71951fe4dc..0958db1a08 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
  {
      uint8_t mask = mr->dirty_log_mask;
-    if (global_dirty_log && (mr->ram_block || 
memory_region_is_iommu(mr))) {
+    RAMBlock *rb = mr->ram_block;
+
+    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
+                             memory_region_is_iommu(mr))) {
          mask |= (1 << DIRTY_MEMORY_MIGRATION);
      }
      return mask;


Thanks,
Zenghui

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/mmu.c
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
