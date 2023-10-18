Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4668521ejc;
        Wed, 18 Oct 2023 07:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwqbmsdI9MFrq11tfBmLsV0M54ZLwABqi1nWbwbbp4GOYF2RrU8ZhiZq+JpTErFcF2odwk
X-Received: by 2002:a05:6214:c62:b0:66c:fcfc:9174 with SMTP id t2-20020a0562140c6200b0066cfcfc9174mr6301887qvj.41.1697638367719;
        Wed, 18 Oct 2023 07:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697638367; cv=none;
        d=google.com; s=arc-20160816;
        b=n7fDKHJknvA+tS1cuUaqrb7ndqLcEsoxnEtADHdmwwfxozXQau3XR5VK4rqa6bOF1Q
         8plrb1RveAF9N4fHcPUbd6zJczgb+8CnbRdUxKjuXpQWAS4N6qK+tyPIZwsOncvFTZXK
         PYICYGrVAcEY4iA4n0lNFJzAVTRDI1duSr8EMb3iQtWq96fR3SB7W6KYikmMv1Fkkfbv
         SQhJF6UgAtmjl4BToxEIbSitAQjpHIXWn7xQoY87IXY5iJ541xeSz5ZxlbUziTqP8HIx
         kpJ6ak7KB13UpmNgwM3bvuRJwKHd5OIDukeq4EtTdQOhCpl1uFFJb3e66x/9Cz9BowSV
         O5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=rdrrCecaS7boB6xf2s60//LTwDBNeqBEOJ0/YhcfJ5Q=;
        fh=ANIikQnX6ADG7FYuHYnQUKFZKV9+VnxLLzGv0RFOlfg=;
        b=FjG8YFDVfZz79p0PLSSfG4iJzubkCi1LD+SALpvLr7px096TfJ97HNbz75A2phb/Lq
         Pu8fSvCRosoZ9dSZI2C/wjEEX/sOCIP/HZzP5QzKuA8+EPXPKxcGFcEmcIfbURQTGWxs
         Blfpqx6ZiVcIWwPKJKM/o4HBT1VVlOi1NjlsriOjeislTRlahyXczfRLmM6v5t3JrLjC
         zq23zb22LOJCVVoCi7VCiRxrasYSRth3xL5NBlpyOAMlgX1/F9QDS8YArO90IO3bcpSO
         rtOObcggA3VeFkVCjzvFZ9M9WnPo5R5l0WB93qcCGKIt6g1/3enuiMVud1y1ht80t+yr
         o6DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bc55sAcy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a0ce9ca000000b0066d20f29e5asi2691273qvo.100.2023.10.18.07.12.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 07:12:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bc55sAcy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt7Hb-0006ZP-RF; Wed, 18 Oct 2023 10:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7HE-0006KQ-U4
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:06 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7HC-0004l8-CG
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:00 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso1120416166b.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638316; x=1698243116; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rdrrCecaS7boB6xf2s60//LTwDBNeqBEOJ0/YhcfJ5Q=;
 b=bc55sAcyHN+VTrjyis1Os3lSJXSEIUOQBzwvgWfd9fHuekyUU0qrrMt4OOA2kgOgFq
 TqKxYcAA+OOk02pk9BYuMHNjI76Unslx8QKqqUn8twZTPmH5Mb5bDCS+uHMqCoZXOQ+E
 o+g9eIp5bfK0J++GWxKObyh/ck6pXmK3XppU+Z4ExQIgLrCALqsRYZqGR08pfnkHfJRr
 6ZH/II0tTYt9PYp4IGb80fn/G+Rr1VdXQpojZRetbg936VQc/bUlqBhewBNSL2zBBNXG
 4tuky38fyS5l8NeZK14ribZ3unhhU/7o5GaRd6hQDH1f9IMFTXz4izyzYagIpzgT12Xp
 9dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638316; x=1698243116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rdrrCecaS7boB6xf2s60//LTwDBNeqBEOJ0/YhcfJ5Q=;
 b=VK83fqPtWfNq63kszNI0WEygIvOsz2B0kb+xHhjw+Gl2Ai/te2hZI4q4b6CcNCvWUb
 mz3rXe4JfsLsfEynT7QW3lJtBiZKdOMAstlphyKNzeOKr8fSg7nJSw47ZcsXipFA+wGH
 7Y233asDjVFcGkmTcRMM9gFSCuOcAxdOqz/pXlOiwSxNtJvATfG6KUmqAkOqtQg9ajGn
 KpfEQwCk1wM9QU5W9PijAaI8howM/MWxR7zsFpYalcnt5tRC5tWb5Ex90uXYkFMgIesL
 7Ho0cMigV9DeEUQ0219yEK5rgMpVy9SsvsulHiUI5w1TVPIlCzTab4T0QauHv0ZtoEDs
 c/zg==
X-Gm-Message-State: AOJu0YyiCHsnY5bB81lR2WpE5A5pkB4hZZcmcwYXcQ5+oQDz4jcLRNvb
 AYKWroWQyAphWcthpPtSc7Xvqw==
X-Received: by 2002:a17:907:97c3:b0:9c5:8a6b:29e with SMTP id
 js3-20020a17090797c300b009c58a6b029emr4392025ejc.13.1697638316266; 
 Wed, 18 Oct 2023 07:11:56 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 jt24-20020a170906dfd800b009b9977867fbsm1747995ejc.109.2023.10.18.07.11.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 07:11:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 00/12] hw: Strengthen SysBus & QBus API
Date: Wed, 18 Oct 2023 16:11:38 +0200
Message-ID: <20231018141151.87466-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: SfG39MDBAljy

Hi,

This series ensure:

- qbus_new() and sysbus_init_mmio() are called *before*
  a device is realized,
- sysbus_mmio_map() is called *after* it is realized.

First we fix some abuse, then we enforce in qdev/sysbus
core code.

Philippe Mathieu-Daudé (12):
  hw/i386/amd_iommu: Do not use SysBus API to map local MMIO region
  hw/i386/intel_iommu: Do not use SysBus API to map local MMIO region
  hw/misc/allwinner-dramc: Move sysbus_mmio_map call from init ->
    realize
  hw/misc/allwinner-dramc: Do not use SysBus API to map local MMIO
    region
  hw/pci-host/bonito: Do not use SysBus API to map local MMIO region
  hw/acpi: Realize ACPI_GED sysbus device before accessing it
  hw/arm/virt: Realize ARM_GICV2M sysbus device before accessing it
  hw/isa: Realize ISA BUS sysbus device before accessing it
  hw/s390x/css-bridge: Realize sysbus device before accessing it
  hw/qdev: Ensure parent device is not realized before adding bus
  hw/sysbus: Ensure device is not realized before adding MMIO region
  hw/sysbus: Ensure device is realized before mapping it

 hw/arm/virt.c                 |  5 ++---
 hw/core/bus.c                 |  7 +++++++
 hw/core/sysbus.c              | 13 +++++++++++++
 hw/i386/amd_iommu.c           |  5 ++---
 hw/i386/intel_iommu.c         |  5 ++---
 hw/i386/microvm.c             |  2 +-
 hw/isa/isa-bus.c              | 11 +++++++++--
 hw/loongarch/virt.c           |  2 +-
 hw/misc/allwinner-r40-dramc.c | 20 +++++++++-----------
 hw/pci-host/bonito.c          | 29 ++++++++++++++---------------
 hw/s390x/css-bridge.c         |  7 +++----
 11 files changed, 63 insertions(+), 43 deletions(-)

-- 
2.41.0

