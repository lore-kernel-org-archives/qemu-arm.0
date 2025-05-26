Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4253223njc;
        Mon, 26 May 2025 07:46:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNTKcZ8EJPB3C6ORN0fUCzp8SZKNdeTQSS3VlzNq7pQIaXpBRfqTILDXYzePg89Nfij61L7S2FOpyjtg==@linaro.org
X-Google-Smtp-Source: AGHT+IFwM5YlK5mE8ABFs5InTbxCZm5x1GHaFllHBMERdNc6C8J5mMMxzZesj2IRTX9z0D2XQeI8
X-Received: by 2002:a17:902:cf42:b0:234:1163:ff99 with SMTP id d9443c01a7336-23414fd5dafmr165145415ad.43.1748270791060;
        Mon, 26 May 2025 07:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748270791; cv=none;
        d=google.com; s=arc-20240605;
        b=D73JSrE/JYrzUTxu0hs+g7OsoZx0RgsXXXXd5ENsliTkA54qH9pzEjJhy2rx9brBms
         pOK0QKCRggF26QQGeNEoH4NuWq9KCVZzGNfV/BEZ5lg9IlWNRgIPqtwxmmQXAvgJtZ8i
         tXLydBZsvfunwlTcp0IjZl+hzPvjN+ntYw5xR/w11kNyFmzFDC2UyMQjgfWS7Pwy2Aj1
         PWkcvnAcWq6idSXernhvl08OWNwht1DAd2srNO67Z7LM0DeuZSKnNpcqzRRDg3hfTiq1
         kIUlpWULbsq7y7wG/EpyS6fB/wfuijGTkPG7VFMwYx8B4g4BgbL9+80P+UT46qSjAmxH
         0uBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+pO+SPQDi7tQiN9VapckmgteusgBf+nrvF8zHvqxycA=;
        fh=bFFRA8v6J22CFwiPemGd1h5Lj2W5caBHHFMX1XOs/U0=;
        b=gNoFwOhmodLFVJdg0tn25cRKbiosPJyDR+1PLw+MziyUbyt6YsRgSUmrlPUplAN/90
         RJuieyPUcLuDrok6HhZXQnewxrFfV4cCdb3XrFXea3b6597CjXlTTuU10eA4wsuJDlPY
         8GA5NVIm0TU0jsna6I+x3mNXTaCQ761m6PzcHSqbpu4uVc8n2auxq2nSesdyV13L/yBz
         HacCwuihvuq+XUuREVsRElDJ6cpVnXk2820HHGPryOZocCEjroF9H3ZtMhBMTYIvBLbm
         G5s6OXJZGmfzzCD+dA07ImSER88Ms+PC33a2ImfuZ4zzvefaTQjEKaTNWabmOIK+eamR
         k9FA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9lmIbjK;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-234471245a3si43348375ad.269.2025.05.26.07.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 07:46:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9lmIbjK;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748270789;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+pO+SPQDi7tQiN9VapckmgteusgBf+nrvF8zHvqxycA=;
	b=Z9lmIbjKs0sDO94tImcmoIe4xgrZ848+JV+xXm4S8QqVgt+45XyHFSjxHVyfqVHXqs8md7
	vvVLTaHJMcJVSCWMTiGUaA+a3oD7RI9zTRNHDXQKFFA+6cwKl6KFJEI1Sc2R6CsckUyZcy
	AgJITIHtE3Rv75a8V7kr18dw3aSwIoo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-4Hek0Q6WOsma_vm_PoEKgg-1; Mon, 26 May 2025 10:46:27 -0400
X-MC-Unique: 4Hek0Q6WOsma_vm_PoEKgg-1
X-Mimecast-MFC-AGG-ID: 4Hek0Q6WOsma_vm_PoEKgg_1748270786
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a367b3bb78so1222473f8f.1
        for <alex.bennee@linaro.org>; Mon, 26 May 2025 07:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748270786; x=1748875586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pO+SPQDi7tQiN9VapckmgteusgBf+nrvF8zHvqxycA=;
        b=rQH7s3jgHzCljxEtV5ZlzAEyXL1TMMSa1JuMOeu44+B8mXK5x3w2moFJmP8SP8uxwr
         Y2k0f9/rWce10iYazGvNOBO8cNT8nehXMx/nC9sPP+YDV9NDq+uRsjVTcXOFQWTCS3XV
         7qbe2cTPGh7y87i//3xaKhzSodBwlk+SA7pkBJIRkSPa9Xtc3kYA9bC1/RLDPoQqea8g
         QqDrTjabQwNgvGWR3S9YS04P9kOK0QxkKRsPKzRP8itHucYBlxb0gRdCdCS7n4s7vw1y
         EelafenKMiruCfjDOJahKJKBatqD425ZfmLuIs1DgoymBpIOf/nFikjU1YjaLwQMQHPy
         ngpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJXmRFQ3feG40vX16jyuiyvpwLCBapfmAMJ24ZG0qsJqClDlHQRgOHiAK0IyafrSxXPC3QRjGtinjB3w==@linaro.org
X-Gm-Message-State: AOJu0YzGBfdMKHbCtCaPeNzNDEZAh5/qP9DXPwNNZfaIvKYn/daGa7QY
	ZJR9B6ARKobvyIdGSYerHBJby76DgS0EjKR4yp6G9VXzDz1uOZzKGUBmrjI+6dpGD3qA4L4OOKc
	zzftpAnkOFO+kkTF/ZtOZWimz5hUlj9iwtVetR/E8gazKCar50yYcVYYhhw==
X-Gm-Gg: ASbGnct/lMbv2ujkMxO2p9lHowlRPlCZfusCIzxNr3T6rsBM8ItUxXBKabED0tRrzba
	eTLVbzqCamgSZiJ+HUiUfKXpu3iUYwBDAri1woiWoHzBRjjkQI8xW1lxwqVwK33lt++XkuwPobo
	jhTJvvDyWcaHz0G59LosaxOtya67uSoR7ZCx9b9bmpQGFGTLwMm73rukjtmv5RpU0LagQKGLaI6
	mBnCQYtdDUy3Ih/wJ0kvA0gKPTxuiw94E1a7spH+5AB2MuaOYxly8HNJh09qM4Wzcmj9cjdHvnS
	41w4I/zJHHSS0HeqwzCK+PZbRVVtl+GRhmnkUir/C/joVu8SztS2qbZOZwc=
X-Received: by 2002:adf:f483:0:b0:3a4:cbc6:9db2 with SMTP id ffacd0b85a97d-3a4cbc69e1dmr6247158f8f.59.1748270786254;
        Mon, 26 May 2025 07:46:26 -0700 (PDT)
X-Received: by 2002:adf:f483:0:b0:3a4:cbc6:9db2 with SMTP id ffacd0b85a97d-3a4cbc69e1dmr6247127f8f.59.1748270785765;
        Mon, 26 May 2025 07:46:25 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d2d37445sm5297930f8f.88.2025.05.26.07.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:46:24 -0700 (PDT)
Message-ID: <2e4ed5b1-096a-4ec0-952c-2d5a51f12ae5@redhat.com>
Date: Mon, 26 May 2025 16:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 3/5] tests/qtest/bios-tables-test: Update changed ACPI
 blobs
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
 <20250526053123.1434204-4-gustavo.romero@linaro.org>
 <fb728394-74f4-415d-9cb6-967526a86147@redhat.com>
 <f310d7e1-6a18-41b4-a2f0-73f961aa63f4@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <f310d7e1-6a18-41b4-a2f0-73f961aa63f4@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gyT5xg_-aGxb6nZen6w_FTn8YrORxfKiiZF2yx_MxgM_1748270786
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2YEh4spo8jgr



On 5/26/25 3:51 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/26/25 07:25, Eric Auger wrote:
>> Hi Gustavo,
>>
>> On 5/26/25 7:31 AM, Gustavo Romero wrote:
>>> Update the aarch64 'virt' base blob and all of its variants. All of
>>> them
>>> have the same diff, so only one is shown below. The essential
>>> changes is
>>> in the AML code of the _OSC (OS Capabilities) method, (variable name
>>> from 'CTRL' to 'Local0') and the scope for GED device.
>>
>> Maybe we shall split the update into 2 steps
>
> Yes, I think so.
>
>
>> 1) introduce/validate the changes related to _OSC first
>
> Yep, if I'm following you correctly :) When you say "introduce/validade
> the changes related to _OSC first" you mean putting your series [0]
> (all patches or
> at least patch 08/22 "hw/pci-host/gpex-acpi: Use
> build_pci_host_bridge_osc_method")
> before this patch, 3/5, and after 1/5? If that's it, yip, I think that
> would
> be the right thing to do.
yep this allows to validate the acpi changes in an incremental manner.
>
>
>> 2) produce the DSDT ref code with ACPI PCIHP hotplug elements
>
> Yep, but you mean "with ACPI PCIHP hotplug elements" when
> acpi-pcihp=off, right?
> Which is equivalent to put this patch, which contains the DSDT ref
> code with
> ACPI PCI hotplug in place and with acpi-pcihp=off, after your changes
> in _OSC.
logically if acpi-pcihp is off the DSDT should not be altered, besides
the small _OSC change. in practice I can see there is a tiny change with
a SB scope closure and reopening.  I need to see if I get rid of that
one. Then when setting the option as default we obviously get a lot of
changes for which we need to regenerate ref blobs.


>
>
>> What do you think?
>
> Yeah, feel free to pick patches 1-3 from this series and apply
> accordingly to your
> series. Patch 1/5 would be right before the change in _OSC in your
> series, i.e. before
> patch 8/22, and patches 2/5 and 3/5 right after patch 8/22. Is this
> what you meant?
>
> It seems there is also an inoffensive change in the scope of the GED,
> but I'm not
> sure where it's coming from, maybe it comes from yet another patch,
> not from 8/22,
> that also must be included between 1/5 and 2-3/5?

Yep I just noticed that one, already mentionned above. I will try to fix
that.
>
> An alternative, which I think is less ideal, have 1/3 before your
> series and 2/5 and 3/5
> at the end of your whole series. But I prefer them "sandwiching" the
> 8/22 patch and the
> patches that exclusively touch the DSDT table, instead.
>
> Then patches 4-5/5 in this series would come a separate series, after
> everything else,
> and so can be merged separate.

agreed

Cheers

Eric
>
>
> Cheers,
> Gustavo
>
> [0]
> https://lists.nongnu.org/archive/html/qemu-devel/2025-05/msg03487.html
>
>> Eruc
>>
>>>
>>> DSDT table diff:
>>>
>>>   DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>>>   {
>>>       Scope (\_SB)
>>>       {
>>>           Device (C000)
>>>           {
>>>               Name (_HID, "ACPI0007" /* Processor Device */)  //
>>> _HID: Hardware ID
>>>               Name (_UID, Zero)  // _UID: Unique ID
>>>           }
>>>
>>> @@ -1794,53 +1794,52 @@
>>>                       0x0000000000000000, // Granularity
>>>                       0x0000008000000000, // Range Minimum
>>>                       0x000000FFFFFFFFFF, // Range Maximum
>>>                       0x0000000000000000, // Translation Offset
>>>                       0x0000008000000000, // Length
>>>                       ,, , AddressRangeMemory, TypeStatic)
>>>               })
>>>               Name (SUPP, Zero)
>>>               Name (CTRL, Zero)
>>>               Method (_OSC, 4, NotSerialized)  // _OSC: Operating
>>> System Capabilities
>>>               {
>>>                   CreateDWordField (Arg3, Zero, CDW1)
>>>                   If ((Arg0 == ToUUID
>>> ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
>>>                   {
>>>                       CreateDWordField (Arg3, 0x04, CDW2)
>>>                       CreateDWordField (Arg3, 0x08, CDW3)
>>> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
>>> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>>> -                    CTRL &= 0x1F
>>> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>>> +                    Local0 &= 0x1F
>>>                       If ((Arg1 != One))
>>>                       {
>>>                           CDW1 |= 0x08
>>>                       }
>>>
>>> -                    If ((CDW3 != CTRL))
>>> +                    If ((CDW3 != Local0))
>>>                       {
>>>                           CDW1 |= 0x10
>>>                       }
>>>
>>> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
>>> -                    Return (Arg3)
>>> +                    CDW3 = Local0
>>>                   }
>>>                   Else
>>>                   {
>>>                       CDW1 |= 0x04
>>> -                    Return (Arg3)
>>>                   }
>>> +
>>> +                Return (Arg3)
>>>               }
>>>
>>>               Method (_DSM, 4, NotSerialized)  // _DSM:
>>> Device-Specific Method
>>>               {
>>>                   If ((Arg0 == ToUUID
>>> ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling
>>> Interface */))
>>>                   {
>>>                       If ((Arg2 == Zero))
>>>                       {
>>>                           Return (Buffer (One)
>>>                           {
>>>                               
>>> 0x01                                             // .
>>>                           })
>>>                       }
>>>                   }
>>>
>>>                   Return (Buffer (One)
>>> @@ -1851,33 +1850,36 @@
>>>
>>>               Device (RES0)
>>>               {
>>>                   Name (_HID, "PNP0C02" /* PNP Motherboard Resources
>>> */)  // _HID: Hardware ID
>>>                   Name (_CRS, ResourceTemplate ()  // _CRS: Current
>>> Resource Settings
>>>                   {
>>>                       QWordMemory (ResourceProducer, PosDecode,
>>> MinFixed, MaxFixed, NonCacheable, ReadWrite,
>>>                           0x0000000000000000, // Granularity
>>>                           0x0000004010000000, // Range Minimum
>>>                           0x000000401FFFFFFF, // Range Maximum
>>>                           0x0000000000000000, // Translation Offset
>>>                           0x0000000010000000, // Length
>>>                           ,, , AddressRangeMemory, TypeStatic)
>>>                   })
>>>               }
>>>           }
>>> +    }
>>>
>>> +    Scope (\_SB)
>>> +    {
>>>           Device (\_SB.GED)
>>>           {
>>>               Name (_HID, "ACPI0013" /* Generic Event Device */)  //
>>> _HID: Hardware ID
>>>               Name (_UID, "GED")  // _UID: Unique ID
>>>               Name (_CRS, ResourceTemplate ()  // _CRS: Current
>>> Resource Settings
>>>               {
>>>                   Interrupt (ResourceConsumer, Edge, ActiveHigh,
>>> Exclusive, ,, )
>>>                   {
>>>                       0x00000029,
>>>                   }
>>>               })
>>>               OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
>>>               Field (EREG, DWordAcc, NoLock, WriteAsZeros)
>>>               {
>>>                   ESEL,   32
>>>               }
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> ---
>>>   tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5178
>>> bytes
>>>   .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5264
>>> bytes
>>>   tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6539
>>> bytes
>>>   tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7635
>>> bytes
>>>   tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5380
>>> bytes
>>>   tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>>>   6 files changed, 5 deletions(-)
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT
>>> b/tests/data/acpi/aarch64/virt/DSDT
>>> index
>>> 36d3e5d5a5e47359b6dcb3706f98b4f225677591..5c73e64e0c29d3cea5299929afd00e9a1238e559
>>> 100644
>>> GIT binary patch
>>> delta 125
>>> zcmX@3u}g!?CD<jzN`!%dNoFFKG*h4XMs+tXCb!9(^SP`!1bx`!{ezuZy0RIZUBV3)
>>> z__0pjEu>{)oKT&>C7-ZBVAAAF##)dJ7YA5gc+zAbZJYoR699=7B!EN~@=P`s?&1(|
>>> P<BW+9c8Z_8SGXSlZJ{Hk
>>>
>>> delta 142
>>> zcmdm`aYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SP`!1l>5}{ezuZy0RIZUBV3)
>>> zc(702Eu`gV6dW25PyiG$b`A;hsRj{T@*r}7z@*8UjI|)OTpVB>Vv{Dr)Io#=K*9we
>>> U#USw|*$eq5OA2>QUM<`Y00vhni~s-t
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
>>> b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
>>> index
>>> e6154d0355f84fdcc51387b4db8f9ee63acae4e9..b0a875d8da3592b5927095304ca31ceb001b2fdf
>>> 100644
>>> GIT binary patch
>>> delta 125
>>> zcmZ3aIYE=lCD<iof(Qcx(~F5*(o8M38`bA<F}Y3Ne3Z+YL(qpk-apuxr7N4k*(Ka?
>>> zfgkH+L18Tu<Amx2F8PE70+S|ZGS-4*xH!P_!jmQgY2yTlm;gwuAOR$@kY{qIa2JPw
>>> P8)r;>uv7eGVUd0S*;^zc
>>>
>>> delta 142
>>> zcmbQBxk!`CCD<iokq83=(~XH-(oDVX8`bA<F*!`#e3Z+YL(q*g-apuxr7N4k*(Ka?
>>> zfd~6!L18UFqu|hhfC8Y1v2#d}Pc?|(k_V9s1SU<+WUK|L<>CPA5Sug^rVb)301_?$
>>> UDF%rz$zI4eIbXPIGNVX80DOQd2mk;8
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp
>>> b/tests/data/acpi/aarch64/virt/DSDT.memhp
>>> index
>>> 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..21a6b086cbf72298d125d8bfc4c4b7ec9315267b
>>> 100644
>>> GIT binary patch
>>> delta 126
>>> zcmbPh+-=O|66_MvEy=*ZWIK^dnyJrxqq-XxliTFY`CQf<f<El={=v>HUD*uIF5!j?
>>> z{8%UN7Sb{?PN+`cl22G5FllloV=YLAivuh#JZUnJHco(u34p{35<nsgc_teRcX0@~
>>> Q$Hl}4JH>C_EBt^J0I0kqp#T5?
>>>
>>> delta 143
>>> zcmeA+o@>nI66_K(SCWB&$z~##G*id)jp}Y(Ob$~w=W|(e2)c2``v*I-bY(L*yM!Aq
>>> z@L-?3TS&{#C^$4Apa3Xh>>Lv0Qw<`x<U!;Dfk~4y8EZjmxj4W&#3oIKse=d$fP@P`
>>> Vib3K_vKR7AmK5&Vyju7HD*$j8Du)07
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb
>>> b/tests/data/acpi/aarch64/virt/DSDT.pxb
>>> index
>>> c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..c8548a5e5d41a843142c7bbe64580025e006445d
>>> 100644
>>> GIT binary patch
>>> delta 217
>>> zcmexwec77JCD<k8vMd7w)AEU2(oF3aH>$gFF?qIa&ga_8F6hG^?;q^U(v{8N>=JIc
>>> zz>jruo{W}>aYA(hmwdtkfk~4y8EZi@TpVC|;YpK$v~dDNOaLTSkN^@{$TRtwjP2%6
>>> gLVAo$Zj(1FiCA+`*X%A10XNQ=_+Y2_$py0g04PO4(EtDd
>>>
>>> delta 260
>>> zcmca?{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=X3347j)x{_YZbv>B?qsb_q9J
>>> z;K4rGR!GawC^$4Apa3Xh>>Lv0Qw<`x<U!;Dfk~4y8EZjmxj4W&#3oIKse=d$fP@P`
>>> oib3K_vKR7go-LHk$mB3}Glz&Z2VHEOJX^?i@_QNI$u6?}0Luzao&W#<
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology
>>> b/tests/data/acpi/aarch64/virt/DSDT.topology
>>> index
>>> 029d03eecc4efddc001e5377e85ac8e831294362..73aa833317627204aef7ac858d178445bcd37a54
>>> 100644
>>> GIT binary patch
>>> delta 125
>>> zcmbQH)uP4a66_MfBFezPBruUnnyJHOqq+b$liTFYmfY4Hf<El={=v>HUD*uIF5!j?
>>> z{8%Tq3Tv4dCsZeJ$tNrjm^3+)u@)r5#Q~NVo-`Rq8z(@-1VCa12_TV$Jd^(lcX0@~
>>> PamK_4JH=0K7wHE8^splO
>>>
>>> delta 142
>>> zcmZqCnx@6&66_KpCd$CT#6OWsnyJx$qq+b$lf%@_mfY4Hf^MAg{=v>HUD*uIF5!j?
>>> zJlH3<3Tycp1&0O%6aYnxokN0rszC&oJcwK%FllloV=YK67YA5}*rdrYbr4|zkZ=J=
>>> UF-Uw#_CmhNkA=G?mx}ZQ0C4*#-~a#s
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
>>> b/tests/qtest/bios-tables-test-allowed-diff.h
>>> index abe00ad4ee..dfb8523c8b 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1,6 +1 @@
>>>   /* List of comma-separated changed AML files to ignore */
>>> -"tests/data/acpi/aarch64/virt/DSDT",
>>> -"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
>>> -"tests/data/acpi/aarch64/virt/DSDT.memhp",
>>> -"tests/data/acpi/aarch64/virt/DSDT.pxb",
>>> -"tests/data/acpi/aarch64/virt/DSDT.topology",
>>
>
