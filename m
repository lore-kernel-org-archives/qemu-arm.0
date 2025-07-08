Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDD8C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 22:50:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZH8c-0005ql-43; Tue, 08 Jul 2025 18:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZH7w-0004QR-Pm
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 18:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZH7q-0006vf-4h
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 18:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752014959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1F9Lf8fawOz8sRYw9HjXfqGoTCcQqHLj5VILHhRtYA=;
 b=AyUytm27YUbUkIOtxCrrH5eQOm+X+Ry/kuBSqHyr8ByO2TxsyofvXR2mSNtFGug5+LvHq1
 f3/2mQkHwcpF2HQhZrfMwTsLLin+Ex5kjgXNPMO8W03a04NTZLOQ1wzVqz8lhmZ2psaw5v
 0GIwGaeiKAR2yWQy62tZbSf4ml2Czp4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-R92mFu8eO8-zI2S_XtphCA-1; Tue, 08 Jul 2025 02:31:07 -0400
X-MC-Unique: R92mFu8eO8-zI2S_XtphCA-1
X-Mimecast-MFC-AGG-ID: R92mFu8eO8-zI2S_XtphCA_1751956266
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-453018b4ddeso19751135e9.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 23:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751956266; x=1752561066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1F9Lf8fawOz8sRYw9HjXfqGoTCcQqHLj5VILHhRtYA=;
 b=J5IqYVIu1C3HMUK33uLzfcxdqzJLUu4skazWlt5P6xbwvj4zdmPnd6vlyK3th9gT9g
 gn/HEIz3+l0q+Xs6/KpYkjHHBNgHBxvC7NZ9yJA6vrYORCxcE+9v+U1b/ZVU5WjngPLQ
 qmAZKELlGU/AwMzeDNRiXN7mC9qmA7t94+94RIpJ81NsKbKow4dIGoJj9kqO0Cp87IOl
 cRyZg+3yFtemWfqR5x/wtxpk7G/WTQx+mpBDoSoKyn5XHl97Qxj7i7iChCp9JYDGu2NS
 fEW5AAIVP/WYt1VVRUPmJ0eVsIRhHt/GbTq2Mntef7Ev41Daau9hB/E8tHLm6/GxE9Zd
 GtUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVERZcPRBcANs5fNAvChMewft5jVVkgL3FV/1eMpkeWOjHbbyC1EAhIUU8rpLHjrRqcDvh2/mAFAQ==@nongnu.org
X-Gm-Message-State: AOJu0YwzeNlpK025013JgUWAW4gEYlaKzDWlIChZ0hm0j0Q0lG25pbAs
 BOUYt054DZBLONiCy4kajBhlaz4mMSbsyQMZqwIF5ta655NlghpQq8oHrWsJDjpDnhDE763v2zW
 bKV6iOFcDCI34qIiSh/sqhNliul7nM0sg80Mxzcndq/DK1joTpAhfDQ==
X-Gm-Gg: ASbGncszMsE7PlKaByQ90Ul4sGhzE94T9NUEq51YcfHVjCZGGETTn72qrwqUp6pGZN5
 28uwpK+awG2banThxz3T6D3TNeIYDeORqlF/CrWd37myb1NBHjbXpET0gbiteuolsD8ZlNE4vWb
 Qx3cElA5+W1eyvhVYjfb803lUsIpCs7KOwPVWLr2YsuMY3udQfxiEXtiwZY0p4CSP12GxVfzP6V
 5LNl1ugwSBy1k43ymtPFuQ4sRUJdG1sSlAF+XXFvocR1yVfkcGB+nOoGxAydFBjQDKTF2n/JQGz
 8KvhLu/2Sj/cDAJUTZVkc45wlwWMPp695Fu3NAG+QIukFCeaCjxRkpkwirNC8HH2+dir8Q==
X-Received: by 2002:a05:600c:6286:b0:43c:fa24:8721 with SMTP id
 5b1f17b1804b1-454cd51869amr16578295e9.17.1751956266117; 
 Mon, 07 Jul 2025 23:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUE7MUQyaT0zWTzdkTJFL/PCReTQe1ucZbGBSeOx5Cef1hQzV0VQ7ylgmR6oQtWInTOMyxbw==
X-Received: by 2002:a05:600c:6286:b0:43c:fa24:8721 with SMTP id
 5b1f17b1804b1-454cd51869amr16577865e9.17.1751956265504; 
 Mon, 07 Jul 2025 23:31:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225985csm12199350f8f.69.2025.07.07.23.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 23:31:04 -0700 (PDT)
Message-ID: <ecaf9b4d-e60b-473f-be69-d80704484dda@redhat.com>
Date: Tue, 8 Jul 2025 08:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 36/36] qtest/bios-tables-test: Generate reference blob
 for DSDT.acpipcihp
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250703123728.414386-1-eric.auger@redhat.com>
 <20250703123728.414386-37-eric.auger@redhat.com>
 <20250703160950.000037f2@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250703160950.000037f2@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pbPAwRwLYxdO5CCx036IT0yS_NFW5Ttuwxlug2kKYGE_1751956266
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Jonathan,

On 7/3/25 5:09 PM, Jonathan Cameron wrote:
> On Thu,  3 Jul 2025 14:35:36 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> The disassembled DSDT table is given below.
> I think the aim for this one should be to highlight the blobs where it differs
> from the previous rather than having the whole thing.

makes sense. I will crop the commit message accordingly.

Thanks!

Eric
>
>
>> /*
>>  * Intel ACPI Component Architecture
>>  * AML/ASL+ Disassembler version 20210604 (64-bit version)
>>  * Copyright (c) 2000 - 2021 Intel Corporation
>>  *
>>  * Disassembling to symbolic ASL+ operators
>>  *
>>  * Disassembly of ../tests/data/acpi/aarch64/virt/DSDT.acpipcihp, Thu Jul  3 05:16:27 2025
>>  *
>>  * Original Table Header:
>>  *     Signature        "DSDT"
>>  *     Length           0x0000183A (6202)
>>  *     Revision         0x02
>>  *     Checksum         0x98
>>  *     OEM ID           "BOCHS "
>>  *     OEM Table ID     "BXPC    "
>>  *     OEM Revision     0x00000001 (1)
>>  *     Compiler ID      "BXPC"
>>  *     Compiler Version 0x00000001 (1)
>>  */
>> DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>> {
>>     Scope (\_SB)
>>     {
>>         Device (C000)
>>         {
>>             Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
>>             Name (_UID, Zero)  // _UID: Unique ID
>>         }
>>
>>         Device (COM0)
>>         {
>>             Name (_HID, "ARMH0011")  // _HID: Hardware ID
>>             Name (_UID, Zero)  // _UID: Unique ID
>>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>             {
>>                 Memory32Fixed (ReadWrite,
>>                     0x09000000,         // Address Base
>>                     0x00001000,         // Address Length
>>                     )
>>                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>>                 {
>>                     0x00000021,
>>                 }
>>             })
>>         }
>>
>>         Device (FWCF)
>>         {
>>             Name (_HID, "QEMU0002")  // _HID: Hardware ID
>>             Name (_STA, 0x0B)  // _STA: Status
>>             Name (_CCA, One)  // _CCA: Cache Coherency Attribute
>>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>             {
>>                 Memory32Fixed (ReadWrite,
>>                     0x09020000,         // Address Base
>>                     0x00000018,         // Address Length
>>                     )
>>             })
>>         }
> ...
>
>>         Device (L000)
>>         {
>>             Name (_HID, "PNP0C0F" /* PCI Interrupt Link Device */)  // _HID: Hardware ID
>>             Name (_UID, Zero)  // _UID: Unique ID
>>             Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
>>             {
>>                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>>                 {
>>                     0x00000023,
>>                 }
>>             })
>>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>             {
>>                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>>                 {
>>                     0x00000023,
>>                 }
>>             })
>>             Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
>>             {
>>             }
>>         }
> ...
>
>>         Device (PCI0)
>>         {
>>             Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
>>             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
>>             Name (_SEG, Zero)  // _SEG: PCI Segment
>>             Name (_BBN, Zero)  // _BBN: BIOS Bus Number
>>             Name (_UID, Zero)  // _UID: Unique ID
>>             Name (_STR, Unicode ("PCIe 0 Device"))  // _STR: Description String
>>             Name (_CCA, One)  // _CCA: Cache Coherency Attribute
>>             Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
>>             {
>>                 Package (0x04)
>>                 {
>>                     0xFFFF,
>>                     Zero,
>>                     L000,
>>                     Zero
>>                 },
> ...
>
>>             })
>>             Method (_CBA, 0, NotSerialized)  // _CBA: Configuration Base Address
>>             {
>>                 Return (0x0000004010000000)
>>             }
>>
>>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>             {
>>                 WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
>>                     0x0000,             // Granularity
>>                     0x0000,             // Range Minimum
>>                     0x00FF,             // Range Maximum
>>                     0x0000,             // Translation Offset
>>                     0x0100,             // Length
>>                     ,, )
>>                 DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
>>                     0x00000000,         // Granularity
>>                     0x10000000,         // Range Minimum
>>                     0x3EFEFFFF,         // Range Maximum
>>                     0x00000000,         // Translation Offset
>>                     0x2EFF0000,         // Length
>>                     ,, , AddressRangeMemory, TypeStatic)
>>                 DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
>>                     0x00000000,         // Granularity
>>                     0x00000000,         // Range Minimum
>>                     0x0000FFFF,         // Range Maximum
>>                     0x3EFF0000,         // Translation Offset
>>                     0x00010000,         // Length
>>                     ,, , TypeStatic, DenseTranslation)
>>                 QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
>>                     0x0000000000000000, // Granularity
>>                     0x0000008000000000, // Range Minimum
>>                     0x000000FFFFFFFFFF, // Range Maximum
>>                     0x0000000000000000, // Translation Offset
>>                     0x0000008000000000, // Length
>>                     ,, , AddressRangeMemory, TypeStatic)
>>             })
>>             Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
>>             {
>>                 CreateDWordField (Arg3, Zero, CDW1)
>>                 If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
>>                 {
>>                     CreateDWordField (Arg3, 0x04, CDW2)
>>                     CreateDWordField (Arg3, 0x08, CDW3)
>>                     Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>>                     Local0 &= 0x1E
> This being one of those differences.
>
>>                     If ((Arg1 != One))
>>                     {
>>                         CDW1 |= 0x08
>>                     }
>>
>>                     If ((CDW3 != Local0))
>>                     {
>>                         CDW1 |= 0x10
>>                     }
>>
>>                     CDW3 = Local0
>>                 }
>>                 Else
>>                 {
>>                     CDW1 |= 0x04
>>                 }
>>
>>                 Return (Arg3)
>>             }
>>
>>             Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>>             {
>>                 If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>>                 {
>>                     If ((Arg2 == Zero))
>>                     {
>>                         Return (Buffer (One)
>>                         {
>>                              0x01                                             // .
>>                         })
>>                     }
>>                 }
>>
>>                 Return (Buffer (One)
>>                 {
>>                      0x00                                             // .
>>                 })
>>             }
>>
>>             Device (RES0)
>>             {
>>                 Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID
>>                 Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>                 {
>>                     QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
>>                         0x0000000000000000, // Granularity
>>                         0x0000004010000000, // Range Minimum
>>                         0x000000401FFFFFFF, // Range Maximum
>>                         0x0000000000000000, // Translation Offset
>>                         0x0000000010000000, // Length
>>                         ,, , AddressRangeMemory, TypeStatic)
>>                 })
>>             }
>>         }
>>
>>         Device (\_SB.GED)
>>         {
>>             Name (_HID, "ACPI0013" /* Generic Event Device */)  // _HID: Hardware ID
>>             Name (_UID, "GED")  // _UID: Unique ID
>>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>             {
>>                 Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
>>                 {
>>                     0x00000029,
>>                 }
>>             })
>>             OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
>>             Field (EREG, DWordAcc, NoLock, WriteAsZeros)
>>             {
>>                 ESEL,   32
>>             }
>>
>>             Method (_EVT, 1, Serialized)  // _EVT: Event
>>             {
>>                 Local0 = ESEL /* \_SB_.GED_.ESEL */
>>                 If (((Local0 & 0x02) == 0x02))
>>                 {
>>                     Notify (PWRB, 0x80) // Status Change
>>                 }
>>
>>                 If (((Local0 & 0x10) == 0x10))
> And this being another.
>
>>                 {
>>                     Acquire (\_SB.PCI0.BLCK, 0xFFFF)
>>                     \_SB.PCI0.PCNT ()
>>                     Release (\_SB.PCI0.BLCK)
>>                 }
>>             }
>>         }
>>
>>         Device (PWRB)
>>         {
>>             Name (_HID, "PNP0C0C" /* Power Button Device */)  // _HID: Hardware ID
>>             Name (_UID, Zero)  // _UID: Unique ID
>>         }
>>     }
>>
>>     Scope (_SB.PCI0)
> And all this.
>
>>     {
>>         OperationRegion (PCST, SystemMemory, 0x090C0000, 0x08)
>>         Field (PCST, DWordAcc, NoLock, WriteAsZeros)
>>         {
>>             PCIU,   32,
>>             PCID,   32
>>         }
>>
>>         OperationRegion (SEJ, SystemMemory, 0x090C0008, 0x04)
>>         Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
>>         {
>>             B0EJ,   32
>>         }
>>
>>         OperationRegion (BNMR, SystemMemory, 0x090C0010, 0x08)
>>         Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
>>         {
>>             BNUM,   32,
>>             PIDX,   32
>>         }
>>
>>         Mutex (BLCK, 0x00)
>>         Method (PCEJ, 2, NotSerialized)
>>         {
>>             Acquire (BLCK, 0xFFFF)
>>             BNUM = Arg0
>>             B0EJ = (One << Arg1)
>>             Release (BLCK)
>>             Return (Zero)
>>         }
>>
>>         Method (AIDX, 2, NotSerialized)
>>         {
>>             Acquire (BLCK, 0xFFFF)
>>             BNUM = Arg0
>>             PIDX = (One << Arg1)
>>             Local0 = PIDX /* \_SB_.PCI0.PIDX */
>>             Release (BLCK)
>>             Return (Local0)
>>         }
>>
>>         Method (PDSM, 5, Serialized)
>>         {
>>             If ((Arg2 == Zero))
>>             {
>>                 Local0 = Buffer (One)
>>                     {
>>                          0x00                                             // .
>>                     }
>>                 If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>>                 {
>>                     Return (Local0)
>>                 }
>>
>>                 If ((Arg1 < 0x02))
>>                 {
>>                     Return (Local0)
>>                 }
>>
>>                 Local1 = Zero
>>                 Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
>>                     ))
>>                 If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
>>                 {
>>                     Local1 |= One
>>                     Local1 |= (One << 0x07)
>>                 }
>>
>>                 Local0 [Zero] = Local1
>>                 Return (Local0)
>>             }
>>
>>             If ((Arg2 == 0x07))
>>             {
>>                 Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
>>                     ))
>>                 Local0 = Package (0x02) {}
>>                 If (!((Local2 == Zero) || (Local2 == 0xFFFFFFFF)))
>>                 {
>>                     Local0 [Zero] = Local2
>>                     Local0 [One] = ""
>>                 }
>>
>>                 Return (Local0)
>>             }
>>         }
>>     }
>>
>>     Scope (\_SB.PCI0)
>>     {
>>         Method (EDSM, 5, Serialized)
>>         {
>>             If ((Arg2 == Zero))
>>             {
>>                 Local0 = Buffer (One)
>>                     {
>>                          0x00                                             // .
>>                     }
>>                 If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>>                 {
>>                     Return (Local0)
>>                 }
>>
>>                 If ((Arg1 < 0x02))
>>                 {
>>                     Return (Local0)
>>                 }
>>
>>                 Local0 [Zero] = 0x81
>>                 Return (Local0)
>>             }
>>
>>             If ((Arg2 == 0x07))
>>             {
>>                 Local0 = Package (0x02)
>>                     {
>>                         Zero,
>>                         ""
>>                     }
>>                 Local1 = DerefOf (Arg4 [Zero])
>>                 Local0 [Zero] = Local1
>>                 Return (Local0)
>>             }
>>         }
>>
>>         Device (S00)
>>         {
>>             Name (_ADR, Zero)  // _ADR: Address
>>         }
>>
>>         Device (S08)
>>         {
>>             Name (_ADR, 0x00010000)  // _ADR: Address
>>         }
>>
>>         Device (S38)
>>         {
>>             Name (_ADR, 0x00070000)  // _ADR: Address
>>             Device (S00)
>>             {
>>                 Name (_ADR, Zero)  // _ADR: Address
>>             }
>>
>>             Name (BSEL, One)
>>             Scope (S00)
>>             {
>>                 Name (ASUN, Zero)
> All this stuff as well.
>
>>                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>>                 {
>>                     Local0 = Package (0x02)
>>                         {
>>                             Zero,
>>                             Zero
>>                         }
>>                     Local0 [Zero] = BSEL /* \_SB_.PCI0.S38_.BSEL */
>>                     Local0 [One] = ASUN /* \_SB_.PCI0.S38_.S00_.ASUN */
>>                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
>>                 }
>>
>>                 Name (_SUN, Zero)  // _SUN: Slot User Number
>>                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
>>                 {
>>                     PCEJ (BSEL, _SUN)
>>                 }
>>             }
>>
>>             Method (DVNT, 2, NotSerialized)
>>             {
>>                 If ((Arg0 & One))
>>                 {
>>                     Notify (S00, Arg1)
>>                 }
>>             }
>>         }
>>
>>         Name (BSEL, Zero)
>>         Scope (S00)
>>         {
>>             Name (ASUN, Zero)
>>             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>>             {
>>                 Local0 = Package (0x02)
>>                     {
>>                         Zero,
>>                         Zero
>>                     }
>>                 Local0 [Zero] = BSEL /* \_SB_.PCI0.BSEL */
>>                 Local0 [One] = ASUN /* \_SB_.PCI0.S00_.ASUN */
>>                 Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
>>             }
>>
>>             Name (_SUN, Zero)  // _SUN: Slot User Number
>>             Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
>>             {
>>                 PCEJ (BSEL, _SUN)
>>             }
>>         }
>>
>>         Scope (S08)
>>         {
>>             Name (ASUN, One)
>>             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>>             {
>>                 Local0 = Package (0x02)
>>                     {
>>                         Zero,
>>                         Zero
>>                     }
>>                 Local0 [Zero] = BSEL /* \_SB_.PCI0.BSEL */
>>                 Local0 [One] = ASUN /* \_SB_.PCI0.S08_.ASUN */
>>                 Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
>>             }
>>
>>             Name (_SUN, One)  // _SUN: Slot User Number
>>             Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
>>             {
>>                 PCEJ (BSEL, _SUN)
>>             }
>>         }
>>
>>         Method (DVNT, 2, NotSerialized)
>>         {
>>             If ((Arg0 & One))
>>             {
>>                 Notify (S00, Arg1)
>>             }
>>
>>             If ((Arg0 & 0x02))
>>             {
>>                 Notify (S08, Arg1)
>>             }
>>         }
>>
>>         Device (PHPR)
>>         {
>>             Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
>>             Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
>>             Name (_STA, 0x0B)  // _STA: Status
>>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>             {
>>                 IO (Decode16,
>>                     0x0000,             // Range Minimum
>>                     0x0000,             // Range Maximum
>>                     0x01,               // Alignment
>>                     0x18,               // Length
>>                     )
>>             })
>>         }
>>
>>         Scope (S38)
>>         {
>>             Method (PCNT, 0, NotSerialized)
>>             {
>>                 BNUM = One
>>                 DVNT (PCIU, One)
>>                 DVNT (PCID, 0x03)
>>             }
>>         }
>>
>>         Method (PCNT, 0, NotSerialized)
>>         {
>>             BNUM = Zero
>>             DVNT (PCIU, One)
>>             DVNT (PCID, 0x03)
>>             ^S38.PCNT ()
>>         }
>>     }
>> }
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Looks plausible so unless Igor or Michael aren't keen on it, please crop to
> highlight the bits that need focus.  With that.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
>> ---
>>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>>  tests/data/acpi/aarch64/virt/DSDT.acpipcihp | Bin 0 -> 6202 bytes
>>  2 files changed, 1 deletion(-)
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dc3ab24d05..dfb8523c8b 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,2 +1 @@
>>  /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..8d55a877a40cb4c4dffdc70378204e12d2261a75 100644
>> GIT binary patch
>> literal 6202
>> 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
>> R?PfR*|6}}@w~&H!{sU733QPb1
>>
>> literal 0
>> HcmV?d00001
>>


