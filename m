Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59DCC43602
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:46:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEVi-0001HG-85; Tue, 07 Jul 2026 18:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVf-0001DU-Id
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVb-00044O-BA
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:23 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2caed617615so759755ad.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464189; x=1784068989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=u5/jba+UKg2b5zj7sGmlFFRYyZFPHIXadYV3/lK+14I=;
 b=r2T3Lhoq+vkRbBl+ca1y5gEZzqk1+E/sddMgUZCxC01x6a/PymOjBXnazYtZL3S3ps
 sFLiJASfxB/zvg4Xtt6rqQI0TqOw38yNgLW9AWUnzvTcS8/ijtbM5IThXI+zabQUQUno
 fc+QtOiksUdM5IWkVW0hQ1FP1o8gVNfy+gozhSWkpjJGrwTQR9nYPdpi+MgHqXyUAyHj
 wPLd2HBAV1s5ES5jHGfCyYTbSTJqf0Fk8sA4f09eAHaxq1vH8dvTkdv7DDc90b7SbURG
 vmADuV7xKoNgmJgkQ3t3oVX27xClrP2q7f2fgFDEZInqRvwEhitIiTU5C8nV66sIm5nD
 ku4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464189; x=1784068989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u5/jba+UKg2b5zj7sGmlFFRYyZFPHIXadYV3/lK+14I=;
 b=fyBriYsaxj3pjpFOPUmbGPsSdRQShuc8tJwd8qVG3hgUEXCnGg21TdoWyGnSDkL/TQ
 9KlJDGINFAyN3wPJR4F+n5zgphqnkloO7eaTJj1nAzaWSgOZPq5KDjpYHDWX8RfdO8ue
 EiqR+0JyOFZyFy8mjf9Koj9qf+1u20A7bY66hBNj1pzcd36XZU2SXNo0r+owaJeIr1GL
 Do+1YHtcjlwPK1qwN1a0DO6JZDdxjAy52JA9CjW2d+Ift1W/AmIYjI2X7wqkZxj9hq8Q
 ov4ip8EArnVjKvfMYGi3Q2zxRz8r9TTIh9+RVGXhH0xzrKZq94pYuKLuZxQw8hKpK1Ln
 Wy7w==
X-Forwarded-Encrypted: i=1;
 AHgh+RooCqSLB+3Xe7WnnEQGiBxUfwEvNNVEc4hv/vOGcA7XoTlMwEsFi3/65ouS5V2AbtVGUiE6/BR4JA==@nongnu.org
X-Gm-Message-State: AOJu0YyB1fC2YCwxpgq5QwedGGlyCp3vm/+xRYDHBJQcukztbHTHWgEj
 HtwL8fhCs2e4I//tyE6v/vLBRs/oL9yHivkFoZFgO3HG4sDywuXRit6pOyvbMxhHN1s=
X-Gm-Gg: AfdE7claa3LtBuq30Jp13JSDmSKsBq3LbvGrCpw9VbBvBPwaJyDxJc2W1JdBSkkslP0
 qvUBBwD7w2P00bGGgXDWtm0rnUL1boClZhDHHcCux8C4bRWzYrKjl4ieUliPi4oO1aCdlTNwXOU
 9VxCAsfOcsOEBxDVnbsRoZ6w0f/zEvcqzo4huEGxRPz9S03Gd194op8zH/4RjixP3B6AIIoKsyg
 ulegJJId913nk8UprpUvUu5W3t2HyVW4UQzThiPZveBxUki7ixxxgfrlK04HEg4igThCjkLhmfI
 IF3fQP8O4dOpGNM9Jee+DCZNOrrtunuuGooJFqUfxzwgkRjBnTg03qkxBlRNxCGAG0mKLDW/MYq
 CyRsEEg3pLKztp8Im2kuXM+ZiK/TsUuXW4MmgD2Oyh6bX+G5FpLNDvv7iHYsUkZzM4pksuspV0v
 9pU12XRygchvNL0QVpuJ3JR0zQ4FUfGT5l4iysVMI=
X-Received: by 2002:a17:902:d2ca:b0:2c9:da58:17dd with SMTP id
 d9443c01a7336-2ccbf02ea30mr66158095ad.34.1783464189142; 
 Tue, 07 Jul 2026 15:43:09 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:08 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 00/25] Add Realm support to QEMU-VMM 
Date: Tue,  7 Jul 2026 16:42:41 -0600
Message-ID: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patchset provides minimal functionality to start a Realm VM
from an Arm RME cabable host using the following command line:

qemu-system-aarch64 -M confidential-guest-support=rme0 -object rme-guest,id=rme0 \
        -cpu host -M virt -enable-kvm -M gic-version=3,its=on -nodefaults ..

This set is a refactoring of Jean-Philippe Brucker's initial work dating from
a while back.  It is compatible with Steven Price's v14 revision [1] of his work
adding CCA support to KVM.  

The RME capable host it was tested on is the QEMU SBSA machine.  For convenicence
a repository is hosted here [2], along with the TF-A [3], RMM [4] and Linux
kernel [5] for the SBSA machine (all compatible with Steven's v14 patchset).

Device Assignment is not included.

From hereon I will keep this set up to date with new releases from Steven.

Thanks,
Mathieu 

[1]. https://lore.kernel.org/kvm/20260513131757.116630-1-steven.price@arm.com/T/#m06dd14216aaf76acab65b0a76fb84653141ea64f
[2]. https://gitlab.com/Linaro/cca-public/qemu/-/tree/upstream-v1?ref_type=heads
[3]. https://gitlab.com/Linaro/cca-public/tf-a/trusted-firmware-a/-/tree/cca/v13?ref_type=heads
[4]. https://gitlab.com/Linaro/cca-public/rmm/-/tree/cca/v14?ref_type=heads
[5]. https://gitlab.com/Linaro/cca-public/linux/-/tree/cca/v14?ref_type=heads


Jean-Philippe Brucker (25):
  linux-headers: Add RME related definitions
  target/arm/kvm: Return immediately on error in kvm_arch_init()
  target/arm: Add confidential guest support
  target/arm/kvm-rme: Add mechanic to initialize realms
  target/arm/kvm: Split kvm_arch_get/put_registers
  target/arm/kvm-rme: Initialize vCPU
  target/arm/kvm: Create scratch Realm VM when requested
  target/arm/kvm: Use kvm_vm_check_extension() where necessary
  target/arm/kvm-rme: Initialise Realm Initial Address space
  hw/core/loader: Add a ROM loader notifier
  target/arm/kvm-rme: Keep track of images loaded in Realm memory
  target/arm/kvm-rme: Populate Realm with runtime images
  target/arm/cpu: Set number of breakpoints and watchpoints in KVM
  target/arm/cpu: Set number of PMU counters in KVM
  target/arm/cpu: Don't read Realm registers
  hw/arm/virt: Set proper conduit method for Realms
  hw/arm/virt: Embed Realm VM type with IPA address space
  hw/arm/virt: Reserve one bit of guest physical address for RME
  hw/arm/virt: Disable DTB randomness for confidential VMs
  hw/arm/virt: Move virt_flash_create() to machvirt_init()
  hw/arm/virt: Use RAM instead of flash for confidential guest firmware
  target/arm/kvm-rme: Add DMA remapping for the shared memory region
  docs/interop/firmware.json: Add arm-rme firmware feature
  hw/arm/boot: Load DTB as is for confidential VMs
  hw/arm/boot: Skip bootloader for confidential guests

 docs/interop/firmware.json                 |   5 +-
 docs/system/arm/virt.rst                   |   9 +-
 docs/system/confidential-guest-support.rst |   1 +
 hw/arm/boot.c                              |  74 ++++-
 hw/arm/virt.c                              | 138 +++++++--
 hw/core/loader.c                           |  15 +
 include/hw/arm/boot.h                      |   9 +
 include/hw/arm/virt.h                      |   2 +-
 include/hw/core/loader.h                   |  17 ++
 linux-headers/asm-arm64/kvm.h              |   9 +
 linux-headers/linux/kvm.h                  |  21 +-
 qapi/qom.json                              |   1 +
 target/arm/arm-qmp-cmds.c                  |   1 +
 target/arm/cpu.c                           |   5 +
 target/arm/cpu.h                           |  10 +
 target/arm/cpu64.c                         | 122 ++++++++
 target/arm/kvm-rme.c                       | 335 +++++++++++++++++++++
 target/arm/kvm-stub.c                      |  23 ++
 target/arm/kvm.c                           | 194 +++++++++++-
 target/arm/kvm_arm.h                       |  47 +++
 target/arm/meson.build                     |   5 +-
 21 files changed, 990 insertions(+), 53 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

-- 
2.43.0


