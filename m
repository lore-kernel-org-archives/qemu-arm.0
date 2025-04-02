Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3348802njd;
        Wed, 2 Apr 2025 03:28:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5m/eiqpUIWvOnpRZFhT3ZAKplB6isH8sUzc7SHJyBe0hFWGZcpsBNwkIKxz/hSUiuSTTkJMWtoEiAog==@linaro.org
X-Google-Smtp-Source: AGHT+IGsrtFCcB9tfGY/UhkZuIFOWL5aslqOFl+RS0okKDBUshxHd0VI4aPIqR2GKPLrZgVBMk4F
X-Received: by 2002:a05:6214:1301:b0:6d8:9be9:7d57 with SMTP id 6a1803df08f44-6eed622555amr291889436d6.37.1743589691561;
        Wed, 02 Apr 2025 03:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743589691; cv=none;
        d=google.com; s=arc-20240605;
        b=l0dpF5N/vf4dRXugPRvZR17kceUTkhJs5gMEZH/Nhg53pQRggColtPU72EMRQocoRi
         x0Oo6tgCA1kxub8uvjqjLOBYne9rhAHDBD/IGF1agdEYF8OxfuxmU4qoaELxx4GlEgOw
         7GPNfX+30Ug6bnNyxCaDJI3ZxBJUys+X0PywSMF6Heie2HLzQhoBaaXTNmGUIymALxCS
         t7zjW7La4yExJVl7uDDCLPIdrH8s6i90su7gDTIlqFDWh44FQSXt2wjh4AT00tseS7TH
         YPYgxUyTyzEZl5Cc56NhnLk9vvxj3f/2ZRRWvzY+S+bgWWwHXcsO7y94qkFeTqzyKmlX
         GzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IF3d2quCZG8w73mq1ttUDlwNS4ZWM2i7NiZlA8Fefwc=;
        fh=coJ/iFDvac8fqQu/baEs2TrvA9vMOZj8LOzdwCe7G1s=;
        b=I9nc/NxC5VEp7dNwfuxN1yPGxT9tScd9yBHWCFgyqSgR2MqbpPyIvRQKovq1pQTv+O
         l2cczfzAuAN29hyF5XAn4Pg3QDprC9KMYR+EFdvWiiAF4i1P6m2fKfjqkIl01jmAeSDj
         bb4F5hQKyAxipLSU5vAizIgj8shsfwC/UtQi+xqArZf/ZeQFQQlVu208+q5p+VQZkwvc
         mQKAgFjplPC+UcHl0idMEq/zeIOx90IJUghUGVH2STd9HgzQgR9bItfvDdEs/TxtjaYw
         BR9crHmQQ3/l7FId8pGdhqdZwmCkWN1hnj9AcuAog79nQHKMZdM9L6iuJ9421UmkcRiu
         pgsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5VcOHij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec97cf44esi105749006d6.379.2025.04.02.03.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 03:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5VcOHij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzvK1-0005wJ-4Q; Wed, 02 Apr 2025 06:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzvJu-0005vy-2n
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 06:27:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzvJq-0005P1-Tl
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 06:27:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so42651435e9.3
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743589656; x=1744194456; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IF3d2quCZG8w73mq1ttUDlwNS4ZWM2i7NiZlA8Fefwc=;
 b=P5VcOHij5A8DT0rhKpi702R61Kz2qluaKvueyzs8f55BPgBnFdAws82kfpAVqfhGO0
 GTuBIPfqM568wjgRLiZsJM3KKkQRGTvqN8mS0T5+9Yky/LF7nsQTAwEFHYpLNg9wSjOS
 sBW9RCr0w8B7+uzh+zDgXDywrWHeR2XUZtaH3664uTHjLSmv9atlVeFHGarlOxOfTGsY
 jUpzTqobOt1sVVLc6EUlL0tvlFerY8MntIN2aqTkpLuWQl/erNmPv6SDp3nLNdmFWOYo
 ntKiSPVjE9GFWv/J1O4MgW2Mpls1ftWongZWq/2XWV4nQdpGvVjLHr835gP9rxepzoim
 yc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743589656; x=1744194456;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IF3d2quCZG8w73mq1ttUDlwNS4ZWM2i7NiZlA8Fefwc=;
 b=mf1bMLeKopkdMflyC3ZqFivFtxWhaBaX2Zpw/UuVBGCcRmZVIrJm4ix64TgEICbWdN
 +ZGq8i4i/6T733DHjeZXzjhxZgGeoeB2Lopwtle7Kfs8rca01z6F2oU1cSAAELgrWLOU
 zvAw42IJv8onVbsGgk5Kc3MLH62CKwacPs5D5jBNo4nNvLfsetg6S0I4fXV4SGxgSLLs
 OJ1iPfnlTa54wRVmJ6WKIsTTazAoQZxyoEOItuB80hC+Kp0gs/++85JLwbY1jLwrq9Tm
 9i9IhWSOC6T9uSEUdviLOG5yd/jya9WbG+zj1p7fKj4ZjDv4xHBTe1SjSKtzHvSZd/bx
 GHdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ6sZnLpWXTxRWtbW4yB5qkb+4PPAP80x7/5OPokQZhonOAh9/JhOe+rvVAhouunb5f71oYbzuAQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxQz6m0gv43d7kYLD0yUql5QwTNr12pUMjdYEIeKh6SJEIi5+Q
 r9EhONKx3qV3hhlWdYcd+EwMXhzDoHMsraBXsAf0/V/lTlnVE6SNpgHP3K5xRrg=
X-Gm-Gg: ASbGnctSzmYao8Lbf54Cou7s8tcxSzE9X0AKMI9EvGR2t/3QVVHNw6ILICCwkkaPQ1k
 4dE8jxpd5OlVqvmXgVuLljUMU1ruM0KkAcg3TjParRHagRMLaK4ISAjFR6tVq90t1DqXjxiIFms
 sefrYzCsc7YX8P2yiYr2imVSAul1USgrZXmI83h4KYTZAnDCwZeW4S/hkDldhDTzvb5c/jUlFJX
 VUX1+/eeLqJyNz1y1n027u0bnPw8JTaqnDQiVDYadpEf34MMlMI9KTHYopW7ZwYb4c3kaHxMTI9
 plP4LEI/YKtQeuHJ5zM3pYFtoqzZ1k33EqI1dNqjGJz9wwlFtUb6H4PpHT3xxFKIdQXT68aL86h
 r29zbdwYFJjsv
X-Received: by 2002:a05:6000:2a83:b0:39c:1257:febb with SMTP id
 ffacd0b85a97d-39c23674c2amr3761647f8f.59.1743589655965; 
 Wed, 02 Apr 2025 03:27:35 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb61907f7sm15892135e9.30.2025.04.02.03.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:27:35 -0700 (PDT)
Message-ID: <ef0f90c8-c87a-4833-a590-6370cd03ea2d@linaro.org>
Date: Wed, 2 Apr 2025 12:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 3/5] hw/arm/virt-acpi: Factor its_enabled()
 helper out
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-4-philmd@linaro.org>
 <80dd971a-2a45-44a5-9454-43257ead30a5@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <80dd971a-2a45-44a5-9454-43257ead30a5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jPKqcHR0X+WX

On 2/4/25 08:43, Gustavo Romero wrote:
> Hi Phil,
> 
> On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
>> GIC ITS is checked for the MADT and IORT tables.
>> Factor the checks out to the its_enabled() helper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/virt-acpi-build.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 3ac8f8e1786..fdc08b40883 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -208,6 +208,13 @@ static void acpi_dsdt_add_tpm(Aml *scope, 
>> VirtMachineState *vms)
>>   #define ROOT_COMPLEX_ENTRY_SIZE 36
>>   #define IORT_NODE_OFFSET 48
>> +static bool its_enabled(VirtMachineState *vms)
>> +{
>> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>> +
>> +    return its_class_name() && !vmc->no_its;
>> +}
>> +
> 
> Isn't its_class_name() always "true"?

The method signature is described as:

  /**
   * its_class_name:
   *
   * Return the ITS class name to use depending on whether
   * KVM acceleration  and KVM CAP_SIGNAL_MSI are supported
   *
   * Returns: class name to use or NULL
   */
  const char *its_class_name(void);

So I'd say no.

Indeed since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI")
the single implementation doesn't return NULL anymore.

Paolo, can we update the signature and clean code path?

Anyhow Gustavo, while well noticed, this is pre-exising and unrelated
to the code movement in this patch.

> 
> 
> Cheers,
> Gustavo
> 
>>   /*
>>    * Append an ID mapping entry as described by "Table 4 ID mapping 
>> format" in
>>    * "IO Remapping Table System Software on ARM Platforms", Chapter 3.
>> @@ -670,7 +677,6 @@ static void
>>   build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState 
>> *vms)
>>   {
>>       int i;
>> -    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>       const MemMapEntry *memmap = vms->memmap;
>>       AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
>>                           .oem_table_id = vms->oem_table_id };
>> @@ -741,7 +747,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, 
>> VirtMachineState *vms)
>>                                             
>> memmap[VIRT_HIGH_GIC_REDIST2].size);
>>           }
>> -        if (its_class_name() && !vmc->no_its) {
>> +        if (its_enabled(vms)) {
>>               /*
>>                * ACPI spec, Revision 6.0 Errata A
>>                * (original 6.0 definition has invalid Length)
>> @@ -973,7 +979,7 @@ void virt_acpi_build(VirtMachineState *vms, 
>> AcpiBuildTables *tables)
>>                             vms->oem_table_id);
>>       }
>> -    if (its_class_name() && !vmc->no_its) {
>> +    if (its_enabled(vms)) {
>>           acpi_add_table(table_offsets, tables_blob);
>>           build_iort(tables_blob, tables->linker, vms);
>>       }
> 

