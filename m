Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1305366njc;
        Wed, 21 May 2025 09:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWacoZUT4cULH8WHovkfJ8C0wFUTYAWy75U6Jf06JW41rZkWZRyPvgtxT8vQgjFGcSw98Kb4kKtT7HGRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEEe+kQC5YsqCwRO8otlFNjd1nh+g2i1ikNdPD6nXCdAxxUBKE/S5vcWSuoyOVMmChKVTwN
X-Received: by 2002:a05:620a:3192:b0:7c5:562d:cd02 with SMTP id af79cd13be357-7cd4677d561mr3318182085a.41.1747844737171;
        Wed, 21 May 2025 09:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747844737; cv=none;
        d=google.com; s=arc-20240605;
        b=aA0E0/EHDMepNtFJpouIknRBTugVfCiLkTWp1btv+YHa0q03ixNnzzpPYbyarmat5D
         KgTQR1ls8V9vT+dwbw3qc1Sh5EkrHMBCd6og+rXA5wijv40C5Z2pi7FYInDikellR4Ne
         u6q7nhu6JfI+7h48JZAbM3zVpG65y72LZzgzIJ3auwWLM4x5YmN4T4D7cRUU44eqahKi
         Ilpp44xN1O/eVy3r3kxD095GQo4iaWaBHO14VlZTCFg1ibUVAAWY8dskLp2LAo3QFpM6
         8OV/iuy26mvA/XTfM7S4rh90x1etBEu/a8ocMQQo7yD0w5TJ5OpHgDhfp1YwvNLPOIf8
         UFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YbH/cVrrukXjkwenpHpYQwy7EWjb3uHOPthagg80G9c=;
        fh=Bf96Y847ZvG/6/L+Aam4G8bwLgCyLRBs3lDOZnHCE4s=;
        b=QIdxeHadKSFzvik9Ye9Qilx/QGW60tx89hPP/oLaWUXMbs1X03Vlm9GXTPiSqpjbY0
         vuOUg5mBfx1N6z39tNloaft6SkFrf6YiQ7PTIw000m7Mtq/8J/5I+cYaZBXiYbOT4HJg
         Yy/wWDiBnx+TTExQhNlNIl0mdVK3+cFacncrvbYefkC6vBQSdZ9OnJRxPSdFCpw1gYHp
         2nDR9ul4cmn119mGOQu+kRyx51cRAuN0y0KQ62j71GK/WlcAHgjgj57pFhRdHL1BfDWb
         BefFyysA76menyatOIXiwGlpDNpdnQmfRetsBK3FLLc7aB5LRgSW9N0+67+MlG6XtzUn
         PH3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FxLDVaUI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468b03casi1327240285a.329.2025.05.21.09.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 09:25:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FxLDVaUI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHmFs-0002Bu-P8; Wed, 21 May 2025 12:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHmFr-0002BL-PT
 for qemu-arm@nongnu.org; Wed, 21 May 2025 12:25:19 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHmFo-0003oT-Oc
 for qemu-arm@nongnu.org; Wed, 21 May 2025 12:25:19 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-4dfa7c8c008so1950497137.3
 for <qemu-arm@nongnu.org>; Wed, 21 May 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747844714; x=1748449514; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YbH/cVrrukXjkwenpHpYQwy7EWjb3uHOPthagg80G9c=;
 b=FxLDVaUIfrzowpKLJAobAAq47P63rBekbA+mOH2qtQWMXM1SeEf8XIyoA3fku6JmRo
 EMqdHTalBmbqFoaDeFVuippQQq5eCys4HE1fjUWmJnBLEjPKe+La0a3dAXdCnhzmgZy3
 gSQ1T+FCMPbaHDZTPMe7DKUK9uVbarPwXW8LVJB/8XguHuRGycJF9eBVcVrXTfRRZj0c
 QtFL97cIyVDlG+zKqED+TvcysxrTeT+cXshmjhm/Wt2zIwV/XTWhsYnvLafLX9IV2MbC
 JPoSSZI128YbWdtrDklaMNeJ/oETEDOKBCR6YdsCwd2P0cG/DDhJthkN/a3FC8zoaHyh
 gNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747844714; x=1748449514;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YbH/cVrrukXjkwenpHpYQwy7EWjb3uHOPthagg80G9c=;
 b=rev3PUbQJ7JTmqlg8vR3Kf0Svm/8CY/rh+KjEf6DyyI3Jc3/TW0rbm+7fWCyVg1jGM
 6FvyTLdxPez7fSrIDf1//TeLNdYx+ua4pYvPli/ZH1+G5q0EFRYiHTSgEfRsG/OBNzGj
 PX0rMKkFZbksaS85BA5DMj/DbHg6oFiJMFgFsjfkxjUkUGUL1kcpaGWa/naNQxP1vLR5
 XjLDnRoQSbDJ0+2etuntrTuIdpQ2zjPlyvWBL2djsZmRKmPyR0bk63vLAeOyLOKpPqd5
 ogg+39zG8PuFSjXzI3wz5SKTcILTv3dlhd+a8OszazCb2T1Wg7nR2+f1HyOPvPS28tDJ
 DCgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfZamoZE/O3Mc3V+ArrwfxLjSZCMCMRSW+5PlKewfpmG+W/+JtJw5WIvvNPmQyJM3Mrt/sWHn0GQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGXnISjfKsg848/zKI4SPmPL3dzFLkMFP5Vl595DPHG+N0ltXl
 +OaXmGoPTMA7DBP/AEc6rzELGqWOX040lW5vh4PW6ZGTLSQ1wcbeOFG475+nvUbhfTQ=
X-Gm-Gg: ASbGncsIHCjkunoK7Vr6uosU7CVjjzGX23RdtWfGY5elfD70wWWSqoq0oez56aVdWuR
 R4IryNXVCuX9MS+wBdYFrl1yDy1Ta97537Hi3YrpHpPRjBaN93no7DjYtVx9jZ5jC5ZN6FVLktg
 u9G4dTD08vSl94xkvvkMq10gKxQXPi6pnGKLnLGUOZLYt3HnFapzoQn/VIMR26CRuwwY8nWeC77
 Wbf/XxRdgE6QPWigJ5qHSEmKgyxAc8HuuubWeJKFzuO5AqRIjH6wMiAanwT4XJfjKhhtOEFOAS3
 kFQpoW7v3uI3+wpP/b1AsBm3jxuq6Hu411kiZQ0ENVusSNTofcNlsZ5zrEy0mnK+hHHJ6NXa5pP
 P91+J8TGmghmyrOyAY1l4bH3AvKsTpQ==
X-Received: by 2002:a05:6102:2088:b0:4e2:86e6:3785 with SMTP id
 ada2fe7eead31-4e286e63831mr8343493137.5.1747844714195; 
 Wed, 21 May 2025 09:25:14 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:532e:8fb1:3c49:40da?
 ([2804:7f0:b401:d47f:532e:8fb1:3c49:40da])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4dfa64aa8f5sm10181858137.0.2025.05.21.09.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 09:25:13 -0700 (PDT)
Message-ID: <95bff50a-4da9-4abe-b596-95c64ab85231@linaro.org>
Date: Wed, 21 May 2025 13:24:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] hw/i386/acpi-build: Move aml_pci_edsm to a generic
 place
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-15-eric.auger@redhat.com>
 <ad7c7b84-9f12-4767-a349-df47c489c726@linaro.org>
 <2f1d15ea-82fe-4633-9791-ef9a3721b87d@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <2f1d15ea-82fe-4633-9791-ef9a3721b87d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: N+woJNa53b8H

Hi Eric,

On 5/21/25 12:56, Eric Auger wrote:
> Hi Gustavo,
> 
> On 5/21/25 5:26 PM, Gustavo Romero wrote:
>> Hi Eric,
>>
>> On 5/14/25 14:01, Eric Auger wrote:
>>> Move aml_pci_edsm to pcihp since we want to reuse that for
>>> ARM and acpi-index support.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>    include/hw/acpi/pcihp.h |  2 ++
>>>    hw/acpi/pcihp.c         | 53 +++++++++++++++++++++++++++++++++++++++++
>>>    hw/i386/acpi-build.c    | 53 -----------------------------------------
>>>    3 files changed, 55 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>>> index 4d820b4baf..bc31dbff39 100644
>>> --- a/include/hw/acpi/pcihp.h
>>> +++ b/include/hw/acpi/pcihp.h
>>> @@ -82,6 +82,8 @@ bool build_append_notification_callback(Aml
>>> *parent_scope, const PCIBus *bus);
>>>      void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>>>    +Aml *aml_pci_edsm(void);
>>> +
>>>    /* Called on reset */
>>>    void acpi_pcihp_reset(AcpiPciHpState *s);
>>>    diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>>> index d800371ddc..57fe8938b1 100644
>>> --- a/hw/acpi/pcihp.c
>>> +++ b/hw/acpi/pcihp.c
>>> @@ -937,6 +937,59 @@ void build_append_pci_bus_devices(Aml
>>> *parent_scope, PCIBus *bus)
>>>        }
>>>    }
>>>    +Aml *aml_pci_edsm(void)
>>> +{
>>> +    Aml *method, *ifctx;
>>> +    Aml *zero = aml_int(0);
>>> +    Aml *func = aml_arg(2);
>>> +    Aml *ret = aml_local(0);
>>> +    Aml *aidx = aml_local(1);
>>> +    Aml *params = aml_arg(4);
>>> +
>>> +    method = aml_method("EDSM", 5, AML_SERIALIZED);
>>> +
>>> +    /* get supported functions */
>>> +    ifctx = aml_if(aml_equal(func, zero));
>>> +    {
>>> +        /* 1: have supported functions */
>>> +        /* 7: support for function 7 */
>>> +        const uint8_t caps = 1 | BIT(7);
>>> +        build_append_pci_dsm_func0_common(ifctx, ret);
>>> +        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret,
>>> zero)));
>>> +        aml_append(ifctx, aml_return(ret));
>>> +    }
>>> +    aml_append(method, ifctx);
>>> +
>>> +    /* handle specific functions requests */
>>> +    /*
>>> +     * PCI Firmware Specification 3.1
>>> +     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>>> +     *        Operating Systems
>>> +     */
>>> +    ifctx = aml_if(aml_equal(func, aml_int(7)));
>>> +    {
>>> +       Aml *pkg = aml_package(2);
>>> +       aml_append(pkg, zero);
>>> +       /* optional, if not impl. should return null string */
>>> +       aml_append(pkg, aml_string("%s", ""));
>>> +       aml_append(ifctx, aml_store(pkg, ret));
>>> +
>>> +       /*
>>> +        * IASL is fine when initializing Package with computational
>>> data,
>>> +        * however it makes guest unhappy /it fails to process such
>>> AML/.
>>> +        * So use runtime assignment to set acpi-index after initializer
>>> +        * to make OSPM happy.
>>> +        */
>>> +       aml_append(ifctx,
>>> +           aml_store(aml_derefof(aml_index(params, aml_int(0))),
>>> aidx));
>>> +       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>>> +       aml_append(ifctx, aml_return(ret));
>>> +    }
>>> +    aml_append(method, ifctx);
>>> +
>>> +    return method;
>>> +}
>>> +
>>>    const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>>>        .name = "acpi_pcihp_pci_status",
>>>        .version_id = 1,
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index bcfba2ccb3..385e75d061 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -322,59 +322,6 @@ build_facs(GArray *table_data)
>>>        g_array_append_vals(table_data, reserved, 40); /* Reserved */
>>>    }
>>>    -static Aml *aml_pci_edsm(void)
>>> -{
>>> -    Aml *method, *ifctx;
>>> -    Aml *zero = aml_int(0);
>>> -    Aml *func = aml_arg(2);
>>> -    Aml *ret = aml_local(0);
>>> -    Aml *aidx = aml_local(1);
>>> -    Aml *params = aml_arg(4);
>>> -
>>> -    method = aml_method("EDSM", 5, AML_SERIALIZED);
>>> -
>>> -    /* get supported functions */
>>> -    ifctx = aml_if(aml_equal(func, zero));
>>> -    {
>>> -        /* 1: have supported functions */
>>> -        /* 7: support for function 7 */
>>> -        const uint8_t caps = 1 | BIT(7);
>>> -        build_append_pci_dsm_func0_common(ifctx, ret);
>>> -        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret,
>>> zero)));
>>> -        aml_append(ifctx, aml_return(ret));
>>> -    }
>>> -    aml_append(method, ifctx);
>>> -
>>> -    /* handle specific functions requests */
>>> -    /*
>>> -     * PCI Firmware Specification 3.1
>>> -     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>>> -     *        Operating Systems
>>> -     */
>>> -    ifctx = aml_if(aml_equal(func, aml_int(7)));
>>> -    {
>>> -       Aml *pkg = aml_package(2);
>>> -       aml_append(pkg, zero);
>>> -       /* optional, if not impl. should return null string */
>>> -       aml_append(pkg, aml_string("%s", ""));
>>> -       aml_append(ifctx, aml_store(pkg, ret));
>>> -
>>> -       /*
>>> -        * IASL is fine when initializing Package with computational
>>> data,
>>> -        * however it makes guest unhappy /it fails to process such
>>> AML/.
>>> -        * So use runtime assignment to set acpi-index after initializer
>>> -        * to make OSPM happy.
>>> -        */
>>> -       aml_append(ifctx,
>>> -           aml_store(aml_derefof(aml_index(params, aml_int(0))),
>>> aidx));
>>> -       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>>> -       aml_append(ifctx, aml_return(ret));
>>> -    }
>>> -    aml_append(method, ifctx);
>>> -
>>> -    return method;
>>> -}
>>> -
>>>    /*
>>>     * build_prt - Define interrupt routing rules
>>>     *
>>
>> EDSM is not called from anywhere. _DSM method actually calls the PDSM,
>> already defined
>> in pcihp.c and generated by aml_pci_pdsm(). build_acpi_pci_hotplug(),
>> which calls
>> aml_pci_pdsm(), properly creates the PDSM method. Then in
>> build_append_pcihp_slots()
>> the a _DSM is defined per slot and inside it there is a call to PDSM,
>> so I understand
>> we should actually stick to the PDSM in pcihp.c instead of EDSM.
> 
> I see build_append_pci_bus_devices -> aml_pci_static_endpoint_dsm
> adds a _DSM method which eventually calls EDSM.

Yes, but I meant in the final generated ACPI AML code.


> aml_pci_device_dsm builds another _DSM implementation which calls PDSM.
> 
> As we use build_append_pci_bus_devices and we are likely to have a _DSM
> implementation that calls EDSM method, I think we shall have it in the
> aml. What do I miss?

Maybe some condition in build_append_pci_bus_devices() of:

         if (pdev->acpi_index &&
             !object_property_get_bool(OBJECT(pdev), "hotpluggable",
                                       &error_abort)) { ... }


is not met?

Does your _DSM method in the machine's ACPI has a call to EDSM? I don't
see it. In my case it's the PDSM that is being called:

gromero@xps13:/tmp$ grep -n PDSM dsdt.dsl
1910:        Method (PDSM, 5, Serialized)
2047:                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
gromero@xps13:/tmp$ grep -n EDSM dsdt.dsl
1959:        Method (EDSM, 5, Serialized)
gromero@xps13:/tmp$

I also confirmed that PDSM is what is being used by reverting this patch and
dropping the aml_append(pci0_scope, aml_pci_edsm()); in 15/22.

But also, why shouldn't we use the PDSM defined already in pcihp.c? This is
indeed crafted for the acpi-pcihp-hotplug device as I understand it.


Cheers,
Gustavo

> Thank you for the comprehensive review!
> 
> Cheers
> 
> Eric
>>
>> EDSM, being used in i386 code, feels a outdated PDSM, so maybe PDSM
>> should be used there,
>> although a different story or a clean up for later. I'm not sure what
>> "static endpoint"
>> means in the context of EDSM.
>>
>> Hence this patch can be dropped in my understanding and:
>>
>> aml_append(pci0_scope, aml_pci_edsm()) in 15/22 too, without any
>> prejudice to the
>> hotplugging and unplugging in this series.
>>
>>
>> Cheers,
>> Gustavo
>>
> 

