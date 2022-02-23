X-Received: by 2002:a05:6a00:84b:b0:4f2:a695:e356 with SMTP id q11-20020a056a00084b00b004f2a695e356mr1284335pfk.0.1645650497809;
        Wed, 23 Feb 2022 13:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645650497; cv=none;
        d=google.com; s=arc-20160816;
        b=oOEjKo3u0TxcVIZvpJRBrlHCdqMb/692ovEbtN3gVLhBWiJj2g81X0Y1MRpv8qev2Z
         8IAkXqGJA2Gyzhdx/ipxwQT/gECYd3oFwN7c0kjiWSsnkCgAwpM3zGlRm6uP9H1Kw7hJ
         LbJ1Pq2DmlLUGCr5hHCjq1f7tYtc1a76TL4RPHp5asP+YaBkqijexGV3i/klWo+GCNwA
         MBbnQWkbPe55enq7RC5YFwmi7afhPZOmCHe2lR9CTIGq1jOmiXgoqquesHnuDxG1TpL2
         cvRK004TwqIpOYDU4+nG9rOd3znNHLDpFMQ3HBBmrdcxOIkJCNt6beha0Gu1W+pegpTU
         We8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RFYKdFTsbQO3bEEyKaK1brSyEmCsvoxwTKwRAI+NWNA=;
        b=IIT9xrsXxnb8hnFzDCziL/0/zfZ9oO64c9/hJON7tfqVZgLt7gGPg9mLrQ69G0rhyM
         JBwCk6C5SXW9x4vzIkhqKY1piETpS8rtbzd+kpxAV3erzSMcXOxGOw3nQ6Rn/07LG5pY
         GxaBWKUYS0IvX/lboSUOeBQbw5WWQlImEeuusAkIKO78+gsHaPjfu3EXkV843ijxjCrn
         OALOILpz+rpP3L84snnZ8j0G+MSlhXEwN9MCs+5qbnD6yZss7gTZ/5lZArsAUPWDJ0jv
         0EC134fs2mBOwcvTxPhKishSgaih9kg7R15/v7sIsKbSEa5OuMFmWPYF/iqVzAxkoIfy
         tJlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B45AlJOs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b15sor459569pfl.71.2022.02.23.13.08.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 13:08:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B45AlJOs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RFYKdFTsbQO3bEEyKaK1brSyEmCsvoxwTKwRAI+NWNA=;
        b=B45AlJOswlFnz5roxQRT8AosqcG1p01odz0UEO5kjPqN08vB7xUXv43AbkBWdy9GAK
         J/guCuMB6viy37uLCImMJ9WplSvqeWBsvQKjdWyDO04/Y6LPi04YF5Jy6UhgOrp03YvY
         PbNZnk9vh6OvQ2dhQRelw6Y6d/lFA9Yz329RAITWpzlZHe6qY87IjQ1pZ4wcnxIYPjpl
         1y8/SCJU2lmfqXF916VKkj49HvkLWdrPdftQVuFsV7X4BQCoQAs+sG5lIawbzkpMl5yL
         f35Y1w4OTvQzt5S4a7/QgN6u6T7nqtBPprtU+AHryCtqERQhfduFcwP9E8HwdkPaTBeG
         aJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RFYKdFTsbQO3bEEyKaK1brSyEmCsvoxwTKwRAI+NWNA=;
        b=CM1c6XQRUpKWR/hxjAYuFyURCcJGTSYA28uAiw2DK2/cdRZ7zP3AmCken5Sr4/QEPJ
         4CLO6LGGl9cSWjp2XVIXpIUREdQMA1N+yR3Mh9rRaj7cwtFL3H3wTC4CBDz2IBz6MWwc
         bQ4CeQD2WaSHSQ8GaRG7ZnXrG1KJdgV3IlNZmbbeH+MbPQLJ4v+VCVdhF5aTGxYLUrSE
         kQQhzSXKBSb4o1POuD0jZQigdpuh+bZgoNsxrGEHt5SlHadGk3qUDDCudHBWJnXuSstk
         e2emyeJE0hQUG8CImhlYv+JFoUHJ1YQ4fDtKWeLThuA8b+ZxANc2dGbLpe1mlC2MwSEQ
         1okg==
X-Gm-Message-State: AOAM5327OspAQZ61f3y4+9edUMs1xFY0RrQIM4KZa6Tkbiew7pNXHsnQ
	PqjgoecUCUvy6RccpvS5XcmTpg/t
X-Google-Smtp-Source: ABdhPJyRSSSgOC6Jlce2XD5TMe7fghQmVqecWAekrkUeH18a4mEP/VbrYiNK4vQ3qWdQo1Jg1JSDFg==
X-Received: by 2002:a63:f10d:0:b0:370:14d9:c1ce with SMTP id f13-20020a63f10d000000b0037014d9c1cemr1208748pgi.50.1645650497225;
        Wed, 23 Feb 2022 13:08:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id b14sm452478pfm.17.2022.02.23.13.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 13:08:16 -0800 (PST)
Message-ID: <0dd73491-0568-cb73-9184-0d8b1422fbb1@linaro.org>
Date: Wed, 23 Feb 2022 11:08:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 2sbFMwsRXk51

On 2/17/22 04:07, Peter Maydell wrote:
> This series seems to break 'make check-acceptance':
> 
>   (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
> (900.74 s)
>   (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
> (900.71 s)
> 
> UEFI runs in the guest and seems to launch the kernel, but there's
> no output from the kernel itself in the logfile. Last thing it
> prints is:
> 
> EFI stub: Booting Linux Kernel...
> EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services and installing virtual address map...
> SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
> (0x0000000000000008)
> 
> This ought to be followed by the usual kernel boot log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> etc but it isn't. Probably the kernel is crashing in early bootup
> before it gets round to printing anything.

Ug.  The v5.3.7 kernel we're trying to boot is actively broken wrt LPA2:

ENTRY(__enable_mmu)
         mrs     x2, ID_AA64MMFR0_EL1
         ubfx    x2, x2, #ID_AA64MMFR0_TGRAN_SHIFT, 4
         cmp     x2, #ID_AA64MMFR0_TGRAN_SUPPORTED
         b.ne    __no_granule_support

That's an exact match for TGRAN4 == 0, so the LPA2 value sends the cpu into a sleep loop.

This is fixed in 26f55386f964c, included in v5.12.

So... we're going to need to update avocado, or something.


r~
