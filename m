Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4799132njc;
        Tue, 27 May 2025 06:06:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt4866ED9K0P0ZQmpjYHtPDtng5wEE2RtzmF2XAezml0cP0UpebCX/5/TkdUv4dstCSo8Q2AIPn5CEkw==@linaro.org
X-Google-Smtp-Source: AGHT+IF2B+Ku0PzwSz33Wyjif0gpdplTEybUoAx/X2930NtCq4kUwaUcBZKw8+U73MuLBkvnLWvb
X-Received: by 2002:a05:651c:110c:b0:32a:6ccf:a45c with SMTP id 38308e7fff4ca-32a6ccfa5b8mr6939181fa.39.1748351163376;
        Tue, 27 May 2025 06:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748351163; cv=none;
        d=google.com; s=arc-20240605;
        b=la7C1b7RKW4If/pmhrLhfzMwaNOGnSAkZo9vWGu+4Vrho1ws6iY7i6U8XzTvuQJFyz
         TTHqm2fPiZKR9slE6v9wwxKFcKHv3qv0bHU0q0Se6gUU4fqWvWrg+oUN89FDx48drchB
         3eTZ2yGEmXZhkXXLeAGCOozGWiIdFouALQFwd12Cv2akpQzYEgAbfKTtXzxp7xAeI9vv
         DhfVPKPDWhhjxeZuQKIaDaeMCYfTQobYFL32LOVvtix2svcGf+xqEsCK/wocV1M3UBBU
         NXC5VAEBWJV+oK42y57TX2FVCGndV5Gc4IzRggUB21/et5Mhm0k86I9n9BD8xdLEye7p
         z0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=wJSb18eNQjK+1799of0iX18ofYOT/jN9CEhj+63eeBc=;
        fh=WBtzuP/bKtprno28IAkOhHKdlBoDc6ikD1g1A1hw+eQ=;
        b=Ww17tDyHJJ2Ag65Rm+VuqtYKcgyb2aqIyEcM7XQcnlw/VefyiTCUY5rb5WrG7ouU9Z
         RDPX8ef3WYeRjnKFdpx0i7OJG/7dczs8T2qbQ/OX/PyqxCsGPVe6Af7F7btjnsAGgrPs
         I9Dfyt+8H/GkzkOQs0NV2eNibz3EgmRC3B8Ftq+vqzBfO2mU0bGn8k61VB3CuV8Jv4Sx
         36CyLF9a7KW5kab+WGVoICoJ6kuWeeNwMmrmUSa/IWJXwSAuudfay5QnrJFSqOxKS0q9
         UNMhmyepcL5zdIOGW41u5SiUUjrZ8+2DRm1V2fQ9pOJ3X8Wo6qOmmWVL3fS20oLjk528
         vAcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WgsIz89f;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-32a67300810si11473511fa.121.2025.05.27.06.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WgsIz89f;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748351162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJSb18eNQjK+1799of0iX18ofYOT/jN9CEhj+63eeBc=;
	b=WgsIz89fSs+Cllag6hLr1BeeaH3AMnAMjHkKP+J9mOqup0+3b80GfHGKa8ew6h8kHQ/06X
	7u+CAZUcyoNWAyc0PSQD81uhZ4eESRqdUljbWRC0XjMg6LImQmeR9fIfXNaT7f7CT2idez
	QV0etrsm7jAIcxSIy2yTOUvFwHAggEI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-gN3n4MzLO4OwEWbuht75Wg-1; Tue, 27 May 2025 09:05:59 -0400
X-MC-Unique: gN3n4MzLO4OwEWbuht75Wg-1
X-Mimecast-MFC-AGG-ID: gN3n4MzLO4OwEWbuht75Wg_1748351158
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a36e6b7404so1837913f8f.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351158; x=1748955958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJSb18eNQjK+1799of0iX18ofYOT/jN9CEhj+63eeBc=;
        b=a0x1zRdPv9fUL25+jAa8Bf8maJfdatQZzdQ7gcFDoKWSBdsALHj6E6RJO73Kog2k50
         JrakE+Ibat4wdOQj3WJc1ao/6S3N0fM0ebbddNLe99pAOObQd5UU73qtajYvjLikMflz
         HEvUHycUJ2vKmddKG2vZvOkW5pvPdGHNuB6lagr/GHkf0w5IHqNbgk0/F3FYWiMkOyei
         K9zhTrDpkgLLOKiJWN1Fm0GoGlNdL/WB0QTJQCnS2XhJ6TC11dPr1gx/9r8JMk04Rrz7
         YByfrUjIZ5mO5i9cscIMgvwLaqNhwiSTJ11tev+BKj15ZA9Ynxp1+5PQ8mz8nMvokD5y
         Fw1A==
X-Forwarded-Encrypted: i=1; AJvYcCWm3WC9iOOzmuMSDrHXFzOPc1CIsNkvaz+qlb6W4Du8CzJQvgn/99/WPfmu32q1rArH34/a9WPw3Oq3Bg==@linaro.org
X-Gm-Message-State: AOJu0YwbtKOb6lesj39w+xNamH+3/x4DGq2op6CcWyJCd6dT1jh0FnIl
	R2jzPtBGd6My+0T09t9MG68y1C7R3kpBTN2DIk//MQBfbljsRAr+XkXWwgwqMyCTo0kvdsJRDAY
	rbHV2NXirUqkCGEd1jm2+U5Gr0NUDWEj1Q8eQD66zfRAsGHSD+RBJIUc+uA==
X-Gm-Gg: ASbGncvHAhP46FTmlRy8s3tkWXyAu6grDHEnDlMWqtuv7ATb+Av/u/t0IqpO2u3fbba
	Dj3+BSPPAuDxWHeOVc2uhzYQJHAqeWeUfj2OsUwnWznS+4yfTMbbhS5kPKL+JgIPCZ2fWP3caLZ
	t8HxZ6WdVtkex/8uez9D9DpDYhLyOkEg15KDlDCey4C0LUPWA1L/yIKfV2lNw97E6rfvVVW7cxP
	MpuZokYVIXcjyf/9VURksPUuZR9HCD8gxxjIa2XoUqjO+2DWWxz1vY55XvtmL6qtg7mswdChb0X
	62yx4NvGVIClypAgOpG7ETDNxVVs+m4h
X-Received: by 2002:a05:6000:2203:b0:3a4:dfa5:325e with SMTP id ffacd0b85a97d-3a4dfa53302mr4236299f8f.10.1748351157207;
        Tue, 27 May 2025 06:05:57 -0700 (PDT)
X-Received: by 2002:a05:6000:2203:b0:3a4:dfa5:325e with SMTP id ffacd0b85a97d-3a4dfa53302mr4236198f8f.10.1748351156395;
        Tue, 27 May 2025 06:05:56 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1fasm20133726f8f.1.2025.05.27.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:05:56 -0700 (PDT)
Date: Tue, 27 May 2025 15:05:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 10/25] tests/qtest/bios-tables-test: Update DSDT
 blobs after GPEX _OSC change
Message-ID: <20250527150554.0374eb71@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-11-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-11-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UpHKoKwp_LCFs6OU0WMRREGjiFmVkpjAIDaKC-y66h4_1748351158
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: /wrwauy5fiXa

On Tue, 27 May 2025 09:40:12 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Update the reference DSDT blobs after GPEX _OSC change.
> 
> DSDT diff can be found below.

this needs to be updated to take into account microvm

> 
>   *
>   * Disassembling to symbolic ASL+ operators
>   *
> - * Disassembly of dsdt.dat, Mon Apr  7 05:33:06 2025
> + * Disassembly of dsdt.dat, Mon Apr  7 05:37:20 2025
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x00001A4F (6735)
> + *     Length           0x00001A35 (6709)
>   *     Revision         0x02
> - *     Checksum         0xBF
> + *     Checksum         0xDD
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
> @@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
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
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5170 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5256 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6531 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7627 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5372 bytes
>  6 files changed, 5 deletions(-)
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
> diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
> index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..21278dd23850f3714f82da4da37d8f6f0def7c41 100644
> GIT binary patch
> delta 113
> zcmX@3u}Oo=CD<jzNQ8lbNoyjPG*hp`Ms+tXCb!9(^SP`!1bx`!{ezuZy0RIZUBV3)
> z__0pjEu>{)oKT&>C7-ZBVAAAF##)dJ7YA5gc+zBNmvG|*h?oFKtRMj-vXE!9v9Kf~  
> E0NvLgQ~&?~
> 
> delta 139
> zcmdm_aYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SP`!1l>5}{ezuZy0RIZUBV3)
> zc(702Eu`gV6dW25P~hwmZtNTq<WmhIxa2|P0)a`BGZ||^YPmSTI>aVThN*)H3xI?R
> SK#D=)OR^X8ZI%?4WCQ?(sV7tb
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..a29aa5d2ea83f00c543b58fe33ec7ce826e050be 100644
> GIT binary patch
> delta 113
> zcmZ3a*`dkh66_MvA;Q4G^lc)SG*h$NM)f&dOm34mALX*<5cFY>_YZbv>B?qsb_q9J
> z;Kw>yP*}^vIH5X$OFm(Nz@*8UjI|&cE)KA~@TAGkF5$)r5HSIeSV00vWFgPyPGLz#
> E06pL!c>n+a  
> 
> delta 139
> zcmeCsT%^h666_MPNQ8lb>BdAZX{KKHjp}o_m>i~VKFVdyA?U^#?;q^U(v{8N>=JIc  
> zz=M6Vps<#oQE+HLK!LMMxUq9ckWV#;;F1TC3j`)j&Sb0wspaAT>kykX8Kw>*EC3QN
> S04WBEFUelWw>e)}k`Vy<UnqG1  
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
> index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..786466e58a7a81bf81fb7cadbb0630e803f19f28 100644
> GIT binary patch
> delta 113
> zcmbPh+-%I{66_MvEXlyY<UNr~nyGK<Ms+tXCb!9(^SP`!1bx`!{ezuZy0RIZUBV3)
> z__0pjEu>{)oKT&>C7-ZBVAAAF##)dJ7YA5gc+zBNmvG|*h?oFKtRMj-vXE!9v2Yd}  
> E01f0IF8}}l
> 
> delta 139
> zcmZoRo@>nI66_K(SCWB&$z~##G*id)jp}Y(Ob$~w=W|(e2)c2``v*I-bY(L*yM!Aq  
> z@L-?3TS&{#C^$4ApupKB+}JrJ$fp`aaLI$n1p<>MXEN4;)N*lvb%;%x3{wXY761ts
> SfE0tomt-&G+bk)Z#RdSwDJU-h
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
> index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..cdefdbb92f6b509b39413a3150d0d5d575c22df3 100644
> GIT binary patch
> delta 205
> zcmexwecGDKCD<k8v@8Py)7FVx(oAi)HmbXEF?qIa&ga_8F6hG^?;q^U(v{8N>=JIc
> zz>jruo{W}>aYA(hmwdtkfk~4y8EZi@TpVC|;YpL7UBZnMAYuX_v4RAU$U>gU&tz;j  
> Ze-hGTWOAFlSxLm2gNkNvekLQy2mmfWJ;DG0
> 
> delta 256
> zcmX?Y{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=X3347j)x{_YZbv>B?qsb_q9J
> z;K4rGR!GawC^$4ApupKB+}JrJ$fp`aaLI$n1p<>MXEN4;)N*lvb%;%x3{wXY761ts
> lfE0tomt-&G+dNw+n~}+3>ShiRYYw{DIC-{^?d10|cL0k$O`-q*
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
> index 029d03eecc4efddc001e5377e85ac8e831294362..8cb1d9ef7a6e5a0429e96bf4b6529bc814a936b0 100644
> GIT binary patch
> delta 113
> zcmbQH^+%J-CD<k8j|c+;ll(+3X{L7Hjp_p2Om34mTXI`-2>P(c`v*I-bY(L*yM!Aq
> z@ME3aDy(H<oKT&>C7-ZBVAAAF##)dJ7YA5gc+zBNmvG|*h?oFKtRMj-vXE!<Utvi`
> E018GRTmS$7
> 
> delta 139
> zcmeyPIZcbpCD<iIOq79viGL!OG*hGhMs)#hCWon;ExD~Z1l>5}{ezuZy0RIZUBV3)
> zc(6}y71r`I3JwhjC~$TOH+BvQ@~H+9T=F1tfxx86nT)j{wOkxv9b%Iv!_+~91wg_D
> SAjKf@CD{x4Ha`}YWCQ>=S0`Km  
> 
