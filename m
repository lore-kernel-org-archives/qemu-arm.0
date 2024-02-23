Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp416459ejf;
        Thu, 22 Feb 2024 23:57:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUm1vFMNa48uPBfJ4HhY4DSwnrm3RwNykEP1QWXiCfqE+10uPBdVtjeC7kfRoi4sd2WSAeIa95ZKaeDUVufybeci8WTU7fu
X-Google-Smtp-Source: AGHT+IGnk/CPJTGtPiNBetsFQTnxFGCsrzHzgBXZD5/3SOtPTE3oKf+OS6lARt/pQD/yMy1+QCW6
X-Received: by 2002:ac8:5c01:0:b0:42c:5d43:7e77 with SMTP id i1-20020ac85c01000000b0042c5d437e77mr1365851qti.7.1708675069443;
        Thu, 22 Feb 2024 23:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708675069; cv=none;
        d=google.com; s=arc-20160816;
        b=wHav93TGeph3stPTTIQUgBpFGknmjS9MhnEY2MKii6eDEr3pIOIf+2yqSoQe0xhMH/
         K7Acv8VqMKwrQ7NRjufRcL6lAVNEamWeIsw2dPC3V8RS1YwFYU2wkKD+eXcJwhN3XeA5
         8oE9EirsajQeCiclpPS+NDY9T7xOlwGai5UMKo5Jnyv8Qty0XDbufHb+d0bBke7x84Du
         GBwFDmYJZlvzavxnm0cBlkMekvI/VFzcfGYBxSxt8mT88RGbZPpYTeW+NZGVwUAF0tdF
         MkunvV0PfxgFCafbaAOAaX7uGCHP+c5yS4SiK2MnKErfd5D+TXwM97qSjvD9k9U+EdXw
         gEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Hpe6qfp0CO2lq3XA1sJLcXs28EMH9yFGoQ8txnA/syQ=;
        fh=IT5zEVkP0pLIaYIRmRlDXHrESvRUmRBi93AidUwi0WM=;
        b=pztLl7uFeRvKK54ZUF4tUARYPaH7SLV6o31zlDXceW3RMOt7Me+3dx8lpNon7mA9f8
         mB64hq1H8OUqZ6KT1FuRMfFIm9kR/Gsxekga4PRTDFfKCsGv+aW/YACEKPn+9gKAMv6b
         JuI2b6VpEYn+WpGa+LfPWko26DCDGJlOc2MBVPd1iI3yWoIh8CrP+WhoMF35AtAr/cCF
         rtBzbjNNH11CJkPe2YUIQ/BxZC3KcDVo9Df55EpXfEFe/uOh0uEwLWv/FJYrKTzqKakz
         +m6jR9UC4rZAGPR1HQqOf/fGfToJQH7OG6mqyPne7r4r38oYomdZGPAeO3gJyd8HW4tn
         uoyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MCKa4YK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb15-20020a05622a480f00b0042c44dec59bsi3762554qtb.482.2024.02.22.23.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 23:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MCKa4YK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdQRB-0007tl-2e; Fri, 23 Feb 2024 02:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdQR6-0007sH-WF
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:57:37 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdQQz-0007ll-Ci
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:57:36 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5655c7dd3b1so140077a12.0
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 23:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708675047; x=1709279847; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hpe6qfp0CO2lq3XA1sJLcXs28EMH9yFGoQ8txnA/syQ=;
 b=MCKa4YK3oxd5KoOC1BGzuVKBj+v0R7TVpPpqhJnYUaYe7W+qSgaULtupu+uRgHhsQb
 hZ2FVQG/tXGT2yhc5PHmmzuxkAmYnQSmI1eTJPZ468Xc8arD+umOUr3Vuo39s0xHjfTO
 JPPmVuOvub6ctNJOjiIhRhWToTTskcOJmZcALBbGcBqMDA1052KSKzHPjQTX3NgQO98F
 2PITd7+2Xo4xv/SyBsVEF5fOA89+8M1WkZ2jGj4Yx6J5cbKVb9zwKxdAcJbpI5VeiX+U
 COC4uRKHfnvZ2n4OGXR0NVRF1WRnpObNRux7gevNpXxAd7SE32Of8YvQPYOJJn7SSma/
 KB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708675047; x=1709279847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hpe6qfp0CO2lq3XA1sJLcXs28EMH9yFGoQ8txnA/syQ=;
 b=IGSf4ElZ4XdnRV5V4CPB+1/cZh+1X8xRwgEaWBELjHxsWgJ5hMfnXn8BmKh4J5SXjl
 PpDCwZTjCVfGKWjs4RCJ6k39/u0FpFNXOpKfhsK5wJeXgT1AfrmTzw90+BFRHqTHvk39
 79JGjRkw2y+8Q15qZGd1BpFt8R3TYgNyrvP0alPpoT52EgJBYM/AdzVSEqQTlYWULFD1
 SJYYZJMYjU3Nk+qFRcUUWgFHJPLuKAPukUcteU/w4QFXO/0TUx9ScQbe64hPnzUpDAJO
 PHjwbxDCeUWLXlPCSBbceI3NAhGmg+fAPghN3wWxcR7jpQqFiHTjpOTpn9Xw16TwAHYw
 6gjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxfnd+V3HW/AnoApibGiMfTHfR6tt3dFdbT40zig+TIs5tCcVL/9L4rsMt7R9IG8YSV7hdL3/nP0NiWWkItLx8NZ7s
X-Gm-Message-State: AOJu0YxpKWtU4YEwF9KGNmUc0CAAYpCprhe53crmj5SvorY6JC6mSWiB
 M423ULRUdAFSmhX5z4fAoIOtMMAx9dVjg/S8EbrVpOJicPjxOfifu33eWNtKsM8=
X-Received: by 2002:a17:907:76d5:b0:a3f:4315:5960 with SMTP id
 kf21-20020a17090776d500b00a3f43155960mr3684634ejc.32.1708675047562; 
 Thu, 22 Feb 2024 23:57:27 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 cw4-20020a170907160400b00a3e4c47bad1sm5772626ejd.8.2024.02.22.23.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 23:57:27 -0800 (PST)
Message-ID: <fcca3389-7862-4ecc-865a-404091e3d697@linaro.org>
Date: Fri, 23 Feb 2024 08:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] virtio-iommu: Add a granule property
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com,
 jasowang@redhat.com, pbonzini@redhat.com, berrange@redhat.com
References: <20240223074459.63422-1-eric.auger@redhat.com>
 <20240223074459.63422-3-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240223074459.63422-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qziH9xFarFfi

On 23/2/24 08:27, Eric Auger wrote:
> This allows to choose which granule will be used by
> default by the virtio-iommu. Current page size mask
> default is qemu_target_page_mask so this translates
> into a 4K granule.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v3 -> v4:
> - granule_mode introduction moved to that patch
> ---
>   include/hw/virtio/virtio-iommu.h |  1 +
>   hw/virtio/virtio-iommu.c         | 27 ++++++++++++++++++++++++---
>   qemu-options.hx                  |  3 +++
>   3 files changed, 28 insertions(+), 3 deletions(-)


> @@ -1324,7 +1324,26 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>        * in vfio realize
>        */
>       s->config.bypass = s->boot_bypass;
> -    s->config.page_size_mask = qemu_target_page_mask();
> +
> +    switch (s->granule_mode) {
> +    case GRANULE_MODE_4K:
> +        s->config.page_size_mask = ~0xFFF;

Alternatively:

           s->config.page_size_mask = -(4 * KiB);

> +        break;
> +    case GRANULE_MODE_8K:
> +        s->config.page_size_mask = ~0x1FFF;

           s->config.page_size_mask = -(8 * KiB);

> +        break;
> +    case GRANULE_MODE_16K:
> +        s->config.page_size_mask = ~0x3FFF;

...

> +        break;
> +    case GRANULE_MODE_64K:
> +        s->config.page_size_mask = ~0xFFFF;
> +        break;
> +    case GRANULE_MODE_HOST:
> +        s->config.page_size_mask = qemu_real_host_page_mask();
> +        break;
> +    default:
> +        error_setg(errp, "Unsupported granule mode");
> +    }

