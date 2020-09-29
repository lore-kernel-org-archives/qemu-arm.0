Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4889206lfq;
        Tue, 29 Sep 2020 13:07:00 -0700 (PDT)
X-Received: by 2002:a17:906:6ce:: with SMTP id v14mr5419335ejb.451.1601410020415;
        Tue, 29 Sep 2020 13:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601410020; cv=none;
        d=google.com; s=arc-20160816;
        b=gmzPqEeOaI/bTS+1oDt6obHJ6VGceR+Bn/Mb2lxZ/R+Z8NpC81g15O09TBD4ZIV++R
         EkSZW7YBZylekinDW56b6Aklk/A/cgwOk34s7rAzGpawh4nw9aDSK4h0Sb3E/X72yi/D
         Ytn6Jf5jO1UVtZasW3avj5TBOzK1FGkRYFQEjTGZ9YhYjJo9HlOfkRXasy0A+PKfo7u5
         4ZwOK7orGmNbSIQ+UVg7a/J3wrnJYqMzL5H+czGKXP93FUwS3O4DTYBmumGQjtYX0eyM
         qN5is5zJ6OomAyVIozw6UDdp612PBPAbtKnIghd+W2p4iW0ot2LVFNyGfxDGTde0mO2m
         2wOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1h2fvvT4OPp+mDt9BSuEIwI1NU5rX5oD8xSPHyS3oE=;
        b=stL0J9jQD4UtxEmdIejSI6+rV7iTYEw0SmJpRDb14H4K6/U9/ReiubXN6csJooNpBe
         ep8TKI1pE81tbV+h7JhbYhn7hqyNoCHW9kVqQW+MOAt/xuub/ci5P1LHBTCNMnxqOTBa
         MdmppiLyI2+923QpeB4JqHVHB7r1rduzoz3ZoDDbtwRweRnU5GKRKwDE8nhkKw929PF+
         xhftmnBstV7GBLlk/At5TznXQPv24jBMJ5+hRKVrbD0NxAnKs9SPnvBa4VX74eSUbRN8
         BLH436rLrhtkX5w1JVJ8fwSuiU4dwP5kuiCYaZlK/TrAaCbRFgpcCngJQz0sKxHcRk6q
         ziPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t0WcvVom;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z23sor3774554ejp.33.2020.09.29.13.07.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Sep 2020 13:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t0WcvVom;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u1h2fvvT4OPp+mDt9BSuEIwI1NU5rX5oD8xSPHyS3oE=;
        b=t0WcvVombLhwdXdTCcUWhl2itrZyb/IumcAxL3uVxGyb+WGHU7Uoz2ogoqkVeZAGQG
         gW2aYszOTJ2aNsbB+Z7NeadAmAPSpjGCuOEUp39eBda8VphQlH9gIWkuTtSj77LJ420/
         vF54QA5aweY79WlMUb7c3cN0o9CvJGUE+WTyQte3ECfZObuWUpdj9EPiWNEYkwgpj7GH
         ascElJ35lrz2DMJ0n/C6k96ywcVccRucu9kHhvLPb3qgPv1z0IcZoajuknEAnKVtrnzt
         ViwIn7o/SNtjAmnE92xgSNB+qc6WQwHs3Wp8lIFhQqnKMy71Vse1JvjQELUunP9Uqndf
         0miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u1h2fvvT4OPp+mDt9BSuEIwI1NU5rX5oD8xSPHyS3oE=;
        b=eHhz7Rv5x9qcNGc9QlCAsld2jv5510mSQ9E1pPUcdGbi3hqUmFdPpUrXhXCiTNuuiY
         kyJRPZEf3QK8edcwTejxRa9F6PWIf/VWpLq23tT+9exkYgnvDwqCR1v+lWgamdq7snkA
         bk5ZTjDVi6H9ov7xev137hDCwR61U+Dwv6IoUBswWBuYyfg8zzpQ84UGl0afDnSXRnOb
         PMymIBLX8qVHOvTdowoklJS18g9zp6vyuqU2cawaN51CVLqYWqK9RDISE0sELto7dVQE
         +Uf+1wy8373M2SvlaB7qmdnHTr4vsv2PR+nUVaidqtnE0G4YrFOG+kDbqSdbb/CXiduu
         MUnQ==
X-Gm-Message-State: AOAM530OL5mhqLT7MT4auZRqh+xV2A3qADgrH7M55N3gAAFF7d4istRp
	XShAz6NWT+KAD2B32/uihgtqJJS45e1YLdDo1MSHNlK8
X-Google-Smtp-Source: ABdhPJzNvPmfpqeFF5weiJ06WOCbfrwLMo30g1vXELPjVSGmAHTe0OlZZUhZENuMjibdqJ8Ah+loAU7hXvzaKksnKQA=
X-Received: by 2002:a17:906:d936:: with SMTP id rn22mr5774019ejb.4.1601410020098;
 Tue, 29 Sep 2020 13:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com> <20200316160634.3386-18-philmd@redhat.com>
In-Reply-To: <20200316160634.3386-18-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Sep 2020 21:06:48 +0100
Message-ID: <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dnNqgPzCf+GY

On Mon, 16 Mar 2020 at 16:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> When building a KVM-only QEMU, the 'virt' machine is a good
> default :)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index d0903d8544..8e801cd15f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,5 +1,6 @@
>  config ARM_VIRT
>      bool
> +    default y if KVM
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VFIO_AMD_XGBE

What does this actually do ? Why should the choice of
accelerator affect what boards we pull in by default?
I can see why you'd want to disable boards that only
work with accelerators we don't enable, ie don't build
TCG-only boards unless CONFIG_TCG, but this is the other
way around...

thanks
-- PMM
