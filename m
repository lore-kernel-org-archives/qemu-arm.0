Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4216278njc;
        Mon, 26 May 2025 06:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+AKCVTqsY3gNYFFqmsigwXPKyr1/c9nP+6aiiuorPiQzM4O5S3PPyRMgB1YP2nJ1VIvbV+VfOn+DB9w==@linaro.org
X-Received: by 2002:a05:6102:4b01:b0:4db:154b:cb3b with SMTP id ada2fe7eead31-4e424065855mr8091826137.3.1748267542451;
        Mon, 26 May 2025 06:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748267542; cv=none;
        d=google.com; s=arc-20240605;
        b=CgVB4w/FlvHaDi/+VjtHOqqIewtuCGsAeWzxMYwONbzM12zU5wUV7tmgZ727EyTT2H
         5hJ0vnOvI9g8vwLBokh83x7ch0FUrDsXkHELMc17Un9iIMAEtPVFpikCKbY++fW5XRK5
         CcBEhpez7YTsE1FXzn9iCdFgaastMZMKHm4wyRWVYC2YK4W4qtUvKaIbBpx71AmODTve
         KC++CGDLhGJ7nZ4o55qucb3DE4THfmiIkmIKCS5euRmW79yV++pcy8yJ9DgDEnxpu4YC
         DE9E3FcUEnxjA0yY06Ce5jfw2TdsOaMw0allfySoWoyC6dqwIvLpvF+2vK2dkBOv4a6B
         q5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tvYr9isK5TGICpDGzSUfitaCoF6wE0rY08Ts6Lkwo/M=;
        fh=w1H7iVnD3oLRp+0awSoNdcVv/TcnMtwpeQc1BrhSG+0=;
        b=KS/ManugT9ddvrVMGR245DlgeeH9D1UO+X9Ta3gLNW0U24Pt4ZPa0Y/nHKwjlLfS7m
         BcV3hmXpb+m42t9F8Hp8shNBm+wVkjVGoFZ/o6NHydC5uYkdndVY2N7OdznTIf93zUD5
         MtUypChlopCPjgqcOKkXFEkqIehfBG0sdE2NFGIbhGAAVYr0a9gF/eeOIs0ERvlchaqn
         KOwDn5/NE+ceNRGdqOtc/Kwlvvnz+dQDu4CObWNrNhz1XpdSVM5mSc902uCmoGXVQc3b
         VQu7AIMO3cThTTK2VgLSTUtrpgExsFp9kgNt9tyU4+oQzB2My/nmAuwMggCvSLrVE4Wr
         8xCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U2JGwwH1;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id ada2fe7eead31-4e57713c225sor23755137.6.2025.05.26.06.52.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 May 2025 06:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U2JGwwH1;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748267542; x=1748872342; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvYr9isK5TGICpDGzSUfitaCoF6wE0rY08Ts6Lkwo/M=;
        b=U2JGwwH1qyikvVWFt5rr7Kpxkwf7fPlz2P1sFiwmGAUZ0MtLW/VzKinrgFDroH3+dw
         MrAlyWi9TrN7ePCtQsnTKzmfzrDErZuBFvqLLBhzdj0Zi4OroQtbegLF1XD4AhDrh/pj
         EvapxZO6+UkRcpUvUR3xnl7EatHd5sztl4UzmsS4X7JtJoBIdvITWXUoyPOuReuT7fTC
         QgEI5YID66BZXYc/lNPLHqQraTrJorVOdPqtwBfG3+ble8WDzGi3QXHtMS4Oxqz3RNzQ
         mt2V1bcB3/vLmYR5k7ldR8eQsGx8Ri+MeCLsZdQ6rskx0Jpsy5RjNHDOGzShYS9e7uOd
         c0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748267542; x=1748872342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvYr9isK5TGICpDGzSUfitaCoF6wE0rY08Ts6Lkwo/M=;
        b=pyR4dXgrmr+zsRaXwnRwny1veExNoFM9U6mKmiUOG7GclxlMVRtQoVdp+GOxHyf+5D
         dqLC2YPQAYXoQQsud+5eXTtrAKZp2mtJNHIlhks7w78B9I6SMudupcTq7i0jDFEMKTzw
         NN23BwaYgVP/deL0HodSdFGc6WLyELjx8mWgrC03VU8VOEFlm8wIrA7GGW2RnvccO2re
         Fpsje/hPmbHkTdN6m2WEzrI7a4w+exZz8S2pUqaFmjX/7ez9cIvMS+CVkoGyCnvfXHCG
         ixhdn8lpPU1jswqadticzyuQuzaqhOknc8SfJ/0T9fBztwo2yUcX7v0Jc8T4P3klKd5V
         EsqA==
X-Forwarded-Encrypted: i=1; AJvYcCVK6yNVywi3Hxm07XOOtT2yaQDl+FxBi8MWU8+uJw6vwpLlxojm0rhABo2U51Z1o0QAgOxpRbNhdBLbFw==@linaro.org
X-Gm-Message-State: AOJu0YyD1xUlDZzavRokTyJA6nNZY6UCmpAQwweWpvMhhwp3ytvv46Ps
	tP2UPgDjhICyqIWrQ4U3xsdlT8IOrsiZjAQLhYnmqhurooiqttxftGZ6TVj+PlisVaCboQ==
X-Gm-Gg: ASbGncsVM5qORb6ZwN9KIjhoyqqlEltLKp+BtTh4CQXWleEvFjOkb4Emtljk/tYmEms
	sNjoZBd6Vm66xQ+mAhWmr95ht8INwA457GtfdXQXJSJrApKz833BKevk2L1Sh5GgEHk9/YoG5xZ
	C5nPUWy6TolwkqyX1hNI5acewWaHqEg+5K+zqeACDc9yDj0oNYUYrIJ+w5VeAEpxPSijIlyHGun
	bY6braxRd1Iuhopky/W7YJ0zv9JlFsrhhxo3weWrJ/EZlrMUdwi8c1aZmvuY/GLu9iV4g7s1mJb
	7+xOCTk9HFgXw/XZrtlDwz8tOsbWWD/Cawul4aMS9r0ZWvt85O9NufEMCaeZEoQ8VHrodaaYbn5
	Bhsv9QV/SEhVY+Q3GmUgsE2GT0dfD2g==
X-Google-Smtp-Source: AGHT+IGgNKBphVthnl/DZ171FGUYQWAdqCW0CDGzMO4ipaMzsWiyuacbgHKgKHA0aAxVDqq3l5tA8Q==
X-Received: by 2002:a05:6102:32c7:b0:4dc:81b7:f031 with SMTP id ada2fe7eead31-4e423ea7f29mr7545250137.0.1748267541894;
        Mon, 26 May 2025 06:52:21 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:d081:510e:25da:56a5? ([2804:7f0:b402:6ba2:d081:510e:25da:56a5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87dee1c2af6sm3500319241.19.2025.05.26.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:52:21 -0700 (PDT)
Message-ID: <f310d7e1-6a18-41b4-a2f0-73f961aa63f4@linaro.org>
Date: Mon, 26 May 2025 10:51:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tests/qtest/bios-tables-test: Update changed ACPI
 blobs
To: eric.auger@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
 <20250526053123.1434204-4-gustavo.romero@linaro.org>
 <fb728394-74f4-415d-9cb6-967526a86147@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <fb728394-74f4-415d-9cb6-967526a86147@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ry1+MsZp0p3f

Hi Eric,

On 5/26/25 07:25, Eric Auger wrote:
> Hi Gustavo,
> 
> On 5/26/25 7:31 AM, Gustavo Romero wrote:
>> Update the aarch64 'virt' base blob and all of its variants. All of them
>> have the same diff, so only one is shown below. The essential changes is
>> in the AML code of the _OSC (OS Capabilities) method, (variable name
>> from 'CTRL' to 'Local0') and the scope for GED device.
> 
> Maybe we shall split the update into 2 steps

Yes, I think so.


> 1) introduce/validate the changes related to _OSC first

Yep, if I'm following you correctly :) When you say "introduce/validade
the changes related to _OSC first" you mean putting your series [0] (all patches or
at least patch 08/22 "hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method")
before this patch, 3/5, and after 1/5? If that's it, yip, I think that would
be the right thing to do.


> 2) produce the DSDT ref code with ACPI PCIHP hotplug elements

Yep, but you mean "with ACPI PCIHP hotplug elements" when acpi-pcihp=off, right?
Which is equivalent to put this patch, which contains the DSDT ref code with
ACPI PCI hotplug in place and with acpi-pcihp=off, after your changes in _OSC.


> What do you think?

Yeah, feel free to pick patches 1-3 from this series and apply accordingly to your
series. Patch 1/5 would be right before the change in _OSC in your series, i.e. before
patch 8/22, and patches 2/5 and 3/5 right after patch 8/22. Is this what you meant?

It seems there is also an inoffensive change in the scope of the GED, but I'm not
sure where it's coming from, maybe it comes from yet another patch, not from 8/22,
that also must be included between 1/5 and 2-3/5?

An alternative, which I think is less ideal, have 1/3 before your series and 2/5 and 3/5
at the end of your whole series. But I prefer them "sandwiching" the 8/22 patch and the
patches that exclusively touch the DSDT table, instead.

Then patches 4-5/5 in this series would come a separate series, after everything else,
and so can be merged separate.


Cheers,
Gustavo

[0] https://lists.nongnu.org/archive/html/qemu-devel/2025-05/msg03487.html

> Eruc
> 
>>
>> DSDT table diff:
>>
>>   DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>>   {
>>       Scope (\_SB)
>>       {
>>           Device (C000)
>>           {
>>               Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
>>               Name (_UID, Zero)  // _UID: Unique ID
>>           }
>>
>> @@ -1794,53 +1794,52 @@
>>                       0x0000000000000000, // Granularity
>>                       0x0000008000000000, // Range Minimum
>>                       0x000000FFFFFFFFFF, // Range Maximum
>>                       0x0000000000000000, // Translation Offset
>>                       0x0000008000000000, // Length
>>                       ,, , AddressRangeMemory, TypeStatic)
>>               })
>>               Name (SUPP, Zero)
>>               Name (CTRL, Zero)
>>               Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
>>               {
>>                   CreateDWordField (Arg3, Zero, CDW1)
>>                   If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
>>                   {
>>                       CreateDWordField (Arg3, 0x04, CDW2)
>>                       CreateDWordField (Arg3, 0x08, CDW3)
>> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
>> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> -                    CTRL &= 0x1F
>> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> +                    Local0 &= 0x1F
>>                       If ((Arg1 != One))
>>                       {
>>                           CDW1 |= 0x08
>>                       }
>>
>> -                    If ((CDW3 != CTRL))
>> +                    If ((CDW3 != Local0))
>>                       {
>>                           CDW1 |= 0x10
>>                       }
>>
>> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
>> -                    Return (Arg3)
>> +                    CDW3 = Local0
>>                   }
>>                   Else
>>                   {
>>                       CDW1 |= 0x04
>> -                    Return (Arg3)
>>                   }
>> +
>> +                Return (Arg3)
>>               }
>>
>>               Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>>               {
>>                   If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>>                   {
>>                       If ((Arg2 == Zero))
>>                       {
>>                           Return (Buffer (One)
>>                           {
>>                                0x01                                             // .
>>                           })
>>                       }
>>                   }
>>
>>                   Return (Buffer (One)
>> @@ -1851,33 +1850,36 @@
>>
>>               Device (RES0)
>>               {
>>                   Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID
>>                   Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>                   {
>>                       QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
>>                           0x0000000000000000, // Granularity
>>                           0x0000004010000000, // Range Minimum
>>                           0x000000401FFFFFFF, // Range Maximum
>>                           0x0000000000000000, // Translation Offset
>>                           0x0000000010000000, // Length
>>                           ,, , AddressRangeMemory, TypeStatic)
>>                   })
>>               }
>>           }
>> +    }
>>
>> +    Scope (\_SB)
>> +    {
>>           Device (\_SB.GED)
>>           {
>>               Name (_HID, "ACPI0013" /* Generic Event Device */)  // _HID: Hardware ID
>>               Name (_UID, "GED")  // _UID: Unique ID
>>               Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>               {
>>                   Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
>>                   {
>>                       0x00000029,
>>                   }
>>               })
>>               OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
>>               Field (EREG, DWordAcc, NoLock, WriteAsZeros)
>>               {
>>                   ESEL,   32
>>               }
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5178 bytes
>>   .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5264 bytes
>>   tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6539 bytes
>>   tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7635 bytes
>>   tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5380 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>>   6 files changed, 5 deletions(-)
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
>> index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..5c73e64e0c29d3cea5299929afd00e9a1238e559 100644
>> GIT binary patch
>> delta 125
>> zcmX@3u}g!?CD<jzN`!%dNoFFKG*h4XMs+tXCb!9(^SP`!1bx`!{ezuZy0RIZUBV3)
>> z__0pjEu>{)oKT&>C7-ZBVAAAF##)dJ7YA5gc+zAbZJYoR699=7B!EN~@=P`s?&1(|
>> P<BW+9c8Z_8SGXSlZJ{Hk
>>
>> delta 142
>> zcmdm`aYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SP`!1l>5}{ezuZy0RIZUBV3)
>> zc(702Eu`gV6dW25PyiG$b`A;hsRj{T@*r}7z@*8UjI|)OTpVB>Vv{Dr)Io#=K*9we
>> U#USw|*$eq5OA2>QUM<`Y00vhni~s-t
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
>> index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..b0a875d8da3592b5927095304ca31ceb001b2fdf 100644
>> GIT binary patch
>> delta 125
>> zcmZ3aIYE=lCD<iof(Qcx(~F5*(o8M38`bA<F}Y3Ne3Z+YL(qpk-apuxr7N4k*(Ka?
>> zfgkH+L18Tu<Amx2F8PE70+S|ZGS-4*xH!P_!jmQgY2yTlm;gwuAOR$@kY{qIa2JPw
>> P8)r;>uv7eGVUd0S*;^zc
>>
>> delta 142
>> zcmbQBxk!`CCD<iokq83=(~XH-(oDVX8`bA<F*!`#e3Z+YL(q*g-apuxr7N4k*(Ka?
>> zfd~6!L18UFqu|hhfC8Y1v2#d}Pc?|(k_V9s1SU<+WUK|L<>CPA5Sug^rVb)301_?$
>> UDF%rz$zI4eIbXPIGNVX80DOQd2mk;8
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
>> index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..21a6b086cbf72298d125d8bfc4c4b7ec9315267b 100644
>> GIT binary patch
>> delta 126
>> zcmbPh+-=O|66_MvEy=*ZWIK^dnyJrxqq-XxliTFY`CQf<f<El={=v>HUD*uIF5!j?
>> z{8%UN7Sb{?PN+`cl22G5FllloV=YLAivuh#JZUnJHco(u34p{35<nsgc_teRcX0@~
>> Q$Hl}4JH>C_EBt^J0I0kqp#T5?
>>
>> delta 143
>> zcmeA+o@>nI66_K(SCWB&$z~##G*id)jp}Y(Ob$~w=W|(e2)c2``v*I-bY(L*yM!Aq
>> z@L-?3TS&{#C^$4Apa3Xh>>Lv0Qw<`x<U!;Dfk~4y8EZjmxj4W&#3oIKse=d$fP@P`
>> Vib3K_vKR7AmK5&Vyju7HD*$j8Du)07
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
>> index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..c8548a5e5d41a843142c7bbe64580025e006445d 100644
>> GIT binary patch
>> delta 217
>> zcmexwec77JCD<k8vMd7w)AEU2(oF3aH>$gFF?qIa&ga_8F6hG^?;q^U(v{8N>=JIc
>> zz>jruo{W}>aYA(hmwdtkfk~4y8EZi@TpVC|;YpK$v~dDNOaLTSkN^@{$TRtwjP2%6
>> gLVAo$Zj(1FiCA+`*X%A10XNQ=_+Y2_$py0g04PO4(EtDd
>>
>> delta 260
>> zcmca?{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=X3347j)x{_YZbv>B?qsb_q9J
>> z;K4rGR!GawC^$4Apa3Xh>>Lv0Qw<`x<U!;Dfk~4y8EZjmxj4W&#3oIKse=d$fP@P`
>> oib3K_vKR7go-LHk$mB3}Glz&Z2VHEOJX^?i@_QNI$u6?}0Luzao&W#<
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
>> index 029d03eecc4efddc001e5377e85ac8e831294362..73aa833317627204aef7ac858d178445bcd37a54 100644
>> GIT binary patch
>> delta 125
>> zcmbQH)uP4a66_MfBFezPBruUnnyJHOqq+b$liTFYmfY4Hf<El={=v>HUD*uIF5!j?
>> z{8%Tq3Tv4dCsZeJ$tNrjm^3+)u@)r5#Q~NVo-`Rq8z(@-1VCa12_TV$Jd^(lcX0@~
>> PamK_4JH=0K7wHE8^splO
>>
>> delta 142
>> zcmZqCnx@6&66_KpCd$CT#6OWsnyJx$qq+b$lf%@_mfY4Hf^MAg{=v>HUD*uIF5!j?
>> zJlH3<3Tycp1&0O%6aYnxokN0rszC&oJcwK%FllloV=YK67YA5}*rdrYbr4|zkZ=J=
>> UF-Uw#_CmhNkA=G?mx}ZQ0C4*#-~a#s
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index abe00ad4ee..dfb8523c8b 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,6 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/aarch64/virt/DSDT",
>> -"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
>> -"tests/data/acpi/aarch64/virt/DSDT.memhp",
>> -"tests/data/acpi/aarch64/virt/DSDT.pxb",
>> -"tests/data/acpi/aarch64/virt/DSDT.topology",
> 
