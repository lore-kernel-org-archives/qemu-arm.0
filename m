Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A3DC54F55
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonRr-0002ul-5H; Tue, 28 Jul 2026 15:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRm-0002r4-EG
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:39 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRk-0001KM-41
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:38 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso257052a91.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266794; x=1785871594; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mIfJvrcdId2+irdyMzI0RwFl4uOmWff7aVexV8ovtSk=;
 b=CAjxKLvNkkC/am0gmI2qJr6C3gVSzLGiAKCFq14ls5g8/Wppq32sGaZsNtRISRtj8W
 8efOSTbxltiOfAVRWwYo197A5wg9Q1J1KAuKaRdr8yhEHYfs2CSuqX2oxmOH44t9YnIP
 DIu9oz24dBHlXnfReL4XcZXr3PJBZnkFLbwQlTm0vfVoVR3ECTvif/lWY2hm2Bf+hL45
 xN36pd/CdZtsXyXXQuQIrKGaB5OrWR4MRLCVIVBARJdZrFfQUK5i77/CDK4Bc38hpkAx
 oYV/V8KwsbGEcCHIDBvSip8NZMDZb0d8J0qo+rDbpYYWX5dhWvJLXScs3peLGZaW1DTV
 mayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266794; x=1785871594;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mIfJvrcdId2+irdyMzI0RwFl4uOmWff7aVexV8ovtSk=;
 b=dmKke3M2xgfLrgPRoVvI0bVYktOt5rLiCXo/EL+p9P4drXuyfpcixNsGMWQpj76QLv
 wmrB24v7T01oncSd7+zqTv8e+QyHi0scEuDq//l/I/iv63etaJyI1dv25kbbt7aKYnWA
 Hb3MxAlqu8qG/yPy0H1Q+tivXB4aNED+vOHqh0oZ2XkD10+5jd8IwsDXWYgU5yNCAGCi
 gQULuT6zNHI45IGHmZz+hWXGU525v32DrdXPIIwciR9uQEUxkvGwYZ0EfTRd1+IUpUr+
 aXxfROYY8ksW3cg5N8v9Ipe5B+KxgguXV+/ssAxC9fEVPa5mBzo3i+rehafIydzU3eiF
 qvyw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqoz/MLVf6BZzGCHGRMJSMNu23jEzJRQBlqqznutNKu1lHqsfvrcY6U9YihoJ+ZCw4Zd/D538HpQA==@nongnu.org
X-Gm-Message-State: AOJu0YwQvbixhQar4vjIjGYIRmNi4O2LbSvLpF1K2wknT4vp9as31M07
 jsaJdzxWE8iRpLWFffOnJgFiDVb2UKqynVvVkGeufiHygW7XUsRAje9CLRmQMgoDop4=
X-Gm-Gg: AR+sD13zWUuTgxIZqSizhXUZhFeFPwzPiOo9Dez2pNwCSRu4pFiNUMtvXqheGWBQn5A
 vD7ekhnXdL4CI+y5QexoKKhIZWDB2Nm9N7Df6uhzzPGB8m/uQCEZXPMFtwrMDIB3okfYfNbQeR9
 cTj9Cilf6QkfI+uUAXYrhJ1Y5a6qCg9J9GB9EMftgmPuc9ZBmXdZrF8vkaeBffDtjFAY2HCjuqk
 Yqu5gnuuNPMSiZ1pZBOJH/pujUaIZ/uS4KI/SU7JIZLB2ETphvfZAprkzluUDevca3BHolA9CU2
 FD1z/+iclxQw6ExHyQrOWh6X1N+hiMssc3YfRsSxWN1IoT8csjrzbnTWCi7JarszrAC/XMxSir7
 o6Vub9eRUU1hAF7sPI1O2GuIi+9DnWzhxnjJ3VMAbO7zL0wpUXnodLgNGGFOs7lbWlG+9sQxjPF
 R/6vDvSNQDqK1OmrnsbwP9eWSiYbrh2W6pE0oZdj4=
X-Received: by 2002:a17:90b:1a8f:b0:387:e0db:3fad with SMTP id
 98e67ed59e1d1-38f6a53f3a4mr3897416a91.38.1785266793575; 
 Tue, 28 Jul 2026 12:26:33 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:26:31 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 00/24] Add Realm support to QEMU-VMM 
Date: Tue, 28 Jul 2026 13:26:06 -0600
Message-ID: <20260728192630.240375-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1032.google.com
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
from an Arm RME capable host using the following command line:

qemu-system-aarch64 \
 -M confidential-guest-support=rme0 -object rme-guest,id=rme0 \
 -cpu host -M virt -enable-kvm -M gic-version=3,its=on -nodefaults ..

It is a refactoring of Jean-Philippe Brucker's initial work dating from a while
back.  It is compatible with Steven Price's v14 revision [1] of his work adding
CCA support to KVM.

* We are currently working on rebasing the work to v15.

It was tested on the QEMU SBSA machine.  For convenience, a repository is hosted
here [2], along with the TF-A [3], RMM [4] and Linux kernel [5] for the SBSA
machine (compatible with Steven's v14 patchset).

Instructions to compile and run the entire stack can be found here [6].

Device Assignment is not included.

Thanks,
Mathieu

[1]. https://lore.kernel.org/kvm/20260513131757.116630-1-steven.price@arm.com/T/#m06dd14216aaf76acab65b0a76fb84653141ea64f
[2]. https://gitlab.com/Linaro/cca-public/qemu/-/tree/upstream-v2?ref_type=heads
[3]. https://gitlab.com/Linaro/cca-public/tf-a/trusted-firmware-a/-/tree/cca/v13?ref_type=heads
[4]. https://gitlab.com/Linaro/cca-public/rmm/-/tree/cca/v14?ref_type=heads
[5]. https://gitlab.com/Linaro/cca-public/linux/-/tree/upstream-v2?ref_type=heads 
[6]. https://gitlab.com/Linaro/cca-public/build-instructions

RFC v1:
https://lists.gnu.org/archive/html/qemu-devel/2026-07/msg02307.html

Changes for V2:
- Fixed linux headers to include correct bit shift for Realm VM (Gavin).
- Removed obsolete rme-guest options (Markus).
- Set ConfidentialGuestSupportClass::kvm_init() to kvm_arm_rme_init() (Gavin).
- Got rid of kvm_arm_rme_vm_type() (Gavin).
- Used kvm_vm_check_extension() instead of kvm_check_extension() to avoid
  error message when starting a Realm (Gavin).
- Removed obsolete kvm_arm_rme_init_guest_ram() (Gavin).
- Collected A-B and R-B.

Jean-Philippe Brucker (23):
  linux-headers: Add RME related definitions
  target/arm/kvm: Return immediately on error in kvm_arch_init()
  target/arm: Add confidential guest support
  target/arm/kvm: Split kvm_arch_get/put_registers
  target/arm/kvm-rme: Initialize vCPU
  target/arm/kvm: Create scratch Realm VM when requested
  target/arm/kvm: Use kvm_vm_check_extension() where necessary
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

Mathieu Poirier (1):
  target/arm/kvm-rme: Add mechanic to initialize realms

 docs/interop/firmware.json                 |   5 +-
 docs/system/arm/virt.rst                   |   9 +-
 docs/system/confidential-guest-support.rst |   1 +
 hw/arm/boot.c                              |  70 ++++-
 hw/arm/virt.c                              | 142 ++++++++--
 hw/core/loader.c                           |  15 +
 include/hw/arm/boot.h                      |   9 +
 include/hw/arm/virt.h                      |   2 +-
 include/hw/core/loader.h                   |  17 ++
 linux-headers/asm-arm64/kvm.h              |   9 +
 linux-headers/linux/kvm.h                  |  10 +-
 qapi/qom.json                              |   1 +
 target/arm/arm-qmp-cmds.c                  |   1 +
 target/arm/cpu.c                           |   5 +
 target/arm/cpu.h                           |  10 +
 target/arm/cpu64.c                         | 122 ++++++++
 target/arm/kvm-rme.c                       | 313 +++++++++++++++++++++
 target/arm/kvm-stub.c                      |   9 +
 target/arm/kvm.c                           | 202 ++++++++++++-
 target/arm/kvm_arm.h                       |  20 ++
 target/arm/meson.build                     |   5 +-
 21 files changed, 927 insertions(+), 50 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

-- 
2.43.0


