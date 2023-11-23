Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp438493ejj;
        Thu, 23 Nov 2023 06:38:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt9H2HBJZ6FfHVrZTZ1SwhZsFx4QGI2cSeRJUqzbg/OZjxtWUEyv7eMjRLQFozXhW77Wdi
X-Received: by 2002:a05:620a:9496:b0:77d:5eba:a2d0 with SMTP id sn22-20020a05620a949600b0077d5ebaa2d0mr4817777qkn.57.1700750311805;
        Thu, 23 Nov 2023 06:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700750311; cv=none;
        d=google.com; s=arc-20160816;
        b=yQHDYP1s14ZfNrbrNaopzzT1CU5llxDphYILldFlZ9HrILS/BBdp+sZ7UoEFfPRJy3
         cYSbn+nxTuYrI3gAhFFcwpWUYhoeqCHqmVyHMYx/5x00CpzI+kLbyLKm+lZQU3+sMdnT
         MfcGCgklDTkIOte3L8Qc12l0XH9SnL64vhRVClVVTEgIHeH2N7JvJgrXncV5bat0EprJ
         9Vbg+9oookQE3QrZlTq4HOOIj79AqjP9eZpbNzhlFHhr/UxgMM1KusegyBovI0ShNrjz
         8urprvXpSt1k75oQIhGATlv5toZjq42A8881fouFWcoxUWO29g5YphMOqhFdbjFGjpKJ
         5QQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=UFa7i+NW2UQ3kmh2XmqKEmfildbqevSt27vx2CpyNsM=;
        fh=xd8Hqo+FyqINTpmMuSlnP3D7Rh8IYP9KQ4AY72o61pU=;
        b=0jy25GZshbcjrMEGXZDB7VnPdmR5RJlKSPbVRvuoZwlwAfsSFHB7bovE5+kVIS/rOU
         +uoo353g6iv94320SgN18VEctPEuwpK4RKRa2IyqaGELYX/3DgrSb2javjKhgxj6Rgze
         LUMF45jVgL3Ny83zS2EhhqVlcUR7okAL3lVEbQ/GFRMxBlVBJGoTN8Bi+noErTjp6YkU
         owW5dOPVXvbSvV0Zx91IhUfprozJvzG7CC0xmD/PNNCLduOcaetPJYyG4Gpyjoa0pOXW
         z4BmF5My6IFs679aBwXy8kSJo9Becbw7FY/Fk6uXo9Hmmywc63B+iEpfFwGLhINo4LR4
         H/gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QW8pah3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ro13-20020a05620a398d00b007771a0bd748si1124989qkn.685.2023.11.23.06.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 06:38:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QW8pah3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6AqY-0001mg-EQ; Thu, 23 Nov 2023 09:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6AqV-0001m7-H1
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:38:23 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6AqS-0002PC-5H
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:38:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32dff08bbdbso607699f8f.2
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 06:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700750298; x=1701355098; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UFa7i+NW2UQ3kmh2XmqKEmfildbqevSt27vx2CpyNsM=;
 b=QW8pah3SPrCXsAQhsAABMCy4SG8qmQT7eqMs+AffEYPSQ7APQRLtOU0CnIoi995Mgm
 hRJUeSEpKLUtOdGkk49XMomo8zVHbRSYz6jDgdky8qeegBF49GUgMCPzZs8dZbnXW9lR
 rNQRNrTkFAe39Z4SjsCHTsCfqk6oZSNdwDItBB0NK4V6ZywSTpSC5skni+IzXq8Nkcih
 NhcqCkdxp2xe/JFtbeClZmNqtVnwfGZNNA1jP0d/auA4DHMz+A8qAq9GUfmp0trmgjjd
 RzgWYBDPK4KYDttFRQ0DaPaOA+LVo80CRwYHw8Ob7c3Mkjnj2sNCnW4ZIFjXMGkVMz1Z
 ov8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700750298; x=1701355098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UFa7i+NW2UQ3kmh2XmqKEmfildbqevSt27vx2CpyNsM=;
 b=UxGcl4BQtoDocResrr48q1n2hg3UAwZTA789LZ8JrYwZ4wGsx6ykwBcYW7j6yqLT/x
 LAWfB5hHrB6RPPArLu2y/nNGwpNUIHjab7s6b9A5btkl4c1Ji6C+d6z0vccwpMOZhSA9
 7rkCH+cLy4T7696qbhE4o4YKRDM2DRrf54hSkV+T/wnWoCSGdd5PH/RJchRU3PPiQ5LL
 B2IOnXHHljvgSpkQPtxsJ3qTsazw8H+1IXcMFCIagwYUJNh0me210Y6qBNFKnD58EDWC
 8VCbOZ0ieY3xL4ZgI/N2jEb8Rz6td2+JwFZfgCTwvOqybXz7nwmBz089ThI4aCxS7dDa
 r4pw==
X-Gm-Message-State: AOJu0YwChqMWYiJ3cNfQIyxen584D23JESA10Z6OzsYtFeu24E7VP9vQ
 xzkcjjGrm+9pFT8JUPZn04xHcQ==
X-Received: by 2002:adf:f34f:0:b0:32f:c3d0:89db with SMTP id
 e15-20020adff34f000000b0032fc3d089dbmr3425517wrp.27.1700750298351; 
 Thu, 23 Nov 2023 06:38:18 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a5d4602000000b0032da4c98ab2sm1884975wrq.35.2023.11.23.06.38.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Nov 2023 06:38:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH-for-9.0 v2 0/8] hw: Simplify accesses to
 CPUState::'start-powered-off' property
Date: Thu, 23 Nov 2023 15:38:04 +0100
Message-ID: <20231123143813.42632-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: qV/1rVAOFGff

Extracted from a bigger series, after Markus' review.

Supersedes: <20231122183633.17676-1-philmd@linaro.org>
Supersedes: <20231122183048.17150-8-philmd@linaro.org>

Philippe Mathieu-Daudé (8):
  hw/ppc/spapr_cpu_core: Access QDev properties with proper API
  hw/arm/bcm2836: Simplify use of 'reset-cbar' property
  hw/arm/bcm2836: Use ARM_CPU 'mp-affinity' property
  hw: Simplify accesses to the CPUState::'start-powered-off' property
  hw: Prefer qdev_prop_set_bit over object_property_set_bool for QDev
  hw: Simplify uses of qdev_prop_set_bit(dev, 'start-powered-off')
  hw/arm/bcm2836: Move code after error checks
  hw/arm/bcm2836: Add local variable to remove various DEVICE() casts

 hw/acpi/cpu_hotplug.c               |  7 ++--
 hw/acpi/ich9.c                      |  4 +--
 hw/acpi/piix4.c                     |  4 +--
 hw/arm/allwinner-h3.c               |  3 +-
 hw/arm/allwinner-r40.c              |  3 +-
 hw/arm/armsse.c                     |  5 +--
 hw/arm/armv7m.c                     |  7 +---
 hw/arm/aspeed_ast2400.c             |  3 +-
 hw/arm/aspeed_ast2600.c             |  9 ++---
 hw/arm/bcm2835_peripherals.c        |  3 +-
 hw/arm/bcm2836.c                    | 51 +++++++++++++----------------
 hw/arm/boot.c                       |  4 +--
 hw/arm/fsl-imx25.c                  |  3 +-
 hw/arm/fsl-imx31.c                  |  3 +-
 hw/arm/fsl-imx6.c                   | 14 +++-----
 hw/arm/fsl-imx6ul.c                 |  8 ++---
 hw/arm/fsl-imx7.c                   | 20 +++++------
 hw/arm/npcm7xx.c                    |  9 ++---
 hw/arm/xlnx-versal.c                |  9 ++---
 hw/arm/xlnx-zynqmp.c                |  9 ++---
 hw/core/bus.c                       |  2 +-
 hw/core/qdev.c                      |  2 +-
 hw/i386/pc_piix.c                   | 19 ++++-------
 hw/microblaze/petalogix_ml605_mmu.c |  5 ++-
 hw/microblaze/xlnx-zynqmp-pmu.c     | 18 ++++------
 hw/mips/cps.c                       |  6 ++--
 hw/ppc/e500.c                       |  3 +-
 hw/ppc/spapr_cpu_core.c             |  2 +-
 hw/ppc/spapr_pci.c                  |  3 +-
 hw/rx/rx-gdbsim.c                   |  4 +--
 hw/sparc/sun4m.c                    |  3 +-
 31 files changed, 93 insertions(+), 152 deletions(-)

-- 
2.41.0

