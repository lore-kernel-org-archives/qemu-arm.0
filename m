Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp548882wru;
        Wed, 1 Aug 2018 02:57:43 -0700 (PDT)
X-Received: by 2002:a6b:19c4:: with SMTP id 187-v6mr2717200ioz.244.1533117463659;
        Wed, 01 Aug 2018 02:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533117463; cv=none;
        d=google.com; s=arc-20160816;
        b=XQK8qqI0cTNNfcoRl8gGvwQ6W3XvIQIo/HRxiw2rR9HRIfPDJqYBsxJsL8X2JMtkkg
         PTcIbMKLohOpB5oWpfSYvNK3XeGPY4qNPBdjck+bM8MqnSibT5Y/rrCYp2IocjSoiYYH
         3BGtdsHaJX67ScirgF/pULwZwUxYpbNcj1A5dEt62jyoFF2MJ/raFdIqfyGTkLLHmMnQ
         yWVtN0aIdbjWren2/na8JcFKIc9E1ZeAbJEoFE0atIRtCJg2ikjoJOBiAMOVOuUHCaQi
         T5umRH5CkMAUR8pSiqHsjTvpwbnx5TMObuXUHejbahcgJ1QUkggUSo+jC7nI2YxOJ85r
         DK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=87/beiWaM1xkkyb0JMimnasobnymjP4eEdp3LwZAsrc=;
        b=Ak2Rnm81R2L5a36BMySCsWIC5Yrk5laC1aCdTkJeeCAq9dQaQ4u/rsWoyyoTZ30cJL
         +lNvVaG+ELTjPKsiAe8R9dxZzjZNOJ/MlSfWkIcjX4ZnSJVr/q7PVf8E08bkOUTnUqwR
         87mrZ42NW+R9Yvkkwu0/lkCACnFzo56300lRzDzlDgZ20yoFDXF52cRE0QZ8zvo1wKsM
         xEPiwW4+kUZWWna/qo5EzntOkfJZOs7woBqyHjulrrH+n7RWA8wOnuAzTXTof44tG/zN
         rPskFYZVHTptIUod4P3dk0+NhAHBamNwWYr0fwHLiRCT0CiDKxnXgrOZ38KZrE5dJRKv
         HBpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/ehTsBc";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j17-v6sor6860467jal.27.2018.08.01.02.57.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Aug 2018 02:57:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/ehTsBc";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=87/beiWaM1xkkyb0JMimnasobnymjP4eEdp3LwZAsrc=;
        b=G/ehTsBc5qfud/4qk35bHsvfbOjzwBPIQvy+uGSmSWAeE1ekEDbzLaSwwrVpfvmJJV
         9avZSHNGnSUXjEotZ/fwnp/NjIpvuQJh8mYjh5Y1KFJHCQS00fmXML5oDW1227Exa1xz
         4F6tNpO8YEu0+mGU034Vawr0ccUUGtHpRR+pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=87/beiWaM1xkkyb0JMimnasobnymjP4eEdp3LwZAsrc=;
        b=a1Jnu2yROkYsdvrN69NsXHNwTEmAc8gOBttsQNUCeW+jryZUyx7lBXBuGMiWJfQWc4
         a6WKfG1WHfiFGv5abPkYhIFbKszyKw3uuxXcTi2UCSh6rWeyRy6aPdCA+1Ihq4ZTsPcb
         FdHH252YJFC4GT9wiONDtnc7mcw1vgVTad2CYkPI05avLpOnoJV44AjloXqb/n0PMBZ0
         NOC9jz50uRVV5fIdnjUtUJVTrNSfbfeGb7aKsMNx3hTAK+Jsu8MvSyak8ffZTJRH7TcD
         LvMSVjY8WHaWqrHrXWc0SWv0/tsdLz0vTqFcwEu+brgx1ArdpVkFYqdx1bHXmIWvqfh0
         3nbA==
X-Gm-Message-State: AOUpUlE/TMwxDrr7d6/UHyhmzAk+oNDyDD/n11BhLgo7zTVzlz4cueF3
	S8QUqkoZFA9hCAoqaf8jicTYzoQSmQ8oIaBR23DEt1xn
X-Google-Smtp-Source: AAOMgpfsJ35qUOyLHIUIyKtvNaYheHsdh4Gszb22wHOOICvDLRWJk+EZke0TDXa73FvehZkrrPakoJFUfH4SVVig0bw=
X-Received: by 2002:a02:b804:: with SMTP id o4-v6mr24101294jam.12.1533117463357;
 Wed, 01 Aug 2018 02:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 1 Aug 2018 02:57:42 -0700 (PDT)
In-Reply-To: <CAFEAcA-v+tOzub5V1_3stzNYX9M7hHX0c__jhSWM-q14QdtoTA@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA-v+tOzub5V1_3stzNYX9M7hHX0c__jhSWM-q14QdtoTA@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 1 Aug 2018 17:57:42 +0800
Message-ID: <CAHmQWvACMacPDzLgwHX4GRhHOX_0CmaHb0KEkE-F63_faN3zew@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/arm: check fw_cfg return value before using it
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: QOHYkALnn9BF

On 31 July 2018 at 02:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> The fw_cfg value returned from fw_cfg_find() may be NULL, so check it
>> before using.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
>>  hw/arm/boot.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index e09201c..43b217f 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -930,6 +930,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>>      hwaddr entry;
>>      static const ARMInsnFixup *primary_loader;
>>      AddressSpace *as = arm_boot_address_space(cpu, info);
>> +    FWCfgState *fw_cfg;
>>
>>      /* CPU objects (unlike devices) are not automatically reset on system
>>       * reset, so we must always register a handler to do so. If we're
>> @@ -960,11 +961,10 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>>              info->dtb_start = info->loader_start;
>>          }
>>
>> -        if (info->kernel_filename) {
>> -            FWCfgState *fw_cfg;
>> +        fw_cfg = fw_cfg_find();
>> +        if (info->kernel_filename && fw_cfg) {
>>              bool try_decompressing_kernel;
>
> This can only happen if:
>  * the user provided a firmware blob
>  * the user provided a -kernel option
>  * the board does not have a fw_cfg so we can't pass the kernel to
>    the firmware blob
> right?
>
Yes.

> I think in this situation we should exit with a helpful error
> message to the user (telling them that this board model does
> not support using the -kernel option when a guest firmware image
> is being booted), rather than silently ignoring the option.
>
The suggestion sounds better.
Thanks.

> thanks
> -- PMM
