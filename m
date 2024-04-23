Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp5131663ejd;
        Tue, 23 Apr 2024 09:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUR9WWDPXBlMiagX+qUaL4heU0dkeiCyyAVIvk92tWYsVI/w0y5SkKIfECwmzeYXziYf7tB+FplzU4lzcnjnDVIEPE5xbFQ
X-Received: by 2002:a05:622a:4d3:b0:439:a509:8845 with SMTP id q19-20020a05622a04d300b00439a5098845mr9934507qtx.37.1713888053321;
        Tue, 23 Apr 2024 09:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713888053; cv=none;
        d=google.com; s=arc-20160816;
        b=vy2xL35F8EerIAU6HTpukQnqA9svJZmfjzW6Ybd/Lx6xMPVKH5zlDAfvVB4bKBy41J
         6aznIV7mm20uMBO4aNQ4A6EOocqVzraGPlT1Hb5iT+oVGG+1x5WdvEZyJIlXMtiM11ls
         zw6HV83TAayHFgjUTSVRBYpPuIu6DwW6+RAznj17OdXm0E6Me5uKzRhcOCErL3nEFtNZ
         kkG6KxxivYIDb02fqyeKwe1eRHRk/dA6Zdc/AaKsR0KAkuHAgTGvcx0wSLihjqB7L9Ix
         IMZ4xCwAsiydlnqo8N0SmFXD5HmVQiR2b3gJpYhzZEWS8rOkeIN0NXDs9/LK4i392eDg
         aneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QUXF0pbqPINBlWAL3oyQd0ZXBGy6HiUG13wz1FRP9pg=;
        fh=9rGLBOWWt/MoZKE8/tVxhPkMMeOtmmcPqjo55lUkq5M=;
        b=XpJbwbeNjyS8n/SNtB2V/WgqmTsog1icesNaAa6qX/DoXb8HpH0nplwojiBDDRH5b3
         2M0ld57AnvGoNENl/WhyxjLIgYLe6yCtbZMjeqZdLxbWrSsB8T2K4OOAH3yTgnZpgiq5
         HIczCyEuwlFo5dXcTguJCaU9BBY7qrgjN1P56A7J/OUW++I2jYr6Yn8E40GAWcG6NTZ8
         WE81JLCLzFDkovJ5kC5AvGULD4KVLGRTQmnQ3tCT+fpl9DVoWKzcBrhFH4KAXIca+MdM
         xO80fObJ0bjJH0/ejbNyeD990Olzr/DxNFDgS2M4s1AoOQfuMMiGyTVEaF9uAjSl+bQN
         O9Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qSWzR4oU;
       spf=pass (google.com: domain of bill.mills@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=bill.mills@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <bill.mills@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cs7-20020ad44c47000000b006962ff5d8ecsor6843837qvb.10.2024.04.23.09.00.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Apr 2024 09:00:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of bill.mills@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qSWzR4oU;
       spf=pass (google.com: domain of bill.mills@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=bill.mills@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713888053; x=1714492853; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUXF0pbqPINBlWAL3oyQd0ZXBGy6HiUG13wz1FRP9pg=;
        b=qSWzR4oUyZQBe3ZPDVP3RQg9JPIcp1F1rGp5QZMAZHMj5UlOnFS5z29eqp9qdvHYjF
         +3Cv1U+zfeSJXxTEi9pEZvGeYKGuHzFML0PRK0/GwWugSiALhQ9sQWvAcZrF4WWYk3Dp
         vrZOBp1pEGRKjm6jzzJgH5uC/F/DXmEe5SNMIA13zpbIsgHMiLHV8+Xc70vChpEO0NFJ
         bPua9BS6efANloXcjGq95ngsY76yjNreb08P8McBUp8QAglr1ylNWOAPc/+J9V5USqrm
         HES8T6Efb6gsXKX3xwjED3DpR0ZhL6YbfEngUKVQ//r96Htkflx4q+zsKEk1raYJXtiJ
         a2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713888053; x=1714492853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUXF0pbqPINBlWAL3oyQd0ZXBGy6HiUG13wz1FRP9pg=;
        b=Pndzkoztdnv4tyh03X1JFnKDLzrW5dbzBiJ5pbRKSGsFAlDwc9Gk885UaPYHPEvmg1
         XAv2Zf0Vh/XmmfrRDqAsxeYhS5WZwZ9czISSwc/D2PNE0GDWecJJDUm6fFHR6il7Puio
         Z3CPBiX4jVFa+tqKrobT2ia2pNKSXCbwDjCAXMOMvrUeLAzeCf2OTJEioVhp5xrvsK0K
         qMDbZrNL35H2ySfry1CxTD8uQHxvumYrbtYO+ldbGrHEIg56zFKCp8h5Eh/8OozozeIv
         s0AcKI32nVuuwFiXts9HSnLa+Qd4uEaJQcyZqxUT/qtBH13OCEnZAyUjZ3zxLZu54Mh0
         MUVA==
X-Forwarded-Encrypted: i=1; AJvYcCUtYmDZV2VMKofxIrjVWE5opfe2LxEOUkCNg8RZPJnPFVY9Ub8K6m5Lfgimqri5Frt/uPTIDq/C3uJ+L8DGCrqFLM/6B3l7
X-Gm-Message-State: AOJu0YzWxKO0EMUJM+f300lBNnqmMusKtf6DzJ/1bPPkPsD2oBOGadf0
	deidWPCF8OFh55GUp6+z5aeATCvyHnb6RAag8XWTRTs+OKKG62xQg01twO59yzoU7A==
X-Google-Smtp-Source: AGHT+IFHyYErQf67inmK+ur4lzrBBmXfVCID0ViuwnycAsaZ92iAIKWD0AY5tw4uOOU7fVDE46HlMg==
X-Received: by 2002:a0c:e58a:0:b0:6a0:582c:61a with SMTP id t10-20020a0ce58a000000b006a0582c061amr9791054qvm.55.1713888052666;
        Tue, 23 Apr 2024 09:00:52 -0700 (PDT)
Return-Path: <bill.mills@linaro.org>
Received: from [192.168.2.7] (pool-72-83-14-124.washdc.fios.verizon.net. [72.83.14.124])
        by smtp.gmail.com with ESMTPSA id ez4-20020ad45904000000b00690c77505bdsm4392053qvb.37.2024.04.23.09.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:00:51 -0700 (PDT)
Message-ID: <ecf04b2a-2038-43ac-a0bb-38d0baca7a7c@linaro.org>
Date: Tue, 23 Apr 2024 12:00:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Add ivshmem-flat device
To: Markus Armbruster <armbru@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, thuth@redhat.com,
 lvivier@redhat.com, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, anton.kochkov@proton.me, richard.henderson@linaro.org,
 peter.maydell@linaro.org
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
 <87wmqp3xug.fsf@pond.sub.org>
 <a28f3657-c827-7a0d-a8da-b82d17d17577@linaro.org>
 <87sezc8irk.fsf@pond.sub.org>
Content-Language: en-US
From: Bill Mills <bill.mills@linaro.org>
In-Reply-To: <87sezc8irk.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: wjhiQ3jVDSN2

Hi Markus,

On 4/23/24 6:39 AM, Markus Armbruster wrote:
> Gustavo Romero <gustavo.romero@linaro.org> writes:
> 
>> Hi Markus,
>>
>> Thanks for interesting in the ivshmem-flat device.
>>
>> Bill Mills (cc:ed) is the best person to answer your question,
>> so please find his answer below.
>>
>> On 2/28/24 3:29 AM, Markus Armbruster wrote:
>>> Gustavo Romero <gustavo.romero@linaro.org> writes:
>>>
>>> [...]
>>>
>>>> This patchset introduces a new device, ivshmem-flat, which is similar to the
>>>> current ivshmem device but does not require a PCI bus. It implements the ivshmem
>>>> status and control registers as MMRs and the shared memory as a directly
>>>> accessible memory region in the VM memory layout. It's meant to be used on
>>>> machines like those with Cortex-M MCUs, which usually lack a PCI bus, e.g.,
>>>> lm3s6965evb and mps2-an385. Additionally, it has the benefit of requiring a tiny
>>>> 'device driver,' which is helpful on some RTOSes, like Zephyr, that run on
>>>> memory-constrained resource targets.
>>>>
>>>> The patchset includes a QTest for the ivshmem-flat device, however, it's also
>>>> possible to experiment with it in two ways:
>>>>
>>>> (a) using two Cortex-M VMs running Zephyr; or
>>>> (b) using one aarch64 VM running Linux with the ivshmem PCI device and another
>>>>       arm (Cortex-M) VM running Zephyr with the new ivshmem-flat device.
>>>>
>>>> Please note that for running the ivshmem-flat QTests the following patch, which
>>>> is not committed to the tree yet, must be applied:
>>>>
>>>> https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg03176.html
>>>
>>> What problem are you trying to solve with ivshmem?
>>>
>>> Shared memory is not a solution to any communication problem, it's
>>> merely a building block for building such solutions: you invariably have
>>> to layer some protocol on top.  What do you intend to put on top of
>>> ivshmem?
>>
>> Actually ivshmem is shared memory and bi-direction notifications (in this case a doorbell register and an irq).
> 
> Yes, ivshmem-doorbell supports interrupts.  Doesn't change my argument.
> 
>> This is the fundamental requirement for many types of communication but our interest is for the OpenAMP project [1].
>>
>> All the OpenAMP project's communication is based on shared memory and bi-directional notification.  Often this is on a AMP SOC with Cortex-As and Cortex-Ms or Rs.  However we are now expanding into PCIe based AMP. One example of this is an x86 host computer and a PCIe card with an ARM SOC.  Other examples include two systems with PCIe root complex connected via a non-transparent bridge.
>>
>> The existing PCI based ivshmem lets us model these types of systems in a simple generic way without worrying about the details of the RC/EP relationship or the details of a specific non-transparent bridge.  In fact the ivshmem looks to the two (or more) systems like a non-transparent bridge with its own memory (and no other memory access is allowed).
>>
>> Right now we are testing this with RPMSG between two QEMU system where both systems are cortex-a53 and both running Zephyr. [2]
>>
>> We will expand this by switching one of the QEMU systems to either arm64 Linux or x86 Linux.
> 
> So you want to simulate a heterogeneous machine by connecting multiple
> qemu-system-FOO processes via ivshmem, correct?

An AMP SOC is one use case.  A PCIe card with an embedded Cortex-M would 
be another.

> 
>> We (and others) are also working on a generic virtio transport that will work between any two systems as long as they have shared memory and bi-directional notifications.
> 
> On top of or adjacent to ivshmem?
> 

On top of ivshmem.  It is not the only use case but it is an important one.

I just gave a talk on this subject at EOSS.  If you would like to look 
at the slides they are here:
https://sched.co/1aBFm

Thanks,
Bill

>> Now for ivshmem-flat.  We want to expand this model to include MCU like CPUs and RTOS'es that don't have PCIe.  We focus on Cortex-M because every open source RTOS has an existing port for one of the Cortex-M machines already in QEMU.  However they don't normally pick the same one.  If we added our own custom machine for this, the QEMU project would push back and even if accepted we would have to do a port for each RTOS.  This would mean we would not test as many RTOSes.
>>
>> The ivshmem-flat is actually a good model for what a Cortex-M based PCIe card would look like.  The host system would see the connection as PCIe but to the Cortex-M it would just appear as memory, MMR's for the doorbell, and an IRQ.
>>
>> So even after we have a "roll your own machine definition from a file", I expect ivshmem and ivshmem-flat to still be very useful.
>>
>> [1] https://www.openampproject.org/
>> [2] Work in progress here: https://github.com/OpenAMP/openamp-system-reference/tree/main/examples/zephyr/dual_qemu_ivshmem
> 

-- 
Bill Mills
Principal Technical Consultant, Linaro
+1-240-643-0836
TZ: US Eastern
Work Schedule:  Tues/Wed/Thur
