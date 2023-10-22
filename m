Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865006ejb;
        Sun, 22 Oct 2023 08:55:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1fRJRt7HM11tO3b7eebh12r53D6gkTLFQT2P5DujH1EaaE9PlBmXvsgA/ps4Y2jD8Bj+b
X-Received: by 2002:a05:622a:1a99:b0:418:1235:5c84 with SMTP id s25-20020a05622a1a9900b0041812355c84mr13622727qtc.10.1697990106596;
        Sun, 22 Oct 2023 08:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990106; cv=none;
        d=google.com; s=arc-20160816;
        b=GvMrKtbsoroviM1BrSJUva6JkTKUJo5TyKFU8rYj9CbiL/D/+qkfc5iIxLVDw3jIJR
         AmRKO5Oak7cWftY46tufwpS6JUYx8gxcMCT6drQU0LDrOJTbMJi6eUQFXWI9rBVE90PA
         s7me8usPvoyuV2bF6twm7ohBRbo35AjJc9AGxHLD3KTjTzFW02MQAtNh1rZEBgKiX1vd
         n21MauUSW5T7YnAtu4gZJoWUOT1tfoBjiGsifbrLbgn49pd33xIeKEEDehHEPZNUrsb1
         euaIUd2kEri38ulNWHtsCZCkIx6yM+dMCKy6alKcNpWWelrnR/SeQ6guoIAR+eK6Ag/R
         iSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ozELbKHkKHeNb6bnWRyBsoC9+/E0sXiWudbUWInik4=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=w95trcSE0ufpY7uhkbG4/9cw+cwvInhxrIoiYBuGnXE5tuvCPzCohRxak0o0OwFgmh
         szTQpOMO8LSc0BZHIa1zb4DsIlqG3ylX3iQrG+X+HL8MmGDyf/xzXfc5MVYwz2pmT3UE
         3wn0ggO+aPQb3/wilKdgPlhvfCv8pESJMRIUIKkeUwW02uLvV6aWSqHMxY+MUGi08NRe
         hm+gx8dEungcBpQs51NzUU+8Ce2r/W4TAieikmVxUAgjbdOAg7iYMY+8gKLitSSdv0If
         bPvAXItACi8LMMPScj+JoFGukIPeYXcWPyicScZ970RRbR9w73l6zg5Oa2DxSNF7YF6M
         sxtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=jcnzNmsz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020ac87d92000000b0041986eba0b0si4084787qtd.396.2023.10.22.08.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=jcnzNmsz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qualp-0006EP-UF; Sun, 22 Oct 2023 11:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1qualZ-0005KU-HD; Sun, 22 Oct 2023 11:53:25 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1qualT-0008WN-Ff; Sun, 22 Oct 2023 11:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2ozELbKHkKHeNb6bnWRyBsoC9+/E0sXiWudbUWInik4=; b=jcnzNmszPyaB124Gx0UWtLrs3X
 bYojddjEskTFHs6cEv0HtIX9voAJJ6SdYknNtP0aDxdF8+UHaj91KXy3vt+8IOqVlsh0vhdZ4ASc/
 0ugSvkjXXV9s3DKzJXKFPcjbb16VPRejRJ3J8DzSGRLuy0Z/0Q55uEj216c3eA/GHwiMco3MMz3so
 Uar3JBlJG6kopv8j5w+nAqs8vcwmhE+Ku9VDi3DIvl+uUbmTF5mR2/zpM7BgdkfK4OULstoLI4OrN
 By6lz6SgNEE+D5sAtezMpGcB7uqjwXPx7d7w0ofTnxHX9plbhDMMxdiddmE3JE1qQ3YorVYEa3scA
 z5OejpZw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakG-008TGC-UF; Sun, 22 Oct 2023 15:52:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakG-001qYC-1V; Sun, 22 Oct 2023 16:52:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH 0/45] Rework matching of network devices to -nic options
Date: Sun, 22 Oct 2023 16:51:15 +0100
Message-Id: <20231022155200.436340-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y6zygaDPDVYG

In https://lore.kernel.org/qemu-devel/20231019154020.99080-20-dwmw2@infradead.org/
I lamented that the default NIC creation seemed fairly hackish but "that
isn't a yak I want to shave today."

Yet here we are...

Most platforms iterating directly over the nd_table[] are doing one of 
two things. Either they are creating the NIC for their platform and want
to find a matching -nic configuration for it, if such exists. Or they
are only going to create that platform NIC if a matching config *does*
exist.

All of those can be converted to the new qemu_configure_nic_device()
and qemu_create_nic_device() functions. The latter of which will call
qdev_new() to create the device (and apply the config) if a matching
NIC config does exist for it. The existing behaviour of each platform
has been preserved for now, despite it being apparently fairly random.

PCI and indeed XenBus can use a qemu_create_nic_bus_devices() which will 
create all NICs that live on a given bus type. That covers most 
platforms, but some PCI platforms do something special with the first 
NIC of a given type, placing it in the slot where it would have been on 
the real hardware. There were various inconsistencies in the way the 
platforms did so, and whether they cared what model the NIC was. Those 
subtle behavioural changes I *have* allowed to change, and now the 
pci_init_nic_slot() function will pick the first NIC that the user 
specified which isn't explicitly *not* the default type, and put that
in  the specified slot.

The tests for npcm7xx used to lament that they had to instantiate both
NICs even when they wanted to test only the second, because there was
no way to specify which hardware devices gets which configuration. I
made that untrue, by allowing 'emc0' and 'emc1' aliases, and fixed up
the test accordingly.

There are one or two special cases which want to do special things with
the MAC address of the primary NIC, to set up a system identification
(or force it to use an Apple OUI, in the case of m68k/q400). All those
work out relatively cleanly too.

And I can ditch the two ugly patches which fixed up the Xen network
device handling, and replace them with a simple call to the new
qemu_create_nic_bus_devices() function.

I suspect that we can remove the pci_init_nic_devices() from platform
code and just do it later, except for platforms which *care* which
PCI bus the dynamic devices go on (is that just sun4u which puts its
primary NIC onto a different bus?).

Finally, while we're at it, clean up -nic model=help to only print
the device models which are actually usable on the given platform
rather than just listing them *all*.

And now we can make nd_table[] and nb_nics static in net/net.c because
nothing else has any business poking at them directly.

David Woodhouse (45):
      net: add qemu_{configure,create}_nic_device(), qemu_find_nic_info()
      net: report list of available models according to platform
      net: add qemu_create_nic_bus_devices()
      hw/pci: add pci_init_nic_devices(), pci_init_nic_in_slot()
      hw/i386/pc: use qemu_get_nic_info() and pci_init_nic_devices()
      hw/xen: use qemu_create_nic_bus_devices() to instantiate Xen NICs
      hw/alpha/dp264: use pci_init_nic_devices()
      hw/arm/sbsa-ref: use pci_init_nic_devices()
      hw/arm/virt: use pci_init_nic_devices()
      hw/hppa: use pci_init_nic_devices()
      hw/loongarch: use pci_init_nic_devices()
      hw/mips/fuloong2e: use pci_init_nic_devices()
      hw/mips/malta: use pci_init_nic_devices()
      hw/mips/loongson3_virt: use pci_init_nic_devices()
      hw/ppc/prep: use pci_init_nic_devices()
      hw/ppc/spapr: use qemu_get_nic_info() and pci_init_nic_devices()
      hw/ppc: use pci_init_nic_devices()
      hw/sh4/r2d: use pci_init_nic_devices()
      hw/sparc64/sun4u: use pci_init_nic_devices()
      hw/xtensa/virt: use pci_init_nic_devices()
      hw/arm/allwinner: use qemu_configure_nic_device()
      hw/arm/aspeed: use qemu_configure_nic_device()
      hw/arm/exynos4: use qemu_create_nic_device()
      hw/arm/fsl: use qemu_configure_nic_device()
      hw/net/smc91c111: use qemu_configure_nic_device()
      hw/net/lan9118: use qemu_configure_nic_device()
      hw/arm/highbank: use qemu_create_nic_device()
      hw/arm/npcm7xx: use qemu_configure_nic_device, allow emc0/emc1 as aliases
      hw/arm/stellaris: use qemu_find_nic_info()
      hw/arm: use qemu_configure_nic_device()
      hw/net/etraxfs-eth: use qemu_configure_nic_device()
      hw/m68k/mcf5208: use qemu_create_nic_device()
      hw/m68k/q800: use qemu_configure_nic_device()
      hw/microblaze: use qemu_configure_nic_device()
      hw/mips: use qemu_create_nic_device()
      hw/net/lasi_i82596: use qemu_configure_nic_device()
      hw/openrisc/openrisc_sim: use qemu_create_nic_device()
      hw/riscv: use qemu_configure_nic_device()
      hw/s390x/s390-virtio-ccw: use qemu_create_nic_device()
      hw/sparc/sun4m: use qemu_configure_nic_device()
      hw/xtensa/xtfpga: use qemu_create_nic_device()
      net: remove qemu_check_nic_model()
      hw/pci: remove pci_nic_init_nofail()
      net: remove qemu_show_nic_models(), qemu_find_nic_model()
      net: make nb_nics and nd_table[] static in net/net.c

 hw/alpha/dp264.c                         |   4 +-
 hw/arm/allwinner-a10.c                   |   6 +-
 hw/arm/allwinner-h3.c                    |   6 +-
 hw/arm/allwinner-r40.c                   |  27 +---
 hw/arm/aspeed.c                          |   9 +-
 hw/arm/exynos4_boards.c                  |   6 +-
 hw/arm/fsl-imx25.c                       |   2 +-
 hw/arm/fsl-imx6.c                        |   2 +-
 hw/arm/fsl-imx6ul.c                      |   2 +-
 hw/arm/fsl-imx7.c                        |   2 +-
 hw/arm/gumstix.c                         |   6 +-
 hw/arm/highbank.c                        |  12 +-
 hw/arm/integratorcp.c                    |   5 +-
 hw/arm/kzm.c                             |   4 +-
 hw/arm/mainstone.c                       |   3 +-
 hw/arm/mps2-tz.c                         |   8 +-
 hw/arm/mps2.c                            |   2 +-
 hw/arm/msf2-soc.c                        |   6 +-
 hw/arm/musicpal.c                        |   3 +-
 hw/arm/npcm7xx.c                         |  16 +-
 hw/arm/realview.c                        |  25 ++-
 hw/arm/sbsa-ref.c                        |   4 +-
 hw/arm/stellaris.c                       |  30 +++-
 hw/arm/versatilepb.c                     |  15 +-
 hw/arm/vexpress.c                        |   4 +-
 hw/arm/virt.c                            |   4 +-
 hw/arm/xilinx_zynq.c                     |  11 +-
 hw/arm/xlnx-versal.c                     |   7 +-
 hw/arm/xlnx-zynqmp.c                     |   8 +-
 hw/cris/axis_dev88.c                     |   9 +-
 hw/hppa/machine.c                        |   6 +-
 hw/i386/pc.c                             |  20 +--
 hw/loongarch/virt.c                      |   4 +-
 hw/m68k/mcf5208.c                        |  20 +--
 hw/m68k/q800.c                           |  28 ++--
 hw/microblaze/petalogix_ml605_mmu.c      |   3 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c |   3 +-
 hw/mips/fuloong2e.c                      |  16 +-
 hw/mips/jazz.c                           |  16 +-
 hw/mips/loongson3_virt.c                 |   4 +-
 hw/mips/malta.c                          |  15 +-
 hw/mips/mipssim.c                        |  13 +-
 hw/net/etraxfs_eth.c                     |   5 +-
 hw/net/lan9118.c                         |   5 +-
 hw/net/lasi_i82596.c                     |   3 +-
 hw/net/smc91c111.c                       |   5 +-
 hw/openrisc/openrisc_sim.c               |  18 +--
 hw/pci/pci.c                             |  73 +++------
 hw/ppc/e500.c                            |   4 +-
 hw/ppc/mac_newworld.c                    |   4 +-
 hw/ppc/mac_oldworld.c                    |   4 +-
 hw/ppc/ppc440_bamboo.c                   |  13 +-
 hw/ppc/prep.c                            |   7 +-
 hw/ppc/spapr.c                           |  18 +--
 hw/riscv/microchip_pfsoc.c               |  13 +-
 hw/riscv/sifive_u.c                      |   7 +-
 hw/s390x/s390-virtio-ccw.c               |  11 +-
 hw/sh4/r2d.c                             |   6 +-
 hw/sparc/sun4m.c                         |   8 +-
 hw/sparc64/sun4u.c                       |  27 +---
 hw/xen/xen-bus.c                         |   4 +
 hw/xen/xen_devconfig.c                   |  25 ---
 hw/xenpv/xen_machine_pv.c                |   9 --
 hw/xtensa/virt.c                         |   4 +-
 hw/xtensa/xtfpga.c                       |  11 +-
 include/hw/cris/etraxfs.h                |   2 +-
 include/hw/net/lan9118.h                 |   2 +-
 include/hw/net/ne2000-isa.h              |   2 -
 include/hw/net/smc91c111.h               |   2 +-
 include/hw/pci/pci.h                     |   7 +-
 include/hw/xen/xen-legacy-backend.h      |   1 -
 include/net/net.h                        |  18 +--
 net/net.c                                | 252 +++++++++++++++++++++++++------
 system/globals.c                         |   2 -
 tests/qtest/npcm7xx_emc-test.c           |  18 +--
 75 files changed, 455 insertions(+), 531 deletions(-)


