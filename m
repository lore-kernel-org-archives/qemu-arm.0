Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1430313ejc;
        Mon, 31 Oct 2022 17:59:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BshPfKo+q7AILwlGBqt3RobJHaPnlRHVkt3+tldVRGB0Pw6ZGIG7ZEllLrrEvxCuiuMRL
X-Received: by 2002:a05:622a:110:b0:39d:33f:7502 with SMTP id u16-20020a05622a011000b0039d033f7502mr13304782qtw.233.1667264395126;
        Mon, 31 Oct 2022 17:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264395; cv=none;
        d=google.com; s=arc-20160816;
        b=XvcoeZBH73bTP6MZ6fb1sji2RGAZYpe7aC53esTzxDYMRCSQVYYUjh1eVx916ysLgH
         OblXiz3BwWL67fmF2aqSpfn/DF81nbWb/LKxOCfywc91V9CP5TQTf1igbTeXbtx+D5wH
         fVhSY68uOQv81VMYUvckPTeoaULps2q3tvYBAP35Y7v0XzoYsCXefh8uQ82WH4Oz3jFB
         c+bsf24bciJ3P0tY6n05+XQ3FsUHYOf9EpW3qSjz7M42x6wK+q1ZIdS98uFCeMBIjpQt
         235B9rFzmdATl7GMNVsYMvlsiqycY/O58u+B9A2aH7QqRbjqi/q1i8ldNhvdZR/1Qfeh
         SJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=D3A97vv38tK0HQSEA8Uri4X+QySKta5nrqPO+Jn+Wqs=;
        b=eyyxZXgOWr7Zxt6GxwL4uEFnkPovXnmzH0tMUNLlD2nG2S0XSJHmaT89EPBm0adaeC
         SJ6QculDgSRbAtx/KyL8+HyHRwsWPLsz0Y+0TQmImI0VhehCASYUPKiqT5tTa/0NHz2E
         H8U3DjV6zPnCLTwMneRTga5UZNNtzwtfEUSkRlaDgspemnZPRFf2ZvIM3wtTE0e1AHKo
         PiRcAoDdZWTxy37F5P9/k4lsrvrmAmVG5/9KFq8d0EUAnWSKm1KbUdBAd0j2o+RsfHEh
         urOwbrUsgxWsyzj99Tt46lrFy9N10FEqxywRvroWqtZziR2bCKo/WoS2vSsB+i15RSJg
         NdkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=hMNHqjhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020ac87356000000b0038e72375b07si4762599qtp.692.2022.10.31.17.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 17:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=hMNHqjhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opfcX-0004Fm-Jq; Mon, 31 Oct 2022 20:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcW-0004FJ-5t
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:12 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcU-0005cC-HA
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso11675686pjc.2
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 17:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D3A97vv38tK0HQSEA8Uri4X+QySKta5nrqPO+Jn+Wqs=;
 b=hMNHqjhQEiHVqlLX1NjGX1Ps5J0gSEnmaPazGDyznNeM7Bvy0tmdWtlFw3G1lbMQze
 8j+EO9My5AaXcx40yjwr1yRpQ559YGyu7Twx6Bt+d/14acP2XR0xjt+xWsCFkZmDOX4O
 u19+DVMOzb5NfteAiUQnyKw0PSuFiz7F3Xec1JC6l7xBqqq/QN1VxUSh+NX9YS3Ln4DW
 ERF3tFbE3McIY5SBNfRn1DRpAMeelJ4zOpew1ukVvoxGAlXNWP+yNew/wp0+MikJ7ME2
 J2C2s0NCxQ7BTuupyd+zVA2jkmZo0zp2ieWzeXWoZ8CeEJlUSz0qeflBplFU2Au18SO3
 yN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D3A97vv38tK0HQSEA8Uri4X+QySKta5nrqPO+Jn+Wqs=;
 b=D+FpBd9Pb9vc6ONOHwjHsCYq2jnOoCwf91m2htS3wjjgbhTz01T9U7oTDc9vSP4qPp
 K7g7Jbf4CRaXiQXQSe3paVhhObL2nn4meJESk/X2QYG8P7Mj98tFh50LwLu0zMHHqWuo
 b8XPH/dkIXSu3QB7Q/75mtbYYh/hY3fMG/qRzKN1jVS84fsyMaBX4niNyZU8KdTVpB9k
 9szssJEE0E9BedmYJrJ0kxcSiQQUPXCnV5LzasxHC1xOw5upEgeg7xHI2x3kmJq7n9Fn
 LFgGRmvlfKFWa25JFRxiwrz2Br3vLM5zbUQNl7o/wPlFiAWMB5mcWL+JxsfisF7J1LOZ
 lbWQ==
X-Gm-Message-State: ACrzQf1+9jDNN3muQ27AHFnwIKbzcm92gBJHCEtKnKbp3eD4xtcwB2b7
 Cw8CVq8IDbknJkLOlpoiBsdRIQ==
X-Received: by 2002:a17:90a:680d:b0:213:d200:e992 with SMTP id
 p13-20020a17090a680d00b00213d200e992mr10501349pjj.220.1667264348730; 
 Mon, 31 Oct 2022 17:59:08 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:08 -0700 (PDT)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v7 00/17] pci: Abort if pci_add_capability fails
Date: Tue,  1 Nov 2022 09:58:42 +0900
Message-Id: <20221101005859.4198-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: HcP6RUH5CQ7A

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
 hw/pci/pci.c                       | 46 +++++++++++++-------------
 hw/pci/pci_bridge.c                | 21 ++++--------
 hw/pci/pcie.c                      | 52 ++++++++----------------------
 hw/pci/shpc.c                      | 23 ++++---------
 hw/pci/slotid_cap.c                |  8 ++---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++-------
 hw/vfio/pci.c                      | 29 +++++++++++------
 hw/virtio/virtio-pci.c             | 12 ++-----
 include/hw/pci/pci.h               |  8 +++--
 include/hw/pci/pci_bridge.h        |  5 ++-
 include/hw/pci/pcie.h              | 11 +++----
 include/hw/pci/shpc.h              |  3 +-
 include/hw/virtio/virtio-pci.h     |  2 +-
 33 files changed, 131 insertions(+), 309 deletions(-)

-- 
2.38.1

