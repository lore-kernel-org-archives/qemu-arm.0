Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp740239lfp;
        Tue, 14 Sep 2021 07:32:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztrCGA9Bwfs/Yp2DY6hB1G9SXReSCQEndLyOE9kj/RoPdLB6pqW1Pos1W5xsshXvcD1j1R
X-Received: by 2002:a2e:b551:: with SMTP id a17mr15462619ljn.128.1631629920379;
        Tue, 14 Sep 2021 07:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629920; cv=none;
        d=google.com; s=arc-20160816;
        b=SuHLUfGxHV7dxlCcEye8G6k0LuQB1qTRdc+UPoNOAyZeLBlgKUv2EgRYhW6XA/YDq4
         rErMciHJldCZtvwWg+dSJ8wPCOhX0LA0LfUBVDjAssrBOHY2mLKTRRKLgXbxvEulWH8F
         vhjIUozk/scqaKV2ZJngYcbU5GYcVS1v48+WfNkVGs8e/5a4QtQrhSyMwoARWi+HPaGm
         wvqIJtv9Vp++EIjo0KICRmS0yeF70lsLDzXqWLyL/b4Nkzs1ZDQeB/lcXF+rsIZ93SLZ
         DhcGvHg0lFLf54UlB+4zljaCYk3y+t9z3taxgIRCubf4ynER5j0BgcEkjbkc0VETA52o
         DoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=UHyMPYlDmIlbQAAhibWP9XaTuAff2yKrgLf7OIJQfpQ=;
        b=bInWkj7VuSirpX0zL4xD3yh1VdRYoLPBPaRNPF6EKV5kasxzob7gdGJQSffnV6Pzu9
         Zl5Ew7lhm7WiPJHVT01LR+kFvDVDuLkP4n4jFk3QZmmXv85HQaGU12y+KgF4/RL2jjCr
         AgY/z/46wPkoFHYeBMKDdcmXCRjI7D/1o92ug9qPL6iB//NPLuwys7cEgd1AB4mJjpQT
         hlNU94rW0QBRTW/JKe3vT+soS9GASoHkktki1mMtKl9VjITV44pfwoDq3JD0S43cnt7r
         XmnfAl9FytVSGRlotQB5ROImWDloVMTG3d24ntp6B8WyAulV+MwRSL2YCBR6h4m/3hRE
         krHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qS7g8zxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ak17si12505296ejc.338.2021.09.14.07.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qS7g8zxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9Tb-0007Rp-EP
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MS-0006Bx-An
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MH-0005Jv-D1
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso2706000wmc.1
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHyMPYlDmIlbQAAhibWP9XaTuAff2yKrgLf7OIJQfpQ=;
 b=qS7g8zxrXEidnQwPjtG+BfH2l5PHMHFvHxM9pQVY5k2uhQoulRiyJDxOg2gWL4+1nH
 GYN0qmanL1rFL/E7rg1yDgpSxiCOs37Yf4kPYOdCzeoS0BhWC0/omBikgIH5lliFN5To
 5fkmfnioP1Nlh2xOYKtZku/M9U2QcTFxw3LsrtPHgp1vjtgyVQfciIbaG04jFam49wLw
 DufB1SV8nB5Yj49XTTPRWxhLhspQrenrDwTP8+PfSkhbCU9X41g8Wq6JC9JK2QQ3liqO
 ajzoaH4iSBD4RpFYActGu7LjOOaQCQQ+W+BdijPvRnSgrBvJySp57NbSov11PCA7j0uJ
 pS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHyMPYlDmIlbQAAhibWP9XaTuAff2yKrgLf7OIJQfpQ=;
 b=x7c4xdGg53dMl3QEhISUc8JgNetNolQ3xZIMYaWjT7IErTmSj0xEPznctZ5d2+shB9
 URE8TFkThIHdu2xqlFCUivRJECwCa1v4oo053LjVgKKBCc+ete4wbabJrot+6apJhDVY
 mU2wbEJSW4Pa0b86eOxv1eGmZNlNcLwybhDXo43GXU3kFF7Hu38XXcPMxknTnXEp7s2Y
 3ZYMjV0i3u0wAc83SXGXQksl8YEGbSHw6txWVwq7n9HyxUuiprgqWVUsAhWcm0e16Lqx
 ZM3uvcPIm9a1EILyDg4DQxyKeATOKHWSn0N5DrY0DwvZmwAHs8OYwdNPGSuV5fT/lvWi
 N0sA==
X-Gm-Message-State: AOAM531i3kLuF87wBOBUfPT+yjVcQe4RfJnFZiwtLuLE7U0x8bIdEB9P
 G7sE9T9b0LLNiRy/05/bUYos3w==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr2538278wme.90.1631629460929; 
 Tue, 14 Sep 2021 07:24:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:20 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 00/10] virtio-iommu: Add ACPI support
Date: Tue, 14 Sep 2021 15:19:55 +0100
Message-Id: <20210914142004.2433568-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xEysmXz2T9TE

Allow instantiating a virtio-iommu device on ACPI systems by adding a
Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

Changes since v2 [1]:
* Use acpi_table_begin() and acpi_table_end().

  This series now depends on "acpi: refactor error prone build_header()
  and packed structures usage in ACPI tables" [2]

* Dropped ACPI header definitions.
* Dropped doc patch, to be revisited later.
* Squashed patch 5.
* Added tests for q35 and virt machines: patch 6 temporarily enables
  blob updates (for bisectability), patch 7 adds the two test cases and
  patches 8-10 add the three reference tables.


There is an important caveat at the moment: when virtio-iommu is
instantiated, device DMA faults until the guest configures the IOMMU.
Firmware is therefore unable to access storage devices and load the
bootloader and OS. Upcoming patches will align virtio-iommu with other
vIOMMUs and let DMA bypass the IOMMU during boot. In the meantime there
are several ways to circumvent the problem:
* Use plain old virtio-blk as storage, without enabling the
  'iommu_platform' property. DMA from the device bypasses the IOMMU.
* Place the storage device behind a PCI bus that bypasses the IOMMU,
  using the new 'bypass_iommu' bridge property.
  See docs/bypass-iommu.txt
* Use non-PCI storage devices, for example virtio-blk-device on the
  arm64 virt machine.

You can find a description of the VIOT table, which will be included in
next ACPI version, here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

[1] https://lore.kernel.org/qemu-devel/20210903143208.2434284-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20210907144814.741785-1-imammedo@redhat.com/

Jean-Philippe Brucker (10):
  hw/acpi: Add VIOT table
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  pc: Allow instantiating a virtio-iommu device
  tests/acpi: allow updates of VIOT expected data files
  tests/acpi: add test cases for VIOT
  tests/acpi: add expected VIOT blob for virt machine
  tests/acpi: add expected DSDT blob for VIOT test on q35
  tests/acpi: add expected VIOT blob for q35 machine

 hw/acpi/viot.h                 |  13 ++++
 include/hw/i386/pc.h           |   2 +
 hw/acpi/viot.c                 | 112 +++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c       |   7 +++
 hw/arm/virt.c                  |  15 +++--
 hw/i386/acpi-build.c           |   5 ++
 hw/i386/pc.c                   |  28 ++++++++-
 hw/virtio/virtio-iommu-pci.c   |   7 ---
 tests/qtest/bios-tables-test.c |  39 ++++++++++++
 hw/acpi/Kconfig                |   4 ++
 hw/acpi/meson.build            |   1 +
 hw/arm/Kconfig                 |   1 +
 hw/i386/Kconfig                |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9415 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
 16 files changed, 219 insertions(+), 16 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

-- 
2.33.0

