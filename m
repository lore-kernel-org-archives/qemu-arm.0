Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3316966lfb;
        Thu, 23 Dec 2021 04:09:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ/qvQ0nCWmXD6+Pirhm6UOuwdH3wU8CiAIM9JO8Ad5aQD5zEn5iaZVysd7uA8nB8IwiH3
X-Received: by 2002:a05:6902:150b:: with SMTP id q11mr3026997ybu.274.1640261375592;
        Thu, 23 Dec 2021 04:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640261375; cv=none;
        d=google.com; s=arc-20160816;
        b=sl4ioBs3PiNNSCoIK2kpiImhXORtcu5VHHTaWobX12A4oiGVkCPWP6hSCedutiFtYk
         g2PTX5nHKImx5KTepYV4IgKtVD5f+XBt+Uksfiu19O2TgS/JQUbkDWTK0kqQ5N15Y7yc
         mA/cp2csSMVe5quq6E0xYaf3NHEibbXyu/7dQkNmhiDXT8XLT+uyYZh6kJaYzVldbvOc
         vOnc6/ktUg2pXJJeLPmtJS2gShyiVcVEIiuR5j4PrWWW/Yy/FqHM2XNqUEow1fNQNaix
         XvOBTDrWTpqI2j46G+5+7p+3eL/x94u1iwvJrsdsGzCoW8FfbfLO4RWhJ2DAtMJRVQnS
         /nbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yGm9M5Gpreq0tGzVr/AUvpzhePzmzTXeINxxMia3hdM=;
        b=wUrPtsiJ8G6VWx421JFH/rU0RksvyGtCS/peTT3/RFBGgzGVnjgxFn3+NCvG0D+4dU
         dB6MQQwba8JA8oqq2abbixAs01HZYhTkxXdaI6T2qd4Mbr0e/QwQ0KQ6gcTqfJp6/uo6
         ZrtySrpVUT5bm7EYopgDeyYdP1TTm7EnX8pv4t7w0NjS8pA8qA8EQBumiDZcMs5xcoGA
         ZYImBKsCvei0SdrPIeBFyv2QNmr5Is6uIBUMet1ixv6RYIhzL87vAdQhH8ZGrT1LoR7O
         54mk7A0OHOT4J23CIbW1yyWVPiWjA/li7YnfQkh7x8kATL+U1uqSIW3THYAatsQwmybh
         EPyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P78Rkm/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si5736857ybt.301.2021.12.23.04.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P78Rkm/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0Mud-0000yP-0O
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mhh-0005ov-Ay
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mhd-0000Zv-JZ
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yGm9M5Gpreq0tGzVr/AUvpzhePzmzTXeINxxMia3hdM=;
 b=P78Rkm/7vBPyHUVQfgEcHMcHmN0hCbOSPOVChdEokUCg9goCbRKXHLJk0WPJJuOb9VTsoD
 B+nwTZgm//FcXbCIfLZAzIREaEu3fds/qnwDTYdQZILFhhlUDbPKlUq6L1gqvLwZD5XVaU
 Kn7NIIaW2F2sS3nhniG+nXquvUoXi9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-wF-5_hSjPEK9nx50EEffSQ-1; Thu, 23 Dec 2021 06:56:07 -0500
X-MC-Unique: wF-5_hSjPEK9nx50EEffSQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g189-20020a1c20c6000000b00345bf554707so3735052wmg.4
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nECtuzQXr4MaZMgWFk37eV6EBLhYZxfFT9EAGzIRk/A=;
 b=u86DFENvLkEMLkCN2OHnn/tiktAnhBeGsVlM2Rdoey1POmcwZ0CM6aYLT5UcThahC8
 zwqMAcuY39nSBKHaDbyuIfgZGEYZ6PCxlhyH+bHaoV3J7vwd1NBclZx/OSz0BTyuqOO0
 LsUIeJpofqYWu5+Mq0Hnz2c+lMo72C5RWFli4j3f7Bvtg+9gVIhUgzibfnG+2/pLNhCk
 rehk5iYkvc1eWI93BlrzcZH8Mr8Oo16oZsFeGOXp8IwxLTHp4SB9jMMgSpNCThHB0FCB
 Zo3wYV6w2Qj59eQX931ywUX4oUW7h41WD0P2worG15dWlHUri2UMe6lEFt39oNbcSZoo
 v1OA==
X-Gm-Message-State: AOAM531FzwY/oqy9z/LBN5bJ3bO7xKnzpm8HM7/RKpV8Ge9wzMSify72
 XSwW1eKGjFDb8cXVQXQf6DF24VwZbIRubaA2vuevsrgGI3oTzSl9p8P1LQX5t1pc5GyJ61+WbvH
 YYj3zMZxt3cqt
X-Received: by 2002:adf:bb4a:: with SMTP id x10mr1507400wrg.269.1640260565819; 
 Thu, 23 Dec 2021 03:56:05 -0800 (PST)
X-Received: by 2002:adf:bb4a:: with SMTP id x10mr1507375wrg.269.1640260565613; 
 Thu, 23 Dec 2021 03:56:05 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id b16sm5045581wmq.41.2021.12.23.03.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:56:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] hw: Have DMA APIs take MemTxAttrs arg & propagate
 MemTxResult (full)
Date: Thu, 23 Dec 2021 12:55:31 +0100
Message-Id: <20211223115554.3155328-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3D0koU8jjKIe

Hi Peter and Paolo.=0D
=0D
This series contains all the uncontroversary patches from=0D
the "improve DMA situations, avoid re-entrancy issues"=0D
earlier series. The rest will be discussed on top.=0D
=0D
The only operations added are:=0D
- take MemTxAttrs argument=0D
- propagate MemTxResult=0D
=0D
All patches are reviewed.=0D
=0D
If you don't see any objection, I plan to send this via=0D
a pull request by the end of next week.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (23):=0D
  dma: Let dma_memory_valid() take MemTxAttrs argument=0D
  dma: Let dma_memory_set() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw() take MemTxAttrs argument=0D
  dma: Let dma_memory_read/write() take MemTxAttrs argument=0D
  dma: Let dma_memory_map() take MemTxAttrs argument=0D
  dma: Have dma_buf_rw() take a void pointer=0D
  dma: Have dma_buf_read() / dma_buf_write() take a void pointer=0D
  dma: Let pci_dma_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_write() take MemTxAttrs argument=0D
  dma: Let dma_buf_read() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() propagate MemTxResult=0D
  dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult=0D
  dma: Let st*_dma() take MemTxAttrs argument=0D
  dma: Let ld*_dma() take MemTxAttrs argument=0D
  dma: Let st*_dma() propagate MemTxResult=0D
  dma: Let ld*_dma() propagate MemTxResult=0D
  hw/scsi/megasas: Use uint32_t for reply queue head/tail values=0D
  pci: Let st*_pci_dma() take MemTxAttrs argument=0D
  pci: Let ld*_pci_dma() take MemTxAttrs argument=0D
  pci: Let st*_pci_dma() propagate MemTxResult=0D
  pci: Let ld*_pci_dma() propagate MemTxResult=0D
=0D
 include/hw/pci/pci.h          | 38 +++++++++------=0D
 include/hw/ppc/spapr_vio.h    | 30 ++++++++----=0D
 include/sysemu/dma.h          | 90 +++++++++++++++++++++--------------=0D
 hw/arm/musicpal.c             | 13 ++---=0D
 hw/arm/smmu-common.c          |  3 +-=0D
 hw/arm/smmuv3.c               | 14 ++++--=0D
 hw/audio/intel-hda.c          | 13 +++--=0D
 hw/core/generic-loader.c      |  3 +-=0D
 hw/display/virtio-gpu.c       | 10 ++--=0D
 hw/dma/pl330.c                | 12 +++--=0D
 hw/dma/sparc32_dma.c          | 16 ++++---=0D
 hw/dma/xlnx-zynq-devcfg.c     |  6 ++-=0D
 hw/dma/xlnx_dpdma.c           | 10 ++--=0D
 hw/hyperv/vmbus.c             |  8 ++--=0D
 hw/i386/amd_iommu.c           | 16 ++++---=0D
 hw/i386/intel_iommu.c         | 28 ++++++-----=0D
 hw/ide/ahci.c                 | 18 ++++---=0D
 hw/ide/macio.c                |  2 +-=0D
 hw/intc/pnv_xive.c            |  7 +--=0D
 hw/intc/spapr_xive.c          |  3 +-=0D
 hw/intc/xive.c                |  7 +--=0D
 hw/misc/bcm2835_property.c    |  3 +-=0D
 hw/misc/macio/mac_dbdma.c     | 10 ++--=0D
 hw/net/allwinner-sun8i-emac.c | 18 ++++---=0D
 hw/net/eepro100.c             | 49 +++++++++++--------=0D
 hw/net/ftgmac100.c            | 25 ++++++----=0D
 hw/net/imx_fec.c              | 32 ++++++++-----=0D
 hw/net/npcm7xx_emc.c          | 20 ++++----=0D
 hw/net/tulip.c                | 36 +++++++-------=0D
 hw/nvme/ctrl.c                |  5 +-=0D
 hw/nvram/fw_cfg.c             | 16 ++++---=0D
 hw/pci-host/pnv_phb3.c        |  5 +-=0D
 hw/pci-host/pnv_phb3_msi.c    |  9 ++--=0D
 hw/pci-host/pnv_phb4.c        |  5 +-=0D
 hw/scsi/esp-pci.c             |  2 +-=0D
 hw/scsi/megasas.c             | 86 ++++++++++++++++++++++-----------=0D
 hw/scsi/mptsas.c              | 16 +++++--=0D
 hw/scsi/scsi-bus.c            |  4 +-=0D
 hw/scsi/vmw_pvscsi.c          | 20 +++++---=0D
 hw/sd/allwinner-sdhost.c      | 14 +++---=0D
 hw/sd/sdhci.c                 | 35 +++++++++-----=0D
 hw/usb/hcd-dwc2.c             |  8 ++--=0D
 hw/usb/hcd-ehci.c             |  6 ++-=0D
 hw/usb/hcd-ohci.c             | 28 ++++++-----=0D
 hw/usb/hcd-xhci.c             | 26 ++++++----=0D
 hw/usb/libhw.c                |  3 +-=0D
 hw/virtio/virtio.c            |  6 ++-=0D
 softmmu/dma-helpers.c         | 32 ++++++++-----=0D
 hw/scsi/trace-events          |  8 ++--=0D
 49 files changed, 542 insertions(+), 332 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D

