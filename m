Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp152938lfj;
        Wed, 15 Dec 2021 05:19:36 -0800 (PST)
X-Received: by 2002:a05:6000:2c2:: with SMTP id o2mr4456546wry.360.1639574376255;
        Wed, 15 Dec 2021 05:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639574376; cv=none;
        d=google.com; s=arc-20160816;
        b=FvBwUfWTQrR0JuRt/liJn8UWCcADSEET+WWObvcAp0d36PvIabZsVjMhdZjs9R8Vd3
         HuURqntjqP9IXu4FnsN/75fw61O8xYmM4i7deXdu50dV2HYcsNpmUMBVo2jm8OMnGx+l
         prbGiN04dJTfu6elX7VI6QYUSKU6/jELi7L+aB4txpZiCETi6MBPqwYLPEjKNZMZGAWv
         EdN4R4XZGuC9wVYVLg0XBmm+pQBqXPFTdfU/00wyCdoA43CSEyEo6Kl8bXtKk1Oe1P1o
         OKZNyoH//xExU89Or0OAQ2RAqKH8elUU9fopKzetUX6Bkix/bgat/+fKoK0p0R/XLKde
         J58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WEmRbe1D6TKty7I9+SikbziNO0GrFzYRrGm7K0d5PE0=;
        b=IzEcZrcom4xSH4saEb2bUog9HgAB0r8+sgSjmB4H5u7O8kPetn/+dXOv7dSPw5+cU5
         lg4sSmug08LJVXu85Q1f+l9k+wdFQRK+DoRiDsnKhW+7bCl+feWHBL5qCsx5IETEvT+P
         QbufBylCKFUq/zch78y4EpKhBmPOzJcU5lhtGz8pQ+dNxHexXt8c9y8DIIrJPYQBqfur
         lsVIyUbO6xAdpXPx71Z9hD0wJrHeCL1rWUk4yl/0DI1DKZKlwNeFwvHRg/b+ByKcI9wd
         w8WGlqE+UbvGqFlq43K8X1S7qYUouU46qf7zeGiAK7tmpctHQQkeymqaOStGjuIUoRrr
         Iuyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@forissier-org.20210112.gappssmtp.com header.s=20210112 header.b=2y5s3tgX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of jerome@forissier.org) smtp.mailfrom=jerome@forissier.org
Return-Path: <jerome@forissier.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p18sor1219502wre.72.2021.12.15.05.19.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Dec 2021 05:19:36 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of jerome@forissier.org) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@forissier-org.20210112.gappssmtp.com header.s=20210112 header.b=2y5s3tgX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of jerome@forissier.org) smtp.mailfrom=jerome@forissier.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=forissier-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WEmRbe1D6TKty7I9+SikbziNO0GrFzYRrGm7K0d5PE0=;
        b=2y5s3tgXjs89a3Kxnf2M0butb/566qOMnOtKoaBG4ELWWMnNWoUgNE+jEi3DllO+pL
         AvhDOErC3Eome5eNBpJEPJsJbfKDbiDFqo4fdVsKHrFJ1i3b4xqO9252/OMPZennvrCr
         fP2jh7WMOcQ4fdvw4YHLSKkWgaOoJitve0fUQLD2tKUvCUAxIdM0VMzxkUuXdY4G50+h
         3DNb1hiwaATmcFIA3AV6h5vcbu1W96fcINP83Y7iBlIilPOjV3Ig6l6ohuE8HcOnFT6+
         L13NzMd/zo/OzxIUZsSdL/BRzT4ON8y5HDXYW00D1Dsrmb1rqSioD6abreonp9CcqW0+
         SiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WEmRbe1D6TKty7I9+SikbziNO0GrFzYRrGm7K0d5PE0=;
        b=MdVW4xq0c5qcIaSMj9RT+mGfQOQ3W50mnbAZsB2DYNW8fpQ/7KuQHZK1chjYcPaBMs
         eF/2o/2MTmadadpvXyei5nTaaPbTc3jc3AKuIa8Byo3l9m+BpH2QsnqUVFFnmcK4PZeU
         VZCvSbXkqac/LUKHWPwQu4lN+CXqgTzNq9NGIpEz8nMY5Pr14gwwFI6SFt04mC6VMB2K
         xulQ7QgHl/lpAq1KA22HVFumrZ93MRfy54XzhHgjOU5GrzAHib05FH6pCZOVTTFnKcF2
         VbbtVO/B3c5VVEdOB/8EYToHiN/1Pa0VQbnOCEPZL9NN2DlnTf7eay8Ko6968ztGfS6U
         9x0w==
X-Gm-Message-State: AOAM531ftT5f90NTpjL2D+ws6t2Sd1AO/h7O991HoxRd/zK+Oic8Cqoc
	bKA2n/Hn6aXyw3YkZJwR/RuvTg==
X-Google-Smtp-Source: ABdhPJzBgiR6rjOIoQErYafXkaNOD0Mxq8ayRE7yMwNIar+YgoF9sIKD7KKpTMEtKqkk+fnyg6cQNQ==
X-Received: by 2002:adf:ef84:: with SMTP id d4mr4423195wro.175.1639574375773;
        Wed, 15 Dec 2021 05:19:35 -0800 (PST)
Return-Path: <jerome@forissier.org>
Received: from ?IPV6:2a01:e0a:269:e210:e917:f27a:8c45:5487? ([2a01:e0a:269:e210:e917:f27a:8c45:5487])
        by smtp.gmail.com with ESMTPSA id m20sm5568256wmq.11.2021.12.15.05.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 05:19:35 -0800 (PST)
Message-ID: <aa48cfca-3db1-2bfc-100f-ae1c1e83f0ef@forissier.org>
Date: Wed, 15 Dec 2021 14:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
Content-Language: en-US
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
 <CAC_iWjL6x+qPmWSeeV1QWg=8X5XmXVaCJb99==_1uoyQsOps_w@mail.gmail.com>
From: Jerome Forissier <jerome@forissier.org>
In-Reply-To: <CAC_iWjL6x+qPmWSeeV1QWg=8X5XmXVaCJb99==_1uoyQsOps_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5h4g17JFx+5S



On 12/15/21 14:15, Ilias Apalodimas wrote:
> Hi Alex,
> 
> On Wed, 15 Dec 2021 at 14:09, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Generally a guest needs an external source of randomness to properly
>> enable things like address space randomisation. However in a trusted
>> boot environment where the firmware will cryptographically verify
>> components having random data in the DTB will cause verification to
>> fail. Add a control knob so we can prevent this being added to the
>> system DTB.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>> Cc: Jerome Forissier <jerome@forissier.org>
>> ---
>>  docs/system/arm/virt.rst |  7 +++++++
>>  include/hw/arm/virt.h    |  1 +
>>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>>  3 files changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index 850787495b..c86a4808df 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -121,6 +121,13 @@ ras
>>    Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
>>    using ACPI and guest external abort exceptions. The default is off.
>>
>> +kaslr-dtb-seed
>> +  Set ``on``/``off`` to pass a random seed via the guest dtb to use for features
>> +  like address space randomisation. The default is ``on``. You will want
>> +  to disable it if your trusted boot chain will verify the DTB it is
>> +  passed. It would be the responsibility of the firmware to come up
>> +  with a seed and pass it on if it wants to.
>> +
>>  Linux guest kernel configuration
>>  """"""""""""""""""""""""""""""""
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index dc6b66ffc8..acd0665fe7 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -148,6 +148,7 @@ struct VirtMachineState {
>>      bool virt;
>>      bool ras;
>>      bool mte;
>> +    bool kaslr_dtb_seed;
>>      OnOffAuto acpi;
>>      VirtGICType gic_version;
>>      VirtIOMMUType iommu;
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 30da05dfe0..4496612e89 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -248,11 +248,15 @@ static void create_fdt(VirtMachineState *vms)
>>
>>      /* /chosen must exist for load_dtb to fill in necessary properties later */
>>      qemu_fdt_add_subnode(fdt, "/chosen");
>> -    create_kaslr_seed(ms, "/chosen");
>> +    if (vms->kaslr_dtb_seed) {
>> +        create_kaslr_seed(ms, "/chosen");
>> +    }
>>
>>      if (vms->secure) {
>>          qemu_fdt_add_subnode(fdt, "/secure-chosen");
>> -        create_kaslr_seed(ms, "/secure-chosen");
>> +        if (vms->kaslr_dtb_seed) {
>> +            create_kaslr_seed(ms, "/secure-chosen");
>> +        }
>>      }
>>
>>      /* Clock node, for the benefit of the UART. The kernel device tree
>> @@ -2236,6 +2240,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>>      vms->its = value;
>>  }
>>
>> +static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->kaslr_dtb_seed;
>> +}
>> +
>> +static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->kaslr_dtb_seed = value;
>> +}
>> +
>>  static char *virt_get_oem_id(Object *obj, Error **errp)
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>> @@ -2765,6 +2783,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                            "Set on/off to enable/disable "
>>                                            "ITS instantiation");
>>
>> +    object_class_property_add_bool(oc, "kaslr-dtb-seed",
>> +                                   virt_get_kaslr_dtb_seed,
>> +                                   virt_set_kaslr_dtb_seed);
>> +    object_class_property_set_description(oc, "kaslr-dtb-seed",
>> +                                          "Set off to disable passing of kaslr "
>> +                                          "dtb node to guest");
>> +
>>      object_class_property_add_str(oc, "x-oem-id",
>>                                    virt_get_oem_id,
>>                                    virt_set_oem_id);
>> @@ -2829,6 +2854,9 @@ static void virt_instance_init(Object *obj)
>>      /* MTE is disabled by default.  */
>>      vms->mte = false;
>>
>> +    /* Supply a kaslr-seed by default */
>> +    vms->kaslr_dtb_seed = true;
>> +
>>      vms->irqmap = a15irqmap;
>>
>>      virt_flash_create(vms);
>> --
>> 2.30.2
>>
> 
> This is particularly useful if the bootloader uses a TPM to measures
> the DTB and end up with a measured boot flow.
> 
> Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> 

Fine with me too. FWIW:

Acked-by: Jerome Forissier <jerome@forissier.org>
