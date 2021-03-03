Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5213447lfg;
        Wed, 3 Mar 2021 01:50:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylmrn7OaaUabK3nq/FgEW5THHcg3rZlZ9Z+C+m8cOBg1+QFD9IDhJIxvboF8TAK/dSOS+r
X-Received: by 2002:a05:6e02:1ca8:: with SMTP id x8mr20046619ill.139.1614765040340;
        Wed, 03 Mar 2021 01:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614765040; cv=none;
        d=google.com; s=arc-20160816;
        b=fIkPiRz5pBEqcXxWSeGL1d6Dwbvv0kNQSh0y4H31N67iXM4XZjwow2Xe7H00SxSrVl
         TWlBseoThjo6Kji/GGIDkm8VWferisAb+GVmN4Wm2gcS3QQ4qKN+MuYvmK3x0ud9cIid
         JAM/Aatp4ZNtny29Jc+6NL59tSxZ7vo9gI6WcZftj/sDcP8ca5qWQcKLcTzmrJ6fq4H6
         lphWwkgdsjvvlMDvWAjY5xxV7xMtuDaE8WrlwQw1ufKAkdPfiCmSHF/0Hpuf5yELlSvt
         A4Q+91cBdr+96HSX0XDSW6R9Wq5kWrUPgVLYolv3/JUX63AgXx6RUGRloPJ5+wxhU4z5
         ZQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=ihElrn+t6ag1ibheZwGJgCKfrfjwAWAnm87G605MEVE=;
        b=kg9Z/JfYDj6rNC6RYbxN7Uv2e7gR9ZhKLNm6VswHhk6aLJW8dxBSflEfdqIAeel6Ht
         Fe4eeP+VrKATY+tXmq7VAh9golybPEFWGGE3RY/tfsEHrFpymtMTx67/lLgndG1rk4uc
         kVJDpXeBE71q/qFZnXuLLgKaAXMrSAA4hLTUgQnuvfT6h8zyjOuDIZ1AqVXxiX6359HF
         28Fw3Qp1G6YNYrg2eVT9AUTWIl0ZKJFNi/8e/6jzUJwRMWNXe6CIfwGJ1Cdblx3+Fs4/
         t7PI3ICts38IUiKeAy0A0t5n58YaUuNTSHJRDo3ukb0b3FtsGnQ2d4/oe1tEdDcJok5j
         Q8Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CxuQ3TSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si22685307ilv.123.2021.03.03.01.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 01:50:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CxuQ3TSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHO9P-0003wI-Lj
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 04:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHO8p-00035B-7h
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 04:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHO8n-0001XL-4q
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 04:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614765000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihElrn+t6ag1ibheZwGJgCKfrfjwAWAnm87G605MEVE=;
 b=CxuQ3TSnsfaBYjRIULvAc3UrhVKhwTTbXZwabMCpF4cwkhLGFTIA4nnWJNfUAyoKvadcM3
 j74Snu0/wX9+YM0/U8cAVOxTSyl4uLR+WvZ3nLrS18VAPo8BqLBftsPRDUHb9mZ57+ObAK
 Rh2tx0rVAtVefJ1tUDsNZZwRzVH42vU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-4QZO-A4aMTePZy8HHLTktw-1; Wed, 03 Mar 2021 04:49:58 -0500
X-MC-Unique: 4QZO-A4aMTePZy8HHLTktw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38ADC29F;
 Wed,  3 Mar 2021 09:49:50 +0000 (UTC)
Received: from [10.36.112.28] (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81FC219C48;
 Wed,  3 Mar 2021 09:49:48 +0000 (UTC)
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
 <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
 <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
 <20210303044336-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <dfbf37a2-93bc-5c63-9e8c-f19426798153@redhat.com>
Date: Wed, 3 Mar 2021 10:49:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303044336-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BQbu6V9qJXdq

On 03.03.21 10:43, Michael S. Tsirkin wrote:
> On Tue, Mar 02, 2021 at 07:43:40PM +0100, David Hildenbrand wrote:
>>>>> The resizeable memory region that is created for the cmd blob has a maximum
>>>>> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
>>>
>>> The expression "ACPI_BUILD_ALIGN_SIZE - 4k" makes no sense to me.
>>> ACPI_BUILD_ALIGN_SIZE is #defined in "hw/i386/acpi-build.c" as 0x1000,
>>> so the difference (ACPI_BUILD_ALIGN_SIZE - 4k) is zero.
>>>
>>> (1) Did you mean "ACPI_BUILD_ALIGN_SIZE -- 4k"? IOW, did you mean to
>>> quote the value of the macro?
>>>
>>> If you mean an em dash, then please use an em dash, not a hyphen (or
>>> please use parens).
>>
>> Yes, or rather use ACPI_BUILD_ALIGN_SIZE (4k).
>>
>>>
>>>
>>>>> as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
>>>>> we require more than 4k and can crash QEMU when trying to resize the
>>>>> resizeable memory region beyond its maximum size:
>>>>>     $ build/qemu-system-x86_64 --enable-kvm \
>>>>>         -machine q35,nvdimm=on \
>>>>>         -smp 1 \
>>>>>         -cpu host \
>>>>>         -m size=2G,slots=8,maxmem=4G \
>>>>>         -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
>>>>>         -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
>>>>>         -nodefaults \
>>>>>         -device vmgenid \
>>>>>         -device intel-iommu
>>>>>
>>>>> Results in:
>>>>>     Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
>>>>>     qemu-system-x86_64: Size too large: /rom@etc/table-loader:
>>>>>       0x2000 > 0x1000: Invalid argument
>>>>>
>>>>> We try growing the resizeable memory region (resizeable RAMBlock) beyond
>>>>> its maximum size. Let's increase the maximum size from 4k to 64k, which
>>>>> should be good enough for the near future.
>>>
>>> The existent code calls acpi_align_size(), for resizing the ACPI blobs
>>> (the GArray objects).
>>>
>>> (Unfortunately, the acpi_align_size() function is duplicated between
>>> "hw/i386/acpi-build.c" and "hw/arm/virt-acpi-build.c", which seems
>>> unjustified -- but anyway, I digress.)
>>>
>>> This seems to come from commit 868270f23d8d ("acpi-build: tweak acpi
>>> migration limits", 2014-07-29) and commit 451b157041d2 ("acpi: Align the
>>> size to 128k", 2020-12-08).
>>>
>>> (2) Why is the logic added in those commits insufficient?
>>
>> We are dealing with different blobs here (tables_blob vs. cmd_blob).
>>
>>>
>>> What is the exact call tree that triggers the above error?
>>
>> [...]
>>
>> acpi_build_update()->acpi_build_update()->memory_region_ram_resize()->qemu_ram_resize()
>>
>> A longer calltrace can be found in https://bugzilla.redhat.com/show_bug.cgi?id=1927159.
>>
>>>>> +++ b/hw/i386/acpi-microvm.c
>>>>> @@ -255,7 +255,8 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
>>>>>                          ACPI_BUILD_TABLE_MAX_SIZE);
>>>>>        acpi_add_rom_blob(acpi_build_no_update, NULL,
>>>>>                          tables.linker->cmd_blob,
>>>>> -                      "etc/table-loader", 0);
>>>>> +                      ACPI_BUILD_LOADER_FILE,
>>>>> +                      ACPI_BUILD_LOADER_MAX_SIZE);
>>>>>        acpi_add_rom_blob(acpi_build_no_update, NULL,
>>>>>                          tables.rsdp,
>>>>>                          ACPI_BUILD_RSDP_FILE, 0);
>>>
>>> (3) Why are we using a different "tool" here, from the previous
>>> approach? We're no longer setting the GArray sizes; instead, we make the
>>> "rom->romsize" fields diverge from -- put differently, grow beyond --
>>> "rom->datasize". Why is that useful? What are the consequences?
>>
>> See ACPI_BUILD_TABLE_MAX_SIZE handling just in the acpi_add_rom_blob() above.
>>
>>>
>>> Where is it ensured that data between "rom->datasize" and "rom->romsize"
>>> reads as zeroes?
>> We only expose the current memory_region_size() to our guest, which is
>> always multiples of 4k pages.
>>
>> rom->datasize and rom->romsize will be multiple of 4k AFAIKs.
>>
>> acpi_align_size()-> g_array_set_size() will take care of zeroing out
>> any unused parts within a single 4k page.
>>
>> So all unused, guest-visible part should always be 0 I think.
>>
>>>
>>>
>>>>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>>>>> index 380d3e3924..93cdfd4006 100644
>>>>> --- a/include/hw/acpi/aml-build.h
>>>>> +++ b/include/hw/acpi/aml-build.h
>>>>> @@ -6,6 +6,7 @@
>>>>>
>>>>>    /* Reserve RAM space for tables: add another order of magnitude. */
>>>>>    #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
>>>>> +#define ACPI_BUILD_LOADER_MAX_SIZE        0x40000
>>>>>
>>>>>    #define ACPI_BUILD_APPNAME6 "BOCHS "
>>>>>    #define ACPI_BUILD_APPNAME8 "BXPC    "
>>>>
>>>
>>> The commit message says "Let's increase the maximum size from 4k to
>>> 64k", and I have two problems with that:
>>>
>>> (4a) I have no idea where the current "4k" size comes from. (In case the
>>> 4k refers to ACPI_BUILD_ALIGN_SIZE, then why are we not changing that
>>> macro?)
>>
>> Changing ACPI_BUILD_ALIGN_SIZE would affect the legacy_table_size in
>> acpi_build() - so that can't be right.
>>
>> What would also work is something like (to be improved)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 45ad2f9533..49cfedddc8 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -81,6 +81,8 @@
>>   #define ACPI_BUILD_LEGACY_CPU_AML_SIZE    97
>>   #define ACPI_BUILD_ALIGN_SIZE             0x1000
>> +#define ACPI_BUILD_LOADER_ALIGN_SIZE      0x2000
>> +
>>   #define ACPI_BUILD_TABLE_SIZE             0x20000
>>   /* #define DEBUG_ACPI_BUILD */
>> @@ -2613,10 +2615,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>               error_printf("Try removing CPUs, NUMA nodes, memory slots"
>>                            " or PCI bridges.");
>>           }
>> -        acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
>> +        acpi_align_size(tables_blob, ACPI_BUILD_ALIGN_SIZE);
>>       }
>> -    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
>> +    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_LOADER_ALIGN_SIZE);
>>
>>
>> At least for hw/i386/acpi-build.c.
>>
>> We will end up creating the resizeable memory region/RAMBlock always with
>> a size=maximum_size=8k. (could also go for 64k here)
>>
>> The only downside is that we might expose a bigger area to the
>> guest than necessary (e.g., 8k instead of 4k) and will e.g., migrate
>> 8k instead of 4k (not that we care).
>>
>>
>> On incoming migration from older QEMU versions, we should be able to just
>> shrink back from 8k to 4k - so migration from older QEMY versions should
>> continue working just fine.
> 
> what about migration to old qemu?

We seem to have replied at just the same time. See my other mail :)

-- 
Thanks,

David / dhildenb

