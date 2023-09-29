Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2996637ejc;
        Thu, 28 Sep 2023 21:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG6VwfV6dQdYfe3XIiuQ7XVUHK6H4jqows31AJRpoBr/RVdnoZhbqT6UjwA6v4lC8Kfofj
X-Received: by 2002:a05:622a:1ce:b0:418:221a:b51d with SMTP id t14-20020a05622a01ce00b00418221ab51dmr3672860qtw.58.1695961418773;
        Thu, 28 Sep 2023 21:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695961418; cv=none;
        d=google.com; s=arc-20160816;
        b=Vm1FkKhj2IwhV/n4bW05idimcInq8KGiqaErFG1vI9ManQr6DX2cTdD9JpOcJpuMhj
         8P6ZNszOeMjHjP8g7gVvJZg6d2p0kwE0eqTJ9II2WJ9DxfINSkKoiQIWfqv2tP5L9DTA
         LX92maTI8ctW4est7lIdN6mRpkcdddG3N7URlBr+/BS7/2NlM/o2FpfEvVZ+k3N9nxf0
         06XzgoccpXJnIQ8o+HQB+uU6gOheRUDvayEQb1G6rBoKUE63jEQcxdJmhUm5lZqX32+o
         yrgMC1hRLcCqRI2ct954Iuu4Ke4fDcZClBBvzpOdlEzME8Eg+m8kghAZs2n0tEf7W6f9
         PuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dzhL7jilBDvHg4CP/rvpSpnkZqN+PsVSUYT8fj0BnkU=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=qGEk7j+PmM/kbSOgQJ66GvmoAzKiop4LwsuXfZfWByPkos4e+6SB97wDzQPj0DxGAa
         Oc2oHZ1frmWr2+idbz4Hf8NboEF0XWMa1D4206Gu1qbtHrqe59oWYc1TRnull2gZWu3c
         tJKFoJAb5RKZvU/o7c/gkK2EmLG8jRjklN27XfkZ3dq2crjximXBEliuZDBA3e0K0eqR
         ZK6Rkr8VPCqElW3BKHe3/dnwqYHQiAUiEDsuFAJq10OvHZawgD9G309gjLx+YTyi8cni
         wVNgqoUpOUXFK/eaiEy7t6vPzmLml9ywtawyS5xYF9TVkFbre68NtQr2h7j/OyLKxYfL
         G6mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GVXqpfvC;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g7-20020ac85d47000000b0040cf939cdd8si4937270qtx.271.2023.09.28.21.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 21:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GVXqpfvC;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695961418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzhL7jilBDvHg4CP/rvpSpnkZqN+PsVSUYT8fj0BnkU=;
	b=GVXqpfvCq+g/qCZAkbL78paxe/L8xt1hqS06zz9ZHxRnohc6G/q9x8GM9Ttcbz9RBJNR+A
	etomDxLS5yKxBCxVdlW7Hd3FE2tmVhfSjOd3j4wC6+DJByKrl/TaQoqfCMeMDHd/NhDW8j
	gHPwqfubrnMs5imRQvkfIDcGNG00Ink=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-q4vi4GisNhe0xs0iiF5bOA-1; Fri, 29 Sep 2023 00:23:36 -0400
X-MC-Unique: q4vi4GisNhe0xs0iiF5bOA-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-573fdb618eeso17829182a12.0
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 21:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695961415; x=1696566215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzhL7jilBDvHg4CP/rvpSpnkZqN+PsVSUYT8fj0BnkU=;
        b=jEx3D+NLp1LytGYfHGCq1iutWgEiwX/YuxrVJhBLd4FeD5ygefG/g0X7xL908sEgYK
         1XRqAJzTSFAzBFoXijg7dqKnMu1UQnGohJKJZVvLUUEGlKOi2MbLtazAjm3uqC0Mzv45
         D3bVxf4K2MxAn9bGkCW6Vri9WE0KqFUtIofrMYCVqkfL1/Bp6bEIMpgGYaQLNoFWKgDm
         bw3cXLe4hDHTLgc7oJMqWhxEBv2AkSLZZWWZQHhU/nmCI0vzUifXQZlyR37SxpMlFcSN
         3eAcmLsCpGv0y+8X6I9l08pKUNgCu4jJBMOvmW6DvAZ5HgzXA3ihxMK8p/y76wuX9v8S
         uT9w==
X-Gm-Message-State: AOJu0YxP0HJ+RA46TOeU81QB1BgaI7hurGhqmb47qkpa9P9HSO275fbu
	j8/ahvZzq/0O22b3o1hvj/1LDmpmVdwFA67wVJWTCu8s7AycyNm4N3sHY9jhwnWamMDNy1k1kYp
	cH4V5yTZxMIgsqOjt
X-Received: by 2002:a05:6a20:1604:b0:14c:d494:77c5 with SMTP id l4-20020a056a20160400b0014cd49477c5mr3490152pzj.13.1695961415659;
        Thu, 28 Sep 2023 21:23:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:1604:b0:14c:d494:77c5 with SMTP id l4-20020a056a20160400b0014cd49477c5mr3490145pzj.13.1695961415398;
        Thu, 28 Sep 2023 21:23:35 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902e74700b001bf6ea340b3sm15851672plf.116.2023.09.28.21.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 21:23:34 -0700 (PDT)
Message-ID: <ddbc526e-bba3-6b93-753f-6ba3de183755@redhat.com>
Date: Fri, 29 Sep 2023 14:23:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 35/37] hw/arm: Support hotplug capability check
 using _OSC method
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
 <20230926103654.34424-1-salil.mehta@huawei.com>
 <20230926103654.34424-4-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926103654.34424-4-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +tJ1zjVp8aFv

Hi Salil,

On 9/26/23 20:36, Salil Mehta wrote:
> Physical CPU hotplug results in (un)setting of ACPI _STA.Present bit. AARCH64
> platforms do not support physical CPU hotplug. Virtual CPU hotplug support being
> implemented toggles ACPI _STA.Enabled Bit to achieve hotplug functionality. This
> is not same as physical CPU hotplug support.
> 
> In future, if ARM architecture supports physical CPU hotplug then the current
> design of virtual CPU hotplug can be used unchanged. Hence, there is a need for
> firmware/VMM/Qemu to support evaluation of platform wide capabilitiy related to
> the *type* of CPU hotplug support present on the platform. OSPM might need this
> during boot time to correctly initialize the CPUs and other related components
> in the kernel.
> 
> NOTE: This implementation will be improved to add the support of *query* in the
> subsequent versions. This is very minimal support to assist kernel.
> 
> ASL for the implemented _OSC method:
> 
> Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
> {
>      CreateDWordField (Arg3, Zero, CDW1)
>      If ((Arg0 == ToUUID ("0811b06e-4a27-44f9-8d60-3cbbc22e7b48") /* Platform-wide Capabilities */))
>      {
>          CreateDWordField (Arg3, 0x04, CDW2)
>          Local0 = CDW2 /* \_SB_._OSC.CDW2 */
>          If ((Arg1 != One))
>          {
>              CDW1 |= 0x08
>          }
> 
>          Local0 &= 0x00800000
>          If ((CDW2 != Local0))
>          {
>              CDW1 |= 0x10
>          }
> 
>          CDW2 = Local0
>      }
>      Else
>      {
>          CDW1 |= 0x04
>      }
> 
>      Return (Arg3)
> }
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt-acpi-build.c | 52 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cbccd2ca2d..377450dd16 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -861,6 +861,55 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
>       build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
>   }
>   
> +static void build_virt_osc_method(Aml *scope, VirtMachineState *vms)
> +{
> +    Aml *if_uuid, *else_uuid, *if_rev, *if_caps_masked, *method;
> +    Aml *a_cdw1 = aml_name("CDW1");
> +    Aml *a_cdw2 = aml_local(0);
> +
> +    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> +    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> +
> +    /* match UUID */
> +    if_uuid = aml_if(aml_equal(
> +        aml_arg(0), aml_touuid("0811B06E-4A27-44F9-8D60-3CBBC22E7B48")));
> +
> +    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
> +    aml_append(if_uuid, aml_store(aml_name("CDW2"), a_cdw2));
> +
> +    /* check unknown revision in arg(1) */
> +    if_rev = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> +    /* set revision error bits,  DWORD1 Bit[3] */
> +    aml_append(if_rev, aml_or(a_cdw1, aml_int(0x08), a_cdw1));
> +    aml_append(if_uuid, if_rev);
> +
> +    /*
> +     * check support for vCPU hotplug type(=enabled) platform-wide capability
> +     * in DWORD2 as sepcified in the below ACPI Specification ECR,
> +     *  # https://bugzilla.tianocore.org/show_bug.cgi?id=4481
> +     */
> +    if (vms->acpi_dev) {
> +        aml_append(if_uuid, aml_and(a_cdw2, aml_int(0x800000), a_cdw2));
> +        /* check if OSPM specified hotplug capability bits were masked */
> +        if_caps_masked = aml_if(aml_lnot(aml_equal(aml_name("CDW2"), a_cdw2)));
> +        aml_append(if_caps_masked, aml_or(a_cdw1, aml_int(0x10), a_cdw1));
> +        aml_append(if_uuid, if_caps_masked);
> +    }
> +    aml_append(if_uuid, aml_store(a_cdw2, aml_name("CDW2")));
> +
> +    aml_append(method, if_uuid);
> +    else_uuid = aml_else();
> +
> +    /* set unrecognized UUID error bits, DWORD1 Bit[2] */
> +    aml_append(else_uuid, aml_or(a_cdw1, aml_int(4), a_cdw1));
> +    aml_append(method, else_uuid);
> +
> +    aml_append(method, aml_return(aml_arg(3)));
> +    aml_append(scope, method);
> +
> +    return;
> +}
> +

The check on vms->acpi_dev seems not enough. We may still need to check
mc->has_hotpluggable_cpus and vms->gic_version etc. Besides, the "return"
at end of the function isn't needed.

>   /* DSDT */
>   static void
>   build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -894,6 +943,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       } else {
>           acpi_dsdt_add_cpus(scope, vms);
>       }
> +
> +    build_virt_osc_method(scope, vms);
> +
>       acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                          (irqmap[VIRT_UART] + ARM_SPI_BASE));
>       if (vmc->acpi_expose_flash) {

Thanks,
Gavin
