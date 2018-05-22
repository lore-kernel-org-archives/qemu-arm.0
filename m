Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1790784wme;
        Tue, 22 May 2018 10:51:28 -0700 (PDT)
X-Received: by 2002:a9d:2a68:: with SMTP id t95-v6mr17526903ota.320.1527011488707;
        Tue, 22 May 2018 10:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527011488; cv=none;
        d=google.com; s=arc-20160816;
        b=B3nyZKV2dHXn2oND8V1U0VOrbE/lbegtqrtU3lSs7N8hGrRQK6anF20OCXGYEq4Wgj
         2/R1JNZxosWV7cZzp6PVDAkBCc48pulId2mtb0E50U36Gh5vCw9zc6i8cW1/tbagNSwi
         0Nms/r+U5G3EmmzgXBYxefVWmDtebhpu0tFzmim6Z4Lb/m61KiO7Qr/ive94yRoVMBPG
         WzLo1kKiI6Q2L2JjycczbDX0vCAjT/fEnINsomNwLbfahRX10XkALswToVdlB8PFJgb1
         VqLxQwNyLrz5huOj+VOWFT2IM2tuKgvypGVHY3fNvibVlWs2nJA8GEeEYDQU+8I3aX7m
         NFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=/PVln0f8J5th+SQ2PI56tVospFJYpvpvvz8c88u+edU=;
        b=sQjZQiJTf9rBpOzDyoq44KXi9TujoZItPUDFRY4xB5x31RvrDYuxeDAY8yZ4sRGATa
         ox1I5KvY4p5eVdrpiE+t3m9K3mt6RGNT2zyd9gaH6ZIWWOLQ7Shz1qXbnrNpj8u+5Wyg
         gzhOeneLqcmk72c9m5H+CapWqb8mxHKZADctEqf9ZGWWQEROOr0Zvazora1ZcD3QaeUU
         y9gazdnyndHYJ8DbTdO1H3cvecoa4ItbeFTNq3G8W7KAg6FO1kO8o9Q6FVJ63cumaCtz
         s+vUDpwCo72NIQ85q94ZLbe+1AFwzxbrLzBhDxWumtCtdo4ugaQoNJqSy+DghChT+TOC
         so2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVFd2hIW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d185-v6sor8318868oig.316.2018.05.22.10.51.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 10:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVFd2hIW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=/PVln0f8J5th+SQ2PI56tVospFJYpvpvvz8c88u+edU=;
        b=BVFd2hIW1IrGnIQ7goADtfI2OqoI/Gxn25jz836eA5cwxlMgS3X6+BG2XE4QDDhCHG
         5gTK5RW1woC7Y6IRWotCSpTWNjszaQ8gxtdrKuvgbT5n5TVuNu1ixsV4aEozhHJ05L3c
         f389Xpgq61IIpfWELZsCu8noLAMyrjYpSaJCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=/PVln0f8J5th+SQ2PI56tVospFJYpvpvvz8c88u+edU=;
        b=tBB8BLKrBuAZgqpKyITfvgd9489KYrGOKSbM0p9UJoBi90IrdnsU0lhBd+0Kh9jITu
         spENO8DegRlC9z5BhTLUlp//6WNet4MBepjIU8q/TKsUaIxlTaPOgSC1zSSNV6DQrZV3
         DuVm89iuv63mSsA6CAYLu1gVZKKokcD9K+fM7z1Qfm8X6QkmhFzzoFl+qSfohS1NsuMb
         rdcQXFvz57G4hrcyblSBRgOZ1lgHimxNV7LYtQfWm5BvXPf6/vIzzxeb21/MJGWwmUSN
         J4JPflM7DLYwj3OUlXu3ZC6hGK26iGYCxZfzwBpn0YByYGMciHatvBD58bIxyleGU8ii
         OJUg==
X-Gm-Message-State: ALKqPwdKMP1mOm29GJ+G6jUjxZRWyv6NbBjtvfxfr05cPcMnOK+x6xOq
	MYABxdG4+LEEf3dZWcHZLqDQRpWBRm6KpVxOotgIGWKR
X-Google-Smtp-Source: AB8JxZrCGMMf4IHykkxz8Zo2/VO2k+heHAal41Je14rmaRVWnMO4KVI6aJqSbFfMm9rqWZxGFyfLwQ/vNNjJ2U8hQME=
X-Received: by 2002:aca:4384:: with SMTP id q126-v6mr13563015oia.164.1527011488354;
 Tue, 22 May 2018 10:51:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 10:51:07
 -0700 (PDT)
In-Reply-To: <5655dec4-6d82-a02c-2155-300c4baf1adf@twiddle.net>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org> <5655dec4-6d82-a02c-2155-300c4baf1adf@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 18:51:07 +0100
Message-ID: <CAFEAcA-Cb2sLTz1RNiiPLm=+92poENNF9WHuJrgLe1VGHnPV8A@mail.gmail.com>
Subject: Re: [PATCH 14/27] iommu: Add IOMMU index concept to IOMMU API
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: qIFj75ff+RQR

On 22 May 2018 at 18:42, Richard Henderson <rth@twiddle.net> wrote:
> On 05/21/2018 07:03 AM, Peter Maydell wrote:
>> +    /* Return the IOMMU index to use for a given set of transaction attributes.
>> +     *
>> +     * Optional method: if an IOMMU only supports a single IOMMU index then
>> +     * the default implementation of memory_region_iommu_attrs_to_index()
>> +     * will return 0.
>> +     *
>> +     * The indexes supported by an IOMMU must be contiguous, starting at 0.
>> +     *
>> +     * @iommu: the IOMMUMemoryRegion
>> +     * @attrs: memory transaction attributes
>> +     */
>> +    int (*attrs_to_index)(IOMMUMemoryRegion *iommu, MemTxAttrs attrs);
>> +
>> +    /* Return the number of IOMMU indexes this IOMMU supports.
>> +     *
>> +     * Optional method: if this method is not provided, then
>> +     * memory_region_iommu_num_indexes() will return 1, indicating that
>> +     * only a single IOMMU index is supported.
>> +     */
>
> The mispatched callback has been discussed, but would it be equally useful to
> simply have a variable here instead of a callback?  Perhaps max_index instead
> of num_indexes so that zero-initialization of the structure does the right
> thing for existing iommu's.

That wouldn't allow for multiple instances of the same class where the
answer is different (eg "my_iommu->has_trustzone_support ? 2 : 1" where
the answer depends on how the instance is configured via QOM properties).

thanks
-- PMM
