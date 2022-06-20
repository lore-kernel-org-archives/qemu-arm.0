Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp596641lft;
        Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tly7Y553UW7AKW6pfIh17/huy5wjkVjg1khdfbOPTWclXkCDF4HAIczPgISC5JmwJhHeSh
X-Received: by 2002:a05:620a:2983:b0:6a7:35de:1e44 with SMTP id r3-20020a05620a298300b006a735de1e44mr16895170qkp.487.1655747580255;
        Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747580; cv=none;
        d=google.com; s=arc-20160816;
        b=lzVgxCXAYreXjVP+1cclH3fkYYUH9luj3B27GLPiOJQ7vGkTw++dMb3uIKmALacz6q
         nc7sprDLvtIWUlfcPlsB6jwYJlCy+mHstFejxP9k7YH4Y+cME1BTni2Zav1vEXUcbioc
         aoUmCjwdrHFHqBOiQ301c5nfsH0QF2NW2KLHASnyqaIHJWGRC8GyOXDhHytLvxEe8m0z
         2UtixyFKiTTrQlynPFs0lqg0hu7p/CS7QYZHViTCg2db3vqlyFM0YMSb7qov3YENr08C
         RU1TTBw+cC4Bcdxwfyw6CNoOwxLJ3BPqYImmu41H4Z/D7Hc47g0+/OPhns6gi9Wo2ipK
         N/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=OR8FhoVyw4gtbkUIQHYT5bkd+xvaPMvkY5EgT+9fAqg=;
        b=yu73lSm96WoOp5KpMKFkEoFouoLRpny9YAFEly+hkPFVa41J7MNxyIURb3t0S3uwMF
         NwgLnyzvrIhwqpdwVazCCkjD6elF8vAp65sAxIZsl3RjlUC1e9jPQFeml434q6mFTfi2
         bQNxRGvpniPsV0TaZa1ejT1+rNltU2gSX1nxkBelUV5aQYRLWSPoT0seWJ6i3WBcN42D
         8QQOWiVat2EwwirtgwvkGwlOjfSDnN1E0MqFXEuthHK8qr6txcmFfIZMiBNYILmOoqam
         Dc0B30SABfAUNSU5A3IpzIJqqQlmrusbUzK/bXCch0VnINsSlbY1cSvASzhnAbEVYWr0
         Oh/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OiecWRXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r28-20020a0cb29c000000b004704aa295e9si928280qve.566.2022.06.20.10.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OiecWRXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3La7-0005RW-59
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZo-0005Np-Co
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:40 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZm-0001JG-Is
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:40 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y6so10405994plg.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OR8FhoVyw4gtbkUIQHYT5bkd+xvaPMvkY5EgT+9fAqg=;
 b=OiecWRXxrP4zyXOjPSqdukKEwn4qOVJ4SgeWjGaigE9EHIYPbvpv8tSM3M/zBlKPvr
 Qik8+vIf9WOSdehOMV6MaUuu6U2QWgIVfzVCn7Poo1qarlJobLlYA4zwMBdQppkBQXaO
 bJeSOge0oIRfBZ9tMFrx0EC4ZiE35ktWSZuKtMX70LFhnzl94a7dtC9vVQ8ptknqNLX9
 qpGGtOjA4L5Lld6LZjOvNph4cbM8joxJeNuA2jEmpD4O/NnvZvz/p3bs15biSvBn+Ncj
 ZulfcLEsob1C3+C2vw16l65f5b6R2vlCrbochFsDZGw4w1AFBQf1yZPypoq9wWTW0oLF
 Y7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OR8FhoVyw4gtbkUIQHYT5bkd+xvaPMvkY5EgT+9fAqg=;
 b=dZjU++jeBvEMlcztn+dnh+3tC+ZIVD+e/Sy8ztp/6SKc+jN4iRR8Ev51XZPXE8pgpz
 ol9R5QusMqRlBuAfEhQGY14qg4ty6iVVD545CURJJ9DuoTyzmG0dGYLF5oG9S0YHykZN
 cjjSihgHVQag7ByHgm/nNjMmeCEYyFSfmAPdrx7XBu/R2Oir7c/FlLyfRfhUP/2ZJ2O5
 OB86BtX2Q4LtZFNoeyjndA6xCW+wJI95/DsgC0fDCvfwowZg1QM/eWSByfuTKioZq4RB
 8G9vBCgaGq9XBTrhVmG6XLUGlSWr5MsggOf3LBJ+GkEehZqQnXOTK/9gOc3RnywK19ff
 z6Sg==
X-Gm-Message-State: AJIora/Dl2+KOyIwi41DfIxjR1AFrlQlBIZmjvs/0FmhPl33yxgu0BXn
 p3eFo4pqRnBAAep1vn2lR5Ntgw==
X-Received: by 2002:a17:902:d4c4:b0:16a:2a8c:c4aa with SMTP id
 o4-20020a170902d4c400b0016a2a8cc4aamr4331579plg.138.1655747557074; 
 Mon, 20 Jun 2022 10:52:37 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/51] target/arm: Scalable Matrix Extension
Date: Mon, 20 Jun 2022 10:51:44 -0700
Message-Id: <20220620175235.60881-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDiWfd4Jf6V7

Changes for v3:
  * Rebase on mainline (20 patches upstreamed; new conflicts resolved).
  * Test bit 31 before disas_sme.

The first 21 patches, excepting 17, have been reviewed.


r~


Richard Henderson (51):
  target/arm: Implement TPIDR2_EL0
  target/arm: Add SMEEXC_EL to TB flags
  target/arm: Add syn_smetrap
  target/arm: Add ARM_CP_SME
  target/arm: Add SVCR
  target/arm: Add SMCR_ELx
  target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
  target/arm: Add PSTATE.{SM,ZA} to TB flags
  target/arm: Add the SME ZA storage to CPUARMState
  target/arm: Implement SMSTART, SMSTOP
  target/arm: Move error for sve%d property to arm_cpu_sve_finalize
  target/arm: Create ARMVQMap
  target/arm: Generalize cpu_arm_{get,set}_vq
  target/arm: Generalize cpu_arm_{get,set}_default_vec_len
  target/arm: Move arm_cpu_*_finalize to internals.h
  target/arm: Unexport aarch64_add_*_properties
  target/arm: Add cpu properties for SME
  target/arm: Introduce sve_vqm1_for_el_sm
  target/arm: Add SVL to TB flags
  target/arm: Move pred_{full,gvec}_reg_{offset,size} to translate-a64.h
  target/arm: Add infrastructure for disas_sme
  target/arm: Trap AdvSIMD usage when Streaming SVE is active
  target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
  target/arm: Implement SME ZERO
  target/arm: Implement SME MOVA
  target/arm: Implement SME LD1, ST1
  target/arm: Export unpredicated ld/st from translate-sve.c
  target/arm: Implement SME LDR, STR
  target/arm: Implement SME ADDHA, ADDVA
  target/arm: Implement FMOPA, FMOPS (non-widening)
  target/arm: Implement BFMOPA, BFMOPS
  target/arm: Implement FMOPA, FMOPS (widening)
  target/arm: Implement SME integer outer product
  target/arm: Implement PSEL
  target/arm: Implement REVD
  target/arm: Implement SCLAMP, UCLAMP
  target/arm: Reset streaming sve state on exception boundaries
  target/arm: Enable SME for -cpu max
  linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
  linux-user/aarch64: Reset PSTATE.SM on syscalls
  linux-user/aarch64: Add SM bit to SVE signal context
  linux-user/aarch64: Tidy target_restore_sigframe error return
  linux-user/aarch64: Do not allow duplicate or short sve records
  linux-user/aarch64: Verify extra record lock succeeded
  linux-user/aarch64: Move sve record checks into restore
  linux-user/aarch64: Implement SME signal handling
  linux-user: Rename sve prctls
  linux-user/aarch64: Implement PR_SME_GET_VL, PR_SME_SET_VL
  target/arm: Only set ZEN in reset if SVE present
  target/arm: Enable SME for user-only
  linux-user/aarch64: Add SME related hwcap entries

 docs/system/arm/cpu-features.rst  |   56 ++
 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   56 +-
 target/arm/cpregs.h               |    5 +
 target/arm/cpu.h                  |   95 ++-
 target/arm/helper-sme.h           |  146 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   19 +
 target/arm/internals.h            |    4 +
 target/arm/syndrome.h             |   14 +
 target/arm/translate-a64.h        |   53 ++
 target/arm/translate.h            |   14 +
 target/arm/sme-fa64.decode        |   89 +++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   31 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  242 +++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   34 +-
 target/arm/cpu64.c                |  216 ++++--
 target/arm/helper.c               |  276 ++++++-
 target/arm/kvm64.c                |    2 +-
 target/arm/machine.c              |   34 +
 target/arm/sme_helper.c           | 1174 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  141 +++-
 target/arm/translate-sme.c        |  353 +++++++++
 target/arm/translate-sve.c        |  283 +++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    1 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    4 +
 34 files changed, 3367 insertions(+), 197 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/sme_helper.c
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1

