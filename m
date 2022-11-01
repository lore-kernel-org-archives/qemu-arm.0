Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2041103ejc;
        Tue, 1 Nov 2022 10:13:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Z032PBCWSVWNLXh0OscRgwjgilMVgtHtGUU+ISyWY1NGauOtXd2oBQxCwPm5qdxOpPQEZ
X-Received: by 2002:ac8:574a:0:b0:39d:16ce:8b84 with SMTP id 10-20020ac8574a000000b0039d16ce8b84mr15677142qtx.229.1667322837493;
        Tue, 01 Nov 2022 10:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322837; cv=none;
        d=google.com; s=arc-20160816;
        b=klCPw94F4J9Hj0e0Gf0HuJxTfFaiNGdYYnEybZcxcZRfKyDSVgRSbE1SNzwBOb4DvP
         g8UcAfCmHTFW5EY31LuTAKkRrddci0PfMuNwzH/EPUGoN28T5xX4dOk8yKaq6MtEB6uq
         9peQRHENs8skDQ9y/59D3ruDKhoApsX9vNp8LWEssDoukSC0KU60bA0aDZqIFlFDZMHB
         6AYX9yisNdpEeugqpREOJbKyI+E2g7lDa57KYHL/b7D5zi6zqpKE8LTd5btenHOp+Fth
         WgzjC/ujWXhVxhLCb6YeioF/+Q1ry6NxrwZ2c50tizd2jg1EilaPeSPrPM7yIr23kF6O
         HiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NzRNXyzMHzpUT2aPtRhgR6GeDDKNKPP691o2qPYLJos=;
        b=WdEA5PzQ9tAu1wof7sLpo3pjemmWnPZJSL3V7XVJj5bRQRX9AQ3L2zRYv1TgoQC3p8
         /7LSHQuEmxozxvf+3v0VxqJ4gfkQpGLiPxahUC/+MAqFzQRIdm97UdJ+h/0a9ZUPF3GO
         2TBf0lAfDDhB/TPbHehlup7ts7fewTuYjTRiIc3F6oyJlgcVE4MG2jpEoKBlcqFqZ9oW
         3Zd1T6MqXZW+jeDGPZSrTahvDHiVCiRp7vx5RkD4D7nVkhjZ29BFxIfr+ie9JPKvJwFc
         HRkCNNkEPEsE/sZm24RgEK4sIPCyW8ztEKl8TOfUc6dZGCW4KTbVu7tgaPB86zAXze7o
         laKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bDfIdk7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020ac85385000000b00397107724f3si5706160qtp.205.2022.11.01.10.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bDfIdk7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opsgX-0006m8-9S; Tue, 01 Nov 2022 10:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgW-0006lP-5d
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:56:12 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgS-0003Fl-VI
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:56:11 -0400
Received: by mail-pl1-x632.google.com with SMTP id v17so10767912plo.1
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NzRNXyzMHzpUT2aPtRhgR6GeDDKNKPP691o2qPYLJos=;
 b=bDfIdk7BhGMZhX7pDDPw31QnIRs6q5cCpp3eOk2EKonzJyB7H7fGq//kahVVSrUmsZ
 Igpnw/tR2ZDXHsSqzfqHSFO9Aa3KvuHCGu/3uBvgo8sIC7daOocDa6RMs2RJ4k3U9SYb
 u77Y+xh2bcDE2T7CXIzPE1daq+AvSU6xPd4xYue/7gjL63bjXuvukE7Up3ejnM/lVFAI
 8tdXOyDsZ5R0KnbwhM68d15o2/OOj0ToDYhl/lAqt203VhMX8skB5JUDjq5rJFdRNlJu
 LRPA41f+xC/w9uiaF6zzuA6ysmOSj/0pvQXV5P+s083Pd60W2RhOxTUDB03fGP2LNng6
 vzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NzRNXyzMHzpUT2aPtRhgR6GeDDKNKPP691o2qPYLJos=;
 b=DZ0VIm6IVh9+21k9JesBvRlmroKfqANn7v0a9Iq+LVhcR4l4wj3DescJIyKeLdf/wJ
 3Z3vlGWJpx1of6cwyGULtzWodYmcxg/wuHZVQS3j51cUJuxUuUOmXyu1SYjTgGAcCu1Z
 gXYNE30ZSWox8gjhvxALh/G8HQ+P2xZpJQTKcqnR5Hidtz2+F53TMDVGLL5FicHirYWE
 Zanim4iLvx7q1jUii7eA1sKTHGmV9xT9WGRBLeDDoBmLDCg1YUAEm47iOnWo0MjbZcsf
 mf40dIygcZUJq7c7JWHABrwvd3ncFoCpyIfHX8NhjjG6/uwDDbN421fR7V9wZYZ8m3SV
 3MQw==
X-Gm-Message-State: ACrzQf0r6dRIQ3Kykct/cZ878j3og+tmMgx8I2yfor0CpvlT8ZOP7x4K
 Z7Iw1fjvVxGcdRWsWyYGzTFCVA==
X-Received: by 2002:a17:90b:1e49:b0:20b:36a3:aba6 with SMTP id
 pi9-20020a17090b1e4900b0020b36a3aba6mr38881079pjb.2.1667314567446; 
 Tue, 01 Nov 2022 07:56:07 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:56:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v9 00/17] pci: Abort if pci_add_capability fails
Date: Tue,  1 Nov 2022 23:55:41 +0900
Message-Id: <20221101145558.3998-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nENURchinb/B

pci_add_capability appears most PCI devices. Its error handling required
lots of code, and led to inconsistent behaviors such as:
- passing error_abort
- passing error_fatal
- asserting the returned value
- propagating the error to the caller
- skipping the rest of the function
- just ignoring

The code generating errors in pci_add_capability had a comment which
says:
> Verify that capabilities don't overlap.  Note: device assignment
> depends on this check to verify that the device is not broken.
> Should never trigger for emulated devices, but it's helpful for
> debugging these.

Indeed vfio has some code that passes capability offsets and sizes from
a physical device, but it explicitly pays attention so that the
capabilities never overlap and the only exception are MSI and MSI-X
capabilities. Therefore, we can add code specific to the case, and
always assert that capabilities never overlap in the other cases,
resolving these inconsistencies.

v9:
- Return correct value with pci_check_capability_overlap()
  (Philippe Mathieu-Daudé)
- Use scripts/git.orderfile (Philippe Mathieu-Daudé)
- Simplify error checking in pci_add_capability() (Philippe Mathieu-Daudé)
- Improve comments (Philippe Mathieu-Daudé)

v8:
- Return boolean with pci_check_capability_overlap() (Philippe Mathieu-Daudé)

v7:
- Perform checks in vfio_msi_setup() and vfio_msix_setup() (Alex Williamson)

v6:
- Error in case of MSI/MSI-X capability overlap (Alex Williamson)

v5:
- Fix capability ID specification in vfio_msi_early_setup (Alex Williamson)
- Use range_covers_byte() (Alex Williamson)
- warn_report() in case of MSI/MSI-X capability overlap (Alex Williamson)

v4:
- Fix typos in messages (Markus Armbruster)
- hw/vfio/pci: Ensure MSI and MSI-X do not overlap (Alex Williamson)

v3:
- Correct patch split between virtio-pci and pci (Markus Armbruster)
- Add messages for individual patches (Markus Armbruster)
- Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Akihiko Odaki (17):
  hw/vfio/pci: Ensure MSI and MSI-X do not overlap
  pci: Allow to omit errp for pci_add_capability
  hw/i386/amd_iommu: Omit errp for pci_add_capability
  ahci: Omit errp for pci_add_capability
  e1000e: Omit errp for pci_add_capability
  eepro100: Omit errp for pci_add_capability
  hw/nvme: Omit errp for pci_add_capability
  msi: Omit errp for pci_add_capability
  hw/pci/pci_bridge: Omit errp for pci_add_capability
  pcie: Omit errp for pci_add_capability
  pci/shpc: Omit errp for pci_add_capability
  msix: Omit errp for pci_add_capability
  pci/slotid: Omit errp for pci_add_capability
  hw/pci-bridge/pcie_pci_bridge: Omit errp for pci_add_capability
  hw/vfio/pci: Omit errp for pci_add_capability
  virtio-pci: Omit errp for pci_add_capability
  pci: Remove legacy errp from pci_add_capability

 docs/pcie_sriov.txt                |  4 +--
 include/hw/pci/pci.h               | 12 +++++--
 include/hw/pci/pci_bridge.h        |  5 ++-
 include/hw/pci/pcie.h              | 11 +++----
 include/hw/pci/shpc.h              |  3 +-
 include/hw/virtio/virtio-pci.h     |  2 +-
 hw/display/bochs-display.c         |  4 +--
 hw/i386/amd_iommu.c                | 21 +++---------
 hw/ide/ich.c                       |  8 ++---
 hw/net/e1000e.c                    | 22 +++----------
 hw/net/eepro100.c                  |  7 +---
 hw/nvme/ctrl.c                     | 14 ++------
 hw/pci-bridge/cxl_downstream.c     |  9 ++----
 hw/pci-bridge/cxl_upstream.c       |  8 ++---
 hw/pci-bridge/i82801b11.c          | 14 ++------
 hw/pci-bridge/pci_bridge_dev.c     |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c    | 19 +++--------
 hw/pci-bridge/pcie_root_port.c     | 16 ++-------
 hw/pci-bridge/xio3130_downstream.c | 15 ++-------
 hw/pci-bridge/xio3130_upstream.c   | 15 ++-------
 hw/pci-host/designware.c           |  3 +-
 hw/pci-host/xilinx-pcie.c          |  4 +--
 hw/pci/msi.c                       |  9 +-----
 hw/pci/msix.c                      |  8 ++---
 hw/pci/pci.c                       | 47 +++++++++++++--------------
 hw/pci/pci_bridge.c                | 21 ++++--------
 hw/pci/pcie.c                      | 52 ++++++++----------------------
 hw/pci/shpc.c                      | 23 ++++---------
 hw/pci/slotid_cap.c                |  8 ++---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++-------
 hw/vfio/pci.c                      | 29 +++++++++++------
 hw/virtio/virtio-pci.c             | 12 ++-----
 33 files changed, 136 insertions(+), 309 deletions(-)

-- 
2.38.1

