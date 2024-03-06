Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp748352ejb;
        Wed, 6 Mar 2024 12:45:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFpgDF8zxGABCo7yCrrYg3cMmR0AEdy7ewaXcK/984mDfXcNFY5ze/LRdJTryKiOjmCEQlwFaw0GPvZEGT+U3RHaKMBR2y
X-Google-Smtp-Source: AGHT+IETP9DmPOds9T813xgoFpjZm67TSiCB3IEZvOIPFqbvxx9cbOO08YegR4M7K/jV22DZo4md
X-Received: by 2002:a05:6870:c348:b0:221:1cb2:f569 with SMTP id e8-20020a056870c34800b002211cb2f569mr6699511oak.23.1709757946051;
        Wed, 06 Mar 2024 12:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757946; cv=none;
        d=google.com; s=arc-20160816;
        b=Se3Ph1O/gx+7oGlNWtlYN57qKqIG//GdJ0GiORsoNU/xyIfQlLIWQ6pnmvCncuB4zb
         sOO8FUkRfUU2hTpboVwWW2bYHIwYn8acqb8XgyeIr6S6PlZkVT50lCoxH1Ap0VEeqsq0
         RYPcyAg208+LsWJX9qrok2rpHjmG52OFQwIY7njCP1W7I05C79K5vWtIVJAUI1aO8755
         0VQeifgPxtaN09dnvOCWEDZ0v7QWmsTCFsCtB2xDFH9kk/r7zM4DcM5VCsFDJ8ayR7wY
         D/pGNp7lpHYrtg+uBGzYq5ztkzDqn/WbxP2UpA1GS38JTgMb9XAiYzYAJcdCZ97qFVqK
         FbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bcqzoJde7fTwjsA331VbKvJ/wGDbyYSabnq2e7nudFM=;
        fh=S+mAm7LVrRk/WOae7wU0DvKZqV74PVMYYTqGXmxn+nk=;
        b=ERPiOAnFCR8OWljWKwLhnb0dhejvKkWVzGHqde00bv7PLqD+ehcY0eS3tLOsz9057R
         J9TgT8G/QovZWGqSLg5m24W378nLxF3zPwBaChQGmxtinn+f+/aViLFsN+YYmd1UdtHV
         5tXeE2MiazYHh3j80MB1GOzfybG7wZAPe1OdAqiS9jTz99skhSp1TQmyjMi19et/RfUq
         AwHO32HfeGALAeNuRluY0VZLP2jThzB0lddgfOS/qtaZZA483g5E/QbzPGT5dnnitlqD
         tdXjrJXNki6NXit/CrljN1xKay2Vh4vu0XmtayPWd81yr41lzq7K75ZAhsnppBtokPF3
         ycFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFBe8PCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou26-20020a05620a621a00b00787ef54aa95si14893459qkn.240.2024.03.06.12.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFBe8PCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhy8x-0005q4-58; Wed, 06 Mar 2024 15:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhy8t-0005pd-I3
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:45:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhy8p-00068p-KX
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:45:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-412f5e905e2so1818955e9.3
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 12:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709757930; x=1710362730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bcqzoJde7fTwjsA331VbKvJ/wGDbyYSabnq2e7nudFM=;
 b=YFBe8PCVisaK3F2HWmfsDDI+MBEOrCAuZ6ydjc/Ph+1JIoUrh+QZHJlyzhw3vjYCYw
 P/GEbQJ/UkFbJsIXcctcNP11AD0L5KoTjladzZplQhztqOXXg4OZlE3AaajjTKbTuAuf
 qESxc0vhdYtL/jpLQ8wRwhFW4NoXsRX88zXTqrDGhm30lHMw6TENOTAXh62KUQ0jpdO/
 NbY4oanGeDzI0PjKuGUxZxgi/9PQG+GX1FClxbP4YjabJSmBoMfI0Nw1icjTq0DUQkXz
 ENaOaYZFxktqQuK2IG8BH7W3F+Yc/+53UfIFYQytitoBnBONxRAUtNYRhPSK5bslSK0X
 zRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709757930; x=1710362730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bcqzoJde7fTwjsA331VbKvJ/wGDbyYSabnq2e7nudFM=;
 b=aaqG0nVAuEzhaeed6FA+B1Bs444HJ+a3qVBNCktXJhyK4RGo/2ZCDK06hR68BFHTdm
 q/ZzJaZjd5IdJM4cBzBLTm/rx4LWU31zcmeJ/Q518vCGcREQoOaSt6CNhLQgHuGtkMwt
 PVWg2w8eRhWzRNg6ysJ1yZzyYh3kAcwGoX4nKDXpaj507MrZMT9HcJ/z+jbfhYSKuG2f
 TDpicixKGSK3+JeXTSrYnzP6Q9rdk/2shrg2whLzLdjGTiPnuhLvHcaowvHbSwMSdJzx
 Y7LfqAoRRXdVATiTVDC9m9w9m58rH8UYUW1i/FE5VOp/fzLuNlkvWb34GrsOEYu3ZB6X
 EqOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOrCrdz/pyFBQK042jfpl9hglcNbGj1qm42b3sYk2tYvOywtCF9FElOGy7qSiGWyr/DqRCpbXWCV3FckWDinjvq0hD
X-Gm-Message-State: AOJu0Yyqx4jC2Hm9VWbaFRgl4jJn2tMtzuKJ9UY9Hl5ITplvflVOZXJ5
 FKVkYcEn+v9zWq022fwhCnz9CiPAFvf+k/tDZ9pvx57M6zxqcklNIG+IgqJE39M=
X-Received: by 2002:a5d:4242:0:b0:33d:b0c6:433c with SMTP id
 s2-20020a5d4242000000b0033db0c6433cmr11471552wrr.53.1709757929851; 
 Wed, 06 Mar 2024 12:45:29 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 jg7-20020a05600ca00700b00412f778c4c7sm364335wmb.16.2024.03.06.12.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 12:45:29 -0800 (PST)
Message-ID: <708f7eb4-f1fb-4f8e-8cba-7d270c84847c@linaro.org>
Date: Wed, 6 Mar 2024 21:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] virtio-iommu: Add an option to define the input
 range width
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, imammedo@redhat.com, peter.maydell@linaro.org,
 clg@redhat.com, yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240306203348.65776-1-eric.auger@redhat.com>
 <20240306203348.65776-7-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240306203348.65776-7-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Zptjjf7AvpcZ

On 6/3/24 21:32, Eric Auger wrote:
> aw-bits is a new option that allows to set the bit width of
> the input address range. This value will be used as a default for
> the device config input_range.end. By default it is set to 64 bits
> which is the current value.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - Check the aw-bits value is within [32,64]
> ---
>   include/hw/virtio/virtio-iommu.h | 1 +
>   hw/virtio/virtio-iommu.c         | 7 ++++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 67ea5022af..83a52cc446 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -68,6 +68,7 @@ struct VirtIOIOMMU {
>       Notifier machine_done;
>       bool granule_frozen;
>       GranuleMode granule_mode;
> +    uint8_t aw_bits;
>   };
>   
>   #endif
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index aab97e1527..9b2813188b 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>        * in vfio realize
>        */
>       s->config.bypass = s->boot_bypass;
> -    s->config.input_range.end = UINT64_MAX;
> +    if (s->aw_bits < 32 || s->aw_bits > 64) {
> +        error_setg(errp, "aw-bits must be within [32,64]");

Don't we need to return?

> +    }
> +    s->config.input_range.end =
> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
>   
>       switch (s->granule_mode) {
>       case GRANULE_MODE_4K:
> @@ -1544,6 +1548,7 @@ static Property virtio_iommu_properties[] = {
>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>       DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
>                                GRANULE_MODE_HOST),
> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

