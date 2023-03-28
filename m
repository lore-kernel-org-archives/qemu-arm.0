Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2652437ejb;
        Tue, 28 Mar 2023 06:30:57 -0700 (PDT)
X-Received: by 2002:adf:facf:0:b0:2e2:730a:c7e0 with SMTP id a15-20020adffacf000000b002e2730ac7e0mr1302691wrs.3.1680010257586;
        Tue, 28 Mar 2023 06:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680010257; cv=none;
        d=google.com; s=arc-20160816;
        b=O9WrDVFQBMMZVcXWZEj6zNNUeCrIanyN4jQ1xAeUCVxR2Hgwmby8A0FdMs4z4g3q0o
         OMP36QIoxS1Hy51U989xHBUjUVOublt4Qami2Cxo5GvxZSF7G8G7ajtPlYlkJPltTTr0
         eKYpu21gtxWv5CO5wAzzSc4DvTjbAJUe6m+qxIHUIa/zCUoWmWU56UN0M/W06B45V068
         kjYBUPb7uGkBBSUhnCaOEmgGKyhWNvvopP1l3VEewXzyIDtP0ObVWkBntwirsDey5CM5
         ACFtv6d2asVh7LdTcn0pHgYFSIxEz8ve/BpdSuAOvnZGhC4PdbjcGYYLROInLF0qP0pH
         AGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=RkLefBby8GHB7D7b9Jb4bIaLZXqnZO2qePDhjw0TaDM=;
        b=k/tShTw+fkSPQRm+AKvbLkaYFLy/ghPKNszOrLgf/xe1l5nVt+2GwNYUkcFuNmV566
         EFYCRaplU8yQadrhSOLMBW8OQ/J49w7erBHXZFek8EaFqh96DZubLpxGclZgJKyRD45l
         LSouvNubgrcdPq195AgOcso7ARYEVl1834QirMCzpxL9kViNbUpOyL4gRwwyvur2UgJT
         K5lJG8od8/GZe+BY8NC/ftbmrcZmxmMfjSpEe6htfegmvmwXh78xsfrzSEiLzabZLAJj
         cZWSzFrv0UlUhWuehMzvpoTtFpDSjeJkuoFikLLYNSKN4CjpShFV5HIgAuVWvJNl2+Lm
         vF7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSBMoV3a;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r12-20020a5d494c000000b002ce32bbb8c0sor12160655wrs.44.2023.03.28.06.30.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 06:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSBMoV3a;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680010257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkLefBby8GHB7D7b9Jb4bIaLZXqnZO2qePDhjw0TaDM=;
        b=pSBMoV3aPQGyBwoxR6SXKnXJTpzeWuJ3//GjmISODNJWgy+uB2EoLuc9bkJZsiuJVk
         4rL+D2hr/e/+C+81jiUesZNjOy5zuPlGr7/LWLE6Qpi+jrjmIk+SjUSn6woHpVqS4YUT
         EGks8TnLQxKi3Wc54gpMBO2lKmv/i3rRCSMPuPddG1v0uNTfGha2VlNgTYQ84/8DdLjv
         IeC1XgKMVoEyMXWtdA/qNuvKCVAwhzGAkfWa/dDcnvCBnUUHKj06WphVDXPEPQBH5sE4
         tuKbBSyr+kenOoneuEzjI5oE/6VEPgNUtE+u0OtB/ESkQKT4BUU73sai/kw/IrIsBD4s
         HJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkLefBby8GHB7D7b9Jb4bIaLZXqnZO2qePDhjw0TaDM=;
        b=F3POvr/3FJFKJ5nbFAJ8N63r+70ecsyPhhLGKrTdBE/nc6xvRS1olEIX7kaCiJJ4AN
         V37s5GPtiAG3/UbG+IG1vTT7Ur+yywtVeX0EwPvDTkwMe+K7AEiEkSra3xaTrZLF/SKB
         s9uWZe70f0FH7uC5QO65BsQP3tsOmqN/3m96P5ihnsr8lBpb1NuNG7ZdUZp+dKJfAcOF
         guZCuFDXpnTEp0jGdw/bmEuaxHgPycC4sG6a4qHQ2nwxd/QWAUfhW1tgai+eDZtyQwQK
         XsD5YZGWSQbh9ddGw2L1xiFaxoyKRpjlBPpZ8cawTvzv29rHvOtAIcm6jzEob18CIav6
         cFIg==
X-Gm-Message-State: AAQBX9faAaGvsq/N/0J+JwucbEzbDN5NXdPktfyQ8rVR0A6VSmlMk5KC
	mEXJAkl+2T7vMc9Yvk90tZvvMOs2
X-Google-Smtp-Source: AKy350Y2G19ZilaxQ/WGGrpjVRZhqLPVJqijGbyKFHoIkFBBQTUBIsdqnOpTvGKALo3pn7S+VKJkUA==
X-Received: by 2002:a5d:6b83:0:b0:2d4:5301:fac0 with SMTP id n3-20020a5d6b83000000b002d45301fac0mr11867088wrx.15.1680010257264;
        Tue, 28 Mar 2023 06:30:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id a7-20020adff7c7000000b002c70ce264bfsm27914823wrq.76.2023.03.28.06.30.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 06:30:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 0/2] target/arm/gdbstub: Fix builds when TCG is disabled
Date: Tue, 28 Mar 2023 15:30:52 +0200
Message-Id: <20230328133054.6553-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: eMTAxi4IdXBc

Since v1:
- Replace "Restrict aarch64_gdb_get_pauth_reg() to TCG / KVM"
  by a new patch "Inline pauth_param_mask() and pauth_ptr_mask()".

Fix when building QEMU configured with --disable-tcg:

  Undefined symbols for architecture arm64:
    "_arm_v7m_get_sp_ptr", referenced from:
        _m_sysreg_get in target_arm_gdbstub.c.o
    "_arm_v7m_mrs_control", referenced from:
        _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
    "_pauth_ptr_mask", referenced from:
        _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Philippe Mathieu-Daudé (2):
  target/arm/gdbstub: Only advertise M-profile features if TCG available
  target/arm/pauth: Inline pauth_param_mask() and pauth_ptr_mask()

 target/arm/internals.h        | 16 +++++++++++++++-
 target/arm/gdbstub.c          |  5 +++--
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 3 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.38.1
