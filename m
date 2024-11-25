Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1505803njc;
        Mon, 25 Nov 2024 10:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/YJTdDO9c+VmakxDWv6U2TGz3XM8PMrfXBZzka3lwxbPSKxd+4iV4iEpsZmokmJzY9YjewASEyC8TqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHGqwAgWppm1vb3qCX2NKQD/4s57GtfOLTfeUIjEsKZttqVkc4Yk/E6CHRi1wsOMkHPI1zc
X-Received: by 2002:a05:6359:4c8e:b0:1ca:a3e9:8669 with SMTP id e5c5f4694b2df-1caa3e986e6mr194754255d.6.1732558482579;
        Mon, 25 Nov 2024 10:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732558482; cv=none;
        d=google.com; s=arc-20240605;
        b=BqQjlbOVtAdOFiRHJTHBdkJmGcFq50ma9pIlduVHcRBRe+plB0kYIQ1oq8hN/xnt2/
         lMPuCA0U+bwqZRgGXqM4mC7gHY5wHxbjyKayflpGPmnITH6vGYKEjsJRJB66HXXOf3eh
         PV+txyppRaeqSo9UOeapB514J0SjQFsgKxtPMQGALeMt5gv+oaNjdnxGppdRaeVUZUPB
         WvIS5dWfV88a3iSEAmeotrT/vHAIkmSf9hhlTub8OUeRvC5DuhNHdv7QOyPzI5748Upu
         u7bs0yUdXGmbh4Fd/AfpxE5+KLgzsdh8pr7bftJ6OzJVMZ56Kivmdk6e3TtjhqZePDLF
         +SKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=x4OQHtvWJlI5keyr30zc800rGp/vJUHcuq/CHZvm30Q=;
        fh=dEkPuXoUk7ltLuAZ7csHt50i6aifj+lma2mR6PUaD/w=;
        b=RbToc/a96LrckrcgEX7xYH+02RpfsYZjHtIbalUwou8qhXU8Hc/PUCpfiO+TESueqg
         23ENzry2MFomLOCu7agKljUlNwFu4EwyDBQPROOptN2X0yW4dSHZbF+phe1djDwIpu6c
         gksL1PfbFigRXwbM2AR5hL2qhNFZknbj0ACcoi1LYBi6MIUSckkTRlB3hYdYWt6dgA2X
         /BJNcmtE43ZZ09BkTH5uvuhpgxmOAU+1Zo4ubjXBGbmjaq0twxPVFX9zRQqgXe3m7uSr
         JuIBHK570Owo9E/R3ELhqwa9ujfQ9zqH8HGaeEqlvFtxzxKjKy0GobVxOkOrJiKhO6aY
         jJQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGwk8AV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af357dec2asi328040137.144.2024.11.25.10.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 10:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGwk8AV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFdbS-00017s-0G; Mon, 25 Nov 2024 13:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbQ-000170-Ti
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 13:14:28 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbO-0005Al-10
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 13:14:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so43467535e9.1
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732558464; x=1733163264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x4OQHtvWJlI5keyr30zc800rGp/vJUHcuq/CHZvm30Q=;
 b=qGwk8AV8BNf403c+GHo4iHuWcpSaJVVeqDZ6jKCnQSeKJqJe2+0X0FbwZNrN5Snjfo
 ILuXgBiLdzsN0vrq/vKVoYOG0atz72LtDnYgXqlg+qOwCVZ1EVEudYWhYSl+wgXVRsfX
 mB68MYBiPtacyxsT7/0GD6ZPV3L/dVAPEBr51qnUjUKZC+UKSUwEgIVGLC/LzrQANBz3
 pJJWVrCXAInZyN0o9KjuF0XSLSV5tEK5jnLjUBkBfElXjz7lDQbsispjq7ueofXxAw8x
 96jGqw6gjB86XMkov6lP8ybZRR+yHfDsife9Z7dmmeeh1eUj/Qte+MtQ/KLi7eXJhd9/
 Jm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732558464; x=1733163264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x4OQHtvWJlI5keyr30zc800rGp/vJUHcuq/CHZvm30Q=;
 b=qRCLF68TmiP7o1Wmf3P9iLTQrGKK3iZLC/e54tfL6wu3daKkGYb9Kz+DmmRa25u/IO
 WfbiDBdaZ3Yk6Ozd3FPpBhVT1ChSslfmlzDSrdUTsTpRizwaeZf8cLJ8f3pW4gPuLJTl
 R67KLiingUpY4LMz951v7ImDhHdv059eLZWGTU500KOdmbP3gv9hufR4/gPObIyqdIew
 a21Hdmq10nk8gXKxfLP/WNDqKQPeMCqgjojLInrGtvD1DMGSWgoLkIlWy1md/WNWl4jE
 MMtvgP8+PQwFGECyUKXkvORkhi2zbhb9Lv3UQfL3hxkCeS6XlV2SaIXw862gNCgXxn3b
 qb3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbNsNgPkuJXvkSgrNxx3RFO46+3vN1TUmbIMbzCcZOmr+MtdhfXpY/3CrFFNTkVBNGNmDDUegvSQ==@nongnu.org
X-Gm-Message-State: AOJu0YxLgnAkExzm0L/yyGdOO/eWEjXuvwp8nq/nEaH0l3tpr1ewNhs9
 awYpB/A9Y7hx7uK2OnOvv1U5E8tdAhb4T4jrxfMAdA7LlyxWsh99Th/OTqsnrd4=
X-Gm-Gg: ASbGnct958nxTo8fV0i2dLL2+0fHBvZV/yD3A2GvW2G/aXPgeIFAXIZis5gwc5utE6X
 gmc9vOIqYoil5iFTeaklcO9CtnZihKGUWXxwBQgXC7uERf0nPskyLZ045TlOvLIZHG6V5ojY327
 U6OtL1lSA/HJJIeh3qYIJxBkYR8l/2+1etvOqjkxkmyEfc/A/khAQRUMBd7neYUYYFXOMQxcc/v
 iHr/kJ+W4wZb7xvEnr1iJO9fZxbUw3ORZC+flScSpCkd+e1VElTr71m84m5LBrlHrZqYV29
X-Received: by 2002:a05:6000:1fab:b0:382:4a15:6928 with SMTP id
 ffacd0b85a97d-38260b5715fmr12267551f8f.14.1732558464046; 
 Mon, 25 Nov 2024 10:14:24 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad60f0sm11036986f8f.22.2024.11.25.10.14.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 10:14:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 0/3] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
Date: Mon, 25 Nov 2024 19:14:17 +0100
Message-ID: <20241125181420.24424-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2GNHpElft8BY

Invert MachineClass 'no_sdcard' flag logic and rename it
to 'create_default_sdcard_drive' to make sense of this
default value applied to all machines. No logical change
intended.

Philippe Mathieu-Daudé (3):
  hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
  hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
  hw/boards: Rename no_sdcard -> create_default_sdcard_drive

 include/hw/boards.h                      | 2 +-
 hw/alpha/dp264.c                         | 1 +
 hw/arm/aspeed.c                          | 2 ++
 hw/arm/b-l475e-iot01a.c                  | 1 +
 hw/arm/bananapi_m2u.c                    | 1 +
 hw/arm/collie.c                          | 1 +
 hw/arm/cubieboard.c                      | 1 +
 hw/arm/digic_boards.c                    | 1 +
 hw/arm/exynos4_boards.c                  | 2 ++
 hw/arm/fby35.c                           | 1 +
 hw/arm/highbank.c                        | 2 ++
 hw/arm/imx25_pdk.c                       | 1 +
 hw/arm/integratorcp.c                    | 1 +
 hw/arm/kzm.c                             | 1 +
 hw/arm/mcimx6ul-evk.c                    | 1 +
 hw/arm/mcimx7d-sabre.c                   | 1 +
 hw/arm/microbit.c                        | 1 +
 hw/arm/mps2-tz.c                         | 1 +
 hw/arm/mps2.c                            | 1 +
 hw/arm/mps3r.c                           | 1 +
 hw/arm/msf2-som.c                        | 1 +
 hw/arm/musca.c                           | 1 +
 hw/arm/musicpal.c                        | 1 +
 hw/arm/netduino2.c                       | 1 +
 hw/arm/netduinoplus2.c                   | 1 +
 hw/arm/npcm7xx_boards.c                  | 1 +
 hw/arm/olimex-stm32-h405.c               | 1 +
 hw/arm/omap_sx1.c                        | 2 ++
 hw/arm/orangepi.c                        | 1 +
 hw/arm/raspi.c                           | 1 +
 hw/arm/realview.c                        | 4 ++++
 hw/arm/sabrelite.c                       | 1 +
 hw/arm/sbsa-ref.c                        | 1 +
 hw/arm/stellaris.c                       | 2 ++
 hw/arm/stm32vldiscovery.c                | 1 +
 hw/arm/versatilepb.c                     | 2 ++
 hw/arm/vexpress.c                        | 1 +
 hw/arm/virt.c                            | 1 +
 hw/arm/xen-pvh.c                         | 1 +
 hw/arm/xilinx_zynq.c                     | 3 ++-
 hw/arm/xlnx-versal-virt.c                | 1 +
 hw/arm/xlnx-zcu102.c                     | 1 +
 hw/avr/arduino.c                         | 1 +
 hw/core/null-machine.c                   | 2 +-
 hw/hppa/machine.c                        | 2 ++
 hw/i386/pc.c                             | 1 +
 hw/i386/x86.c                            | 1 +
 hw/i386/xen/xen-pvh.c                    | 1 +
 hw/loongarch/virt.c                      | 1 +
 hw/m68k/an5206.c                         | 1 +
 hw/m68k/mcf5208.c                        | 1 +
 hw/m68k/next-cube.c                      | 1 +
 hw/m68k/q800.c                           | 1 +
 hw/m68k/virt.c                           | 1 +
 hw/microblaze/petalogix_ml605_mmu.c      | 1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 +
 hw/microblaze/xlnx-zynqmp-pmu.c          | 1 +
 hw/mips/boston.c                         | 1 +
 hw/mips/fuloong2e.c                      | 1 +
 hw/mips/jazz.c                           | 2 ++
 hw/mips/loongson3_virt.c                 | 1 +
 hw/mips/malta.c                          | 1 +
 hw/mips/mipssim.c                        | 1 +
 hw/openrisc/openrisc_sim.c               | 1 +
 hw/openrisc/virt.c                       | 1 +
 hw/ppc/amigaone.c                        | 1 +
 hw/ppc/e500.c                            | 8 ++++++++
 hw/ppc/e500plat.c                        | 1 +
 hw/ppc/mac_newworld.c                    | 1 +
 hw/ppc/mac_oldworld.c                    | 1 +
 hw/ppc/mpc8544ds.c                       | 1 +
 hw/ppc/pegasos2.c                        | 1 +
 hw/ppc/pnv.c                             | 1 +
 hw/ppc/ppc405_boards.c                   | 1 +
 hw/ppc/ppc440_bamboo.c                   | 1 +
 hw/ppc/prep.c                            | 1 +
 hw/ppc/sam460ex.c                        | 1 +
 hw/ppc/spapr.c                           | 1 +
 hw/ppc/virtex_ml507.c                    | 1 +
 hw/remote/machine.c                      | 1 +
 hw/riscv/microchip_pfsoc.c               | 1 +
 hw/riscv/opentitan.c                     | 1 +
 hw/riscv/shakti_c.c                      | 1 +
 hw/riscv/sifive_e.c                      | 1 +
 hw/riscv/sifive_u.c                      | 1 +
 hw/riscv/spike.c                         | 1 +
 hw/riscv/virt.c                          | 1 +
 hw/rx/rx-gdbsim.c                        | 1 +
 hw/s390x/s390-virtio-ccw.c               | 2 +-
 hw/sh4/r2d.c                             | 1 +
 hw/sparc/leon3.c                         | 1 +
 hw/sparc/sun4m.c                         | 1 +
 hw/sparc64/niagara.c                     | 1 +
 hw/sparc64/sun4u.c                       | 2 ++
 hw/tricore/triboard.c                    | 1 +
 hw/tricore/tricore_testboard.c           | 1 +
 hw/xen/xen-pvh-common.c                  | 1 +
 hw/xenpv/xen_machine_pv.c                | 1 +
 hw/xtensa/sim.c                          | 1 +
 hw/xtensa/virt.c                         | 1 +
 hw/xtensa/xtfpga.c                       | 8 ++++++++
 system/vl.c                              | 2 +-
 102 files changed, 129 insertions(+), 5 deletions(-)

-- 
2.45.2

