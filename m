Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2149758lfb;
        Thu, 29 Apr 2021 16:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgEpQsPNKcxRKPb9K12H0kapU1AXuCfzySzz7vgffjN+5GBOznMQ3YZ8gyNOXe1AhWRxCl
X-Received: by 2002:a05:6638:2505:: with SMTP id v5mr2254005jat.120.1619740072812;
        Thu, 29 Apr 2021 16:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619740072; cv=none;
        d=google.com; s=arc-20160816;
        b=aAo7DiUl1OvW7ivEGkMqF7P9N+0hXHiQocvwiSsZZByIof/TZiF0h6ZxUglL1nNiS1
         1LDGpDlB7bx68D/Zter8iD2tTji5r73KSwoCjZDMl906JBnjpTzi1X9akat0epN8HZkS
         ULicoN6QpLpv4AP6nAKVu7U1pWvOGTB5+nse/nrHvt1ijRZDNzDbOHbojYOWRrJqxCjm
         z7I3T4ipSOTk9BjCkc3y8mhGx6q19qoiMYdTwjaoZu5VMBeHrc3BLWLGAPZx4l6W8SVz
         89U4Mo7zCL10JSIgjN03vP9vt7p02p21QEWU0umgyMbI+VYRtDge4iJQCbufntfUIeDN
         ysUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=iXnWCRl8c0ZbS3V9zipcpge4fyvoK9BQ1ATAi7Ar3c8=;
        b=dW8G7UoEAx77a741d5uY6JJrkFUlTHFCDDj8eoYPBvTNIaESnmT5SG3pZvODqRO164
         EOQGsWY/R4xXF3k2d7ZhzFiOngj/DvuzHt9CAkI9ahPnXCEbyazrF86VAjoN2NZuw5mi
         rDUi3v9bVBNaL3tzunZDADUTd2GsV8dVzpyfJR/w0thzs8mAL/glbG8B6qlsjbEzWLsC
         CmSD2W25igW5iN6b/dMU4MT2LTxPdMLFsQ+94PeaZ74n//xjF3BKwg1KZVdljSuOLYjN
         NK/Zto/aUft7o3BlGFAaq5MU2CD54JMF0V9uqdodKl8FKHNGK/ko942VScYA0O9b70Yu
         888Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pWioEk+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si1398643iop.99.2021.04.29.16.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 16:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pWioEk+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcGNs-0003Ie-49
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 19:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIS-0005h6-FS
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:42:16 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:40786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIH-0004KA-1g
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:42:15 -0400
Received: by mail-qk1-x72c.google.com with SMTP id q136so48077905qka.7
 for <qemu-arm@nongnu.org>; Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXnWCRl8c0ZbS3V9zipcpge4fyvoK9BQ1ATAi7Ar3c8=;
 b=pWioEk+1tpL3rsQ5Fjuhzt4fDbQbJRkC+xo4RoII/nvBKaEIeMVcbY8I1oGfiLzcLg
 YMdhKnX8HW8FGGMBysKDkGEhdwCxptY2TDnb/M12RJ0WUWFfbbF4yIKp+uILkTdsi4zt
 Kl8zyj/dKlX/HOfXGUpZ9fMBXFJtdwZLZH0XE7DjBbXyAS353PQECzovaQWbiHLPvYyC
 sINP6cf/mVp9npdggr7GUb08O43s7E/ZNarA4yXrWxftUEtoxsrDiT6jzBwudidtrxtk
 DmZvZSIu2VyOlk36kQr5hleA5dYjRzFydTlgxSbyHqb8aN3rye4093svjBkJPu/L+AP9
 6PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXnWCRl8c0ZbS3V9zipcpge4fyvoK9BQ1ATAi7Ar3c8=;
 b=CVHCEh+XJUQzlGyaPSj3DblNlGVeADmSw6BLtaYDVvoL8Dkw6i3RN13IJslojV32UV
 J7Fic8kdkxEkhymzKbpjqC+FhS1ktcemfF/uRk70RKsGIyNVpYCBdbtbhQ1FWRbt1eZ2
 VlTnZX8iHQ0tA9Wyl4sOJHov3GPs6xkOcqSiGLHAyl+98/Fs0KYBFTnJfY5nQKTwD7tv
 fkkOXB3Yc+Kgt42/SlEhS9pprWqf+raFLeW/NuXl3tGuW2dyVprhyseJAHY4C0GQvgmG
 jEurdH9oA0tLv/7/WsULgP6ALY4oLwntRIn9qaqVN4WN9pofFIBFXD7m/+ezxTyAJEA1
 St4Q==
X-Gm-Message-State: AOAM531lKJQ7qIwqJH4UO+Q+AgXZe5hB0Fiyuy+ujE174cfumq8ZysIx
 xEV3NM+wZotQoOzjAljhNOlSNQ==
X-Received: by 2002:ae9:ef01:: with SMTP id d1mr2372952qkg.483.1619739722320; 
 Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
Date: Thu, 29 Apr 2021 19:41:53 -0400
Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qk8qZYojImyR

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to sbsa-ref platform as well as
virt platform,wherein the emulated functionality co-exists with kvm
kernel functionality.

Changes in v3:
 - review comments addressed

Shashi Mallela (8):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  hw/arm/sbsa-ref: add ITS support in SBSA GIC
  hw/arm/virt: add ITS support in virt GIC

 hw/arm/sbsa-ref.c                      |   26 +-
 hw/arm/virt.c                          |   27 +-
 hw/intc/arm_gicv3.c                    |    6 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |   20 +-
 hw/intc/arm_gicv3_dist.c               |   21 +-
 hw/intc/arm_gicv3_its.c                | 1247 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   11 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  163 +++-
 hw/intc/gicv3_internal.h               |  186 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |    6 +
 include/hw/intc/arm_gicv3_its_common.h |   40 +-
 target/arm/kvm_arm.h                   |    4 +-
 16 files changed, 1738 insertions(+), 37 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

--
2.27.0
