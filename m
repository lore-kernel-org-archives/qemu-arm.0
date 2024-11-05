Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3159530njc;
        Tue, 5 Nov 2024 14:54:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2QkdJygHq2kMxHx5CdFZCBRlOOe1tZsYad1mSIz/3TDQklXoMcB+GRue5CfMVq2CreC3wElQAhYQ/kw==@linaro.org
X-Received: by 2002:a5d:6da5:0:b0:37d:5134:fe1 with SMTP id ffacd0b85a97d-381c7a5db70mr14831959f8f.17.1730847251489;
        Tue, 05 Nov 2024 14:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730847251; cv=none;
        d=google.com; s=arc-20240605;
        b=BtFzCOUAFKtbgDPPHMcVRM48bloMt3M90kSR3pNrVTRQjRb/udEvFnvMEFyEbPUQv6
         eQM6gsSkL6IXK3rqRn1u4Ol8u+cv5CzRFfuOGuxshnBKBIjrx6Pk2vfdH6l8j+kdjY0m
         dE1f4zSF2iBa6ixO5Ie1uNF7u4M8V6amQozyo73d2PevX8+5qfnQPYI/6nBOaSfeJaSp
         vuDn9V2Lo78clsStvYWBmb7LHHJ6BrDjz0S7ZH9TrlX/9/xuhFyRlCUJTb07hv2ihoOu
         OWfODxUNhTMP3uC3CNVXUbm5xjN8SHoqV8BLQWfhDAhOo/9cDYBzM+6FzOrvQ/M2xt9E
         gF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cv0HzH1vNyWkqVfadbqu8tw5+s9qR0g25g6EENHzeSY=;
        fh=/upPU1244P8M0oXN31U2pFpI255g47gBD0zLbYKllZk=;
        b=MA320S33O0o3eekgvj27q5QWyCyzrBZ+k3n2Ra9lo01w6PLuKARkhC83wz1kfD1Vek
         EBoyJaT8l+IEafgybXCYw5e6q2uMHKAcnP7cYA431KwNf+ij+y8k4VmsgXrpxc4/ymvA
         4izyCpniL4C92Rm7r4KPefbspIvTOXmh9gMKv0gkWx3ElxUb0pDV/AxNYvPlV7fx4FCD
         DfvJ7hwb4dh7pP6gmF3cUIzvoVBlD5Wwa/Wrr3VUYw0XQ9atloCHXpNzeHIXOYeCYQ5/
         hWZOjrbk7TrjjUylEXnkdubQibNxShdr/T1Jpctjrv2iGnCfZah9N0gawJaVYxKRbg1B
         SDQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jhwMSFDL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381c10d7b9bsor4774794f8f.3.2024.11.05.14.54.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 05 Nov 2024 14:54:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jhwMSFDL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730847251; x=1731452051; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cv0HzH1vNyWkqVfadbqu8tw5+s9qR0g25g6EENHzeSY=;
        b=jhwMSFDLAvdulcOGNVOpdPsWrOzmGUBi5Y9hoKTaSMbYxXt5faaK1p0hX/jyeJ3YF2
         lLKKuwevRJ+8TqHh9A6S08Tx1vEjkjA6NUoVxT45PJC8cQTrARGEZiugb3m3fHcYwrc5
         ftgLBGU455kXlgJEOUihjwfByLwZCIjbYVwBMlKHPuaqpGD/7UT+wGolBXrb0FYUP4QO
         4WVvFGgoLK8+wG+Ognl0E1JWvVY4sMd+52Dq7/3aRZxXNEsLxtWPue9vKC3NMg4o5s60
         fq9eCfpxtaSiWVquZ233pS8bBygmpHI2nTjliofVTdTv1fMgWir2NPQkL0qtrV8Hxbo/
         9tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730847251; x=1731452051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cv0HzH1vNyWkqVfadbqu8tw5+s9qR0g25g6EENHzeSY=;
        b=fVtCDwc0lS378lfCY0iEzZ093iopgTel/q6XL6EXBx+KbdK6UPAalLy/+wWUOLnBjm
         zesMIEEXCrcUCSaS8oC5m10rPLr3Sei495j4aNDiTtbJyqybwxIMkw2RgY4WPEBIdcMN
         gwzzfmpS2+ggHDP8bT5eCjHSZKqpDUsQXIP/ar4idMIHTc+5zCmdql7PpDnDwI/ftzvv
         OTwRHTff5uRZ44OCo+sFOSUp+YW+9oPFEHhnJ3NE+rpk5bYEjzEm5xpfQZxr4w0hdSHq
         OqgZ3ozWcs8/obdOTBaLedq4ZEKT99wRJUe4vMlVCwRsREBWxRQh5f2eri1lzHf+s0in
         Lpxg==
X-Forwarded-Encrypted: i=1; AJvYcCUvx/KU0qKOVaULAQPhl8EFb5mNYLpG49TxYcWKExypfPgcUrB/ZFl3QFFrLNdX7jxYtncktFNX4PFTLA==@linaro.org
X-Gm-Message-State: AOJu0Yz8tR9Nu1zQKOpgGNFaL5ixesyEMA5xBz+YOd/Hvp9kodsNh5mW
	KK92M5fWd+hezDwOEB1j0b+EKrLGXhTbplcLsdl5S59+/zZ27Z+HWD6AZfp8WY6zxg==
X-Google-Smtp-Source: AGHT+IF7iWF2Ipw7+lGag7OS11tcIrj2DAa31GxxvDSSvIYwYLI0vYgG53ofk53jzA+KHiLDuooz8A==
X-Received: by 2002:a05:6000:1868:b0:37d:4846:3d29 with SMTP id ffacd0b85a97d-381c7a6cbf7mr11956058f8f.28.1730847250917;
        Tue, 05 Nov 2024 14:54:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [172.20.143.32] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4392sm17395628f8f.36.2024.11.05.14.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 14:54:10 -0800 (PST)
Message-ID: <1b00ec74-4dda-48d4-b74f-9ce45cf1a429@linaro.org>
Date: Tue, 5 Nov 2024 22:54:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Introduce SMP Cache Topology
To: Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: k+kp8NRKZZge

Hi Zhao,

On 1/11/24 09:33, Zhao Liu wrote:
> Hi Paolo,
> 
> This is my v5, if you think it's okay, could this feature get the final
> merge? (Before the 9.2 cycle ends) :-)


> ---
> Zhao Liu (8):
>    i386/cpu: Don't enumerate the "invalid" CPU topology level
>    hw/core: Make CPU topology enumeration arch-agnostic
>    qapi/qom: Define cache enumeration and properties for machine
>    hw/core: Check smp cache topology support for machine
>    hw/core: Add a helper to check the cache topology level

Since the first patches aim to be generic I took the liberty to
queue them via the hw-misc tree. The rest really belongs to the
x86 tree.

>    i386/cpu: Support thread and module level cache topology
>    i386/cpu: Update cache topology with machine's configuration
>    i386/pc: Support cache topology in -machine for PC machine
 > Alireza Sanaee (1):
 >    i386/cpu: add has_caches flag to check smp_cache configuration
 >
