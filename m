Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1714639ejn;
        Fri, 21 Oct 2022 22:16:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vC7Z9VZMQilg8TtrdddTYH5WfEKQpnbOxxKY1h0bXhdNrh5m19/EJ1CdDLolgVADwDs6E
X-Received: by 2002:a05:622a:284:b0:39c:cbec:e1f0 with SMTP id z4-20020a05622a028400b0039ccbece1f0mr18810499qtw.451.1666415776927;
        Fri, 21 Oct 2022 22:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666415776; cv=none;
        d=google.com; s=arc-20160816;
        b=hIvkGwjsI9DUED8VPpkv7QXi+mgfBJbgRakZ7QeeKdcsozVvVzSKmFY65S18nYndxo
         hlHzdrB9dgyEWIWnpnVXXsU5woFHwnaSsQujonR/IFn5BL7O9SoJ31r5U8whEDpjdAvs
         trsPdv/cSt843bPAbH6+BxZcIvS3kT/v8ywqEFjHdDowosa30UPhOs6b5DYOQh9QsnGs
         Rb4KN0clcg6mRd9Oq408ksJRWlWqGhhxWkrkQrMcKb4u85kF4Jl0SimkOdmhm6ABQ75b
         YQRy5WTp+ILE87bUnU+AMth+pVYY2e/+g7mqf/CxcRhQ7pReK/FK/16zA4JO18fKbbKy
         UaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KSduAt5OWvLla49AODdFswSKTVSp8teWN5RFR6WXygs=;
        b=lDSHcK5qqBt4RO403bKtbaIViNNk8nFROidsMmDMSk5vVhuDExsT+1pWPQHItXuvI4
         noTECF770Sl9OqZrWfnnTc1x9FUNTBPjJv9RcW3JnUp5v/JMC1vRxlJRS3H7Y3eJTvU3
         bJhUdRKJWJQaap5yHaUm3s+Uj4gioYImcvHjnQ8Cks8ixYV8TDAhO3j2Virhuk47so0V
         XX+UZ2Y/ENgBfRLZQzppg8mOMEAP0ZUXtcdeTGmIX5h8KV26FwWsNS8Lcn9w7zOBDFZF
         jwF7BTmeHz4EfLCpoadrByAMcLtTgYImG4deXDWHQksFkuw3MpaxiguGDgWDPoQwTmEH
         iS0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=IGZTGdBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz10-20020a0562140e6a00b004b18639026esi12638753qvb.485.2022.10.21.22.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=IGZTGdBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6Jz-0005Fa-9g; Sat, 22 Oct 2022 00:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Jt-0005EJ-B9
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:14 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Jr-0003Gt-BI
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:12 -0400
Received: by mail-pl1-x630.google.com with SMTP id f23so4072331plr.6
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KSduAt5OWvLla49AODdFswSKTVSp8teWN5RFR6WXygs=;
 b=IGZTGdBA+0XF3fkB1E2JfP1QnJz5sVhf+uYum/WaWJ5OYXRx+7RXTFM23oKRh4Bv+i
 vovKHRhn1shdCW+SQUcWD9g780RMZwdRs1PMHXaBQpWJzMdhf/jW+xusemhLYaozOdU4
 YLrshT6NYyc7Nhx+W2hX8Smqwtf5gQrrYuWLacjiIl+j7POrvANX6s80hyPFtJEkllh5
 bZ5zNlZdpa+8VNl4Y8W0Lrt6f95I7+MkDkVwdVjpY13JGpSpRTMN3FaevQB0BFb6j9Ha
 Bka1PXUni/61yAUnjugi6F1NLn6RgLL2tjML0dCFEalxt8aPXTtciERu1j7DM0oF8l+h
 iu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSduAt5OWvLla49AODdFswSKTVSp8teWN5RFR6WXygs=;
 b=2Z5BX3XSjVhyHNPr/1nbBC2LY3Xbu7wMeZFO5vDV3SeHjHLjE2u2j2MsY2KvnEcL6g
 TFbowzZvhJEgxtaq8jVGFO4iaLZZQ32VCK5GNB+dXZ7Lpmiz6GAyqoRdooCZqUjPMTRJ
 EEtcFqlrA4AXQiqQScZ+jvTyVQ/7Y34QW66DA7ot76gS5DfVZTe9iAneJ9mAfOq31ds3
 ZFXNfwAKNeaAgU4rVerWQfFj1VfNglluqiemAATxyvOd9dV8LkxlRtPoA5t70T2Z5Ox2
 QTWMnyD5KvOea1/LTtC6U6IRKlpjNIbRGGY1FfETi5q9e/etixGr25UQfQbFukP8uAJn
 O28w==
X-Gm-Message-State: ACrzQf3f8LBjZ18ithCAltDgAvo/awrXdWLsyeWfeMjOe3RKwbOtVi9+
 nn6DvGczLxiXu13A/BxV9ZCpEQ==
X-Received: by 2002:a17:90b:d98:b0:212:d3f9:c311 with SMTP id
 bg24-20020a17090b0d9800b00212d3f9c311mr6195585pjb.243.1666413668637; 
 Fri, 21 Oct 2022 21:41:08 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v2 00/17] pci: Abort if pci_add_capability fails
Date: Sat, 22 Oct 2022 13:40:36 +0900
Message-Id: <20221022044053.81650-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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
X-TUID: J9ARZ7whpoke

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
capabilities never overlap. Therefore, we can always assert that
capabilities never overlap when pci_add_capability is called, resolving
these inconsistencies.

v2: Split the patch (Markus Armbruster)

Akihiko Odaki (17):
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
  hw/vfio/pci-quirks: Omit errp for pci_add_capability
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
 hw/pci/pci.c                       | 29 ++++-------------
 hw/pci/pci_bridge.c                | 21 ++++--------
 hw/pci/pcie.c                      | 52 ++++++++----------------------
 hw/pci/shpc.c                      | 23 ++++---------
 hw/pci/slotid_cap.c                |  8 ++---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++-------
 hw/vfio/pci.c                      | 14 +++-----
 hw/virtio/virtio-pci.c             | 12 ++-----
 include/hw/pci/pci.h               |  5 ++-
 include/hw/pci/pci_bridge.h        |  5 ++-
 include/hw/pci/pcie.h              | 11 +++----
 include/hw/pci/shpc.h              |  3 +-
 include/hw/virtio/virtio-pci.h     |  2 +-
 33 files changed, 99 insertions(+), 306 deletions(-)

-- 
2.37.3

