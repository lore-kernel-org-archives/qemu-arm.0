Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2113875ejc;
        Mon, 9 Jan 2023 01:32:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtSBqfHhQxeRCj6ZdioaHfY/U+yMZ6UM33LMjwtjwhzHmLuwRnQwr+BMvHiBl6EvEcQlqBT
X-Received: by 2002:ac8:5197:0:b0:3ac:940c:6a6c with SMTP id c23-20020ac85197000000b003ac940c6a6cmr6422070qtn.34.1673256765080;
        Mon, 09 Jan 2023 01:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256765; cv=none;
        d=google.com; s=arc-20160816;
        b=g+AWMW6PlKxFFjd2Qr7a6NN5CacJ2iBpUT2LXBu09AXQ1Z9kXIoW0EPETBjpfV2UlJ
         lWJmS3oep14Opi3Uu0vYv9bWnQuhq86aCWjm4ZwgfzOioglIAMMqGCglmmd+ae8hXdaL
         FMvGnc/yERIfIVMZSeWX4Bj1ns7mAiBp0Q9J5ZbXMO4Zfl6GM7PGTXrypPg/ac/FfP4P
         r9FUNUH47PeGNfQyXHSxHsZ2iLDEG0luSnag5q7Fch+Zl1raYliElfLoCm+AXjqMEZgL
         /2TTVSHcQx1at3G/d05pb05OPsibu8NZ772jsyomJp55GDjilIDmKFPTONJDsL1/rUPR
         E0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=C4lODMUw+lyok56lujGJxoUDao4pczQAdswQ0O0cpMg=;
        b=TQmZwRwbl7WCz+1X4iaIKadZgYV963/Se0Dv+te35cRM/O+JrgyNrhYBwqtsJRyhjx
         CBpr/B+mlRh5n3X0f7RFb95ojoDM5f9I/0PCf4gdvK2a+a/CNtFR5Xj7xoB6DVGPogiS
         8c4HLRTzY5MrXthhscxBVwkqK1KBcmXPvBjPvLdjL9Bfo8xyoIFFarEOH8pKpSgO+26K
         dOEAjtEOAqzOCyr1Bm7GSPqDKVBE7mz/9OSVcgua3W+nBNKoj14+nzTh/dZ221dLxF76
         j8S3RBw2S8Xo1Tfs+83OuWmeO3sXs9N75GFuGAy7Pjo6trq3ULkDnTJEB4RPckbZIqaV
         bX1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVaG40X9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020ac84d04000000b003a828a4c4bbsi4101934qtv.269.2023.01.09.01.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:32:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVaG40X9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoQG-0003rS-Ap; Mon, 09 Jan 2023 04:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQA-0003qe-EF
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:26:22 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQ8-0005PH-So
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:26:22 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6095042wms.4
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C4lODMUw+lyok56lujGJxoUDao4pczQAdswQ0O0cpMg=;
 b=oVaG40X9uyUOx9UUHZBCdaeCM60vWva8ltHNIrb56BBxPg7i+UHcg5FKI4rtoMmPXF
 RszLmhvvCIuGPE5iYcHNceYLJjxM2pNophquikiBYImDuir2dymRUVD6vVVuP6Humu1c
 sP2SJuIBTwTqH1oQkv8Ds1zL1Mk0bxyXXk87I40ietdugNtdB8++0F25RQc+03mGE5cX
 bwaun/TjHDZuyBPAHeSv8sBTdLBN3wHjs9Z21fEaeMb1rx0DYZ1vK4myRmBuaHa6/onO
 dK582rHo0weYqgZYSsVoPjf35GiobTiwDzi8NNcvF4G7qbm+1zpmuJ5cFrRC+xmvojcU
 qSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C4lODMUw+lyok56lujGJxoUDao4pczQAdswQ0O0cpMg=;
 b=4ssLhg3Q5kLoUhCG+8p+MaXWeNScgOD0MibsXqhOjokV1NltRYRETLhJc5lf8fVPBF
 /RpakLJftXEuAJnmw8L8pvXctds4JfS3PVNHU/VkmT4Jrfqas/UIKHQMKhN8Lq/K/7xL
 dSNM5s+MDsd7a+qa5UVBO7pJSFdQN+QFNpRPrtAq0S+bVevv1dfCZzde69wTx+4g+GTC
 tvyKdATtJyBmIarlSB1hz1mB33qKv4LqBmnIQY/DhciHUy45b/bRchzyC1X7Dp1TfvKj
 1Yx2rEMF2X9PJAccZE3xB12v2k0d2tMdqlGmNgCvr38Peeb4o8Idsj0CSMoR2EdxXKNN
 arnQ==
X-Gm-Message-State: AFqh2kpPRVYv83+YMRKvMjT9Ekcd3eS6RM3bP7IDmRJmhZN4wq4SkXAV
 FaIU0RrGRdNoVR62OtV++RHVhw==
X-Received: by 2002:a05:600c:3b2a:b0:3d9:f42c:56d0 with SMTP id
 m42-20020a05600c3b2a00b003d9f42c56d0mr678594wms.16.1673256379435; 
 Mon, 09 Jan 2023 01:26:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003cffd3c3d6csm11493507wmq.12.2023.01.09.01.26.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] hw: Convert simple devices from SysBus to QDev
Date: Mon,  9 Jan 2023 10:26:08 +0100
Message-Id: <20230109092617.80224-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: 0GjfSZYS4Mc9

Various simple devices (usually GPIO related) don't access
the 'system bus': no IRQ lines / memory regions exposed via
the SysBus API, no memory region mapped.

To reduce complexity, remove the sysbus onion layer from
these devices.

Introduce the qdev_create_simple() helper similar to the
pattern used for other device creation helpers:

 $ git grep _create_simple include/
 include/hw/i2c/i2c.h:175:I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
 include/hw/isa/isa.h:86:ISADevice *isa_create_simple(ISABus *bus, const char *name);
 include/hw/misc/led.h:93:LEDState *led_create_simple(Object *parentobj,
 include/hw/pci/pci.h:735:PCIDevice *pci_create_simple_multifunction(PCIBus *bus, int devfn,
 include/hw/pci/pci.h:738:PCIDevice *pci_create_simple(PCIBus *bus, int devfn, const char *name);
 include/hw/sysbus.h:100:static inline DeviceState *sysbus_create_simple(const char *name,
 include/hw/usb.h:505:USBDevice *usb_create_simple(USBBus *bus, const char *name);

Based-on: <20230109084121.72138-1-philmd@linaro.org>
          "hw/i2c/bitbang_i2c: Housekeeping"

Philippe Mathieu-Daudé (9):
  hw/arm/musicpal: Remove unused dummy MemoryRegion
  qdev: Add qdev_create_simple() helper
  hw/i2c/bitbang_i2c: Convert TYPE_GPIO_I2C from SysBus to QDev
  hw/arm/tosa: Convert TYPE_TOSA_MISC_GPIO from SysBus to QDev
  hw/arm/palm: Convert TYPE_PALM_MISC_GPIO from SysBus to QDev
  hw/arm/musicpal: Convert TYPE_MUSICPAL_KEY from SysBus to QDev
  hw/arm/spitz: Convert TYPE_SPITZ_KEYBOARD from SysBus to QDev
  hw/arm/tosa: Convert TYPE_SPITZ_MISC_GPIO from SysBus to QDev
  hw/i386/kvm: Convert TYPE_KVM_CLOCK from SysBus to QDev

 hw/arm/musicpal.c      | 12 ++++--------
 hw/arm/palm.c          |  9 ++-------
 hw/arm/spitz.c         | 18 ++++++++++++------
 hw/arm/tosa.c          |  9 ++-------
 hw/core/qdev.c         |  9 +++++++++
 hw/i2c/bitbang_i2c.c   |  5 ++---
 hw/i386/kvm/clock.c    |  6 +++---
 include/hw/qdev-core.h | 11 +++++++++++
 8 files changed, 45 insertions(+), 34 deletions(-)

-- 
2.38.1

