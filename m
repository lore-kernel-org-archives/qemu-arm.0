Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1641762ejb;
        Fri, 3 Feb 2023 10:09:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9SFUTJ0UIfNv5vGrNs6Gk9KA86hwRoXmmTGNUNGcq+EisW0Vk5zCSBWgN3DTS5i3SxM0HC
X-Received: by 2002:a25:9243:0:b0:80b:bb5c:d0bd with SMTP id e3-20020a259243000000b0080bbb5cd0bdmr7578044ybo.12.1675447767261;
        Fri, 03 Feb 2023 10:09:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447767; cv=none;
        d=google.com; s=arc-20160816;
        b=OVB00KpvrKbWMuw02UqbeQCNojTL5G0+vfms/kYrpDl9N1feiaqIsoIHEZlK2HcMYG
         JnXe1IvM2lpc8WwGLMtKvXX9Q6dv9hm6pt2ScoL6ShKegsaHK0+iJ16qxjN8OHUY2eyk
         yaXmF6ncRBd1UgwcakJWzdKG3LgNcZ0PL+n59pYVWLvmPtFsWvV8hloUP0YOtCjwYQED
         4feRWnHUkR41HOgrD2j54KmjtSg+pye1bTiSu2MBdfSggNH6Kc9P2s79iL1IHWUs/hOb
         4Lj2P8TpBBsl0my+SMW8MjTedS18dHdFbXC3TrDmzZcKJhdUdaItuIOXSbsIRdjKpGlD
         Vkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jbtr3K/soYpD39/JOx7OqaCZkI9+H1VvjPFqpPMYVq0=;
        b=xGNHdvQksrZMm/T2twnNzKVi031j0yFa7CJzOMfyCYqn2VMOYtXa+7bYZkpf9wypbi
         ohq5bacR3AR+uK/WsFUftBU4x0TpeUFv/NPkiISm6wOrzifAf2AAN6EM41xvqUAR4P/7
         xi+yB6MO8bp2uToeL4E/mA6b5j0/8aol1KFKlVffldA3LcS1tQnBm35JJLW3fUCVSin/
         3JvTdRL5U9GcT4dqJA7KBqq7U4WKDf1R7pOElhdP0WueABH7kd5IW3VHge71KOJ7vdY0
         quu7EmHXsN+Xef6DR+7RWV0LRTBlyEJvGu6g6mbS8BnUlmb0Nmz6Trelo0sMLyZeWOdI
         emjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SP+vwCH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020a67fa8f000000b003f087639ce6si851882vsq.409.2023.02.03.10.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:09:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SP+vwCH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0V0-0006ze-OF; Fri, 03 Feb 2023 13:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Uy-0006yt-NY
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:20 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Uv-00088p-Qb
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:20 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso6579331wmp.3
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jbtr3K/soYpD39/JOx7OqaCZkI9+H1VvjPFqpPMYVq0=;
 b=SP+vwCH5qYrHjRPHA/lMsY+Kta5SwlPcAY8AJaKR9oT1VSTVE2C2ysGzhTFaYMdLhn
 qvnmniHEhkNZYrieLa7sNyO1ZljbElQhvGllSGs0otNyJQCeZIXwGBT6wvKgw/KUN9jv
 hf1D7izv//uEsxyvKAQhCSEMKMrzs3k3QndDGEhN8Uk3P0D3+JtNf3GkU42gzoMASviQ
 80bzi2gpWSKELb+WTRuvBPA+35GbskHkakG4eQtqcMHhtPBtoAgHqKcQ9D9ytnLLj6/w
 Z8NjO8680Rv9n/Tuuur2/SMNbe2AkMz3oKcbGqoMQ3x9S/0oJFnItUjelAcK03wiXinZ
 BnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jbtr3K/soYpD39/JOx7OqaCZkI9+H1VvjPFqpPMYVq0=;
 b=1ecnxvskIQSBbmPi++mWm9MgwGf+g6OP/YGyjAU2Ma8Jxuohzu/xZYvxJJqppOrx+6
 cE8KFPupRLfofT8JybDntox84QLOatiC74UDJeB70gmbgLb6SSLY8YzCB76IxmqnYpG4
 8RbeF9uWr8bY7yyyHSuUh4yeGIK4fsRt2IKEjV6/FKeUVuLEOGI/OOvwSLtjXYoKPKum
 pW8YPjWhJDxULu0h/ru9sJjRXo2a8tJZe5TKj14nu+JvX7eV9nJg3jzQQSQB1yd1FjBm
 I+gdgiei1JahUr/REKzPiQIZ/x+96YgaWUlIql0s2ozWat+LQLRt2oBaBCK5kl2HfJ0z
 wdtQ==
X-Gm-Message-State: AO0yUKU/ulLzk3oKEV08uOPT9OP3EVepuX1AOxNdFYNT7H3PrjHXa/AY
 jQGVQkSq2ZuIb977c7el7/+h5Q==
X-Received: by 2002:a05:600c:4711:b0:3df:e474:2ab2 with SMTP id
 v17-20020a05600c471100b003dfe4742ab2mr5872752wmo.33.1675447756023; 
 Fri, 03 Feb 2023 10:09:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m40-20020a05600c3b2800b003dcc82ce53fsm3700790wms.38.2023.02.03.10.09.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/19] hw: Set QDev properties using QDev API (part 1/3)
Date: Fri,  3 Feb 2023 19:08:55 +0100
Message-Id: <20230203180914.49112-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lsGlTJ3EMVRM

QEMU provides the QOM API for core objects.
Devices are modelled on top of QOM as QDev objects.

There is no point in using the lower level QOM API with
QDev; it makes the code more complex and harder to review.

I first converted all the calls using errp=&error_abort or
&errp=NULL, then noticed the other uses weren't really
consistent.

A QDev property defined with the DEFINE_PROP_xxx() macros
is always available, thus can't fail. When using hot-plug
devices, we only need to check for optional properties
registered at runtime with the object_property_add_XXX()
API. Some are even always registered in device instance_init.

I have probably been overzealous, so I tagged the patches
not using errp=&error_abort|&error_fatal|NULL as RFC.

PPC and ARM conversions will follow as two different series.

Philippe Mathieu-Daudé (19):
  scripts/coccinelle: Add qom-qdev-prop.cocci
  hw/qdev: Introduce qdev_prop_set_link()
  hw/acpi: Set QDev properties using QDev API
  hw/audio: Set QDev properties using QDev API
  hw/core/numa: Set QDev properties using QDev API
  hw/core/gpio: Set QDev properties using QDev API
  hw/scsi: Set QDev properties using QDev API
  hw/usb: Set QDev properties using QDev API
  hw/virtio: Set QDev properties using QDev API
  hw/avr: Set QDev properties using QDev API
  hw/hppa: Set QDev properties using QDev API
  hw/i386: Set QDev properties using QDev API
  hw/m68k: Set QDev properties using QDev API
  hw/microblaze: Set QDev properties using QDev API
  hw/mips: Set QDev properties using QDev API
  hw/nios2: Set QDev properties using QDev API
  hw/riscv: Set QDev properties using QDev API
  hw/rx: Set QDev properties using QDev API
  hw/sparc: Set QDev properties using QDev API

 hw/acpi/cpu_hotplug.c                    |  7 ++--
 hw/acpi/ich9.c                           |  4 +--
 hw/acpi/piix4.c                          |  4 +--
 hw/avr/arduino.c                         |  4 +--
 hw/avr/atmega.c                          |  4 +--
 hw/core/gpio.c                           |  8 ++---
 hw/core/numa.c                           |  4 +--
 hw/core/qdev-properties.c                |  5 +++
 hw/display/virtio-gpu-pci.c              |  4 +--
 hw/display/virtio-vga.c                  |  4 +--
 hw/dma/sparc32_dma.c                     |  6 ++--
 hw/hppa/machine.c                        |  3 +-
 hw/i386/pc.c                             |  8 ++---
 hw/i386/pc_q35.c                         | 25 +++++++-------
 hw/i386/sgx.c                            |  3 +-
 hw/i386/x86.c                            | 12 +++----
 hw/m68k/next-cube.c                      |  2 +-
 hw/m68k/q800.c                           |  7 ++--
 hw/mem/pc-dimm.c                         |  5 ++-
 hw/microblaze/petalogix_ml605_mmu.c      | 40 ++++++++++------------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          | 40 +++++++++-------------
 hw/mips/boston.c                         |  6 ++--
 hw/mips/cps.c                            | 42 ++++++++----------------
 hw/mips/jazz.c                           |  3 +-
 hw/mips/malta.c                          |  6 ++--
 hw/nios2/10m50_devboard.c                |  2 +-
 hw/riscv/microchip_pfsoc.c               |  8 ++---
 hw/riscv/opentitan.c                     |  9 ++---
 hw/riscv/shakti_c.c                      |  7 ++--
 hw/riscv/sifive_e.c                      |  8 ++---
 hw/riscv/sifive_u.c                      |  9 ++---
 hw/riscv/spike.c                         | 10 +++---
 hw/riscv/virt.c                          |  9 ++---
 hw/rx/rx-gdbsim.c                        | 11 +++----
 hw/scsi/scsi-bus.c                       |  6 +---
 hw/sparc/sun4m.c                         | 10 +++---
 hw/sparc64/sun4u.c                       |  3 +-
 hw/usb/hcd-xhci-pci.c                    |  2 +-
 hw/usb/hcd-xhci-sysbus.c                 |  2 +-
 hw/virtio/virtio-iommu-pci.c             |  3 +-
 hw/virtio/virtio-rng.c                   |  3 +-
 include/hw/audio/pcspk.h                 |  2 +-
 include/hw/qdev-properties.h             |  1 +
 target/i386/cpu.c                        |  6 ++--
 target/i386/host-cpu.c                   |  7 ++--
 46 files changed, 155 insertions(+), 221 deletions(-)
 create mode 100644 scripts/coccinelle/qom-qdev-prop.cocci

-- 
2.38.1

