Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2173381ejb;
        Wed, 21 Feb 2024 13:18:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxfFPgMBUGdDSl1VMRBs3mDAZhMZKGhIPGjVnU/J3J+HZdHBgBgB6vI9MEajzOueAgb4Gdno73zbL/lCBA/BBjj9EW/fJb
X-Google-Smtp-Source: AGHT+IF0OGYb/l/N1J29w1nBiGfJ9VGe78u1mNlKlKXi1R0az6Wa117cflh21RBAV9lHG0MNk0kH
X-Received: by 2002:a05:6808:180d:b0:3c1:4d9e:75cb with SMTP id bh13-20020a056808180d00b003c14d9e75cbmr15883527oib.45.1708550290935;
        Wed, 21 Feb 2024 13:18:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550290; cv=none;
        d=google.com; s=arc-20160816;
        b=B/upyhfzBjg5PxjFgLYdOEb5q2jJBgQi9OenvNwqePzox7wakP51BU7PEhK8Om8IQR
         GcgiFQZTWuOMzEnjYFnEWtf+O+gHdDobuA1VNioMBmegRVu8Jhox0cdnz+t6+H2tq/rj
         arDGtw659E5hY941Eq41oxLluXQS82V4Fh7Jfeldlzv6HcfQMePG6I0sTAJn+Cz+tOQy
         BDTZngS+D5LNlAlqivj2mL7RFOtEcXVQ9YQAWlyGMO4Zw8xQIrZuGY49CzNZYl1qRIPA
         H2LWyRzUlxQsTqOc/xTz2aO9u8dPslqYA3BYOkAK6pXrkn7S48LI6VxjYewcuX0Nl8MJ
         b9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p7UW6IclJd8hCDh0KBzCCTcSNX/nbCbUmPbqAU8gk48=;
        fh=mj1wQZ3bCyc7JCc8OC9xV+kNymToV2ebAdjioKsqLOU=;
        b=jUIRqTiNnIr6MBKSqQRLpgWNDKqniLvV6H9oro0Dhx2A4vlajQ+AhCDK2dScWE3Jr6
         uEOoasuvHB3u8PEmNxL45bvb+VUHCkowFW5gcJGOh69+WBKigVeRJ1f54iWPDLP0NsWe
         N1h8S2ZHDLWTz5Xgf3dUHLeM0RAREVZOovlDOsgpXKC/VVOjlT8euRYoSolOT5n9PhSq
         aiCkRLb1FEVQcvu3QIxRnEqqO8MjSxjF6AnvnGkpaU8YBWlyEcpw3yoB/tkcpjM3wRna
         AmaCZ92KxPU3pi3yYy5kgj6/cV3Xd+hnVKBEkF6I48MR8E7A9fU8ROCeQZwuAnUPXpN6
         zpAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iO5+laCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke7-20020a056214300700b0068f0f1b978esi11872668qvb.119.2024.02.21.13.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:18:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iO5+laCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctyS-0003gs-7K; Wed, 21 Feb 2024 16:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctyH-0003Q7-4y
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:17:45 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctyB-0000x5-6a
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:17:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d7afd1ee0so763759f8f.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550253; x=1709155053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7UW6IclJd8hCDh0KBzCCTcSNX/nbCbUmPbqAU8gk48=;
 b=iO5+laCe/BzjgnN4mTi+mKmUfRreG0qD+giLineW/3qeNEDkdgSmiJgDCczwSmvOMH
 3hnoMCxZ2Kkgp9iD2iupgGUgDciJTsJulXRA/PQ+aaujBAQdG612Gyw8yRov7NDhVmUx
 Kc5KXr9o2piiTgnKCKre1hV1JNado4l6HieF2MCPpODEIKJde4RRAeyGDa23nFKhKiP8
 27r/m8V2cZYh1K7+RwIbQI1cLIjfIT0NNvdwP/egPcPrnA/48U1MaU0MJKX08malOWpu
 7WUw/PVgp9sDtIHKgRvMlvYB/Wk3RlQzVsr0+0Xf6ttWvklABq2VAXe8K0pot0Wowsz7
 t2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550253; x=1709155053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7UW6IclJd8hCDh0KBzCCTcSNX/nbCbUmPbqAU8gk48=;
 b=Po7j2bGM8TVxNW3uJkmF+ZpqcECwwXTgH94rMO7qLqpI7iOpoAf9mPstWkRvScHuOs
 FFKxtgvMrknlH+sXrSCBfsXS0tmhxVlucWyPCxYkiYRq3w6dHkqvdiWDM8X8rD6c2nTu
 5A3U4zIfim2G1cF9tKERVZ+UbjASr6reM6smngIXwUaTj+m4oVLZSLcDa/94HeHS2EG9
 u91OcWFkcuVSJ0tRRpJ6z6Ue4iDLL/iMyRkisQNMdhp48XOI4QwKy+opyuriK3bAjcN0
 6MrCYWu6ikkYZBrMI+9YIqtP+V02X4q1+MYxyfDT+qH/kUv6ea2de9ycufiZNPxgWrFi
 bEUg==
X-Gm-Message-State: AOJu0Yw5ZWyougD4DD0SxHRJsyS6nqahDp0PgCLbguDXXBZnDd237cJB
 BSWzABozCFyIFl081G6NeuuDWZa54vys3xMiSDmiddFpILR9CD9IbiaHddA9dko=
X-Received: by 2002:a05:6000:1f89:b0:33d:4bc3:e786 with SMTP id
 bw9-20020a0560001f8900b0033d4bc3e786mr9252589wrb.23.1708550253362; 
 Wed, 21 Feb 2024 13:17:33 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 bs20-20020a056000071400b0033d449f5f65sm12675816wrb.4.2024.02.21.13.17.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:17:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 06/25] hw/ppc/ppc440_pcix: Move ppc440_pcix.c to hw/pci-host/
Date: Wed, 21 Feb 2024 22:16:06 +0100
Message-ID: <20240221211626.48190-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: LaWf0VYx1i+1

ppc440_pcix.c is moved from the target specific ppc_ss[] meson
source set to pci_ss[] which is common to all targets: the
object is built once.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240215105017.57748-5-philmd@linaro.org>
---
 MAINTAINERS                        | 2 +-
 hw/{ppc => pci-host}/ppc440_pcix.c | 0
 hw/pci-host/Kconfig                | 4 ++++
 hw/pci-host/meson.build            | 1 +
 hw/pci-host/trace-events           | 8 ++++++++
 hw/ppc/Kconfig                     | 1 +
 hw/ppc/meson.build                 | 2 +-
 hw/ppc/trace-events                | 8 --------
 8 files changed, 16 insertions(+), 10 deletions(-)
 rename hw/{ppc => pci-host}/ppc440_pcix.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d9ccd5073..5535df4487 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1556,7 +1556,7 @@ L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/sam460ex.c
 F: hw/ppc/ppc440_uc.c
-F: hw/ppc/ppc440_pcix.c
+F: hw/pci-host/ppc440_pcix.c
 F: hw/display/sm501*
 F: hw/ide/sii3112.c
 F: hw/rtc/m41t80.c
diff --git a/hw/ppc/ppc440_pcix.c b/hw/pci-host/ppc440_pcix.c
similarity index 100%
rename from hw/ppc/ppc440_pcix.c
rename to hw/pci-host/ppc440_pcix.c
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 0a221e719e..c91880b237 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -10,6 +10,10 @@ config PPC4XX_PCI
     bool
     select PCI
 
+config PPC440_PCIX
+    bool
+    select PCI
+
 config RAVEN_PCI
     bool
     select PCI
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index eb6dc71c88..3001e93a43 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -15,6 +15,7 @@ pci_ss.add(when: 'CONFIG_SH_PCI', if_true: files('sh_pci.c'))
 
 # PPC devices
 pci_ss.add(when: 'CONFIG_PPC4XX_PCI', if_true: files('ppc4xx_pci.c'))
+pci_ss.add(when: 'CONFIG_PPC440_PCIX', if_true: files('ppc440_pcix.c'))
 pci_ss.add(when: 'CONFIG_RAVEN_PCI', if_true: files('raven.c'))
 pci_ss.add(when: 'CONFIG_GRACKLE_PCI', if_true: files('grackle.c'))
 # NewWorld PowerMac
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index 90a37ebff0..0a816b9aa1 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -41,6 +41,14 @@ unin_read(uint64_t addr, uint64_t value) "addr=0x%" PRIx64 " val=0x%"PRIx64
 ppc4xx_pci_map_irq(int32_t devfn, int irq_num, int slot) "devfn 0x%x irq %d -> %d"
 ppc4xx_pci_set_irq(int irq_num) "PCI irq %d"
 
+# ppc440_pcix.c
+ppc440_pcix_map_irq(int32_t devfn, int irq_num, int slot) "devfn 0x%x irq %d -> %d"
+ppc440_pcix_set_irq(int irq_num) "PCI irq %d"
+ppc440_pcix_update_pim(int idx, uint64_t size, uint64_t la) "Added window %d of size=0x%" PRIx64 " to CPU=0x%" PRIx64
+ppc440_pcix_update_pom(int idx, uint32_t size, uint64_t la, uint64_t pcia) "Added window %d of size=0x%x from CPU=0x%" PRIx64 " to PCI=0x%" PRIx64
+ppc440_pcix_reg_read(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
+ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr 0x%" PRIx64 " = 0x%" PRIx32 " size 0x%" PRIx32
+
 # pnv_phb4.c
 pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64
 pnv_phb4_xive_notify_ic(uint64_t addr, uint64_t data) "addr=@0x%"PRIx64" data=0x%"PRIx64
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 82e847d22c..99d571fa20 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -46,6 +46,7 @@ config PPC440
     imply TEST_DEVICES
     imply E1000_PCI
     select PCI_EXPRESS
+    select PPC440_PCIX
     select PPC4XX
     select SERIAL
     select FDT_PPC
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index d0efc0aba5..da14fccce5 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -60,7 +60,7 @@ ppc_ss.add(when: 'CONFIG_PPC405', if_true: files(
   'ppc405_uc.c'))
 ppc_ss.add(when: 'CONFIG_PPC440', if_true: files(
   'ppc440_bamboo.c',
-  'ppc440_pcix.c', 'ppc440_uc.c'))
+  'ppc440_uc.c'))
 ppc_ss.add(when: 'CONFIG_PPC4XX', if_true: files(
   'ppc4xx_devs.c',
   'ppc4xx_sdram.c'))
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index b59fbf340f..157ea756e9 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -146,14 +146,6 @@ rs6000mc_size_read(uint32_t addr, uint32_t val) "read addr=0x%x val=0x%x"
 rs6000mc_size_write(uint32_t addr, uint32_t val) "write addr=0x%x val=0x%x"
 rs6000mc_parity_read(uint32_t addr, uint32_t val) "read addr=0x%x val=0x%x"
 
-# ppc440_pcix.c
-ppc440_pcix_map_irq(int32_t devfn, int irq_num, int slot) "devfn 0x%x irq %d -> %d"
-ppc440_pcix_set_irq(int irq_num) "PCI irq %d"
-ppc440_pcix_update_pim(int idx, uint64_t size, uint64_t la) "Added window %d of size=0x%" PRIx64 " to CPU=0x%" PRIx64
-ppc440_pcix_update_pom(int idx, uint32_t size, uint64_t la, uint64_t pcia) "Added window %d of size=0x%x from CPU=0x%" PRIx64 " to PCI=0x%" PRIx64
-ppc440_pcix_reg_read(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
-ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr 0x%" PRIx64 " = 0x%" PRIx32 " size 0x%" PRIx32
-
 # ppc405_boards.c
 opba_readb(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
 opba_writeb(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " = 0x%" PRIx64
-- 
2.41.0

