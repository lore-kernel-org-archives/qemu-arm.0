Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp454993lfg;
        Thu, 1 Apr 2021 05:56:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi5XyzzERRNjN06PjLFPklS8Oc75V/TUQ1iQfLzD0BDrUBCTjCycQFQQuGyEjYSc2y8Y5V
X-Received: by 2002:a05:6638:381c:: with SMTP id i28mr7604778jav.60.1617281779036;
        Thu, 01 Apr 2021 05:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617281779; cv=none;
        d=google.com; s=arc-20160816;
        b=gkHqtzPHSkhD6C8lSokAQYN460u8iThAjeVLAJWg32SmcXwjjEG8ecU7aT5QaiyPo6
         M6XZn2Bpqk9KlWAfSy+wGEZY3oGw7iBU/ha7aW7YLv0S9eOucMw90BwrsnR0LLOH4j9T
         XZGtl1zGrsjXInOQ0jNEFE6ijV+7zg9DKW8SDFwrgcrobAUfTh8RBnK6SdmgOVn5RgRS
         kcoZZzFOawsuL9GUjAEDxQbELNqwMVTx0sXOBFs3PhSb+PFwmgmD/jRtzzqEe4ZfzofM
         B6lAORuJlXpnlGO3wa3u32vvJvvbnjw8zdvattshh/2SLdS2+cWcfXD/wW0+cAqfmTjl
         Y3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=5RkNLC5WI+uRZhYZKVcGch990QPAIEFOdI+kgFgPscg=;
        b=uphPIKj5Zr8w2NLTM6W2E0REhcZLSNw2dwJizMffftE5AxFyAYa5/ycoLvCpKy0HdC
         /jxFDrHrhnfNrORYctUZEYMVXawONVO2chQauYOhDdy9+zEKbKxqKAK6WixJaA3o8VvS
         JVgi6BIB6JzVahVIuW3z5mqFJdvri5W8SuFyzH9EYV+OC1CgdBBbgbtG8STRtPljqHkV
         Uk2D6yuas3hl75Wt0eKUBEJ5u+shANLrH4pwrCQP5uO1DnPABvdhE+quYHgTRtVvdWL1
         s4mHPN9eKCME+qG7/OhUq4/es6P/j2WuPnUuRbUAtnEvrqMGQScERtjd1ZKQIXBjUjPD
         ktZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lySFpGRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si4374131ioi.68.2021.04.01.05.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 05:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lySFpGRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRwry-0001hL-BJ
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 08:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrW-0001gw-5v
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 08:55:50 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:45954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrU-0002wt-8y
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 08:55:49 -0400
Received: by mail-oi1-x235.google.com with SMTP id d12so1638750oiw.12
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RkNLC5WI+uRZhYZKVcGch990QPAIEFOdI+kgFgPscg=;
 b=lySFpGRpFCVhpkTG1mIVxCwCe8MRPa62h/Le11fY7EqzwuGNrwJhQG4cRaGPOHdxmZ
 h9vVeRoRC+jSMN1cthB/X5YdIecNtksl2l5wG5BqT9I8Il9HE1zW/hFZeohBaQgR7Tkc
 L1JXvF59SjKXt7CWHnVpMAU3r3BFUG44z+5nBiSY9UWhebXYoNOF/+58OxcSxO7iIlV1
 6VCK/YjD3wz2zerjmQLMJ1EbWmQx+3foChOhCao5lEjJCnCcouCQAogH6OxqDnKRb/7Z
 R8Sa+lRnv2mH37jPpsRWThVBmbbve6a0b/5BA36stiEDoI9iHXME4Jyph7Td4mfgvbme
 ChpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RkNLC5WI+uRZhYZKVcGch990QPAIEFOdI+kgFgPscg=;
 b=ORUZxt1tdhd/Ogghpqn5vRFL/ZWOserLWo7U6ukCq3Pyfzcoo4hHVxo278CXg4uC54
 oaJT22KxrKosN8RTUa4x6xPvBf01tibn0c7bAo6G4YlOcZIqTU+GE4rwTHDcFvcW3lve
 uIFUPxlN+uxiPJA4rgjz42KmLLmw6lBgnKKmlnI106iT0siT7ps/Ogr9xiyMmI7sJM5p
 w3iawjhqy2oaFGNcBtzyx5LCakz25MVoQxa1UXd9jfdox2s/SsXV8sbMkMxcgK+UuzyV
 sHezgqYFzbYg2u+olFS5beRn5nDyserpvNdLLAYvzDwlFwo3rQC01qV06MUGMaYdfK3s
 PUEQ==
X-Gm-Message-State: AOAM532TsCsCa1MIUmLAisGltKlDo5vwvmCcemO/hiQ72h1aKtLfTNgf
 57fFduGDBHDIf4XnWExqqnnJ
X-Received: by 2002:aca:1909:: with SMTP id l9mr5825428oii.144.1617281747188; 
 Thu, 01 Apr 2021 05:55:47 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:46 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization support
Date: Thu,  1 Apr 2021 12:55:32 +0000
Message-Id: <cover.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x235.google.com
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
X-TUID: Xe22ihp4GhlD

v2:
  - Move the NV to a CPU feature flag(Andrea&Andrew)
  - Add CPU feature 'el2' test(Andrew)

Many thanks to Andrea and Andrew for their comments!

This series add support for ARMv8.3/8.4 nested virtualization support
in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and 
has been tested on a FVP model to run a L2 guest with Qemu. Now the 
feature can be enabled by "-M virt,accel=kvm -cpu host,el2=on" when
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

