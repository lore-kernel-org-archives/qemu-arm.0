Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp358297ejt;
        Wed, 14 Jun 2023 15:41:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zhYE9H7Q23s4NJ5ggXZKwFvFyAlkvIUMGzT5mzl0PgIDonGTyIK1LF2saPLEXs6lWqWBb
X-Received: by 2002:a05:6214:1cc9:b0:62f:e61c:ec52 with SMTP id g9-20020a0562141cc900b0062fe61cec52mr3066467qvd.54.1686782472877;
        Wed, 14 Jun 2023 15:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686782472; cv=none;
        d=google.com; s=arc-20160816;
        b=RiLAJqdidemYSGScsxwP5t7eHQOFBntgFEj0YUz5Ix9Y5KPvTN3LtVo5xwgTUeI4ij
         2aaEdaZXwWaZ/83tN0Cpq5JujHirGT5GSjm/SXIsxPS/VYoFGkXOquIEwxqdwaO5tmj/
         e7Pzp0VINYLc/sIQGT8S4DgpUr4whqaHcuXvzZkZfaasq8W7GDQerL9lLcGhSRPuEV/v
         x/fOih+4xkPDMDTGHMEfVvH2D6KLceJl9oHq6QFS/DWwBIsrKj3TlwCSwXYK3TUkIqSh
         pQdwpHuFd0gQkNeNjQNr968LSX7bXDkPXod4M9kg2RXiyekTEgHjJgXiUEOrvPoJ8ep1
         Y96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=812ToqOaq+TruAW8BDtGLvVqU/MJdFb5n9sfiyjsyX8=;
        b=LGKdTTVH1U5QcpAJnkO97stSKUKi/XaFHqzYfKiApNpcwwk4Y8AaOmxHYJqfGqLk/X
         8aQWa6q6+KCYMEVRLbpDiv82ZtEO6ggq7XORklIG1lD+pH0I74P6mPryitvRJRublTJ/
         58ZjBzsqiUc/PfeQxiIJzax3RFh+l5fsRw2UDfPAGz2bTGmbsWA2gSFmyEh3TIGLjsub
         MGGHXzLVUTEkgDVButVR2OgQt45WRfad9RFKwW0r/4L+a4+ziLCMMEE7pcnqGVjjjv2l
         eR4u3lHqGb4SC0eR0h7zbubVPtHMi9/eQPLzL01pIBYidqUyN9WOkp+5DvAz7EKP9Ofj
         M16Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=BcmBNfTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo14-20020a05620a530e00b0075f720945d0si5774220qkn.274.2023.06.14.15.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 15:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=BcmBNfTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ZAk-0001Ct-3x; Wed, 14 Jun 2023 18:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZAi-0001Ca-Nr; Wed, 14 Jun 2023 18:41:01 -0400
Received: from smtp-fw-52002.amazon.com ([52.119.213.150])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZAe-00054W-43; Wed, 14 Jun 2023 18:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1686782456; x=1718318456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=812ToqOaq+TruAW8BDtGLvVqU/MJdFb5n9sfiyjsyX8=;
 b=BcmBNfTXuxlI10zVKcNoiH6oLmJN72rzW/+pNew0tmu4tFILyCpPRRzB
 4HkSBwZG5Gxv0/NkqxH801lgbgtZgAX0YlYo85jM9lSWVIlHfyI8bnOfD
 H1jgWHV3IESQJs2CwmC0LRU3W4RFJdJCXTFrJoDLBDP5cwpZYESqxAC5B c=;
X-IronPort-AV: E=Sophos;i="6.00,243,1681171200"; d="scan'208";a="566653574"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 22:40:50 +0000
Received: from EX19MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com (Postfix)
 with ESMTPS id 24AEB60D91; Wed, 14 Jun 2023 22:40:49 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:40:41 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:40:39 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>
Subject: [PATCH 00/12] Introduce new vmapple machine type
Date: Wed, 14 Jun 2023 22:40:26 +0000
Message-ID: <20230614224038.86148-1-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=52.119.213.150;
 envelope-from=prvs=52269c73c=graf@amazon.de; helo=smtp-fw-52002.amazon.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NQ8Q+lMRKEB+

This patch set introduces a new ARM and HVF specific machine type
called "vmapple". It mimicks the device model that Apple's proprietary
Virtualization.Framework exposes, but implements it in QEMU.

With this new machine type, you can run macOS guests on Apple Silicon
systems via HVF. To do so, you need to first install macOS using
Virtualization.Framework onto a virtual disk image using a tool like
macosvm (https://github.com/s-u/macosvm)

  $ macosvm --disk disk.img,size=32g --aux aux.img \
            --restore UniversalMac_12.0.1_21A559_Restore.ipsw vm.json

Then, extract the ECID from the installed VM:

  $ cat "$DIR/macosvm.json" | python3 -c                                 \
  'import json,sys;obj=json.load(sys.stdin);print(obj["machineId"]) |    \
  base64 -d | plutil -extract ECID raw -

In addition, cut off the first 16kb of the aux.img:

  $ dd if=aux.img of=aux.img.trimmed bs=$(( 0x4000 )) skip=1

Now, you can just launch QEMU with the bits generated above:

  $ qemu-system-aarch64 -serial mon:stdio                                \
  -m 4G                                                                  \
  -M vmapple,uuid=6240349656165161789                                    \
  -bios /Sys*/Lib*/Fra*/Virtualization.f*/R*/AVPBooter.vmapple2.bin      \
  -pflash aux.img.trimmed                                                \
  -pflash disk.img                                                       \
  -drive file=disk.img,if=none,id=root                                   \
  -device virtio-blk-pci,drive=root,x-apple-type=1                       \
  -drive file=aux.img.trimmed,if=none,id=aux                             \
  -device virtio-blk-pci,drive=aux,x-apple-type=2                        \
  -accel hvf -no-reboot

There are a few limitations with this implementation:

  - Only runs on macOS because it relies on
    ParavirtualizesGraphics.Framework
  - Something is not fully correct on interrupt delivery or
    similar - the keyboard does not work
  - No Rosetta in the guest because we lack the private
    entitlement to enable TSO

Over time, I hope that some of the limitations above could cease to exist.
This device model would enable very nice use cases with KVM on an Asahi
Linux device.


Alexander Graf (12):
  build: Only define OS_OBJECT_USE_OBJC with gcc
  hw/misc/pvpanic: Add MMIO interface
  hvf: Increase number of possible memory slots
  hvf: arm: Ignore writes to CNTP_CTL_EL0
  hw/virtio: Add support for apple virtio-blk
  hw: Add vmapple subdir
  gpex: Allow more than 4 legacy IRQs
  hw/vmapple/aes: Introduce aes engine
  hw/vmapple/bdif: Introduce vmapple backdoor interface
  hw/vmapple/cfg: Introduce vmapple cfg region
  hw/vmapple/apple-gfx: Introduce ParavirtualizedGraphics.Framework
    support
  hw/vmapple/vmapple: Add vmapple machine type

 MAINTAINERS                                 |   6 +
 accel/hvf/hvf-accel-ops.c                   |   2 +-
 hw/Kconfig                                  |   1 +
 hw/arm/sbsa-ref.c                           |   2 +-
 hw/arm/virt.c                               |   2 +-
 hw/block/virtio-blk.c                       |  23 +
 hw/i386/microvm.c                           |   2 +-
 hw/loongarch/virt.c                         |   2 +-
 hw/meson.build                              |   1 +
 hw/mips/loongson3_virt.c                    |   2 +-
 hw/misc/Kconfig                             |   4 +
 hw/misc/meson.build                         |   1 +
 hw/misc/pvpanic-mmio.c                      |  66 ++
 hw/openrisc/virt.c                          |  12 +-
 hw/pci-host/gpex.c                          |  36 +-
 hw/riscv/virt.c                             |  12 +-
 hw/virtio/virtio-blk-pci.c                  |   7 +
 hw/vmapple/Kconfig                          |  30 +
 hw/vmapple/aes.c                            | 583 +++++++++++++++++
 hw/vmapple/apple-gfx.m                      | 578 +++++++++++++++++
 hw/vmapple/bdif.c                           | 245 ++++++++
 hw/vmapple/cfg.c                            | 105 ++++
 hw/vmapple/meson.build                      |   5 +
 hw/vmapple/trace-events                     |  47 ++
 hw/vmapple/trace.h                          |   1 +
 hw/vmapple/vmapple.c                        | 661 ++++++++++++++++++++
 hw/xtensa/virt.c                            |   2 +-
 include/hw/misc/pvpanic.h                   |   1 +
 include/hw/pci-host/gpex.h                  |   7 +-
 include/hw/pci/pci_ids.h                    |   1 +
 include/hw/virtio/virtio-blk.h              |   1 +
 include/hw/vmapple/bdif.h                   |  31 +
 include/hw/vmapple/cfg.h                    |  68 ++
 include/standard-headers/linux/virtio_blk.h |   3 +
 include/sysemu/hvf_int.h                    |   2 +-
 meson.build                                 |   9 +-
 target/arm/hvf/hvf.c                        |   7 +
 37 files changed, 2538 insertions(+), 30 deletions(-)
 create mode 100644 hw/misc/pvpanic-mmio.c
 create mode 100644 hw/vmapple/Kconfig
 create mode 100644 hw/vmapple/aes.c
 create mode 100644 hw/vmapple/apple-gfx.m
 create mode 100644 hw/vmapple/bdif.c
 create mode 100644 hw/vmapple/cfg.c
 create mode 100644 hw/vmapple/meson.build
 create mode 100644 hw/vmapple/trace-events
 create mode 100644 hw/vmapple/trace.h
 create mode 100644 hw/vmapple/vmapple.c
 create mode 100644 include/hw/vmapple/bdif.h
 create mode 100644 include/hw/vmapple/cfg.h

-- 
2.39.2 (Apple Git-143)




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



