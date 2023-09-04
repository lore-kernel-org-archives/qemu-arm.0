Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1109291ejb;
        Sun, 3 Sep 2023 22:12:14 -0700 (PDT)
X-Received: by 2002:a17:906:300c:b0:9a1:da9a:f1c0 with SMTP id 12-20020a170906300c00b009a1da9af1c0mr6420122ejz.48.1693804334200;
        Sun, 03 Sep 2023 22:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693804334; cv=none;
        d=google.com; s=arc-20160816;
        b=BvGA3qu7y1f913VyzwlCqGdPMShVECEooiKfo9Ep6a/lysP630k2i09/tgWZjFYTUb
         j0nEb12860npL0iKWHDzCsaD2qUHQfdAUs/OHjoU5zC1t8+GU2vsUwdrwi4NGsL3i0vV
         5hfPd/1DuNu1y/+cQ8GHpUPzgmGV1FLkvM7l1oW4d7tGmpi9ylSfKmPz2CzjPUjkxblw
         fqHX7c7OC+doMDx9otxlXKZs3+ydsxUqoz0VcEU1QWtqkZKzbBRavrkiKYdqyfO1bsmS
         x19PNb0h/3cnbeis0mt0EILPOE77NDNwDc5l1Tc6zazPheIip5p6INnxbYDsDoX1l4Kg
         5DBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NiA1VuA4y4Hb5mu8pl1p+1zSWDEvOlvH/dn8f2wlrZM=;
        fh=blbLeKEDBWGIkZ2OAWZGA9wS7Ovr5JQULL3xun2Yghw=;
        b=tS3AL4kV6Dsj76FjP47FeWztxSKsQ1fnrVVD+LvxVCxCf/mxJPjuxdSWNpNvd+YsIa
         ryvibN3Lsw7kbbDDxmN1SnK77OQbpFvFXm3N5GcCCKOcuKH8LZG6UimKClYASdKcvPtj
         EbAyndvIR8+5zWAA/EFAl2H9Bgo3nftsJrX+MLSqrkLKeUkquG8POtmX+yBVGDwN7K+a
         NjQVrAW2ZBNz68dfIW6AMJLxl2YJgifTbDUpgjLVc0w1vUOqtnWfwCo5D00H+0U4D3pz
         Ujx9BvgP6BmRvnIAYNPJoNf76U5QTFrO14D7JfI2cnrYkOaOqgB51kkDDPuM/U8nJKac
         6uVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGnNQSAr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id un8-20020a170907cb8800b009a1f4c90977sor3185465ejc.14.2023.09.03.22.12.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Sep 2023 22:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGnNQSAr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693804334; x=1694409134; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NiA1VuA4y4Hb5mu8pl1p+1zSWDEvOlvH/dn8f2wlrZM=;
        b=KGnNQSArNh4hpICMCN3VtgbG4N623ZyN+hzv4bdUPIhRhic6Mx4jIEGo3jQsYJnuXt
         FNKrzkjTFbgEtTBuFXSV/4NY6Ir98tMevC1lAXf+LuTC2uzKO7CXsv6qH6RiwuvSt/FB
         PjcQLaWWGVLP6rhmpJXlM0ExE8IOeZR+dbZ9zAqnMj405dCQoEfJkMHb6AqdytLaxCZq
         18TenAypQk81lnqQJD3eBb8xl5cC3yO967mgjr1FPrVDRqN0V3QBGki1zZitbcuFwkjg
         7CZS5qTIPJxHQRu9T7imvAFy0MhthfJvGcRWh1/6RiEy9tfC4ciRGZ1q705aWsm5H+7r
         YKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693804334; x=1694409134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NiA1VuA4y4Hb5mu8pl1p+1zSWDEvOlvH/dn8f2wlrZM=;
        b=QnHxqWvOXnzaz94AWnu9/e4Baa9Gw5a1XoF4Jwv+gEXoY07yxd6mfHOE3CDq2ng4yq
         aDfd1fMCqGARyG2rcf5Oqpr+2iOZAzM/xMuVmFtsV88YEoSZN1nvbjp9J7Ppue3ELWwL
         PHo0zK+mILLeOJDDTgmd+/MNASLNdr+Ocn5FvYt9MzB5w9bEXM+/QGerw5JdO0rAK1yx
         a1WsmVXcjN1Hk7b3uoCeIRgkUqnpFyEc292HMwcghAI1qSXGI2JhyCshDMRgg0yj1WDm
         HukdwGiat2SJhifXoOj2Zpk7uMcUII8zuVc3Dld9wXrCfowVnFbpAfD/eOXq89/5/e9p
         59vQ==
X-Gm-Message-State: AOJu0YxfQrRSil+xsRodA4DjdsuQ97GPaPLPxzNAumjyemxyNuyDydqJ
	FuUNULOam6HhCqCHrjicDVlSUMVL
X-Google-Smtp-Source: AGHT+IEUwGy+hzqjPiyzrBlcBR21kILVgmFzGfQycBlvcjIQmkguNSH4VGLwr4WmB1jJx4QsfJqrYg==
X-Received: by 2002:a17:906:2921:b0:9a5:b8c1:916c with SMTP id v1-20020a170906292100b009a5b8c1916cmr6518430ejd.30.1693804333672;
        Sun, 03 Sep 2023 22:12:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id x2-20020aa7dac2000000b005272523b162sm5238593eds.69.2023.09.03.22.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 22:12:13 -0700 (PDT)
Message-ID: <a69633a4-54a1-8dcf-6e87-fa43623dbfe6@linaro.org>
Date: Mon, 4 Sep 2023 07:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
 <20230903043030.20708-5-akihiko.odaki@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230903043030.20708-5-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ukL81WhWAbwh

On 3/9/23 06:30, Akihiko Odaki wrote:
> All implementations of gdb_arch_name() returns dynamic duplicates of
> static strings. It's also unlikely that there will be an implementation
> of gdb_arch_name() that returns a truly dynamic value due to the nature
> of the function returning a well-known identifiers. Qualify the value
> gdb_arch_name() with const and make all of its implementations return
> static strings.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/core/cpu.h  | 2 +-
>   target/ppc/internal.h  | 2 +-
>   gdbstub/gdbstub.c      | 4 +---
>   target/arm/cpu.c       | 6 +++---
>   target/arm/cpu64.c     | 4 ++--
>   target/i386/cpu.c      | 6 +++---
>   target/loongarch/cpu.c | 4 ++--
>   target/ppc/gdbstub.c   | 6 +++---
>   target/riscv/cpu.c     | 6 +++---
>   target/s390x/cpu.c     | 4 ++--
>   target/tricore/cpu.c   | 4 ++--
>   11 files changed, 23 insertions(+), 25 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
