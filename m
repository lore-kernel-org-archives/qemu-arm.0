Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp172939ejv;
        Tue, 7 Nov 2023 00:51:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVOFW9/yZj2x8EPdh/ZxlEpERxr0Nm6kk3l+3JswXDNaUpJqsO59MNHTtbmbn2NDyodlJK
X-Received: by 2002:a17:903:41c6:b0:1c9:9fa6:ce5b with SMTP id u6-20020a17090341c600b001c99fa6ce5bmr2731272ple.16.1699347080083;
        Tue, 07 Nov 2023 00:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699347080; cv=none;
        d=google.com; s=arc-20160816;
        b=xL5QWtK4uNX27ZfDHJo4FMaPukbHbb+H4MavaT1v6epN2gshr5+xcw8yuO1e83IhnP
         nIt+tPl3avCCb+JsrWxmmac0x7ewNvt/tuAZXVCWaklqgL4+uP3dsvs6RFjZuozK2pVP
         MrN0VOoPJjyjcJWjqdWkh06Z2Sqw7wzM+2iEwsqoWeLSWlKhy0NteTOIh7nK+pUQ4vqL
         bS/aOM5i48EFG1HpBbIVLYZATrnxvNnnI8QgG0pkWGEHkiqreQf0RmMu4+bews5g4GmK
         rE7MoOfWcNIBpxhskSnOUoBl1lkmlk66Ou9DDzKOFgUFo7SFWcdJnO4G+sVU5WRDCIKa
         gwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=TrSZHFiJAA/AwU7WufUuWN5MLuX6xE725trQkA5y2eI=;
        fh=LTMvKyvjQ10hdIukwJGsfmSI/vejkrYH8umj4PTUXgU=;
        b=CPTQx3W2gsT1FI15L7F8PMtN71STD1BQHYxhGMPZEKUxksP98xqtxaY+uLNr43/XnA
         gV4dAOYs8J+oL9aZwQ/bmEXv43lOyxONml/yuznL5KctduiIEegzXEctPbQR8N1mPQBy
         AUMp3gMhVpZcgbyUpm2Yj/jIBQdthBPNNogEcg//MS8TKrCDXBGEVuRcxfsjCT7p0B0D
         6hsaE1gkx4ZoICQ+B/es8QcjJEzSrxYixyKyodGJh51hMAgHrxyrRdx2svcUYnq1jZ5j
         NYD7hMkyoWsGPEI950ZQtYJZWWsXnQ/7C7j07GV9y6TlwtMmG1Yq+Anpk5Jy+yxU9zjW
         kQfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vz//iXgp";
       spf=pass (google.com: domain of kvm+bounces-841-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-841-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-841-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id lm15-20020a170903298f00b001c604fdbb14si10790559plb.81.2023.11.07.00.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 00:51:20 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-841-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vz//iXgp";
       spf=pass (google.com: domain of kvm+bounces-841-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-841-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54D31280DF6
	for <alex.bennee@linaro.org>; Tue,  7 Nov 2023 08:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA15FB67F;
	Tue,  7 Nov 2023 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vz//iXgp"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E663BD
	for <kvm@vger.kernel.org>; Tue,  7 Nov 2023 08:51:13 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5D8AB
	for <kvm@vger.kernel.org>; Tue,  7 Nov 2023 00:51:11 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507973f3b65so7257114e87.3
        for <kvm@vger.kernel.org>; Tue, 07 Nov 2023 00:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699347070; x=1699951870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrSZHFiJAA/AwU7WufUuWN5MLuX6xE725trQkA5y2eI=;
        b=vz//iXgpt2epnTblIr1nOTHaIqmyPrb4p+lu+HYNYbHsesz/DPiuyXrWx12DPHz5co
         FtmZT4cc53SfnbEsyOQ3N0hrbaB9dRXqkwQD5PnXYj7AWVWdaoyBiutYtNLQYF7WHWve
         aqTtBxIeeL3ZXvvK8ZKyLZvggZMAWrbhZcNai3F3OM6cd2LUFrN12jfn9wv9g+JxeLF5
         jF+YlSjiXsJH0KQN49bs6R3hYSjvgfCY9veD/5KLT+yEGP3TFfQI+uScJrI0CfldyRRl
         fW36Rw+TNEl6OE5OXmMab7j9D/WSdhiTfFZkLyu/vX6YSCl6KZ+AXqS2AdnBItbovoXN
         CNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699347070; x=1699951870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrSZHFiJAA/AwU7WufUuWN5MLuX6xE725trQkA5y2eI=;
        b=dHV9iW4EWqcFTFXfbIcalh9xAargxyMFUarVRFP8IibcEkJwVlwjOAPbo/TMMy3R/x
         6aiFjBMjwYJaeZE1QgPCUP5wyWGBquGCtioAG9x8CeD9QfRtUrsX4HOvGUQA/HvQD4Nt
         ucpTNd0IOJQDEY78JhSCUlMgJTlGEEbMwVFadD7tbsIOC5uGY7LmYYbQh+V/HnqibgiC
         oBOuNtgbYxP4+jsn1qDhtUxgpsnvSAP9ZsbrRQLA4o0jm8w+aj6RqAtmQdal+xz9vs1Z
         kKSoBH1q/TdOxYl4NeaR1VQ6+0PMKbWJrM1+n7PQznEwS9dDHB0iKW5jOgj9itUDclsd
         sdnA==
X-Gm-Message-State: AOJu0YzSF/A2kgJrljYrtzi9M5KQvOC6x+lxcYwSvzcMLIC1lQBQNFr8
	nTFIj1tnNcqw/yOzt3r2MINDAA==
X-Received: by 2002:ac2:4c43:0:b0:509:4aae:f2b1 with SMTP id o3-20020ac24c43000000b005094aaef2b1mr13277690lfk.8.1699347069952;
        Tue, 07 Nov 2023 00:51:09 -0800 (PST)
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id z6-20020a5d4406000000b003196b1bb528sm1705437wrq.64.2023.11.07.00.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 00:51:09 -0800 (PST)
Message-ID: <009d27a1-79ba-43de-b732-b5a86aa4f7d9@linaro.org>
Date: Tue, 7 Nov 2023 09:51:07 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/60] Misc HW/UI patches for 2023-11-06
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org
References: <20231106110336.358-1-philmd@linaro.org>
 <CAJSP0QXN5LQ_56do2MOAXyHWwqstYPDEDgptN4h464mW7wnjqA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QXN5LQ_56do2MOAXyHWwqstYPDEDgptN4h464mW7wnjqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rlwVt2QNCjEU

On 7/11/23 02:39, Stefan Hajnoczi wrote:
> On Mon, 6 Nov 2023 at 19:03, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The following changes since commit d762bf97931b58839316b68a570eecc6143c9e3e:
>>
>>    Merge tag 'pull-target-arm-20231102' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-11-03 10:04:12 +0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/misc-cpus-20231106
>>
>> for you to fetch changes up to a81b438ac3933419910cbdf2e2e8d87681de611e:
>>
>>    ui/sdl2: use correct key names in win title on mac (2023-11-06 11:07:32 +0100)
>>
>> Few checkpatch warnings in target/i386/hvf/x86_emu.c are deliberately ignored.
>> ----------------------------------------------------------------
>> Misc hardware patch queue
>>
>> HW emulation:
>> - PMBus fixes and tests (Titus)
>> - IDE fixes and tests (Fiona)
>> - New ADM1266 sensor (Titus)
>> - Better error propagation in PCI-ISA i82378 (Philippe)
>>
>> Topology:
>> - Fix CPUState::nr_cores calculation (Zhuocheng Ding and Zhao Liu)
>>
>> Monitor:
>> - Synchronize CPU state in 'info lapic' (Dongli Zhang)
>>
>> QOM:
>> - Have 'cpu-qom.h' target-agnostic (Philippe)
>> - Call object_class_is_abstract once in cpu_class_by_name (Philippe)
>>
>> UI:
>> - Use correct key names in titles on MacOS / SDL2 (Adrian)
>>
>> MIPS:
>> - Fix MSA BZ/BNZ and TX79 LQ/SQ opcodes (Philippe)
>>
>> Nios2:
>> - Create IRQs *after* vCPU is realized (Philippe)
>>
>> PPC:
>> - Restrict KVM objects to system emulation (Philippe)
>>
>> X86:
>> - HVF & KVM cleanups (Philippe)
>>
>> Various targets:
>> - Use env_archcpu() to optimize (Philippe)
>>
>> Misc:
>> - Few global variable shadowing removed (Philippe)
>> - Introduce cpu_exec_reset_hold and factor tcg_cpu_reset_hold out (Philippe)
>> - Remove few more 'softmmu' mentions (Philippe)
>> - Fix and cleanup in vl.c (Akihiko & Marc-André)
>> - MAINTAINERS updates (Thomas, Daniel)
>>
>> ----------------------------------------------------------------
>>
>> Adrian Wowk (1):
>>    ui/sdl2: use correct key names in win title on mac
>>
>> Akihiko Odaki (1):
>>    vl: Free machine list
>>
>> Daniel P. Berrangé (1):
>>    MAINTAINERS: update libvirt devel mailing list address
>>
>> Dongli Zhang (1):
>>    target/i386/monitor: synchronize cpu state for lapic info
>>
>> Fiona Ebner (2):
>>    hw/ide: reset: cancel async DMA operation before resetting state
>>    tests/qtest: ahci-test: add test exposing reset issue with pending
>>      callback
>>
>> Marc-André Lureau (1):
>>    vl: constify default_list
>>
>> Philippe Mathieu-Daudé (39):
>>    tests/vm/ubuntu.aarch64: Correct comment about TCG specific delay
>>    tests/unit/test-seccomp: Remove mentions of softmmu in test names
>>    accel/tcg: Declare tcg_flush_jmp_cache() in 'exec/tb-flush.h'
>>    accel: Introduce cpu_exec_reset_hold()
>>    accel/tcg: Factor tcg_cpu_reset_hold() out
>>    target: Unify QOM style
>>    target: Mention 'cpu-qom.h' is target agnostic
>>    target/arm: Move internal declarations from 'cpu-qom.h' to 'cpu.h'
>>    target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>>    target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>>    target: Declare FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
>>    target/hexagon: Declare QOM definitions in 'cpu-qom.h'
>>    target/loongarch: Declare QOM definitions in 'cpu-qom.h'
>>    target/nios2: Declare QOM definitions in 'cpu-qom.h'
>>    target/openrisc: Declare QOM definitions in 'cpu-qom.h'
>>    target/riscv: Move TYPE_RISCV_CPU_BASE definition to 'cpu.h'
>>    target/ppc: Use env_archcpu() in helper_book3s_msgsndp()
>>    target/riscv: Use env_archcpu() in [check_]nanbox()
>>    target/s390x: Use env_archcpu() in handle_diag_308()
>>    target/xtensa: Use env_archcpu() in update_c[compare|count]()
>>    target/i386/hvf: Use x86_cpu in simulate_[rdmsr|wrmsr]()
>>    target/i386/hvf: Use env_archcpu() in simulate_[rdmsr/wrmsr]()
>>    target/i386/hvf: Use CPUState typedef
>>    target/i386/hvf: Rename 'CPUState *cpu' variable as 'cs'
>>    target/i386/hvf: Rename 'X86CPU *x86_cpu' variable as 'cpu'
>>    target/i386/kvm: Correct comment in kvm_cpu_realize()
>>    target/mips: Fix MSA BZ/BNZ opcodes displacement
>>    target/mips: Fix TX79 LQ/SQ opcodes
>>    sysemu/kvm: Restrict kvmppc_get_radix_page_info() to ppc targets
>>    hw/ppc/e500: Restrict ppce500_init_mpic_kvm() to KVM
>>    target/ppc: Restrict KVM objects to system emulation
>>    target/ppc: Prohibit target specific KVM prototypes on user emulation
>>    target/nios2: Create IRQs *after* accelerator vCPU is realized
>>    target/alpha: Tidy up alpha_cpu_class_by_name()
>>    hw/cpu: Call object_class_is_abstract() once in cpu_class_by_name()
>>    exec/cpu: Have cpu_exec_realize() return a boolean
>>    hw/cpu: Clean up global variable shadowing
> 
> Please take a look at the following CI failure:
> 
> cc -m64 -mcx16 -Ilibqemu-arm-bsd-user.fa.p -I. -I.. -Itarget/arm
> -I../target/arm -I../common-user/host/x86_64 -I../bsd-user/include
> -Ibsd-user/freebsd -I../bsd-user/freebsd -I../bsd-user/host/x86_64
> -Ibsd-user -I../bsd-user -I../bsd-user/arm -Iqapi -Itrace -Iui
> -Iui/shader -I/usr/local/include/capstone
> -I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include
> -I/usr/local/include -fcolor-diagnostics -Wall -Winvalid-pch -Werror
> -std=gnu11 -O2 -g -fstack-protector-strong -Wundef -Wwrite-strings
> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wmissing-format-attribute
> -Wno-initializer-overrides -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-string-plus-int
> -Wno-typedef-redefinition -Wno-tautological-type-limit-compare
> -Wno-psabi -Wno-gnu-variable-sized-type-not-at-end -Wthread-safety
> -iquote . -iquote /tmp/cirrus-ci-build -iquote
> /tmp/cirrus-ci-build/include -iquote
> /tmp/cirrus-ci-build/host/include/x86_64 -iquote
> /tmp/cirrus-ci-build/host/include/generic -iquote
> /tmp/cirrus-ci-build/tcg/i386 -pthread -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing
> -fno-common -fwrapv -fPIE -DNEED_CPU_H
> '-DCONFIG_TARGET="arm-bsd-user-config-target.h"'
> '-DCONFIG_DEVICES="arm-bsd-user-config-devices.h"' -MD -MQ
> libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o -MF
> libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o.d -o
> libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o -c ../bsd-user/main.c
> ../bsd-user/main.c:121:36: error: use of undeclared identifier 'cpus';
> did you mean 'cpu'?
> QTAILQ_REMOVE_RCU(&cpus, cpu, node);
> ^~~~
> cpu
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/5472832586

Hmm for some reason the Cirrus jobs aren't running anymore in
my GitLab namespace, sorry for not catching that trivial leftover.

Phil.
