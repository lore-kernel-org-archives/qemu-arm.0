Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232435ejc;
        Fri, 27 Jan 2023 07:15:56 -0800 (PST)
X-Received: by 2002:a05:600c:1caa:b0:3dc:4042:5c30 with SMTP id k42-20020a05600c1caa00b003dc40425c30mr1577315wms.10.1674832556665;
        Fri, 27 Jan 2023 07:15:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832556; cv=none;
        d=google.com; s=arc-20160816;
        b=tZkEh0tISI+S3Ps402k8OwUPWFMPB1LAB9wH0E6UfF4Fi7V1l2bssz7W2cIua5mPES
         gHJ8Z+nU//EpF6YtgYyxeOu3FXlVl77RHqTnSa7R20Di7kXEmMLhSVHhVBfPFYOrVETd
         Rb88f8ANlJ5BdIU+T9uUJcCdvioiF87hIoqKDSBvN13pJBUEM5sYzAZZJc/d+LFudtYg
         askJMysS6SfJb8ZaSAViRHVDmoSI7alkkQM7qLh4wTJ5Cacw3SZvF07OZQRnr4tSViq3
         IFC+UZfFJEC0dlRHjZezNONGYqthxPJR5Bh2hpxEi+mbB15WXyivcokreXWJlR9c3pcR
         hkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=v/loKsrqNXhKulPQFnHuZ1LK4Lzmu4sWulORUgMyhTs=;
        b=fO53REQcbdHT4cs1Qak72yhB2znUxdhdn1CMzZSMmqR2ucJGb0xNaaSyZ1FG/jaU/3
         fO87g4CDw/WbSO7h9ei581hGP3rt0KPBgBUtX3UaRuEKfKvde+BUn/BDwAVh5BHAxIBS
         qFpNkUSXvd7Pq84khskc14Nm79h9335jTryBD8lIwXGVUO3Nyke8aBwZ/zf1xXS87THH
         KqrFM3oolS0ndHBuqjNl5GZvmB28x3pf1GBMWclS7N2HDudeTJjSyH4lkWz1TVwhQb8g
         hExA0Jhr3gZpM7pNAtqLNLL7pO270SDtYB23JZnsbyLF98H2A7QPaV8ObZlT3h7n3Ilf
         Iahw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iyhes9sJ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay3-20020a05600c1e0300b003dc4073f2f9sor405378wmb.6.2023.01.27.07.15.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:15:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iyhes9sJ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/loKsrqNXhKulPQFnHuZ1LK4Lzmu4sWulORUgMyhTs=;
        b=iyhes9sJ/dpEnxEF/MtSp/w9m7mBKCwAwt1eWVs5mFQU2KgrP5/prUZBjoADxLX3nF
         +G7PAxCvGFO+n63J25agYzAh7MqSL+4KqmogsTcsBEoLBef2xwPqW/c6QkzoHqPBxiGA
         +M89wa5OI/q8meeDRWEDDPuI5mAybm3FCg3QLi8iTmj+7ZOv+V5+YGf1ZeVbFHcMSXIh
         +cJx4nO+idV1EmAn5stv6OyrD1MCAyjH4zdD+26xTy+WWqK4qZhxo5PYRuc6Zx8IwlFy
         PBQgxJkuSISJTDdbkGftcZcJvZcQtV8WFvwsdOz2HnOj8WNUb37ywkXFqi8Ze9959f+m
         RBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/loKsrqNXhKulPQFnHuZ1LK4Lzmu4sWulORUgMyhTs=;
        b=p1nPunh3B2pIE5VscvtJqA0Naeak/G7KzW3avz64MwQK8kem49ozV8J/XuemN4riVz
         RtBy6ij7lSv5YwOeVOL+pFERGAndOqa6bHpzEvVNUFolOXo4r1hgnZOfUbUVsAGxq/Ow
         bAGe5EceY8ke2j6d/uTC2Bthoz9h0R2OtITCHQ3Ihkf2ZnvG1g2CjQwDS7r7Dua/Jp7D
         fLq2Qv1fTrX/C82ObslkDfbRHUMY+ahYXIyzztSNYs+kCsNBfVJf99n5y2Ud9bBT753A
         IZS9kq7z9V1tO8GpjKBtFKVof9IDqf99SUAav+V5xdzNJCw6M1DGakFp4iM1vduHMglF
         FARg==
X-Gm-Message-State: AFqh2koXKYKCt7hEkVndhxgYcFlWKKt1avnBboy1Vmn2+0MbxmTjcXG4
	p22RlMyg4sogQibRjEYbU8fIJQNr
X-Google-Smtp-Source: AMrXdXsR6gdrAsjZ8Po2e4mtIRfSx/7/gaAPBRHMQcHjIgNDG1tWAJ+MgAqe7I3SRcOa8tRzcwvwsA==
X-Received: by 2002:a05:600c:22d2:b0:3d1:f0f1:ceb4 with SMTP id 18-20020a05600c22d200b003d1f0f1ceb4mr39395678wmg.19.1674832556337;
        Fri, 27 Jan 2023 07:15:56 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:15:55 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 00/16] arm: Run Arm CCA VMs with KVM
Date: Fri, 27 Jan 2023 15:07:13 +0000
Message-Id: <20230127150727.612594-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7MyP1yIoUnbP

The Arm Realm Management Extension (RME), part of the Arm Confidential
Computing Architecture (CCA), enables running confidential virtual
machines in a new "Realm" security state. While the host still manages
the resources of a guest running in a Realm, it cannot access them.

This series adds some support to QEMU for launching a guest in a Realm
with KVM. The KVM changes for CCA have been posted at [1].

Patches 2-4 introduce a new RmeGuest object that inherits from
ConfidentialGuestSupport and enable it for the virt machine. Like other
confidential guest architectures, launching a Realm VM requires two
command-line parameters:

	-object rme-guest,id=<id>,<parameters>
	-M confidential-guest-support=<id>

Patches 5-6 modify the KVM vCPU support. With CCA, KVM does not sit atop
the VM anymore but talks to a new component, the Realm Management
Monitor (RMM) which deals with the Realm stage-2 page tables and CPU
state. So KVM cannot access most vCPU registers anymore except for
passing parameters to RMM when handling VM exits. Likewise, the host
must not access any memory assigned to the guest (or else it gets a
granule protection fault). The private memfd work [2] by Chao Peng will
help with this.

Patches 8-9 deal with loading images into the Realm. Those are measured
by the RMM and part of the initial measurement, which allows a Realm
owner to attest that the Realm is running what it expects. Patches 10-14
pass parameters described in the RMM specification.


This initial posting only provides direct kernel boot with DTB, not
firmware boot. There is ongoing work to extend edk2 to run in a Realm,
which will require changes to QEMU. A few problems will come up:

* The FwCfg device provides kernel images, initrd, ACPI tables etc. This
  isn't an option for CCA because the guest does not trust what the host
  provides at runtime. I suggest to load all those things in Realm
  memory before boot, and pass their address in the device tree which is
  always present at the start of RAM. This will require new properties
  in the device-tree's chosen section.

* The guest firmware probably shouldn't be on an emulated flash device.
  For one thing, it doesn't need flash because it will store all
  variable in RAM. The flash device also relies on read-only mappings
  which are not supported by KVM RME at the moment, and trapping reads
  would break integrity. I suggest to either replace the flash device
  (address 0 of the virt machine) by RAM when RmeGuest is enabled, or
  load the firmware somewhere else in RAM.


Please see [1] for additional resource, including instructions for
building and running the CCA software stack on a model. An example
command-line:

qemu-system-aarch64
	-M virt -cpu host -enable-kvm -M gic-version=3 -smp 2 -m 256M -nographic 
	-M confidential-guest-support=rme0
	-object rme-guest,id=rme0,measurement-algo=sha512
	-kernel Image -initrd rootfs.cpio
	-append 'console=ttyAMA0 earlycon'
	-overcommit mem-lock=on

A branch with these patches is available at [3].

[1] https://lore.kernel.org/kvm/20230127112248.136810-1-suzuki.poulose@arm.com/
[2] https://lore.kernel.org/qemu-devel/20221202061347.1070246-1-chao.p.peng@linux.intel.com/
[3] https://jpbrucker.net/git/qemu cca/rfc-v1

Jean-Philippe Brucker (16):
  NOMERGE: Add KVM Arm RME definitions to Linux headers
  target/arm: Add confidential guest support
  target/arm/kvm-rme: Initialize realm
  hw/arm/virt: Add support for Arm RME
  target/arm/kvm: Split kvm_arch_get/put_registers
  target/arm/kvm-rme: Initialize vCPU
  target/arm/kvm: Select RME VM type for the scratch VM
  target/arm/kvm-rme: Populate the realm with boot images
  hw/arm/boot: Populate realm memory with boot images
  target/arm/kvm-rme: Add measurement algorithm property
  target/arm/kvm-rme: Add Realm Personalization Value parameter
  target/arm/kvm-rme: Add Realm SVE vector length
  target/arm/kvm-rme: Add breakpoints and watchpoints parameters
  target/arm/kvm-rme: Add PMU num counters parameters
  target/arm/kvm: Disable Realm reboot
  target/arm/kvm-rme: Disable readonly mappings

 docs/system/confidential-guest-support.rst |   1 +
 qapi/qom.json                              |  32 +-
 include/sysemu/kvm.h                       |   2 +
 linux-headers/asm-arm64/kvm.h              |  63 +++
 linux-headers/linux/kvm.h                  |  21 +-
 target/arm/cpu.h                           |   3 +
 target/arm/kvm_arm.h                       |  21 +
 accel/kvm/kvm-all.c                        |   8 +-
 hw/arm/boot.c                              |  10 +-
 hw/arm/virt.c                              |  48 +-
 target/arm/helper.c                        |   8 +
 target/arm/kvm-rme.c                       | 505 +++++++++++++++++++++
 target/arm/kvm.c                           |  20 +-
 target/arm/kvm64.c                         |  91 +++-
 target/arm/meson.build                     |   7 +-
 15 files changed, 822 insertions(+), 18 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

-- 
2.39.0
