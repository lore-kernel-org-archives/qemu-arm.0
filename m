Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp479649ejb;
        Wed, 5 Apr 2023 09:04:58 -0700 (PDT)
X-Received: by 2002:a5d:67cf:0:b0:2e6:3804:5be with SMTP id n15-20020a5d67cf000000b002e6380405bemr4648812wrw.59.1680710698108;
        Wed, 05 Apr 2023 09:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710698; cv=none;
        d=google.com; s=arc-20160816;
        b=oqFSWLKcPGrq0wAeJrminsYj8ffzGamZF/U3RY8Y6RgHNiln6E5v6lF8QO1v7qtGfC
         unFy63TOJy+km5inF93wYUz4Vl7KFVaymy1qlmVL0n4rX0O+kNIpD1nfAuuzygvQPnIo
         sHK0bIHYyA4ECYmIxEmIcSd3r6Gm1WUML3RT0FBDnP+h/F53VDBtIZTGbArnLlRZd/Ob
         aLgFv47oYRgg2BuflTJdWJarbOYNyoK50orPye/FYeFuARscgfF0alrNRAz8hiFLMujk
         dgrrGs9jkGpve++GOt6Ri6vSmUDrtRCg1Etg1jRHXvlZPMCrpNqD88CJtwe6X0qOwOT9
         hC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Vl/tcRzlSLFP8I0QYpufOB41zMuDYKv+twPlQw3+A7Y=;
        b=gmD3JFaux70vdYW7ZLlbjZiazZQ5BbJfem6HXCkZdapaX+vvXSIwlrV06skSNyOEbd
         cYNYDYRxtAP+V6/OtuAhxvDeiNZwBwFzxkGiCyI3CbKhmBi7B3yKR1nIvJdKLFV1BHny
         FFxuGHS6VsOOMKV7crunSC9GJCQlTVWs+HVP5ea5q9nbmJlZ70LJYRu26Q6aZqvybc6O
         pthBUqe7nMSpTjm39JbHSVMTdSMuTFxTmfSVFW0hqHcVXoFBRyILkavmpoDMY1XYAxtH
         MUN25G2LtB+gPmlx7AX/JJWgV8G6J+Wl22jy/R89F1drNxfXUUJjnfzyyP9SCs1G1Rnf
         c15g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="z2nGX/sb";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m9-20020adfe0c9000000b002c7084e4085sor5758507wri.29.2023.04.05.09.04.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="z2nGX/sb";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl/tcRzlSLFP8I0QYpufOB41zMuDYKv+twPlQw3+A7Y=;
        b=z2nGX/sbknCymlzrQ9v16a39LCmw2vWJ+052z8qCXp7C4jGf6bXcXu3B7SE2op86CM
         pZWCxIOp3+X8l3AJqCp2i3FP8bFOTsRw0XKW5Vu5GlUd7a77LW832HlQNzKVAQA6Unii
         ywjYKNh6fSPU47UFgAbZ/m+OdxIevSbiXkJMApc20LE9+QSxxrSbS2AhGEsWbiV30ZGs
         tGZCcSsg/j2+HjulCXVtZOqEQgLreXUOtJx3aVjPkjgdF5Gib/2iRwHJE/TDtzWp2cfI
         BCx9gnMsct8Sih+glmi6JpbVhwxn29093cKIRS61NExqCA4Hm2FHRQvku8it5hwfLWWG
         8qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vl/tcRzlSLFP8I0QYpufOB41zMuDYKv+twPlQw3+A7Y=;
        b=xolBPzx0+xArKjOgt9xsdZTGpsUEM+2OeKb4RehmFvurUgXaCy+ppc+DNqKpHpVIPL
         YBWjcT2smTI6USJZNxtV55Z86zXOsRcrC+RkFodMr510w2CDJShDWWoLfaEYFPCIgHrJ
         nxD1rv81navnAsqS5SNjaw/xvfFwnHP1zCEmtDgYKdCKqx0DGpE6N/XnE1bJ/s4P0sKi
         nX3vbuAvJYLmKhwKEIWSt8wEMcKJAWtI6b/RkhvWiQ/s0i7mXHU4FRjSTOlphPMlAhsh
         FQ0r9c1EIEJ9ihDQnV1HfXi8ssoYp75AnmIICYmid+Z79WEf/C3HweH/jPtP3rZkC6+y
         x9Hg==
X-Gm-Message-State: AAQBX9devcE0/sIXxS4XpKHWPdiZSBn45PRUGflfabWvA2fqexw6c82Y
	oLelStvfsyTrDBFrf/qVZ4TjgxUR
X-Google-Smtp-Source: AKy350a2v8x4w7quWU/H2xrgdicBj2Mb70/KyTRdW4r/bTcsFan0Cz9m9OOnUgEYSEuCthtLF8HE9g==
X-Received: by 2002:a5d:4f8d:0:b0:2d8:1aff:813 with SMTP id d13-20020a5d4f8d000000b002d81aff0813mr4655005wru.43.1680710697754;
        Wed, 05 Apr 2023 09:04:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d48c2000000b002e61923575csm14691415wrs.74.2023.04.05.09.04.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:04:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/10] accel/kvm: Spring cleaning
Date: Wed,  5 Apr 2023 18:04:44 +0200
Message-Id: <20230405160454.97436-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: mGMNx4BRi1mZ

Misc KVM-related cleanup patches split from a bigger
"extract KVM specific fields from CPUState" series.

Philippe Mathieu-Daudé (10):
  sysemu/kvm: Remove unused headers
  accel/kvm: Declare kvm_direct_msi_allowed in stubs
  hw/intc/arm_gic: Un-inline GIC*/ITS class_name() helpers
  hw/intc/arm_gic: Rename 'first_cpu' argument
  hw/arm/sbsa-ref: Include missing 'sysemu/kvm.h' header
  target/arm: Reduce QMP header pressure by not including 'kvm_arm.h'
  target/arm: Restrict KVM-specific fields from ArchCPU
  target/ppc: Restrict KVM-specific field from ArchCPU
  target/riscv: Restrict KVM-specific fields from ArchCPU
  hw/s390x: Rename pv.c -> pv-kvm.c

 include/hw/intc/arm_gic.h              |  2 ++
 include/hw/intc/arm_gicv3_common.h     | 10 ++++++
 include/hw/intc/arm_gicv3_its_common.h |  9 ++++++
 include/sysemu/kvm.h                   |  3 --
 target/arm/cpu.h                       |  2 ++
 target/arm/kvm_arm.h                   | 45 --------------------------
 target/ppc/cpu.h                       |  2 ++
 target/riscv/cpu.h                     |  2 ++
 accel/stubs/kvm-stub.c                 |  1 +
 hw/arm/sbsa-ref.c                      |  1 +
 hw/arm/virt-acpi-build.c               |  2 +-
 hw/arm/virt.c                          |  1 +
 hw/intc/arm_gic_common.c               | 12 +++++--
 hw/intc/arm_gicv3_common.c             | 14 ++++++++
 hw/intc/arm_gicv3_its_common.c         | 12 +++++++
 hw/s390x/{pv.c => pv-kvm.c}            |  0
 target/arm/arm-qmp-cmds.c              |  3 +-
 target/ppc/mmu_common.c                |  4 +++
 target/riscv/machine.c                 |  4 +++
 hw/s390x/meson.build                   |  2 +-
 20 files changed, 78 insertions(+), 53 deletions(-)
 rename hw/s390x/{pv.c => pv-kvm.c} (100%)

-- 
2.38.1
