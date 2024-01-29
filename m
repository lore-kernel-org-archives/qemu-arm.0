Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp296341ejk;
        Mon, 29 Jan 2024 08:45:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX3ac2x0JaNx9wzo0Hl4Skwt1uko2pBQfgtLgKhlrzbIR/lHKrX04QCif3GKTbIpWX5DZq
X-Received: by 2002:a05:622a:1906:b0:42a:7092:c19b with SMTP id w6-20020a05622a190600b0042a7092c19bmr7717989qtc.83.1706546726945;
        Mon, 29 Jan 2024 08:45:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546726; cv=pass;
        d=google.com; s=arc-20160816;
        b=FYdCCEmzAFN2coyF2DJs7aq8W1NINwgPuS1WFg3qz+lihYUKGs5ozV+ydYlMPi3E1X
         YFibn+FNMTXI28f0/8XP/sWtslpBsWNdzsYoNlIfbd2OKk/AJhZbTdUj/GslfmbqV9Qy
         DwE7G4KL3ntvj8SgtFXWzpx77UZrjbX3uoX0a0U8TwOHAtE/rBdD2l+rggCjvQ+nsNbU
         2Grf0Uh2oLV/x7oLsvAydLQFPbyv33xrpHZKIDpW6lPDWqB3Ca/vtuhNjdyRYPJBaa3N
         XY3oraQfak2xWyi+HhaP1RPrh0fClWcEmAd+gafUQB/pctlSs/YwncT49O0wwdXVAmKf
         BcRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vCVqY5ZcbrGcwmGrIjNGNkPRiID4RQmsjfpymlfmglw=;
        fh=7K9i0j/AOf8D4mzk94OEUEfvrz+Iir3hBGSXXaZzHJo=;
        b=AxiQVpwJG6WPCCQMvLUZeRmrEOZ0OfaPIMDTYcZ/VXRlctP4Jhe+uhWDQDKayWMnbq
         hTwum7Xo+lsJ/cvLTdegp569Nl2iiKZ1nZX8n/sIvJukVlkLNgnSFCq8u30ZFxH2nGc9
         gQlIjWb3W1utoqJzdCOAX72EfzNmDq70Cf1/WsEHM3hHxP+EprvzCA+J2IxX51sYw90f
         OAaEAdIDfs4KTv/7m6JdPOK3t0eFzqJDVLrwSpoUDGd62j/1JKxRLrRT2IawMD+0hPZu
         /lMkyuuY4H7Q1EPaFOfjZLjaaMtI+vGEMgtCFN1XH73MlyPCEa2fKu1DXrF94RoCGcP6
         0drw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DgtAGAmM;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7346-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7346-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7346-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id z11-20020a05622a060b00b0042a5461b0fbsi7947772qta.353.2024.01.29.08.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:45:26 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7346-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DgtAGAmM;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7346-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7346-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DCB51C22913
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F64A156989;
	Mon, 29 Jan 2024 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DgtAGAmM"
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA377156996
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546721; cv=none; b=alpfWKgCSvHEKnJ2xgBPdE3X8vVvI1Emb/r6ncR40I+sOYPkycWrP+2PVOuj8BE4XzuGTl+sjjYoeyNn69Zy82Tw/U5PKDDnkJu90CmjwblSFvkFFcukiCcu5pDKf03V0my0Ux957R9CFxcX9bFLgtG1FH3+VQeM1OxFYlrGcX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546721; c=relaxed/simple;
	bh=RIfW6HAfeD1AWJka7aqBCPfpnkNLE3rE8Y4wLoxJV/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PTIQ1pBAQUf8Mep0FmlaV7+SgYlKnFKYtojsJxNTCB19WlbhUrGLX+X5k9oClzoqLbWgd4xotx515eUDlPY7YMoHYdQubN1djoAqqW6NWKpdMlCYoWVxlXX7S6W5gIVKK/Zgw7iihQhzp0T97SxezRk4B5SqKf+tasgwEuZYPFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DgtAGAmM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3394b892691so1648737f8f.1
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546718; x=1707151518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCVqY5ZcbrGcwmGrIjNGNkPRiID4RQmsjfpymlfmglw=;
        b=DgtAGAmM67XZhjnFQoSAGVDsXuCCE0WzYIGmccJx+tbMh/wbnPUe5kLsMSzifv9utX
         +nFBhQ/qQJIX8gqukhcYNt+8cDLivWTX2LOuRMwhJTKv6FZn8WxhrGPWMfmNxYZsAKfG
         G1Ic9Ch+WxLnKVkV8ug6iUyzFK7VXfuCEbfCZeF3eJqj7xn6ZSxzmBne/x+BJBsciCoL
         BAZh7sQRBtJ3rJPfnzOR14wTXnjAVL5D59lj5pNCpBosc8r4ediszbR3R7x/Kcr4Q/pS
         C+tVCquje7obNobQETGVy607KS711M3gs3jQnnONMfQReBL25pyNGBdySA7HjhT/lc1Q
         251g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546718; x=1707151518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCVqY5ZcbrGcwmGrIjNGNkPRiID4RQmsjfpymlfmglw=;
        b=rTcxB7x2Dfb9dUvmzWKgPekDuYjGIRW45S0Hna3SKWR+vrvBSBKcRBN0GDvTfrBUUv
         EKbSyK4tVDrNoJ55UAtpLZxDa8gVp/BFJaVTNU7fP9CZmPKTl1kfj4S4dGqyFBlvdpux
         XNNyQ2nFMahgJ9wJH+UkxktLY6gnI0q76PsDhPIBK9SZ69tAQ7dKiOC2/tFKZlrYnz0L
         8ve8qoPniDMKtyzGTkGLAc2QxkMiHqhKd9p+JVeuOtD26AzR4nussdlcjwn1KnZD/BJ9
         cJlme+1zTcfbcL8K4B+LyriMtrl95VsMV+ULm+xwzlpVRSEQg8aRGr/sXMfMjTDqN6Cv
         qpSQ==
X-Gm-Message-State: AOJu0Ywjx7JaF33AgjqcxJbp9/VcJjAl5z9fvBmzm9Nj/StKizdM0tJh
	KQJiboehCwPxgcLCq1+j2ToDsQDrvpqneGss4aErlWWeUniZwd5FaN7LbRSrpMM=
X-Received: by 2002:a05:6000:70c:b0:33a:eb5a:8d00 with SMTP id bs12-20020a056000070c00b0033aeb5a8d00mr3477025wrb.26.1706546718105;
        Mon, 29 Jan 2024 08:45:18 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id y3-20020a5d6203000000b0033ae4df3cf4sm6096969wru.40.2024.01.29.08.45.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:45:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/29] hw,target: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:44:42 +0100
Message-ID: <20240129164514.73104-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: FjmMQaakjmev

Patches missing review: 1, 2, 5, 6, 8, 11, 14, 15, 29

It will be simpler if I get the whole series via my hw-cpus
tree once fully reviewed.

Since v2:
- Rebased
- bsd/linux-user
- Preliminary clean cpu_reset_hold
- Add R-b

Since v1:
- Avoid CPU() cast (Paolo)
- Split per targets (Thomas)

Use cpu_env() -- which is fast path -- when possible.
Bulk conversion using Coccinelle spatch (script included).

Philippe Mathieu-Daudé (29):
  bulk: Access existing variables initialized to &S->F when available
  hw/core: Declare CPUArchId::cpu as CPUState instead of Object
  hw/acpi/cpu: Use CPUState typedef
  bulk: Call in place single use cpu_env()
  scripts/coccinelle: Add cpu_env.cocci script
  target: Replace CPU_GET_CLASS(cpu -> obj) in cpu_reset_hold() handler
  target/alpha: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/arm: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/avr: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/cris: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/hexagon: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/hppa: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/i386/hvf: Use CPUState typedef
  target/i386: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/loongarch: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/m68k: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/microblaze: Prefer fast cpu_env() over slower CPU QOM cast
    macro
  target/mips: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/nios2: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/openrisc: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/ppc: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/riscv: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/rx: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/s390x: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/sh4: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/sparc: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/tricore: Prefer fast cpu_env() over slower CPU QOM cast macro
  target/xtensa: Prefer fast cpu_env() over slower CPU QOM cast macro
  user: Prefer fast cpu_env() over slower CPU QOM cast macro

 MAINTAINERS                             |   1 +
 scripts/coccinelle/cpu_env.cocci        | 100 ++++++++++++++++++++++++
 include/hw/acpi/cpu.h                   |   2 +-
 include/hw/boards.h                     |   2 +-
 target/i386/hvf/vmx.h                   |  13 +--
 target/i386/hvf/x86.h                   |  26 +++---
 target/i386/hvf/x86_descr.h             |  14 ++--
 target/i386/hvf/x86_emu.h               |   4 +-
 target/i386/hvf/x86_mmu.h               |   6 +-
 accel/tcg/cpu-exec.c                    |   3 +-
 bsd-user/signal.c                       |   3 +-
 hw/core/machine.c                       |   4 +-
 hw/display/ati.c                        |   2 +-
 hw/i386/fw_cfg.c                        |   3 +-
 hw/i386/vmmouse.c                       |   6 +-
 hw/i386/x86.c                           |   2 +-
 hw/i386/xen/xen-hvm.c                   |   3 +-
 hw/intc/arm_gicv3_cpuif.c               |   7 +-
 hw/intc/arm_gicv3_cpuif_common.c        |   5 +-
 hw/loongarch/virt.c                     |   2 +-
 hw/misc/macio/pmu.c                     |   2 +-
 hw/misc/pvpanic-pci.c                   |   2 +-
 hw/pci-bridge/cxl_root_port.c           |   2 +-
 hw/ppc/mpc8544_guts.c                   |   3 +-
 hw/ppc/pnv.c                            |  23 +++---
 hw/ppc/pnv_xscom.c                      |   5 +-
 hw/ppc/ppce500_spin.c                   |   3 +-
 hw/ppc/spapr.c                          |   8 +-
 hw/ppc/spapr_caps.c                     |   7 +-
 hw/s390x/s390-virtio-ccw.c              |   2 +-
 hw/virtio/vhost-user-gpio.c             |   8 +-
 hw/virtio/vhost-user-scmi.c             |   6 +-
 hw/virtio/virtio-pci.c                  |   2 +-
 hw/xen/xen_pt.c                         |   6 +-
 linux-user/i386/cpu_loop.c              |   4 +-
 linux-user/signal.c                     |   6 +-
 migration/multifd-zlib.c                |   2 +-
 target/alpha/cpu.c                      |  31 ++------
 target/alpha/gdbstub.c                  |   6 +-
 target/alpha/helper.c                   |  15 ++--
 target/alpha/mem_helper.c               |  11 +--
 target/alpha/translate.c                |   4 +-
 target/arm/cpu.c                        |  37 ++++-----
 target/arm/debug_helper.c               |   8 +-
 target/arm/gdbstub.c                    |   6 +-
 target/arm/gdbstub64.c                  |   6 +-
 target/arm/helper.c                     |   9 +--
 target/arm/hvf/hvf.c                    |  12 +--
 target/arm/kvm.c                        |   5 +-
 target/arm/machine.c                    |   6 +-
 target/arm/ptw.c                        |   3 +-
 target/arm/tcg/cpu32.c                  |   4 +-
 target/arm/tcg/translate.c              |   3 +-
 target/avr/cpu.c                        |  29 ++-----
 target/avr/gdbstub.c                    |   6 +-
 target/avr/helper.c                     |  10 +--
 target/avr/translate.c                  |   3 +-
 target/cris/cpu.c                       |  12 +--
 target/cris/gdbstub.c                   |   9 +--
 target/cris/helper.c                    |  12 +--
 target/cris/translate.c                 |   6 +-
 target/hexagon/cpu.c                    |  27 ++-----
 target/hexagon/gdbstub.c                |   6 +-
 target/hppa/cpu.c                       |   8 +-
 target/hppa/int_helper.c                |   8 +-
 target/hppa/mem_helper.c                |   6 +-
 target/hppa/translate.c                 |   3 +-
 target/i386/arch_dump.c                 |  11 +--
 target/i386/arch_memory_mapping.c       |   3 +-
 target/i386/cpu-dump.c                  |   3 +-
 target/i386/cpu.c                       |  51 +++++-------
 target/i386/helper.c                    |  42 +++-------
 target/i386/hvf/hvf.c                   |   8 +-
 target/i386/hvf/x86.c                   |  30 ++++---
 target/i386/hvf/x86_descr.c             |   8 +-
 target/i386/hvf/x86_emu.c               |   6 +-
 target/i386/hvf/x86_mmu.c               |  14 ++--
 target/i386/hvf/x86_task.c              |  10 +--
 target/i386/hvf/x86hvf.c                |  11 +--
 target/i386/kvm/kvm.c                   |   6 +-
 target/i386/kvm/xen-emu.c               |  32 +++-----
 target/i386/nvmm/nvmm-all.c             |   6 +-
 target/i386/tcg/sysemu/bpt_helper.c     |   3 +-
 target/i386/tcg/sysemu/excp_helper.c    |   3 +-
 target/i386/tcg/tcg-cpu.c               |  14 +---
 target/i386/tcg/user/excp_helper.c      |   6 +-
 target/i386/tcg/user/seg_helper.c       |   3 +-
 target/i386/whpx/whpx-all.c             |  18 ++---
 target/loongarch/cpu.c                  |  41 +++-------
 target/loongarch/gdbstub.c              |   6 +-
 target/loongarch/kvm/kvm.c              |  41 +++-------
 target/loongarch/tcg/tlb_helper.c       |   6 +-
 target/loongarch/tcg/translate.c        |   3 +-
 target/m68k/cpu.c                       |  37 +++------
 target/m68k/gdbstub.c                   |   6 +-
 target/m68k/helper.c                    |   8 +-
 target/m68k/m68k-semi.c                 |   6 +-
 target/m68k/op_helper.c                 |  11 +--
 target/m68k/translate.c                 |   3 +-
 target/microblaze/cpu.c                 |   6 +-
 target/microblaze/gdbstub.c             |   3 +-
 target/microblaze/helper.c              |   3 +-
 target/microblaze/translate.c           |   6 +-
 target/mips/cpu.c                       |  17 ++--
 target/mips/gdbstub.c                   |   6 +-
 target/mips/kvm.c                       |  27 +++----
 target/mips/sysemu/physaddr.c           |   3 +-
 target/mips/tcg/exception.c             |   3 +-
 target/mips/tcg/op_helper.c             |   8 +-
 target/mips/tcg/sysemu/special_helper.c |   3 +-
 target/mips/tcg/sysemu/tlb_helper.c     |   6 +-
 target/mips/tcg/translate.c             |   3 +-
 target/nios2/cpu.c                      |  17 +---
 target/nios2/helper.c                   |   3 +-
 target/nios2/nios2-semi.c               |   6 +-
 target/nios2/translate.c                |   3 +-
 target/openrisc/cpu.c                   |   8 +-
 target/openrisc/gdbstub.c               |   6 +-
 target/openrisc/interrupt.c             |   6 +-
 target/openrisc/translate.c             |   6 +-
 target/ppc/cpu_init.c                   |  23 +++---
 target/ppc/excp_helper.c                |   3 +-
 target/ppc/gdbstub.c                    |  12 +--
 target/ppc/kvm.c                        |  20 ++---
 target/ppc/ppc-qmp-cmds.c               |   3 +-
 target/ppc/user_only_helper.c           |   3 +-
 target/riscv/arch_dump.c                |   6 +-
 target/riscv/cpu.c                      |  19 ++---
 target/riscv/cpu_helper.c               |  19 ++---
 target/riscv/debug.c                    |   9 +--
 target/riscv/gdbstub.c                  |   6 +-
 target/riscv/kvm/kvm-cpu.c              |  11 +--
 target/riscv/tcg/tcg-cpu.c              |  10 +--
 target/riscv/translate.c                |   6 +-
 target/rx/cpu.c                         |   6 +-
 target/rx/gdbstub.c                     |   6 +-
 target/rx/helper.c                      |   6 +-
 target/rx/translate.c                   |   6 +-
 target/s390x/cpu-dump.c                 |   3 +-
 target/s390x/gdbstub.c                  |   6 +-
 target/s390x/helper.c                   |   3 +-
 target/s390x/kvm/kvm.c                  |   6 +-
 target/s390x/tcg/excp_helper.c          |  11 +--
 target/s390x/tcg/misc_helper.c          |   4 +-
 target/s390x/tcg/translate.c            |   3 +-
 target/sh4/cpu.c                        |  22 ++----
 target/sh4/gdbstub.c                    |   6 +-
 target/sh4/helper.c                     |  14 +---
 target/sh4/op_helper.c                  |   4 +-
 target/sh4/translate.c                  |   6 +-
 target/sparc/cpu.c                      |  21 ++---
 target/sparc/gdbstub.c                  |   3 +-
 target/sparc/int32_helper.c             |   3 +-
 target/sparc/int64_helper.c             |   3 +-
 target/sparc/ldst_helper.c              |   6 +-
 target/sparc/mmu_helper.c               |  15 ++--
 target/sparc/translate.c                |   9 +--
 target/tricore/cpu.c                    |  28 ++-----
 target/tricore/gdbstub.c                |   6 +-
 target/tricore/helper.c                 |   3 +-
 target/tricore/translate.c              |   3 +-
 target/xtensa/cpu.c                     |   9 +--
 target/xtensa/dbg_helper.c              |   3 +-
 target/xtensa/exc_helper.c              |   3 +-
 target/xtensa/gdbstub.c                 |   6 +-
 target/xtensa/helper.c                  |   9 +--
 target/xtensa/translate.c               |   6 +-
 167 files changed, 615 insertions(+), 998 deletions(-)
 create mode 100644 scripts/coccinelle/cpu_env.cocci

-- 
2.41.0

