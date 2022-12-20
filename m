Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4178049ejb;
        Tue, 20 Dec 2022 01:30:46 -0800 (PST)
X-Received: by 2002:a05:600c:354d:b0:3d0:85b5:33d3 with SMTP id i13-20020a05600c354d00b003d085b533d3mr33862141wmq.16.1671528646698;
        Tue, 20 Dec 2022 01:30:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671528646; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8JvTuyZoy9FRmZQTFZY0nZ+L0Q2oNoeioUYgwRJYtgZRE0BdhxCNARBvZFi/dx2IY
         OIWCShS8QQtrpqMwcC7h0n57d2z//MUzVe2pi/taR7mQTafIuFJQfkVlXuQjagceFUh7
         BWEua0J91SvHGyg7Shk0SdnrjZPUBqDtYaJOpC8MHVcfdcwRtjwjq/IV+1eoATMxYj6+
         kmu5GTXBAndJB3QFMUgol55vi5S1NT7M8NmcM8l0UX1Ggchml6xzcpKCzUsaH6QalqGL
         Rv3DaOaIgw+pFTyt0zMSdOAH/PRtwKSuEDVKZdnFShmQt0XHU61fUvHrASNp389j5XXK
         1l4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G/dpNMhDj0dkK+eMZPgPDIDAPr8OUqu+urZOVvb2p+I=;
        b=T+dHrY7KUAassjt/lYezdvmm7El3A1sUjw39U8yigvilfJKORNTBMGkI66riSb21BQ
         7jqB+OhTxs1kFjxx56vExX1H9xr4Xiu9IlbdYmO6rRbpUPfHCA27NnokYxUvCB15uvjc
         vojnxVcpGrOI4t+0py9b0pDCjlVVZHOG2d+Jw4dt+o0B0TN+ug/EqRQka0rx5A9ac6zB
         RGh2TLMcNH9VvDpwVYIY1CEHvO2RuU6GcxTPVmhjv0EgbCTKRdrDOLJNQt0o8DhOsUTo
         n6MQ4uM1t/MhtGwSsdZMHyCH3bjsYStIeZPf9tn8uBCk06NYOy4uxcs+6FhRz3DHtiCY
         mdhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TIPc8/bk";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k18-20020a05600c409200b003d0047d1b63sor334951wmh.42.2022.12.20.01.30.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Dec 2022 01:30:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TIPc8/bk";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/dpNMhDj0dkK+eMZPgPDIDAPr8OUqu+urZOVvb2p+I=;
        b=TIPc8/bkp4vKHyyFcA6Ze8WAO0+2twZqpkg0qJLA/JtnqPq5QKAfXtLnt7uygs/PvU
         c0FUlK17MOrA3k+6tyAeKgtCMBQjSfGFXagLxQpFPP5m8+duaquJ6SaR9751N3Zxt3/5
         FdTbZUxS0pXC/6SUeJmg2S04KNLhI4lAA2h1KCTcQ+Tpmd5W28c1hBs3bxne2rA1cXiG
         greNiWzZnhdF/nAWaKnT1WxDWBuhtjhfntbagp6aipCeCL9Znxtqfderttp852E16nkR
         W2W9vvLVgst5dWHdUw6D7WHbsjtf5mUEQUk/CtJ1SzvEXoxWwVoDWIVhsr0n1aqKIkaD
         865w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/dpNMhDj0dkK+eMZPgPDIDAPr8OUqu+urZOVvb2p+I=;
        b=1BMKuoZPSdxA9p2N8a/08HqkrKzcxMC2GcoYt7TKac5hTe4I5xb/7R0feUBRH8CDwv
         Ih2YOjoBYUdGpZjQGlamRMb0Ogq7Dd2E/7b10U/wLor9Z7yA2+81WPmM/RI6ThF3x3gm
         SsTtYygQ55aJqMG9gxFyqbY32aTmes5blv8NBjXIFNOCobhEMGhnHA6mVWy6mV1Zv20x
         EigYX9hz4QshIYZsG1L4oXMcBX9mUKmzoVIM9XkWcd2teXTFPLm80MEWYCqFRIK6X3vD
         yxM++RwXX9SnrecMKUZFkgVmDiDNE15IGKBIf2qQ2lCC2TR8xKVt4mMmtL91u7884jau
         Mt3g==
X-Gm-Message-State: ANoB5plYNjiurA5ChwXK3vcgmPSzqcZiXQQK6e9vaz4WCqwZucm6fG3N
	NqE2VgOckt+/78XTMt2I0LfUaF8T
X-Google-Smtp-Source: AA0mqf4BdBL8CIhMzighDePROI6hCYevyeTaUcUKIkeVkWeVFVDCLEqqVwYkNIK5gGTtdx9ZrYLmMw==
X-Received: by 2002:a7b:c30e:0:b0:3c6:f7ff:6f87 with SMTP id k14-20020a7bc30e000000b003c6f7ff6f87mr33905266wmj.11.1671528646445;
        Tue, 20 Dec 2022 01:30:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n15-20020a1c720f000000b003cf4ec90938sm14986672wmc.21.2022.12.20.01.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 01:30:45 -0800 (PST)
Message-ID: <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
Date: Tue, 20 Dec 2022 10:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Xiang Zheng
 <zhengxiang9@huawei.com>, David Edmondson <david.edmondson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20221220084246.1984871-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220084246.1984871-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: blrey98x0bpM

[Extending to people using UEFI VARStore on Virt machines]

On 20/12/22 09:42, Gerd Hoffmann wrote:
> From: Xiang Zheng <zhengxiang9@huawei.com>
> 
> Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
> when using persistent UEFI variables on virt board. Actually we only use
> a very small(non-zero) part of the memory while the rest significant
> large(zero) part of memory is wasted.
> 
> So this patch checks the block status and only writes the non-zero part
> into memory. This requires pflash devices to use sparse files for
> backends.

I like the idea, but I'm not sure how to relate with NOR flash devices.

 From the block layer, we get BDRV_BLOCK_ZERO when a block is fully
filled by zeroes ('\0').

We don't want to waste host memory, I get it.

Now what "sees" the guest? Is the UEFI VARStore filled with zeroes?
If so, is it a EDK2 specific case for all virt machines? This would
be a virtualization optimization and in that case, this patch would
work.

On hardware the NOR flash "erased state" is filled of '\xff'. If
EDK2 requires a 64MiB VARStore on NOR flash, I'd expect the non-used
area to be filled with \xff, at least up to the sector size. Otherwise
it is sub-optimal use of persistent storage on hardware.

But instead of keeping insisting on that, I'd like to step back a little
and discuss. What is the use case?

* Either you want to test UEFI on real hardware and a NOR flash makes
   sense,

* or you are trying to optimize paravirtualized guests. In that case
   why insist with emulated NOR devices? Why not have EDK2 directly
   use a paravirtualized block driver which we can optimize / tune
   without interfering with emulated models?

Keeping insisting on optimizing guests using the QEMU pflash device
seems wrong to me. I'm pretty sure we can do better optimizing clouds
payloads.

> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
> [ kraxel: rebased to latest master ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/block/block.c | 36 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index f9c4fe67673b..142ebe4267e4 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -14,6 +14,40 @@
>   #include "qapi/error.h"
>   #include "qapi/qapi-types-block.h"
>   
> +/*
> + * Read the non-zeroes parts of @blk into @buf
> + * Reading all of the @blk is expensive if the zeroes parts of @blk
> + * is large enough. Therefore check the block status and only write
> + * the non-zeroes block into @buf.
> + *
> + * Return 0 on success, non-zero on error.
> + */
> +static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
> +{
> +    int ret;
> +    int64_t bytes, offset = 0;
> +    BlockDriverState *bs = blk_bs(blk);
> +
> +    for (;;) {
> +        bytes = MIN(size - offset, BDRV_REQUEST_MAX_SECTORS);
> +        if (bytes <= 0) {
> +            return 0;
> +        }
> +        ret = bdrv_block_status(bs, offset, bytes, &bytes, NULL, NULL);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        if (!(ret & BDRV_BLOCK_ZERO)) {
> +            ret = bdrv_pread(bs->file, offset, bytes,
> +                             (uint8_t *) buf + offset, 0);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
> +        offset += bytes;
> +    }
> +}
> +
>   /*
>    * Read the entire contents of @blk into @buf.
>    * @blk's contents must be @size bytes, and @size must be at most
> @@ -53,7 +87,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>        * block device and read only on demand.
>        */
>       assert(size <= BDRV_REQUEST_MAX_BYTES);
> -    ret = blk_pread(blk, 0, size, buf, 0);
> +    ret = blk_pread_nonzeroes(blk, size, buf);
>       if (ret < 0) {
>           error_setg_errno(errp, -ret, "can't read block backend");
>           return false;
