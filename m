Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2235560ejc;
        Wed, 27 Sep 2023 18:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBV5XABZ6FX1j5yx0ndvz1p3r2sig6cvJp5L9i6+I1R/nQaT2a1btoC6e43v160fIqKMQC
X-Received: by 2002:a81:80c1:0:b0:59f:4bc3:3e9 with SMTP id q184-20020a8180c1000000b0059f4bc303e9mr4041197ywf.46.1695864987820;
        Wed, 27 Sep 2023 18:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695864987; cv=none;
        d=google.com; s=arc-20160816;
        b=fMAnIFHDqYavX5IE4mVlX9JFIX1jLlUw/sEoFZ99WKoD9YfgotKXZiVY94Udd3jX6P
         Hi92VCMhCuA11mLiAiMvlEBG2fEn8TdHUmDKLhSkVkmuR/bP3BkzfAMJT6eDU7er6gxj
         nemkvyb1sAfHZ0NdimOvUs9hJ5v8SZP5E17MASZQ03nLZqszjQuyYCQn9qS9bRBBnlJY
         WxOoR7tSCi3Qnbc1q2R64n9YSJjACwE41kX+zWcq/C4LBtq/R/lR1F0tJDg1+JeLqe9J
         sHvH6iJ9uS53dZvH4bjizbDiNyzrVrpdHXYl/dBqBIUb/6mH85mvIvSzuFtRyR1r6neu
         B3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Yd6hFstXCvS7L9LdWl4WKlufmHJf10wiKwAN4rDTzdw=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=hTTP848VghmRQOxJCbLdcuiCb2zXBSaM0YOPDnVRDIDKoEJqpMz3sq/+sXMo5kuCJ6
         +t3x4Um4OvZqXGWiPk8mRO1OYjc+oz2CsavS2/v78PFjcblaWAzBGrMBC989sKBGzF0e
         5pTgTHu3udH48ompQFS16ek0e/Nbp4T+VeCQ3Z/HVL/IRZr/Zt5SAN8IeiXnWvErhxfs
         Ush6rkv+erl8X626IvzmOJyPrZs/Kat4VE09jqQn8660hEaNl0PnV9dsqtAAsOUjD+bF
         PC4d9mQCrXyWcSx5K3eN6ZisCzjTSNGIjRenkLFCHnKqwwZ0XfoB1pAmKCB0a39KVLcc
         kbEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVa5+o+6;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q85-20020a819958000000b0059f4f2da0efsi4927193ywg.220.2023.09.27.18.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 18:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVa5+o+6;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695864987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yd6hFstXCvS7L9LdWl4WKlufmHJf10wiKwAN4rDTzdw=;
	b=LVa5+o+62khIx4niqVVzIlnhhu87BKB488rFenDf70WVi129Sp1DZi/P1h8VwC57mbyCzX
	3vCSgWOh1YX7vhw5/hagtrBLrH1SXYnxtFeet9LlqriaaKHKsK0Nmy6qq4OkUSoz6kbRuV
	M16KJlt9tWh1UGT+YrglHOEHQr4nQN0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-TbpkI0ntNomEFWEi_WjbEQ-1; Wed, 27 Sep 2023 21:36:26 -0400
X-MC-Unique: TbpkI0ntNomEFWEi_WjbEQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-65646efd378so197548406d6.3
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 18:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695864985; x=1696469785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd6hFstXCvS7L9LdWl4WKlufmHJf10wiKwAN4rDTzdw=;
        b=svQiez08BMTlI5TxGLvyHrx5nz7Lb5zZhaEieT/6AeiNlYgtqvb55QSAaxUY9aAP3i
         zfm7mkxJfxSEXeS/aSL3YRlsEYsZJCluS013Lns54QR8uUdyFRE2zpB6h9AbsBOrd8UK
         kPfwTF8gu/91VhuwJ3D43gRoNPow+OU2SKmcq/tljqurDESzqBnyME5AfzBgLOaTKeA/
         Dum8yjA11EWiyp9y3QjYuuebhk1ZauT+zE7THtiO8IhVFRX3Nh3c+DYAp8z/A19ZmGBU
         G8Nt01yQ8kVBP7diZSZcjQQh8YodlFdfW61D7KtXXW/BdaGtXWQIzNqCFZqxDwZfyw9R
         r+Xg==
X-Gm-Message-State: AOJu0Ywj5OBeL5rQ+zhbITef9cNUxI1sAwTkW2HBkA5cD5J564IPfYnc
	jYNBSYfn6ecYwd8Is9WgjBPiaVSh9txQNzA2sj5tYDjfYLna3n7Mxv2eAX/VLdkoUNaHubEEYvr
	C0eV8fCPUwXA5/vhJ
X-Received: by 2002:a0c:9c8f:0:b0:656:5535:ef27 with SMTP id i15-20020a0c9c8f000000b006565535ef27mr3616483qvf.48.1695864985506;
        Wed, 27 Sep 2023 18:36:25 -0700 (PDT)
X-Received: by 2002:a0c:9c8f:0:b0:656:5535:ef27 with SMTP id i15-20020a0c9c8f000000b006565535ef27mr3616470qvf.48.1695864985241;
        Wed, 27 Sep 2023 18:36:25 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id fk14-20020a056a003a8e00b00686b649cdd0sm1743984pfb.86.2023.09.27.18.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 18:36:24 -0700 (PDT)
Message-ID: <832342cb-74bc-58dd-c5d7-6f995baeb0f2@redhat.com>
Date: Thu, 28 Sep 2023 11:36:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 17/37] arm/virt/acpi: Build CPUs AML with CPU
 Hotplug support
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
 <20230926100436.28284-18-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-18-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AyITC9sEHVlL

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> Support of vCPU Hotplug requires sequence of ACPI handshakes between Qemu and
> Guest kernel when a vCPU is plugged or unplugged. Most of the AML code to
> support these handshakes already exists. This AML need to be build during VM
> init for ARM architecture as well if the GED support exists.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt-acpi-build.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..d27df5030e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -858,7 +858,18 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>        * the RTC ACPI device at all when using UEFI.
>        */
>       scope = aml_scope("\\_SB");
> -    acpi_dsdt_add_cpus(scope, vms);
> +    /* if GED is enabled then cpus AML shall be added as part build_cpus_aml */
> +    if (vms->acpi_dev) {
> +        CPUHotplugFeatures opts = {
> +             .acpi_1_compatible = false,
> +             .has_legacy_cphp = false
> +        };
> +
> +        build_cpus_aml(scope, ms, opts, memmap[VIRT_CPUHP_ACPI].base,
> +                       "\\_SB", NULL, AML_SYSTEM_MEMORY);
> +    } else {
> +        acpi_dsdt_add_cpus(scope, vms);
> +    }
>       acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                          (irqmap[VIRT_UART] + ARM_SPI_BASE));
>       if (vmc->acpi_expose_flash) {

I don't think it's enough to check vms->acpi_dev. vCPU hotplug needn't to be
supported even vms->acpi_dev exists. For example when vGICv2 instead of
vGICv3 is enabled, and so on.

Thanks,
Gavin
