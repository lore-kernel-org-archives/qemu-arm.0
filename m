Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3083742ejb;
        Mon, 5 Jun 2023 15:27:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ78Hg+ETZi4vkclzZ+esKGjbtn3ckD5elTSVGGN4aHmSo8rqlZfCbZLC94jrSfkoG/RIvqU
X-Received: by 2002:a05:6214:27c3:b0:629:78ae:80f0 with SMTP id ge3-20020a05621427c300b0062978ae80f0mr214159qvb.8.1686004046487;
        Mon, 05 Jun 2023 15:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686004046; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLcrjNWthcQs8GuoKmljbPXKEEhc/X689eWtFOgYGxJccYeV2qXIKoHYPAvcQyn65n
         w7dmJdm1xeBtWYq/S3RhZaRzLmbdKOBVUcqiZv+CVvR7dcK68CktboEMocIo9Y7OV3os
         x3ms9jUCkHNwjT8GDbKT3qAy4zfvE5lUMF04mfyNHVXo3mHEMZWUv13srZRgmak5Zi9P
         n04xk5vwMe3JR9fD8fFLsMSyHP7dwqfVL6vgk4uYXo8hXZ4Ftku57IrfvLpHfRy/esub
         JZVxz4IhGOI0+zKuqCySmlnbQE+TpZyNqxOAtRQSqi4wpLZRIOBKKi3kcpXtr4xEkhQ8
         D8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mqZmZIlPEGAgCzEJ/QPGUj5Qrx06/TdJYR7ockJ5GRY=;
        b=GxO7+qb6hHiPt/Y68CQsi6Rf7SIsvbPHTCOXK5SnKIXDE19UrnKm8WBhgA1Etu/sMj
         aKlYIlsyNssZ2dyAq8ysWc/TtsSIFDBqohRPrHAJ1IQMj6Yiy9IoIJHQm3euxixDuC0H
         0NTypWPN6ueGoonAaP6dkRDLq0UCIdQaxjyXwGnw4HfEQPGR8/j6vRlsmh73kOshytBz
         kHq6hsmVEgEsOvKHNJS1zlu/I1D28XnnQ+ew5+jKxjsT+70r7akNQqMrseX7IQDYQQpX
         KIXpgzF6rA5sy9i7WmGxHzOqLqA0lMVhR7EJETNN4WQBu7Jw3t4j2wDcHxv+psN0qoGi
         Gf2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFIarrJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq12-20020ad45fcc000000b005d9aad7e836si5514913qvb.44.2023.06.05.15.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 15:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFIarrJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Icm-0008GK-UT; Mon, 05 Jun 2023 18:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ick-0008FC-Po
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 18:24:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ici-0005tN-Do
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 18:24:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30ae901a9ffso4875110f8f.2
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 15:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686003863; x=1688595863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mqZmZIlPEGAgCzEJ/QPGUj5Qrx06/TdJYR7ockJ5GRY=;
 b=PFIarrJx09Y+DuQcbfhH5vCcGW9I/QaI31BgzaBVf4QHKdX9VIjB41EYoqKn0w4Mae
 F9S4z7PCOfFJPoJe+xlQQ8EPhFya0WWUN/iDkstDDfIdx4dLo2CZJR1r5QdHEl0vs+m+
 lGcIo137qrgLGAGGCujIPQ7J/O6NxkwmKXkMD9E/Z6LVUKafzyO/567A78PC1uEzpmE5
 vjtp0QuGxiOOHmV3O0elK6YtV6yjIfg8XD8UbdTQ2S1WHd5+ieQpDPoH7M2DmSaD+BIq
 em6y+O1REFUGZsnfrv2NNaQNVJc2CcxCwqQ5WYh3nRFmRx/ZVnOYGIe83U1D9jtAJVip
 DFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686003863; x=1688595863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqZmZIlPEGAgCzEJ/QPGUj5Qrx06/TdJYR7ockJ5GRY=;
 b=eYfd5+Tje8vBp1Y1GWvGlSftFU5hLRfdpF9UGNsHFhN03xkkWnHkqIaC2ZMvMWS2Wd
 QSS0bhxtCsEgD7IqL5NIslJZQprfFfJrx7e45TBDnNMj0agUVsm+pFHwiPh/FM5j0I/s
 OYupqC+JjO4s6lonWmECv8FozqzbJsj1J22Zhn4JkFCAJzpMUBY75cj/vIEQA6dnZI/m
 RCwlLShCPiYKvw3Sz9cIbMPCGfLulkwDFeTjt0haSmRS+l0WSz/TbkRxPyg9Q56H2q61
 F0hHp+afS0XtZtV/PfkKu6pAlRsKsaLQLz9tpUT4T/gKcCv2/3PJSBLSjigQpu4Gl0IA
 Z50A==
X-Gm-Message-State: AC+VfDyLFUxoueS2oSI0cU5alWdeEtR1VNxAwhDexgGwlOCal/5FuxAG
 MR4CIou1N652PXn/rRMdi/Udgg==
X-Received: by 2002:a5d:56d2:0:b0:30a:ec6c:913 with SMTP id
 m18-20020a5d56d2000000b0030aec6c0913mr284360wrw.10.1686003862808; 
 Mon, 05 Jun 2023 15:24:22 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 y4-20020adfe6c4000000b00307bc4e39e5sm10756755wrm.117.2023.06.05.15.24.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 15:24:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 0/9] bulk: Replace CONFIG_SOFTMMU by
 !CONFIG_USER_ONLY/CONFIG_SYSTEM_ONLY
Date: Tue,  6 Jun 2023 00:24:11 +0200
Message-Id: <20230605222420.14776-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 4EPUZC0iHYQf

Richard clarified my confusion with CONFIG_SOFTMMU from v1:
https://lore.kernel.org/qemu-devel/7913570a-8bf6-2ac9-6869-fab87273742c@linaro.org/

This series tries to make it a bit more explicit by removing
mentions of CONFIG_SOFTMMU in non-TCG code.

We replace CONFIG_SOFTMMU by !CONFIG_USER_ONLY in C code and
by CONFIG_SYSTEM_ONLY in meson config files.

Philippe Mathieu-Daudé (9):
  target/tricore: Remove pointless CONFIG_SOFTMMU guard
  target/i386: Check for USER_ONLY definition instead of SOFTMMU one
  target/m68k: Check for USER_ONLY definition instead of SOFTMMU one
  target/ppc: Check for USER_ONLY definition instead of SOFTMMU one
  hw/core/cpu: Check for USER_ONLY definition instead of SOFTMMU one
  accel/tcg: Check for USER_ONLY definition instead of SOFTMMU one
  meson: Alias CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
  meson: Replace CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
  meson: Replace softmmu_ss -> system_ss

 docs/devel/build-system.rst        |  14 +--
 meson.build                        |  15 +--
 accel/tcg/internal.h               |   6 +-
 include/hw/core/cpu.h              |   4 +-
 include/hw/core/tcg-cpu-ops.h      | 102 ++++++++++-----------
 target/m68k/helper.h               |   2 +-
 accel/tcg/cpu-exec.c               |   4 +-
 target/i386/tcg/translate.c        |   2 +-
 target/m68k/cpu.c                  |  14 ++-
 target/m68k/helper.c               |   4 +-
 target/m68k/translate.c            |  28 +++---
 target/ppc/cpu_init.c              |  20 ++--
 target/ppc/helper_regs.c           |   6 +-
 target/tricore/helper.c            |   2 -
 accel/meson.build                  |   4 +-
 accel/qtest/meson.build            |   2 +-
 accel/stubs/meson.build            |   2 +-
 accel/tcg/meson.build              |   6 +-
 audio/meson.build                  |   8 +-
 backends/meson.build               |  20 ++--
 backends/tpm/meson.build           |   8 +-
 block/meson.build                  |   6 +-
 block/monitor/meson.build          |   2 +-
 chardev/meson.build                |   2 +-
 disas/meson.build                  |   2 +-
 dump/meson.build                   |   4 +-
 ebpf/meson.build                   |   2 +-
 fsdev/meson.build                  |   4 +-
 gdbstub/meson.build                |  10 +-
 hw/9pfs/meson.build                |   2 +-
 hw/acpi/meson.build                |  10 +-
 hw/adc/meson.build                 |  10 +-
 hw/arm/meson.build                 |   8 +-
 hw/audio/meson.build               |  28 +++---
 hw/block/meson.build               |  28 +++---
 hw/char/meson.build                |  70 +++++++-------
 hw/core/meson.build                |  22 ++---
 hw/cpu/meson.build                 |   6 +-
 hw/cxl/meson.build                 |   4 +-
 hw/display/meson.build             |  76 +++++++--------
 hw/dma/meson.build                 |  32 +++----
 hw/gpio/meson.build                |  26 +++---
 hw/i2c/meson.build                 |   2 +-
 hw/i386/kvm/meson.build            |   2 +-
 hw/ide/meson.build                 |  28 +++---
 hw/input/meson.build               |  32 +++----
 hw/intc/meson.build                |  44 ++++-----
 hw/ipack/meson.build               |   2 +-
 hw/ipmi/meson.build                |   2 +-
 hw/isa/meson.build                 |  18 ++--
 hw/mem/meson.build                 |   8 +-
 hw/misc/macio/meson.build          |   2 +-
 hw/misc/meson.build                | 142 ++++++++++++++---------------
 hw/net/can/meson.build             |  14 +--
 hw/net/meson.build                 |  96 +++++++++----------
 hw/nubus/meson.build               |   2 +-
 hw/nvme/meson.build                |   2 +-
 hw/nvram/meson.build               |  26 +++---
 hw/pci-bridge/meson.build          |   4 +-
 hw/pci-host/meson.build            |   2 +-
 hw/pci/meson.build                 |   8 +-
 hw/pcmcia/meson.build              |   4 +-
 hw/rdma/meson.build                |   2 +-
 hw/remote/meson.build              |   2 +-
 hw/rtc/meson.build                 |  28 +++---
 hw/scsi/meson.build                |   2 +-
 hw/sd/meson.build                  |  24 ++---
 hw/sensor/meson.build              |  18 ++--
 hw/smbios/meson.build              |   6 +-
 hw/ssi/meson.build                 |  26 +++---
 hw/timer/meson.build               |  74 +++++++--------
 hw/tpm/meson.build                 |  14 +--
 hw/usb/meson.build                 |  74 +++++++--------
 hw/virtio/meson.build              |  12 +--
 hw/watchdog/meson.build            |  18 ++--
 hw/xen/meson.build                 |   4 +-
 migration/meson.build              |  12 +--
 monitor/meson.build                |   6 +-
 net/can/meson.build                |   2 +-
 net/meson.build                    |  38 ++++----
 qapi/meson.build                   |   2 +-
 qom/meson.build                    |   2 +-
 replay/meson.build                 |   2 +-
 semihosting/meson.build            |   2 +-
 softmmu/meson.build                |  12 +--
 stats/meson.build                  |   2 +-
 target/alpha/meson.build           |   6 +-
 target/arm/hvf/meson.build         |   2 +-
 target/arm/meson.build             |   6 +-
 target/arm/tcg/meson.build         |   2 +-
 target/avr/meson.build             |   6 +-
 target/cris/meson.build            |   6 +-
 target/hppa/meson.build            |   6 +-
 target/i386/hax/meson.build        |   6 +-
 target/i386/hvf/meson.build        |   2 +-
 target/i386/kvm/meson.build        |   4 +-
 target/i386/meson.build            |   8 +-
 target/i386/nvmm/meson.build       |   4 +-
 target/i386/tcg/sysemu/meson.build |   2 +-
 target/i386/whpx/meson.build       |   2 +-
 target/loongarch/meson.build       |   6 +-
 target/m68k/meson.build            |   6 +-
 target/microblaze/meson.build      |   6 +-
 target/mips/meson.build            |   4 +-
 target/mips/sysemu/meson.build     |   2 +-
 target/mips/tcg/sysemu/meson.build |   2 +-
 target/nios2/meson.build           |   6 +-
 target/openrisc/meson.build        |   6 +-
 target/ppc/meson.build             |  10 +-
 target/riscv/meson.build           |   6 +-
 target/s390x/kvm/meson.build       |   2 +-
 target/s390x/meson.build           |   6 +-
 target/sh4/meson.build             |   6 +-
 target/sparc/meson.build           |   6 +-
 target/tricore/meson.build         |   4 +-
 target/xtensa/meson.build          |   6 +-
 tcg/meson.build                    |   2 +-
 trace/meson.build                  |   2 +-
 ui/meson.build                     |  30 +++---
 119 files changed, 813 insertions(+), 818 deletions(-)

-- 
2.38.1

