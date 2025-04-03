Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3910213njd;
        Wed, 2 Apr 2025 23:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbOTS814zPWyUkTs3WQj6t2t7oH/F6hQFmQTeQVAn8Gb07y0LgpmJtZVWZZmcwzHZfzXgnB3hefHtk4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFHpYBTUiYHpfA1qEbRUCdQ6brIMb01EAs/jEXuCYUoGd3ALp5XN++PWSMh5aHNtCE4A8hq
X-Received: by 2002:a05:620a:4406:b0:7c5:6b15:1483 with SMTP id af79cd13be357-7c6862e73femr3056211885a.6.1743661745803;
        Wed, 02 Apr 2025 23:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743661745; cv=none;
        d=google.com; s=arc-20240605;
        b=YmQIta++fXh+5BeslAPB7Yu/v+bM2uuhkGsBnpWFmglW+pYMISkbZrFpm4h/6Br9Pl
         XBbv5obFDDqUpcFcxenXjMUP6GYCBbBtWSDG7nWdr7Y7HN0G6C29e/XBSfAlyvB2FFSk
         X+MDEqHKa/Lo6LiClRpXUBJQItAdgfsn6FNIFQR5RLIfX148hAilgtCoqYF8+WR1iUrS
         x5KlNaNDK5rpUXq4RgnYTO1DM0esHmEHGJFz4o7skIKQKjzRswdH40F6iUjfdc3OiO60
         bgRBmFpreekeWmtFlVk+IiI6RwKoNicjVtUQFgSh+rPf422JV7W8iyyaTyUF7rg59Vha
         1cTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ffoophbJESeM8f0YIXk8eS3wdaHWmbN4vUcMJl8QIS4=;
        fh=21c7ZPSPyLf+t/H8Dm6Htq14Rv5qmng4JnDjW4aVtR0=;
        b=GAyjXC1rkFLSHLSUMks5Rcac2QbIW4i1dR6CZGjdKS4FxjpObbHiZDRHdvCtJgsVZu
         fYUKqJkTZP1ojs1kqfC6qndOmtPT33DyFoKyh/Ud8lg7JHpxwyHheL51dvpQ7hnlJXob
         M51TEJqTge2vT4y7HqUPK8BFwDMcUUYcXnoKQLC9papz9kKvImpSTfXl3BKM2NVBLj3N
         x4HMTgdkonwpxqSoKn7ORROaDichRrtnVHn+ZitPeqWFvDcweSDyvvg/IS6IW7iPtfH7
         tndaP2dG6aKTB4Sy7p95jVKJlW4uZzq8PtdPSSbHxf9L33mdUr2WoiuNKzx0iVWAGSc1
         vNMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A857n0OC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c76e749f68si66459185a.77.2025.04.02.23.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 23:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A857n0OC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0E4T-00046o-1P; Thu, 03 Apr 2025 02:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E4D-00042C-OF
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:28:51 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E4A-0007tu-VL
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:28:45 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-3031354f134so398269a91.3
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 23:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743661721; x=1744266521; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ffoophbJESeM8f0YIXk8eS3wdaHWmbN4vUcMJl8QIS4=;
 b=A857n0OCVzbzB8owBKTPx1XtBd4kXWSQTGQRlTnbYu0r50baoC+SA6/2u/HpXFe2qk
 xCKy/ye8XLXf44lLQDU7ZdrA8/dOYxFIpF2FDHmCv5usJPDuFk4QtgGYT+ch+CfAKAHT
 9K7II3AJn7unU9pyr7HpmzriHm+FUN2ZrzSxdjjWXt6lbi3AoYaM8lDCSsvHqyFNmF1i
 B2Wc4qoXXWxIUHPxb4vwi7MS7vxSkcwJ9TxoNO1o/1RVjyR+e79QSgauDPJKt93XMEKT
 4nhK8jPj0JtPQJ2G+EwM/ZSD6Z9ViYuraoXxWTkDlxZ00QdfArghxFU+QIFCY659BhS1
 8ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743661721; x=1744266521;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ffoophbJESeM8f0YIXk8eS3wdaHWmbN4vUcMJl8QIS4=;
 b=m7IUVN96b2AfPTNsd34IrCeu3VcTo5EqWI9xVMcWt36oLk1apQLByrxvq9SCsJBNwN
 1N+flS32RZA210X6qnSs6yMhKPK8c4Le/U4KH53uqoxxFtqjWa1TYlAEssnT3Puo46yT
 dYOMPsvjAldfPMlAFAFViMxJpgaW39al6HzA4LKKNu+GhMf7EfSzhlkAVxnnC19Nxwi9
 4sEFe5PEkU2He5mW1izta0S3KAUzrOEe3JweAfHU9CA1b6ziRf67Q8fpjj38c0fsV2Gn
 2n2v/6GB2RVQetsqFqlO2bn9P9khy1eSKgfOBerYbfNiD2zRllWUywxRRC1MnmUPF+SQ
 U/nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv/hAglJekcxqrKEMW6B10pgfmCKXO91GbaJsZt/+rWoMWjSD/QhyqHkMPjJNWKuTDzSn8wMw/6Q==@nongnu.org
X-Gm-Message-State: AOJu0YyKLQ8uQ4cbibs07zhQJxNCGIIBXkRu7OW5rOZvuATPr3lPKZdm
 S4+DZEdD9ivFm1tuZDBlvG2jH5gbcnCyDChWvrpTUpr1Xea0eqQGCAAs5bG+aFs=
X-Gm-Gg: ASbGncsQmFGB11fM0XXI5DQwowYlbJoo91C1BKw/NoQZTPUnOJn8nFxEJScX7B/9NHt
 aLF6FyJeiCldtn5Cc5yWCbceOP+iRhHLB8JFxdI5qQnqruSUTASeaCaIW20IV7UHFTw/azGW1D1
 6s6FdmIYYhK5adL63lr4XfrcBFTIM13F0NzFcOVjGBF11nH+AyQIiZg7OeDgx1aiLkMGhnc0k/T
 V6Sq7f1Igin3tPAH+pso78M0YM7eM+aUPK/IL0HZmmvXgDZo7E0j8UPT/2KWQgTETKVNm1l2+Nj
 u3c3zgatBIsizmrt52BGHQL6Yj8iUbrFPp9Pa0oj/FtGfFN5PTLdPg0RphfxZVsWEHM=
X-Received: by 2002:a17:90b:3c4f:b0:2ee:f550:3848 with SMTP id
 98e67ed59e1d1-30531f7c573mr25683034a91.5.1743661721371; 
 Wed, 02 Apr 2025 23:28:41 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-305983bce79sm626029a91.37.2025.04.02.23.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 23:28:40 -0700 (PDT)
Message-ID: <bae6e29a-7290-47d2-8caf-14702ee091f0@linaro.org>
Date: Thu, 3 Apr 2025 03:28:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 3/5] hw/arm/virt-acpi: Factor its_enabled()
 helper out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-4-philmd@linaro.org>
 <80dd971a-2a45-44a5-9454-43257ead30a5@linaro.org>
 <ef0f90c8-c87a-4833-a590-6370cd03ea2d@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <ef0f90c8-c87a-4833-a590-6370cd03ea2d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: l3uKKnZ9U3yF

Hi Phil,

On 4/2/25 07:27, Philippe Mathieu-Daudé wrote:
> On 2/4/25 08:43, Gustavo Romero wrote:
>> Hi Phil,
>>
>> On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
>>> GIC ITS is checked for the MADT and IORT tables.
>>> Factor the checks out to the its_enabled() helper.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/arm/virt-acpi-build.c | 12 +++++++++---
>>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 3ac8f8e1786..fdc08b40883 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -208,6 +208,13 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>>>   #define ROOT_COMPLEX_ENTRY_SIZE 36
>>>   #define IORT_NODE_OFFSET 48
>>> +static bool its_enabled(VirtMachineState *vms)
>>> +{
>>> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>> +
>>> +    return its_class_name() && !vmc->no_its;
>>> +}
>>> +
>>
>> Isn't its_class_name() always "true"?
> 
> The method signature is described as:
> 
>   /**
>    * its_class_name:
>    *
>    * Return the ITS class name to use depending on whether
>    * KVM acceleration  and KVM CAP_SIGNAL_MSI are supported
>    *
>    * Returns: class name to use or NULL
>    */
>   const char *its_class_name(void);
> 
> So I'd say no.
> 
> Indeed since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI")
> the single implementation doesn't return NULL anymore.
> 
> Paolo, can we update the signature and clean code path?

Updating the signature won't solve the redundancy here. Using its_class_name()
for gating the generation of GIC ITS-related ACPI data is still moot.


> Anyhow Gustavo, while well noticed, this is pre-exising and unrelated
> to the code movement in this patch.

hmm I think the fix is kind simple: just remove its_class_name() from
the predicate in its_enabled(). Is that what you meant by "clean code path"
above?

This seems correct to me because we always have ITS present if
(vmc->no_its == false and vms->its == true). If TCG is used and option
its=on is given ITS is created in create_its(). If KVM accel is used
it's as in the commit message from Paolo you pointed out:

     ARM uses it to detect the presence of the ITS emulation in the kernel,
     introduced in Linux 4.8.  **Assume that it's there and possibly fail when
     realizing the arm-its-kvm device.**

So if kernel does not support in-kernel ITS kvm_arm_its_realize() will
bail out with "error creating in-kernel ITS".

It's up to you if you want to fix it in this series or not :)


>>>   /*
>>>    * Append an ID mapping entry as described by "Table 4 ID mapping format" in
>>>    * "IO Remapping Table System Software on ARM Platforms", Chapter 3.
>>> @@ -670,7 +677,6 @@ static void
>>>   build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>   {
>>>       int i;
>>> -    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>       const MemMapEntry *memmap = vms->memmap;
>>>       AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
>>>                           .oem_table_id = vms->oem_table_id };
>>> @@ -741,7 +747,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>> memmap[VIRT_HIGH_GIC_REDIST2].size);
>>>           }
>>> -        if (its_class_name() && !vmc->no_its) {
>>> +        if (its_enabled(vms)) {
>>>               /*
>>>                * ACPI spec, Revision 6.0 Errata A
>>>                * (original 6.0 definition has invalid Length)
>>> @@ -973,7 +979,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>                             vms->oem_table_id);
>>>       }
>>> -    if (its_class_name() && !vmc->no_its) {
>>> +    if (its_enabled(vms)) {
>>>           acpi_add_table(table_offsets, tables_blob);
>>>           build_iort(tables_blob, tables->linker, vms);
>>>       }

I can't see how that's right. Gating IORT table generation entirely based
on the presence of ITS looks wrong because IORT table has data beyond GIC ITS,
like for SMMUv3 etc.. Maybe open an issue to investigate it later?


FWIW,

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
