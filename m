Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3568959dlj;
        Thu, 16 Jan 2025 00:35:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlCF5S4tJp8rKvoLHkUV17NuDZt6aFGtvqplmZ08p69FsGpQENeN7n2dVbNRVSLL6wKdPxr9miCH74aw==@linaro.org
X-Google-Smtp-Source: AGHT+IGHPi+Ll0LH6aiVnquJ0btt7GPU+DRx9tFbSe5FHi7EMa6oaDHQoAVLJlHn1/8O7xos8vIK
X-Received: by 2002:a05:620a:2b9c:b0:7b6:67a6:5adb with SMTP id af79cd13be357-7bcd973d017mr4969658785a.21.1737016523224;
        Thu, 16 Jan 2025 00:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737016523; cv=none;
        d=google.com; s=arc-20240605;
        b=OaPucOvDyFPLC83G/g3v/kjIaigyXTCoRaY5zec4fIf9vR29Fk9ImVhOxXT3vFXpOt
         /LsufN0EKhZrDS0/RtGRZdRz9X9tVyErNSabGgwRFJjrMAgp1vV9bVu+qLVCTta2ofgR
         rZVVFuLBxoSv14pBruy4jvsShlpAWBDVRuoly5qmbz/RFVUfI2dkbZV7UOE5RbZ7C+J5
         PKO2BqY6T9dWmyP+mi0EDnLKN106b/ln+6ImQeCcTAYChNRuEzcpe/6f3eNekjsTh0rS
         SHuWcltQjZ6UZYXUqXTMsk3kCqxtRozxxh+sgy+/MtBVfc8OvYn3jL4KKDNPX8TrWwzt
         bkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9jBXBuZ0HenLhru4iiFp+UeircELBFsUWyTTPkALPLo=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=Kd52/RRtZU4MTdxrOkNtT242MAYYNXlJBqQkw43qkbZTgXld/MjCVCiCSSBVsKDIYs
         HW7Zndl+HCAXj4SGqL4+2Gd8wL5XR4NnJxfBotECPgWTs+sR4XuEKVnNZvWSa8g0pO/W
         0DMIsBVL7/hz4SFYEdXK0ntjF3WMV6pxZAuWiDwGHkv9xovrxODPdbemnwtMhudXN9UH
         g8K2JHTOUH0A3KfqftQmweOjDcVTV+KIrejQ4Nf1zFP4Bz87MiFgJoR5N6Z0qo/ZAYOb
         2aaiTaJckrdL8xC374poB7J4rZRXiwFTXBWzKX6HpoaVocsI6+QKm7gnGQ0UhEz2a7qa
         dFAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aaOixg8k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce34fddffsi1750930285a.388.2025.01.16.00.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 00:35:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aaOixg8k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tYLKF-0007RJ-EW; Thu, 16 Jan 2025 03:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLKC-0007QG-Nn
 for qemu-devel@nongnu.org; Thu, 16 Jan 2025 03:34:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLK8-0005U2-7v
 for qemu-devel@nongnu.org; Thu, 16 Jan 2025 03:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737016434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9jBXBuZ0HenLhru4iiFp+UeircELBFsUWyTTPkALPLo=;
 b=aaOixg8k+YEEfASqOSqNmGuNn0FTfSLsvGrB/1c7u7a7A7lTzZbaQL6b6u81HIdGFlCd/4
 um4xLmai1VyNX0lV0p3FihMMyBssFrn7fzI4IA3318NeGXEBm99H6I3loxzI4OiA80Q8yk
 mRsXZxOGylwk3tA9qEO+tAmkmnxHwTg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-LQYQj3hlOnuBCYak42e1Jg-1; Thu,
 16 Jan 2025 03:33:50 -0500
X-MC-Unique: LQYQj3hlOnuBCYak42e1Jg-1
X-Mimecast-MFC-AGG-ID: LQYQj3hlOnuBCYak42e1Jg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C28E019560B7; Thu, 16 Jan 2025 08:33:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.32])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C5B0630001BE; Thu, 16 Jan 2025 08:33:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [RFC v4 0/5] ARM Nested Virt Support
Date: Thu, 16 Jan 2025 09:32:13 +0100
Message-ID: <20250116083339.674344-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.793,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sb7jSLRMJCXg

This is a rebase on top of qemu v9.2.0 and tested against Marc's nv-next
from Jan 9, 2025. As this branch is continuously evolving I put a snapshot
at https://github.com/eauger/linux/tree/nv_next_jan9_2025.

This was tested with rhel L1 guest (4k/64k) and various L2 guests
(buildroot, debian, rhel 4k/64k). I used mainline edk2.

The host needs to be booted with "kvm-arm.mode=nested" option and
qemu needs to be invoked with : -machine virt,virtualization=on

This series can be found at:
https://github.com/eauger/qemu/tree/v9.2.0-nv-rfcv4

Previous version from Miguel:
[1] https://lore.kernel.org/all/20230227163718.62003-1-miguel.luis@oracle.com/
Previous version from Haibo:
[2] https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/

---
v3 -> v4:
- fix: only set maint_irq if vms->virt

v2 -> v3:
- KVM EL2 only is set if virtualization option is set
- fixes regression with virtualization=off
- Add checks against unsupported GIC configs until the kernel does


Eric Auger (1):
  linux-headers: update to nv-next (Jan 9)

Haibo Xu (4):
  hw/arm: Allow setting KVM vGIC maintenance IRQ
  target/arm/kvm: Add helper to detect EL2 when using KVM
  target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is supported
  hw/arm/virt: Allow virt extensions with KVM

 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  1 +
 linux-headers/linux/kvm.h          |  4 +++-
 target/arm/kvm_arm.h               | 12 ++++++++++++
 hw/arm/virt.c                      | 13 ++++++++++++-
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 21 +++++++++++++++++++++
 target/arm/kvm.c                   | 21 +++++++++++++++++++++
 8 files changed, 72 insertions(+), 2 deletions(-)

-- 
2.47.1

