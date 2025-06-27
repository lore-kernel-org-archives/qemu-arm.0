Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp979251dye;
        Fri, 27 Jun 2025 08:33:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMbuOXsoWkcJh62eB9Z+uKTpR3W6XGNx8hQDoK/ia8IQKQ+SbyU6jnerWyhj/wUjNWLdU9yzZic2T2Pw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsShwSQeVIc7R0fafWtVGQVbxw0C/SvtYg8TeKcmyk9Qm6wwqmZvnIZz4/Pzt7zphF52Dw
X-Received: by 2002:ad4:5ae8:0:b0:6fa:c81a:6202 with SMTP id 6a1803df08f44-700036ae7cdmr61331696d6.29.1751038383034;
        Fri, 27 Jun 2025 08:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751038383; cv=none;
        d=google.com; s=arc-20240605;
        b=h0LGdn268WJv+tYSmB3toaQAhov6xbc0A784SkkB6h4mepbkMRAHRs3otoUOh3ocFJ
         BsDy70oJIfbsEa5xhDLY8uoVy4Q/NDWBabqOBcU1/x3/OjjAo2gI1ju4SYUygNu1b/ys
         s4tUduhDnoaO80Y1hcQypy16/vMawa4dJznuhf8aSmCpm29NAS+ogMOuJsKZpGjoog3w
         QP25sGdWlRPQvrXyojn3VeUitPQJAXqb/Kgk2Uwm79kGqLSVb0qKMduRkeISRvHS1yaY
         XKhf8qKEbQb1ac7PbAT/rZj+fR7czQurvZMZulbgoAdxmjVBRGYDXB2B/+b+zdf1oPEN
         QZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=n85c+fKIADcqu3bqGUuNCT2Q53aJTQeyoEktYXoDZl0=;
        fh=tNSsf3XjzuxugmAzkYdksfFYJm4lAuNVxsvN58vOOYg=;
        b=YRkxZt2u+k/h0He54e+3aCbHNcFyz3OKLRElaipXjN3Awyy94CfNZlq5+nkmamAsVr
         d0kkEzvT+cg3CcKtrixrICTFQxkuT8hI8l1FqmCjhsZ93w8He1BzSGYEeWRKRNI/7tMq
         BdhykSrs0EyQ4ZNIaoxNbYCIo/s/HZK2c+3PYbvlDfBpaRgvz1HWhZRqSoys4Dt9aeVn
         DXPYcedGaI4tqTpyvBrYZo3fG3qSpdo6v3aYXjG5Ve6Z3YZO0oxPA8uFaNBL131RDLJE
         ddZR6nrKHmOWYTOGYsXgyqrhCmpNbQmOBX+7kgs49iRxVH5DnDuL2YTj7uX9VfXN2WJa
         yUVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d4ZBKMZe;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77380696si41578696d6.341.2025.06.27.08.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d4ZBKMZe;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751038382;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n85c+fKIADcqu3bqGUuNCT2Q53aJTQeyoEktYXoDZl0=;
	b=d4ZBKMZeZwAHf9C2If6oKRavJHP2Vx0qJyfHPyhCyAy9Ui/iB2B4Gt3ljNsz43dxx6HLMU
	9P5HOBKwTT+Ik2W+XSxlteE4PqL70jp5EOz4tU51xzRSUaKJzIvA9gtrlUlu1UtD4+SC0V
	55/ADmleva0pc/WVc8DNIHdy7sjrGi0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-kV8yWZKkOa6XGP-crubiDg-1; Fri, 27 Jun 2025 11:33:01 -0400
X-MC-Unique: kV8yWZKkOa6XGP-crubiDg-1
X-Mimecast-MFC-AGG-ID: kV8yWZKkOa6XGP-crubiDg_1751038380
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so939441f8f.1
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 08:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038380; x=1751643180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n85c+fKIADcqu3bqGUuNCT2Q53aJTQeyoEktYXoDZl0=;
        b=nlIhy4bDbKd5gCabMYtP8Ihcai7AczVqi51WAo2vqcvTCAEsM11A5AZAWZUIUa3Pth
         ItPgkiudjybNsZjRCaLU+o0rYT/ItW0Nlmzo57s9RAmJbHp2wZpV6+Aom/Xbchp/HJ95
         01YYpPrnXkj4AEXguaFKQ7LcRy/jXfjir0ho7PTx31BzCGi5n4z8aM98+x+uYDRVDfeU
         Wk+ukOqWJdOYh/x5uVjB1kCyNBkJhfRvUnbBO8vwqArOboFIEWW+Q8ACaA3fP1WH/rqC
         2QMnnPvgbFj1upoq7A9iRWEtwnuExN3YCdJnK/erdkePtMbJhtoHHVn+bbVTTsZT6NZv
         DJeA==
X-Forwarded-Encrypted: i=1; AJvYcCUlnoGcSbEr7jy0PPJ6glXo6Io/kB0/r1T64NfVE2J+MWCWSYcBosqRFp58NA5WT30ebtsf3xE0tl+GhA==@linaro.org
X-Gm-Message-State: AOJu0YxAMYn8vd1dyNgzVNRTREU8fukf2Smg9GPhGCVpyy97FMfHMleH
	3QZgzfKzJEyaafE5a5BqBQWfuqJNOBYC9AgQwL5mLrNr70B+p7mikhwP75VGO4GVESxfRQZxGdz
	OuftdZ2qvAVblvTv5yr/4lbTcAa8nlocjAB0uUwzjh0bquE4z4FDMkxj5Jg==
X-Gm-Gg: ASbGncuGsuLQ9/IfKE75tt8Mxgf6BvZoVNqWMONcfEy363BPtGkFTMtyK+hfJUv8wny
	s0NL/oVyWKYcMT2xKLyua8M5i2KtM0o0+CZ7cNUhoH/7/eMPdgQvULNSxtFQPtB9YBGofbp9HHU
	f6v8QKCuNFP615S9HRlsqM+XrATnQYraewSFPTFoMobQzRbukRqbcSHY3boK//PhQA3H8XnMQyB
	USuNRhE9bQssPkkJllZEx3BIMcyK9ata8QBmgbPKD2elNBlxYz/C3TvVcGbf0s9SbVqyXB+TnKc
	kLvV12FZXzp2kMYo6VZTvJQ2P1wTGx8IinyRjAEaKt9w29pRUV1xVxBmgkV/KtbLHvYD3w==
X-Received: by 2002:a05:6000:2307:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3a8fdff46e4mr3628389f8f.15.1751038379951;
        Fri, 27 Jun 2025 08:32:59 -0700 (PDT)
X-Received: by 2002:a05:6000:2307:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3a8fdff46e4mr3628363f8f.15.1751038379471;
        Fri, 27 Jun 2025 08:32:59 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7098sm2962670f8f.4.2025.06.27.08.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:32:58 -0700 (PDT)
Message-ID: <f0969147-78e9-4f46-a951-3c2fdf9f7d4d@redhat.com>
Date: Fri, 27 Jun 2025 17:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 7/9] qtest/bios-tables-test: Add blobs for its=off test
 on aarch64
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-8-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623135749.691137-8-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OgGPhrcHYdAeoVjfQcD5bz5rpYvGa1jxcm6_OyvlT1c_1751038380
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: PnmRvb87Bwwt



On 6/23/25 3:57 PM, Gustavo Romero wrote:
> Add blobs for test_acpi_aarch64_virt_tcg_its_off(), which introduces a
> new variant, .its_off, that requires variations of the MADT and IORT
> tables.
>
> MADT (aka APIC) diff:
>
> +[000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
> +[004h 0004   4]                 Table Length : 000000B8
> +[008h 0008   1]                     Revision : 04
> +[009h 0009   1]                     Checksum : C1
> +[00Ah 0010   6]                       Oem ID : "BOCHS "
> +[010h 0016   8]                 Oem Table ID : "BXPC    "
> +[018h 0024   4]                 Oem Revision : 00000001
> +[01Ch 0028   4]              Asl Compiler ID : "BXPC"
> +[020h 0032   4]        Asl Compiler Revision : 00000001
> +
> +[024h 0036   4]           Local Apic Address : 00000000
> +[028h 0040   4]        Flags (decoded below) : 00000000
> +                         PC-AT Compatibility : 0
> +
> +[02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
> +[02Dh 0045   1]                       Length : 18
> +[02Eh 0046   2]                     Reserved : 0000
> +[030h 0048   4]        Local GIC Hardware ID : 00000000
> +[034h 0052   8]                 Base Address : 0000000008000000
> +[03Ch 0060   4]               Interrupt Base : 00000000
> +[040h 0064   1]                      Version : 03
> +[041h 0065   3]                     Reserved : 000000
> +
> +[044h 0068   1]                Subtable Type : 0B [Generic Interrupt Controller]
> +[045h 0069   1]                       Length : 50
> +[046h 0070   2]                     Reserved : 0000
> +[048h 0072   4]         CPU Interface Number : 00000000
> +[04Ch 0076   4]                Processor UID : 00000000
> +[050h 0080   4]        Flags (decoded below) : 00000001
> +                           Processor Enabled : 1
> +          Performance Interrupt Trigger Mode : 0
> +          Virtual GIC Interrupt Trigger Mode : 0
> +[054h 0084   4]     Parking Protocol Version : 00000000
> +[058h 0088   4]        Performance Interrupt : 00000017
> +[05Ch 0092   8]               Parked Address : 0000000000000000
> +[064h 0100   8]                 Base Address : 0000000000000000
> +[06Ch 0108   8]     Virtual GIC Base Address : 0000000000000000
> +[074h 0116   8]  Hypervisor GIC Base Address : 0000000000000000
> +[07Ch 0124   4]        Virtual GIC Interrupt : 00000000
> +[080h 0128   8]   Redistributor Base Address : 0000000000000000
> +[088h 0136   8]                    ARM MPIDR : 0000000000000000
> +[090h 0144   1]             Efficiency Class : 00
> +[091h 0145   1]                     Reserved : 00
> +[092h 0146   2]       SPE Overflow Interrupt : 0000
> +
> +[094h 0148   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
> +[095h 0149   1]                       Length : 10
> +[096h 0150   2]                     Reserved : 0000
> +[098h 0152   8]                 Base Address : 00000000080A0000
> +[0A0h 0160   4]                       Length : 00F60000
> +
> +[0A4h 0164   1]                Subtable Type : 0F [Generic Interrupt Translator]
> +[0A5h 0165   1]                       Length : 14
> +[0A6h 0166   2]                     Reserved : 0000
> +[0A8h 0168   4]               Translation ID : 00000000
> +[0ACh 0172   8]                 Base Address : 0000000008080000
> +[0B4h 0180   4]                     Reserved : 00000000
>
> IORT diff:
>
> +[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
> +[004h 0004   4]                 Table Length : 000000EC
> +[008h 0008   1]                     Revision : 03
> +[009h 0009   1]                     Checksum : 57
> +[00Ah 0010   6]                       Oem ID : "BOCHS "
> +[010h 0016   8]                 Oem Table ID : "BXPC    "
> +[018h 0024   4]                 Oem Revision : 00000001
> +[01Ch 0028   4]              Asl Compiler ID : "BXPC"
> +[020h 0032   4]        Asl Compiler Revision : 00000001
> +
> +[024h 0036   4]                   Node Count : 00000003
> +[028h 0040   4]                  Node Offset : 00000030
> +[02Ch 0044   4]                     Reserved : 00000000
> +
> +[030h 0048   1]                         Type : 00
> +[031h 0049   2]                       Length : 0018
> +[033h 0051   1]                     Revision : 01
> +[034h 0052   4]                     Reserved : 00000000
> +[038h 0056   4]                Mapping Count : 00000000
> +[03Ch 0060   4]               Mapping Offset : 00000000
> +
> +[040h 0064   4]                     ItsCount : 00000001
> +[044h 0068   4]                  Identifiers : 00000000
> +
> +[048h 0072   1]                         Type : 04
> +[049h 0073   2]                       Length : 0058
> +[04Bh 0075   1]                     Revision : 04
> +[04Ch 0076   4]                     Reserved : 00000001
> +[050h 0080   4]                Mapping Count : 00000001
> +[054h 0084   4]               Mapping Offset : 00000044
> +
> +[058h 0088   8]                 Base Address : 0000000009050000
> +[060h 0096   4]        Flags (decoded below) : 00000001
> +                             COHACC Override : 1
> +                               HTTU Override : 0
> +                      Proximity Domain Valid : 0
> +[064h 0100   4]                     Reserved : 00000000
> +[068h 0104   8]                VATOS Address : 0000000000000000
> +[070h 0112   4]                        Model : 00000000
> +[074h 0116   4]                   Event GSIV : 0000006A
> +[078h 0120   4]                     PRI GSIV : 0000006B
> +[07Ch 0124   4]                    GERR GSIV : 0000006D
> +[080h 0128   4]                    Sync GSIV : 0000006C
> +[084h 0132   4]             Proximity Domain : 00000000
> +[088h 0136   4]      Device ID Mapping Index : 00000000
> +
> +[08Ch 0140   4]                   Input base : 00000000
> +[090h 0144   4]                     ID Count : 0000FFFF
> +[094h 0148   4]                  Output Base : 00000000
> +[098h 0152   4]             Output Reference : 00000030
> +[09Ch 0156   4]        Flags (decoded below) : 00000000
> +                              Single Mapping : 0
> +
> +[0A0h 0160   1]                         Type : 02
> +[0A1h 0161   2]                       Length : 004C
> +[0A3h 0163   1]                     Revision : 03
> +[0A4h 0164   4]                     Reserved : 00000002
> +[0A8h 0168   4]                Mapping Count : 00000002
> +[0ACh 0172   4]               Mapping Offset : 00000024
> +
> +[0B0h 0176   8]            Memory Properties : [IORT Memory Access Properties]
> +[0B0h 0176   4]              Cache Coherency : 00000001
> +[0B4h 0180   1]        Hints (decoded below) : 00
> +                                   Transient : 0
> +                              Write Allocate : 0
> +                               Read Allocate : 0
> +                                    Override : 0
> +[0B5h 0181   2]                     Reserved : 0000
> +[0B7h 0183   1] Memory Flags (decoded below) : 03
> +                                   Coherency : 1
> +                            Device Attribute : 1
> +[0B8h 0184   4]                ATS Attribute : 00000000
> +[0BCh 0188   4]           PCI Segment Number : 00000000
> +[0C0h 0192   1]            Memory Size Limit : 40
> +[0C1h 0193   3]                     Reserved : 000000
> +
> +[0C4h 0196   4]                   Input base : 00000000
> +[0C8h 0200   4]                     ID Count : 000000FF
> +[0CCh 0204   4]                  Output Base : 00000000
> +[0D0h 0208   4]             Output Reference : 00000048
> +[0D4h 0212   4]        Flags (decoded below) : 00000000
> +                              Single Mapping : 0
> +
> +[0D8h 0216   4]                   Input base : 00000100
> +[0DCh 0220   4]                     ID Count : 0000FEFF
> +[0E0h 0224   4]                  Output Base : 00000100
> +[0E4h 0228   4]             Output Reference : 00000030
> +[0E8h 0232   4]        Flags (decoded below) : 00000000
> +                              Single Mapping : 0
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric
> ---
>  tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
>  tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 --
>  3 files changed, 2 deletions(-)
>  create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
>
> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..37d82e970b1331cb5b259f0bd2d3654bacb2d623
> GIT binary patch
> literal 184
> zcmZ<^@O0k6z`($A(8=G~BUr&HBEVSz2pEB4AU24G0Uik$i-7~iVg@p}17JJ`2AFzr
> Zgb>LrJ^_#xE~p*f82CkCMsUFG1ppOZ2>}2A
>
> literal 0
> HcmV?d00001
>
> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849baf568a8e93e426738
> GIT binary patch
> literal 236
> zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=RgMkDCNC*yK9F_<M77!bR
> zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@
> R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
>
> literal 0
> HcmV?d00001
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index a88198d5c2..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,3 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/aarch64/virt/APIC.its_off",
> -"tests/data/acpi/aarch64/virt/IORT.its_off",
