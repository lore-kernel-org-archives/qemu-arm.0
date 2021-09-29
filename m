Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp242268lfp;
        Wed, 29 Sep 2021 03:35:59 -0700 (PDT)
X-Received: by 2002:aca:604:: with SMTP id 4mr7298217oig.8.1632911759638;
        Wed, 29 Sep 2021 03:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632911759; cv=none;
        d=google.com; s=arc-20160816;
        b=DEUQn3Jb2V/Sxt75EB/FxpTl0UMI8CBxkmlkPP3YuJ/9EFyREUg34uHXpC1Gi+Z5s3
         IwIt55uBcfocIs3k5OFVA3zoMXAziBDcV7t3LCDWNrjML/402P0EZOcEF4DcHtJCwiKR
         CnGIE494X6fokSiJGHY8BzYsAJqDaTgHva2/+v0AmA3l8jI6U/E60MWgy+1omyr4IuE8
         ZqJEyIiWH92b0sM9DoJ4CvEh3uRSazroOTV7qqojLMfmc6sDvaTlk41ACrMGO/5sGXZI
         JatCawPkBrRrnr/dA/Lx8LS3SNfneqxCcbflh/o92up6yT+1DxGdhNuhrE68IOLyl0Az
         vzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=74D0ijyOzryeni2l1irFVj9koOUxhNUudc5iXqoc2MM=;
        b=NDaGbtfcH1ZA9i02YoLcaSf20Nco76nX+vCRGDxQj2Np6T0mxd173Gii4rRdwzTqTW
         l87J7ooXsiwF7aE/v9R3McgHYdPUM77qQjHWNZab2tVEnoAlc5wxaoA98tKzF6+Jd/qf
         WwPNvFNvMnOTIWwgnA8BbnwlvPGMrcuVDnBAxY92CxQEBjn6b80ag+pJIo9W/ACY5WF5
         zQLgKjrWl7cKgn/4hSxgDWQ3MNu/tYZzBJmsdtQZF8wo4kos5gX4cUKbuKwGygGpQ8Bs
         tOsZcDZojUsdGAjHPoHnj0qKKbYs9heerSlIfBRP32klGFdGbF0FOvDBoSYmys0ENcSF
         ummQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKh61Fib;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3sor536756oih.81.2021.09.29.03.35.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 29 Sep 2021 03:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKh61Fib;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=74D0ijyOzryeni2l1irFVj9koOUxhNUudc5iXqoc2MM=;
        b=GKh61Fib/Rd/XRqeo32JfJkDvt3FiZnGMjgzXuDQc3krNcisYwIyzmLRrKQWQ0z88i
         uMGKUPxW9g7077UVyB3f6V1tis77bFvWeiiUi5f01m38SAjSoPDXt02TXNnBaiYUTcjU
         3qm4NaSxg8zvbIA+RnEp+v1cIbOc4HCbdYIj+nWFF+hGn6A3+RXmKIHt9prilSinChHA
         L7Vpgem0F+3TFscAT7IWdJmDWckdAq9iQ2b3RGIOgjPTG9w1Quyg7XLjkTfaUovocsSO
         s4nYuvUceFrEQl3lNT9kki3crcSOpLPhP3im2oJQ94PmYyJTVbdRd1HGi2yz7W9Md5mX
         vDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=74D0ijyOzryeni2l1irFVj9koOUxhNUudc5iXqoc2MM=;
        b=kmM9hQ8U0jYH2etWDcvHSJVBqPSAQ8+j4Oudo5bJVOiSc8ve91PuVszuNSqbI7Jtef
         k66oxOJmuntjtB/IlMHegA2NAKatnDUm1qXjtWhfMsey+L1iqIr3K8xK24OaffwT837s
         OWxY2zwpzacvfKt6KadUEHLsMqfct2HnyEklPVAFuDtYSXqvijOGc+gyYrfCqYMQ//Ik
         G7O5ZlVJSB9RfhF2CbOSjqcBs9LAhoLb1RVY2zrK26/PmwFx+PHCGFUirFfmtSwb/St6
         578bRNyxB+zk/g6kVWKVeTeMAD1g4jZEV4dxOv87HzhgB8pLo4AlBph5MjucJrwxeurO
         ff6g==
X-Gm-Message-State: AOAM532SSksADpe5jdtRW6lg6H20VnSHfpVA+Xb9q/MvjG+E3x7VHvA1
	QAOqwnUMU0FWupEzULbXsnso84hk
X-Google-Smtp-Source: ABdhPJxFJaTbfKRHGpXGFOhtxmSbC/bW2lmBL6jJh8pMMApVSDXC7uM/KFgCf5Vt+BrErhTmofmp4w==
X-Received: by 2002:aca:f207:: with SMTP id q7mr7463786oih.87.1632911759185;
        Wed, 29 Sep 2021 03:35:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.60.34] ([172.58.171.180])
        by smtp.gmail.com with ESMTPSA id l8sm377936oii.57.2021.09.29.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 03:35:57 -0700 (PDT)
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
 <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
 <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
 <9d3cceef-f385-5d0b-6b0d-2b7be17ce187@linaro.org>
 <20210929070944.in75jgdfwv2rd4tz@sirius.home.kraxel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75caee20-4e3d-ab04-327b-b4a1bca6eb60@linaro.org>
Date: Wed, 29 Sep 2021 06:35:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929070944.in75jgdfwv2rd4tz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: EN4LxzVTfK+P

On 9/29/21 3:09 AM, Gerd Hoffmann wrote:
> TODO: Not sure whenever "check function pointer before call" or
> "function pointers to stubs" is better.  Right now the patch has both
> which clearly doesn't make sense.  Comments on that are welcome.

I guess I don't mind either way, but we do need to pick one.

> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -25,6 +25,7 @@
>   #include "exec/cpu_ldst.h"
>   #endif
>   #include "sysemu/cpu-timers.h"
> +#include "tcg/tcg-module.h"

Surely not required here.

> +/**
> + * tlb_flush:
> + * @cpu: CPU whose TLB should be flushed
> + *
> + * Flush the entire TLB for the specified CPU. Most CPU architectures
> + * allow the implementation to drop entries from the TLB at any time
> + * so this is generally safe. If more selective flushing is required
> + * use one of the other functions for efficiency.
> + */
> +void tlb_flush(CPUState *cpu);
> +
>   #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)

Going too far here, since CONFIG_USER_ONLY always uses TCG, never uses modules, and does 
not implement a softmmu tlb that requires flushing.  I think you can just change the ifdef 
to remove the CONFIG_TCG check.

Alternately, we could keep this slight inefficiency to fix...

> +
> +/* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
> +void tcg_flush_softmmu_tlb(CPUState *cs)
> +{
> +#ifdef CONFIG_SOFTMMU
> +    tlb_flush(cs);
> +#endif
> +}

... this bit of silliness.


r~
