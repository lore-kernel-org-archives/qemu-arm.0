Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp930129ejc;
        Mon, 31 Oct 2022 05:34:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65BvmgN47YDZgE8vU0ctF9xhlNkM61sROkhqpHxtzoxl5J8846B/Cj+uG+zbaHOdevBkee
X-Received: by 2002:a37:a8d2:0:b0:6f9:75d0:fddb with SMTP id r201-20020a37a8d2000000b006f975d0fddbmr9048375qke.101.1667219698680;
        Mon, 31 Oct 2022 05:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219698; cv=none;
        d=google.com; s=arc-20160816;
        b=DcSgSOWf14fxYT2f2M06kPzHn8haVWrdQTn+YFPYhcseOMAUox6FuSBs0efNcbIcHq
         8nxgGADdBQc34hMDeB+R3fOKAwl9QLTo3ys560TgOibARH14nRjVsTLs6jac2T8Konf5
         N+VVZD7aFI23Wop7NTyulvH6q+h3A9rdI71jp52PEHCvdrgxOYrUUCbsCshDpF0ussiz
         mf6AJs2Uz4zhgSb8zrCtyIfnKq5wFW3CqqsmmGZ41uBLXNPFwo5uX3TpJNVDH5CyFTcH
         k64fRURLq0sO9NFkRfehbdZQGTJ7vrCoAJwG5MFrXC+gSUFvqqemNLhnWyQFK8JfsXMo
         02aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+9rK7AghzXSMxopQW1vuwygFhWUTqUCD6zEWbuR7KxU=;
        b=0Essot0M72YyxqYYi0gneK0FOIA2q38KKb+ouOUtxzu5TlqVAXJXLt3fv+bxjXhnQe
         Sx6fRWhney5Z48e7uoCMTed463xMzDTPef5mRaLWaLv1Y2eAMmhojd7x3zK7d4E1iSqs
         Z9uYOxoAHB2PLw1Zn4PyiAlAclYoXYUuuL3+6Z7HekGXccdmBBRj4UjjI5F6yBKvNHEr
         VaJePEVcWMY9xhd7VE+z/mJIMLtoeMuzE+dch+B2zmw5jByBpLBtoSgFxXc3SlInYgAJ
         knJIKpIghnuCw55svDtVdIVb1cZbP5MsNmHnwlJw/ZM3FlvtfIALBkT7hPjLwBUfvRuv
         xXAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=u8e60Gw3;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv20-20020a05622a0a1400b003a4fdddf5d2si3950832qtb.685.2022.10.31.05.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:34:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=u8e60Gw3;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTzp-0003U8-Pm; Mon, 31 Oct 2022 08:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTyu-00030j-O7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:33:46 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTys-00042v-Ma
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:33:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h193so1877881pgc.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+9rK7AghzXSMxopQW1vuwygFhWUTqUCD6zEWbuR7KxU=;
 b=u8e60Gw38h1liWBfIHHfHfF63bQfR+kJ+WzYQWNuo+q4UDaPp31hIL73+5Xt0RE3Y5
 UsXcO+OZ6+Nlts8kn5nSkVwxsrdAgsbm7iv4nvnBbzA+0SonbkDl8OvQwxtfPLlcm7MQ
 KFyTwhaTLZME3eitzMFkoiGktCwrGXDzKx1NZxk69wTneLWO7XvKsKcLeNopOMohWjtS
 66LixJYL/gJjyh1x355C90fnU6FvtNctPuVwF3MgtFPmJ+cQJAW3Ycf7vooLOOFY7qck
 CRzJS79s/19fw/tYpsQzVDRwquFBADt4ZLaORR7w/nQNwH1/nDYWz4brdE3p7v7f8PtH
 96iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9rK7AghzXSMxopQW1vuwygFhWUTqUCD6zEWbuR7KxU=;
 b=Cnk1fU0/bD7oBse5uCS31zIwYwAwwLl2h3+/Are/BNn2zxGwB/N28zQ7sWfOM7fzuH
 Tn0QhEEyQLPmdtUNpKb100OsSHvwlxC+/BHT9z1WynbcyolP84pyydJ/wrgDBRz+j7Z4
 84m8GJFl5OgSrNg2kW23UqFdIyQ7WIUxsH01Ql2rinjRlz8Y8h45R6EbSO5H+P6zD0Da
 wvfE1lM2o1Q3kJJS1gZTQek1zgvbkOVTKu/4RymVYUpNj8w01kCubhWCUuiy8WWQRU48
 gFI3s1aovP8Ag89/e3lfkNhzT9zqoWD2I0odEql8YKfh1Z8mNDvlamscDWFHq+KwNYdb
 RrUA==
X-Gm-Message-State: ACrzQf1ZqXM55i4xJlQgVEOTsv46tmZwwTn05iCOFOVU+CxxRR2RjGTi
 C/Sz2gm72ay6ydWcRi00iLPDw5VL+vzOhNbW
X-Received: by 2002:a63:6a87:0:b0:46f:8fcc:de1a with SMTP id
 f129-20020a636a87000000b0046f8fccde1amr9425451pgc.429.1667219608551; 
 Mon, 31 Oct 2022 05:33:28 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:33:27 -0700 (PDT)
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
Subject: [PATCH v6 00/17] pci: Abort if pci_add_capability fails
Date: Mon, 31 Oct 2022 21:33:02 +0900
Message-Id: <20221031123319.21532-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: tiSkZ9kS8uyi

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

 docs/pcie_sriov.txt                |  4 +-
 hw/display/bochs-display.c         |  4 +-
 hw/i386/amd_iommu.c                | 21 ++-------
 hw/ide/ich.c                       |  8 +---
 hw/net/e1000e.c                    | 22 ++-------
 hw/net/eepro100.c                  |  7 +--
 hw/nvme/ctrl.c                     | 14 +-----
 hw/pci-bridge/cxl_downstream.c     |  9 +---
 hw/pci-bridge/cxl_upstream.c       |  8 +---
 hw/pci-bridge/i82801b11.c          | 14 +-----
 hw/pci-bridge/pci_bridge_dev.c     |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c    | 19 ++------
 hw/pci-bridge/pcie_root_port.c     | 16 +------
 hw/pci-bridge/xio3130_downstream.c | 15 ++----
 hw/pci-bridge/xio3130_upstream.c   | 15 ++----
 hw/pci-host/designware.c           |  3 +-
 hw/pci-host/xilinx-pcie.c          |  4 +-
 hw/pci/msi.c                       |  9 +---
 hw/pci/msix.c                      |  8 +---
 hw/pci/pci.c                       | 29 +++---------
 hw/pci/pci_bridge.c                | 21 +++------
 hw/pci/pcie.c                      | 52 ++++++---------------
 hw/pci/shpc.c                      | 23 +++------
 hw/pci/slotid_cap.c                |  8 +---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++----
 hw/vfio/pci.c                      | 75 ++++++++++++++++++++++--------
 hw/vfio/pci.h                      |  3 ++
 hw/virtio/virtio-pci.c             | 12 ++---
 include/hw/pci/pci.h               |  5 +-
 include/hw/pci/pci_bridge.h        |  5 +-
 include/hw/pci/pcie.h              | 11 ++---
 include/hw/pci/shpc.h              |  3 +-
 include/hw/virtio/virtio-pci.h     |  2 +-
 34 files changed, 153 insertions(+), 316 deletions(-)

-- 
2.38.1

