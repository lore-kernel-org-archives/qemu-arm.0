Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp49048njb;
        Mon, 3 Feb 2025 23:27:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfUt9MolCqyPvvpa4boaw6SLKYU3/LqgX8ICrM6ghC805zbHiBlvmYtGu4wfTrasulvMwSq4qBLncZBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG/LemjcFsLPEYga4V4pyeZIw/ooNghthDQ2Wk7xJRDxBDVHcqdQffr8KglfOg4cs28TKXR
X-Received: by 2002:a05:620a:2901:b0:7b6:6ffc:e972 with SMTP id af79cd13be357-7bffcccaa9amr3760306285a.5.1738654044625;
        Mon, 03 Feb 2025 23:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738654044; cv=none;
        d=google.com; s=arc-20240605;
        b=iCcHoILTlt95cffYwXTTl+TB2CKmKV/IA4j1FI1PDTqHDc6lWtYrlg95hBeQejZCA7
         Var4IAANnMY6oc2IncC61Gp1AKLBFJB+LjA+fgNPEv2cHLye3lg1rUmigLhjcJPkEGBm
         o2HOdBTkKQGaJ4FXc+V9m/eF+4LNpuM6KT3cFmzZAL/KXizCp1ObjoSgBrhQ7R8K8zWj
         kaWq9BF7vaFO5JoUl1AkQ4wt6geYLl+SQz9CI96UO3lxtf4EXDoNYogG47MR27GetUBq
         BTG4YX/T1breu9svuKmm2RSa33LlKOV4pcDlqE++5Bercfqm08o++pKv76/GK9P/wp86
         YBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=caml/dtjCA6naDwITJNCmxDJeeSE9T0JRM/DysEV6o8=;
        fh=GwpWGfY+YpWDLm5M3SQxlcsIRCrDMbaGPQuP3NKWa5M=;
        b=MaroaHSUXfwFchpPXVRyy8J/l+F9TPma2wRJzq5MrMa13TkDHiR+YK3524xccWZkFO
         pxNJXWFVkDQ8DMEhMRRHMfX8iVpLOIqchj9GQBlgxBPKoAMtLVNKpxToBHycqgmnWwGU
         XT7GX7THj0uBgbbWbUjX1o1TUkodoF4nZRoexQGLmtY6NNguynOs83ZDAXZXPKxOtV95
         HGjjLIKL1tV6AffE4GIjKIDDKQPW9N3PP0N2DcP+ML8VnZNwEVI6/3FF1OqgdD8e6V3k
         QrlgbWbT4AoMClFFRxIIRfgaLO3tSy6SmoPzrP5/xYm299qZDhU47KTrrOiDHsLr36o8
         g1Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AsSFU+1L;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4b7c8si208957185a.59.2025.02.03.23.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AsSFU+1L;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738654044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=caml/dtjCA6naDwITJNCmxDJeeSE9T0JRM/DysEV6o8=;
	b=AsSFU+1LEJlVUv1d1/A+s9TZWCFekgoQgzzTA5uYafgkpuYBsE48ZxxRbR8Qyhcrixyf3O
	d3YUQeuQK1aT5z5AQWAwGj/QYz1rosk0ce2+uDjW5V9qpK86gp1toOIZ/lzEZZk7SJK57K
	c2WLkPMANzN0gbuJ3lqH0uMZUhnyg1c=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-nrYfAGfxPeyL2bI-wdGTWQ-1; Tue, 04 Feb 2025 02:27:22 -0500
X-MC-Unique: nrYfAGfxPeyL2bI-wdGTWQ-1
X-Mimecast-MFC-AGG-ID: nrYfAGfxPeyL2bI-wdGTWQ
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so102159835ad.2
        for <alex.bennee@linaro.org>; Mon, 03 Feb 2025 23:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654042; x=1739258842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caml/dtjCA6naDwITJNCmxDJeeSE9T0JRM/DysEV6o8=;
        b=sOGPC2FXHBMc/svftF9oM2EB29yMvGP2CwlnVoaIxcW+1ZTfKuVEbBME5dvHI1nksx
         YSy+eT2VkUhQnAMTu8JG9zilaZw65JNzGygkn2e0nPk10zcMOgY/ZwP4HOI5oy/Dde+N
         bm9f0QIG19whXpUtHxxA9fvmcMrZ891tZfoJ4jZR9VhtU1G4v/ntkGMPRpH8splGYjYu
         sJSC5vWAOz6Px9CpuNmtqSQPly+0p3Hc2FlggDBn21+oMR1E7Xhc08H2e+9+7HanH+3w
         yJO6Xnp1uDOdOvUeQ13m19r6FWmQ+5RSEZRb/tP5VjAqQQWTiq//Ew3/iAmrMU7BX3Q5
         UJng==
X-Forwarded-Encrypted: i=1; AJvYcCWE1Rju6QAXkJtqnVXExnenFxzDKOe850f68e5PrBlZx5lRPXiS+5mf1GiK7ULnntwvK6ymJe94sbH1Zw==@linaro.org
X-Gm-Message-State: AOJu0YziFT2Ky7jt/u2XOgQ30VqbYP6Kuo3344H7ianw6Ew0ESyBpJHl
	m1XWvBDIp8kucx0FRLy84uqt8qR1tinX7vkYdlUbZLcX6Q+7Fy0qoOShVVKcQyUMoIw7fz1CVOZ
	ft2ERy2ZksFEYGz0KrwagTlLhzTnnKIG0e8JuIWdRIwuoLhaeKmfI2w==
X-Gm-Gg: ASbGnctzEnoBixYUGKjYBHGSqhuE1PsnPy5dVgYVD/kC5rCDKAyMTX58j1Nw6WaZ0WU
	ixWirD2kj7l8t4ISC+ZnGP8OvpGqqIQo5IexljH01SGygxlh7ouVXcvE0L4oZine7XCUWBzvHBM
	DF6plpTT5fyWIm5oPJUcXvFLf8iMXi+iLZ8VCuGGLoyE6D3TspOO6QfTsBogH/d0y83FaVVzu5q
	wUT043CKttbAQQeVShYEkSJjoC+slAXCV7xVzYMewEW9QOgYNKQ9WuCuAZIlo9rLMRna4PcaYKO
	L7rIJA==
X-Received: by 2002:a17:902:eb54:b0:215:a2f2:cfbf with SMTP id d9443c01a7336-21dd7c66954mr249327585ad.18.1738654041859;
        Mon, 03 Feb 2025 23:27:21 -0800 (PST)
X-Received: by 2002:a17:902:eb54:b0:215:a2f2:cfbf with SMTP id d9443c01a7336-21dd7c66954mr249327435ad.18.1738654041574;
        Mon, 03 Feb 2025 23:27:21 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb1dfsm9411422a12.5.2025.02.03.23.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:27:21 -0800 (PST)
Message-ID: <e8075a46-8810-4be2-8ad0-b465268541b8@redhat.com>
Date: Tue, 4 Feb 2025 17:27:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/26] hw/arm/boot: Mark all guest memory as RIPAS_RAM.
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-20-jean-philippe@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241125195626.856992-20-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7v6mZL8eZMm_BS-i14nxOk5fMpTfpJxJYTlGa725G_o_1738654042
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Bb5jVja/2AhV

On 11/26/24 5:56 AM, Jean-Philippe Brucker wrote:
> All Realm IPA states are by default RIPAS_EMPTY, and accessing them in
> that state causes injection of synchronous exception. Either the loader
> or the guest needs to set IPA state to RIPAS_RAM before accessing it.
> Since a Linux guest needs all memory ready at boot [1], initialize it
> here.
> 
> [1] https://docs.kernel.org/arch/arm64/booting.html
>      https://lore.kernel.org/all/20241004144307.66199-12-steven.price@arm.com/
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: New: the Linux guest does not initialize RIPAS itself anymore,
> and expects the loader to do it.
> ---
>   hw/arm/boot.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

I think the changes in this patch can be combined to the following one,
or move this after it. It logically to initialize guest's RAM covered
by PATCH[9]. I'm not sure if there is particular reasonable why we
don't do that.

PATCH[09/26] target/arm/kvm-rme: Initialize Realm memory

> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 5301d8d318..a2414b1f98 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -26,6 +26,7 @@
>   #include "qemu/config-file.h"
>   #include "qemu/option.h"
>   #include "qemu/units.h"
> +#include "kvm_arm.h"
>   
>   /* Kernel boot protocol is specified in the kernel docs
>    * Documentation/arm/Booting and Documentation/arm64/booting.txt
> @@ -1238,6 +1239,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
>       info->dtb_filename = ms->dtb;
>       info->dtb_limit = 0;
>   
> +    /* Mark all Realm memory as RAM */
> +    kvm_arm_rme_init_guest_ram(info->loader_start, info->ram_size);
> +
>       /* Load the kernel.  */
>       if (!info->kernel_filename || info->firmware_loaded) {
>           arm_setup_firmware_boot(cpu, info);

Thanks,
Gavin
