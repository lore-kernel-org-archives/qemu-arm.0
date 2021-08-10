Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1264735lff;
        Tue, 10 Aug 2021 05:17:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEWTiJyx7XC4PVo+G9K+clLDAu4ZcFJVkGbeweMkNQf1JDHzqOVbpkrUh/YYOTBUtTECDs
X-Received: by 2002:a67:fad2:: with SMTP id g18mr21036367vsq.45.1628597846796;
        Tue, 10 Aug 2021 05:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628597846; cv=none;
        d=google.com; s=arc-20160816;
        b=pXh4bZsxUBbKEfotSw23RprDhDjkVIbi71j/45hAZ8/iuCh70st5K5UUvMLsRmUFrJ
         611kOuJjVUShrp+ZnhiLrGGZnkLN9EnLb6LloreyVk93P5HKusrCT0uy6y7Q1wXLplPl
         aAln/tfLtaxRElQrJzqQN2OXDPVvw4PDqoyxha0gYg29M+VdHR6TrmmAGRd82h+dEBAb
         z0afpQqNdcN3xDrEAuuasEP+rAAHzK1DAf4MO8SvUuJryuJEeXqzBeqPRb0lliIY7HL0
         Oo3K8trim34XBlvcRTGoF6pxcvjCKwi+DY6Q6aaPab1ZCV8LFws8lcQXkVXAGm11tzuc
         YM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5eUVScTEz9ZK/6isI/qnt3P8fvwTUIu27HXIQW9V5sw=;
        b=kCHiptilNFJWJ8LomQTp97SnmmbDVQXxLJGRuIEZRedT7D4rwuqGHb7KQKBG45kGT+
         V0ovVC9HwVBElwd3iCbK3lmXzSIueO3TwZIsTOQkW2wDHh3taOYea0d9d+Dntds77c1V
         Dw1o40OJeInSd7rcK8rMlZ9FFOGz08L92MNqCYrIPAArNz+hoXXue+b77vDy4MqkciPw
         ID0swD4It5roShHGfhnV0GCYoijdldPg8cj060Z809X8bdlQyHWUYNZ556C0Wbdoz1DL
         3OqwZ/tQReIAgsI4mZI0s2su733pX2RLh+JR3hfXojvsLvTJp17gl+I9bXJM0o0p75zC
         XLhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y1cOqwm5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s140si9029741vss.429.2021.08.10.05.17.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 05:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y1cOqwm5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDQhC-0003px-02
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 08:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDQgy-0003nh-AE
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 08:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDQgq-00078U-II
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 08:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628597822;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eUVScTEz9ZK/6isI/qnt3P8fvwTUIu27HXIQW9V5sw=;
 b=Y1cOqwm5H2CtV2OCHUYIC99jtrijAlpxaFW/r6q4Zp7XW0zw1gg9zFmbZEuE26eOJI7Gab
 ByTUizRZzdjdbBB/4htNm8d4t+NUTSj1bvxdX3r5gcaC3P4OYm0tWhyc66hRt47mCAKo0e
 ne05xBg/LItmCkOkvyyip3NVQTuS0R4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-THoBg_zXN8CYM_wX-U0U_A-1; Tue, 10 Aug 2021 08:17:01 -0400
X-MC-Unique: THoBg_zXN8CYM_wX-U0U_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 q188-20020a1ca7c50000b0290241f054d92aso4834629wme.5
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 05:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=5eUVScTEz9ZK/6isI/qnt3P8fvwTUIu27HXIQW9V5sw=;
 b=WaNxz3xw7/lhdpq98wVh6BTwRFpCPqa7Rg4Nki2/2dX85aiLP8dOAyMXlmc9J+deL/
 aYhar5O0MhmCgxodcR97PQmhsWyIpIgDd0O611ymQpzIgRB8RR5s1CaEXnkEPVgVpK0M
 JnRPgJSgwshT0chqCzZyl2znFxz9J/UwOFdaxVkW6ZwLaENvyHBxdxM+moSNmHyxKn8/
 wZD6ZuvjGn3Rmci+VrV8SDRrDhjGa0WuA4/YLc1ZUXxuvCcIKIC0zAEbh2I47nViMgs1
 LZmrnWSj1nweMistNE5JDfHwnRP5v5n407FP6SCslnMZFBhDz33yScFzDYUQKLMO/yiB
 mBIw==
X-Gm-Message-State: AOAM530kHtL7qh3JAl+FmXp8JOa3wo80VhzMMFsFhYKmDEs77PZLLFUV
 sa5FpgO2whjyvnPGoxltuLoYOq7stb3F75OjSgSu6wAZo0IuyifR+THMaTjT2R7m3CetlBNfNtT
 DgHs/XZTLKNUk
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr22419934wmq.32.1628597820561; 
 Tue, 10 Aug 2021 05:17:00 -0700 (PDT)
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr22419888wmq.32.1628597820183; 
 Tue, 10 Aug 2021 05:17:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id h16sm23424556wre.52.2021.08.10.05.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 05:16:59 -0700 (PDT)
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
To: Andrew Jones <drjones@redhat.com>
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
 <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
 <20210810115511.oq2wcjgniy7mitto@gator.home>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f736d1fd-53ea-e34e-6bc1-37e39e0a59cd@redhat.com>
Date: Tue, 10 Aug 2021 14:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210810115511.oq2wcjgniy7mitto@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.704, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>, gshan@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Masters <jcm@redhat.com>,
 qemu-devel@nongnu.org, Al Stone <ahs3@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIJLlP0BIn6Z

Hi Drew,

On 8/10/21 1:55 PM, Andrew Jones wrote:
> On Tue, Aug 10, 2021 at 12:25:07PM +0200, Eric Auger wrote:
>> Hello Ard,
>> On 8/10/21 11:36 AM, Ard Biesheuvel wrote:
>>> On Tue, 10 Aug 2021 at 10:31, Eric Auger <eric.auger@redhat.com> wrote:
>>>> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
>>>> this latter allows to describe one or more debug ports.
>>>>
>>>> Generate an DBG2 table featuring a single debug port, the PL011.
>>>>
>>>> The DBG2 specification can be found at:
>>>> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
>>>>
>>> Have the legal issues around this table been resolved in the mean
>>> time?
>> I don't know exactly what they are. Adding Al and Jon in the loop they
>> have more information about this.
>> How did you resolve the issue for EDK2
>> (DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c)?
>>>  Also, any clue why this table is mandatory to begin with? The
>>> SBBR has been very trigger happy lately with making things mandatory
>>> that aren't truly required from a functional perspective.
>> It seems there are kernel FW test suites that check all mandated tables
>> are available and they currently fail for ARM virt.
>> Indeed from a function pov, I don't know much about its usage on ARM.
> There's also a bug with getting console output on tty0 with graphical VMs
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1661288
>
> Discussion that includes DBG2 as a possible solution starts around comment
> 47. I just skimmed the BZ again though and there doesn't appear to be a
> clear consensus that DBG2 is the solution.

Yes I read that thread as well. Seems DBG2 would not fix the issue
related to the BZ. DBG2 contains less info than SPCR, it misses
interrupt specification, baud rates, etc, I guess it cannot be used
standalone to specify the serial console...
It seems the SPCR is currently interpreted by Linux as the definition of
the primary console to be used and if it is generated it superses tty0.
So I understood a workaround could be to generate it only if no
graphical device is setup or change the kernel, which was attempted by
Alper, without success yet (comment #65). Also SPCR is said mandatory by
SBBR.

Thanks

Eric
>
> Thanks,
> drew
>
>> Maybe the SBBR spec should not flag the DBG2 as mandatory and test
>> suites shall be updated. I think this should be clarified at ARM then,
>> all the more so if there are legal issues as its spec is owned by Microsoft?
>>
>> Thanks
>>
>> Eric
>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> Tested by comparing the content with the table generated
>>>> by EDK2 along with the SBSA-REF machine (code generated by
>>>> DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).
>>>>
>>>> I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
>>>> bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
>>>> dword access. Also the name exposed by acpica tools is different:
>>>> 'COM0' in my case where '\_SB.COM0' in SBSA-REF case?
>>>> ---
>>>>  hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++++-
>>>>  include/hw/acpi/acpi-defs.h | 50 ++++++++++++++++++++++++
>>>>  2 files changed, 126 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 037cc1fd82..35f27b41df 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -563,6 +563,78 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>                   vms->oem_table_id);
>>>>  }
>>>>
>>>> +#define ACPI_DBG2_PL011_UART_LENGTH 0x1000
>>>> +
>>>> +/* DBG2 */
>>>> +static void
>>>> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>> +{
>>>> +    int addr_offset, addrsize_offset, namespace_offset, namespace_length;
>>>> +    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
>>>> +    struct AcpiGenericAddress *base_address;
>>>> +    int dbg2_start = table_data->len;
>>>> +    AcpiDbg2Device *dbg2dev;
>>>> +    char name[] = "COM0";
>>>> +    AcpiDbg2Table *dbg2;
>>>> +    uint32_t *addr_size;
>>>> +    uint8_t *namespace;
>>>> +
>>>> +    dbg2 = acpi_data_push(table_data, sizeof *dbg2);
>>>> +    dbg2->info_offset = sizeof *dbg2;
>>>> +    dbg2->info_count = 1;
>>>> +
>>>> +    /* debug device info structure */
>>>> +
>>>> +    dbg2dev = acpi_data_push(table_data, sizeof(AcpiDbg2Device));
>>>> +
>>>> +    dbg2dev->revision = 0;
>>>> +    namespace_length = sizeof name;
>>>> +    dbg2dev->length = sizeof *dbg2dev + sizeof(struct AcpiGenericAddress) +
>>>> +                      4 + namespace_length;
>>>> +    dbg2dev->register_count = 1;
>>>> +
>>>> +    addr_offset = sizeof *dbg2dev;
>>>> +    addrsize_offset = addr_offset + sizeof(struct AcpiGenericAddress);
>>>> +    namespace_offset = addrsize_offset + 4;
>>>> +
>>>> +    dbg2dev->namepath_length = cpu_to_le16(namespace_length);
>>>> +    dbg2dev->namepath_offset = cpu_to_le16(namespace_offset);
>>>> +    dbg2dev->oem_data_length = cpu_to_le16(0);
>>>> +    dbg2dev->oem_data_offset = cpu_to_le16(0); /* No OEM data is present */
>>>> +    dbg2dev->port_type = cpu_to_le16(ACPI_DBG2_SERIAL_PORT);
>>>> +    dbg2dev->port_subtype = cpu_to_le16(ACPI_DBG2_ARM_PL011);
>>>> +
>>>> +    dbg2dev->base_address_offset = cpu_to_le16(addr_offset);
>>>> +    dbg2dev->address_size_offset = cpu_to_le16(addrsize_offset);
>>>> +
>>>> +    /*
>>>> +     * variable length content:
>>>> +     * BaseAddressRegister[1]
>>>> +     * AddressSize[1]
>>>> +     * NamespaceString[1]
>>>> +     */
>>>> +
>>>> +    base_address = acpi_data_push(table_data,
>>>> +                                  sizeof(struct AcpiGenericAddress));
>>>> +
>>>> +    base_address->space_id = AML_SYSTEM_MEMORY;
>>>> +    base_address->bit_width = 8;
>>>> +    base_address->bit_offset = 0;
>>>> +    base_address->access_width = 1;
>>>> +    base_address->address = cpu_to_le64(uart_memmap->base);
>>>> +
>>>> +    addr_size = acpi_data_push(table_data, sizeof *addr_size);
>>>> +    *addr_size = cpu_to_le32(ACPI_DBG2_PL011_UART_LENGTH);
>>>> +
>>>> +    namespace = acpi_data_push(table_data, namespace_length);
>>>> +    memcpy(namespace, name, namespace_length);
>>>> +
>>>> +    build_header(linker, table_data,
>>>> +                 (void *)(table_data->data + dbg2_start), "DBG2",
>>>> +                 table_data->len - dbg2_start, 3, vms->oem_id,
>>>> +                 vms->oem_table_id);
>>>> +}
>>>> +
>>>>  /* MADT */
>>>>  static void
>>>>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>> @@ -790,7 +862,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>>      dsdt = tables_blob->len;
>>>>      build_dsdt(tables_blob, tables->linker, vms);
>>>>
>>>> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>>>> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>>>>      acpi_add_table(table_offsets, tables_blob);
>>>>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>>>
>>>> @@ -813,6 +885,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>>      acpi_add_table(table_offsets, tables_blob);
>>>>      build_spcr(tables_blob, tables->linker, vms);
>>>>
>>>> +    acpi_add_table(table_offsets, tables_blob);
>>>> +    build_dbg2(tables_blob, tables->linker, vms);
>>>> +
>>>>      if (vms->ras) {
>>>>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>>>>          acpi_add_table(table_offsets, tables_blob);
>>>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>>>> index cf9f44299c..bdb2ebed2c 100644
>>>> --- a/include/hw/acpi/acpi-defs.h
>>>> +++ b/include/hw/acpi/acpi-defs.h
>>>> @@ -618,4 +618,54 @@ struct AcpiIortRC {
>>>>  } QEMU_PACKED;
>>>>  typedef struct AcpiIortRC AcpiIortRC;
>>>>
>>>> +/* DBG2 */
>>>> +
>>>> +/* Types for port_type field above */
>>>> +
>>>> +#define ACPI_DBG2_SERIAL_PORT       0x8000
>>>> +#define ACPI_DBG2_1394_PORT         0x8001
>>>> +#define ACPI_DBG2_USB_PORT          0x8002
>>>> +#define ACPI_DBG2_NET_PORT          0x8003
>>>> +
>>>> +/* Subtypes for port_subtype field above */
>>>> +
>>>> +#define ACPI_DBG2_16550_COMPATIBLE  0x0000
>>>> +#define ACPI_DBG2_16550_SUBSET      0x0001
>>>> +#define ACPI_DBG2_ARM_PL011         0x0003
>>>> +#define ACPI_DBG2_ARM_SBSA_32BIT    0x000D
>>>> +#define ACPI_DBG2_ARM_SBSA_GENERIC  0x000E
>>>> +#define ACPI_DBG2_ARM_DCC           0x000F
>>>> +#define ACPI_DBG2_BCM2835           0x0010
>>>> +
>>>> +#define ACPI_DBG2_1394_STANDARD     0x0000
>>>> +
>>>> +#define ACPI_DBG2_USB_XHCI          0x0000
>>>> +#define ACPI_DBG2_USB_EHCI          0x0001
>>>> +
>>>> +/* Debug Device Information Subtable */
>>>> +
>>>> +struct AcpiDbg2Device {
>>>> +    uint8_t  revision;
>>>> +    uint16_t length;
>>>> +    uint8_t  register_count; /* Number of base_address registers */
>>>> +    uint16_t namepath_length;
>>>> +    uint16_t namepath_offset;
>>>> +    uint16_t oem_data_length;
>>>> +    uint16_t oem_data_offset;
>>>> +    uint16_t port_type;
>>>> +    uint16_t port_subtype;
>>>> +    uint8_t  reserved[2];
>>>> +    uint16_t base_address_offset;
>>>> +    uint16_t address_size_offset;
>>>> +}  QEMU_PACKED;
>>>> +typedef struct AcpiDbg2Device AcpiDbg2Device;
>>>> +
>>>> +struct AcpiDbg2Table {
>>>> +    ACPI_TABLE_HEADER_DEF /* ACPI common table header */
>>>> +    uint32_t info_offset; /* offset to the first debug struct */
>>>> +    uint32_t info_count;  /* number of debug device info struct entries */
>>>> +    uint8_t  dbg2_device_info[];
>>>> +} QEMU_PACKED;
>>>> +typedef struct AcpiDbg2Table AcpiDbg2Table;
>>>> +
>>>>  #endif
>>>> --
>>>> 2.26.3
>>>>

