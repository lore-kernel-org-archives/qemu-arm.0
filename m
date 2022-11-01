Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2041980ejc;
        Tue, 1 Nov 2022 10:15:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nimxqbcBToXwk7Zfq90xWNYJjxa7Vn5AFrcy54PW7xbcTy1UhwIVwCwLI0Dog6184FG6m
X-Received: by 2002:a37:8707:0:b0:6fa:d45:75d7 with SMTP id j7-20020a378707000000b006fa0d4575d7mr13691155qkd.318.1667322913941;
        Tue, 01 Nov 2022 10:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322913; cv=none;
        d=google.com; s=arc-20160816;
        b=n5JJlsFu0z8DhcKw0HMTOJCQCkY5Iq9PebeWFvnh3whauItCdTnMtZe2vJ/4+LbHfW
         aX0+Yl/ILZSCGLFdRCtboxyZ3Sp5kU5D6Y+OloGx0jaGvoaZTI7sU0xZ0BoN3+kd9ThV
         CsUyf0d4rJ5eyY7qb0wWCFRUTC+/ZXQB3Tq/nxsfiz2v35e6PApG0rlf3x2tPpXCodgS
         +WHnoiVzb4hPwwm7lyy2UMbFgHfwR3eyN/Lxwe8zATRrPDKnlD5N6eHYbQLyHHpfVcK5
         y5iIjpDaJbnncjiqxf1gHmDNcYmkGdfeVvcHONFwv8xO17hGZiJRMzuJIwk2773uMTpb
         GxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RAAx4otNZiMAa7oEUdCfdvwWSSh4pD9UYBMfNVOT/w8=;
        b=OdV2n6PyMnvcE1kBlauQ9G3CFFbVQr5a/KXk6ZcmICf/72p2UyJIhJH8LH4/nuyj7m
         62JOQGWvJq7HZCxLqw1y4NZGCpsbu0oAqlqOpm4XJP8Cx3uHSzEG1zBAOkxwynBRJblT
         xHgfCrMuOUvFoCjSAC031KYB5mtsvJPF3T+cDwghSaNIh9GtYm6oFrIt/xFglmh+5KDK
         wdXoTzQB1F8798B+RbDmSqZG9BvXYXPZ5I40yI2nLDG8QIHfly5bJQhzpOGgkYkv8yQB
         qt8bCW79Rd8ZhyNQvpCmbi4X2223bFbOCph2lThFIBrrsxjPCkz0rqc8hkV3Wicd5Aw5
         qJbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=O8EmdVnk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a258a00b006f3cd6cfdcdsi6576530qko.493.2022.11.01.10.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=O8EmdVnk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprmJ-0005i3-Ev; Tue, 01 Nov 2022 09:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmH-0005hF-B6
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:05 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmC-0003i8-Tv
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:03 -0400
Received: by mail-pf1-x429.google.com with SMTP id m6so13567388pfb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RAAx4otNZiMAa7oEUdCfdvwWSSh4pD9UYBMfNVOT/w8=;
 b=O8EmdVnkBAcsTFzkYWSu+PcuIeJkIhTgukSYgJHv5v4EO6VGX3CL5nbWLqDmfOHzwz
 rfDTSkVVQ3puHmjRiw2vwITGe8qLy+Hmw5jGyQ4KkJjy0QVi1uJe3pjCSrTkfJ9SP0Wj
 +rzWLhsP4zIKUNXlt9NkHJdNwCoKJPnnG904QCxQ93Oq2d4fl0oRx9pHQFB8C/7/e5/U
 t1yka/V14ytqGe1neGgWC5i65v87kqaNKPEOqkELpUrHsVpL1eKXowwqMm+twjfYGpA6
 806bLPTttPd03018XusH4QUNmjH+JDk6fAiJmw+DBd8GVBcHOPYLvOTequNNtaVRrWR3
 z0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RAAx4otNZiMAa7oEUdCfdvwWSSh4pD9UYBMfNVOT/w8=;
 b=zHjAcH//ALgZa3YDM470/sSXse9LNs6hDB3hQ4n+7QvMZwVUpJL2A+eFN5jMpIBQ9v
 UNg9SE/qa178FDrVQTwk00FWO7H6aRTqcVf6zIoE11jSvM8XBOwIEgkbkx/ucJxSEh6i
 RfLlC03epMsAZCEfai+Pj4Cjcega8aF0c4R48WeCkRCMOsme/bFMfdhcHwALmelP0s8U
 wKus2bNUCLeQ3018jld9paVSsavgoN3E2itFuXC+J2Bwc/Gig/jr+/uPtiM/+Ycltn/f
 llMT/Jx2wNTbBYI+e/wRj/BrQFMVyqvnGXNz8uq0DT7hwJUo/XYlkiMIsSlHBUD8c3B1
 5phA==
X-Gm-Message-State: ACrzQf02XeetDiytoEPFUt53KAplkFI4amiy1VBVwcvoetOgC73yt/lG
 MVxwzpVAS3QHZDKv8JrpUehmpcAw8Y5sb5tK
X-Received: by 2002:a65:6e8c:0:b0:435:144e:445e with SMTP id
 bm12-20020a656e8c000000b00435144e445emr17804590pgb.96.1667311079316; 
 Tue, 01 Nov 2022 06:57:59 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:57:58 -0700 (PDT)
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
Subject: [PATCH v8 00/17] pci: Abort if pci_add_capability fails
Date: Tue,  1 Nov 2022 22:57:32 +0900
Message-Id: <20221101135749.4477-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xSSittzD90L/

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
 hw/pci/pci.c                       | 48 +++++++++++++--------------
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
 33 files changed, 133 insertions(+), 309 deletions(-)

-- 
2.38.1

