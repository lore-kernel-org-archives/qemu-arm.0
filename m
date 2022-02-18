Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp417042lfq;
        Thu, 17 Feb 2022 19:48:02 -0800 (PST)
X-Received: by 2002:a62:1507:0:b0:4e1:5bc7:840b with SMTP id 7-20020a621507000000b004e15bc7840bmr5931565pfv.21.1645156082627;
        Thu, 17 Feb 2022 19:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645156082; cv=none;
        d=google.com; s=arc-20160816;
        b=L3XGSmgeljLkIsWlAULUTVzCq1/ZOxDXqtF4kDErT5Igd0SjFz63UUFxIBKhANUUZA
         rf4VzM4CjRRR05SnuXtsGWwOyQw2rz8n9XLSxW9l5ypitm0T8Gh6rp+NZyrVQz0TE6ru
         0QM17uzy8+oO3Ikwr0w1InCM5im72qbFtII/Yv2HatYJj3RZ2We/kmrq99XmFTkRZl/T
         lTIyE1d/otzgIMybpL1jWzIOyc1hc0t9k/OiA9GqHUvQ9BCw++aGADNLaF86T4m8rnED
         2zJhYPF2IbSUNkVDTAyN5xtv399gUV1ScsWygUtAWVCQ2sdqpWP21Rfg/aVlibzzr/iQ
         Hcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6N1EnLMGnEq8wQ5a/od9AfA+7poSeJEV510Fw3dyECY=;
        b=T70MoggJ8aHFT2b1Vm+4IVoiu1toAO9smhosrVDu0/GfWnXttK0eS97B9EdP0x/iFX
         l2b66nuN9A+o+FxnKQQDNp3BQxjmlpfxqJBHvfd1wpiiBGDlK66d6WyAoz3fLGO2imS0
         F3D/Pg3gn6U1Pd+nh47LtSD5sd+JsoW9PAXzToUl2snnHpKEkjY1bpAzS9Wt9OfKfJxy
         BbN9kfX+2qw2oZiJ8Qea6SwwS7W7I1UokbSaoFPeIutuFwm50O8nG+G54BYVO8ABKcDG
         BeT53ld0x43Ygq/VyMZiG2WLtKyb6Tlb0V1yaW6vU7S8bq8JHs69LccpIedzthGzuPJ6
         aA5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBnWBbRO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t39sor821669pfg.45.2022.02.17.19.48.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Feb 2022 19:48:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBnWBbRO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6N1EnLMGnEq8wQ5a/od9AfA+7poSeJEV510Fw3dyECY=;
        b=aBnWBbRO91L74bZC61aTdvoUO7mw3c9WEATCetT84kAPTIx91AoAtrFRLoM3feAGdp
         KUBrNPpTaBN1ODp6u7+CNFgj0Nqgay8YG3QZqbsCDS2Mi+Q4gS+repA0BP3Z4HoprNAu
         7aI0/NmQHt/rY2Hj85N1FYt0hKNbyRyho7mgWIw0nUq2NbkOeLXUCFS2rSj/+caOB5y1
         C3iS6yfW89BSkVUSpwm04EdG5iqc+PATGt8VUQ5Le0Ji0K7iy6dHoXqdbnT+W39tc2mS
         6wJxh+1Zb+6vE9r0mCSFeqP6oH8hqYcfRyh/vEWQ96ZXdQRD1mPdJoYODSMo9og0juEW
         Kd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6N1EnLMGnEq8wQ5a/od9AfA+7poSeJEV510Fw3dyECY=;
        b=1uqNgog4y9thTUyvHJoVWOKT7vKSnR++tkfT5qcDCLdypg0/yvsHLx+xAxlM4AMB9S
         +11Vh8jdoP08F3hv1mdhwid5LaYm0PB5NvK+WtdQ3q4Tb5wsRs6vowFPBXFr4MmVXVcx
         IGAfgGoWtXjhwkOrAn5poWtnHB1+nQKLfEoHPhKHRMf5INze2BkTn5KOqmgFcuiGVSWo
         Q1d158Ik96MdcwFe8k2nA5TrwqHTD0ERuMsZ+klEXD2TzQ1eDY6yWvAJ/TkxBlRXtx97
         PthIxEgO8wP6L+zdabRm4X2BNLdhePoiSXCQTpBl4EU4I7a97dhUaDIPRpln0/iQ58Nk
         tkNQ==
X-Gm-Message-State: AOAM531tFUuk8chh25+QcN/njJbeJpxg1iktwp1CEMeebtlDaezZd1iv
	03G4HdvRcTfCr8I2VyeT+O3KthOqR9RfQtQt6LU=
X-Google-Smtp-Source: ABdhPJwH+pXR+AhVLQLP7IZ6GXvkosY0yrJgigrFJp+kgmd9tMeK7pWtXkLq75pkayH1vT3MIIDFAw==
X-Received: by 2002:a63:ce51:0:b0:362:c4fd:273b with SMTP id r17-20020a63ce51000000b00362c4fd273bmr4817719pgi.540.1645156082068;
        Thu, 17 Feb 2022 19:48:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id c23sm1001460pfi.136.2022.02.17.19.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 19:48:01 -0800 (PST)
Message-ID: <a8dd9d30-843c-0510-db1c-de965220778f@linaro.org>
Date: Fri, 18 Feb 2022 14:47:56 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
 <87v8xd9yw9.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87v8xd9yw9.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t0D1yNLCxA+s

On 2/18/22 04:37, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 10 Feb 2022 at 04:04, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Changes for v2:
>>>    * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>>>    * Set TCR_EL1 more completely for user-only.
>>>    * Continue to bound tsz within aa64_va_parameters;
>>>      provide an out-of-bound indicator for raising AddressSize fault.
>>>    * Split IPS patch.
>>>    * Fix debug registers for LVA.
>>>    * Fix long-format fsc for LPA2.
>>>    * Fix TLBI page shift.
>>>    * Validate TLBI granule vs TCR granule.
>>>
>>> Not done:
>>>    * Validate translation levels which accept blocks.
>>>
>>> There is still no upstream kernel support for FEAT_LPA2,
>>> so that is essentially untested.
>>
>> This series seems to break 'make check-acceptance':
>>
>>   (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
>> (900.74 s)
>>   (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
>> (900.71 s)
>>
>> UEFI runs in the guest and seems to launch the kernel, but there's
>> no output from the kernel itself in the logfile. Last thing it
>> prints is:
>>
>> EFI stub: Booting Linux Kernel...
>> EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
>> EFI stub: Using DTB from configuration table
>> EFI stub: Exiting boot services and installing virtual address map...
>> SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
>> (0x0000000000000008)
>>
>> This ought to be followed by the usual kernel boot log
>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
>> etc but it isn't. Probably the kernel is crashing in early bootup
>> before it gets round to printing anything.
> 
> As this test runs under -cpu max it is likely exercising the new
> features (and failing).

I would have thought so too.  However...

I've bisected this to the final LPA2 patch.  I have not tracked down what exactly is going 
on with this, but it's definitely not the guest exercising the new feature -- there is no 
upstream support for LPA2.

I'll keep looking.


r~
