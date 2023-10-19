Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp324940ejb;
        Thu, 19 Oct 2023 00:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcIsysB+JyJ14bxrdm+68ztXq8yvjeIe1X5kwbf3zWAThYVXiRQR4UcMJsA/g5+ZY22/lm
X-Received: by 2002:a05:622a:118f:b0:41c:bbf3:b24b with SMTP id m15-20020a05622a118f00b0041cbbf3b24bmr1933750qtk.27.1697699820020;
        Thu, 19 Oct 2023 00:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699820; cv=none;
        d=google.com; s=arc-20160816;
        b=NSwGM1DY0FW1/6sdG402Qgf6u07mDp5vmnsYSaK9ZhVqRdfxj1d0YWb6vT4sWl0agp
         XaZw90C4NQfs4p/tiiIlzvgIsh0u9ONBXyiutLz3m8WxXFsGLvOGt8Uj6AHtbX96VqnQ
         easymuU4hUXxuA377E4jLxHovT7MhZmD+mMdN5xxc+rj3QyTujiooiXYeaUuRN6QqoDF
         rndYGayuAd8WhJynINHYwueehbwEkq/fe3FJY3q9edsg0WvJSivgscI/FW5dbLGCdl2A
         Ds7+ok7dPF2VvhOWOnGLFSd6YfxRY23uMVCAz6PxdxIv/0MqJLDqTsjcg0+q/+Ofm8rw
         MEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+EoZC8QJYohplZssBUca1igR4l0fxuTHI687dh8zUaA=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=pVPzyGf4+ZO2w999mOh1i7LFK8Pk2N3JCxu/hKJyhIPIKxkHEenHvk/WqquTH3D0MV
         NLMKwJFo7l+ag5gdjZ6r+5NJqg7Wfyeeo5UPPIf2yessTYiq1Pzjd7Of81h3N2tLgfnK
         SoLH+kQ/xi9Vc7NSWszmb/xu53xdS21LKgYY11e4kdGoyddf8qN4CXTcq2oziSL1GBeQ
         yucmoQy/vm4xa8BapfiUWacZWE+4TpH/eq9OSlXHLVZQBeN/wTL4BLHtq71YHuw41g1C
         x3gxIY0yf+a47mLvL81PL9g+/S/qH6WEsNgI1EK/UYE3TNoyWIjkOH/im+3jWZASTptA
         V6KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzjFG+hA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a05622a118300b00413150183dbsi1134044qtk.737.2023.10.19.00.16.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzjFG+hA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNGf-0004oY-1l; Thu, 19 Oct 2023 03:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNGa-0004nP-Tg
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNGX-00038g-BV
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40838915cecso15716855e9.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699778; x=1698304578; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+EoZC8QJYohplZssBUca1igR4l0fxuTHI687dh8zUaA=;
 b=nzjFG+hA/e77ESZnnCjeiEBKAItftXlWew6k/3xW8BoBAO+pN6ApLbAHY2Zl58V5nW
 yaxOnG3vKnoZ1LqiRSTx5hi2iW5Xojof+p/35NvL7vFQfOKPb4mOiOkQAZ5MjMIs5vIO
 rIvECmMus9y/EJ0IoKr1FtvDB0fqCGcPnuYwdPya8GvVuIiBG+9etvBeWGXLaAK7vZT2
 gsXzLfeRzEjhw+c0iRiMq6mi7Uw7/OlJA7avd3pcaJZrF6YDd2mTr6k2NAfuzBpMumdZ
 yd7r4wJW2/XElbfLleYVMPwrAtGDDRd8Ae+nUAcCCZWCbB5blFemoHmX0zGkx0ceIZat
 X/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699778; x=1698304578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+EoZC8QJYohplZssBUca1igR4l0fxuTHI687dh8zUaA=;
 b=CTkDPIq1K8N3lualeynuIe+MB09zbp4yQqF0ucCGx2H8H5YF4hB6C8e2Av2t+2ynC2
 TIHcamLelulCKzOqFOxFybZu8XJWi13icP1HEfWbdxHdTxUDvd/zYXbJuQv9oSePYs3O
 g+2d4SubJNi0bSeOSCDvi9N24A6bU93/zNikCKO9nB2ACSe9iaY33ioynFw36aSee/Km
 /Zj6+Xsc2zPE4J65YVSpfr48/iSoDPzgaF7P/gEV70b4sXinDKDpMfBM/B0UD54G8IrL
 YmO33zuWwR5ClouWabasWsWTxb3Ic+MkQeC1wtuwaWOVRbhKaqqL646GswVM3T+nKSfy
 t4fA==
X-Gm-Message-State: AOJu0Yxr2bd4Iiptq6YwQzlnHM88bvni2MCIym76Ox7MLux9mk/jr6sV
 puvtPN+aANbat0xgn54vojLNeA==
X-Received: by 2002:adf:e8ca:0:b0:32d:9395:dec6 with SMTP id
 k10-20020adfe8ca000000b0032d9395dec6mr915133wrn.67.1697699778520; 
 Thu, 19 Oct 2023 00:16:18 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b0032dc24ae625sm3763417wrt.12.2023.10.19.00.16.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:16:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 00/12] hw: Strengthen SysBus & QBus API
Date: Thu, 19 Oct 2023 09:15:58 +0200
Message-ID: <20231019071611.98885-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: alDZ/vGse3EP

Hi,

This series ensure:

- qbus_new() and sysbus_init_mmio() are called *before*
  a device is realized,
- sysbus_mmio_map() is called *after* it is realized.

First we fix some abuse, then we enforce in qdev/sysbus
core code.

There is still a failure in PXA2xx:

  qemu-system-aarch64: sysbus_init_mmio(type:pxa2xx_pic) but object is realized

Apparently it cames from commit 3f6c925f37 ("Use i2c_slave_init() to
allocate the PXA (dummy) I2C slave"), which I presume was how to model
slave<->master transactions *before* I2C bus modelling.

Based-on: <20231018133059.85765-1-philmd@linaro.org>
          "hw/ppc: SysBus simplifications" [1]
Based-on: <20231018131220.84380-1-philmd@linaro.org>
          "hw/arm/pxa2xx: SysBus/QDev fixes" [2]

v1: https://lore.kernel.org/qemu-devel/20231018141151.87466-1-philmd@linaro.org/
[1] https://lore.kernel.org/qemu-devel/20231018133059.85765-1-philmd@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20231018131220.84380-1-philmd@linaro.org/

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
 hw/pci-host/bonito.c          | 32 ++++++++++++++++----------------
 hw/s390x/css-bridge.c         |  7 +++----
 11 files changed, 65 insertions(+), 44 deletions(-)

-- 
2.41.0

