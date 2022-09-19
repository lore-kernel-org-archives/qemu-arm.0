Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1439997ejy;
        Mon, 19 Sep 2022 16:19:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JT8lTCmXR5tGCDJBPtFYQnA/a4iV5kqCLVloxb4k0EjpLrYbu+FxSWjyGJLw/GhwHl84L
X-Received: by 2002:a05:622a:174d:b0:35c:bf34:fc7 with SMTP id l13-20020a05622a174d00b0035cbf340fc7mr16813241qtk.13.1663629557758;
        Mon, 19 Sep 2022 16:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663629557; cv=none;
        d=google.com; s=arc-20160816;
        b=GzFCITqfbmLsmQaJR3W89tp4cx2KNsy3fQ6h8E6QV3g00ZHJX0ywfiJ71h1Di2SDeU
         zQygaeRzioYx3YPOd6nzVlEX1uIPgKvM6Eh1qdYAn/nokQU4H2rAR+nW+C5gWHDm5THH
         FEzuXmVrzEHiM9qQTzxE+GR16hVmcbwaTE16FmYIGi0uRhgVImMXv3hrBWgJqJk9S56p
         14KRbWYcWgH2gCKuMS/ukCIfsyBV37zPgmand4l3rssYwZ+WjI1lTw1Uaolf3h13tn0D
         mJIQYeCMHEd8Cq67pUXnT4hdnbcw2MVYeZblHO1+yVkiYugw36pOE+qozdYhrM14lJjm
         oUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/k4I9yFOQcmiC4x/pIxNVj/VFsZVkB/VTnKtzXV6Nqg=;
        b=KVYgX01qh+Y7tJw3WATrm8EaYbQAGI23vZOwjn4aAjVXHl5wYPtn1nSEFMYO5nlHCR
         2PrPxM8WjnjoxqpoY4pDFDVP9sJiccVMNYqzA3nKHUbhb+Eb9rAIYaMJRT5y9pDs/m5q
         SHLCqZBSAjdXIGzIc+C8WQwRXWTj/OdjLYgJdq8GX/lHXmNVBXmn8PzNTTpTeYy5Wzlj
         5w9FwtWwI4S6YsEhhQ4+XVLvi903LUUvP/4MuH0T33ll0aUn/UD1RdPF+yG9qT9StGhE
         IKDg4t+33TaVwJn96dMi6zujRPPgXNYMIppnYDf9rot78tvvoBuuCLFzn35IUx4ntYi5
         e6TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HeU8zrtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05621420c300b004acc3656bc1si12196993qve.525.2022.09.19.16.19.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Sep 2022 16:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HeU8zrtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaQ2m-0006ut-OL
	for alex.bennee@linaro.org; Mon, 19 Sep 2022 19:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ1v-00065g-3g; Mon, 19 Sep 2022 19:18:23 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ1t-0001np-0x; Mon, 19 Sep 2022 19:18:22 -0400
Received: by mail-ej1-x62d.google.com with SMTP id a26so2208275ejc.4;
 Mon, 19 Sep 2022 16:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/k4I9yFOQcmiC4x/pIxNVj/VFsZVkB/VTnKtzXV6Nqg=;
 b=HeU8zrtYBI/0x6nYhy30ykBOxV7FJFi9qix+CVX0GQ295jAdVYP99cwpVxn/2LzxCi
 ZP5HRKIK6CCkoV8ZYaMeoxr7Er2J7tkGFzoZESbBQa3Q/GPx3mVwKz2IoZNjt/UK7KTA
 +ihVNLs1B8kQsrWVCKS154FLqcTZ7LjxhE5wx61z1x9ykd/cnWa6+EObscXByUSrlnxu
 2p8uLD9vwG4GAwVM6hnJqUMiO5KALvwOqjrkAiOSaB7w+Ho12rSGreEd514XIyflj9qP
 8m6Uxp0tRrmxmCRjrG0e2Upp6UcGEKsXugZH9piZvYjMOtG1eklpjW88WsouvJFJCC5o
 ldSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/k4I9yFOQcmiC4x/pIxNVj/VFsZVkB/VTnKtzXV6Nqg=;
 b=aHyzr0YVJYpl3XCfriI5p6ThUtkYqfow7vkyQZo97xLolhsr/Xxnz1YRa7nhCRKtdA
 cbehJfc9f/TwFTQZvTqakt74/1K9R4PmYoi3ghzEzsvz6TIZpeZSWsZDt+7Wn9lYJPU/
 K3HsWEvNesK2huzr3xDgdh0hevN8jMxvjLsVx1sryuh7m1P1h8w9RtweUlqHDsqVh8Xn
 3aJ8Ir9cN9OvBiUJ9i6i6sXA+/lz4Zo2lgb/XedrnDRXBb070LPntvcBmeSS5koCFNSv
 KAspod57/3csUhqs0kdauF2eRpLLnNyJpk1Y2Z8Vy4Eu7oH8KqrwtEq0JyGXhy2o/zuE
 UQaQ==
X-Gm-Message-State: ACrzQf213X+MyAlbEfU8azFE4VZdsENC+pKrM7lGVETeRafqHCiGqETw
 B5yMWqUqjWyVKcIZwTUR2bjJOs6jXMdtPQ==
X-Received: by 2002:a17:907:2c62:b0:77a:e3ce:5ef0 with SMTP id
 ib2-20020a1709072c6200b0077ae3ce5ef0mr15170276ejc.553.1663629496806; 
 Mon, 19 Sep 2022 16:18:16 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/9] Deprecate sysbus_get_default() and get_system_memory()
 et. al
Date: Tue, 20 Sep 2022 01:17:11 +0200
Message-Id: <20220919231720.163121-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmuQlGb0Txb4

In address-spaces.h it can be read that get_system_memory() and=0D
get_system_io() are temporary interfaces which "should only be used tempora=
rily=0D
until a proper bus interface is available". This statement certainly extend=
s to=0D
the address_space_memory and address_space_io singletons. This series attem=
pts=0D
to stop further proliferation of their use by turning TYPE_SYSTEM_BUS into =
an=0D
object-oriented, "proper bus interface" inspired by PCIBus.=0D
=0D
While at it, also the main_system_bus singleton is turned into an attribute=
 of=0D
MachineState. Together, this resolves five singletons in total, making the=
=0D
ownership relations much more obvious which helps comprehension.=0D
=0D
The series is structured as follows: Patch 1 fixes a memory corruption issu=
e=0D
uncovered by running `make check` on the last but one patch of this series.=
=0D
Patches 2 and 3 turn the main_system_bus singleton into an attribute of=0D
MachineState which provides an alternative to sysbus_get_default(). Patches=
 4-7=0D
resolve the address space singletons and deprecate the legacy=0D
get_system_memory() et. al functions. Patch 8 attempts to optimize the new=
=0D
implementations of these legacy functions.=0D
=0D
Testing done:=0D
* make check (passes without any issues)=0D
* make check-avocado (no new issues seem to be introduced compared to maste=
r)=0D
=0D
Bernhard Beschow (9):=0D
  hw/riscv/sifive_e: Fix inheritance of SiFiveEState=0D
  exec/hwaddr.h: Add missing include=0D
  hw/core/sysbus: Resolve main_system_bus singleton=0D
  hw/ppc/spapr: Fix code style problems reported by checkpatch=0D
  exec/address-spaces: Wrap address space singletons into functions=0D
  target/loongarch/cpu: Remove unneeded include directive=0D
  hw/sysbus: Introduce dedicated struct SysBusState for TYPE_SYSTEM_BUS=0D
  softmmu/physmem: Let SysBusState absorb memory region and address=0D
    space singletons=0D
  exec/address-spaces: Inline legacy functions=0D
=0D
 accel/hvf/hvf-accel-ops.c            |  2 +-=0D
 accel/kvm/kvm-all.c                  | 12 +++----=0D
 hw/alpha/dp264.c                     |  4 +--=0D
 hw/alpha/typhoon.c                   |  4 +--=0D
 hw/arm/smmu-common.c                 |  4 +--=0D
 hw/arm/smmuv3.c                      | 14 ++++----=0D
 hw/arm/virt.c                        |  2 +-=0D
 hw/char/goldfish_tty.c               |  4 +--=0D
 hw/core/bus.c                        |  5 ++-=0D
 hw/core/loader.c                     |  2 +-=0D
 hw/core/machine.c                    |  3 ++=0D
 hw/core/sysbus.c                     | 24 ++++----------=0D
 hw/dma/pl330.c                       |  2 +-=0D
 hw/dma/rc4030.c                      |  2 +-=0D
 hw/dma/xlnx-zynq-devcfg.c            |  4 +--=0D
 hw/dma/xlnx_dpdma.c                  |  8 ++---=0D
 hw/hppa/machine.c                    |  4 +--=0D
 hw/hyperv/hyperv.c                   |  2 +-=0D
 hw/hyperv/vmbus.c                    |  2 +-=0D
 hw/i386/amd_iommu.c                  | 18 +++++-----=0D
 hw/i386/fw_cfg.c                     |  2 +-=0D
 hw/i386/intel_iommu.c                | 24 +++++++-------=0D
 hw/i386/microvm.c                    |  4 +--=0D
 hw/i386/pc.c                         |  2 +-=0D
 hw/i386/xen/xen-hvm.c                |  4 +--=0D
 hw/ide/ahci.c                        |  2 +-=0D
 hw/ide/macio.c                       | 10 +++---=0D
 hw/intc/apic.c                       |  2 +-=0D
 hw/intc/openpic_kvm.c                |  2 +-=0D
 hw/intc/pnv_xive.c                   |  6 ++--=0D
 hw/intc/pnv_xive2.c                  |  6 ++--=0D
 hw/intc/riscv_aplic.c                |  2 +-=0D
 hw/intc/spapr_xive.c                 |  2 +-=0D
 hw/intc/xive.c                       |  4 +--=0D
 hw/intc/xive2.c                      |  4 +--=0D
 hw/mips/jazz.c                       |  4 +--=0D
 hw/misc/lasi.c                       |  2 +-=0D
 hw/misc/macio/mac_dbdma.c            |  8 ++---=0D
 hw/net/ftgmac100.c                   | 16 ++++-----=0D
 hw/net/i82596.c                      | 24 +++++++-------=0D
 hw/net/imx_fec.c                     | 22 ++++++-------=0D
 hw/net/lasi_i82596.c                 |  2 +-=0D
 hw/net/npcm7xx_emc.c                 | 14 ++++----=0D
 hw/openrisc/boot.c                   |  2 +-=0D
 hw/pci-host/dino.c                   |  6 ++--=0D
 hw/pci-host/pnv_phb3.c               |  6 ++--=0D
 hw/pci-host/pnv_phb3_msi.c           |  6 ++--=0D
 hw/pci-host/pnv_phb4.c               | 10 +++---=0D
 hw/pci/pci.c                         |  2 +-=0D
 hw/ppc/pnv_psi.c                     |  2 +-=0D
 hw/ppc/spapr.c                       |  4 +--=0D
 hw/ppc/spapr_events.c                |  2 +-=0D
 hw/ppc/spapr_hcall.c                 |  4 +--=0D
 hw/ppc/spapr_iommu.c                 |  4 +--=0D
 hw/ppc/spapr_ovec.c                  |  8 ++---=0D
 hw/ppc/spapr_rtas.c                  |  2 +-=0D
 hw/remote/iommu.c                    |  2 +-=0D
 hw/remote/message.c                  |  4 +--=0D
 hw/remote/proxy-memory-listener.c    |  2 +-=0D
 hw/riscv/boot.c                      |  6 ++--=0D
 hw/riscv/sifive_e.c                  |  2 +-=0D
 hw/riscv/sifive_u.c                  |  2 +-=0D
 hw/riscv/virt.c                      |  2 +-=0D
 hw/s390x/css.c                       | 16 ++++-----=0D
 hw/s390x/ipl.h                       |  2 +-=0D
 hw/s390x/s390-pci-bus.c              |  4 +--=0D
 hw/s390x/s390-pci-inst.c             | 10 +++---=0D
 hw/s390x/s390-skeys.c                |  2 +-=0D
 hw/s390x/virtio-ccw.c                | 10 +++---=0D
 hw/sd/sdhci.c                        |  2 +-=0D
 hw/sh4/r2d.c                         |  4 +--=0D
 hw/sparc/sun4m.c                     |  2 +-=0D
 hw/sparc/sun4m_iommu.c               |  4 +--=0D
 hw/sparc64/sun4u_iommu.c             |  4 +--=0D
 hw/timer/hpet.c                      |  2 +-=0D
 hw/usb/hcd-ehci-pci.c                |  2 +-=0D
 hw/usb/hcd-ehci-sysbus.c             |  2 +-=0D
 hw/usb/hcd-ohci.c                    |  2 +-=0D
 hw/usb/hcd-xhci-sysbus.c             |  2 +-=0D
 hw/vfio/ap.c                         |  2 +-=0D
 hw/vfio/ccw.c                        |  2 +-=0D
 hw/vfio/common.c                     |  8 ++---=0D
 hw/vfio/platform.c                   |  2 +-=0D
 hw/virtio/vhost-vdpa.c               |  2 +-=0D
 hw/virtio/vhost.c                    |  2 +-=0D
 hw/virtio/virtio-bus.c               |  4 +--=0D
 hw/virtio/virtio-iommu.c             |  6 ++--=0D
 hw/virtio/virtio-pci.c               |  2 +-=0D
 hw/xen/xen_pt.c                      |  4 +--=0D
 include/exec/address-spaces.h        | 49 +++++++++++++++++++++++-----=0D
 include/exec/hwaddr.h                |  1 +=0D
 include/hw/boards.h                  |  2 ++=0D
 include/hw/elf_ops.h                 |  4 +--=0D
 include/hw/misc/macio/macio.h        |  2 +-=0D
 include/hw/ppc/spapr.h               |  6 ++--=0D
 include/hw/ppc/vof.h                 |  4 +--=0D
 include/hw/riscv/sifive_e.h          |  3 +-=0D
 include/hw/sysbus.h                  | 14 ++++++--=0D
 monitor/misc.c                       |  4 +--=0D
 softmmu/ioport.c                     | 12 +++----=0D
 softmmu/memory_mapping.c             |  2 +-=0D
 softmmu/physmem.c                    | 41 ++++++++---------------=0D
 target/arm/hvf/hvf.c                 |  4 +--=0D
 target/arm/kvm.c                     |  4 +--=0D
 target/avr/helper.c                  |  8 ++---=0D
 target/i386/hax/hax-all.c            |  2 +-=0D
 target/i386/hax/hax-mem.c            |  2 +-=0D
 target/i386/hvf/hvf.c                |  2 +-=0D
 target/i386/hvf/vmx.h                |  2 +-=0D
 target/i386/hvf/x86_mmu.c            |  6 ++--=0D
 target/i386/nvmm/nvmm-all.c          |  4 +--=0D
 target/i386/sev.c                    |  4 +--=0D
 target/i386/tcg/sysemu/misc_helper.c | 12 +++----=0D
 target/i386/whpx/whpx-all.c          |  4 +--=0D
 target/loongarch/cpu.h               |  1 -=0D
 target/s390x/diag.c                  |  2 +-=0D
 target/s390x/mmu_helper.c            |  2 +-=0D
 target/s390x/sigp.c                  |  2 +-=0D
 target/xtensa/dbg_helper.c           |  2 +-=0D
 tests/qtest/fuzz/generic_fuzz.c      |  4 +--=0D
 120 files changed, 355 insertions(+), 328 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D
