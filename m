Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41249CA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:20:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkB-00078L-ER; Fri, 02 Oct 2026 16:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjk9-00077r-Ms
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:33 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjk7-0005jU-Gf
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:33 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2d747f01363so51435085ad.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972429; x=1791577229; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/jAQNOurkbQgnKI6cZW7c8GvzLntSTadaL0gN8ffsdw=;
 b=eruuA1PlaGlIzKhOHDkkdElqVg5ZwQjHy/LuwMQqoHqmMk88U3cOxxdmbEDIWu4eWn
 7IXem3yXKVdkxkelL7UAmYsoldSE7v8kuZNhRV9Yys5N0WezZDbhGYzIm9/58PkRSDFu
 vLUXq5AfR1xH9+Tb2VYuA3b7Zgb6RF41HtSREF/4hnE2rVgNK1O9AkmahqM2sitRvyvk
 Gf+k0/JuEtqy6GnB2fcJPgrWwH9/raqHjkiPOHIzoKeSsIE8Oh4fuMatNkAzDkhyRWDJ
 LRW3kUlP6Wgd4Mn6cJNbo5B7S/t1ZhbkSGeCFjDeRypPiTkWRezeQ+rAY+i7ZP70kXD0
 06vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972429; x=1791577229;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/jAQNOurkbQgnKI6cZW7c8GvzLntSTadaL0gN8ffsdw=;
 b=PtCk14B243Lqb/MbSG5UhyYD8PFyHYgLHkE//BMuVh1wSX/hG5JT/bAM2gBj1XXunH
 tdjoNU5XxTItN+0ssqt/6uW9hoGwBG718/CZAsi0pHYMCraXwqg5qdzcMibMQbQhjsmW
 1Agv7aGulJzwcJq9OqsLSXo/EoLWnsiDWMVi/56cCFuHmmBeM22FYaNlqTQmgIKdt6wu
 PmeOxh/i2THXIWjirVvCwYI02ZUonkOvD8GgIF9EwBVcKreFPmA0JUNwbFpCnNRZt9zr
 BZhreZ8XTibsclDERS+hkoGUJdO/FWair5DjRmOQTBr69751yAqnnDhXjcwOMx/85Vpi
 HxKw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxucUR0M3kvcAkCUR55CeDsn6qHD+g1L9key7qC4ExffaH/5XC8mTFdD93zuftkwyx255EL2rOQEA==@nongnu.org
X-Gm-Message-State: AFq9FYIQWwJVAY4myDZwdLW0U6Cy6NewnIfWHofF1t/Lt5ykx1HnKCYI
 vla74/FEHJaFswAilOYnId80JZXWy8XBupTRcxPdbjXLu6uR2UsnAhwdLTMSMxTVXvk=
X-Gm-Gg: AYBFou1/8Yy26cxtDn8jTJwMtOeJ9bNJUXQySbUPa0vSN9Ygr2W9SwLfpCyLWDjPRtn
 Lv9gYj8SJzxWrSPYfALnLz9XG9As7aIMcPjflwuVdVrQT9RswJe4ng49of0ueJKGHz+gvr1jmB5
 uJODyRe11pdlnC1+rp+UY6C86Qr8H08vqmeSuoUpdwzwXL/jX+qnn8m7vM/34f81kzHo3wfxPXd
 RH8/fb8zy4/+MUJKUHtt8D28hP4lQgAA+sa7Z9GKhNIXWSabVjcH38G4ZU9jNEl52et3XDLYWMt
 p3ByVcwk6ltZVGIYBkBt1RBnkbEiWd6qzy2oY40KU+V6eTYjSYfpw2AVvItqPAnbxzY13dfuvzc
 IT8p27BUwCnD6VqIQWnhcOWHtb4+mnRs6SS90ZhzMsIdaGcEl7km6Hlh8t9eeMZvAuemVjyGNTy
 XvQoRGgmWvqCBvHro7cjUSmdm9hOtrE8BStA8Ol1UjArHKAN7JWY55zGOVVO1aprT0syMTp4emM
 MjS5Y3APSnsO08PmriMQWWn
X-Received: by 2002:a17:903:2b04:b0:2dd:c132:dc01 with SMTP id
 d9443c01a7336-2e49b6db84bmr33264295ad.46.1790972428637; 
 Fri, 02 Oct 2026 13:20:28 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:28 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 00/22] Add Realm support to QEMU-VMM 
Date: Fri,  2 Oct 2026 14:20:04 -0600
Message-ID: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x10.google.com
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
 -object memory-backend-memfd,id=ram0,size=1G,share=on \
 -cpu host -M virt -enable-kvm -M gic-version=3,its=on -nodefaults ..

It is a refactoring of Jean-Philippe Brucker's initial work dating from a while
back.  It is compatible with Suzuki Poulose's basic KVM plumbing for Realms [1],
supplemented with Aneesh Kumar's latest work on swiotbl [2].

This revision is based on Michael Roth's second revision of his work on
guest-memfd in-place memory conversion [3], rebased to QEMU master.  It was
tested on the QEMU SBSA machine.

For convenience a repository is hosted here [4], along with the TF-A [5],
RMM [6] and kernel [7].

Instructions to compile and run the entire stack can be found here [8].

Thanks,
Mathieu

[1]. https://lore.kernel.org/kvm/63211ffe-fbf7-490e-940a-f9028f9412f6@arm.com/T/#m6a4fb7b947ba687795a9dd3c90874d9fb1eef02e
[2]. https://lore.kernel.org/all/20260921063628.362078-1-aneesh.kumar@kernel.org/
[3]. https://lore.kernel.org/kvm/20260908205236.838281-1-michael.roth@amd.com/
[4]. https://gitlab.com/Linaro/cca-public/qemu/-/tree/upstream-v5?ref_type=heads
[5]. https://gitlab.com/Linaro/cca-public/tf-a/trusted-firmware-a/-/tree/cca/v13?ref_type=heads
[6]. https://gitlab.com/Linaro/cca-public/rmm/-/tree/cca/v20?ref_type=heads
[7]. https://gitlab.com/Linaro/cca-public/linux/-/tree/upstream-v5-kvmv21?ref_type=heads
[8]. https://gitlab.com/Linaro/cca-public/build-instructions

RFC v4: https://lore.kernel.org/kvm/20260903193611.1058589-1-mathieu.poirier@linaro.org/
RFC v3: https://lore.kernel.org/kvm/20260825220101.3443954-1-mathieu.poirier@linaro.org/
RFC v2: https://lore.kernel.org/kvm/20260728192630.240375-1-mathieu.poirier@linaro.org/
RFC v1: https://lists.gnu.org/archive/html/qemu-devel/2026-07/msg02307.html

Changes since V4:
- Discarded original 02/24 because it was merged (thank you Philippe).
- Adjusted QEMU version i patch 03/24. 
- Fixed changelog in 06/24 (Kohei).
- Combined patches 09 and 10 (Michael).
- Moved check for "rom->addr == -1" to rom_reset() (Michael).

Jean-Philippe Brucker (21):
  linux-headers: Add RME related definitions
  target/arm: Add confidential guest support
  target/arm/kvm: Split kvm_arch_get/put_registers
  target/arm/kvm-rme: Initialize vCPU
  target/arm/kvm: Create scratch Realm VM when requested
  target/arm/kvm: Use kvm_vm_check_extension() where necessary
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
 hw/core/loader.c                           |  24 ++
 include/hw/arm/boot.h                      |   9 +
 include/hw/arm/virt.h                      |   2 +-
 include/hw/core/loader.h                   |  17 ++
 linux-headers/linux/kvm.h                  |  18 +-
 qapi/qom.json                              |  13 +
 target/arm/arm-qmp-cmds.c                  |   1 +
 target/arm/cpu.c                           |   5 +
 target/arm/cpu.h                           |  10 +
 target/arm/cpu64.c                         | 122 ++++++++
 target/arm/kvm-rme.c                       | 325 +++++++++++++++++++++
 target/arm/kvm-stub.c                      |   9 +
 target/arm/kvm.c                           | 201 ++++++++++++-
 target/arm/kvm_arm.h                       |  20 ++
 target/arm/meson.build                     |   5 +-
 20 files changed, 958 insertions(+), 50 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

-- 
2.43.0


