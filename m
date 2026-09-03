Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB0AC624DE
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:39:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEX-0001Ht-Fe; Thu, 03 Sep 2026 15:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DET-0001Fd-3r
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEO-00045p-1G
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:19 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-381b831d535so314680a91.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464174; x=1789068974; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nWbGRl4D0xxd2T/AosPXgomaBayHTnR4GLenLBHLpTw=;
 b=HOdkAGSqbVrP7yfqIY/4kNVaDV8ZWYNh8zkIGXG08joTN18oOMC9FNn+hvaCqUQMOD
 VyAW7HpR+SJQtBHVztJpCPxS+D/CkLEoe2msUqOD1l+XTzIa9rbegdnzyhYRXARWP10b
 JmWri+kswzVtp8IozpB77slQIV0V4zW9cBcTbobX1ou+0l1WcBI7VqC6LJM4OE6/zBPu
 UjkSNbmb5UnzTS7J/fQPi0IyeAzD4hzuPcp8uzRE0jct52Cop7yDUHEnjjnHyBee+ULd
 jD2MB+cHkwDPA0fyl9IQg54shaPSE1tZi0sObSpzI49shM4uUlc/qPwgUpbxoOLxGdAH
 N3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464174; x=1789068974;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nWbGRl4D0xxd2T/AosPXgomaBayHTnR4GLenLBHLpTw=;
 b=k4zvZQbc+P6/dfOmYJSmrdMxwHB3A7tMyYZU504pwc0a47kajfaSz7cFjDQAnjSWoQ
 bdGEky0cmKaCoA7v8iGyEAQIPDdW+1deJ8n9fQ5iy89CWUyFyWDuCg4ksglvyVWHfCQ+
 6SNt/VsbLTwpX8j9JE0Gc0nTtune542WpdsgCeZt7EGSYDxwodgTLYOuTBUy7HuGWoKo
 O36jmf+c4FFatPweSDY6IJoqnyqVuM3Z1Z10sPAUFOQik+XtVObYJHxq/QFlmexmuHQe
 LWA08rtBNW158HVu/Q/X3CENlVVv1J/jtguX47MHkF9khfxRzHS/d8ZsUsPuYDpYQ3KQ
 GC9w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnyRLMvIhlybOPwqwNRKnr+lxfxao7nClJcATgUDSZXek0eAl9SJBJ/AKUvzSZazt8+vfRdINM+Q==@nongnu.org
X-Gm-Message-State: AFuF++nKNZ/HIHkFMaTNnW81zFiUz7f4pBG6SIaXisnxn19GSN+AMKTv
 FSDt87X3eC24hszJuoUy1uWOtck3OT9YNuGIgvR3ARj7E857pXvT+ccS7KlbucMmhH8=
X-Gm-Gg: AYBFou2/3B9Yhz379k8L1lwfBPnW0JXiagCr3A5VavQ2OB4J8rv+7cuwl2l2vWUUBTG
 ZEOU+8uTbcDUImR/EJGBenjcYNUHdfsAJ6s1I5m/v9+aa+pEorUSa9eCkN9/z2SpEZtEKKHtthF
 /SV7xTPtP6JKXiO8JhUzG31zeT+1AegZubf7s0XRABazeaHT0kpq9zzxJ/s1k87f7IWkTdikM+h
 Oqzlc65odRctMIaOB/04lgrm5lF6Sc+7KAX3KNJTbyQ162jS+BKbQRNM7KPgB35J42ejB/aqXzI
 vBLLYFewAh/jL/QS57k/zM2sk1t+jkVUitLdVi754O4cOjSJNL2N3EcBVp2AS/pvbOPbVdD9hAb
 CliWzr1UFZh7m/QhU0uAVOQ3Q59yt/FYa2XuBjyeHNIVQn7U59yiE6qBq1B57rxjuQRtmKnGD4H
 Zq1IBei6jxVVkhNLYqFET7ofG5pktIc2QxYyR2SlQdSkyJVA9wUBVGdDKZPJsVhIWgjCslnFzmo
 /z7VZa9V1nz4Nk=
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id
 98e67ed59e1d1-39b2610f2fbmr1046991a91.8.1788464173806; 
 Thu, 03 Sep 2026 12:36:13 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:13 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 00/24] Add Realm support to QEMU-VMM
Date: Thu,  3 Sep 2026 13:35:47 -0600
Message-ID: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 -M confidential-guest-support=rme0,memory-backend=ram0 \
 -object rme-guest,id=rme0,convert-in-place=on \
 -object memory-backend-guest-memfd,id=ram0,size=1G,share=on \
 -cpu host -M virt -enable-kvm -M gic-version=3,its=on -nodefaults ..

It is a refactoring of Jean-Philippe Brucker's initial work dating from a while
back.  It is compatible with Steven Price's v16 revision [1] of his work adding
CCA support to KVM.

This revision is based on Michael Roth's work on guest memfd in-place memory
conversion [2], rebased to QEMU master.  I left out the AMD specific changes  
from Michael's work because I can't test the result.  Other than the
modications to the linux headers, this series is identical to V3. 

It was tested on the QEMU SBSA machine.  For convenience, a repository is hosted
here [3], along with the TF-A [4] and RMM [5] for the SBSA machine (compatible
with Steven's v16 patchset).  The Repository for the kernel [6] is also
available.  Note that for the latter, defines for
KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES and KVM_CAP_ARM_RMI have been modified to
follow QEMU master. 

Instructions to compile and run the entire stack can be found here [7].

Device Assignment is not included.

Thanks,
Mathieu

[1]. https://lore.kernel.org/kvm/20260803134403.80630-1-steven.price@arm.com/
[2]. https://lore.kernel.org/kvm/20260528000416.8161-1-michael.roth@amd.com/
[3]. https://gitlab.com/Linaro/cca-public/qemu/-/tree/upstream-v4?ref_type=heads 
[4]. https://gitlab.com/Linaro/cca-public/tf-a/trusted-firmware-a/-/tree/cca/v13?ref_type=heads
[5]. https://gitlab.com/Linaro/cca-public/rmm/-/tree/cca/v16?ref_type=heads
[6]. https://gitlab.com/Linaro/cca-public/linux/-/tree/upstream-v4?ref_type=heads 
[7]. https://gitlab.com/Linaro/cca-public/build-instructions

RFC v3: https://lore.kernel.org/kvm/20260825220101.3443954-1-mathieu.poirier@linaro.org/
RFC v2: https://lore.kernel.org/kvm/20260728192630.240375-1-mathieu.poirier@linaro.org/
RFC v1: https://lists.gnu.org/archive/html/qemu-devel/2026-07/msg02307.html


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
 hw/arm/virt.c                              | 142 +++++++--
 hw/core/loader.c                           |  15 +
 include/hw/arm/boot.h                      |   9 +
 include/hw/arm/virt.h                      |   2 +-
 include/hw/core/loader.h                   |  17 ++
 linux-headers/asm-arm64/kvm.h              |   9 +
 linux-headers/linux/kvm.h                  |  10 +-
 qapi/qom.json                              |  13 +
 target/arm/arm-qmp-cmds.c                  |   1 +
 target/arm/cpu.c                           |   5 +
 target/arm/cpu.h                           |  10 +
 target/arm/cpu64.c                         | 122 ++++++++
 target/arm/kvm-rme.c                       | 336 +++++++++++++++++++++
 target/arm/kvm-stub.c                      |   9 +
 target/arm/kvm.c                           | 202 ++++++++++++-
 target/arm/kvm_arm.h                       |  20 ++
 target/arm/meson.build                     |   5 +-
 21 files changed, 962 insertions(+), 50 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

-- 
2.43.0


