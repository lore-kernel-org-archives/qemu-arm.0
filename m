Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1926370ejb;
        Mon, 9 Oct 2023 05:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXdkgVCgrwc6JqMWa18LTRPGJ9FrK2tAQ7gXG7khK/4M+ydYg7oPY4Jh1qVlvWSz/1BmFH
X-Received: by 2002:a0c:da85:0:b0:660:c916:ca41 with SMTP id z5-20020a0cda85000000b00660c916ca41mr15389681qvj.57.1696854174467;
        Mon, 09 Oct 2023 05:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696854174; cv=none;
        d=google.com; s=arc-20160816;
        b=kVhBE40CW/5y7sTej64o31HN8jRFrf76+WXiePfs8YxxCGlBAZl0FspQxmyTPVT5PZ
         HdiF8C/fIBkGObMhlXxcAzCOPQYMq0lH9RnWbMo5+exYGAJEubHy/oxglHqOj4a3LrgU
         xKPRZ1gvTyGi1zWQYH9+HMMNzNFjQsguVULP8a4bAuNTL/sEnA6g0Qs8Jh8+fmuNng04
         fMcx4L3M9Obu4DfsIOUVtSXjG8jKW8rI1pJeF1zs563HKSrA08CFKBUGnQMkuVkM3byo
         d8OpD5qzu09LuGLhv+MaVKX4lmPrVT2HMA9EIjsZFX2fRkavj5X0xOamTbryOtLLyxpM
         OK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:organization
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=uEpEKIcndJ+QJ3qnnKHjn6/D4+pUwlcjD6PqX45pKzw=;
        fh=GPxWsKePQQOQbx3DUz1WcTM7+aHXsm9W/SdNx32dskg=;
        b=j/az80YGUw2jLmid6uF8tvzAUlU0VSeGOMTUsNRhSJgrZNLKi7lrcG4v9/H+0h8Vcv
         /kR/JOKNo0C4J/hKmphGk4YY0ACoCXYreBK40TIlmRpJ7SoSi9Iy0eZBMLRKH4EWNK+s
         BFxC/bDqkelHkANkATyHa0Va2UBCg+4PH7jYuJUxs+Txe9HkJkYiKlpK8PJnE+SYL5nB
         UFnzrg+oeKSns5u+uwTlsUjsr0X46tBJOnkFZ2H1guNa0P/M+YZsiHzJm80fu+Q4EAHj
         Fp3XbM7FE1qJdB4SLbXWxjLrs7HnpnXrafRFDN7G9xSVKyQH/8jxoidqvdrUZw4AteJr
         oxdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IM/5IasO";
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b1-20020a0cc981000000b0065afe44a6d5si5926931qvk.313.2023.10.09.05.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IM/5IasO";
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696854173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEpEKIcndJ+QJ3qnnKHjn6/D4+pUwlcjD6PqX45pKzw=;
	b=IM/5IasOQt8o3OTWlMPA6y0wUEkEDWHU0J6ta2N2qd7J7+dAdNbN1seYXZgIpZzxIHG7Q4
	rRS++DpmPl7hDcUM63cl9IJFzrqF1/u+yooLEjcF6WJbB6rW1k3zH4KCx1bGJJ45VsKZi7
	sZqoQgNBKjANpqR7ySfwl33ywRworBQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-Q8QcHVxiPNi2KyebhaF01w-1; Mon, 09 Oct 2023 08:22:37 -0400
X-MC-Unique: Q8QcHVxiPNi2KyebhaF01w-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3251bc06680so3298870f8f.2
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 05:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854157; x=1697458957;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEpEKIcndJ+QJ3qnnKHjn6/D4+pUwlcjD6PqX45pKzw=;
        b=VR6QyU28oV5iu/5biaaoHrggcujhJD96ftzMl0gQ2tTllQA2GRe0IevAGYVuRvxk0+
         Mtdcp0hRod3H8d5ihJnOuYinV0BA7ghrtHirCqS9Mgquy+K864ifDzxQQfcBDDidlH5M
         yM4g7AA/DD0g/enmLXJEaijZSCRGiewhoqdU/WKA1T7YwKwvi1v4q/0wRvJcJzNhveOI
         hvLonnDpGeq5iOtQttV13UhN8kwshAugBl5g8KK/du19w6mtBlKMwgr/bkMGjDYFMJRT
         UPyZpGXp8tl+94FTo2L17O3fZrPjMUU0X2OEYXyukqF43Yb4TxpVwexEzY474CmB19V6
         uK0g==
X-Gm-Message-State: AOJu0YzgsOmuyxuzBtFoTBUDSS8bADTNJ+6B/WmYGZqpTNaCE3lLA1nq
	hksiLcAIEeg+Yg7QdG8vzgFi+jy/gsiNowDxCXeHX7b1tYG4+B034ZnT0lvS2CWcMyZBVA0Cn3t
	YKfv2psDIQR5VaM2I
X-Received: by 2002:a5d:60d1:0:b0:31f:d8ba:c997 with SMTP id x17-20020a5d60d1000000b0031fd8bac997mr13335945wrt.41.1696854156817;
        Mon, 09 Oct 2023 05:22:36 -0700 (PDT)
X-Received: by 2002:a5d:60d1:0:b0:31f:d8ba:c997 with SMTP id x17-20020a5d60d1000000b0031fd8bac997mr13335923wrt.41.1696854156395;
        Mon, 09 Oct 2023 05:22:36 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548? (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de. [2003:cb:c733:6400:ae10:4bb7:9712:8548])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d66c7000000b0031fd849e797sm9502071wrw.105.2023.10.09.05.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:22:35 -0700 (PDT)
Message-ID: <8a80612f-07d3-6302-31f9-232d9ce393a1@redhat.com>
Date: Mon, 9 Oct 2023 14:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 03/10] hw/acpi: Add ACPI CPU hotplug init stub
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-4-salil.mehta@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20231009112812.10612-4-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Y8BtlJv2FQHM

On 09.10.23 13:28, Salil Mehta wrote:
> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..c6c61bb9cd 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>       return;
>   }
>   
> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> +                         CPUHotplugState *state, hwaddr base_addr)
> +{
> +    return;
> +}

While at it, can we prefix that function with acpi?

-- 
Cheers,

David / dhildenb
