Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3911405njd;
        Wed, 2 Apr 2025 23:32:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQ9j6GJORFclfIttMBVB3Npnfl+dwU4GTRGlWiBZ6bKcgilRgYp3dpzuvOkCUhkgM8gj6sgCrZzWGtcA==@linaro.org
X-Google-Smtp-Source: AGHT+IHl3FDlodh8S4WK4UbyMzRvCUffBJfd+PRaICZrnwV5xafxIAugSm+vgSI2pGoXYOpVO02Y
X-Received: by 2002:a05:6214:482:b0:6e8:fac2:2e95 with SMTP id 6a1803df08f44-6ef0f573b0bmr14950016d6.11.1743661953417;
        Wed, 02 Apr 2025 23:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743661953; cv=none;
        d=google.com; s=arc-20240605;
        b=V3Sfv9NLWkOJdmsoKJi7iP6bMk6eqtM6hwaA4COVnoS3gUDdJWBXfYi+s1fHF4pRyL
         wQGHP98cmzY+phMkCuCHy7H7b3uoCxwI1qo9aVE59hw0hnE7sCrWTwC8OaZivdOyO+3X
         x0wvO03H3uYXqMdEo02iW1LZqu2WZTO/ipZgirX1eWsXmjQDmnU6ZfOu0VV2r8LQJnSY
         ffEedsL5AEF3gGbIOCNCOHFALCluxejpMQH9oUDFoTftFztF+FQEcdSpteIc/bNUfPb4
         OZiw/nW9N8TZXdjDeGdh5DKuEf6RGWFKWqecu0LC7bkyVgw8n57z0tuPVhbUIuzDR5vv
         qSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rhAyJkOpi68aEAQQTv65+9X/E2pd+e9U9MdxH77h+LE=;
        fh=iNdw+gXOpsf7YmAkVAzCf+WPKlX/d/NHCxcLQ0PoncQ=;
        b=kY9uMxLj3c5C8L3UVgiOBw22tHkIZomcOxzYHXLm+MG0nKUwC5Og1IFH38IJp1539f
         UKjL7AW7ULnm6q02ZBL/Rd1ELfZ9Mjm0DQip0nFFMyByu9CVm/abHZ0loczCb06YyEqt
         Qe7DtIKcsuEsnhwEAKa1QvZRidge1BwpZSaEvk8AWj21a3NZokxlkySV+7ydxws0QMWH
         jGOEjTaS8EvumVbn0/oeHB0+rhHYQ3+mYazxnWLtsisOUCCEECR00s6K1Wi85vz4sBve
         JsA70ZLaKNIDG2pEZG7rW2096ZdKqVBnWVqa3n+wXd7pYnRTZGkhMsN9e4pERq4zxDtg
         C34w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFmLmtfh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ef0f10dd4dsi6356196d6.236.2025.04.02.23.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 23:32:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFmLmtfh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0E7j-0005vz-6M; Thu, 03 Apr 2025 02:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E7O-0005uU-Li
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:32:04 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E7M-0008Kh-Et
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:32:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-227d6b530d8so5464575ad.3
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743661919; x=1744266719; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rhAyJkOpi68aEAQQTv65+9X/E2pd+e9U9MdxH77h+LE=;
 b=PFmLmtfhjq6gASKW7VqyAcp5WoVYkkweR8992Coid6BYgkULATprcGIIjlTVDfkuS5
 nw9pG7i4IL2Wo4Cm3CUM3AikTryhD8Yxxv3onTek2n5pJyHy3MaD4O1YhIosc5MjnLWz
 9ZNdRIXSCKuRCHGeR0C3d0c/uE9cbdplmhN6jYNuQhA9tGtbk91DWU2cd8Bl2MTEfVJ1
 GaoMxohqgB9fLlsLtFZOhsVch+5bkvcAzShaHVxz4aFe15GCdT5NRMzRuADG59F3CUZ4
 qpKfJRyRGnQPV+q3G+WKFZZhSPnLrRtsqZX/V0F2Y8DNVrQ2LsVQPhqRxBI3iyU/pXHD
 LCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743661919; x=1744266719;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhAyJkOpi68aEAQQTv65+9X/E2pd+e9U9MdxH77h+LE=;
 b=Mb/UVRjkqffCXeUyGnmdkZ5kOGthdtQYwd30UtcrD3WNdeCgXDcfhx3giSkULXK1Ql
 Ss7xdNEofCMnAVXAO3bSsNUiox+HFiisY2SXBuJnpinR1ZMWgHFgC7Wy0onIRzdYZ7tn
 a61zWChsGf27Uk0nl6F6JhRstaYuvQWTLlluL55GhqNTZ6OBAhBnQxMufpOx0V0duPWI
 dqrtlAq+NjPea//T5Pwryh8iobn2QFK9VFMnf7ynKMnOTt5il2LUtSMbvdOABlUeVFej
 hZHH5cVf4d4rZKVy/F5K5/Y603ZQPCkty41q/V/V8HUF62LK0pvDb06eLl6h9db7cIiR
 +Jjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPTHJK1NoV1lnN1cM/ZzKYGFUWjB6u9Vj0SrzW87jAAF1SBz9wgPMtwf81cL6BDMaKqLS9MKFfrg==@nongnu.org
X-Gm-Message-State: AOJu0YwwcyBPpInfsR4C0C9gWm2I6/UwIEyjqohNzUqsZn/1dnEHmJiY
 EY8DJ2u+8DkXeXweX2GIh0gFcLn2KqkGsqWAqoVr0bltI+/5vhS7MQ2etPmjiQYMsBw243fJJNX
 d
X-Gm-Gg: ASbGncv+T7kEdcwf2O0ADA7uqcdCvLjhDBoCvkvK6yqYBUGWOCjqqlyJTmLoUgWRtDN
 y9JOP9eE0k8Dbqc8E22iTpxq/OURY8Xlbuo4ssOT2mNZG/Jav316vgN1ZMhTM88kQjX78epHvMo
 sss5Y9a3WBHlHWXYb9fKrx+glZ6q+JtwcObiNldn/41ryMNVeFMRvaq/XdtcqtOkHk/xbuvYTTT
 LfYHHzKsybxKlDwMUUNk8nSli835Zkp2nbta1Yz67O0BlFPFK51aSNt8fQUAUSk9NCrvTNu4RRJ
 hhFXu0ZBDcsqWXBr2Ast9CfmSQyNuPYsksnM5qC2DwuHXL0jT9YFZ71C
X-Received: by 2002:a17:903:2a90:b0:224:76f:9e4a with SMTP id
 d9443c01a7336-22993c0ddd4mr16027665ad.14.1743661918776; 
 Wed, 02 Apr 2025 23:31:58 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866080csm6656195ad.125.2025.04.02.23.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 23:31:58 -0700 (PDT)
Message-ID: <192fd8e8-c1fb-4537-b773-6b2548881d7f@linaro.org>
Date: Thu, 3 Apr 2025 03:31:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 5/5] qtest/bios-tables-test: Update
 aarch64/virt/APIC.its_off blob
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-6-philmd@linaro.org>
 <98b286c5-f48f-4dec-b6c7-3e1ca2156735@linaro.org>
 <b34b6ab3-ac42-4d94-a30d-0d8ebed960f5@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <b34b6ab3-ac42-4d94-a30d-0d8ebed960f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: 3ZjbCsMPCD7Z

Hi Phil,

On 4/2/25 07:34, Philippe Mathieu-Daudé wrote:
> On 2/4/25 08:45, Gustavo Romero wrote:
>> Hi Phil,
>>
>> On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
>>> Changes in the tables:
>>>
>>>    @@ -1,32 +1,32 @@
>>>     /*
>>>      * Intel ACPI Component Architecture
>>>      * AML/ASL+ Disassembler version 20240927 (64-bit version)
>>>      * Copyright (c) 2000 - 2023 Intel Corporation
>>>      *
>>>      * Disassembly of tests/data/acpi/aarch64/virt/APIC.its_off
>>>      *
>>>      * ACPI Data Table [APIC]
>>>      *
>>>      * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
>>>      */
>>>
>>>     [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
>>>    -[004h 0004 004h]                Table Length : 000000B8
>>>    +[004h 0004 004h]                Table Length : 000000A4
>>>     [008h 0008 001h]                    Revision : 04
>>>    -[009h 0009 001h]                    Checksum : A7
>>>    +[009h 0009 001h]                    Checksum : EE
>>>     [00Ah 0010 006h]                      Oem ID : "BOCHS "
>>>     [010h 0016 008h]                Oem Table ID : "BXPC    "
>>>     [018h 0024 004h]                Oem Revision : 00000001
>>>     [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>>>     [020h 0032 004h]       Asl Compiler Revision : 00000001
>>>
>>>     [024h 0036 004h]          Local Apic Address : 00000000
>>>     [028h 0040 004h]       Flags (decoded below) : 00000000
>>>                              PC-AT Compatibility : 0
>>>
>>>     [02Ch 0044 001h]               Subtable Type : 0C [Generic Interrupt Distributor]
>>>     [02Dh 0045 001h]                      Length : 18
>>>     [02Eh 0046 002h]                    Reserved : 0000
>>>     [030h 0048 004h]       Local GIC Hardware ID : 00000000
>>>     [034h 0052 008h]                Base Address : 0000000008000000
>>>     [03Ch 0060 004h]              Interrupt Base : 00000000
>>>    @@ -49,37 +49,29 @@
>>>     [06Ch 0108 008h]    Virtual GIC Base Address : 0000000000000000
>>>     [074h 0116 008h] Hypervisor GIC Base Address : 0000000000000000
>>>     [07Ch 0124 004h]       Virtual GIC Interrupt : 00000019
>>>     [080h 0128 008h]  Redistributor Base Address : 0000000000000000
>>>     [088h 0136 008h]                   ARM MPIDR : 0000000000000000
>>>     [090h 0144 001h]            Efficiency Class : 00
>>>     [091h 0145 001h]                    Reserved : 00
>>>     [092h 0146 002h]      SPE Overflow Interrupt : 0000
>>>     [094h 0148 002h]              TRBE Interrupt : 100E
>>>
>>>     [094h 0148 001h]               Subtable Type : 0E [Generic Interrupt Redistributor]
>>>     [095h 0149 001h]                      Length : 10
>>>     [097h 0151 002h]                    Reserved : 0000
>>>     [098h 0152 008h]                Base Address : 00000000080A0000
>>>     [0A0h 0160 004h]                      Length : 00F60000
>>>
>>>    -[0A4h 0164 001h]               Subtable Type : 0F [Generic Interrupt Translator]
>>>    -[0A5h 0165 001h]                      Length : 14
>>>    -[0A7h 0167 002h]                    Reserved : 0000
>>>    -[0A8h 0168 004h]              Translation ID : 00000000
>>>    -[0ACh 0172 008h]                Base Address : 0000000008080000
>>>    -[0B4h 0180 004h]                    Reserved : 00000000
>>>    +Raw Table Data: Length 164 (0xA4)
>>>
>>>    -Raw Table Data: Length 184 (0xB8)
>>>    -
>>>    -    0000: 41 50 49 43 B8 00 00 00 04 A7 42 4F 43 48 53 20  // APIC......BOCHS
>>>    +    0000: 41 50 49 43 A4 00 00 00 04 EE 42 4F 43 48 53 20  // APIC......BOCHS
>>>         0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>>>         0020: 01 00 00 00 00 00 00 00 00 00 00 00 0C 18 00 00  // ................
>>>         0030: 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00  // ................
>>>         0040: 04 00 00 00 0B 50 00 00 00 00 00 00 00 00 00 00  // .....P..........
>>>         0050: 01 00 00 00 00 00 00 00 17 00 00 00 00 00 00 00  // ................
>>>         0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>>>         0070: 00 00 00 00 00 00 00 00 00 00 00 00 19 00 00 00  // ................
>>>         0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>>>         0090: 00 00 00 00 0E 10 00 00 00 00 0A 08 00 00 00 00  // ................
>>>    -    00A0: 00 00 F6 00 0F 14 00 00 00 00 00 00 00 00 08 08  // ................
>>>    -    00B0: 00 00 00 00 00 00 00 00                          // ........
>>>    +    00A0: 00 00 F6 00                                      // ....
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>>>   tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 184 -> 164 bytes
>>>   2 files changed, 1 deletion(-)
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/ qtest/bios-tables-test-allowed-diff.h
>>> index bfc4d601243..dfb8523c8bf 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1,2 +1 @@
>>>   /* List of comma-separated changed AML files to ignore */
>>> -"tests/data/acpi/aarch64/virt/APIC.its_off",
>>> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/ acpi/aarch64/virt/APIC.its_off
>>> index c37d05d6e05805304f10afe73eb7cb9100fcccfa..f24ac8fbff5261a52434abcfcff96dbdc7709de4 100644
>>> GIT binary patch
>>> delta 18
>>> ZcmdnNxP+0*F~HM#2?GNI%e#qOvj8xy1yKM1
>>>
>>> delta 39
>>> jcmZ3&xPy_)F~HM#2Ll5G%kqg_vqbnsfJ`vp;DE6Jpmzmj
>>
>> If the change affects other tables besides APIC (IORT and FACP in this series),
>> then I think that's the moment to update all the correct blobs (final versions)
>> and drop the list of blobs in bios-tables-test-allowed-diff.h. I also think it's
>> better to list all the table diffs in the commit message, not only the diff for
>> the APIC table.
> 
> When following the script steps with V=2, I only see diff change in the
> MADT table.

I was thinking of the case if empty blobs were added to 1/5. Indeed, FACP table does
not change, sorry for the confusion.

After the fix just APIC table changes, so the patch is correctly listing it in the
commit message and removing it from the "ignore list".

However, as I mentioned in 3/5, the IORT table is being gated as well by its_enabled(),
so after the fix no IORT table is generated by QEMU, hence tests/qtest/bios-tables-test.c
never sees/loads any IORT table to compare against IORT.its_off added in 1/5. There are
no test failures but IORT.its_off is a "dead blob". I think it should be removed in this
patch just like APIC table blob is updated, for consistence.


Cheers,
Gustavo
  
> Igor, am I missing something?
> 
>>
>> Cheers,
>> Gustavo
> 

