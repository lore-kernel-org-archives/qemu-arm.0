Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp587270njf;
        Wed, 14 Aug 2024 11:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWX5IvHMDGfDM+ckMurldCCImVdQeDoyIbJkf9kg/Sd0uBJZeNOOqeR4vx5hGgugRP2Gx3SOwbcQyL52hS6C0q4giF4DOMs
X-Google-Smtp-Source: AGHT+IHN07k0n8ayaqOZad1cnmiLUON+wLmGtA2t+eQXSrjiSCeaZciblaPamF1foi4YE6mSC9s4
X-Received: by 2002:ac8:74cf:0:b0:447:e4df:1865 with SMTP id d75a77b69052e-45367896b60mr7907551cf.13.1723659430410;
        Wed, 14 Aug 2024 11:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723659430; cv=none;
        d=google.com; s=arc-20160816;
        b=dLfEfFFdYPLIeTY21lwAK4m1e9B/BkuCS2dyXYc+2Tl4XwPnvHRox98p8K7kF//7uL
         g/yyUTach/TcC39kvSTbz+oZEsTt9D7ba+FFUOznQZdbDXyFDc2qRTVH4b8ZbYHf1E+5
         uxOkzu9tD1bkOB1ONqNrnmYafgr1IxMSyainirr42aXZXi3BNyBgWHOD/tEK0MvcdBFz
         QdLiya6cCxKFqp/1nXD0kXnkVKQzx9Kl5CEBCU89U65R8sS9qHPZBhJT2O05PQZBFECP
         dAUPOJjHT7O2myTzgOVExkYwV/jLhjUUe5k7W46dKMUKCZ5/FXEiaUfqGKmrCcg44C/4
         QNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=iahjTri8KuVoj9s2LrgEu/hqpsziuAhYqC7/VHumG6g=;
        fh=QnpjFMEOflRf498XuafR6WU4QJSl3j1JDhS+efI8jPA=;
        b=DcUcX9DlAZG3cDvZ+NRzGkHJynptONYty0qS6N59j463IEt7VwMtzikRkKdReNXd6+
         /5R5QLNMFrAR2Jmd0EMoCXc2guEWpRc77DQTehEFRoT7y2uushVj+y7BWzGSkgmip0gz
         STB6p1//BxBJQfR+2g/+a6Phans7Y/FDbWarO758Yh/kfmY5UFlJ2zlN1DTV6wya31Fl
         t6RostblzyjgRulpDI4JdQsVtlXE776Y5z5dB7daAsoGvr3HLOgyhSd8xh9A7RQqa95C
         3X54RfY5vK+9UtGej7o/Z4RwPjtoM1ZJMcgE60vVJ6eU/snV6WDvu0t+fGK6zcwxPSy/
         G9xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksaPoK3I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c268d4csi110029661cf.299.2024.08.14.11.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2024 11:17:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksaPoK3I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1seIXP-0005LG-UJ; Wed, 14 Aug 2024 14:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1seIXI-0005Ad-36; Wed, 14 Aug 2024 14:15:52 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1seIXG-0000B5-Ad; Wed, 14 Aug 2024 14:15:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37186c2278bso95498f8f.1; 
 Wed, 14 Aug 2024 11:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723659347; x=1724264147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iahjTri8KuVoj9s2LrgEu/hqpsziuAhYqC7/VHumG6g=;
 b=ksaPoK3IWT1RguytuYCX70CLgaIoMkAhLo8nfnQBu6Hb46T5eQ6aYH0i7pwwcesrXC
 R6f2ppT0NoLuCODor2kPjQoOJVKqiyHXZ4rOve3ylHWjWmppn3v0qxJYdHZGCfF98Mhc
 1d9DF+LYnb3b+8Pz+eTvdNoumI2YqMe+g5/yG2hKCDSblrdxDVeFu5ByqsH7nYLAOlP6
 m8Dq7P8rKJiUdOE2DYMyzs4+ZpfLmXU8OGJMbUfdU5OM6JB9g1hUl7EC9DpD1JdzoAjn
 nVHcAMCQlWQAf7ciFaQhsDo0KKs17nUoQv2iXHP9mbcP19SV1jqJPlmBg6ootAWc6v45
 jqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723659347; x=1724264147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iahjTri8KuVoj9s2LrgEu/hqpsziuAhYqC7/VHumG6g=;
 b=N6r80uhqu7ryZECuuYg2VMdfwD27YS+6shAmDQ9habSiREAqG3AvB34D60Sd/Kxnvy
 AdTllRRjK3+wDcad9PC291GSAJM9Kp6gmsBfQESPhVZE9nIJ1twHdLcehkyIaiJAPjtR
 BnWqCJz0cNawjeYqT6yhmaWRyZ+W+ilTVszA5cZRomGSGLXmicts1z3XACDmz4Z3qaC6
 e9vmCN4ua7X5eCgd/sat2OGChVoa1mfFyuWr+obI3JCBaUKcJE8D0tirPqJIiAaP8Sp+
 sqWy+qAcMgGpZXWCLu2w16Y51cNn4IcdhqoEIlxgvNAqwFTqpQss+AycRcySm6f93djc
 ZALQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMR4o7y7jMjaHwWTwr/pI/4EVWuhl+64TiBvKm8sBOCSfaqgeWPQaDbpxlBbzx5fWjdRwLA8lOrV0DxJjTgzhCH5Z6obpi4EAm3KIcQv21xsMDpDXCWoye0MaC7LerRUgHkYhqLT0GzNEHMgFAX8I=
X-Gm-Message-State: AOJu0Yyi5DXAB15InPtNkpWcbTyDY4Oyk+sw1cClL4FZP8yThokCn02y
 U6XzgD6b4F/Cbflo5N00Zea2JkyxunNO4n11sWP2E0WzH/hvp/K6vnfe2Q==
X-Received: by 2002:adf:f648:0:b0:366:ee84:6a77 with SMTP id
 ffacd0b85a97d-37186bbd203mr469786f8f.3.1723659346425; 
 Wed, 14 Aug 2024 11:15:46 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-049-243.78.55.pool.telefonica.de. [78.55.49.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c937bb9sm13557625f8f.34.2024.08.14.11.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 11:15:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>,
 Sergio Lopez <slp@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jan Kiszka <jan.kiszka@web.de>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Jia Liu <proljc@gmail.com>,
 Helge Deller <deller@gmx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/5] Serial device cleanup
Date: Wed, 14 Aug 2024 20:15:29 +0200
Message-ID: <20240814181534.218964-1-shentey@gmail.com>
X-Mailer: git-send-email 2.46.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RKdF3t1ILKX+

This series extracts TYPE_SERIAL_MM into its own module and introduces a=0D
dedicated header for TYPE_SERIAL_ISA. The result is that no board directly=
=0D
depends on CONFIG_SERIAL or includes hw/char/serial.h any more.=0D
=0D
Bernhard Beschow (5):=0D
  hw: Remove unused inclusion of hw/char/serial.h=0D
  hw/char/serial: Remove unused funtion=0D
  hw/ppc/Kconfig: Add missing SERIAL_ISA dependency to POWERNV machine=0D
  hw/char/serial.h: Extract serial-isa.h=0D
  hw/char: Extract serial-mm=0D
=0D
 include/hw/arm/aspeed_soc.h         |   2 +-=0D
 include/hw/char/mchp_pfsoc_mmuart.h |   2 +-=0D
 include/hw/char/serial-isa.h        |  38 +++++++=0D
 include/hw/char/serial-mm.h         |  52 +++++++++=0D
 include/hw/char/serial.h            |  30 ------=0D
 hw/arm/allwinner-a10.c              |   2 +-=0D
 hw/arm/allwinner-h3.c               |   2 +-=0D
 hw/arm/allwinner-r40.c              |   2 +-=0D
 hw/arm/aspeed_ast2400.c             |   2 +-=0D
 hw/arm/aspeed_soc_common.c          |   2 +-=0D
 hw/arm/kzm.c                        |   2 +-=0D
 hw/arm/msf2-soc.c                   |   2 +-=0D
 hw/arm/musicpal.c                   |   2 +-=0D
 hw/arm/npcm7xx.c                    |   2 +-=0D
 hw/arm/pxa2xx.c                     |   2 +-=0D
 hw/char/omap_uart.c                 |   2 +-=0D
 hw/char/riscv_htif.c                |   1 -=0D
 hw/char/serial-isa.c                |   1 +=0D
 hw/char/serial-mm.c                 | 157 ++++++++++++++++++++++++++++=0D
 hw/char/serial.c                    | 133 -----------------------=0D
 hw/display/sm501.c                  |   2 +-=0D
 hw/hppa/machine.c                   |   2 +-=0D
 hw/i386/microvm-dt.c                |   2 +-=0D
 hw/i386/microvm.c                   |   2 +-=0D
 hw/i386/pc.c                        |   2 +-=0D
 hw/isa/isa-superio.c                |   2 +-=0D
 hw/isa/vt82c686.c                   |   2 +-=0D
 hw/loongarch/virt.c                 |   2 +-=0D
 hw/microblaze/petalogix_ml605_mmu.c |   2 +-=0D
 hw/mips/boston.c                    |   2 +-=0D
 hw/mips/jazz.c                      |   2 +-=0D
 hw/mips/loongson3_virt.c            |   2 +-=0D
 hw/mips/malta.c                     |   2 +-=0D
 hw/mips/mipssim.c                   |   2 +-=0D
 hw/openrisc/openrisc_sim.c          |   2 +-=0D
 hw/openrisc/virt.c                  |   2 +-=0D
 hw/ppc/e500.c                       |   2 +-=0D
 hw/ppc/pnv.c                        |   2 +-=0D
 hw/ppc/ppc405_uc.c                  |   2 +-=0D
 hw/ppc/ppc440_bamboo.c              |   2 +-=0D
 hw/ppc/prep.c                       |   1 -=0D
 hw/ppc/sam460ex.c                   |   2 +-=0D
 hw/ppc/virtex_ml507.c               |   2 +-=0D
 hw/riscv/sifive_e.c                 |   1 -=0D
 hw/riscv/sifive_u.c                 |   1 -=0D
 hw/riscv/virt.c                     |   2 +-=0D
 hw/sparc64/niagara.c                |   2 +-=0D
 hw/sparc64/sun4u.c                  |   3 +-=0D
 hw/xtensa/xtfpga.c                  |   2 +-=0D
 hw/arm/Kconfig                      |  20 ++--=0D
 hw/char/Kconfig                     |   4 +=0D
 hw/char/meson.build                 |   1 +=0D
 hw/display/Kconfig                  |   2 +-=0D
 hw/hppa/Kconfig                     |   2 +-=0D
 hw/loongarch/Kconfig                |   2 +-=0D
 hw/microblaze/Kconfig               |   2 +-=0D
 hw/mips/Kconfig                     |  10 +-=0D
 hw/openrisc/Kconfig                 |   4 +-=0D
 hw/ppc/Kconfig                      |  11 +-=0D
 hw/riscv/Kconfig                    |   2 +-=0D
 hw/sparc64/Kconfig                  |   1 +=0D
 hw/xtensa/Kconfig                   |   2 +-=0D
 62 files changed, 323 insertions(+), 234 deletions(-)=0D
 create mode 100644 include/hw/char/serial-isa.h=0D
 create mode 100644 include/hw/char/serial-mm.h=0D
 create mode 100644 hw/char/serial-mm.c=0D
=0D
-- =0D
2.46.0=0D
=0D
