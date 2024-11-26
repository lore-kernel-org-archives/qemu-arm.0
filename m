Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1936392njc;
        Tue, 26 Nov 2024 03:25:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZIH59UjEGkjVRwPBUwYs7N/SHvAU2mF1vZl2cSwpjZgeKmOxF01OB5w5kenQBIIK8MN/mozlk9rjWOw==@linaro.org
X-Google-Smtp-Source: AGHT+IHbVwIDDYwYncfxLxEnpS20g2LNK83Ya7uTuzIt0aVAREcQt8LjVjQQzCp2450gtC3J0o/N
X-Received: by 2002:ac8:7f54:0:b0:461:15fc:7f85 with SMTP id d75a77b69052e-4653d61ddefmr246942621cf.42.1732620304259;
        Tue, 26 Nov 2024 03:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620304; cv=none;
        d=google.com; s=arc-20240605;
        b=PCMtycbyQFeJ5Y27cS70qPnP/Z1tukGOhGC2pVRFILniZ69bWD0GUj38OiSIRyZx1/
         Auyx2+dD2fZScp3F5t9U7hDwgrsn6GvW2Fro4JEKP7MNof5rc6QjOc7Y1ZYzGt1261U9
         fy1OP+SYU1wYGPtEw30rCOnd55a6rz9dezuisJxT1LCk6mKscNmXoXJm2y7KecysNBcQ
         l1dgqq3KqaEfWjlxceqGtISnzbdx/oDhgwUq3fQH/XnBA/I0zH844AKaJxhmjt9JiRHm
         S8oKfeOyIzBIhJuMTTbWj4g8yY0IDvWUEIBroOvTGIxRwITWi0QcxkV7XyQMOzLewGe9
         1/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KF5+Q+1rOwwX8eIZyyP/Swk9x61oFbeTaj2aNqOzoek=;
        fh=gHQZREYoQxOeSyNbWPSYr+QZswpRfyVqpvsK7C56dWU=;
        b=iXDGSszhqXeSQWaQg6vUbO8lnLpw4aMzgLmWVh+UNzo5FN3IaYNtnlIiD7dghuQraG
         lyts5sioe600bwnK/csyKZeQxxWcyJFeyv4jGs7FiNhTWincAicvpcSeI98FJqGhn6aS
         Eb4QtjUg7QD53zkyGBhvo+gzpcATOuBwiBMqwBwjQBPknVSPcHUxB43UKzT7ibOBwE9y
         STmraSsfKAxFIaVDn4tkC39jMFzOUO5Jh+OBTbk8iUA6OG+vHdB7m47wt1z/eXlR95Vz
         hvjQC4P6dEasjDVAea1WSev7HV+6ghptUDD/rjIXAUaTKiKe03vWDukylbhs6dxSt+b3
         lqdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqspTHG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4666fe6d24csi90694821cf.527.2024.11.26.03.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqspTHG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFteA-0003gK-Vg; Tue, 26 Nov 2024 06:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFte9-0003fe-Ps
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:22:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFte6-0002Vc-BO
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:22:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38246333e12so5467684f8f.1
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620135; x=1733224935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KF5+Q+1rOwwX8eIZyyP/Swk9x61oFbeTaj2aNqOzoek=;
 b=uqspTHG7nWNYGC04V7d9iVNSCuRszDF0T0PhCE1EP+v8tqK70adGQPBqRqrsUSt2ue
 58nMqaRi8CsezZLP2+N82HflK4ah5bGK/hVF0Q3eOy1BO+bq8rLjK2HELm9mQXBqCQtZ
 +Eyls/Md6HqHay4nxB1hV37t+N9PwFXD8T0x1eMyNphvFNIXm+jwbxs6lM3DpkVs8lrr
 /gHvRJm+XqD9dWmgNaZg8414n/G3KFyzMkuuJKdfVeAmmqoSCwpZckJz8KgFmpyapblT
 UEteKKL9q10R1bZxLVmc0wKGRrQoEyvrYD2Bn+ztqkshyJWQevxmSmHefaftZuPKhDQz
 0oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620135; x=1733224935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KF5+Q+1rOwwX8eIZyyP/Swk9x61oFbeTaj2aNqOzoek=;
 b=rFqEkL3fXnwXB8CABRgiPweWs6B+fa0bb6IRLxfnkwGGrNqm3tfYZhWi3BoC+yGnId
 DogucAth6QqOHHWZ1+51+FszmajeYBlBTmNOFVHYQ90nNPWQvsJDj56aM28/fQUVqmkR
 ybQA/4YLg79U0EnAvwLeyKnfS8ExcDzvajlBafccDQuFLxAhuXh9GaNZATRHOqUO47X0
 WIcOR9Pe1Kr/GJyMPlb6tl/vNzMswzDEeE7BaxrY0OCnGjpKRAS9gPON4iWWnrSkY1JT
 cED6tElOT5PUK1yx3g/BWi9W1RHSNUKMAKFldqAP/Xd6KmCPEhDJWlXjVLYOeX01zKp3
 B4Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaMVuCBG+jWnI1gG1/Lt9QoT9FJs+We2277dn2RU0AmMAGhK84dZmKdW7Rjwl71SZxDFqF4owJLw==@nongnu.org
X-Gm-Message-State: AOJu0YywPbuv4uOJPC9wl3mEW28WNNtworXgd/6kN3UFF934X9TIQBus
 BAJfBR0NafJa/FVT3sH+uSbGI6jF0Ohs2LtdcqKPMV8tCsOHkBdP8xozSjmEVHM=
X-Gm-Gg: ASbGncv0/4hAgJ1Tps/pABRm6lYxCYroFnebcFt6mDBPsTLgHxcR21+hjoKOPocXm9n
 ItLC7y041CfRLWhrfGM0YSu5abR+KUo3khf7Qq/gHgQ9dYpXRacbRDJKXDxyl5oW0tGU0FkGJWa
 lspkUkHkaxXYhRgF3AB0h5zAmBTL3LyPdKfnyOR4/yO1KO7PBLv3adSnQF4UfL+zxCYFkh29vhW
 uGSRmfB6sqSPHeyb5ji+48yQ0b6t7X64zJyGzBmVJk+N6j/edU9qHPcNsPNIhXUCktu56oN
X-Received: by 2002:a5d:5f53:0:b0:382:46ea:1113 with SMTP id
 ffacd0b85a97d-38260b3cc31mr15783506f8f.4.1732620135272; 
 Tue, 26 Nov 2024 03:22:15 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc34bdsm13398468f8f.78.2024.11.26.03.22.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 00/13] hw/boards: Remove legacy
 MachineClass::pci_allow_0_address flag
Date: Tue, 26 Nov 2024 12:21:59 +0100
Message-ID: <20241126112212.64524-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: GuAJxgWo+2uP

Since v1:
- Looked at previous analysis from Peter [1]
- Invert logic so "allow address 0 accesses" is default

---

This series aims to remove a legacy field from
MachineClass. Why? Because it doesn't scale on
heterogeneous machine where different host bridges
are created.

Rather than a global exposed to all machines,
use a pci-bus specific flag on each machine
requiring it, propagated by the host bridge
device.

No logical change intended, only machines previously
using pci_allow_0_address do not set refuse-bar-at-addr-0.

Presumably various machines neither need to set this
'refuse-bar-at-addr-0' flag, but updating that is
deferred to each machine maintainer since I don't have
the knowledge and sufficient test suite IMHO.

[1] https://lore.kernel.org/qemu-devel/20241125140535.4526-1-philmd@linaro.org/
[2] https://lore.kernel.org/qemu-devel/1444683308-30543-1-git-send-email-agordeev@redhat.com/T/#u

Philippe Mathieu-Daudé (13):
  hw/pci: Do not declare PCIBus::flags mask as enum
  hw/pci-bridge: Initialize bridge with parent bus flags
  hw/pci: Factor machine_refuses_bar_at_addr_0() helper out
  hw/pci: Introduce PCIBusFlag::PCI_BUS_BAR_AT_ADDR0_REFUSED
  hw/pci: Propagate bar_at_addr_0_refused to
    pci_root_bus_internal_init()
  hw/pci: Propagate bar_at_addr_0_refused to pci_root_bus_init()
  hw/pci: Propagate bar_at_addr_0_refused to pci_root_bus_new()
  hw/pci: Propagate bar_at_addr_0_refused to pci_register_root_bus()
  hw/ppc/spapr: Create host bridge setting bar_at_addr_0_refused=false
  hw/pci-host/gpex: Expose 'refuse-bar-at-addr-0' property
  hw/arm/virt: Create GPEX host bridge without refuse-bar-at-addr-0
  hw/riscv/virt: Create GPEX host bridge without refuse-bar-at-addr-0
  hw/pci/pci: Remove legacy MachineClass::pci_allow_0_address flag

 include/hw/boards.h                 |  1 -
 include/hw/pci-host/gpex.h          |  1 +
 include/hw/pci/pci.h                |  8 +++++---
 include/hw/pci/pci_bus.h            | 10 ++++++++--
 hw/alpha/typhoon.c                  |  2 +-
 hw/arm/sbsa-ref.c                   |  1 -
 hw/arm/virt.c                       |  1 -
 hw/i386/microvm.c                   |  2 ++
 hw/loongarch/virt.c                 |  2 ++
 hw/mips/loongson3_virt.c            |  2 ++
 hw/openrisc/virt.c                  |  2 ++
 hw/pci-bridge/pci_expander_bridge.c | 17 +++++++++++-----
 hw/pci-host/articia.c               |  3 ++-
 hw/pci-host/astro.c                 |  3 ++-
 hw/pci-host/bonito.c                |  2 +-
 hw/pci-host/designware.c            |  2 +-
 hw/pci-host/dino.c                  |  2 +-
 hw/pci-host/gpex.c                  |  5 ++++-
 hw/pci-host/grackle.c               |  2 +-
 hw/pci-host/gt64120.c               |  2 +-
 hw/pci-host/i440fx.c                |  2 +-
 hw/pci-host/mv64361.c               |  2 +-
 hw/pci-host/pnv_phb3.c              |  2 +-
 hw/pci-host/pnv_phb4.c              |  2 +-
 hw/pci-host/ppc440_pcix.c           |  2 +-
 hw/pci-host/ppc4xx_pci.c            |  2 +-
 hw/pci-host/ppce500.c               |  3 ++-
 hw/pci-host/q35.c                   |  2 +-
 hw/pci-host/raven.c                 |  2 +-
 hw/pci-host/remote.c                |  2 +-
 hw/pci-host/sabre.c                 |  2 +-
 hw/pci-host/sh_pci.c                |  2 +-
 hw/pci-host/uninorth.c              |  8 ++++----
 hw/pci-host/versatile.c             |  2 +-
 hw/pci-host/xilinx-pcie.c           |  2 +-
 hw/pci/pci.c                        | 31 ++++++++++++++++++-----------
 hw/pci/pci_bridge.c                 |  1 +
 hw/ppc/ppc440_uc.c                  |  2 +-
 hw/ppc/spapr.c                      |  1 -
 hw/ppc/spapr_pci.c                  |  2 +-
 hw/riscv/virt.c                     |  1 -
 hw/s390x/s390-pci-bus.c             |  2 +-
 hw/xen/xen-pvh-common.c             |  2 ++
 hw/xtensa/virt.c                    |  2 ++
 44 files changed, 94 insertions(+), 57 deletions(-)

-- 
2.45.2

