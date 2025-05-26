Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4100391njc;
        Mon, 26 May 2025 03:25:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFCZr0UMtnEt+UDlF6EmGvB5m2bedPmkz8NlpODRTTPuHGZEV2puHRifr138HkN9GTnQUTb4uJYUyWZw==@linaro.org
X-Google-Smtp-Source: AGHT+IFJJJKjvWm4OC7XIEQSsUOhC13izi6pXNBL491OycbDucIY25g6zQNYRQFyLrJwX3aRvOsi
X-Received: by 2002:a05:620a:2945:b0:7ca:f4e8:9089 with SMTP id af79cd13be357-7ceec4250e3mr1381479685a.11.1748255155165;
        Mon, 26 May 2025 03:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748255155; cv=none;
        d=google.com; s=arc-20240605;
        b=GCu6vomAHrwZSUjy/aq4QvR2fymTMOWop1NbrmXIVe8TlVI4nAj5v+p4tSP9YyAQ9F
         KTpLEQbN/2RSbdGVgfLOmxLUsoZpIxtqpyDPeA4O9yCy8CLa96Ib4PVKIs094Tyc4Pcv
         dGgQbtyJO73uQQlrZJyw0zy4P5dTwM3HjEGGWa4ULTHOUsHGdkBfNYcnsmsQyfC8WSvW
         Uxk7IiO/lN81oV3vQQN9odnay8ts/EDL9hY/cr4pbywOYMunVaOQTvHb/+g+tfkBHoTj
         U3TeGBIaSTg/yakIqqWKktmcGaSpiMoWf8t2e06U28gJs6XWRTtmKN+tMXnOIBeq1IEp
         WWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=0ay/3JkvPHqcSa/Y430bkvRb1m2l+AMz9uqdyBx/QH8=;
        fh=V5S4+5PDjc5xziOs78ys7fQaiud9vp5zHrVIgFDJJ4Q=;
        b=iaRdBo+5H0VNV8yeyrMu7vElHrDcciDi3YAYGcK0Hr+4UPRjl1S//rV9s2RkNP0b5N
         RXaNAcq8YDc0aDRXftTYHs4/+Uv6CDxWgivmVqaP/BLwVfCMiaVGPCel4W+AVdRU+Pql
         4ESHCd1+D9zAiuxltDM7BIqjjCD6nAxia8/Jthnmc5lkkE151U8aLDLKwQoh/RtMLPZK
         +M7AwG+Y94NVsfPSSTfNsR3nnpnRB0bwwsnVQgK3im3vAdFFtxV32pOiQlR1WYxu/NXN
         uAcKTwLCr17aOYCxjkhVxN7vUK27lQ01hUWvwLFTZRx0p8Cg6GEjGrvdnCWagxU/YHv2
         ItUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GjyEHl9o;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467e8d80si2313721385a.162.2025.05.26.03.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GjyEHl9o;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748255154;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ay/3JkvPHqcSa/Y430bkvRb1m2l+AMz9uqdyBx/QH8=;
	b=GjyEHl9oyz1PV/IWjlqr4J2TsZRA1R3lLQIQgi9k+nmJD9bO7j8CpUMDq7e6J1BoMs7/Z5
	XsLdNE7NWjn028ppVpt7htQjHd2HHjJpc9NM2HggjSTaIgOC76cUYokITsH3VyBu8bOf/g
	vJbe0+N1WXT5P5gZhaTI4qOs2uygSbY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-8ejyPGKMME-LV89ftdOBkA-1; Mon, 26 May 2025 06:25:53 -0400
X-MC-Unique: 8ejyPGKMME-LV89ftdOBkA-1
X-Mimecast-MFC-AGG-ID: 8ejyPGKMME-LV89ftdOBkA_1748255152
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso15221185e9.1
        for <alex.bennee@linaro.org>; Mon, 26 May 2025 03:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748255152; x=1748859952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ay/3JkvPHqcSa/Y430bkvRb1m2l+AMz9uqdyBx/QH8=;
        b=UDm/6WKIaCvcoHU3fv07qM+OiJ50MRMdhebI6HnzL+RJT5k8KxRtiVGGUS741qeVp6
         XfQ885rVZKe1KgORrVMj2o+Dbe9UsXSAY2CHIc8E1rNpFVrF9rWNtFfeI+TH58gfFTZG
         4NYeI1jkRIP81WB4mV7NKYHuUzyuyjjHC9N0l9DIgfB1eTyN2r8Othbf/fsF2KCcAGb/
         1L9jtstMx0xnEr2yvVAcYvSURy/rfZfxPg93/f+L4EbWT5wnG70XrZ89Zxsgb8mXKlzO
         RXyjqjRvdarOBIthiaIWNgNijLT37gXHE2C0kCMBJO5xVthRNsAr/Gi4a1yfkwksQUSY
         D5vw==
X-Forwarded-Encrypted: i=1; AJvYcCW8kx+U/WZOUjz4CmBU+1i8Doj7w/rY8fKrS5wt//qAY4jZo2YYwrs/5VgOwwNnAQ9m1TuVwnhcS/FgPw==@linaro.org
X-Gm-Message-State: AOJu0YymafwXGjYYRHhY4APIwX6sxUBLB+3ssKbHuIrbV1XexZXe+8fG
	HDQRw2er52yYn5VMak1pjOqx4GDS9VAuWUAFhqErDrguJWF5bnl7xVm7qOTfHcw2E/LR7139n/P
	i66WW73I8vvuCqygU+bkUQO/cxY5J2jo8dBssLXNTphCP2hi+9Doe+GmKWg==
X-Gm-Gg: ASbGnctqMx9ZWymIMmxdA36UPuktKgGwN9wLVDcMfHOKbJRpFWpN5LkRW51A2PFh96N
	BHRiVKLYJEvrYkTN8guu4t6Q8I6qaf1d6soYR0shymAOVJXrDwQpBG0QHp4VZ9BmpzeaJErXFNQ
	Hb2mPBrqVwHzdQmffVDIUpZLZP/qJB8pDPpqKyG6l7mcJIVyBRCT0lqLFG5GTMXEBliR5GQYqve
	U+iymiZbA769M5tJA0WQ+RGmBzG8hp5NEHgtAeOxY30Pf31vo0xbjnHfccx31Uz60u3+HHfOEVJ
	loeAFNDS1YDF5EMHKvPwF74H8k4DhE92tEN7lY8n8FuOPWXvaXqFhJubvO0=
X-Received: by 2002:a05:6000:2892:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a4cf4101e6mr5974013f8f.6.1748255152360;
        Mon, 26 May 2025 03:25:52 -0700 (PDT)
X-Received: by 2002:a05:6000:2892:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a4cf4101e6mr5973989f8f.6.1748255151935;
        Mon, 26 May 2025 03:25:51 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d3332c01sm4663234f8f.92.2025.05.26.03.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 03:25:51 -0700 (PDT)
Message-ID: <fb728394-74f4-415d-9cb6-967526a86147@redhat.com>
Date: Mon, 26 May 2025 12:25:50 +0200
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250526053123.1434204-4-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wLZI0vwrXXXgngnpVrzsR2F7fE6w5v8HhCgMk7XckGM_1748255152
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: si2TU8kSxyfp

Hi Gustavo,

On 5/26/25 7:31 AM, Gustavo Romero wrote:
> Update the aarch64 'virt' base blob and all of its variants. All of them
> have the same diff, so only one is shown below. The essential changes is
> in the AML code of the _OSC (OS Capabilities) method, (variable name
> from 'CTRL' to 'Local0') and the scope for GED device.

Maybe we shall split the update into 2 steps
1) introduce/validate the changes related to _OSC first
2) produce the DSDT ref code with ACPI PCIHP hotplug elements

What do you think?

Eruc

>
> DSDT table diff:
>
>  DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>  {
>      Scope (\_SB)
>      {
>          Device (C000)
>          {
>              Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
>              Name (_UID, Zero)  // _UID: Unique ID
>          }
>
> @@ -1794,53 +1794,52 @@
>                      0x0000000000000000, // Granularity
>                      0x0000008000000000, // Range Minimum
>                      0x000000FFFFFFFFFF, // Range Maximum
>                      0x0000000000000000, // Translation Offset
>                      0x0000008000000000, // Length
>                      ,, , AddressRangeMemory, TypeStatic)
>              })
>              Name (SUPP, Zero)
>              Name (CTRL, Zero)
>              Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
>              {
>                  CreateDWordField (Arg3, Zero, CDW1)
>                  If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
>                  {
>                      CreateDWordField (Arg3, 0x04, CDW2)
>                      CreateDWordField (Arg3, 0x08, CDW3)
> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> -                    CTRL &= 0x1F
> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> +                    Local0 &= 0x1F
>                      If ((Arg1 != One))
>                      {
>                          CDW1 |= 0x08
>                      }
>
> -                    If ((CDW3 != CTRL))
> +                    If ((CDW3 != Local0))
>                      {
>                          CDW1 |= 0x10
>                      }
>
> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
> -                    Return (Arg3)
> +                    CDW3 = Local0
>                  }
>                  Else
>                  {
>                      CDW1 |= 0x04
> -                    Return (Arg3)
>                  }
> +
> +                Return (Arg3)
>              }
>
>              Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>              {
>                  If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>                  {
>                      If ((Arg2 == Zero))
>                      {
>                          Return (Buffer (One)
>                          {
>                               0x01                                             // .
>                          })
>                      }
>                  }
>
>                  Return (Buffer (One)
> @@ -1851,33 +1850,36 @@
>
>              Device (RES0)
>              {
>                  Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID
>                  Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>                  {
>                      QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
>                          0x0000000000000000, // Granularity
>                          0x0000004010000000, // Range Minimum
>                          0x000000401FFFFFFF, // Range Maximum
>                          0x0000000000000000, // Translation Offset
>                          0x0000000010000000, // Length
>                          ,, , AddressRangeMemory, TypeStatic)
>                  })
>              }
>          }
> +    }
>
> +    Scope (\_SB)
> +    {
>          Device (\_SB.GED)
>          {
>              Name (_HID, "ACPI0013" /* Generic Event Device */)  // _HID: Hardware ID
>              Name (_UID, "GED")  // _UID: Unique ID
>              Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>              {
>                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
>                  {
>                      0x00000029,
>                  }
>              })
>              OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
>              Field (EREG, DWordAcc, NoLock, WriteAsZeros)
>              {
>                  ESEL,   32
>              }
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5178 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5264 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6539 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7635 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5380 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>  6 files changed, 5 deletions(-)
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
> index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..5c73e64e0c29d3cea5299929afd00e9a1238e559 100644
> GIT binary patch
> delta 125
> zcmX@3u}g!?CD<jzN`!%dNoFFKG*h4XMs+tXCb!9(^SP`!1bx`!{ezuZy0RIZUBV3)
> z__0pjEu>{)oKT&>C7-ZBVAAAF##)dJ7YA5gc+zAbZJYoR699=7B!EN~@=P`s?&1(|
> P<BW+9c8Z_8SGXSlZJ{Hk
>
> delta 142
> zcmdm`aYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SP`!1l>5}{ezuZy0RIZUBV3)
> zc(702Eu`gV6dW25PyiG$b`A;hsRj{T@*r}7z@*8UjI|)OTpVB>Vv{Dr)Io#=K*9we
> U#USw|*$eq5OA2>QUM<`Y00vhni~s-t
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..b0a875d8da3592b5927095304ca31ceb001b2fdf 100644
> GIT binary patch
> delta 125
> zcmZ3aIYE=lCD<iof(Qcx(~F5*(o8M38`bA<F}Y3Ne3Z+YL(qpk-apuxr7N4k*(Ka?
> zfgkH+L18Tu<Amx2F8PE70+S|ZGS-4*xH!P_!jmQgY2yTlm;gwuAOR$@kY{qIa2JPw
> P8)r;>uv7eGVUd0S*;^zc
>
> delta 142
> zcmbQBxk!`CCD<iokq83=(~XH-(oDVX8`bA<F*!`#e3Z+YL(q*g-apuxr7N4k*(Ka?
> zfd~6!L18UFqu|hhfC8Y1v2#d}Pc?|(k_V9s1SU<+WUK|L<>CPA5Sug^rVb)301_?$
> UDF%rz$zI4eIbXPIGNVX80DOQd2mk;8
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
> index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..21a6b086cbf72298d125d8bfc4c4b7ec9315267b 100644
> GIT binary patch
> delta 126
> zcmbPh+-=O|66_MvEy=*ZWIK^dnyJrxqq-XxliTFY`CQf<f<El={=v>HUD*uIF5!j?
> z{8%UN7Sb{?PN+`cl22G5FllloV=YLAivuh#JZUnJHco(u34p{35<nsgc_teRcX0@~
> Q$Hl}4JH>C_EBt^J0I0kqp#T5?
>
> delta 143
> zcmeA+o@>nI66_K(SCWB&$z~##G*id)jp}Y(Ob$~w=W|(e2)c2``v*I-bY(L*yM!Aq
> z@L-?3TS&{#C^$4Apa3Xh>>Lv0Qw<`x<U!;Dfk~4y8EZjmxj4W&#3oIKse=d$fP@P`
> Vib3K_vKR7AmK5&Vyju7HD*$j8Du)07
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
> index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..c8548a5e5d41a843142c7bbe64580025e006445d 100644
> GIT binary patch
> delta 217
> zcmexwec77JCD<k8vMd7w)AEU2(oF3aH>$gFF?qIa&ga_8F6hG^?;q^U(v{8N>=JIc
> zz>jruo{W}>aYA(hmwdtkfk~4y8EZi@TpVC|;YpK$v~dDNOaLTSkN^@{$TRtwjP2%6
> gLVAo$Zj(1FiCA+`*X%A10XNQ=_+Y2_$py0g04PO4(EtDd
>
> delta 260
> zcmca?{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=X3347j)x{_YZbv>B?qsb_q9J
> z;K4rGR!GawC^$4Apa3Xh>>Lv0Qw<`x<U!;Dfk~4y8EZjmxj4W&#3oIKse=d$fP@P`
> oib3K_vKR7go-LHk$mB3}Glz&Z2VHEOJX^?i@_QNI$u6?}0Luzao&W#<
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
> index 029d03eecc4efddc001e5377e85ac8e831294362..73aa833317627204aef7ac858d178445bcd37a54 100644
> GIT binary patch
> delta 125
> zcmbQH)uP4a66_MfBFezPBruUnnyJHOqq+b$liTFYmfY4Hf<El={=v>HUD*uIF5!j?
> z{8%Tq3Tv4dCsZeJ$tNrjm^3+)u@)r5#Q~NVo-`Rq8z(@-1VCa12_TV$Jd^(lcX0@~
> PamK_4JH=0K7wHE8^splO
>
> delta 142
> zcmZqCnx@6&66_KpCd$CT#6OWsnyJx$qq+b$lf%@_mfY4Hf^MAg{=v>HUD*uIF5!j?
> zJlH3<3Tycp1&0O%6aYnxokN0rszC&oJcwK%FllloV=YK67YA5}*rdrYbr4|zkZ=J=
> UF-Uw#_CmhNkA=G?mx}ZQ0C4*#-~a#s
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index abe00ad4ee..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,6 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/aarch64/virt/DSDT",
> -"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> -"tests/data/acpi/aarch64/virt/DSDT.memhp",
> -"tests/data/acpi/aarch64/virt/DSDT.pxb",
> -"tests/data/acpi/aarch64/virt/DSDT.topology",
