Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1504594lfp;
        Fri, 1 Oct 2021 10:45:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD4XC03hYdeJPDtfZfGYMPT+EvAhFiv42wqtVcW7G0KZ4IBZDY+KJ2uuiR83d2fXGcb0/U
X-Received: by 2002:a9d:228a:: with SMTP id y10mr11697029ota.164.1633110322131;
        Fri, 01 Oct 2021 10:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633110322; cv=none;
        d=google.com; s=arc-20160816;
        b=IXSZC80a8kakDpIsldCJSu+PDKt1FNFEiiYEuGbrWro+GZtA/kwx3uCi4BqW3Ri3gj
         95Zo6qb4UV1gc0vXGDbAOV+/NbBJFjuiH65RbyWkTaiga+qg1lvoohRT5b3DyLrsZPcz
         ERVvhe0ViiXGE8X7xLnHrK7HuMnP4zpcciN8K7K4uZoKwyFvrLXtfQxPUZ5nrS/P5YZ7
         xmLg/bV5WJvJIOyG7uNZu9TCFcDdGXdQj0VUPCrCtXumEbSRCIQaAgN3KYonCz4yO4wF
         R/B6FMDxuQRVbsseM2w/j/2pp9CtMgAUNDSYx6liicjNgl861iIioYSkZ8YNhaG7TpNk
         l1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+GDR8oRq/C83jwYzaHDaSmBQ8xgB6bUk2ya2BldqeZk=;
        b=DKFDJd+Ryo91fJtGrMpbyGEj7MGeCHtkR67NdB54ZowwFTagseOnlWnl4WGs/LjnPt
         U5X7yGYeBWxxKWtJ9kzibBdWalenA2HkFQIpu1kJllkF+mdRWCRnRHy/hUEVt1IxWx7d
         OxtGDItFS8UXQIPXXI/nwR2E0U9YOcPBduzPExFHHEcoZw56fjXoLY86tnzQ1gwXi2hq
         mvdSqOCORVr691ZRMDQOQ/cRLMtAtcghLE1Corxh4+2l/WhqJaJfht4LmAczMgpIb84t
         CLc1Oeia1EK+4d90CuryUe4zalFZeiL0EZc3ZWMcYczNaXj8kv40Po6y/CusBI/cDYWS
         Smww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rp+nnGxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si10608245ooj.2.2021.10.01.10.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 10:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rp+nnGxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWMb3-00087r-A6
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 13:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUB-0000SD-Hr
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMU8-0000dt-Iq
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id b192so7771465wmb.2
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GDR8oRq/C83jwYzaHDaSmBQ8xgB6bUk2ya2BldqeZk=;
 b=Rp+nnGxqw0unZ4jNapgGNpTzXWKXLgk0slr3lBzAZIKdC47dwcUK+ZCNUgxScTAYCv
 s1xuKZ16qZtd28ZwWkKQoKCLRHrg5AQKBLno/XGeY5WK8FRn8X/p4QPFfCe9mqAsvo4I
 UwhabKlIXd7rzpiF3EMwR2qi/aDybutqA+1ao288Liui7GTYBxcnzg+bxVbpM9Mzpwhk
 B8z3AWjEp8Jm1P0IrObBeyGhm2VZvkkfTPtdzgD0VYaUyyEMB8LIKh8DTa8vuSrVpFiu
 Y/ZLb74MUTrQO1BHqm7S8lzsNtUzpAZbMVrZymLb1ncSYlgTy8DFQsZ3Ueur15iNvPmu
 PyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GDR8oRq/C83jwYzaHDaSmBQ8xgB6bUk2ya2BldqeZk=;
 b=tmV/9HpaDliRsRggu+7XYHA93rUH+5a2uFj0/BaxUiK5qym9ORh30zqvd6ISTuvVeB
 wzf2+RFQPyxIV9uaEHiiTKL0gzn4UxBN6H8j/3JbMjkXScyFqIuC7dhd+GyIOnWX9rs5
 jR4iON2XDr9QYG5npeWbBcmvkwOVVWWwgC6hZmiBLycoZy+L00ccls4F6R4awi7NqgE9
 IMrXXTh7ggWMwit6GI8/UW1lPYJXfYtFfkACNJdBczs/r1arvDcphcmK3DiH2dEk6Xct
 7NwWLAfF4yCznSTMRSA1/tOhSje3P6GKNHBPo/BQSbbQENARTdtj4Twp+/R8xaUs9Ve8
 9x3w==
X-Gm-Message-State: AOAM531Gq06ZvnhTrtax8+6eF0GSkTlv5mvVGyKHkbGGxB8E/v83gXiY
 jUW9O2EqryMgxetX/zw6PEn1Jw==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr5878193wms.50.1633109890827; 
 Fri, 01 Oct 2021 10:38:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:10 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Date: Fri,  1 Oct 2021 18:33:48 +0100
Message-Id: <20211001173358.863017-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pHEgFLA+v74h

Allow instantiating a virtio-iommu device on ACPI systems by adding a
Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

Changes since v3 [1]:
* Cleaned the IOMMU-uniqueness checks. Added patch 6 to have a
  single check on x86.
* Added patch 5 that allows to gracefully propagate errors when setting
  resv_mem properties.
* Squashed table blobs into patch 11.
* Addressed all other comments from v3.

Caveats:

* Series depends on "acpi: refactor error prone build_header() and
  packed structures usage in ACPI tables" [2]

* Since virtio-iommu doesn't support boot-bypass at the moment, firmware
  can't access storage behind the IOMMU to load bootloader or kernel.
  This will be solved by another series currently in flight [3]. In the
  meantime you can use a storage device that bypasses the IOMMU such as
  virtio-blk-pci (without iommu_platform property) or a bypass bridge
  (docs/iommu-bypass.txt).

You can find a description of the VIOT table, which will be included in
next ACPI version, here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

[1] https://lore.kernel.org/qemu-devel/20210914142004.2433568-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20210924122802.1455362-1-imammedo@redhat.com/
[3] https://lore.kernel.org/qemu-devel/20210930185050.262759-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (11):
  hw/acpi: Add VIOT table
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  hw/arm/virt: Use object_property_set instead of qdev_prop_set
  hw/i386: Move vIOMMU uniqueness check into pc.c
  pc: Allow instantiating a virtio-iommu device
  tests/acpi: allow updates of VIOT expected data files
  tests/acpi: add test cases for VIOT
  tests/acpi: add expected blob for VIOT test on virt machine
  tests/acpi: add expected blobs for VIOT test on q35 machine

 hw/acpi/viot.h                 |  13 ++++
 include/hw/i386/pc.h           |   2 +
 hw/acpi/viot.c                 | 112 +++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c       |   7 +++
 hw/arm/virt.c                  |  20 +++---
 hw/i386/acpi-build.c           |   5 ++
 hw/i386/pc.c                   |  30 ++++++++-
 hw/i386/x86-iommu.c            |   6 --
 hw/virtio/virtio-iommu-pci.c   |   7 ---
 tests/qtest/bios-tables-test.c |  38 +++++++++++
 hw/acpi/Kconfig                |   4 ++
 hw/acpi/meson.build            |   1 +
 hw/arm/Kconfig                 |   1 +
 hw/i386/Kconfig                |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
 17 files changed, 223 insertions(+), 24 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

-- 
2.33.0

