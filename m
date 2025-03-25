Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2398212njc;
        Mon, 24 Mar 2025 22:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX176W3NLdecOT1hQuXzPMtxZpqDB8wkOOungvH89cORT1qQznR+eSplkLNmD+mO4fYxILhZjlbKxhWbw==@linaro.org
X-Received: by 2002:a05:6a21:328d:b0:1f5:837b:186a with SMTP id adf61e73a8af0-1fe42f2a2bemr25238369637.6.1742878949822;
        Mon, 24 Mar 2025 22:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878949; cv=none;
        d=google.com; s=arc-20240605;
        b=X4IIBpHYPmZru6dYlT7YpytPf7aTKDidaFXMwpseTRhaNrcXVWqHa7yRRMsDa2cQ5+
         4RmdZmvnta/f8DDoa/7t8IyPwFGy7yjIRo5oN7+YbtoH28KBlZShnqJK3d9jtDga5ip9
         EbAsnbS+2OUPIKBSki8xir6JmY9ZHPr+Ij8c4DhcAOZszNk992EayR5E2+enR839ensi
         G7Pz/yG5QaOcDSsIQWBK4cLQq5hDoc4o1mcerS0WEkZu7aBG2bB3kyMuZ8p84GtCkwpU
         6EisVq7TLi8YMe08nR5gMG0yRNl9evFm75oKw7MY9Tsv/eOjhrFgzjPLHGjZYpzRTdlj
         znbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FSkK1pVlIQ90IOYriLYzvQIUmiARXrgAYP7wsctpyMM=;
        fh=LZ0P21/xnKZPtipyiwpIK4oRLhiA4+EVJqML8CFxUlY=;
        b=Q+wgfveN7D6ETbWaDLPO4kgSb2AciGeJL2e0L5wFykHGjXPU+OKQHcDZzLVCk/xYj5
         PUalRVjBKVbT7Fw0JgzJgx7efWUIHeKOcs2F7ieZc8w///D65FGHJRIh0BpoES0M3HkQ
         i5dWUr8+4GSQGxKi3neboLc50HX0wPjAdc5WLsFBYV8/4CAl1aspziMMbfgnPk9byayX
         F4rslXPA45+oAEuoliutkDLjJGx1GATytzIre+I5Ju/oxScXecbebd2EojJ7PBD0L72f
         ae3GVUmLXnAXHjn0x2X2NQPJvoufaThoKZhlkyhWbxyXwn46F445lYbetJ0kxCWspMOU
         rq2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F63JPKYL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2418adesor5997169a12.0.2025.03.24.22.02.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 22:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F63JPKYL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878949; x=1743483749; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FSkK1pVlIQ90IOYriLYzvQIUmiARXrgAYP7wsctpyMM=;
        b=F63JPKYLyeLRWSsgNRl4xKXnBqFhvXsB3kxmVZlWaQ+/tH0/triT5gEc4HbNmWD3w/
         qAu+onGCjPxGb9nd6plz2dKAsBMWmZIyUtZ0jZcAxGIm0DTn5cCiXVaE4u6UiwqfIgb9
         Nw2jk+kCUO7t9M8hLrWsOcNzgFCr/XgdZI35xi/UzJpme5h0XvX9yMLoq2pyw9SYaEp2
         R2faKUKGbSP9gDXrv7wnrPRKlsiHSPd5Ynd04NsjT0KR3pJCf5cNRS6KgzMZcDjSNsrq
         xCG5lL4fl5Eaq34Fqj9DiUtO5cBcKx2sH5+RFBXdB0p/kNYIQ2IT1khg2nU9RYl1gNCK
         /3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878949; x=1743483749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSkK1pVlIQ90IOYriLYzvQIUmiARXrgAYP7wsctpyMM=;
        b=rWH2mcWpDFlMb7f/Kvb1CL+OQGepJXB343YMunTfM0wf37LcW3VluvYBzXJGNGW/by
         holqkderAShOvm7kGKkxQcoa4srEpAkdesx4LTv82T7tzGnxlC0WjVFEskL/Rq0/51Hl
         v1tbcHG70hWxF/RSYvJ8iGUv5uOLvLyRC3W/GtKiNa4baoD3b/r9l1N9fF/INM5yOj+e
         44nBiwd2ldFjxgKHKZDD27D3LX0mFrfgAE4LjIsWfGbxC7laYbq4yzbn8MyjcUL2wMs+
         /Z7GuprfRZOK/MT23+Y4VZJIMdiYOYgstVq7ymvzHDycY1LWzGKY1JYJtjXuho1Mu2KG
         PfYg==
X-Forwarded-Encrypted: i=1; AJvYcCVHZ29tJFVh9DTHqLH5bju/4f/54YcTlaWnIE+OivhdTir9PJE3k3UxjoR0PbvC3hY3nkOLDFpphoUPnw==@linaro.org
X-Gm-Message-State: AOJu0YzwQlznwW8so281BF7C8J/ARM7gDeY21M3JuIFYQ4FLBcD7iRzm
	+wkNbB+kG1FWnAqvA/dekG0GoMJzSBuCjWqcQ05oimxJ2koX0faFN3yViGUsuH+0Dg==
X-Gm-Gg: ASbGncutV1vF2um0pqlCzE7iCif+/8SE6786kcn/PN4UZsOWRuwqq+ZypxEO2RUmzcW
	1UtV4486MORNcCW2hTJFs7h1aTwXI8nxd6gXvqZsQk1t6agnfPzPTFIckWo7rMuQ/6YjcxFPf1M
	1EgDHKeXzbY4uWaZMVvk6BCIzRC8TKe9nzd8jeUaTuyk3YQIll5RRFc0HbZtAUKYb6T39tBTKj4
	bqzoHLJih3jIZh2VyE2ZQLLMxPWkIStowHaQiAfVKQesnsbe3cGD/1Sj27bwXr+RXSkk3TX/PgF
	fzJ5c+h14qgVrsGJtvF+3VrgA39FcNrrrvS5wM39RldE3CdxZcKCjK6SPA==
X-Google-Smtp-Source: AGHT+IG4fXECw7jdl4pHFgQDoj1ZZtSQzXC0c5uSzl6JSWqu/O+Fq85hZ3nWtrQ71VsLszlyMeItbA==
X-Received: by 2002:a05:6a20:938a:b0:1f5:7280:1cf7 with SMTP id adf61e73a8af0-1fe42f35c9amr28385159637.16.1742878949133;
        Mon, 24 Mar 2025 22:02:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a23634sm8069953a12.60.2025.03.24.22.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 22:02:28 -0700 (PDT)
Message-ID: <46e65883-d430-4c2a-8249-75d91153f154@linaro.org>
Date: Mon, 24 Mar 2025 22:02:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] single-binary: start make hw/arm/ common
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6ya3986drZ17

On 3/24/25 21:58, Pierrick Bouvier wrote:
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
> v3:
> - rebase on top of Richard series and master
> - BSWAP_NEEDED commit was already merged
> - Update description for commits removing kvm related headers
> 
> Pierrick Bouvier (29):
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
>   include/exec/{cpu-all.h => tlb-flags.h} |  26 +-----
>   include/hw/core/cpu.h                   |   2 +-
>   include/qemu/bswap.h                    |   2 +-
>   include/system/kvm.h                    |   2 -
>   linux-user/qemu.h                       |   3 +
>   linux-user/sparc/target_syscall.h       |   2 +
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
>   cpu-target.c                            |   5 +
>   hw/alpha/dp264.c                        |   1 +
>   hw/alpha/typhoon.c                      |   1 +
>   hw/arm/armv7m.c                         |   8 +-
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
>   hw/ppc/mac_newworld.c                   |   1 +
>   hw/ppc/mac_oldworld.c                   |   1 +
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
>   hw/sparc/sun4m.c                        |   1 +
>   hw/sparc64/sun4u.c                      |   1 +
>   hw/xtensa/pic_cpu.c                     |   1 +
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
>   133 files changed, 286 insertions(+), 169 deletions(-)
>   rename include/exec/{cpu-all.h => tlb-flags.h} (84%)
> 

Patches needing review:
- [PATCH v3 16/29] exec/target_page: runtime defintion for 
TARGET_PAGE_BITS_MIN
- [PATCH v3 19/29] target/arm/cpu: always define kvm related registers

This patch concerning meson build system as well:
- [PATCH v3 23/29] meson: add common hw files

Regards,
Pierrick
