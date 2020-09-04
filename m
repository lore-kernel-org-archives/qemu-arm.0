Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2331631qvk;
        Fri, 4 Sep 2020 08:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT4SdXACI/F1b6wagVoD6/TgZm/1/e4ttiCfE7/sChZnoR9noEPA1pt7F1h+K5lbmcqwqj
X-Received: by 2002:a5b:486:: with SMTP id n6mr10066622ybp.432.1599234313672;
        Fri, 04 Sep 2020 08:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234313; cv=none;
        d=google.com; s=arc-20160816;
        b=Jjp9db47kztuUb9lB/PU46BeU+/1u5GV1s0AEsKCt4o8UPqaen8a8koIqQLGJ2CJ/T
         jkoqdWGaZXdLli0hbuYR/zZQoPt5tRKLuqPPW3gHphLG0xwhphmsiSaP6AWbR0cDvZ7P
         DKsFu3aikWOb0zk5n12b73FA+/QQlIuVlEHHZA6C+KhvqdPLjfFq/FUHWG6B6ELzGijK
         v5vSJS0gNyLwEggLPbJobsC+BwoPDGg/TdaSeCvoD6uudUdhorgwi8p0W2wDv4GTgdft
         zN+rPXI3HmlZdq9cndW4CSIgzEfqwpV/Xf7xTTixJ4qgWuSucdT/eboOokF+2dpFDLNy
         NDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=g1F57r74saSn+8lv2kyxtVMUYEXy6WA3Nk2z6wkeOh8=;
        b=o/BjBytv+LvdzXi6+P+7nw69nnwzHmaXrcPutAX6WjhRIxpC4UW1x++ovF0Uov0qEK
         B5c310GTIy37D4eJWGk9oYyP3XVty2Od6Qg5zzKQr6X2iVaW6j9uJ3iipSr4baLtBJfl
         /grBhEA812lFUmStLLakKZ082AptiRv4yPnHQ+zGdWiBYzwVoQOoukd7WFwBVBIAjowD
         s8D30cIPbYxlTJQdmX8RLKTbnOTbsUy/U3dw4dupNuNX1W3FHFYANmWL0yxmZoT/o0bl
         PuP63/W22mhhHU/N4yVBPv4njHaaRBkcVvsuj3w9wXzY8fxPF5RPyVUv5cG4TEUBcj1m
         MByg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LXEi1kMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si246853ybp.101.2020.09.04.08.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LXEi1kMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDto-0000jd-Bo
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtT-0000S4-GP
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:44:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40700
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtQ-0007Ok-RG
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599234287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g1F57r74saSn+8lv2kyxtVMUYEXy6WA3Nk2z6wkeOh8=;
 b=LXEi1kMC6Y58WptiQKOCV6Tlvih/ee8tfLucavCCs8pq8LthFo9ZVFca2Nhs7DxMdlEQpN
 ax0ocbHhZd9WlM/D7FWlNjGtKJmI1u5Niq+6JSOiFgzSDDDHe241Fty5PpgTH4LbZX1Wr3
 Nb6dzabTyJ40pN6PRyuOHvrmyETuhic=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-4Pdlgzc-Mn6Wdp7sdnOJ5w-1; Fri, 04 Sep 2020 11:44:44 -0400
X-MC-Unique: 4Pdlgzc-Mn6Wdp7sdnOJ5w-1
Received: by mail-wm1-f72.google.com with SMTP id a7so2339025wmc.2
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1F57r74saSn+8lv2kyxtVMUYEXy6WA3Nk2z6wkeOh8=;
 b=sgLnrWYmgyCQmyRWi0IMw8V6SDElNhXCta9YU7MUiMLqRGJRNXN9ebCRjewY9Vn4sz
 vRaYqhOQmeKYZHoFtvUnIGauvC1/xWR0oXg5xMMoIZTE9OIbC5tLc1IUILs2UxbqpQ+V
 zCNP/cTA8dxN7waO1/DOw+48aRPww07/r3M9j4Ns2QI5L1JjWNUke8WgV/o1q9hP//Rk
 JTeYNqgA92MHwCwR/P+uzyGQx+63dNdiHmkfBo9I/AbzcM2Bs0dxZCTeRC4kW2Oc7Cgz
 rmUBfFIxq2xILV8BxIAml/YrV5lvbccSlDJzmZEynsdhunxMg7wmNja/xktYGDLjjGcw
 yWNg==
X-Gm-Message-State: AOAM533FfmL6Gb1UO0DYgKwfCSJT9s9lo71/CqzP80iL9eV1+Qg3HJms
 Oz4witG0vesaGhtXitgWHeO1G7YG/VcCj40YGVswJMO7rhuJ/bDmTM9luuJRjWVBejeaJXdh/VG
 nc4twZkq1hhar
X-Received: by 2002:adf:e407:: with SMTP id g7mr8122162wrm.349.1599234283017; 
 Fri, 04 Sep 2020 08:44:43 -0700 (PDT)
X-Received: by 2002:adf:e407:: with SMTP id g7mr8122128wrm.349.1599234282832; 
 Fri, 04 Sep 2020 08:44:42 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id v2sm13178874wrn.44.2020.09.04.08.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:44:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 00/13] dma: Let the DMA API take MemTxAttrs argument and
 propagate MemTxResult
Date: Fri,  4 Sep 2020 17:44:26 +0200
Message-Id: <20200904154439.643272-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S4t/eIwFIE/3

Salvaging cleanups patches from the RFC series "Forbid DMA write
accesses to MMIO regions" [*], propagating MemTxResult and
adding documentation.

[*] https://www.mail-archive.com/qemu-block@nongnu.org/msg72924.html

Klaus Jensen (1):
  pci: pass along the return value of dma_memory_rw

Philippe Mathieu-Daudé (12):
  docs/devel/loads-stores: Add regexp for DMA functions
  dma: Document address_space_map/address_space_unmap() prototypes
  dma: Let dma_memory_set() propagate MemTxResult
  dma: Let dma_memory_rw() propagate MemTxResult
  dma: Let dma_memory_read() propagate MemTxResult
  dma: Let dma_memory_write() propagate MemTxResult
  dma: Let dma_memory_valid() take MemTxAttrs argument
  dma: Let dma_memory_set() take MemTxAttrs argument
  dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
  dma: Let dma_memory_rw() take MemTxAttrs argument
  dma: Let dma_memory_read/write() take MemTxAttrs argument
  dma: Let dma_memory_map() take MemTxAttrs argument

 docs/devel/loads-stores.rst   |   2 +
 include/hw/pci/pci.h          |   7 +-
 include/hw/ppc/spapr_vio.h    |  11 ++-
 include/sysemu/dma.h          | 156 +++++++++++++++++++++++++++-------
 dma-helpers.c                 |  16 ++--
 hw/arm/musicpal.c             |  13 +--
 hw/arm/smmu-common.c          |   3 +-
 hw/arm/smmuv3.c               |  14 +--
 hw/core/generic-loader.c      |   3 +-
 hw/display/virtio-gpu.c       |   8 +-
 hw/dma/pl330.c                |  12 ++-
 hw/dma/sparc32_dma.c          |  16 ++--
 hw/dma/xlnx-zynq-devcfg.c     |   6 +-
 hw/dma/xlnx_dpdma.c           |  10 ++-
 hw/hyperv/vmbus.c             |   8 +-
 hw/i386/amd_iommu.c           |  16 ++--
 hw/i386/intel_iommu.c         |  28 +++---
 hw/ide/ahci.c                 |   9 +-
 hw/ide/macio.c                |   2 +-
 hw/intc/spapr_xive.c          |   3 +-
 hw/intc/xive.c                |   7 +-
 hw/misc/bcm2835_property.c    |   3 +-
 hw/misc/macio/mac_dbdma.c     |  10 ++-
 hw/net/allwinner-sun8i-emac.c |  21 +++--
 hw/net/ftgmac100.c            |  25 ++++--
 hw/net/imx_fec.c              |  32 ++++---
 hw/nvram/fw_cfg.c             |  12 ++-
 hw/pci-host/pnv_phb3.c        |   5 +-
 hw/pci-host/pnv_phb3_msi.c    |   9 +-
 hw/pci-host/pnv_phb4.c        |   7 +-
 hw/sd/allwinner-sdhost.c      |  14 +--
 hw/sd/sdhci.c                 |  35 +++++---
 hw/usb/hcd-dwc2.c             |   8 +-
 hw/usb/hcd-ehci.c             |   6 +-
 hw/usb/hcd-ohci.c             |  28 +++---
 hw/usb/libhw.c                |   3 +-
 hw/virtio/virtio.c            |   6 +-
 37 files changed, 385 insertions(+), 189 deletions(-)

-- 
2.26.2

