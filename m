Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3351973njd;
        Wed, 2 Apr 2025 03:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOGp3jeXu3IkKS8q8gDHaupbvyMaGaOJ8uWKY/si2IjBxaDOJL17UIugWpH4inN81D84E1G07jwjwzzw==@linaro.org
X-Google-Smtp-Source: AGHT+IEl+k8o9Rk2rfATRKZHcBlHF8WjAVf2fK2dwYpQXroHLjzFhs2vSjZh92Trc24NQn/qln4C
X-Received: by 2002:a05:622a:188c:b0:476:add4:d2bf with SMTP id d75a77b69052e-477e4b8bae0mr219218511cf.22.1743590086208;
        Wed, 02 Apr 2025 03:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743590086; cv=none;
        d=google.com; s=arc-20240605;
        b=LL1k6gJCFKOTjXuNE39uxCyPVs66i0BT0Vv8+bzy5AgtfLfrHWlLxWzqJUmg3avDwe
         hplHtXGLsfLn0iwNfZ3g2QpeqF+AmVlA6Ght4j/e4z1FXUZuwB5qIdo7v0O/DyGVF2sO
         coqwbkpYXb0LOGYzTN69Mq18LaBTLqJAE3Y++igm55sxaMkhw1xRqK5o8uAyRfxM9zeM
         6RiYoSVXdC87in0G1xBDAyT1LKlf7XCcOCAvXny16zFR9/4oeLCZccphRbJcMJDjVPB3
         jr/QCh9rzktgerOR+FcctNuVZRtgjIlO8+6/tnHagPsXa02smxNhfMnL5Ug11SzJMqHe
         pgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zjqm5otoX3blaef8ZeheL7iB1TbA1gOguF8Ug2ztT/A=;
        fh=Rnca5bfpKAL/sVIDMWcONjg6d3t7+FVGs9lcGTPX/wc=;
        b=RETeX4P0SnA1SB0lqDbAMEIrzzjaQYKUPR6UWofeZm9FKRiw9D1RdKyIce/s9oBp5p
         P3tPeOk9BD/4oL1//QjFIRvVBc1JsRLh6R7jTRyIzuhrCaa1BBqxOUu9cllIyrglWES0
         JcfmvTv8lbH1Q2yYVCE6lUM1XyKrreCSlIYW7M3KoKPJwjuWXg1aANW3p6mML/hCazTN
         //cXQMsoVDGOJYuRsWPqmAc9VlbG8cu/UFpmTp4NRb5qB/zMKqZp2JH8BKfJDI0zBv+6
         U+AwrbYow0WqzY34lxWzP0PCn7x1s6GFX0AkFCetUuxaVk+HfaCFfrrLIDibqOromlFu
         9gPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQPDAwrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47782a56a5csi104236841cf.177.2025.04.02.03.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 03:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQPDAwrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzvQY-00006Y-NI; Wed, 02 Apr 2025 06:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzvQO-00005w-Bi
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 06:34:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzvQM-0000MD-2b
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 06:34:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso420039f8f.1
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743590060; x=1744194860; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zjqm5otoX3blaef8ZeheL7iB1TbA1gOguF8Ug2ztT/A=;
 b=YQPDAwrQX6FvAkexpJFpXcWqxlBM1IphTQ4Tt7aSKqWNMKZ/2IiizkFteEbwk4cN7G
 Tu3zghSA0nswklt2jLOGTovhGOkLv6ru47eXHYprCkck9nl1HipsKa6HEvkVbH/xjvLk
 wLWNSGUI++avmxlVlgzbFbQOXPncbnz3jQhsyvdZsz3dlvbRVEn4HcQwXW35gAqhYAEM
 UbA/V81qEQZj7BskmhQMc7SaEbv/G0pdDKluTCz2FH+2Pe2eVk0wZMejKffkZ1xDhuGO
 zm78FIqS584fsXWSNXornRoRzA54+aoLD+6l41dw1uLL3QtcGRKTtit3cteXilak97SL
 spnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743590060; x=1744194860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zjqm5otoX3blaef8ZeheL7iB1TbA1gOguF8Ug2ztT/A=;
 b=Ngkplcqvgq+hbSuWE/k5MiHGQkkdnmgBC9ARyw2dUTB3gRGhVccun9b4NwLMEEQlfd
 dDZEnyo/vHsup1IkduOFq1kuALVjXclfGEKiFzU8JEe237tWk431qHfaIjr7NtBLLAeY
 iRXY0epHuVuBmZgo9fW9HM9pPYcuCIdWEfS3VE26Kwr/n+fNl11Qu+0nNQc/7gHYOWtx
 jw4zL6Ho/lwT3wanuRLuAHcp8W1ZUnW+zappBQ7uVPOlyzLgyCtylHlx6h75C+0bl12t
 HZAHBc5A/MtrnbWlSfNLak3J+j6NC/DldSvngut2UgUeY1duZSQs8a0SpJZUOj+Zzeaa
 yW2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHzUqOq8Qj5Fnz9Tm2t5tLXln1vNGSC/6yLClriISVhiDbZEheSmbacrbPbklh7lycpv02S4JlVg==@nongnu.org
X-Gm-Message-State: AOJu0YzhIkxqCYl6AhYlIjkfQrSThlz1hiW9zHyRGeQQ90nd/H/OVG8u
 hrNx8iIBJPpawOTl6ZUZoFYtqZK3q0DFEbNMGVvtBHczWG54XCWx1wbkSSqFHfs=
X-Gm-Gg: ASbGnctO6RvWzvK5RHRso5pc0l/DFSfJvTFT/aCJMQY8Zq3fXJVEGcwF86GP33jzzxz
 8J+DBDMOAZEYlxd1c5U+ihzZY9xgmekFoAvaG9FdqEmk6U+Ec44HBZN02vLciZSpr8sCPdsyql0
 ODxSpl1nwzoKNkpQKEwGaTwxv/9bJrwKog53RcCK66VIfybzahxdVDNPKZxMkz6X9kj6xugM2T4
 Gez06LOK4hkrlvysSI1+N0g5EVKnCtAhVR8auG2zCgRDicz6CJyXJfirU9asP8CqzKLZvFDCRmC
 jocFjUoNE44SuV2r7ng8czXRxdpePRCVkjrhL4zhh6gtoZXf8quQl/izyug8THaBKeIwIisMK7v
 OoIvPljJfUFsf
X-Received: by 2002:a05:6000:40d9:b0:39c:cc7:3c93 with SMTP id
 ffacd0b85a97d-39c2a67875emr1362429f8f.18.1743590060390; 
 Wed, 02 Apr 2025 03:34:20 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b663860sm16765603f8f.39.2025.04.02.03.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:34:19 -0700 (PDT)
Message-ID: <b34b6ab3-ac42-4d94-a30d-0d8ebed960f5@linaro.org>
Date: Wed, 2 Apr 2025 12:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 5/5] qtest/bios-tables-test: Update
 aarch64/virt/APIC.its_off blob
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-6-philmd@linaro.org>
 <98b286c5-f48f-4dec-b6c7-3e1ca2156735@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <98b286c5-f48f-4dec-b6c7-3e1ca2156735@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: dBFCzLLc3S4p

On 2/4/25 08:45, Gustavo Romero wrote:
> Hi Phil,
> 
> On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
>> Changes in the tables:
>>
>>    @@ -1,32 +1,32 @@
>>     /*
>>      * Intel ACPI Component Architecture
>>      * AML/ASL+ Disassembler version 20240927 (64-bit version)
>>      * Copyright (c) 2000 - 2023 Intel Corporation
>>      *
>>      * Disassembly of tests/data/acpi/aarch64/virt/APIC.its_off
>>      *
>>      * ACPI Data Table [APIC]
>>      *
>>      * Format: [HexOffset DecimalOffset ByteLength]  FieldName : 
>> FieldValue (in hex)
>>      */
>>
>>     [000h 0000 004h]                   Signature : "APIC"    [Multiple 
>> APIC Description Table (MADT)]
>>    -[004h 0004 004h]                Table Length : 000000B8
>>    +[004h 0004 004h]                Table Length : 000000A4
>>     [008h 0008 001h]                    Revision : 04
>>    -[009h 0009 001h]                    Checksum : A7
>>    +[009h 0009 001h]                    Checksum : EE
>>     [00Ah 0010 006h]                      Oem ID : "BOCHS "
>>     [010h 0016 008h]                Oem Table ID : "BXPC    "
>>     [018h 0024 004h]                Oem Revision : 00000001
>>     [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>>     [020h 0032 004h]       Asl Compiler Revision : 00000001
>>
>>     [024h 0036 004h]          Local Apic Address : 00000000
>>     [028h 0040 004h]       Flags (decoded below) : 00000000
>>                              PC-AT Compatibility : 0
>>
>>     [02Ch 0044 001h]               Subtable Type : 0C [Generic 
>> Interrupt Distributor]
>>     [02Dh 0045 001h]                      Length : 18
>>     [02Eh 0046 002h]                    Reserved : 0000
>>     [030h 0048 004h]       Local GIC Hardware ID : 00000000
>>     [034h 0052 008h]                Base Address : 0000000008000000
>>     [03Ch 0060 004h]              Interrupt Base : 00000000
>>    @@ -49,37 +49,29 @@
>>     [06Ch 0108 008h]    Virtual GIC Base Address : 0000000000000000
>>     [074h 0116 008h] Hypervisor GIC Base Address : 0000000000000000
>>     [07Ch 0124 004h]       Virtual GIC Interrupt : 00000019
>>     [080h 0128 008h]  Redistributor Base Address : 0000000000000000
>>     [088h 0136 008h]                   ARM MPIDR : 0000000000000000
>>     [090h 0144 001h]            Efficiency Class : 00
>>     [091h 0145 001h]                    Reserved : 00
>>     [092h 0146 002h]      SPE Overflow Interrupt : 0000
>>     [094h 0148 002h]              TRBE Interrupt : 100E
>>
>>     [094h 0148 001h]               Subtable Type : 0E [Generic 
>> Interrupt Redistributor]
>>     [095h 0149 001h]                      Length : 10
>>     [097h 0151 002h]                    Reserved : 0000
>>     [098h 0152 008h]                Base Address : 00000000080A0000
>>     [0A0h 0160 004h]                      Length : 00F60000
>>
>>    -[0A4h 0164 001h]               Subtable Type : 0F [Generic 
>> Interrupt Translator]
>>    -[0A5h 0165 001h]                      Length : 14
>>    -[0A7h 0167 002h]                    Reserved : 0000
>>    -[0A8h 0168 004h]              Translation ID : 00000000
>>    -[0ACh 0172 008h]                Base Address : 0000000008080000
>>    -[0B4h 0180 004h]                    Reserved : 00000000
>>    +Raw Table Data: Length 164 (0xA4)
>>
>>    -Raw Table Data: Length 184 (0xB8)
>>    -
>>    -    0000: 41 50 49 43 B8 00 00 00 04 A7 42 4F 43 48 53 20  // 
>> APIC......BOCHS
>>    +    0000: 41 50 49 43 A4 00 00 00 04 EE 42 4F 43 48 53 20  // 
>> APIC......BOCHS
>>         0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // 
>> BXPC    ....BXPC
>>         0020: 01 00 00 00 00 00 00 00 00 00 00 00 0C 18 00 
>> 00  // ................
>>         0030: 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00 
>> 00  // ................
>>         0040: 04 00 00 00 0B 50 00 00 00 00 00 00 00 00 00 
>> 00  // .....P..........
>>         0050: 01 00 00 00 00 00 00 00 17 00 00 00 00 00 00 
>> 00  // ................
>>         0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
>> 00  // ................
>>         0070: 00 00 00 00 00 00 00 00 00 00 00 00 19 00 00 
>> 00  // ................
>>         0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
>> 00  // ................
>>         0090: 00 00 00 00 0E 10 00 00 00 00 0A 08 00 00 00 
>> 00  // ................
>>    -    00A0: 00 00 F6 00 0F 14 00 00 00 00 00 00 00 00 08 
>> 08  // ................
>>    -    00B0: 00 00 00 00 00 00 00 
>> 00                          // ........
>>    +    00A0: 00 00 F6 00                                      // ....
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>>   tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 184 -> 164 bytes
>>   2 files changed, 1 deletion(-)
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/ 
>> qtest/bios-tables-test-allowed-diff.h
>> index bfc4d601243..dfb8523c8bf 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,2 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/aarch64/virt/APIC.its_off",
>> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/ 
>> acpi/aarch64/virt/APIC.its_off
>> index 
>> c37d05d6e05805304f10afe73eb7cb9100fcccfa..f24ac8fbff5261a52434abcfcff96dbdc7709de4 100644
>> GIT binary patch
>> delta 18
>> ZcmdnNxP+0*F~HM#2?GNI%e#qOvj8xy1yKM1
>>
>> delta 39
>> jcmZ3&xPy_)F~HM#2Ll5G%kqg_vqbnsfJ`vp;DE6Jpmzmj
> 
> If the change affects other tables besides APIC (IORT and FACP in this 
> series),
> then I think that's the moment to update all the correct blobs (final 
> versions)
> and drop the list of blobs in bios-tables-test-allowed-diff.h. I also 
> think it's
> better to list all the table diffs in the commit message, not only the 
> diff for
> the APIC table.

When following the script steps with V=2, I only see diff change in the
MADT table.

Igor, am I missing something?

> 
> Cheers,
> Gustavo

