Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp318044njj;
        Tue, 29 Oct 2024 08:11:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpSkV2qHG6l1FgVJHafcPIyLMaCMQsPX2rF/I7jVh28uQng4vhK3wzngGKXax/nnctb49ThgnwoeK3Hw==@linaro.org
X-Google-Smtp-Source: AGHT+IGg5eH66dega5/D27yzupmmjC5QFhk9LTdnqUxJCG3J4aJoTFBNuhf33+eEv5cxzzP//uhe
X-Received: by 2002:a05:620a:4502:b0:7a9:bd59:8de6 with SMTP id af79cd13be357-7b193efdeb5mr1785745385a.27.1730214679267;
        Tue, 29 Oct 2024 08:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214679; cv=none;
        d=google.com; s=arc-20240605;
        b=d99qA4Da6hwthRsKmH0a+Ez9axqSHPc8XRCYlFulfhA+xXd5wUAr+h4tjk2+Pik0k2
         jmyE6YkNwMclFdbHoGA0hyVzQC8UglBSZc3UGLaSySmj7cPwcZqeNqNSpP/PsKradRwb
         nz94iU5PyvAcxRGCLxzTfmJ5BdkfLFyaqnHEnbT+HVUu7GGenD1C5ShvEcI9pcX3+Al8
         NHC/nMMrSnYP3lFqYP8aTwNHHfTWRSTekyg8s9JMrTm4v+RKT/w0n+egLbh3KjHTuq9Y
         QCfxL743e4x3OdjJxFXZ6Yt7iFXzChTI6rrjXnmM5wO+dFpSDwmK9in4APwxJIs2xLbb
         NUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=6E8Zb5i5ZN1jEbdrK5qD7EoR+N+w6A/G2U/YwItD82s=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=AjtS+p9Mje/DRxlVqroBExYFz7eOpom2RKmcUvtYK6zCYevqI4yWyxD5EguP+7/FrY
         F2mtJFFGpif14yfpKdbuvIeMixoUPESm7i6lv90BcxcINcSvbWM5RvrrptHmQ+nh/6SF
         /tzP3S7jI2CVuiNTK988cGSOy7ezVUvK9VAVq6PNYqOw7xUsU3MJ9A+1TzJgr1ZQ0zXR
         PSO0E8kUqGRCKy12MwEWz+gONAAQEo1ZT9gzTtM9E8AzyqDXAEwAz4OcpunRHgF+trQt
         OfHDz5PkL87XFgpjslPBrA7oFyLGQ6mMfZOUMQItDFZSMIjp/1pt2quSxrAaUfet6rnS
         d2/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRjNJPRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d29105dsi1088795885a.207.2024.10.29.08.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRjNJPRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5ns8-0000bx-1e; Tue, 29 Oct 2024 11:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nrx-0000Ys-Rs
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:10:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nrv-0007fE-Md
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:10:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso53722445e9.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214650; x=1730819450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=6E8Zb5i5ZN1jEbdrK5qD7EoR+N+w6A/G2U/YwItD82s=;
 b=PRjNJPRTTuJRO5B3lLv8UUpze6pYdRO8DrgjJ59zAErTAe2hN0W1kAvk1UeBX4bnpz
 cc9CfAP2sohMW4zQ5g3YtGiGy3kAQ4OocHxx5V/z/D56wlsjO9vXAYjEGjmglkXSnPtk
 ULqEYjHxMe4B1hddfWyfKv0WMWLyvxLSDPCyOWEvmXMexHnYcE/Ehx5Q1P5yzk9NVpBU
 CNQ2/baDf5KbudNWEXOk5/QZZwhmEsa9lR4c1k/fv1N3PZkaWaQ4OtvyTZOfEwSQGhKo
 zJogGyGyIg/aZm+6cHfFOZIO3cLJCF8oHU/o39mXfGSM097n2TwzRTW4BIFfbi59hP4C
 nSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214650; x=1730819450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6E8Zb5i5ZN1jEbdrK5qD7EoR+N+w6A/G2U/YwItD82s=;
 b=LXq3mB7sh2CnCIAiRY/LGWTSubCdR57N9/PMkud507Hb/pyHPfZqfnR4C4yNVw1oHX
 vAKsgcLS5vraJdpCMo8UT6gdx3pFxFa4JFBrKy74jUEmlxa4eDppzID0tfqYDCHgNFWB
 UN9IzCJd8UKKlV4Xb3sbTXwfhItPMrCx2ArAWAYEgjNZPo2X8QP83F0PB2VWs6zIzP1g
 9uuevdYTJlvj3Q7X1TizUvFiIjPSOXFxHnqfeO0t+nH2zL+cwwTJH+r93AvRRe4Ph5v2
 Ml5/CS0iLqtLQQP3heVbRUmamnDyqFehx6UBGTcQVKO7Y7Lu7QvE91nSh+H4hYh1zL5J
 +tlQ==
X-Gm-Message-State: AOJu0YwrVqoyQj/jls5ODIK61A56Cgy1jaFo8Ove8VJ14JVAnxDxB/G4
 TAlKriu18GOJ9OT+cgmJufLMXD7AWK1ddHHw9g6VR5YA2ppYwWxsSRHHrMTPmsykTTHIM0h8tqE
 f
X-Received: by 2002:a05:600c:354c:b0:42f:7e87:3438 with SMTP id
 5b1f17b1804b1-4319ab8d515mr110896985e9.0.1730214649673; 
 Tue, 29 Oct 2024 08:10:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/18] target-arm queue
Date: Tue, 29 Oct 2024 15:10:30 +0000
Message-Id: <20241029151048.1047247-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: UFK9RQl8EXtj

The following changes since commit fdf250e5a37830615e324017cb3a503e84b3712c:

  Merge tag 'pull-maintainer-oct-misc-241024-1' of https://gitlab.com/stsquad/qemu into staging (2024-10-25 19:12:06 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20241029

for you to fetch changes up to 84f298ea3e2f0627c09871561e55068db9ff9180:

  target/arm: kvm: require KVM_CAP_DEVICE_CTRL (2024-10-29 15:04:47 +0000)

----------------------------------------------------------------
target-arm queue:
 * arm/kvm: add support for MTE
 * docs/system/cpu-hotplug: Update example's socket-id/core-id
 * target/arm: Store FPSR cumulative exception bits in env->vfp.fpsr
 * target/arm: Don't assert in regime_is_user() for E10 mmuidx values
 * hw/sd/omap_mmc: Fix breakage of OMAP MMC controller
 * tests/functional: Add functional tests for collie, sx1
 * scripts/symlink-install-tree.py: Fix MESONINTROSPECT parsing
 * docs/system/arm: Document remaining undocumented boards
 * target/arm: Fix arithmetic underflow in SETM instruction
 * docs/devel/reset: Fix minor grammatical error
 * target/arm: kvm: require KVM_CAP_DEVICE_CTRL

----------------------------------------------------------------
Akihiko Odaki (1):
      scripts/symlink-install-tree.py: Fix MESONINTROSPECT parsing

Cornelia Huck (1):
      arm/kvm: add support for MTE

Ido Plat (1):
      target/arm: Fix arithmetic underflow in SETM instruction

Paolo Bonzini (1):
      target/arm: kvm: require KVM_CAP_DEVICE_CTRL

Peter Maydell (14):
      docs/system/cpu-hotplug: Update example's socket-id/core-id
      target/arm: Store FPSR cumulative exception bits in env->vfp.fpsr
      target/arm: Don't assert in regime_is_user() for E10 mmuidx values
      hw/sd/omap_mmc: Don't use sd_cmd_type_t
      tests/functional: Add a functional test for the collie board
      tests/functional: Add a functional test for the sx1 board
      docs/system/arm/stm32: List olimex-stm32-h405 in document title
      docs/system/arm: Don't use wildcard '*-bmc' in doc titles
      docs/system/arm: Split fby35 out from aspeed.rst
      docs/system/arm: Add placeholder doc for exynos4 boards
      docs/system/arm: Add placeholder doc for xlnx-zcu102 board
      docs/system/arm: Add placeholder docs for mcimx6ul-evk and mcimx7d-sabre
      docs/system/target-arm.rst: Remove "many boards are undocumented" note
      docs/devel/reset: Fix minor grammatical error

 MAINTAINERS                         |  6 +++
 docs/devel/reset.rst                |  4 +-
 docs/system/arm/aspeed.rst          | 52 +------------------------
 docs/system/arm/exynos.rst          |  9 +++++
 docs/system/arm/fby35.rst           | 47 +++++++++++++++++++++++
 docs/system/arm/mcimx6ul-evk.rst    |  5 +++
 docs/system/arm/mcimx7d-sabre.rst   |  5 +++
 docs/system/arm/nuvoton.rst         |  4 +-
 docs/system/arm/stm32.rst           |  4 +-
 docs/system/arm/xlnx-zcu102.rst     | 19 ++++++++++
 docs/system/cpu-hotplug.rst         | 56 +++++++++++++--------------
 docs/system/target-arm.rst          |  9 +++--
 include/hw/sd/sd.h                  |  8 ----
 target/arm/cpu.h                    |  2 +
 target/arm/internals.h              |  5 +--
 target/arm/kvm_arm.h                | 35 ++++++++++++-----
 hw/arm/virt.c                       | 76 +++++++++++++++++++++----------------
 hw/intc/arm_gic_kvm.c               |  9 +----
 hw/sd/omap_mmc.c                    | 22 ++++++++---
 hw/sd/sd.c                          |  8 ++++
 target/arm/cpu.c                    | 14 +++++--
 target/arm/kvm.c                    | 75 ++++++++++++++++++++++++++++++------
 target/arm/tcg/helper-a64.c         |  2 +-
 target/arm/vfp_helper.c             | 56 ++++++++-------------------
 scripts/symlink-install-tree.py     |  3 +-
 tests/functional/meson.build        |  3 ++
 tests/functional/test_arm_collie.py | 31 +++++++++++++++
 tests/functional/test_arm_sx1.py    | 72 +++++++++++++++++++++++++++++++++++
 28 files changed, 428 insertions(+), 213 deletions(-)
 create mode 100644 docs/system/arm/exynos.rst
 create mode 100644 docs/system/arm/fby35.rst
 create mode 100644 docs/system/arm/mcimx6ul-evk.rst
 create mode 100644 docs/system/arm/mcimx7d-sabre.rst
 create mode 100644 docs/system/arm/xlnx-zcu102.rst
 create mode 100755 tests/functional/test_arm_collie.py
 create mode 100755 tests/functional/test_arm_sx1.py
