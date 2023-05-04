Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp158582ejq;
        Thu, 4 May 2023 01:58:59 -0700 (PDT)
X-Received: by 2002:a17:907:1629:b0:94f:7844:b0ca with SMTP id hb41-20020a170907162900b0094f7844b0camr8086202ejc.52.1683190739238;
        Thu, 04 May 2023 01:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683190739; cv=none;
        d=google.com; s=arc-20160816;
        b=d2vYqhHqBFJXy2sfhROBn/j8aMHA+FKPRokDoSIfWaUDif3UxyZra4WI6zztYfsyQp
         RWEjauAWwbSjznJDYv9NyzqYhjt6RI0Co0YcjILlDJh9EIdZO0pqwq84uknpjgY9v7aE
         Vp6r7bWaCkrpWP53lDaqaPe/xTIAT5KqgRywCusZL/HvUywkzsF8s6yiMXuHtop1aXe6
         wUfEz4j3ATYe5YUH416UMQbR7ZR405dc+rcWcxMpPaoGwapk2VkKA2g9TIS0VVn+JQAo
         XgA5wOxLtWb7wpbxlweUX6NPIJt52SLEeDYTp7295ZDTvfj7UrthlXxGrteKOLFD9HyC
         0DXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R3mSHr8LX8Jlb3iO3WxDX0U5YHuTcyztxi8aDXDMHVk=;
        b=Kzup8f/V91oPDdINusMDR3OSDPLElxonghLr7DvdDHcjvV/QOq/eaXq2hlHmYWGPXf
         bJ6GipVruPM/beBVFuEwjNUJRpa67uu6dfBxtb2U/68nlBmxtQzCDvdH8qmw7uZiZn0h
         HbBIz5tlmW4QhfkXqlnki4uj3HIZmIJQNsaKS3nPD9mLpPmkOAMfmawt92LeJGn7qXnC
         FSUQZ+vDZQUN+/dMK/dmtDFbGnFHznRA5KxavtT9I92Lqi/0sgyQR9Yig+ST2SjjvmXm
         dmCgbMO5NhaLBLpAk7wFWJqIFouUTVCNmK9S1YNxXiqZHXwXnf3+N18e/BSJPWvJ3VTn
         nnzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W53RnxM4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a28-20020a509b5c000000b0050666eb54ccsor1794352edj.1.2023.05.04.01.58.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 May 2023 01:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W53RnxM4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683190739; x=1685782739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R3mSHr8LX8Jlb3iO3WxDX0U5YHuTcyztxi8aDXDMHVk=;
        b=W53RnxM4qKooiKf0a1E1rtSMY3H/E6ZGPet1wQC6m0pTURLs4qkPqCyMRSBOGHUH6Y
         wcB3Na6pgyA/N5iPa8aHwkm/hm6sc7Jhyd0hsEgy9G1v3oOtQt8DpkiUCFHz7rrrOgJ4
         SoVmZgxRy661OrycHvvdIW3G+nSUGWqCp0IwCa9QQqdycJIqkvSLWGaFzTyb3mv/9v6e
         kwO4yaPmpmTgYyYGwOPpwdf7GEPmCpeci5fuGYips3ostq+AvRXfWk2bV2nGdCan4atr
         hQppMXDCbXF2V8vMoz2+QKYG+pwPkhcGAVhQgZognIem/U5X2X6z5EUMdvGjQvv7Kbls
         G+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683190739; x=1685782739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3mSHr8LX8Jlb3iO3WxDX0U5YHuTcyztxi8aDXDMHVk=;
        b=Z/AEBCp78EnSzptWjZkBjt+bcZST0PAVw8jBwGGy/5xtaFJGf7AGsxhxTCetfUrKt8
         CsJ8MXV++axyGgUInv7y7yBTcE5hY6TV3ZLzQKjIrW2m7P9HpYhEA5BqSwffoNoC3T8r
         zRVzz/tjg352clvPDYCpErP/aQVVg3ca+jutWvLDt0FIoK6+yPZCeOunRGE8Gt25K8ee
         mk4whpKgqzrM4JuhcyzRGepEYoPwi2lXDnDEh/Q73qJkb5UPLWYTq6Ec+rDpqewoiZ7d
         jj1sMPLeWlom/YKaqz7bIg5Rg5l6WVogDsAb1LckWhsnwnTzEn0zyDwYMb2L2QCCmehI
         SoBA==
X-Gm-Message-State: AC+VfDzrGg/urRLZjLjfB4CEZhNF8O/Myb0y6WGXzRF5MkWs2cc9QOJ/
	CX8NY3ishze/CoHzHmmew3T1wQoCHWZZabQtFSYihHJO1UbFUYEVPuc=
X-Google-Smtp-Source: ACHHUZ7m35qj2uFEcMJ185kiR1wA9Y97qR2kWkJ/eiuIPegHBm9xaHB9FLpFyyQC8ug/RI3E5z13Q/KaWa+YsBS/BRU=
X-Received: by 2002:aa7:dac2:0:b0:506:bc26:d6a9 with SMTP id
 x2-20020aa7dac2000000b00506bc26d6a9mr1177720eds.8.1683190738910; Thu, 04 May
 2023 01:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230503193833.29047-1-farosas@suse.de> <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
In-Reply-To: <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 09:58:47 +0100
Message-ID: <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for semihosting
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 2MkBX08HS0Mg

On Thu, 4 May 2023 at 08:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/3/23 21:38, Fabiano Rosas wrote:
> > When building --without-default-devices, the semihosting code will not
> > be available, so check the proper config.

I think the changes to the ifdeffery are conceptually
fine (only do semihosting if it was configured in), but
it sounds like there's a separate problem here.
Whether we need semihosting depends on the accelerator (ie
"is it TCG or not"), not on what set of devices we're building.
So the problem seems to me to be that --without-default-devices
is causing the semihosting code not to be built in.

> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> for this change; however, there are two more related issues:
>
> 1) you still want to leave out the code if !TCG, because KVM is not able
> to exit to userspace on semihosting calls as far as I understand
>
> 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
> config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.

Because those are the architectures which have
"arm-compatible" semihosting ABIs ?

-- PMM
