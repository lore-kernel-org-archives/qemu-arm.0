Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3729906wrg;
        Mon, 24 Jun 2019 05:37:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytUqYJKiz0z5YiE1EmEcFgFXmUV8hFDN2nXRgRq6R8IdHL2hQZLrHHAPNQZ2+TNbODhHZr
X-Received: by 2002:a17:902:2ae8:: with SMTP id j95mr104543161plb.276.1561379864349;
        Mon, 24 Jun 2019 05:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561379864; cv=none;
        d=google.com; s=arc-20160816;
        b=Laqt655JAx93YINYYwJbJafyX0oWBebv9HsSFY4R5tqwxlm0/Lzo7Tm2kg9BvtK8nH
         lKr6LSCBA0ItWUjISAvZOBg7ES/U7YA1MOOk7u7+98FBakTaz+jkXLMVMUqW5jzPzMtZ
         tO8RJ2ZhF+l5+kgvQuYOf3/vtjRYkoGefZuC+RWXt8whwIQTHMnxzX5W3AQwxFdOzDHt
         lBYgWLip9LEvdEowYeYwydjI8VbjEfAR4puZVHmrRQsWviuoX7EsZh2jVYm/ct2qJaie
         S4ZGXsBQcn7v/BLd25iZlwlBOJ0eRsvd5oM0w9emyNG67I/3g4g6rTnp/Q+aXbyxiVxR
         VzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=eWf0DKlpabIJ81fhvXWtjsG6wWchKap9jdPMDIe5XNg=;
        b=yvEtsmkVG55SmG3C3tprQXMx8BNR/FbiQzfYPNSAw1C19p23yUBMdDNRMskF/QbRZN
         u63wgqsAifq/xVKTMRdF2kFI/bOmCq+LuGdnnyqZaU9bSZOkED1imqulEs5uXONmrQU5
         Q1UD3/yAkXg27DVVCA9ZPQsdo0z/e9TEOeRvOu5iz9XwpwlF82WDERsP+7+9Xc5S63Gv
         ICL8yBmDwMooaPv9VG+uoMjIw1MfB1gHTwSx4rlMPPLb7bWxV0vdk6ojtb+IOR8VLQSr
         4ezZ4vzOaIojZSw44XruUeA3AzySRbSEJU21ABZkORWs71NBS9RlDlmK8ixa+6VO2UPq
         AjRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b13si10285529plk.313.2019.06.24.05.37.44;
        Mon, 24 Jun 2019 05:37:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfFXMhn (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Mon, 24 Jun 2019 08:37:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:19065 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726834AbfFXMhn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 24 Jun 2019 08:37:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 07410A2BE2C0F14BCE0C;
        Mon, 24 Jun 2019 20:37:40 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Jun 2019
 20:37:29 +0800
Subject: Re: [PATCH v17 04/10] acpi: add build_append_ghes_generic_data()
 helper for Generic Error Data Entry
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
 <1557832703-42620-5-git-send-email-gengdongjiu@huawei.com>
 <20190620142814.7caf9c3c@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <b1ef7ea4-acc9-1f97-b320-37f4600cd9f4@huawei.com>
Date:   Mon, 24 Jun 2019 20:37:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190620142814.7caf9c3c@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: fzuG19n0hiy5



On 2019/6/20 20:28, Igor Mammedov wrote:
> On Tue, 14 May 2019 04:18:17 -0700
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> 
>> It will help to add Generic Error Data Entry to ACPI tables
>> without using packed C structures and avoid endianness
>> issues as API doesn't need explicit conversion.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  hw/acpi/aml-build.c         | 32 ++++++++++++++++++++++++++++++++
>>  include/hw/acpi/aml-build.h |  6 ++++++
>>  2 files changed, 38 insertions(+)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index fb53f21..102a288 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -296,6 +296,38 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
>>          build_append_int_noprefix(table, error_threshold_window, 4);
>>  }
>>  
>> +/* Generic Error Data Entry
>> + * ACPI 4.0: 17.3.2.6.1 Generic Error Data
>> + */
>> +void build_append_ghes_generic_data(GArray *table, const char *section_type,
> s/build_append_ghes_generic_data/build_append_ghes_generic_error_data/
> 
>> +                                    uint32_t error_severity, uint16_t revision,
>> +                                    uint8_t validation_bits, uint8_t flags,
>> +                                    uint32_t error_data_length, uint8_t *fru_id,
>> +                                    uint8_t *fru_text, uint64_t time_stamp)
> checkpatch probably will complain due to too long lines
> you can use:
> void build_append_ghe...
>          uint32_t error_severity, uint16_t revision,
>          ...
> 
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < 16; i++) {
>> +        build_append_int_noprefix(table, section_type[i], 1);
>                                             ^^^
> use QemuUUID instead, see vmgenid_build_acpi
ok.

> 
>> +    }
>> +
>> +    build_append_int_noprefix(table, error_severity, 4);
>> +    build_append_int_noprefix(table, revision, 2);
>> +    build_append_int_noprefix(table, validation_bits, 1);
>> +    build_append_int_noprefix(table, flags, 1);
>> +    build_append_int_noprefix(table, error_data_length, 4);
>> +
>> +    for (i = 0; i < 16; i++) {
>> +        build_append_int_noprefix(table, fru_id[i], 1);
> same as section_type
ok.

> 
>> +    }
>> +
>> +    for (i = 0; i < 20; i++) {
>> +        build_append_int_noprefix(table, fru_text[i], 1);
>> +    }
> instead of loop use g_array_insert_vals()
ok

> 
>> +
>> +    build_append_int_noprefix(table, time_stamp, 8);
> that's not part of 'Table 17-13'
> where does it come from?


It comes from "ACPI 6.1: Table 18-343 Generic Error Data Entry", I will update the comments, thanks for the pointing out.

> 
>> +}
>> +
>>  /*
>>   * Build NAME(XXXX, 0x00000000) where 0x00000000 is encoded as a dword,
>>   * and return the offset to 0x00000000 for runtime patching.
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 90c8ef8..a71db2f 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -419,6 +419,12 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
>>                                uint32_t error_threshold_value,
>>                                uint32_t error_threshold_window);
>>  
>> +void build_append_ghes_generic_data(GArray *table, const char *section_type,
>> +                                    uint32_t error_severity, uint16_t revision,
>> +                                    uint8_t validation_bits, uint8_t flags,
>> +                                    uint32_t error_data_length, uint8_t *fru_id,
>> +                                    uint8_t *fru_text, uint64_t time_stamp);
>> +
>>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>>                         uint64_t len, int node, MemoryAffinityFlags flags);
>>  
> 
> .
> 
