Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1286514njc;
        Thu, 20 Mar 2025 15:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlERXk7qqKRnEX15VkBpaxngm8CZpzWFi1WlMYXHFTZ2yROHcTGjmvjysuS3KfBjW+e48u+jWkchrz1Q==@linaro.org
X-Received: by 2002:a17:903:320e:b0:224:23ab:b88b with SMTP id d9443c01a7336-22780c557a6mr12655885ad.8.1742510949325;
        Thu, 20 Mar 2025 15:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742510949; cv=none;
        d=google.com; s=arc-20240605;
        b=cotXVMZHIte0v4AgjyvW2xZV7hFBIWaQWUKS4ffknrBliTzwRAtk1WFIliaDvHEIvp
         RRvovE4YjR8NaDPgn5GcnC5fwEZwF5ywS+nBMOy8jlHPI7JxIEFKvCBPS2eEN3IsT9xm
         EgLw8kLAwbEP+SoM2IdhqpjFAjAdllWaS9TJD0LIotD9Jjs0e2zjF8MFwf3karnstKq1
         FqtLBf9mH5YwWnZrcLsbHAJIO6AicLPSi58/JXddduRyEd6X2DY8yCsib5dwW38JZOuK
         yoApTm+W8NJoa2LxFpR6Er1MNIGzUyL+tyImz2fxEzs4MU6m+kRzV8gZMH92mzoDaBrZ
         v51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DUl0JJOAWC6Np6+7L2wwmwznYFQPYtStKsZfNLj2wV0=;
        fh=I9RUXvSxesdaiPZPXq4NE6+Z+uE/aTAMPad4T3XyaTs=;
        b=RBPg/ukME84WeFJ4js0h3e/B3QgZ6AHhPjlUf7WLSC9mWVBtMmbB8AuoHlc1m2A7id
         7uRONZSUWYMUeUK8AdxDWsrTQIrxsRnDMUN7sNnxU6njEYULqEA4lKCqUDOZgvXBIgO3
         /Z3IGakhvggDDHa9eHz4Ttg6rcvawZfJKTyqoj7jzioMQL9aG3ger5dIPxL1jVqL+M+9
         a8mzxrKAYomNWU5x0pQFLfr0LoH7HFpy/wbQv8cFOO6mIF1s+TUBkOV0wM6zXFc+fX8o
         Oz5ZgvYcjkkNTgyyvrsQ3ANPOQUyEhjZNGYi+a+Pqp24lkEotONRqf0zxn1esjKVp8Dg
         1Hqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gl2wjFCv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f3b9d2sor3264425ad.4.2025.03.20.15.49.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gl2wjFCv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742510949; x=1743115749; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUl0JJOAWC6Np6+7L2wwmwznYFQPYtStKsZfNLj2wV0=;
        b=gl2wjFCvhdSYwcqWFtuobSA8iSgLhRY3SiX453V57kzxkXyMWL8HqgmFIZcfYHWZxy
         VABdEPU2XekqoyVG6E7+Bg3NOKivXJB2bZ1DxYmtK7pgnz4VE14m1fOS9I68U97EtNyw
         P8aAa8RZ6Xpz6qebz8EvlMqQ0LpNeUhJB9pNy2wwJ1Z7urlkWE9D4zzLUQrYDTg1/F7Z
         6HBySvF0CKqb6pyFWWHGxXixOlMGkh85CRZmx4+hnN3i+PvAaduMDE6zQRLN+RBUyCSF
         JCEHeuxjCWBtxwy6/DdH9TZR1MXOUc/o4dbjhgoR/Ee3jGOowSJnup9LPJ3wwy8WUFqK
         5NFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510949; x=1743115749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUl0JJOAWC6Np6+7L2wwmwznYFQPYtStKsZfNLj2wV0=;
        b=coe7BU588DdEJ8Bw3GuhR2RXenokVc1L+f9EjXOG6M4Gwg/RhO1b1Kq0uqvmbXOyjw
         TsxzmCkRGnoRoAocttNPZFR9kkR0owk4MjP17E9uNIoDXpwg/cYyCBevhoumv9Gtx+e3
         gdGwZDZypcpZ1BtXqrVQFiJ1tdsCseJPGpSKPccYuayXf+IQqFHMIn3SjFMQyGqsQVHf
         FmYs2F9zkWYxxq7ov4i7IaMiL5TuRqY28V0sSPA5mMyeJ8oJz4wIC5opy7NAguecmuJo
         UnH+vrYc/OuoPMEsvDXUAp7woMQOnpbFrD7KbCBru6Y2naTaztRv8NNxHiNXQuoMH8rT
         haDg==
X-Forwarded-Encrypted: i=1; AJvYcCUGUZY32RxK+Uj2aie8gSwvWz4Jr73ufPa08hPSAzqoz96CZ3VhWxL0WUWqw66xiMn9gyRsQuayS5HbnA==@linaro.org
X-Gm-Message-State: AOJu0YxREUBntbhoWlRncPr2iJmmg5kumIKOGA+vG5EuW5CuuUos/FTN
	PcPF0WxpXzqMjvyXb0rZUKSEeoNdrb6js7cycTNNifqpPIiiMfiWLxT7AVk4ZgLqMQ==
X-Gm-Gg: ASbGncvyLOF7X6f166rrGGvK6U82kL/DIO4dzYREVEYQATiVCenf4chOkOZO9P15te9
	nkn4R5P2UJahW4PephDu19bzFIMW10kNjc5yndMY0hb4QUzVyMnLg4tt376gIVB1QuYxtI4So6l
	xl1BG5vIq9WdU44HTfccGvj0mm64A++LSf7hWqU638jk8eoiqFWUnjNjH0tP+DhDwkahzF/YSuc
	RhHCECZLvguZAReINlZoRCgeladXeUR4mYEqESQr+V+GeALO0xLjbq66DP8RmkKbEgsiTCDnm1W
	J+4A/5nSVi3Q1jjoiECnHq2ZJwuUlg03ph/WdElloTaknd6nWbULjxIxaA==
X-Google-Smtp-Source: AGHT+IE8LLmohCWT2OM79Ks/Gq6iUQEWxb5HMBUe5lAqyFpMafS7tISb53AHsVvLi0PowRFtPDy4Pg==
X-Received: by 2002:a17:903:40cb:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22780c5570dmr16516475ad.9.1742510948798;
        Thu, 20 Mar 2025 15:49:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da2eesm3395725ad.172.2025.03.20.15.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:49:07 -0700 (PDT)
Message-ID: <2f5703db-5ee4-4790-9301-e81ee7d79279@linaro.org>
Date: Thu, 20 Mar 2025 15:49:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/30] single-binary: start make hw/arm/ common
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IV/GYzjKf8mi

On 3/20/25 15:29, Pierrick Bouvier wrote:
> This series focuses on removing compilation units duplication in hw/arm. We
> start with this architecture because it should not be too hard to transform it,
> and should give us some good hints on the difficulties we'll meet later.
> 
> We first start by making changes in global headers to be able to not rely on
> specific target defines. In particular, we completely remove cpu-all.h.
> We then focus on removing those defines from target/arm/cpu.h.
> 
>  From there, we modify build system to create a new hw common library (per base
> architecture, "arm" in this case), instead of compiling the same files for every
> target.
> 
> Finally, we can declare hw/arm/boot.c, and most of the boards as common as a
> first step for this part.
> 
> - Based-on: 20250317183417.285700-1-pierrick.bouvier@linaro.org
> ("[PATCH v6 00/18] make system memory API available for common code")
> https://lore.kernel.org/qemu-devel/20250317183417.285700-1-pierrick.bouvier@linaro.org/
> - Based-on: 20250318213209.2579218-1-richard.henderson@linaro.org
> ("[PATCH v2 00/42] accel/tcg, codebase: Build once patches")
> https://lore.kernel.org/qemu-devel/20250318213209.2579218-1-richard.henderson@linaro.org
> 
> v2:
> - rebase on top of Richard series
> - add target include in hw_common lib
> - hw_common_lib uses -DCOMPILE_SYSTEM_VS_USER introduced by Richard series
> - remove cpu-all header
> - remove BSWAP_NEEDED define
> - new tlb-flags header
> - Cleanup i386 KVM_HAVE_MCE_INJECTION definition + move KVM_HAVE_MCE_INJECTION
> - remove comment about cs_base in target/arm/cpu.h
> - updated commit message about registers visibility between aarch32/aarch64
> - tried remove ifdefs in target/arm/helper.c but this resulted in more a ugly
>    result. So just comment calls for now, as we'll clean this file later.
> - make most of the boards in hw/arm common
> 
> Pierrick Bouvier (30):
>    exec/cpu-all: remove BSWAP_NEEDED
>    exec/cpu-all: extract tlb flags defines to exec/tlb-flags.h
>    exec/cpu-all: move cpu_copy to linux-user/qemu.h
>    include/exec/cpu-all: move compile time check for CPUArchState to
>      cpu-target.c
>    exec/cpu-all: remove system/memory include
>    exec/cpu-all: remove exec/page-protection include
>    exec/cpu-all: remove tswap include
>    exec/cpu-all: remove exec/cpu-interrupt include
>    exec/cpu-all: remove exec/cpu-defs include
>    exec/cpu-all: remove exec/target_page include
>    exec/cpu-all: remove hw/core/cpu.h include
>    accel/tcg: fix missing includes for TCG_GUEST_DEFAULT_MO
>    accel/tcg: fix missing includes for TARGET_HAS_PRECISE_SMC
>    exec/cpu-all: remove cpu include
>    exec/cpu-all: transfer exec/cpu-common include to cpu.h headers
>    exec/cpu-all: remove this header
>    exec/target_page: runtime defintion for TARGET_PAGE_BITS_MIN
>    accel/kvm: move KVM_HAVE_MCE_INJECTION define to kvm-all.c
>    exec/poison: KVM_HAVE_MCE_INJECTION can now be poisoned
>    target/arm/cpu: always define kvm related registers
>    target/arm/cpu: flags2 is always uint64_t
>    target/arm/cpu: define same set of registers for aarch32 and aarch64
>    target/arm/cpu: remove inline stubs for aarch32 emulation
>    meson: add common hw files
>    hw/arm/boot: make compilation unit hw common
>    hw/arm/armv7m: prepare compilation unit to be common
>    hw/arm/digic_boards: prepare compilation unit to be common
>    hw/arm/xlnx-zynqmp: prepare compilation unit to be common
>    hw/arm/xlnx-versal: prepare compilation unit to be common
>    hw/arm: make most of the compilation units common
> 
>   meson.build                             |  37 +++++++-
>   accel/tcg/internal-target.h             |   1 +
>   accel/tcg/tb-internal.h                 |   1 -
>   hw/s390x/ipl.h                          |   2 +
>   include/exec/cpu_ldst.h                 |   1 +
>   include/exec/exec-all.h                 |   1 +
>   include/exec/poison.h                   |   4 +
>   include/exec/target_page.h              |   3 +
>   include/exec/{cpu-all.h => tlb-flags.h} |  38 +-------
>   include/hw/core/cpu.h                   |   2 +-
>   include/qemu/bswap.h                    |   2 +-
>   include/system/kvm.h                    |   2 -
>   linux-user/qemu.h                       |   3 +
>   linux-user/sparc/target_syscall.h       |   2 +
>   linux-user/syscall_defs.h               |   2 +-
>   target/alpha/cpu.h                      |   4 +-
>   target/arm/cpu.h                        |  40 ++------
>   target/arm/internals.h                  |   1 +
>   target/avr/cpu.h                        |   4 +-
>   target/hexagon/cpu.h                    |   3 +-
>   target/hppa/cpu.h                       |   5 +-
>   target/i386/cpu.h                       |   5 +-
>   target/i386/hvf/vmx.h                   |   1 +
>   target/loongarch/cpu.h                  |   4 +-
>   target/m68k/cpu.h                       |   4 +-
>   target/microblaze/cpu.h                 |   4 +-
>   target/mips/cpu.h                       |   4 +-
>   target/openrisc/cpu.h                   |   4 +-
>   target/ppc/cpu.h                        |   4 +-
>   target/ppc/mmu-hash32.h                 |   2 +
>   target/ppc/mmu-hash64.h                 |   2 +
>   target/riscv/cpu.h                      |   4 +-
>   target/rx/cpu.h                         |   4 +-
>   target/s390x/cpu.h                      |   4 +-
>   target/sh4/cpu.h                        |   4 +-
>   target/sparc/cpu.h                      |   4 +-
>   target/tricore/cpu.h                    |   3 +-
>   target/xtensa/cpu.h                     |   4 +-
>   accel/kvm/kvm-all.c                     |   5 +
>   accel/tcg/cpu-exec.c                    |   3 +-
>   accel/tcg/cputlb.c                      |   1 +
>   accel/tcg/tb-maint.c                    |   1 +
>   accel/tcg/translate-all.c               |   1 +
>   accel/tcg/user-exec.c                   |   2 +
>   bsd-user/elfload.c                      |   6 +-
>   cpu-target.c                            |   5 +
>   hw/alpha/dp264.c                        |   1 +
>   hw/alpha/typhoon.c                      |   1 +
>   hw/arm/armv7m.c                         |  12 ++-
>   hw/arm/boot.c                           |   2 +
>   hw/arm/digic_boards.c                   |   2 +-
>   hw/arm/smmuv3.c                         |   1 +
>   hw/arm/xlnx-versal.c                    |   2 -
>   hw/arm/xlnx-zynqmp.c                    |   2 -
>   hw/hppa/machine.c                       |   1 +
>   hw/i386/multiboot.c                     |   1 +
>   hw/i386/pc.c                            |   1 +
>   hw/i386/pc_sysfw_ovmf.c                 |   1 +
>   hw/i386/vapic.c                         |   1 +
>   hw/loongarch/virt.c                     |   1 +
>   hw/m68k/next-cube.c                     |   1 +
>   hw/m68k/q800.c                          |   1 +
>   hw/m68k/virt.c                          |   1 +
>   hw/openrisc/boot.c                      |   1 +
>   hw/pci-host/astro.c                     |   1 +
>   hw/ppc/e500.c                           |   1 +
>   hw/ppc/mac_newworld.c                   |   5 +-
>   hw/ppc/mac_oldworld.c                   |   5 +-
>   hw/ppc/ppc.c                            |   1 +
>   hw/ppc/ppc_booke.c                      |   1 +
>   hw/ppc/prep.c                           |   1 +
>   hw/ppc/spapr_hcall.c                    |   1 +
>   hw/ppc/spapr_ovec.c                     |   1 +
>   hw/riscv/riscv-iommu-pci.c              |   1 +
>   hw/riscv/riscv-iommu.c                  |   1 +
>   hw/s390x/s390-pci-bus.c                 |   1 +
>   hw/s390x/s390-pci-inst.c                |   1 +
>   hw/s390x/s390-skeys.c                   |   1 +
>   hw/sparc/sun4m.c                        |   7 +-
>   hw/sparc64/sun4u.c                      |   7 +-
>   hw/xtensa/pic_cpu.c                     |   1 +
>   linux-user/elfload.c                    |   8 +-
>   monitor/hmp-cmds-target.c               |   1 +
>   semihosting/uaccess.c                   |   2 +-
>   target/alpha/helper.c                   |   2 +
>   target/arm/gdbstub64.c                  |   1 +
>   target/arm/helper.c                     |   6 ++
>   target/arm/hvf/hvf.c                    |   1 +
>   target/arm/ptw.c                        |   1 +
>   target/arm/tcg/helper-a64.c             |   1 +
>   target/arm/tcg/hflags.c                 |   4 +-
>   target/arm/tcg/mte_helper.c             |   1 +
>   target/arm/tcg/sve_helper.c             |   1 +
>   target/arm/tcg/tlb-insns.c              |   1 +
>   target/avr/helper.c                     |   2 +
>   target/hexagon/translate.c              |   1 +
>   target/i386/arch_memory_mapping.c       |   1 +
>   target/i386/helper.c                    |   2 +
>   target/i386/hvf/hvf.c                   |   1 +
>   target/i386/kvm/hyperv.c                |   1 +
>   target/i386/kvm/kvm.c                   |   1 +
>   target/i386/kvm/xen-emu.c               |   1 +
>   target/i386/sev.c                       |   1 +
>   target/i386/tcg/system/excp_helper.c    |   2 +
>   target/i386/tcg/system/misc_helper.c    |   1 +
>   target/i386/tcg/system/tcg-cpu.c        |   1 +
>   target/i386/xsave_helper.c              |   1 +
>   target/loongarch/cpu_helper.c           |   1 +
>   target/loongarch/tcg/translate.c        |   1 +
>   target/m68k/helper.c                    |   1 +
>   target/microblaze/helper.c              |   1 +
>   target/microblaze/mmu.c                 |   1 +
>   target/mips/tcg/system/cp0_helper.c     |   1 +
>   target/mips/tcg/translate.c             |   1 +
>   target/openrisc/mmu.c                   |   1 +
>   target/ppc/excp_helper.c                |   1 +
>   target/ppc/mmu-book3s-v3.c              |   1 +
>   target/ppc/mmu-hash64.c                 |   1 +
>   target/ppc/mmu-radix64.c                |   1 +
>   target/riscv/cpu_helper.c               |   1 +
>   target/riscv/op_helper.c                |   1 +
>   target/riscv/pmp.c                      |   1 +
>   target/riscv/vector_helper.c            |   2 +
>   target/rx/cpu.c                         |   1 +
>   target/s390x/helper.c                   |   1 +
>   target/s390x/ioinst.c                   |   1 +
>   target/s390x/tcg/mem_helper.c           |   1 +
>   target/sparc/ldst_helper.c              |   1 +
>   target/sparc/mmu_helper.c               |   2 +
>   target/tricore/helper.c                 |   1 +
>   target/xtensa/helper.c                  |   1 +
>   target/xtensa/mmu_helper.c              |   1 +
>   target/xtensa/op_helper.c               |   1 +
>   target/xtensa/xtensa-semi.c             |   1 +
>   tcg/tcg-op-ldst.c                       |   2 +-
>   hw/arm/meson.build                      | 117 ++++++++++++------------
>   136 files changed, 302 insertions(+), 205 deletions(-)
>   rename include/exec/{cpu-all.h => tlb-flags.h} (78%)
> 

This series has been built for:
- Linux x64 and arm64 host
- MacOS x64 and arm64 host
- Windows x64 host
All tests have been ran on linux x64 host.
https://github.com/pbo-linaro/qemu/actions/runs/13977201084/
