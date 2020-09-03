Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp429548lfc;
        Thu, 3 Sep 2020 04:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqeroH6QIhiElTi7sx9irb4fwn/sczyDH0N0bhPJv6hh3DRGGNCPsEhlwiQ2+Qklcq5keW
X-Received: by 2002:a25:cecb:: with SMTP id x194mr1836562ybe.115.1599131330539;
        Thu, 03 Sep 2020 04:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131330; cv=none;
        d=google.com; s=arc-20160816;
        b=N+LvV9FLO7hripKlMHuMZE2T/8vBmKZbaKhiSZqGRpLN2UykTmY68a1MoS/vAdUXhd
         uTFlBwc+8vECuWHSw0UcuhsyDt9qScEns+2xUjlTVgLb41prMPBnzGAximkeV4vmcBEN
         O1xrvLeK8K4UhoyKJmpWSPzLyQtYcMWN4o+xbOex9tq6AymZVvt40R9lpahePJVlb3Vn
         +MuogsJ5TqzfoH43wMI181P/bVXCP9wEBeYUy/t+l4r5U3g8lQY7uC7nESmIQ3Y7uROe
         fjKGCGRuxIhjETc9zgdhjBVNYC7UkCvJT9ZCtrCPudAka1Ma4kDs3mLa79bDpLVwqqD4
         VRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nG2s8AHRR5bOS7oq0qn6KiPTbjmIW7pPorQg3LvZR9Y=;
        b=G7MGI9Wxovs4IPhvlbBfusSV45EWrjn3KLlmyvlqEfOrDcmopyx72xD+jb+nZpBslj
         UD3RfVko6n7WVBh6ddoI6ZnuAG3OGyGWZuln1PwElArqV8b6DvTEak1VH6jgkJldHpZa
         40AfvOEidaDcbv7qqCKtO3K8kT+L71bnRsmST6pDoRfUjzC5FmSi5KP68tQeU6GGzK9z
         omTyGWDDxyIR2SzbA6Q2L+M1Tucsrgc5zcxxeV0VuhaTGxpL7bkoGQF6of9rQihO388b
         ENLscw93sZbbyD4WhjoMbcUTmuo+NmQEMRBGE14pBIfWZv8YTB+B06lP+KlpJSEcQR7K
         5XrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EWOLAl0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si2440149ybb.254.2020.09.03.04.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EWOLAl0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDn6n-0007RD-Rx
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn6e-0007Pd-KP
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:08:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46206
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn6c-0005kF-O4
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nG2s8AHRR5bOS7oq0qn6KiPTbjmIW7pPorQg3LvZR9Y=;
 b=EWOLAl0xjuSHAO1vlRcJsIsS9PocyJF6g+NpjmSNBlMFrZIpUfxCXfezQlB9rjKa3af8+w
 EywSS/9YZDzHIFtKP+kMuKaOgBfGLoxdbY1tVJKy7VtXS8G6ovEU9hCYGKHBJGsmL22wMr
 RBYLUCssD9qkPuVkyHkvYAqhh04WuCM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-v6pcWPozM9CaKyzl-UYu9A-1; Thu, 03 Sep 2020 07:08:36 -0400
X-MC-Unique: v6pcWPozM9CaKyzl-UYu9A-1
Received: by mail-wm1-f70.google.com with SMTP id c198so845912wme.5
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nG2s8AHRR5bOS7oq0qn6KiPTbjmIW7pPorQg3LvZR9Y=;
 b=BRTcSDVjVKNkYtHezRnV0MsCSt8getyLYn5QhprcRq90/M+W27zu31iAZ5FuNyz0zV
 K0LW3X9TV+MRRGxtDhhq6epeJIgY0zRWLJKkbSuuu3VosecheznA8n0I8Zar3p2Vdyyh
 CFOC3XhpvOAybfORjLYb+mdq6VTyeVS0b3vIZRtVNcJfXDd+ZKwkc7cvTmedCbdmMURI
 sQ6hQEldlnw+pARFHZcvshgyRGmlx3RSu2ahA2Fr0+hTReTAiA+TfrXBLS25F0BN6R3Q
 fpcGZFPXpnloJ7brK5n7pNzEUUtu2Mo2oVSsT07HQJL6mQFBMInrrXrSlaBUIojVkeyc
 srDA==
X-Gm-Message-State: AOAM533NPF/qBzpdoQ2DTM1eHbmeSvXi6CH6c766pucf+W1wLUAZAqaW
 9VsDv+lj4jMG3soNk0OAVtHN7ZOWSjK6d3V8f5F7pqPb9q35lcMxZrDVNdnTS/D/dYo8jEo8kqV
 NgO8QelFeb0nd
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr1934881wrw.426.1599131315073; 
 Thu, 03 Sep 2020 04:08:35 -0700 (PDT)
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr1934826wrw.426.1599131314768; 
 Thu, 03 Sep 2020 04:08:34 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id g18sm4113486wru.27.2020.09.03.04.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:08:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/12] hw: Forbid DMA write accesses to MMIO regions
Date: Thu,  3 Sep 2020 13:08:19 +0200
Message-Id: <20200903110831.353476-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dDTlYy95AFKf

Hi,

I'm not suppose to work on this but I couldn't sleep so kept
wondering about this problem the whole night and eventually
woke up to write this quickly, so comments are scarce, sorry.

The first part is obvious anyway, simply pass MemTxAttrs argument.

The main patch is:
"exec/memattrs: Introduce MemTxAttrs::direct_access field".
This way we can restrict accesses to ROM/RAM by setting the
'direct_access' field. Illegal accesses return MEMTX_BUS_ERROR.

Next patch restrict PCI DMA accesses by setting the direct_access
field.

Finally we add an assertion for any DMA write access to indirect
memory to kill a class of bug recently found by Alexander while
fuzzing.

Regards,

Phil.

Klaus Jensen (1):
  pci: pass along the return value of dma_memory_rw

Philippe Mathieu-Daudé (11):
  dma: Let dma_memory_valid() take MemTxAttrs argument
  dma: Let dma_memory_set() take MemTxAttrs argument
  dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
  dma: Let dma_memory_rw() take MemTxAttrs argument
  dma: Let dma_memory_read/write() take MemTxAttrs argument
  dma: Let dma_memory_map() take MemTxAttrs argument
  docs/devel/loads-stores: Add regexp for DMA functions
  dma: Let load/store DMA functions take MemTxAttrs argument
  exec/memattrs: Introduce MemTxAttrs::direct_access field
  hw/pci: Only allow PCI slave devices to write to direct memory
  dma: Assert when device writes to indirect memory (such MMIO regions)

 docs/devel/loads-stores.rst   |  2 ++
 include/exec/memattrs.h       |  3 ++
 include/hw/pci/pci.h          | 21 ++++++++++---
 include/hw/ppc/spapr_vio.h    | 26 +++++++++------
 include/sysemu/dma.h          | 59 +++++++++++++++++++++--------------
 dma-helpers.c                 | 12 ++++---
 exec.c                        |  8 +++++
 hw/arm/musicpal.c             | 13 ++++----
 hw/arm/smmu-common.c          |  3 +-
 hw/arm/smmuv3.c               | 14 ++++++---
 hw/core/generic-loader.c      |  3 +-
 hw/display/virtio-gpu.c       |  8 +++--
 hw/dma/pl330.c                | 12 ++++---
 hw/dma/sparc32_dma.c          | 16 ++++++----
 hw/dma/xlnx-zynq-devcfg.c     |  6 ++--
 hw/dma/xlnx_dpdma.c           | 10 +++---
 hw/hyperv/vmbus.c             |  8 +++--
 hw/i386/amd_iommu.c           | 16 +++++-----
 hw/i386/intel_iommu.c         | 28 ++++++++++-------
 hw/ide/ahci.c                 |  9 ++++--
 hw/ide/macio.c                |  2 +-
 hw/intc/pnv_xive.c            |  7 +++--
 hw/intc/spapr_xive.c          |  3 +-
 hw/intc/xive.c                |  7 +++--
 hw/misc/bcm2835_property.c    |  3 +-
 hw/misc/macio/mac_dbdma.c     | 10 +++---
 hw/net/allwinner-sun8i-emac.c | 21 ++++++++-----
 hw/net/ftgmac100.c            | 25 +++++++++------
 hw/net/imx_fec.c              | 32 ++++++++++++-------
 hw/nvram/fw_cfg.c             | 16 ++++++----
 hw/pci-host/pnv_phb3.c        |  5 +--
 hw/pci-host/pnv_phb3_msi.c    |  9 ++++--
 hw/pci-host/pnv_phb4.c        |  7 +++--
 hw/sd/allwinner-sdhost.c      | 14 +++++----
 hw/sd/sdhci.c                 | 35 +++++++++++++--------
 hw/usb/hcd-dwc2.c             |  8 ++---
 hw/usb/hcd-ehci.c             |  6 ++--
 hw/usb/hcd-ohci.c             | 28 ++++++++++-------
 hw/usb/libhw.c                |  3 +-
 hw/virtio/virtio.c            |  6 ++--
 trace-events                  |  1 +
 41 files changed, 334 insertions(+), 191 deletions(-)

-- 
2.26.2

