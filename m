Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497911ejd;
        Fri, 19 Apr 2024 08:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeDpX3QYqwTHeCOpd97Sw+4udSsM9TkrfyCarTN7fjXtwb5n2yWsJ08aB2yg7ftU4fIsTT3R9W86/cynB+cw0a8/LY/G8v
X-Received: by 2002:a05:600c:3acd:b0:419:b36:7e43 with SMTP id d13-20020a05600c3acd00b004190b367e43mr1586586wms.7.1713542387372;
        Fri, 19 Apr 2024 08:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542387; cv=none;
        d=google.com; s=arc-20160816;
        b=q3+IsYXz8mosMPkO8Kd2PToHhek8I2nj3SeHxFn4RT1QUZW7yVgaAmoAkI49Dtaca4
         PSKpJMj5yjfg8RwPusaJ7F3epdIIy6YiSaOYLK83qlx4Y8JQ5wvb8HPAcxsynBmuTWbM
         7oe4XLfo1+At6MpRRwmNhN56/xYx6ODPWBRhRWnAtxbdY0ukevpPnW1EHeZacD34S+7F
         PNxh6+3u+aAR/ZAJuvcztkAlTlgg41djX+Y0EDT+/PZhUBmjrifSEwn409kOpMHlKmJn
         kQNtmqCfANWljra3tsnuNYpsOknUV1E4A5KydsWtrgnoPpY4nWXXws9O0eD2kO6ARkS3
         PC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=wF2tUJhmRvxM/T9bOvPLdjIMa/R/CPSkeOISd4fhQks=;
        fh=3xT09dQ8bQuDs6/38oWBkq9Rt+qmspS2FrlqpWyj5eA=;
        b=oSt/R/essr8MMXUG1pH7NAwMMLI5IUtKlrhw+sT8H1U8xK+9C9KTdu4P3VGYm8B89P
         6xJIuzLOs2DWd84nhS1J4UeIoEthDzw8otT9mENOQGE30gbATA9E7y8AdDvD/eDZjd4K
         6KDBCp0/LLDZMPpkMMIwCBfwrJdC3vh66TGWBkm6F+Xgjs3BrTlBxX3PgEateUydnbAa
         ukUNibjRMVhLz9r36a519xlY4t2qbshqAXOCYHMCojqgfRuJY9BI51K3O1ZmUrMCQ0XA
         8EwfI4yS3tYKbnAP/c8Vl9NHUAHpd8UgT1i1Hw93QZUR1QSsbxZtAorLhWRZd2i27AJf
         j0Iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbd0QVah;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3-20020a1c4c03000000b00416660b0491sor1318354wmf.9.2024.04.19.08.59.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbd0QVah;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542387; x=1714147187; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wF2tUJhmRvxM/T9bOvPLdjIMa/R/CPSkeOISd4fhQks=;
        b=gbd0QVahjDsINBsg46FxzFxkGWes2O2D18gLL/m4cptwbkE2qF7/bk/B2JZ+HXRKny
         KasuLSjF45Rhni3tyqB2XPMbZXAr2Lt/IlT/jE+Iwx2chCZD6ibZkuW4t38V8mDPAARD
         UnY+GzR4n07uE0VirmQjd5RIfmnPH0ksBps9yRMUmWp2nbiz7M6t6rNlzzWhe3afCiXr
         L3DSiM8QV8uo2rKhwBX4xoPmBJ9fLWO0x27tG/dq8tg9Kb6NxJwbeNA/f6WBJt5cKVR6
         bO/fGZG2UefQzIoUs6TTDwXthzCoc4ERdHUuv6aY/YbVf7zBZBx/Vvxqpj8em/t5U32M
         JJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542387; x=1714147187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wF2tUJhmRvxM/T9bOvPLdjIMa/R/CPSkeOISd4fhQks=;
        b=G9Y7BFRCGa+7piBzG2N2yi9NBVUdBrWPg+JRV1vyrVuVUnOVMtkSqM5o7mm9Da1Z96
         Dgqgyh6G2sHfwCpKR8LrojSAXzyLHcoca/hPaTW9BE2uIBdpmCRyTJN/zgasvn8r0a2m
         26Zc9S1LBQx/2G7nt+z5ipnY6j+w6FRRMpvaW+6FQtYNqVY63Zw23AQGqOT9VbXAx8f5
         2nM+0k4/AoVbIEhsf0+Y1U5W2Uj0Vz/CnuDSbxW2UlMr4isIv5T0tLFe8LjJ3o7GuYPe
         I266ARUKRZvox1ocHNI/UqPH0CeM3QSkt+AwY2nVD21d+bcG+rreEnK90wBChk5lrJTO
         vbQA==
X-Forwarded-Encrypted: i=1; AJvYcCXYOZCZE8KgpkxQF00ujIMW/0o+ql3+vA9wnmYW8yQ8A6aMyCllRsqBasV/XoJPSPMHB1H/mQse6COHM17AzNPMrul5lVYE
X-Gm-Message-State: AOJu0Yzr8V41UxQjca0HNc0QtVkIc0Lr+hd9BFZi2EW1xjvFRHcptzZ8
	K6sBhrnvEUOeaipcoZO16lcd/xZaznOP0HEbj+rNlKNqeYDfuygLTUB4863Ye8nrkA==
X-Google-Smtp-Source: AGHT+IEiRI0eMWirDzLkMfmstUZjsYIpT5VQHFucWRVWQQLXNXR8Do1zelw3/ID4ONhnZvX3HWIgqw==
X-Received: by 2002:adf:e60d:0:b0:34a:4f5a:ac20 with SMTP id p13-20020adfe60d000000b0034a4f5aac20mr1535118wrm.11.1713542386895;
        Fri, 19 Apr 2024 08:59:46 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 00/22] arm: Run CCA VMs with KVM
Date: Fri, 19 Apr 2024 16:56:48 +0100
Message-ID: <20240419155709.318866-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VXydhCQCxBxK

These patches enable launching a confidential guest with QEMU KVM on
Arm. The KVM changes for CCA have now been posted as v2 [1]. Launching a
confidential VM requires two additional command-line parameters:

        -M confidential-guest-support=rme0
        -object rme-guest,id=rme0

Since the RFC [2] I tried to address all review comments, and added a
few features:

* Enabled support for guest memfd by Xiaoyao Li and Chao Peng [3].
  Guest memfd is mandatory for CCA.

* Support firmware boot (edk2).

* Use CPU command-line arguments for Realm parameters. SVE vector length
  uses the existing sve<N> -cpu parameters, while breakpoints, watchpoints
  and PMU counters use new CPU parameters.

The full series based on the memfd patches is at:
https://git.codelinaro.org/linaro/dcap/qemu.git branch cca/v2

Please find instructions for building and running the whole CCA stack at:
https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/Building+an+RME+stack+for+QEMU

[1] https://lore.kernel.org/kvm/20240412084056.1733704-1-steven.price@arm.com/
[2] https://lore.kernel.org/all/20230127150727.612594-1-jean-philippe@linaro.org/
[3] https://lore.kernel.org/qemu-devel/20240322181116.1228416-1-pbonzini@redhat.com/

Jean-Philippe Brucker (22):
  kvm: Merge kvm_check_extension() and kvm_vm_check_extension()
  target/arm: Add confidential guest support
  target/arm/kvm: Return immediately on error in kvm_arch_init()
  target/arm/kvm-rme: Initialize realm
  hw/arm/virt: Add support for Arm RME
  hw/arm/virt: Disable DTB randomness for confidential VMs
  hw/arm/virt: Reserve one bit of guest-physical address for RME
  target/arm/kvm: Split kvm_arch_get/put_registers
  target/arm/kvm-rme: Initialize vCPU
  target/arm/kvm: Create scratch VM as Realm if necessary
  hw/core/loader: Add ROM loader notifier
  target/arm/kvm-rme: Populate Realm memory
  hw/arm/boot: Register Linux BSS section for confidential guests
  target/arm/kvm-rme: Add Realm Personalization Value parameter
  target/arm/kvm-rme: Add measurement algorithm property
  target/arm/cpu: Set number of breakpoints and watchpoints in KVM
  target/arm/cpu: Set number of PMU counters in KVM
  target/arm/kvm: Disable Realm reboot
  target/arm/cpu: Inform about reading confidential CPU registers
  target/arm/kvm-rme: Enable guest memfd
  hw/arm/virt: Move virt_flash_create() to machvirt_init()
  hw/arm/virt: Use RAM instead of flash for confidential guest firmware

 docs/system/arm/virt.rst                   |   9 +-
 docs/system/confidential-guest-support.rst |   1 +
 qapi/qom.json                              |  34 +-
 include/hw/arm/boot.h                      |   9 +
 include/hw/arm/virt.h                      |   2 +-
 include/hw/loader.h                        |  15 +
 include/sysemu/kvm.h                       |   2 -
 include/sysemu/kvm_int.h                   |   1 +
 target/arm/cpu.h                           |  10 +
 target/arm/kvm_arm.h                       |  25 ++
 accel/kvm/kvm-all.c                        |  34 +-
 hw/arm/boot.c                              |  45 ++-
 hw/arm/virt.c                              | 118 ++++--
 hw/core/loader.c                           |  15 +
 target/arm/arm-qmp-cmds.c                  |   1 +
 target/arm/cpu.c                           |   5 +
 target/arm/cpu64.c                         | 118 ++++++
 target/arm/kvm-rme.c                       | 413 +++++++++++++++++++++
 target/arm/kvm.c                           | 200 +++++++++-
 target/i386/kvm/kvm.c                      |   6 +-
 target/ppc/kvm.c                           |  36 +-
 target/arm/meson.build                     |   7 +-
 22 files changed, 1023 insertions(+), 83 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

-- 
2.44.0
