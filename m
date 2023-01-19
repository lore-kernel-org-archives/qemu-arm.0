Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp148392ejc;
        Wed, 18 Jan 2023 23:41:02 -0800 (PST)
X-Received: by 2002:a05:6000:1708:b0:2bd:daf1:9e4c with SMTP id n8-20020a056000170800b002bddaf19e4cmr9896139wrc.43.1674114062791;
        Wed, 18 Jan 2023 23:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674114062; cv=none;
        d=google.com; s=arc-20160816;
        b=qDTIfU+I7bY3mRoLoUAPxNt68WNYZz1KakbuM6FFCebE4KoSAPEvSFYi08uMeVaIsg
         bwxKonKsxjU71jVvoQgI9PYfxsWSx5TBajiQjxoF5tDTmaFXDDa07HH09f4ImCpfpG79
         oty6al5yFg+HMkcS6j0yes0Qo0chfmS0aoSz1AoZIMkBxzpa2iwByspMzuIO9NlxK0xr
         8tA/XR1ibYqlUQYWik3lIrvMZfJpg3cph7CoPmo+hsWJIRrDjhlPI7/yQGWU5QzF9mF7
         W2K3BmvJYivlfDExl/fPX9K0b9J0b58Ai8aS0GsThTGtlFADBt5K2sOJgnk3E2M+sLOd
         wn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QLJZZ/xKF6K9vLVszmMBOOMFL0e4QgKdmUNSk7oF4f0=;
        b=VxpyvtQUmOF+0Cu1bfJ6bnPY3/7VG9u9bBoWfVQJo27xZxjoBNnb8Saq/2YeQqvHKL
         pQjSqvxmuPjjZuiSho0rzoeGisG0sb7jkcVeDjdQzT+ML+ghDQLAxPePj7OqQ/9ZOHrd
         ZMwyJOz+6UcvV6YJIoybO9xmrvQGiTYWSnxI3oqdyspQuAnUfbyCjbJ0PDeReARkX9cB
         ztL652SijIjD1LhefrqwPAHk+asMurekVsPY4recnZhEGd+0acAjzWI8o9ApnGc220NH
         3858OXs1rkuJwgGLBLBfc8T4t27wunS1WOp2RXc+3zBacqQiiZ/XInpffroaTXpU4hJK
         EKsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XyBq2oXN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d18-20020adf9b92000000b002a8f3053ef9sor14217263wrc.1.2023.01.18.23.41.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Jan 2023 23:41:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XyBq2oXN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLJZZ/xKF6K9vLVszmMBOOMFL0e4QgKdmUNSk7oF4f0=;
        b=XyBq2oXNhyLtGG5omd53Pm/J1qcw4o6bVNgeaAOds0gDKtcxbt6NTRinF+ARqeTQ6z
         pamG7T0OvX2BtDq7yyBVB3pQ8+LVCz2gAWkN8fIRjrpfYWUHvUF6QiABWxlz5/6lK8vj
         ovZoFGXfufn7qJGgvtqIbOaKaHkQui1U2rOiBUqi27wX+jRYV/LkIJ3s5Q9bd6G1ZoBY
         fGj1AuB6qswkqXH6k/i7KkXNqkU7FJrEIJ5MVlgmBktzPwwIPsKUGuf5iuQjoCnCnc+I
         Aprv9a3Nqao6G8tsQm7c7vnj/5F8OnDidKy72ZKz7XCe6u7xmb0PXCNSHRofcKh+7UCP
         YcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLJZZ/xKF6K9vLVszmMBOOMFL0e4QgKdmUNSk7oF4f0=;
        b=q1frGIgUolszDHf1K+jv3Wovp6J3tnD/lNqGg8JXXqxQ3R/wrTo/gPuoakcSKz0SO8
         HKWvXrH8EMTihf0XuLxlqM75pf6sXTCVDVVGdmW9z4V+TQdROTS/7V7K24F64X1g8hjY
         0gOVzaLBejQcXGAEUcQXPTkk5jpoCET4WsV2twnzPxJMvqN+6Y/YiHvJ+qIfTuWRJH0G
         +JmKgws4L8nR5I7Q/xdyk7bUMr1RF1yx6Kp6tyk5FtIQlxytXogGak6c/wwQxCcu4ATk
         IQF7JdkPI7wEUz+9sH8y5VV/0WR4wr5mmPxX/eZ+x6//6d7FX1pqLGG33vyYzHDV1QEx
         zSJA==
X-Gm-Message-State: AFqh2ko1277yVslMsJcrmUOrJWdOLkQUF+dGTl06wtA3keVEfHxX/ORD
	RxGhjK9dyddPft3S8S7LdOR8/EaJ
X-Google-Smtp-Source: AMrXdXvWUp0ijWDHICHHw1oJJgcvmrhh6JoTZFAV/cYbr5y7R5SKSTE+zuH+z8fd6KPumELgQvE3kQ==
X-Received: by 2002:a5d:4591:0:b0:2bc:7dec:9588 with SMTP id p17-20020a5d4591000000b002bc7dec9588mr8596486wrq.54.1674114062468;
        Wed, 18 Jan 2023 23:41:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id f8-20020a0560001b0800b002423edd7e50sm32761517wrz.32.2023.01.18.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:41:02 -0800 (PST)
Message-ID: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Date: Thu, 19 Jan 2023 08:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230118193518.26433-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: BLD5SFDsq79m

On 18/1/23 20:34, Fabiano Rosas wrote:
> These are the already reviewed patches from the first half of my
> previous series:
> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
> 
> This unbreaks the --disable-tcg build, but there are issues in runtime
> that are still being hashed out in the other series.
> 
> For the build _with_ TCG, this should behave the same as master.
> 
> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
> 
> Claudio Fontana (5):
>    target/arm: rename handle_semihosting to tcg_handle_semihosting
>    target/arm: wrap psci call with tcg_enabled
>    target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>    target/arm: move helpers to tcg/
>    target/arm: Move psci.c into the tcg directory
> 
> Fabiano Rosas (15):
>    target/arm: Move PC alignment check
>    target/arm: Move cpregs code out of cpu.h
>    target/arm: Move cpregs code into cpregs.c
>    target/arm: Move define_debug_regs() to cpregs.c
>    target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
>    target/arm: move translate modules to tcg/
>    target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
>    target/arm: Move hflags code into the tcg directory
>    target/arm: Move regime_using_lpae_format into internal.h
>    target/arm: Don't access TCG code when debugging with KVM
>    cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
>    target/arm: Move cortex sysregs into cpregs.c
>    tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
>    tests/avocado: Skip tests that require a missing accelerator
>    tests/avocado: Tag TCG tests with accel:tcg

Testing on Darwin:

14/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp 
 
ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
should not be reached
17/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test 
         qemu-system-aarch64: unknown type 'arm-gicv3'
18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
qemu-system-aarch64: -accel tcg: invalid accelerator tcg
19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
qemu-system-aarch64: No machine specified, and there is no default
20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Reproducers:

$ ./qemu-system-aarch64 -display none -S -M mps3-an547 -accel qtest 
-monitor stdio
QEMU 7.2.50 monitor - type 'help' for more information
(qemu) gva2gpa 0
**
ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
should not be reached
Bail out! 
ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
should not be reached
Abort trap: 6

     frame #4: 0x0000000101fdd6cc 
libglib-2.0.0.dylib`g_assertion_message_expr + 116
     frame #5: 0x0000000100360ce0 
qemu-system-aarch64`arm_v7m_mmu_idx_for_secstate(env=<unavailable>, 
secstate=<unavailable>) at helper.c:2495:5
     frame #6: 0x000000010035f7f4 
qemu-system-aarch64`arm_mmu_idx_el(env=<unavailable>, el=<unavailable>) 
at helper.c:2514:16
     frame #7: 0x00000001002d17ec 
qemu-system-aarch64`arm_cpu_get_phys_page_attrs_debug(cs=<unavailable>, 
addr=0, attrs=0x000000016fdfda50) at ptw.c:2982:23
     frame #8: 0x00000001003c660c 
qemu-system-aarch64`hmp_gva2gpa(mon=0x000060000390f0c0, 
qdict=<unavailable>) at misc.c:714:12

$ ./qemu-system-aarch64 -display none -machine sbsa-ref -accel qtest
qemu-system-aarch64: unknown type 'arm-gicv3'
Abort trap: 6

     frame #2: 0x00000001958522c8 libsystem_c.dylib`abort + 180
     frame #3: 0x00000001003d32e8 
qemu-system-aarch64`qdev_new(name="arm-gicv3") at qdev.c:164:9
     frame #4: 0x00000001002f30d4 qemu-system-aarch64`sbsa_ref_init 
[inlined] create_gic(sms=0x0000000103ff0d10) at sbsa-ref.c:405:16
     frame #5: 0x00000001002f30a0 
qemu-system-aarch64`sbsa_ref_init(machine=0x0000000103ff0d10) at 
sbsa-ref.c:773:5
     frame #6: 0x00000001000905c0 
qemu-system-aarch64`machine_run_board_init(machine=0x0000000103ff0d10, 
mem_path=<unavailable>, errp=<unavailable>) at machine.c:1404:5
