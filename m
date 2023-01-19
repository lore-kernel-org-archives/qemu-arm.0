Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp339736ejc;
        Thu, 19 Jan 2023 05:46:28 -0800 (PST)
X-Received: by 2002:a05:6000:549:b0:274:fae4:a518 with SMTP id b9-20020a056000054900b00274fae4a518mr9137235wrf.11.1674135988538;
        Thu, 19 Jan 2023 05:46:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674135988; cv=none;
        d=google.com; s=arc-20160816;
        b=KIAX8w64fqNx2hzqdJYN0hQlCGQbT6FKtYgJZ1/oipNaZ8zm17Nz5awh+DI1XtU7jL
         wfD1G2pDeF+QWmtUk3rr2Tg4jqCkDqDseZALHbYYFN+3QN8MCUleR0028CUeZyKw9OvA
         CXBTLNoSDbkKz3zKSbJ+pUxTqNgibxMR0i/diPqSPo6j6heR+mU/0CJ98XL+gAHS+TEr
         AMQ+vxxOPxmJf5kE/ovUMqEqdL4mpU8DoqC8NkRwg+pju4Q82RFYUwNyzyXvYaBsiAdI
         o9+Blb1Xn5ePaGYHHh38zySAmMS4iMDlkxqMmQUwkazJEIAuLAhydWHjiQwXKIvFbyVP
         jZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3/LZW3PmpdXlxZ0fOjBSrkyY10AW7C/jltZnooLW4/I=;
        b=zlZ+8e07xKkp/A73hGdWyI4aGDV52J5LM1W+3xZRBj5x4pPjCEhN4FlFhmVKEOSP7E
         KnoNXFdj+opHecxvFexCBectoh6cBOQOgUzELkRJsKu5xeDE/AuDn0viW/YSM6z+vqJ1
         macrM6s0O65oyCGwWZxyfM9Bajr1TjNM5Y8NE2t5Ei+IG8zRpssauZD1FWpWFxstbqPB
         3qIjXq2UH+BoyC2xSXwo/lL2rKvJ4igfcKO8c3QeGsTEXljBjf9hQ6IYSBJZA/W8s1Ba
         kJlpIV9t5/M9fdpd3pbpbMSTaq7fx25MAvnVW6VykVpbojbUNUguqKJGAVLwuaXzJt29
         cizA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3nYdZHZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r17-20020adfb1d1000000b00260ebd17e99sor610946wra.73.2023.01.19.05.46.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 05:46:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3nYdZHZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/LZW3PmpdXlxZ0fOjBSrkyY10AW7C/jltZnooLW4/I=;
        b=M3nYdZHZQt2/o88LKNlRX8M0QGvNihLLkI7dpQ6lQJTnzRk1NpkETtmO1wxxgXMZOI
         ywMDW9/mrL/87cKta8mYJHqaIHS3o55znIZKTGv2M/8DW1siAP+0FQWk8eZ2MErf6snk
         B42R6CuoQDJrQ2CR7GsWnWxARKRSwlK6nXOegZHmCngx5yOoqMK6vOyzcjMckI2WUalD
         oYnqRNXuY5MeiKVBBS1WO2/1u52G58CPtmPO4UTXCZo5RJ61eMtyQvGkjcqZfi4Yr+mv
         j7iFlB9WeDv03j18SYvqwStlGACoIWWnks6SVUZvEgoa3+6NvmT0yVjJqRjWKhclYLNs
         SLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/LZW3PmpdXlxZ0fOjBSrkyY10AW7C/jltZnooLW4/I=;
        b=2oTAIN1RciLMaTSCSSacsxGkC2uu4TqZ9IOFtjy+7w+Tf4WgsEaXI/xdEhzYygKn78
         S6jwzz5iYq5mzSni9b8x/Xhe1ayCJBT1OFNoMJGWG53HZnULUbu5ijsE21eMRa1A8fDc
         3qVVJDwZ5VNDbWDLh8C/uGRnJGX8dmIBqgSppZmH+vAN8oX0UNu0QsMr42rcfW4upgaa
         hAZ0/MBf3h2mp5QzjTkc+il943TZm8KFcCyDpIwSBKtqiaVCIyJid+nLMnY7o2qT9Qb1
         eJMo/dQLlVZOq0x3dHZZRdr1txv1wWXKr6PhzcwlTH5hN85tGsqv0Gb2Si+TYLfyIej5
         0aWQ==
X-Gm-Message-State: AFqh2kq4d1wPHkDOESSuv//u5Dk7VmLPLLHuGgHsFaVXgng0zFFIMNf9
	3E8H+6ypRDyiGouQONCt9PSRlx90
X-Google-Smtp-Source: AMrXdXsLudCCY6n2BBffHZs3NSEZ4Jx+gvTKbeJ9a9qj1uQ/7+d+e4veVgtay4lzyJDHcqbeBNBiMQ==
X-Received: by 2002:a5d:6447:0:b0:2be:34f9:5284 with SMTP id d7-20020a5d6447000000b002be34f95284mr4357277wrw.48.1674135988056;
        Thu, 19 Jan 2023 05:46:28 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id g2-20020a5d4882000000b00286ad197346sm33665783wrq.70.2023.01.19.05.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:46:27 -0800 (PST)
Message-ID: <d8da1d01-c87d-a226-0914-448a7da144c5@linaro.org>
Date: Thu, 19 Jan 2023 14:46:26 +0100
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
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org> <87bkmu1z8v.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87bkmu1z8v.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3PneGVKBAOX8

On 19/1/23 13:32, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>> These are the already reviewed patches from the first half of my
>>> previous series:
>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>
>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>> that are still being hashed out in the other series.

Are you saying, we can *link* this configuration but not *run* it yet?

>>> For the build _with_ TCG, this should behave the same as master.
>>>
>>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
>>>
>>> Claudio Fontana (5):
>>>     target/arm: rename handle_semihosting to tcg_handle_semihosting
>>>     target/arm: wrap psci call with tcg_enabled
>>>     target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>>>     target/arm: move helpers to tcg/
>>>     target/arm: Move psci.c into the tcg directory
>>>
>>> Fabiano Rosas (15):
>>>     target/arm: Move PC alignment check
>>>     target/arm: Move cpregs code out of cpu.h
>>>     target/arm: Move cpregs code into cpregs.c
>>>     target/arm: Move define_debug_regs() to cpregs.c
>>>     target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
>>>     target/arm: move translate modules to tcg/
>>>     target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
>>>     target/arm: Move hflags code into the tcg directory
>>>     target/arm: Move regime_using_lpae_format into internal.h
>>>     target/arm: Don't access TCG code when debugging with KVM
>>>     cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
>>>     target/arm: Move cortex sysregs into cpregs.c
>>>     tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
>>>     tests/avocado: Skip tests that require a missing accelerator
>>>     tests/avocado: Tag TCG tests with accel:tcg
>>
>> Testing on Darwin:
>>
>> 14/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp
>>   
>> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code
>> should not be reached
>> 17/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test
>>           qemu-system-aarch64: unknown type 'arm-gicv3'
>> 18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
>> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>> 19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
>> qemu-system-aarch64: No machine specified, and there is no default
>> 20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>>
>> Reproducers:
>>
>> $ ./qemu-system-aarch64 -display none -S -M mps3-an547 -accel qtest
>> -monitor stdio
>> QEMU 7.2.50 monitor - type 'help' for more information
>> (qemu) gva2gpa 0
>> **
>> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code
>> should not be reached
>> Bail out!
>> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code
>> should not be reached
>> Abort trap: 6
>>
>>       frame #4: 0x0000000101fdd6cc
>> libglib-2.0.0.dylib`g_assertion_message_expr + 116
>>       frame #5: 0x0000000100360ce0
>> qemu-system-aarch64`arm_v7m_mmu_idx_for_secstate(env=<unavailable>,
>> secstate=<unavailable>) at helper.c:2495:5
>>       frame #6: 0x000000010035f7f4
>> qemu-system-aarch64`arm_mmu_idx_el(env=<unavailable>, el=<unavailable>)
>> at helper.c:2514:16
>>       frame #7: 0x00000001002d17ec
>> qemu-system-aarch64`arm_cpu_get_phys_page_attrs_debug(cs=<unavailable>,
>> addr=0, attrs=0x000000016fdfda50) at ptw.c:2982:23
>>       frame #8: 0x00000001003c660c
>> qemu-system-aarch64`hmp_gva2gpa(mon=0x000060000390f0c0,
>> qdict=<unavailable>) at misc.c:714:12
>>
>> $ ./qemu-system-aarch64 -display none -machine sbsa-ref -accel qtest
>> qemu-system-aarch64: unknown type 'arm-gicv3'
>> Abort trap: 6
>>
>>       frame #2: 0x00000001958522c8 libsystem_c.dylib`abort + 180
>>       frame #3: 0x00000001003d32e8
>> qemu-system-aarch64`qdev_new(name="arm-gicv3") at qdev.c:164:9
>>       frame #4: 0x00000001002f30d4 qemu-system-aarch64`sbsa_ref_init
>> [inlined] create_gic(sms=0x0000000103ff0d10) at sbsa-ref.c:405:16
>>       frame #5: 0x00000001002f30a0
>> qemu-system-aarch64`sbsa_ref_init(machine=0x0000000103ff0d10) at
>> sbsa-ref.c:773:5
>>       frame #6: 0x00000001000905c0
>> qemu-system-aarch64`machine_run_board_init(machine=0x0000000103ff0d10,
>> mem_path=<unavailable>, errp=<unavailable>) at machine.c:1404:5
> 
> Are these errors without TCG?

Yes.

> If so they will be fixed by the other half
> of the series by removing the machines/cpus that depend on TCG. Nothing
> against fixing this now in the specific tests, of course, but a user on
> the cmdline would also hit these.

I ran 'make check' which calls 'make check-qtest' -> 'make 
check-qtest-aarch64'.
