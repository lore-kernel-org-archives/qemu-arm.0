Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp382593njb;
        Fri, 13 Dec 2024 04:03:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVaJfFbQyN+meMgQRO+6OeFV2rXUpBDjb2Q2xmsqcSnJhixUX9LOUIW1QeYiDt/JA/1rASpvufl7PfMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEP6v+NlDxsDhnCTHSAzumKKjaLBmmccao9HTmoPFphbtDIkF7VFyKYNigynxz5/s1gGDVS
X-Received: by 2002:a05:6000:2ad:b0:385:ee59:44eb with SMTP id ffacd0b85a97d-3888e0bd28amr2028803f8f.33.1734091403119;
        Fri, 13 Dec 2024 04:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734091403; cv=none;
        d=google.com; s=arc-20240605;
        b=fsN/oIK+hHUjAgPRhJMwlKT1Ig3ZMbC8zFpd7BKFDMf2V/X2iEmQN/UPUfUhFMXCHV
         MK422be9Ylw4Ui3w0eod3eBVAT8dxLWweOW75Wc8uTNpBQo+f5Aft2lK71zNLF0m7pZ3
         XznHOj+/wFpVy8EBLw7D1LBODR+Uui/XRH5dk/+UHeGiEh9gIWTFIGX+87zzX+sfSFEU
         w9FMGtBMGfFx9kSrWqI72CSJKbHvf9DJ9NajQy3e3mJnWZccRoFzyAj/IeeA16aAGid5
         MM0Um1eqa+OARMo/nKW3nCY7QcPPlG8EkAwIsyRAz+pmOpZFMBsA/rqkYm+GWfbPYAwd
         njZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DkNN2/tvunvK0nDD8Ihj9fplKSNzjuZKYRqHyzISMbY=;
        fh=lhZ7eGgnHC52repwue83Zn211JU2xiaaymkqQWjm09w=;
        b=Ee518Jqw9wtZ+A02uy9NrRiDNoCZUE4Tgi5O1TzF+PntVrb0ayaoikva5SSxj3MWD4
         v9yXOd2OQ+/Zx+opsFPYVxGYp/GC2MQ+v390xA09FfDIHMBmueyLyzMT7e38eQLKi4fL
         CJR65M8pMG1vmn5nP/BiPVLBKUNPCbMY9oo0Fzy7Mti3qIlmunyYiPQmyGYZbh2nbEC0
         4/xo127GvRXfSVRHznYpkN2K7Rip/FaJk+xi+js7HSzIsbCTVWdyxwVNaEZzApix3wDB
         w7Hnkn3hRoe95huaUoeW+70nokIqKoLdzWrck0AOOlYqr4o8S7i35C+ngw2dYyJzJ57/
         MHSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bONheaSr;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38782491489si2973888f8f.54.2024.12.13.04.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 04:03:23 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bONheaSr;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734091402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkNN2/tvunvK0nDD8Ihj9fplKSNzjuZKYRqHyzISMbY=;
	b=bONheaSrVTZ1a9XpuuhXEgu2w4cdprPohKaKCbrp6iU5+MxQ6ZPQvcUd5ATXimka012dOG
	gwsRwle/s5pdVMg4TFsIxG1p5KCHKNweYZsckOdVZf8nE2OkhzkVzlLYjXwjqaUwz9P1/t
	8yofzGvXoRCjyaQMZNKRu1IKDxGFE+M=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-46_639csN7iFeFe1Ij6ONw-1; Fri, 13 Dec 2024 07:03:21 -0500
X-MC-Unique: 46_639csN7iFeFe1Ij6ONw-1
X-Mimecast-MFC-AGG-ID: 46_639csN7iFeFe1Ij6ONw
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166f9f52fbso24663495ad.2
        for <alex.bennee@linaro.org>; Fri, 13 Dec 2024 04:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734091400; x=1734696200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkNN2/tvunvK0nDD8Ihj9fplKSNzjuZKYRqHyzISMbY=;
        b=vw4aWD6L+baBOFE1lW+5ERpOvqiX5VFjMfy0si6Qi37AX+o0b9hAy1YjHaxO+so7Kj
         cQq805RuBZfbEw9ltXmYJAuLIWeNvrcjZlUms08Istv4Hu9B6rji/n7BzLkaMVUswRkD
         kr5YgBjKp7ZAjP46uqqgAVdi5pSWmf3HPQGFwKESp86e4jZHqAXjJg55gTDAeWMZugvm
         /EnIrPFFzHz5wdryyYTM53RdXoWFl4iYoSTsBIOtuYt1V9pybnlDTtPtaO1QRF+3C9e1
         Vy2EVbw0XvX9rq6mAPK1fvljuWPzu7Bg/qB0LBuWTgVmrLFXjGXTvYkSyMCAVAoZy8sR
         7AUA==
X-Forwarded-Encrypted: i=1; AJvYcCW61M66gJH695VnstyoOaWEN8ujGMVLkDDuj/LKi8qoV1wZv++fKzYNbBsJbUFKXw6ieyxcWGL9Ai3rhA==@linaro.org
X-Gm-Message-State: AOJu0YwebuFXveenCDUdFbuKyJO49vkHvHB6Ffmn6xKeN+BeqEQkvI/t
	l8ARkSWW3p9Zr8uVrBuSOLKsXK/pXKqchIt3nOx+FIV0SI7/916F/YZs1tYMJVp0Zf0WmaMzQbp
	84k/4XZuE9I+Wgl4nbd5Ycgzrr8Hbyk3AeQpntgm4mbAVo3Y9I+qTBg==
X-Gm-Gg: ASbGnctqERcMdR8dkLeDRX9HOvA5rOYf0KvJYNeCz9DlWgt2cWmS8vizio3ZAwr3QPg
	i+urhYsaHW4zVHshuxyBWr+NC5kmFD5UFSc3JXRhiY8wgDVQa/TE88n1CbR8p8XC0ENLUvSODRH
	HecX1FRSCabaq5AQOCx5SgY/95eb8NcsHPGKS4aB0Tco9YKY++vv10fu7mR81fJfcgAZFRn2Lkp
	vHYVeQ7G08LcVwVc1dn49XDVUlyYA2SA/eZxHd7j76/Jsdi/PC6bH9f
X-Received: by 2002:a17:903:1212:b0:216:4b1f:499 with SMTP id d9443c01a7336-21892a5d74bmr34747935ad.31.1734091400029;
        Fri, 13 Dec 2024 04:03:20 -0800 (PST)
X-Received: by 2002:a17:903:1212:b0:216:4b1f:499 with SMTP id d9443c01a7336-21892a5d74bmr34747595ad.31.1734091399704;
        Fri, 13 Dec 2024 04:03:19 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [10.72.112.56] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d07sm2998345a91.3.2024.12.13.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:03:15 -0800 (PST)
Message-ID: <bed63115-017a-4e80-9581-680fd6f29f4c@redhat.com>
Date: Fri, 13 Dec 2024 22:03:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/26] hw/arm/virt: Reserve one bit of guest-physical
 address for RME
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-19-jean-philippe@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241125195626.856992-19-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rK16yeVyJG8ZmVAgn4SjoXEvvgFLvmlDeZFPspzHqMQ_1734091400
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: mlm3ev7MktCX

Hi Jean,

On 11/26/24 5:56 AM, Jean-Philippe Brucker wrote:
> When RME is enabled, the upper GPA bit is used to distinguish protected
> from unprotected addresses. Reserve it when setting up the guest memory
> map.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   hw/arm/virt.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9836dfbdfb..eb94997914 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3035,14 +3035,24 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>       VirtMachineState *vms = VIRT_MACHINE(ms);
>       int rme_vm_type = kvm_arm_rme_vm_type(ms);
>       int max_vm_pa_size, requested_pa_size;
> +    int rme_reserve_bit = 0;
>       bool fixed_ipa;
>   
> -    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
> +    if (rme_vm_type) {
> +        /*
> +         * With RME, the upper GPA bit differentiates Realm from NS memory.
> +         * Reserve the upper bit to ensure that highmem devices will fit.
> +         */
> +        rme_reserve_bit = 1;
> +    }
> +
> +    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa) -
> +                     rme_reserve_bit;
>   

For realm, @max_vm_pa_size is decreased by 1 ...

>       /* we freeze the memory map to compute the highest gpa */
>       virt_set_memmap(vms, max_vm_pa_size);
>   
> -    requested_pa_size = 64 - clz64(vms->highest_gpa);
> +    requested_pa_size = 64 - clz64(vms->highest_gpa) + rme_reserve_bit;
>   

... For realm, @requested_pa_size is increased by 1, meaning there are two bits in
the gap.

>       /*
>        * KVM requires the IPA size to be at least 32 bits.

One bit instead of two bits seems the correct gap for the followup check?

     if (requested_pa_size > max_vm_pa_size) {
         error_report("-m and ,maxmem option values "
                      "require an IPA range (%d bits) larger than "
                      "the one supported by the host (%d bits)",
                      requested_pa_size, max_vm_pa_size);
         return -1;
     }

Thanks,
Gavin
