Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1829793lfc;
        Thu, 11 Jun 2020 15:30:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg8tQNKyj2EPNlTuP+VX3Vuz2kaTyNeMGVjFh0NSFz31xcCE+EVDTggFeWm7Dh0HYBQHB/
X-Received: by 2002:a25:770b:: with SMTP id s11mr17130240ybc.157.1591914658040;
        Thu, 11 Jun 2020 15:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591914658; cv=none;
        d=google.com; s=arc-20160816;
        b=fTwIJB7BAVezrmBiM5NRWPANZ5rCrpxpiFRNpAK3ALiLxxchxR7bWn+mQkqkxu/f0e
         qN9ZQ29ZokYWcg4DoEYSAIMe7wE6Y4IZyolGvQqwCTFcNyeD++Cnvkrl20RJxuK8AHbB
         BYWgAArQUmCAwEjMmY+zykNLMg78YroV/9WzoYIdyfQoF8gyrqmUXdukgUwtZczouygO
         IuM3yRhVc2LSyzL5YAAXmFKkbAskmsusMmI+WhjNcejF2eIf3bubg8w99cbngtIW5sDZ
         m/fLxa464NSyrk6jRfzp9BA6tFfLQOcoH67OoqwEVhuL7MRMHU7Xc2abtTx6Da67xywO
         Piog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=ogOrvC1z1s0qlceeHZibbvCNmk024v40cmb/1Cfzwlw=;
        b=OCM7hJy9R1TRJkQ1nhZ5hDQ1DLXqLVVctMhuKn2nCK5vGIzt5fUziMqWM0xFMIkiKT
         pbjRNJ8oOIY8mzikmEvlydnTQ5pUhjetLG2bN9edqn65uP/NBtiMj9H2JIccRrXz6uv3
         qX4oq4lbp9BHeLEyV4btiaDGVTRBabMpb5d6/6n52MNw0ILBdBZ/0f+3rsIZJ9EcGePO
         z16fvqJd8SAZ55k6Y8Li65IQ6fLYJ4ehWhHIToKOSoV5WBRwGQcIrYr3TAXvSnZaZA1n
         Rch53S9wlTBaO/RnIjPro8nXFNVOOPQCa4i/T9lVfInPcZnwLPeG9WMJzy5Dmctv3NuB
         G8Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=pIhMD19A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si3208744ybh.221.2020.06.11.15.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 15:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=pIhMD19A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjVir-0003tY-7x
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 18:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3g7DiXgsKCGwRcUSXXOWYOXQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--hskinnemoen.bounces.google.com>)
 id 1jjViX-0003sX-IU
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:38 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:51381)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3g7DiXgsKCGwRcUSXXOWYOXQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--hskinnemoen.bounces.google.com>)
 id 1jjViV-00040L-9X
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:37 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id k186so8228406yba.18
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ogOrvC1z1s0qlceeHZibbvCNmk024v40cmb/1Cfzwlw=;
 b=pIhMD19AVk0Ar8TALUnz9EJIzGM95/AOjXeTlN3ddZUIRivgCpN03IyHwMqoMI+uj+
 UvIikWfhbpctMygow9C1+kmINBTpFCeXtEqvGwEqsOKCz4XcXOtmGu38vdj7Xg7dz2NN
 K2OjlrkRk2haGdgwPSGklKnboc9mxXI0awIjzRm4839M3jvmsRdgPz6l6Ym+PTZ5tq+h
 04TV3qu0Jql80zSKXpta1J0Kmko4kKeT+JEu3FmPXiM+Ckbg5l2ZPZZJ0Z3YqR7VfVtU
 IgYYaq650Kd7l+69JMEcxvv9uX/KEYbDK5PyNDF7sEs6BfAr2L/28iIh+1drEWwH5Wpp
 0lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ogOrvC1z1s0qlceeHZibbvCNmk024v40cmb/1Cfzwlw=;
 b=oN1AJUEHA0d9ctMP1Mo8H6yVOaiqKzbM1xcIdqVB2HIlv0Lcc9t8VQ+IFJvm/OAUhH
 Qj5n0Ehl0T5XkIsAYWdDW2pgyJOsuE8RuPJJA6ot4DxnHkdBsLBfb8GSKpUTwXeFsojh
 48BlE5/VQDOc/AUChwKnSXv+ogYHJ6Zlx4jU+hjQHUvMntcULRlCH9qYy2cO2emy5v6r
 fpxOMnlclfmfZls4ZKZ0n2EaOSL9dXYVRkox1prdC88pxXT1B3S4pka9PCQyR4qmJIaE
 9NLcHEHS36qFKTagOMClCq3pBkSBSF3eQG0Ej3kP3R6p0vu/C5BOSSchNS6YjQbkUJl2
 rBYg==
X-Gm-Message-State: AOAM533x2SpZFH2qYR7JCQHZvCGupdacqk5sjcvH5rASUIaxOnP0umXU
 M1LlorSgYHmrKKl7dCiw7w/UMBlgIuGfmufoVA==
X-Received: by 2002:a05:6902:1006:: with SMTP id
 w6mr18630505ybt.411.1591914627881; 
 Thu, 11 Jun 2020 15:30:27 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:30:04 -0700
Message-Id: <20200611223016.259837-1-hskinnemoen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2 00/12] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC machines
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3g7DiXgsKCGwRcUSXXOWYOXQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9rQ1Lej0OaG

This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to boot
an OpenBMC image built for quanta-gsj. This includes device models for:

  - Global Configuration Registers
  - Clock Control
  - Timers
  - Fuses
  - Memory Controller
  - Flash Controller

These modules, along with the existing Cortex A9 CPU cores and built-in
peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in turn form
the foundation for the quanta-gsj and npcm750-evb machines, respectively. The
two SoCs are very similar; the only difference is that NPCM730 is missing some
peripherals that NPCM750 has, and which are not considered essential for
datacenter use (e.g. graphics controllers). For more information, see

https://www.nuvoton.com/products/cloud-computing/ibmc/

Both quanta-gsj and npcm750-evb correspond to real boards supported by OpenBMC.
While this initial series uses a stripped-down kernel for testing, future
series will be tested using OpenBMC images built from public sources. I'm
currently putting the finishing touches on flash controller support, which is
necessary to boot a full OpenBMC image, and will be enabled by the next series.

The patches in this series were developed by Google and reviewed by Nuvoton. We
will be maintaining the machine and peripheral support together.

The data sheet for these SoCs is not generally available. Please let me know if
more comments are needed to understand the device behavior.

Changes since v1 (requested by reviewers):

  - Clarify the source of CLK reset values.
  - Made smpboot a constant byte array, eliinated byte swapping.
  - NPCM7xxState now stores an array of ARMCPUs, not pointers to ARMCPUs.
  - Clarify why EL3 is disabled.
  - Introduce NPCM7XX_NUM_IRQ constant.
  - Set the number of CPUs according to SoC variant, and disallow command line
    overrides (i.e. you can no longer override the number of CPUs with the -smp
    parameter). This is trying to follow the spirit of
    https://patchwork.kernel.org/patch/11595407/.
  - Switch register operations to DEVICE_LITTLE_ENDIAN throughout.
  - Machine documentation added (new patch).

Changes since v1 to support flash booting:

  - GCR reset value changes to get past memory initialization when booting
    from flash (patches 2 and 5):
      - INTCR2 now indicates that the DDR controller is initialized.
      - INTCR3 is initialized according to DDR memory size. A realize()
	method was implemented to achieve this.
  - Refactor the machine initialization a bit to make it easier to drop in
    machine-specific flash initialization (patch 6).
  - Extend the series with additional patches to enable booting from flash:
      - Boot ROM (through the -bios option).
      - OTP (fuse) controller.
      - Memory Controller stub (just enough to skip memory training).
      - Flash controller.
      - Board-specific flash initialization.

Thanks for reviewing,

Havard

Havard Skinnemoen (12):
  npcm7xx: Add config symbol
  hw/misc: Add NPCM7xx System Global Control Registers device model
  hw/misc: Add NPCM7xx Clock Controller device model
  hw/timer: Add NPCM7xx Timer device model
  hw/arm: Add NPCM730 and NPCM750 SoC models
  hw/arm: Add two NPCM7xx-based machines
  hw/arm: Load -bios image as a boot ROM for npcm7xx
  hw/nvram: NPCM7xx OTP device model
  hw/mem: Stubbed out NPCM7xx Memory Controller model
  hw/ssi: NPCM7xx Flash Interface Unit device model
  hw/arm: Wire up BMC boot flash for npcm750-evb and quanta-gsj
  docs/system: Add Nuvoton machine documentation

 MAINTAINERS                      |  18 ++
 default-configs/arm-softmmu.mak  |   1 +
 docs/system/arm/nuvoton.rst      |  89 ++++++
 docs/system/target-arm.rst       |   1 +
 hw/arm/Kconfig                   |   9 +
 hw/arm/Makefile.objs             |   1 +
 hw/arm/npcm7xx.c                 | 449 ++++++++++++++++++++++++++++
 hw/arm/npcm7xx_boards.c          | 168 +++++++++++
 hw/mem/Makefile.objs             |   1 +
 hw/mem/npcm7xx_mc.c              |  83 ++++++
 hw/misc/Makefile.objs            |   2 +
 hw/misc/npcm7xx_clk.c            | 216 ++++++++++++++
 hw/misc/npcm7xx_gcr.c            | 211 +++++++++++++
 hw/misc/trace-events             |   8 +
 hw/nvram/Makefile.objs           |   1 +
 hw/nvram/npcm7xx_otp.c           | 391 ++++++++++++++++++++++++
 hw/ssi/Makefile.objs             |   1 +
 hw/ssi/npcm7xx_fiu.c             | 497 +++++++++++++++++++++++++++++++
 hw/ssi/trace-events              |   9 +
 hw/timer/Makefile.objs           |   1 +
 hw/timer/npcm7xx_timer.c         | 437 +++++++++++++++++++++++++++
 hw/timer/trace-events            |   5 +
 include/hw/arm/npcm7xx.h         | 106 +++++++
 include/hw/mem/npcm7xx_mc.h      |  35 +++
 include/hw/misc/npcm7xx_clk.h    |  65 ++++
 include/hw/misc/npcm7xx_gcr.h    |  76 +++++
 include/hw/nvram/npcm7xx_otp.h   |  93 ++++++
 include/hw/ssi/npcm7xx_fiu.h     |  99 ++++++
 include/hw/timer/npcm7xx_timer.h |  95 ++++++
 29 files changed, 3168 insertions(+)
 create mode 100644 docs/system/arm/nuvoton.rst
 create mode 100644 hw/arm/npcm7xx.c
 create mode 100644 hw/arm/npcm7xx_boards.c
 create mode 100644 hw/mem/npcm7xx_mc.c
 create mode 100644 hw/misc/npcm7xx_clk.c
 create mode 100644 hw/misc/npcm7xx_gcr.c
 create mode 100644 hw/nvram/npcm7xx_otp.c
 create mode 100644 hw/ssi/npcm7xx_fiu.c
 create mode 100644 hw/timer/npcm7xx_timer.c
 create mode 100644 include/hw/arm/npcm7xx.h
 create mode 100644 include/hw/mem/npcm7xx_mc.h
 create mode 100644 include/hw/misc/npcm7xx_clk.h
 create mode 100644 include/hw/misc/npcm7xx_gcr.h
 create mode 100644 include/hw/nvram/npcm7xx_otp.h
 create mode 100644 include/hw/ssi/npcm7xx_fiu.h
 create mode 100644 include/hw/timer/npcm7xx_timer.h

-- 
2.27.0.290.gba653c62da-goog

