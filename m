Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3F3C9830E
	for <qemu-arm@archiver.kernel.org>; Thu, 24 Sep 2026 08:17:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9ee8-0008QL-RS; Thu, 24 Sep 2026 04:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x9ee6-0008Pd-Sb
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 04:17:34 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x9ee3-0004Ud-6l
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 04:17:34 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4aa8d881so1851303d50.1
 for <qemu-arm@nongnu.org>; Thu, 24 Sep 2026 01:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790237849; cv=none;
 d=google.com; s=arc-20260327;
 b=i8dC2+g4gQFnj5F6+ME7kqB9Bcq2954u/SV98uVUVePVCnFmnNeRTtXjRqcmFV6qYS
 PFzyaRuFshoA5mk7V1iUDc+kRb4dxTORfU7yR32GTI8VG6n4I897HSiWSlOC+J7GP3EF
 UP47JIPXBeg7HK7cdHTSiCSX7tEQFIcuNeZ859QEG2Kfkd3JQTCqN0uiJoMvLdOHdm+h
 HMlRdIyYG5tgk8nv3DTQh6gp9XImexOkX4wYV+oewmG37nBNwbrRV7jN/FyQUC2V2df0
 k1EP+PcPMnzsaRR1xmdsjLDu4ldERRZx/Rw9eryGhJtNcuBTogiiv15HgMsG/QUTYtR2
 Q1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WMDPFUIAwhcXLRMFQptmFPCdBjYlqmtypgRwhRDY7VE=;
 fh=p1ag85W//oAnFs+ksDURiB4dWLcc/kUfeZ4nF2EWTdk=;
 b=aDOgn/MPjJ9yVPS4BrMHxxWkWyHx3jMy+FD3zd87r2nXm2rl3pwqHQ9SRGjXHI2D5T
 wctmeGtGGB9oOHP24wVxz63ZVSouZyBSlnvEeQW8OMfq+yZrIwRU2gVel2QNlUGxqOS3
 bOLAP9A79LAGTjN+XtcEV8zRSIgLIWX8jkX/Y2jAea9aQ84vogKJg8DGXouXmztlWC0c
 XxdSO/VPUHHrBZYeLaVmcgwXzAJRkY5VQxZPJzY5Aynsj4stBhpBGgRG8jd92pk24m5l
 OPal5KX3wyE6tyZB/3qAUVR9GVRPWlK9xMRTLXjFaIqmfVrO5kVTVoQdpRhiAnb8TpsQ
 Hqnw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790237849; x=1790842649; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WMDPFUIAwhcXLRMFQptmFPCdBjYlqmtypgRwhRDY7VE=;
 b=hjhnpX4sAHrZ3abHW8ji9QT7Wy8HIKiVajMRKlkHo8OK9BtYTxzQLqk5P6sjXPyQFU
 d44tA+f6e8eTLHpkKIS4MfkHQE+VChKCUx+P1jy3aC9wHyHerXOSFJBhaFywCOpI79LM
 pPX532rtR7tRoMeq9GkeUnAlYXipuCr+xxxTnE8K5YDFd+BbIpccVcoCi3NExW++H/tw
 F/vUzEhkxS/vP5OaXnp27W8IBbAIC4yBvhYLi8u87FWH8opouUClW70FkdYPB/+nXHp9
 XVkeZdd3wA9zV4uy1Bv5JoWVZsub8rl+Dgf+iL0HmEpcTzcWzpWSF/iLcw1Xfldwyv6z
 ihNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790237849; x=1790842649;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WMDPFUIAwhcXLRMFQptmFPCdBjYlqmtypgRwhRDY7VE=;
 b=Lr2d5qCBDt8dGfXT8AMa2NlQlHiw91lrR7dUSRanwCQqmFBKi/DiuxaZCqaLl06+0n
 nb1mBOOrEGzBuqeig6CpD1e38SheE83Bjwwejjrp4SG0mP9xnNsszlVkdpY7+JopW+hg
 MGqrVz86iZTMwOBatwgdBAzFGiiUr0zaINx05UCMUW6Z5/yTMgG/qi8JzYMyt2dJKdrq
 q4zbWhW4GzocXZijpLkXanY+FhTBHiFmJGiYSvqu5Cm8fqCegeD+FuJ1XiTcG2+eZsFw
 C+0hN/2StxQkWKSKpnQI+93+C8jEzvhCjSUo1W+NlQPh0Po9mEwEkK3Nuu9yOHAJJv+o
 Y5iw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwoFhNzwMZfahxvKpsSXBu4X9hjqsPsEPehQAGg/YwZCiF4dHhwcjtfPXiHYOpKg3VVfX6lYaJfGA==@nongnu.org
X-Gm-Message-State: AFuF++mTr1oTPk+eBDQfzcV+QJQTP9KOBzbbOJOJMjd1lQw0BfX63iac
 d5V+OENEyHZZsOzW0dDPhpcBSfAqEtAwUaqH0AuVSjnppDscSWVCv+qCHbnfeWCKIYOEZVyHhNf
 fiEHzl4s9H59w4y/ytMckSSESsIaJ3zs=
X-Gm-Gg: AYBFou0QSa1a61N3mL7nvltlGWvRljW6mpb+tIEpNL9ytlMXnTAcDugaavL2qLXMd75
 3EJH+79wLhKAJ8Q2BZ3ICYGpkKFWtHdwXvTAmEZeMUUMNTKEy8ceuGzjf1dXTxqgLDsu99a5OPi
 5SKkCHFua7He54bY6J9r6rAKyZDnuHHuP2Apqc8UGOFrYYMIJ+j+GPE5aluAbjM/NSdR0E1Scdv
 CESlql8EBkHJiCe9OiV8dewRYyrds9atdC/iWageC3/7Y6UcINJSRucfhJzP1rY0gb3nBl8J16c
 55InAfquiiWs/4neyVgh2mXrO1bv9d0GPeBlIlKvhSpRH7fr9trBI3Gz
X-Received: by 2002:a05:690e:4889:20b0:66e:61c8:33f2 with SMTP id
 956f58d0204a3-672ed25f1a8mr687858d50.18.1790237849200; Thu, 24 Sep 2026
 01:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260908104159.1621764-1-bin.meng@processmission.com>
In-Reply-To: <20260908104159.1621764-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 24 Sep 2026 16:17:16 +0800
X-Gm-Features: AclHuK_3ab5DDHVGNFLlPel-dFmXix1n-nhSunxxwN4bj0jSOL9kA_S60zZjybQ
Message-ID: <CAEUhbmVH_=Q6NjhU2f5oqZwD3i1FQRQyvngvMcBsf9nKJYq02Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/32] hw/arm: Add Phytium E2000Q SoC and board support
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Sep 8, 2026 at 6:42=E2=80=AFPM Bin Meng <bin.meng@processmission.co=
m> wrote:
>
>
> The Phytium E2000Q is a heterogeneous Armv8 SoC with two FTC664 cores
> and two FTC310 cores. This series adds a reusable E2000Q SoC QOM
> device which owns Cortex-A72 CPU children and applies the FTC core
> configuration locally. Two board machines embed the SoC:
>
>   - phytium-pi, with firmware and Linux on SD0
>   - phytium-e2000-come, with firmware in QSPI NOR and Linux on an
>     AHCI1 SATA disk
>
> The machines support the vendor firmware path from the on-chip
> Phytium Boot ROM (PBR) handoff through Processor Base Firmware (PBF),
> TF-A, OP-TEE, U-Boot, and Linux. They can also directly boot SDK Linux
> kernels when supplied with matching board device trees.
>
> The PBR model does not execute undocumented ROM code. It parses the
> selected fip-all.bin, validates the PBF, TF-A FIP, and platform
> parameter records, and reconstructs the observed handoff state. The
> MHU model handles the private SCMI power-domain requests needed to
> release secondary CPUs and exposes a separate Base-protocol channel
> to Linux.
>
> The E2000Q SoC provides GICv3/ITS, UARTs, GPEX PCIe, SMMUv3, four
> Cadence GEM controllers, two DesignWare-derived MCI controllers, QSPI,
> I2C, xHCI, AHCI, a random generator, and the firmware-facing DDR and
> control regions. Board machines retain RAM, firmware media, and
> storage backend attachment. Unimplemented register windows remain
> visible to firmware without claiming unsupported behavior.
>
> Functional tests exercise both firmware and direct Linux boot on the
> Phytium Pi with an SDK Buildroot image. Manual testing covers Phytium
> Pi SD boot, COMe QSPI-to-SATA boot, all four CPUs, and network access.
>
> Known limitations are documented. In particular, the PBR handoff is
> a behavioral model validated against the available SDK firmware
> samples.
>
> Changes in v2:
> - Use scripts/git.orderfile when generating the series
> - Configure FTC cores as SoC-owned Cortex-A72 CPU children
> - Keep Phytium CPU configuration out of the global ARM CPU list
> - Explain why the Phytium machines are restricted to TCG
> - Reduce the DesignWare MCI register migration state to 96 words
>
> Bin Meng (32):
>   hw/arm: Add Phytium E2000 SoC and Phytium Pi machine
>   hw/arm: phytium: Add Phytium E2000 PCIe host
>   hw/sd: Add Synopsys DesignWare MCI controller
>   hw/sd: Add Phytium E2000 MCI controller
>   hw/arm: phytium: Connect Phytium E2000 MCI controllers
>   tests/qtest: Add Synopsys DesignWare MCI coverage
>   hw/arm: phytium: Connect Phytium E2000 GEM controllers
>   hw/misc: Add Phytium E2000 DDR controller
>   hw/arm: phytium: Connect the Phytium E2000 DDR controller
>   hw/misc: Add Phytium E2000 MHU doorbell
>   hw/arm: phytium: Connect the Phytium E2000 MHU
>   hw/ssi: Add Phytium E2000 QSPI controller
>   hw/arm: phytium: Connect the Phytium E2000 QSPI controller
>   hw/misc: Add Phytium E2000 PBR model
>   hw/arm: phytium: Integrate the Phytium E2000 PBR
>   hw/arm: phytium: Add Phytium E2000 control region placeholders
>   hw/misc: Support Phytium E2000 SCMI CPU power control
>   hw/arm: phytium: Select the Phytium E2000 PBR boot medium
>   hw/arm: phytium: Connect the Phytium E2000 I2C controller
>   hw/arm: phytium: Add Phytium E2000 xHCI controllers
>   hw/misc: Model the Phytium E2000 random generator
>   hw/arm: phytium: Connect the Phytium E2000 random generator
>   hw/arm: phytium: Support Phytium E2000 direct Linux boot
>   hw/arm: phytium: Add Phytium E2000Q COMe machine
>   hw/block: m25p80: Add GigaDevice GD25Q128 flash
>   hw/arm: phytium: Connect the Phytium E2000Q COMe QSPI flash
>   hw/arm: phytium: Add Phytium E2000 AHCI controllers
>   hw/arm: Add Phytium E2000 Linux SCMI channel
>   hw/arm: phytium: Connect the Phytium E2000 SMMUv3
>   docs/system/arm: Document Phytium E2000 machines
>   tests/functional/aarch64: Add Phytium Pi boot tests
>   MAINTAINERS: Add Phytium E2000Q machines
>
>  MAINTAINERS                                 |   18 +
>  docs/system/arm/phytium_e2000.rst           |  422 ++++++
>  docs/system/target-arm.rst                  |    1 +
>  include/hw/arm/phytium_e2000.h              |  120 ++
>  include/hw/misc/phytium_e2000_ddr.h         |   23 +
>  include/hw/misc/phytium_e2000_mhu.h         |   34 +
>  include/hw/misc/phytium_e2000_pbr.h         |   62 +
>  include/hw/misc/phytium_e2000_rng.h         |   23 +
>  include/hw/sd/dw_mci.h                      |   75 +
>  include/hw/sd/phytium_e2000_mci.h           |   21 +
>  include/hw/ssi/phytium_qspi.h               |   23 +
>  hw/arm/phytium_e2000.c                      |  958 +++++++++++++
>  hw/arm/phytium_e2000_machine.c              |  388 ++++++
>  hw/block/m25p80.c                           |    1 +
>  hw/misc/phytium_e2000_ddr.c                 |  197 +++
>  hw/misc/phytium_e2000_mhu.c                 |  818 +++++++++++
>  hw/misc/phytium_e2000_pbr.c                 | 1366 ++++++++++++++++++
>  hw/misc/phytium_e2000_rng.c                 |  182 +++
>  hw/sd/dw_mci.c                              | 1382 +++++++++++++++++++
>  hw/sd/phytium_e2000_mci.c                   |   95 ++
>  hw/ssi/phytium_qspi.c                       |  398 ++++++
>  tests/qtest/dw_mci-test.c                   |  417 ++++++
>  hw/arm/Kconfig                              |   22 +
>  hw/arm/meson.build                          |    4 +
>  hw/misc/meson.build                         |    4 +
>  hw/sd/Kconfig                               |    5 +
>  hw/sd/meson.build                           |    2 +
>  hw/ssi/Kconfig                              |    5 +
>  hw/ssi/meson.build                          |    1 +
>  tests/functional/aarch64/meson.build        |    2 +
>  tests/functional/aarch64/test_phytium_pi.py |   77 ++
>  tests/qtest/meson.build                     |    1 +
>  32 files changed, 7147 insertions(+)
>  create mode 100644 docs/system/arm/phytium_e2000.rst
>  create mode 100644 include/hw/arm/phytium_e2000.h
>  create mode 100644 include/hw/misc/phytium_e2000_ddr.h
>  create mode 100644 include/hw/misc/phytium_e2000_mhu.h
>  create mode 100644 include/hw/misc/phytium_e2000_pbr.h
>  create mode 100644 include/hw/misc/phytium_e2000_rng.h
>  create mode 100644 include/hw/sd/dw_mci.h
>  create mode 100644 include/hw/sd/phytium_e2000_mci.h
>  create mode 100644 include/hw/ssi/phytium_qspi.h
>  create mode 100644 hw/arm/phytium_e2000.c
>  create mode 100644 hw/arm/phytium_e2000_machine.c
>  create mode 100644 hw/misc/phytium_e2000_ddr.c
>  create mode 100644 hw/misc/phytium_e2000_mhu.c
>  create mode 100644 hw/misc/phytium_e2000_pbr.c
>  create mode 100644 hw/misc/phytium_e2000_rng.c
>  create mode 100644 hw/sd/dw_mci.c
>  create mode 100644 hw/sd/phytium_e2000_mci.c
>  create mode 100644 hw/ssi/phytium_qspi.c
>  create mode 100644 tests/qtest/dw_mci-test.c
>  create mode 100644 tests/functional/aarch64/test_phytium_pi.py
>
> ---
> base-commit: 35500e5c41aec76cde59befe750600dac7a9e37a
> branch: phytium
>

Ping for review?

