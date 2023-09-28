Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2897765ejc;
        Thu, 28 Sep 2023 16:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTsjZRkWWDgcsWcPAHqmxzLXbGKXK/KhFo3gFT+KapAGqKkGzVhPHb9sTwG6jBH/Qj7bUd
X-Received: by 2002:ac8:5912:0:b0:418:1fa1:4be3 with SMTP id 18-20020ac85912000000b004181fa14be3mr2971147qty.47.1695945019344;
        Thu, 28 Sep 2023 16:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695945019; cv=none;
        d=google.com; s=arc-20160816;
        b=zMphrd9ngE5zB8BAkbGeiX2KvwqYTL+VeJlYCyVBahA3Xel7hj6vDfHEljmr5rwKL8
         ThFkgUlgcEqhDCCZXI8PMM5HefMeaBW44u5PPLKYqKN+Q0y8xzbcNUao8INmZ5Ddwkhk
         ekVKytL0+gwoLloSDZldxizhW2OC7yVPBSkzqs86EuVfCPB1Zp3GcdhU3ZoiGYJPfuRM
         ZD5f18APBbXKT7RDG+9juXKLSHlRRgYvVxIlYmPF1JAfovJrKlODnYnasJmbQ2Ec+r0z
         Dbi2nit7u9DG5pv1rvxftXd4YWlqRdJSwLd9aNrayNeXInhiEOISlfnTHa3BzcpUgbqv
         Syrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p0XZt9kRyelPfoqH8bCJT3LAf3sfTTCBFuXgcpHVVwQ=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=GZRr8wvkj68MArVlrCCafwz+slST22xuOYwjfPGG1Kp4deO3+t/QZJP60tyZs6qScX
         c2LS8VBPUom3jfYyFF8jggMoAB4Rhwb16TvBwQAwp66YMG2OWHzYeoW9CWmlOB3+69qt
         kcBaqVSFhlRYKgeZyK/g5d43KaF+CQi230qeLSXtWzotziauhK8VpPSHKLw2U0Oc/tX+
         SSkn8PkMQoKNz/wfRkSNnNEMp337DUOLJQwm7iIsgto9ocrseW9kV7WG6HVrXH/6orHj
         5sX6HExvwOLnugAjqAzNhyH5HYSWCAxRCzq22CM4xlSSjviKATGb0oUHpQ3tZweirREq
         SfzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jz6rtIz+;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o7-20020ac87c47000000b00418053cd7fcsi7408623qtv.194.2023.09.28.16.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:50:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jz6rtIz+;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695945018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0XZt9kRyelPfoqH8bCJT3LAf3sfTTCBFuXgcpHVVwQ=;
	b=Jz6rtIz+aql4870XOdil18MguHbN4wqADlmtlN6KcfM5HFvuOSvh25ymEHQ06LFTIns+Vo
	gBzVZke7H49Eyqvcts7BCqZzf3mYiDyyJpgv3aoW+Jx0294CSRlMVsaWP1zG24Q3/cqn6N
	rIQcbCuiN2aHFJtgsl2oqoFXdJ9/v74=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-JxGsEXTEPnCl6MDxqcF-Sw-1; Thu, 28 Sep 2023 19:50:17 -0400
X-MC-Unique: JxGsEXTEPnCl6MDxqcF-Sw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3af608dc0ddso5414098b6e.0
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 16:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695945016; x=1696549816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0XZt9kRyelPfoqH8bCJT3LAf3sfTTCBFuXgcpHVVwQ=;
        b=nYMnrfY06vE5NM98p8TChC6KTJpplQDsOI6CuBsR8Gef2J+BEanLmqUXdMDyVyVria
         hnSYNaYi0CbLPs7DrqhkGrDjLZSe4C2NgDVOqyfBoH9dDkeG5GIxrtU09RA06feKWce4
         jWcJhFrcPtGRLBeGw0yPH/WfRUKFmQQFxgvFkNHYIjrNyPGwDe6rS9aRCiaLKGBbMOZm
         HP0oly+9LCSsbemQQV9C2UvIaiy2DDq0U0UToSaVqYeGQ5XaQHUoDdeOr5PBGQGOJsYG
         1NIpKyRuxn0S25O/0+O+5+617sGE/sS6Nl1DGStnCCh9SJ4dsjKWInDT+Yr4WXKriI8T
         xNEg==
X-Gm-Message-State: AOJu0YyDMhVbB2u3+EJGj3UjxuTLCTz5uRFAqvx4aZVB5RALMsSiGhFr
	0hetKYl9e5MwjXYjmrbtB8p4b/WY0ZhQ9Y8qqQY2rCd9jQLnH58G5vEDDvQGHzZ1HgZ+C5vbTJK
	9RGXZxfAe8o6VOSeI
X-Received: by 2002:a05:6808:f04:b0:3af:6cf3:d62f with SMTP id m4-20020a0568080f0400b003af6cf3d62fmr1563704oiw.29.1695945016376;
        Thu, 28 Sep 2023 16:50:16 -0700 (PDT)
X-Received: by 2002:a05:6808:f04:b0:3af:6cf3:d62f with SMTP id m4-20020a0568080f0400b003af6cf3d62fmr1563687oiw.29.1695945016063;
        Thu, 28 Sep 2023 16:50:16 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id a10-20020a62bd0a000000b00682a908949bsm6718016pff.92.2023.09.28.16.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 16:50:15 -0700 (PDT)
Message-ID: <ae6cdf01-2ede-69d8-cc6d-60ea1c80cefd@redhat.com>
Date: Fri, 29 Sep 2023 09:50:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 22/37] hw/acpi: Make _MAT method optional
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-23-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-23-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: H+eVOPdd4dng

On 9/26/23 20:04, Salil Mehta wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The GICC interface on arm64 vCPUs is statically defined in the MADT, and
> doesn't require a _MAT entry. Although the GICC is indicated as present
> by the MADT entry, it can only be used from vCPU sysregs, which aren't
> accessible until hot-add.
> 
> Co-developed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Co-developed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/cpu.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 

With following nits addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index e1299696d3..217db99538 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -715,11 +715,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>               aml_append(dev, method);
>   
>               /* build _MAT object */
> -            assert(adevc && adevc->madt_cpu);
> -            adevc->madt_cpu(i, arch_ids, madt_buf,
> -                            true); /* set enabled flag */
> -            aml_append(dev, aml_name_decl("_MAT",
> -                aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
> +            if (adevc && adevc->madt_cpu) {
> +                assert(adevc && adevc->madt_cpu);
> +                adevc->madt_cpu(i, arch_ids, madt_buf,
> +                                true); /* set enabled flag */
> +                aml_append(dev, aml_name_decl("_MAT",
> +                    aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
> +            }
>               g_array_free(madt_buf, true);
>   
>               if (CPU(arch_ids->cpus[i].cpu) != first_cpu) {

May be worthy to have comment to mention _MAT isn't needed on aarch64.

                /* Build _MAT object, which isn't needed by aarch64 */

Thanks,
Gavin
