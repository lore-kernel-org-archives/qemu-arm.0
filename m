Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp359565lfg;
        Thu, 1 Apr 2021 03:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyqqBpyD9ZCWiHa6x8ukaWrFVbErFT6x9JKVLofyp4r0xWY1UFTgFNoQB2jjYsZinae1a1
X-Received: by 2002:a05:6e02:1561:: with SMTP id k1mr6149788ilu.254.1617273687842;
        Thu, 01 Apr 2021 03:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617273687; cv=none;
        d=google.com; s=arc-20160816;
        b=gyC6NbxrzpJ447OykdKPtP3pDIWIYFeabnfHwc6btF1uED8YB501iDRmiAN/vELPum
         TZa81OhBMBntglSz+tOWa33gHwj78KDSi26y+j7UrfNka0a1IHvFeKqVuLh/ZQOnmldM
         KSdZErYQAWPcim+YOHnzXCc3cuz5wKh8/BiKf2NTkVBp0EI7cTrMDUhYr1e6YVmPz9Yc
         jOfuJZH4Sz8MrIoglGrsZ2K0TA+yVs5e7MVtCSwb9XtNZAzdfm//b/1nrU96jm5jUKTK
         Uyn1WGOmD4GFofSGNOl+f7D5tfhcpjdDMTaDDulCxnbqwmfLRSvnmXIaNszN6vKBkXj4
         KPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZGYBGkCw32k45Ta27ICyGdC2SYG8sJKDr39eAgP8n2U=;
        b=J53PVoOQZ9klQOGzE6DFOI6n1QDCDOVtto/sd7VbBQ9C/lZ5E8edy5oBwL8gVlignh
         RecJ/u+aMJflDQO34lcvm/oz+IM4MDOshelxsCu/UcNg2c8pC/G/kDGpgjZios+AkMtw
         GTGjrLMm9jUEJAg2DjtnvFrkHvulYP1ExjPSOaAgPZwO/eL9BLeXQWVeJnfvUgYbNRLF
         R+OmtWqaEW54umcm8m5Jj//YzXWUx++9FpbnlN4zPgGtj0Ng5HGEE86ZcypmoVEmaluk
         y5Ctjgx6Qyz3pokPwgCbDdbJSjaFqrGYN1jlypnjz4W7OmfrEDE5RGRzh+pG/1LuyNoY
         QQ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HGon65tJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si4264961iov.19.2021.04.01.03.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 03:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HGon65tJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRulT-00074P-3z
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 06:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulH-000738-Sk
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:15 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:37606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulF-0002M5-SK
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:15 -0400
Received: by mail-oi1-x230.google.com with SMTP id k25so1331437oic.4
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGYBGkCw32k45Ta27ICyGdC2SYG8sJKDr39eAgP8n2U=;
 b=HGon65tJeZU+nIDtLVir42Wa+5SiRLWxRDT5eAePfO5HGI6c/C8kL7WgDbmjD+FZDv
 t+bs2l62squVILEWs1LaeavaUdm7ByW1byS/praWp4TLb8kzPFrxm4N/nbm8QkLwzzwG
 yNUblwim1W9GuA3Mmh0RYKyige8bGd0Ol/D/iBmEw/jtLQqusvrr9ClKBRTHveRB/9ov
 YytePGHHZ3xsGeKivGVW1LZ39RyGj4h3ShXsVkanojeP3uYtADb260kg0JkXTtsHZ+0s
 aTU2fNmh9Q0k3kcIGM/b2F3FTg3cs4Oe5C5rC1hPCOcaqkwlwzb5DiBMkBvIxfHl89+O
 VPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGYBGkCw32k45Ta27ICyGdC2SYG8sJKDr39eAgP8n2U=;
 b=mUfGKyYpfJPF5LnIWDomS4dxKhnDI5OVVQcMU3BbgFS79TzaO/DuJWumc4pdChEy6c
 G4NWATvWYTZvhLYk309eEnmBtYhu3fr0RsVnoIvwJKt/apEzOQD2WNusp0trDNf68fcS
 uHcRaGWFKBbRg+4tBMjVnfdwz1qXsHlvWkHBXMW3f2Qq8iBsDfVPmaZTVf/JvZtJzDvg
 Lyjx9JaY5qm9t6PajF0TuKW4bgVr7PJS9wyxrhqWLsT4rEM01/a4TWWojh2ns4GYJKrN
 Nsf5Fy5AGT2xgzzJJN9erpQt67HrjmS6FgyBh8bjFDVN2iSrp+6LrJF0vMN7WjHMXtKS
 mDGg==
X-Gm-Message-State: AOAM532G816EZDNqpotRBi/fg9K37n3rDNhZz6o2IVBZgZAYWAlRDevP
 sxl50W3EG85XltgbUfjs8DL9
X-Received: by 2002:aca:1302:: with SMTP id e2mr5346157oii.170.1617273671822; 
 Thu, 01 Apr 2021 03:41:11 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:11 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/6] target/arm: Add nested virtualization support
Date: Thu,  1 Apr 2021 10:40:52 +0000
Message-Id: <cover.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x230.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tnVGe3nS5YBE

v2:
  - Move the NV to a CPU feature flag(Andrea&Andrew)
  - Add CPU feature 'el2' test(Andrew)

Many thanks to Andrea and Andrew for their comments!

This series add support for ARMv8.3/8.4 nested virtualization support
in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and 
has been tested on a FVP model to run a L2 guest with Qemu. Now the 
feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
starting a VM. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-5.12-WIP

Haibo Xu (6):
  Update linux header with new arm64 NV macro
  target/arm/kvm: Add helper to detect el2 when using KVM
  target/arm/kvm: Add an option to turn on/off el2 support
  hw/intc/arm_gicv3: Enable support for setting vGIC maintenance IRQ
  target/arm/cpu: Enable 'el2' to work with host/max cpu
  target/arm: Add vCPU feature 'el2' test.

 hw/arm/virt.c                      | 19 ++++++++---
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 16 +++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  2 ++
 linux-headers/linux/kvm.h          |  1 +
 target/arm/cpu.c                   | 14 +++++++-
 target/arm/cpu.h                   |  4 +++
 target/arm/cpu64.c                 | 53 ++++++++++++++++++++++++++++++
 target/arm/kvm64.c                 | 15 +++++++++
 target/arm/kvm_arm.h               | 13 ++++++++
 target/arm/monitor.c               |  2 +-
 tests/qtest/arm-cpu-features.c     |  9 +++++
 13 files changed, 144 insertions(+), 6 deletions(-)

-- 
2.17.1

