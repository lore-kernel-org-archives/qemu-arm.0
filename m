Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2741351eje;
        Wed, 12 Jul 2023 09:41:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEXzEV7mNB92W6OkzW2MXxmpTHfR1ICpLi0IDPtQCj6dj8B9HP2XwdZAD/A8ZBCzk3WgzMc
X-Received: by 2002:a0c:8c88:0:b0:62f:ffcc:337a with SMTP id p8-20020a0c8c88000000b0062fffcc337amr15634856qvb.25.1689180061522;
        Wed, 12 Jul 2023 09:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689180061; cv=none;
        d=google.com; s=arc-20160816;
        b=XLX69NJgHNWZlgscWHpoL+aaOUiB0Qhem7Z+WyjBfqLPYT+qpzrBXg4SES6sZhwNSQ
         C9VAh7FOzcUv+FXemu33y2FvpovK7q+ZPuoWmlOjtW7swha8WakveuyqtBE3MkuGugYA
         LhgAX7MIbArXagRt8cptRcyf9VVvVH1/E+ydY7U1/uiMeu8Jdn/8iEGtlVP1Xl6FTf3k
         k1goxnPWyu+94UXcDGrV81h85pC6pxRA9M7Qa7P0sV3Ykcc8z0qL0oklTZF+9/KHAbi0
         ZRx2VjEM9U0OCI1DnfEYO5WlpGTdO0kNGgiGlSc2vEdareFAtHGBu+1Y2iFPRyA2JYj3
         z3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=D902WXe63pYmiWsNpDy68C8o3fZwaz3JAmPZ0EGpNog=;
        fh=QsSyH/XJB0d/FRsyBb/wvDqny4l1zc3rGbeONrDGr3Y=;
        b=aK+e0SeHzTX4SeSQoo/pwHKhl8A1+rmXIs3XW0ukx10hQS/agQkGOGMBQ27SfJ4D7a
         62CaJSDL/TkyFQYKren/M7f85LWWhXxeh6EYy2CuJU1UWM8b//RFkLDe8xkqXFRCeWN7
         GnrRgeyEhVw+T8d83LxnPPQn21K+ZAj+fLkIa6/zcup15jkaEGd4kLz22+CHfbvCpZ3A
         qfDq+41vdOuMIVwxZE1/OpO7qD09XeZPgptrWn+Lbj2KM0zCfE4xJG62haivLa3IqMEm
         zljwfSGmfg/siSIjZye/ney6W9L9WLn6QSMlrF42bK5hTMG6uNH6ldi0VUbUPENQF2CE
         x9cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iG4l8FVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020a05620a249100b00767b348d2aasi1916725qkn.79.2023.07.12.09.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 09:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iG4l8FVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJcsj-0003fO-K2; Wed, 12 Jul 2023 12:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsi-0003dl-0p
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:00 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsf-0004aq-Ls
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:39:59 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-666e97fcc60so4999974b3a.3
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689179992; x=1691771992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D902WXe63pYmiWsNpDy68C8o3fZwaz3JAmPZ0EGpNog=;
 b=iG4l8FVPI7oYlI22GP8jHv36gEoDHXFZ0M+pd+3Pn8uEVvRDyVU8jsSVN0GkhVbTID
 J/5vmG8lkxBETX9CGeRS6DuIUBd9CRJxjVh2ShuZWBI36zUqmnaPHQsWTt7tG/B76qoU
 TDBSBLvX82D27K2P6QAfZ0nCPK25sTL825A5pmCiFzBu9BhD/fGWbln8jhE5+pTizRoc
 M8iiQX3LlAr2xg8Qa23SOOuhqYPqbdL7wZGv5s23yxXVbUyV5IqTz7/jdL/NPB333gEY
 jao4LeiBHOYCl9/LWBRuw/jszwa+VRs8ppDZzhYo+S9SE/KKtMS/WFYf/25tFxMFX21V
 6h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689179992; x=1691771992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D902WXe63pYmiWsNpDy68C8o3fZwaz3JAmPZ0EGpNog=;
 b=MW4LBhLyMFcCzK/PsLGr12WyjKitAbLtNC8F31a3KwN0AZEJqQM/+sIpN1dO0wvYr7
 s6vFIp8lJUpD+nmZb+qDEhC3n9g34/XQLxV/uzpJ46GA3/wdczqFYMjiro1fJB3tngiF
 k0NKVBOQLiVgcjXy44cHmCBt9OzEoJdJ79zwrzcabPlgdUADjXqjRIYfs8Feiei4Y5ty
 CZ9ulejHJDzcvImAFBAP/Sj7tbQrpZNelGC0uJrBW2ZBQU7kEPA09h7lmI7mDodFCgjA
 cKJBeSOqa7KD+6HidW2yV+ec8+Co0Qyn9urolcQOhX1QIONXb7hKYgoOHRvw+2IHgWB4
 xlOQ==
X-Gm-Message-State: ABy/qLZWamLbXNLir9ItzSRULffvRR+PrvuSnu8yJLaBgliE7WxOGTMl
 +/ZkT+uvUSSQOPieBCjRGfA/sA==
X-Received: by 2002:a17:902:c3cc:b0:1b8:9f6a:39de with SMTP id
 j12-20020a170902c3cc00b001b89f6a39demr14219298plj.65.1689179991519; 
 Wed, 12 Jul 2023 09:39:51 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:39:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 00/10] RISC-V: ACPI: Enable AIA and update RHC
Date: Wed, 12 Jul 2023 22:09:33 +0530
Message-Id: <20230712163943.98994-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
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
X-TUID: Y4cb7Uc4MlV0

This series primarily enables AIA interrupt controllers in
ACPI tables for RISC-V virt platform. It also updates RHCT
with CMO and MMU related information.

Below ECRs for these changes are approved by ASWG and will be
available in next ACPI spec release.

1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

First patch in this series is to migrate a couple of functions from
ARM architecture to common code so that RISC-V doesn't need to
duplicate the same.

The patch set is based on Alistair's riscv-to-apply.next branch.

These changes are also available in  riscv_acpi_b2_v1 branch at:
https://github.com/vlsunil/qemu/

Sunil V L (10):
  hw/arm/virt-acpi-build.c: Move fw_cfg and virtio to common location
  hw/riscv: virt: Add PCI bus reference in RISCVVirtState
  hw/riscv: virt: Make few IMSIC macros and functions public
  hw/riscv: virt: Add PCIe HIGHMEM in memmap
  hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
  hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
  hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
  hw/riscv/virt-acpi-build.c: Add CMO information in RHCT
  hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
  hw/riscv/virt-acpi-build.c: Add IO controllers and devices

 hw/acpi/aml-build.c         |  41 +++++
 hw/arm/virt-acpi-build.c    |  42 -----
 hw/riscv/Kconfig            |   1 +
 hw/riscv/virt-acpi-build.c  | 321 +++++++++++++++++++++++++++++++++---
 hw/riscv/virt.c             |  62 ++++---
 include/hw/acpi/aml-build.h |   6 +
 include/hw/riscv/virt.h     |  35 +++-
 7 files changed, 416 insertions(+), 92 deletions(-)

-- 
2.39.2

