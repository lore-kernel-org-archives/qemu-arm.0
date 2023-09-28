Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2208669ejc;
        Wed, 27 Sep 2023 17:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+siDtFD4m0wVT3LL1TK99NjL6DsRrChcHgnANog6ZcTtX3jqonfL3KL8JkDK/gh6NWj04
X-Received: by 2002:a0c:8cca:0:b0:655:dc84:d744 with SMTP id q10-20020a0c8cca000000b00655dc84d744mr3293436qvb.25.1695860755229;
        Wed, 27 Sep 2023 17:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695860755; cv=none;
        d=google.com; s=arc-20160816;
        b=q8cVqzmEXUIxBV891tinRgACQN1zm13pgG1tV3XrFGVgyJH/Yp8G+PYaFV9XzaZwHm
         JFqJpHll9ecX2BRUBK+gHwNkcYEt09CdO2vuMcwCIwL8WCmZefpK+EWt4cdRPN14viHl
         DADwidrTNLC+5ivqTLkZqicXJwNCWWX3fy9stIo8KGIzRYNMG4GTIO833vULYtAOYyMr
         g+54TUxlfd6vDIzrF+Hob7bkzBDHYriPjk2FpvPIcd0fEaghMutC5Dz8OJZP0yMBfxVU
         ztQcBF17DvZ9Xb20pvG1RIeeV+afJ0pibc+VoUfTy+wpPE9aIRRGJ2ZYDCMKSlbGJIox
         K2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W0lrm3EL17qSVrOEr5JXHxYGcVXaoW9K1rfvDbK41iw=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=GqtSVqvqoq6rnGpA/2gF3LQG6PRkuVFvs5O5Efv683elAGI3JqU3qTm7gdJJ34FrAk
         iJDNhAK+Mb5ZiJBbbgtUdlfW0P4iAm7fQBH0MFpShTqF0bxqS9WZ+X4Po1dybIwwVMOR
         mYPvxKwd1mJjhOKZQWXTtZJCYADQzOzsBekkyFUNC8lh/dIzzIT7DLfhho30rWcXjP3Z
         I9X9wlcH4xH6eph+0DnDNM2OKsKN8340jSPCebzr8aalQfaqoKKfxIFG6wKV1aBTgBZf
         zrp/xpxBcbgI9gnuDd4CFsK66J/2fYpJXMPlzQwH125nPALpxa4SMd/oc/4hTL/S7anU
         Y6SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KAFjnpMK;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e14-20020a0cb44e000000b0065b08993583si4177636qvf.208.2023.09.27.17.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 17:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KAFjnpMK;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695860754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0lrm3EL17qSVrOEr5JXHxYGcVXaoW9K1rfvDbK41iw=;
	b=KAFjnpMKAMQkWrcDPVYBf6Wnp5iZQDBh96R4VaIuCSCsMuUMXjcbDlY1MhtutL/kKOtM6Q
	ZTEnHV2WUIJn+HdXPKqv9cvz2rcZ/0jMiOhZi9Bn5ZjF3lXD+ZmNreub/yNsBG+p3NmwsT
	NdkZ6TL/G7Fg9XJdkWuWLk3YOdQAaBs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-S4VTYbD4MMWxqgZ3yhXgnw-1; Wed, 27 Sep 2023 20:25:53 -0400
X-MC-Unique: S4VTYbD4MMWxqgZ3yhXgnw-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-570428954b9so15519074a12.3
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 17:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860752; x=1696465552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0lrm3EL17qSVrOEr5JXHxYGcVXaoW9K1rfvDbK41iw=;
        b=dGtrVhT4f4ZWy20j7bWIV0z0nPojM4fq8gtQos4ovH3O9M8fLIHV/uFkXCcZgqhkzW
         BG7isp0ws4TlxHv2KftsMlPpt5gSTDSLKRP+zcBWqk2M0DQ0gtE114ZQIRkX0TlhKHyd
         EIRlq++P7X8HvIEkKW0x5c6q5AYTS/zuiDbRTwBJ+0AkCATbaZMt2lQFJ5aHQc8sXGZG
         cHAWZjDw6dv3kiO70uVywrDnSqfEPe0J015gf9k5jwML8BUFzWuW1RcwJ+0VMklcEeAj
         Iv58/n6aE3f71Rr4UzzuFAQ8YrfQj+lISdXqIyzp5d9LnOimcMd3UeH5KrBBl1L5rutt
         joeg==
X-Gm-Message-State: AOJu0Yxj8Lvj134GL6OQv+13Ag+xUqaUerr8bMBmblF2VTTzgfu8SVEv
	+DsSH2lRXq4k0K+KJYLH0ndCBV7yTMIEv3tEkDCbcjy+XHNCxxNIjO6l10C3aOmdO5CWxskB8LX
	J1AfFBMFlK9UKADT2
X-Received: by 2002:a05:6a20:f3a2:b0:12e:4d86:c017 with SMTP id qr34-20020a056a20f3a200b0012e4d86c017mr3355366pzb.10.1695860752319;
        Wed, 27 Sep 2023 17:25:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:f3a2:b0:12e:4d86:c017 with SMTP id qr34-20020a056a20f3a200b0012e4d86c017mr3355350pzb.10.1695860752046;
        Wed, 27 Sep 2023 17:25:52 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id y3-20020a170902864300b001b0358848b0sm13737871plt.161.2023.09.27.17.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 17:25:51 -0700 (PDT)
Message-ID: <ce26889c-344a-b09c-a8b4-35904ffff771@redhat.com>
Date: Thu, 28 Sep 2023 10:25:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 10/37] arm/acpi: Enable ACPI support for vcpu
 hotplug
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
 <20230926100436.28284-11-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-11-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SIpNZbbBn6On

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> ACPI is required to interface QEMU with the guest. Roughly falls into below
> cases,
> 
> 1. Convey the possible vcpus config at the machine init time to the guest
>     using various DSDT tables like MADT etc.
> 2. Convey vcpu hotplug events to guest(using GED)
> 3. Assist in evaluation of various ACPI methods(like _EVT, _STA, _OST, _EJ0,
>     _MAT etc.)
> 4. Provides ACPI cpu hotplug state and 12 Byte memory mapped cpu hotplug
>     control register interface to the OSPM/guest corresponding to each possible
>     vcpu. The register interface consists of various R/W fields and their
>     handling operations. These are called when ever register fields or memory
>     regions are accessed(i.e. read or written) by OSPM when ever it evaluates
>     various ACPI methods.
> 
> Note: lot of this framework code is inherited from the changes already done for
>        x86 but still some minor changes are required to make it compatible with
>        ARM64.)
> 
> This patch enables the ACPI support for virtual cpu hotplug. ACPI changes
> required will follow in subsequent patches.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 

I assume this patch needs to be moved around to last one, until vCPU hotplug
is supported in the code base.

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7e68348440..dae06158cd 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -29,6 +29,7 @@ config ARM_VIRT
>       select ACPI_HW_REDUCED
>       select ACPI_APEI
>       select ACPI_VIOT
> +    select ACPI_CPU_HOTPLUG
>       select VIRTIO_MEM_SUPPORTED
>       select ACPI_CXL
>       select ACPI_HMAT

Thanks,
Gavin
