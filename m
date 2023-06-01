Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp533073ejb;
        Thu, 1 Jun 2023 08:31:36 -0700 (PDT)
X-Received: by 2002:ac2:5ed1:0:b0:4e8:4bc3:fe8a with SMTP id d17-20020ac25ed1000000b004e84bc3fe8amr198689lfq.25.1685633496343;
        Thu, 01 Jun 2023 08:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685633496; cv=none;
        d=google.com; s=arc-20160816;
        b=qDSsJmx95fdTTl2lgc81CWmp3A3WxCBDI+AYVjUSh4pGMVcrf7yV3YgWuf5REccLIX
         SBQU5hBd4xO3TcFZBNHZ3lK1BGkPr0Wm7eT3xZGkJVoEnSS7EOIBNH19w9rL6Zn87qBS
         tCvZzWRsKbHUcZMZNOshAF7KtvdTf5rp37riMLeWUVQ8mT/18izHOUPC8R43Do2Q8dTC
         1kt959SOqkw9XZDC9RpBE5OBwDcvMdpoKTcqq0/fU5XBDZtB1tc5csDZAVitiWl55jGN
         rfVH60WvVbkqAItxplJP1bHOg1RN7b9avPC13r2TNU4gj/+aGt2ap5XivEdLFqahJPzH
         ihgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=p72RA+8GXwdkLdVlA+tnuDPDfu6/yeYSBXfafrXnF5o=;
        b=TEWnpkwf2Edev/no5G5NT/d1Xe1gJBnjq7enItWRg1mqO2Ig0FE4e1VWwp54KLO9MK
         7KvCXdz1n64qvkZdZ69HUSRPEu8KCKwxJvc47SCWxLqHFLsbQQSbMnroxdeT6F/zOywS
         XKwRHbtYfQCPxQmRPNkFnHKLyw9HlPbLeguf+VA4JyeKCzvlngesHVwjMxkiRjVnsYcb
         z7v12AurTfQPj3Ozt0f0fQCVj7ykqEawF+DRtWL8xV+nDXqbRVm/6uqZ0NvlG2GRA/S5
         eNMGrvCjEC6XsrkKuJB+UF9aa7iPUC/faYl3TtFo/1dOsseNkY8EuCG31Nnv//TZNNzE
         Euew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=HgDn4ukh;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a18-20020a195f52000000b004f0030ed42dsor2385999lfj.7.2023.06.01.08.31.36
        (Google Transport Security);
        Thu, 01 Jun 2023 08:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=HgDn4ukh;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685633496; x=1688225496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p72RA+8GXwdkLdVlA+tnuDPDfu6/yeYSBXfafrXnF5o=;
        b=HgDn4ukhbbLu9lXjkowJURHL8518TUroXKkTYMczQwDl5sV44cudMr0WyNkQirdVIb
         I9s81zVV4gr2+9tIP8TsRjpdkJiRT/gVS7ExXe09QMCPEQ0GLx+P712y5EUfouUvppoT
         x8+gfBV6vHx/aDUIOHVB+mZQeMau4helQHFCgsG0JK90JRJErGQhj0o9yUDLqORsOtwg
         kT92ZJT9uwa2VaH0OiGOGw6CMG07pzHdOIDfGmd7+7Qg7mmbaTjgJGUGVEhD+Yvx5d/m
         Qdzqt8VrljQuVtx2lZzXxfQ5YLdYYwxrzVqG2V/zRu3VCsgOi3qi2UR4Ugw/nV9YS2Rr
         uKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685633496; x=1688225496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p72RA+8GXwdkLdVlA+tnuDPDfu6/yeYSBXfafrXnF5o=;
        b=MIe2k0WHnszlLXz3DDZjCP3TnCNRvGJ0MGWVUJIty5h8C5FOyAi0GX4yBDVs6++jVX
         bfTyxaFn/RVya96qDiBb1/YSXBdpwF8zLQAIEttyLMkav8clcJI18hGN2Mk4o0wrJJ0R
         6KvejfNfqGmEC4eFG3qMVK7yQe9TUowxe5xSJDH4Qa01Iju2MkWyCogfVBqULpxWE/WB
         8bGiYUZeJArju7I44rBoFGlyQ+kiX0RAdbeaHE8QFhkL+j3CGevievZcBkZCwW+8+VcJ
         yI+lgLZCa7dmIbpEQLSDkKEq/d8fRNp3XJ3zKwJ/q5+4TncdvrLTJN0budPzAjQ9CYxJ
         X3cw==
X-Gm-Message-State: AC+VfDwCKeBzCQGLXnfjguLlujHrsp4jfLvqNh4bJO79E3DWlncDkn/U
	7w7xPyc0Har3dOui/CMqAbw=
X-Google-Smtp-Source: ACHHUZ4z3y7qFT1oPOQbFbSTY5jH1I6ez/RorZij6tQ8g8Vwa4Cqa28k5joZLtdNbxI9qekf7dwfAw==
X-Received: by 2002:ac2:4357:0:b0:4f3:b883:fc4e with SMTP id o23-20020ac24357000000b004f3b883fc4emr161087lfl.43.1685633495477;
        Thu, 01 Jun 2023 08:31:35 -0700 (PDT)
Return-Path: <francesco.cagnin@gmail.com>
Received: from omega.guest.bzh.qb (177.23.22.93.rev.sfr.net. [93.22.23.177])
        by smtp.gmail.com with ESMTPSA id l14-20020a1ced0e000000b003f4289b18a7sm2763975wmh.5.2023.06.01.08.31.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Jun 2023 08:31:34 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk,
	dirty@apple.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	agraf@csgraf.de,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	philmd@linaro.org,
	Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v5 0/4] Add gdbstub support to HVF
Date: Thu,  1 Jun 2023 17:31:03 +0200
Message-Id: <20230601153107.81955-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y0EJaABUfwsK

From: Francesco Cagnin <fcagnin@quarkslab.com>

This patch series aims to add gdbstub support to HVF (the 'QEMU accelerator
on macOS that employs Hypervisor.framework') on Apple Silicon hosts.

The proposed implementation, structured like the KVM counterpart, handles
single-stepping, software breakpoints, hardware breakpoints and hardware
watchpoints.

The patch has been most recently tested working on a macOS Ventura 13.4
ARM64 host and a Linux kernel 5.19 guest with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work with
Linux kernels compiled on macOS, see
https://gitlab.com/qemu-project/qemu/-/issues/1489).

This version of the patch should fix previously reported issues on
multi-cores guests. No other issues are known.

The patch has been tested on top of QEMU v8.0.1 dabb418.

v5:
* Split patch into multiple commits (as per suggestion on v4)
* Update `hvf_arm_init_debug()` so it's not called multiple times on SMP
  guests (as per suggestion on v4)
* Fix add `hvf_arch_set_traps()` to enable/disable exiting the guest on all
  vCPUs
* Fix share a single `hvf_sw_breakpoints` across all vCPUs
* Fix add missing `QTAILQ_INIT()` for `hvf_sw_breakpoints`

Francesco Cagnin (4):
  arm: move KVM breakpoints helpers
  hvf: handle access for more registers
  hvf: add breakpoint handlers
  hvf: add guest debugging handlers for Apple Silicon hosts

 accel/hvf/hvf-accel-ops.c | 119 ++++++
 accel/hvf/hvf-all.c       |  23 ++
 include/sysemu/hvf.h      |  37 ++
 include/sysemu/hvf_int.h  |   2 +
 target/arm/hvf/hvf.c      | 750 +++++++++++++++++++++++++++++++++++++-
 target/arm/hvf_arm.h      |   7 +
 target/arm/hyp_gdbstub.c  | 253 +++++++++++++
 target/arm/internals.h    |  50 +++
 target/arm/kvm64.c        | 276 --------------
 target/arm/meson.build    |   3 +-
 target/i386/hvf/hvf.c     |  33 ++
 11 files changed, 1274 insertions(+), 279 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

-- 
2.40.1
