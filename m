Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp125417lfp;
        Wed, 6 Oct 2021 02:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjzHPBV+0dZkxMLUhdYmkXsJc7f090qRXjbLI6kUsKnRpsm9YqiXi5wzsM5oJ/VVHH5PW6
X-Received: by 2002:a05:6e02:1808:: with SMTP id a8mr6715650ilv.196.1633514259552;
        Wed, 06 Oct 2021 02:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633514259; cv=none;
        d=google.com; s=arc-20160816;
        b=i8mPMyoRaWyQDhvJKa9C3nXQl1m8HnqhdFUq3xZvthcWLWPm6C5pKs6VRH0fqEoFNi
         5C5GpFbaV3Pa0Yqq5fZ/JRBj8sV/S5F9aCAvjxxwiPdGKhWxRPmcVBz1dGXeZjevgfV9
         tnN4L6M9qaS3T0yklsBaLV4hG5j16iUZYL3Vtw0jBsQIzbCk3/0Hk40Iz02qaBAzlsPn
         8kkGQU2dYLGcJrxw1CmLOBZq3rWMjPAfT91ZnNr1eOytjSD4t6dLqJRAXNbWqs//7U8D
         lgBmzPQNgq363ultDe9wBHK14/nLY1WdMsckYX22nBP7aIfvZKf3VOPQl4Xnq/qydnhi
         Q4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=im7iisH1JM9hcrIx/MPICO8FM1i0cmVFlkDGzzTtGys=;
        b=gMCYT2z20AMTjg0JiNOtL02jlOXSAtQyEgew+TkCdAAgZLkvXknZpNVtAJu+Epvkxp
         d2F+lSvOMPhH+inbEItOZVnngWmU7s44YpzNFffwA+H5i2QgiDnpGSaiGhvxYIWcVqf6
         rauh3HoplqBBYmPVC5NoaQZmG6wkJSRhQwQeetpo3y7jk+2qiDcq2+pqBG0ljQsfl5Mq
         OjQc9WBuNkFdvLs00atyGI3s9lFKVo9VSrq9PLDJHtw/vN6woUiOD5UrksP6O8O2064W
         uHNMoD3bMgSVMVE2mVbQN++5yP0OpR1xB5BxS260xkzOR74+ZhCybPxZRrOTP6kGgxIS
         1hOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LgOEQZcd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si22475150jaa.39.2021.10.06.02.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 02:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LgOEQZcd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY3gA-0008V1-SM
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 05:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY3fr-0008Ty-O9
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 05:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY3fo-0002cW-57
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 05:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633514233;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=im7iisH1JM9hcrIx/MPICO8FM1i0cmVFlkDGzzTtGys=;
 b=LgOEQZcdunvPExOFQusod20SVWADcvdbrEd0KtGe6r0yAX6+JyMMC2aPHKvy4uQMZkHVKS
 y7ikSqEOecVp4wtWZbQKMohCS2Q0aod0CvxTVn7x+Z3hdv4kFH/6SVKIhwx1YaoJwRn4RJ
 5NWdcDxZ450QdegwBC1nF06bot/z4gs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-bBmGRdnROaSezxQilFxwWg-1; Wed, 06 Oct 2021 05:57:11 -0400
X-MC-Unique: bBmGRdnROaSezxQilFxwWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso1576146wra.13
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 02:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=im7iisH1JM9hcrIx/MPICO8FM1i0cmVFlkDGzzTtGys=;
 b=Ad9TUq/dSl/HEWwPBRFjpl4+W9WxaO4u6koHJ8HexUp9IDEpwRfFaFSdRJxjt4SAik
 /jpk60zpo6rkPWoycZReL/Y5BhD5O395vn+PVRpIHFQ17H23TzLXmr0RSxfNpqguodFm
 HlxihoFEmegMYAgMt2jvKdBKUWCS9sEJIarXl2ghZfLiXyVwz1lso//5QG8eOVkB7Ly5
 peiodqIgjNYXWBEHsMKuhmLJlh3m6zu/XWdFzDVjPqM+pQfejo6eZmJPstxugSM8MNIO
 ZVq8xOj24aR06wAXTh7euKn0dUT7mU6tnqWM2UnpvfCVyp/T8jy+CQubR8Nz7f30LLl+
 Y08Q==
X-Gm-Message-State: AOAM530a6Jl6DPRMhg/P2WojIhgFcwrS+TiF9anANeuVbEOV/QxBiGDS
 gpr0L0dWsCQN15/IMCkyqhTbZ/otPrPfV67SZxmwtZVS06Af5M1A50i6gl2R8ppqDo70GvGvV11
 OTSdGJihkMqSz
X-Received: by 2002:a5d:648f:: with SMTP id o15mr2367378wri.3.1633514230234;
 Wed, 06 Oct 2021 02:57:10 -0700 (PDT)
X-Received: by 2002:a5d:648f:: with SMTP id o15mr2367342wri.3.1633514229984;
 Wed, 06 Oct 2021 02:57:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e11sm8513483wro.4.2021.10.06.02.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 02:57:09 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
To: Andrew Jones <drjones@redhat.com>
References: <20210927131732.63801-1-eric.auger@redhat.com>
 <20210927131732.63801-3-eric.auger@redhat.com>
 <20211006091523.qaub5xg3kxuwjmlh@gator.home>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <2b284309-1dd6-6d73-225d-f83ad4af8657@redhat.com>
Date: Wed, 6 Oct 2021 11:57:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211006091523.qaub5xg3kxuwjmlh@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, gshan@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pO9d3JK+iQN8

Hi,

On 10/6/21 11:15 AM, Andrew Jones wrote:
> On Mon, Sep 27, 2021 at 03:17:31PM +0200, Eric Auger wrote:
>> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
>> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
>>
>> The DBG2 table allows to describe one or more debug ports.
>>
>> Generate an DBG2 table featuring a single debug port, the PL011.
>>
>> The DBG2 specification can be found at
>> "Microsoft Debug Port Table 2 (DBG2)"
>> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> Took into account all comments from Igor on v2:
>> mostly style adjustment, revision references
>>
>> v1 -> v2:
>> - rebased on Igor's refactoring
>> ---
>>  hw/arm/virt-acpi-build.c | 62 +++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 61 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 6cec97352b..257d0fee17 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -616,6 +616,63 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      acpi_table_end(linker, &table);
>>  }
>>  
>> +/* Debug Port Table 2 (DBG2) */
>> +static void
>> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> nit: I didn't think QEMU liked this style, i.e. QEMU prefers
>
>  static void build_dbg2(GArray *table_data, BIOSLinker *linker,
>                         VirtMachineState *vms)
>
> Eh, I see that hw/arm/virt-acpi-build.c is full of the format you have
> here, so never mind.
>
>> +{
>> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,
> Can you explain where the .rev = 3 comes from? The spec says "For this
> version of the specification, this value is 0."
The above revision field belongs to the acpi table header. Not to be
mixed with the Revision field of the DBG2 table
which is set below (set to 0):

+    build_append_int_noprefix(table_data, 0, 1); /* Revision */

Besides that's a good question. I have rev=3 here but that must come from a copy/paste. when googling I
found

https://lists.denx.de/pipermail/u-boot/2015-June/217134.html
/header->revision = 1; /* ACPI 1.0/2.0: 1, ACPI 3.0: 2, ACPI 4.0: 3 */
Not sure if 3 is the right value though? Igor, please could you advise?
Thanks Eric /

>
>
>> +                        .oem_table_id = vms->oem_table_id };
>> +    int dbg2devicelength;
>> +    const char name[] = "COM0";
>> +    const int namespace_length = sizeof(name);
>> +
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    dbg2devicelength = 22 /* BaseAddressRegister[] offset */ +
>> +                       12 /* BaseAddressRegister[] */ +
>> +                       4 /* AddressSize[] */ +
> I'd personally prefer the '+' before the comment, but maybe Igor has a
> special ACPI code format preference here.
>
>> +                       namespace_length /* NamespaceString[] */;
>> +
>> +    /* OffsetDbgDeviceInfo */
>> +    build_append_int_noprefix(table_data, 44, 4);
>> +    /* NumberDbgDeviceInfo */
>> +    build_append_int_noprefix(table_data, 1, 4);
>> +
>> +    /* Table 2. Debug Device Information structure format */
>> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
>> +    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
>> +    /* NumberofGenericAddressRegisters */
>> +    build_append_int_noprefix(table_data, 1, 1);
>> +    /* NameSpaceStringLength */
>> +    build_append_int_noprefix(table_data, namespace_length, 2);
>> +    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
>> +    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
>> +    /* OemDataOffset (0 means no OEM data) */
>> +    build_append_int_noprefix(table_data, 0, 2);
>> +
>> +    /* Port Type */
>> +    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
>> +    /* Port Subtype */
>> +    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
>> +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
>> +    /* BaseAddressRegisterOffset */
>> +    build_append_int_noprefix(table_data, 22, 2);
>> +    /* AddressSizeOffset */
>> +    build_append_int_noprefix(table_data, 34, 2);
>> +
>> +    /* BaseAddressRegister[] */
>> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
>> +                     vms->memmap[VIRT_UART].base);
>> +
>> +    /* AddressSize[] */
>> +    build_append_int_noprefix(table_data, 0x1000 /* Register Space */, 4);
>> +
>> +    /* NamespaceString[] */
>> +    g_array_append_vals(table_data, name, namespace_length);
>> +
>> +    acpi_table_end(linker, &table);
>> +};
>> +
>>  /*
>>   * ACPI spec, Revision 5.1 Errata A
>>   * 5.2.12 Multiple APIC Description Table (MADT)
>> @@ -875,7 +932,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      dsdt = tables_blob->len;
>>      build_dsdt(tables_blob, tables->linker, vms);
>>  
>> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>  
>> @@ -898,6 +955,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_spcr(tables_blob, tables->linker, vms);
>>  
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    build_dbg2(tables_blob, tables->linker, vms);
>> +
>>      if (vms->ras) {
>>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>>          acpi_add_table(table_offsets, tables_blob);
>> -- 
>> 2.26.3
>>
> Thanks,
> drew 
>

