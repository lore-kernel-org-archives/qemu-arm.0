Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4412306ejd;
        Mon, 22 Apr 2024 09:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUU55aquv0DVeiEynG5etNLGS+nIgvlS73UDLL9vI5TxQeydBmGQZvPO5USkDz5hTNjjRo6QRJUFF9JC7+k7qPW7c6u4JUS
X-Received: by 2002:a05:6a00:2d1e:b0:6ed:1012:9572 with SMTP id fa30-20020a056a002d1e00b006ed10129572mr14266054pfb.29.1713804432824;
        Mon, 22 Apr 2024 09:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713804432; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgtLRrJ3OqkAsMF51zAXW2//upMRhymOeEYqR1C8M/irwrnrzzHWaGEkO1yYrbBcii
         zIyBNiZaCOfjqv8J0maV63KPYyzK6i1rnA55eJZpGFT5jIfLSawTHEqlCv6j9bu8gww7
         o5LVLeM4NBV4qpqQItS35J+x15i4eJf3zG7zwyUvyGIM6g6keV2S3aHuHVVP7+/sLTtl
         UF4OjBDKxokRaLxFGAudUmnCs1c0yOMQz2PkLopoY4EFuJmCrqyxELZag93EjX9Ig0yM
         wLHGALR/Dn36lctX8Jpwt6t/uljSklcOmsRtgS+11AoBqQhjtFqBMRF23IPWwx81VNrO
         lnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4aJLrmmDZ1b1wEEBqlhG5LMFF9PxxIOoGYxCH76bhZ0=;
        fh=3gGb3M4pQd/Qu9PgMEkkkaTj7UwNrUJHQtRLktiY4zA=;
        b=HSa7h6x6+DeEin76aI6yolzT+hH3XAx4+LIAo+0zVi6sKuwe9AlHuC6qCs1D5u4gcc
         8/v6Y/ekjLXV6A/jJvibC7vZNIWmXexdhuHPFS/5LABdCwcwWQo2peW+y4BzPcK18B6A
         v6p0LVRf+h8OSEri1IcfKSVwF5dAVHhPUdwzZxkyuOw8Db8lb9EcriGUa91CemXGief3
         LtQg0jAzuItfV61FbuH1chankBPyW3e+1689D3VafrCmfbuTn9DgloIW8H19AevcHBeg
         phxJ0x7ko0H5jwSaP60zAf3f4Gp3NlSnoZL6Dh25+4aSo1/n/7YliOQr4FcRzU9MlwQ1
         cunA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCmfajvZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h185-20020a6383c2000000b005f7f3d659afsor5719853pge.9.2024.04.22.09.47.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Apr 2024 09:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCmfajvZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713804432; x=1714409232; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aJLrmmDZ1b1wEEBqlhG5LMFF9PxxIOoGYxCH76bhZ0=;
        b=VCmfajvZC2i3t6ZFop/scloNUpoJh74TcTPH7X8SwFSyAuzi4+dV3GS5Gw82RdyKdb
         YoX+7Ojrk+QM5c0vtSYeSyTF4p6NKR4hJrYWTVHcIwc8eLdTQla7Cjw5zoQjpi72wwl+
         vAPws6Wmx8NK00YMKL3l55G5alMFLZwelvnfcLsAggT07fqW06nQK1k4y58AYMlNSCLE
         E5mD61dLZ07av8gjx74exj1uxCMTrTUH5P/e4mcUH4zuacAVY2ula/PLx8YMOsV2YCuO
         w8ied1nzo0VbJLRI6w8/N2dQMMQRyhNJlRxZWuMoaiuywNJP3Re+Wx4B8w90fqUI86Bv
         x9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713804432; x=1714409232;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4aJLrmmDZ1b1wEEBqlhG5LMFF9PxxIOoGYxCH76bhZ0=;
        b=V95+XiR1YWOo3TwSn+VAtOYfPjzVkkIBnDOKK+Emf5bZcRUFBCX7cK/qFdfLPVt4Oj
         1Jj1CFPClfM43hP1r8gMQwW5qMBTGgUr4C9nUKR9dKZcUUZkyvBPDCfUcM2ub3iLB/E9
         3m6zy0f1THJPXuQ0D+j3w+doFdEU9plAGLD80kAvvB14ayOdsUO2cV8EfvQ3ur4J2UGQ
         7nfacfTDLKjn4Lo+XuQJnhpHsbhia/sDNKDofxUM2b0KccXGDe4c9FNqfDOHLu3xfAg2
         POS9hqaM8xn7T+BNvVkiRnsRb0eX3e4FVAt4QEdKrXv06kHPQjNefZ+EXTNYetcEPMRY
         pxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfCE7Y4yBNdyoVV8OeZb8fUa4NNTwZ3idPDfn0uCe5fGuNjbCYoMxBiFKTBJnQjskflxYIVZzRRLRPc2tdt9se5233Kmwk
X-Gm-Message-State: AOJu0YxfSRV81yAP97ZE6FA9WPUxnK3WkL/svin6K1a+DVu5MiLsNy38
	EnMunIfASBIbTUOD8p9LFw09lrg1FM40nvD1ipa/pF7fAAtp+K/BfUImf4yhbhiGMw==
X-Google-Smtp-Source: AGHT+IHjoNSiNApXmt1qn9xPUHwOYpKmEyEUgLIlorcgYEnGxB2ouNIjz1jsdNy624j7fvtiWGAkGw==
X-Received: by 2002:a05:6a21:3989:b0:1a7:51f1:f778 with SMTP id ad9-20020a056a21398900b001a751f1f778mr12507775pzc.37.1713804432283;
        Mon, 22 Apr 2024 09:47:12 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([177.139.3.212])
        by smtp.gmail.com with ESMTPSA id f33-20020a056a000b2100b006ecee611c05sm8058930pfu.182.2024.04.22.09.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 09:47:11 -0700 (PDT)
Subject: Re: [PATCH 0/6] Add ivshmem-flat device
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, thuth@redhat.com,
 lvivier@redhat.com, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, anton.kochkov@proton.me, richard.henderson@linaro.org,
 peter.maydell@linaro.org, Bill Mills <bill.mills@linaro.org>
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
 <87wmqp3xug.fsf@pond.sub.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <a28f3657-c827-7a0d-a8da-b82d17d17577@linaro.org>
Date: Mon, 22 Apr 2024 13:47:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87wmqp3xug.fsf@pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: cS2ouLUeKRyk

Hi Markus,

Thanks for interesting in the ivshmem-flat device.

Bill Mills (cc:ed) is the best person to answer your question,
so please find his answer below.

On 2/28/24 3:29 AM, Markus Armbruster wrote:
> Gustavo Romero <gustavo.romero@linaro.org> writes:
> 
> [...]
> 
>> This patchset introduces a new device, ivshmem-flat, which is similar to the
>> current ivshmem device but does not require a PCI bus. It implements the ivshmem
>> status and control registers as MMRs and the shared memory as a directly
>> accessible memory region in the VM memory layout. It's meant to be used on
>> machines like those with Cortex-M MCUs, which usually lack a PCI bus, e.g.,
>> lm3s6965evb and mps2-an385. Additionally, it has the benefit of requiring a tiny
>> 'device driver,' which is helpful on some RTOSes, like Zephyr, that run on
>> memory-constrained resource targets.
>>
>> The patchset includes a QTest for the ivshmem-flat device, however, it's also
>> possible to experiment with it in two ways:
>>
>> (a) using two Cortex-M VMs running Zephyr; or
>> (b) using one aarch64 VM running Linux with the ivshmem PCI device and another
>>      arm (Cortex-M) VM running Zephyr with the new ivshmem-flat device.
>>
>> Please note that for running the ivshmem-flat QTests the following patch, which
>> is not committed to the tree yet, must be applied:
>>
>> https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg03176.html
> 
> What problem are you trying to solve with ivshmem?
> 
> Shared memory is not a solution to any communication problem, it's
> merely a building block for building such solutions: you invariably have
> to layer some protocol on top.  What do you intend to put on top of
> ivshmem?

Actually ivshmem is shared memory and bi-direction notifications (in this case a doorbell register and an irq).

This is the fundamental requirement for many types of communication but our interest is for the OpenAMP project [1].

All the OpenAMP project's communication is based on shared memory and bi-directional notification.  Often this is on a AMP SOC with Cortex-As and Cortex-Ms or Rs.  However we are now expanding into PCIe based AMP. One example of this is an x86 host computer and a PCIe card with an ARM SOC.  Other examples include two systems with PCIe root complex connected via a non-transparent bridge.

The existing PCI based ivshmem lets us model these types of systems in a simple generic way without worrying about the details of the RC/EP relationship or the details of a specific non-transparent bridge.  In fact the ivshmem looks to the two (or more) systems like a non-transparent bridge with its own memory (and no other memory access is allowed).

Right now we are testing this with RPMSG between two QEMU system where both systems are cortex-a53 and both running Zephyr. [2]

We will expand this by switching one of the QEMU systems to either arm64 Linux or x86 Linux.

We (and others) are also working on a generic virtio transport that will work between any two systems as long as they have shared memory and bi-directional notifications.

Now for ivshmem-flat.  We want to expand this model to include MCU like CPUs and RTOS'es that don't have PCIe.  We focus on Cortex-M because every open source RTOS has an existing port for one of the Cortex-M machines already in QEMU.  However they don't normally pick the same one.  If we added our own custom machine for this, the QEMU project would push back and even if accepted we would have to do a port for each RTOS.  This would mean we would not test as many RTOSes.

The ivshmem-flat is actually a good model for what a Cortex-M based PCIe card would look like.  The host system would see the connection as PCIe but to the Cortex-M it would just appear as memory, MMR's for the doorbell, and an IRQ.

So even after we have a "roll your own machine definition from a file", I expect ivshmem and ivshmem-flat to still be very useful.

[1] https://www.openampproject.org/
[2] Work in progress here: https://github.com/OpenAMP/openamp-system-reference/tree/main/examples/zephyr/dual_qemu_ivshmem


Cheers,
Gustavo
