Received: by 2002:a05:7301:7bcb:b0:175:48d7:c728 with SMTP id wf11csp873464dyb;
        Fri, 27 Jun 2025 03:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtpSVgZLGF5hb7jRD2pBPWlHbJWsh7xnomE9lJEnPkZt+sIx+dphNex9ufJ7+6dLDBpVnBfsCwBR9qjA==@linaro.org
X-Google-Smtp-Source: AGHT+IFYH2kUa//cFoJsBBHT1fmfaUV7B8WHFlRXXR7LbDquaL91Oh3Tf9Qt3M8+31ZxLK4EXQih
X-Received: by 2002:a05:6102:c05:b0:4e2:a29d:ecb6 with SMTP id ada2fe7eead31-4ee4f4c77f4mr1834682137.1.1751018459583;
        Fri, 27 Jun 2025 03:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018459; cv=none;
        d=google.com; s=arc-20240605;
        b=UtAtmAmJkhFrCppCF4cMzRSyNCp/G2qlbPzzhMJ7BIojckjRvZCgoKD4WAjFpRXeZE
         HGwbzu3WqgWPabd2yc6imOjb1NigqtZ3H3SrfiES4blFJvGstDStgs1CpLuOw0GNT3b2
         ThtEqAbY29dD+xFDqaDJkHgjQuB2zWM+U40QZbiVfRlVJLs/yG9MWfb1uFcXVXIAnyUr
         vqcRPLdazKviRMlaUBkhF5Y0I+Fo3mnXYZ9kiFFPsTGZAuJ+0ULCdmzUiDmYdjqBc1Xs
         4chuIYaPe1WtJ0+bzRBXr2ePsWUaQ1DW1qGzrPYgRa0V4E1yrHtov7s3Xp0HYEcPpbgi
         BtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ftOQTU+H1GTSx78MzXNxfoxlD/TQU1QHzV8siU4sn64=;
        fh=fpuqO6vSlcsYwGfFDPFLsQdefbuDmygLqfkB97lSdfc=;
        b=J3u6zUn9RfZH8cOAmRNH5v+DX3eaiPtjkRRMPOFwn3fws1/mPW4B3H4nNG52prI8RU
         8i6YZP6g8Wh2kNK3zgarYWUlX5HMhcX1wzq0aGINZ4kXo8AvibIAapq4zvueB8+tlRmK
         jEQ7SK9TUtj9sHQu/Cl9qOa1KgbWeq6ATf5FaM6vRsy3EyGV+O//0uS6RZPx5f9aKOvF
         tuXdb0iBlvSSnYcAMHV6VHriyQXOnbwxLnJB+g7p9HzpN+WOZOBcG90rps3etpp8JPUh
         kewAMEyt5QCHUHRzsom1B3+tqU+SVNVe44oJ0id+2bHOrroduQWFv/d6OKZOaEtMLOdG
         pmwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiASdGIl;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-884d1c4038fsi914006241.14.2025.06.27.03.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiASdGIl;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018458;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftOQTU+H1GTSx78MzXNxfoxlD/TQU1QHzV8siU4sn64=;
	b=QiASdGIlBWzLThq8yihtx6hu6D5jB4BkHo+6j2ga+y6baeeiKJ54Z3rTZE2HwrBQbB5L9V
	s0VQU0BqmVXQbdQpJB0W6lwDRM0pLJPzqCfy5Edq2S/xqQDVIvWG2Vmex+nzlho3X/u8Yw
	1slppOY4oF48wfY6GctUira7ezmy9N0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-hu2vHj3oMhuyW7RfaYfDwQ-1; Fri, 27 Jun 2025 06:00:57 -0400
X-MC-Unique: hu2vHj3oMhuyW7RfaYfDwQ-1
X-Mimecast-MFC-AGG-ID: hu2vHj3oMhuyW7RfaYfDwQ_1751018456
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso837276f8f.1
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 03:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018455; x=1751623255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftOQTU+H1GTSx78MzXNxfoxlD/TQU1QHzV8siU4sn64=;
        b=D25GGVq0A5C3CiStgOxP10p804dnGb9oFZxdRVCT+P536dxD88gcJzduo75I0ZZlKh
         Ur8irsStXSkJcbEdVWFu3tZHo65QYc9Wz2jRDaI5725p2QbxWbe0Vgmr8j1WBoKYYMRk
         rtDsMCekjlZSeIjf/NKGH984YmBOrJq7D6KhzMlWxirIjAfDe5jR8Tq87kQRM78o887G
         5qgXZGu+ogiz7E2+0tEkSnfmszTyLOeR96BwntsKYhuPF9dLfh4F8koyzCJ07BTd1H65
         EnWghw+F/Qa+E1NDexmgc/wUte4snIw+qrhH1Pxn4/IJM3OLla6HnAHTRzX+bZSGIuy+
         cRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIfaZWSOdjarZkcv46Atg4oeAMBX7SLnqzkN40Zy9eF1MLsPAXAEMJU/wdkpBZ3b9u4lfiyhQpgw4/2w==@linaro.org
X-Gm-Message-State: AOJu0Ywt8OWAYx2LSWAP483QqIoWF+HSWdX1xDAHv/px0DNIov1Gpdrd
	hd1/m1z/fZ2PPVWYqwWfOg6mwYc64mZwsgjZan+MQ/TN8MRtUuLuQd180LQQf4Wu0U/R5scieak
	5vyehPvD/b5u6dVkeJV4HiJeriEb5WGwTWmXxdqOy5p8fzCPbfy+QOQEnIQ==
X-Gm-Gg: ASbGncsVNhDFun8/azZwuFYzCCkfqlFI6qsyK1XIo2xmxejKsvmX6U3jF1GamjUWeB7
	OBfpVby3FGyx6sGne3Dv/mi+0iVzrABpnYSXrdLd+eX93xusJH+30dFYIO4a7BVQaZ7fM8vbErD
	mKq6ZY+UNnxkeCsRk04Le8qJLFrw+uInjHAlFrGw0ZWQ5leI8uJfuMegcK2WQnjJcz+jvCv4yiv
	QDHcf3dgfe07YFoKs53hdIova2c8GDT260WxuTOdZ76/JtdgJSTNjjGRrtNgLRe2CLGVUm0Ohz2
	wuTOQo8TKUBr+2s2GpmhoM+gVACCBaniRscG5mQM91+945vNjjb1gEyEUu31dkkaEi7ROA==
X-Received: by 2002:a05:6000:652:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3a8fdb2a48amr1949928f8f.19.1751018455282;
        Fri, 27 Jun 2025 03:00:55 -0700 (PDT)
X-Received: by 2002:a05:6000:652:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3a8fdb2a48amr1949844f8f.19.1751018454409;
        Fri, 27 Jun 2025 03:00:54 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453923a22fbsm5359955e9.34.2025.06.27.03.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 03:00:53 -0700 (PDT)
Message-ID: <f502c91e-ffea-4b39-bedf-9503fc45e568@redhat.com>
Date: Fri, 27 Jun 2025 12:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 19/32] tests/qtest/bios-tables-test: Update ARM DSDT
 reference blobs
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20250627095620.3300028-1-eric.auger@redhat.com>
 <20250627095620.3300028-20-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-20-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ryOmWYdXJPwwDgqa0QsvtTnXTmns6TkW9AA8TXWTC9o_1751018456
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YEU88f6XQemC

Hi,

On 6/27/25 11:55 AM, Eric Auger wrote:
> Changes relate to the introduction of pieces related to
> acpi-index static support along with root ports with no hotplug.
>
> +
> +    Scope (\_SB.PCI0)
> +    {
> +        Method (EDSM, 5, Serialized)
> +        {
> +            If ((Arg2 == Zero))
> +            {
> +                Local0 = Buffer (One)
> +                    {
> +                         0x00                                             // .
> +                    }
> +                If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
> +                {
> +                    Return (Local0)
> +                }
> +
> +                If ((Arg1 < 0x02))
> +                {
> +                    Return (Local0)
> +                }
> +
> +                Local0 [Zero] = 0x81
> +                Return (Local0)
> +            }
> +
> +            If ((Arg2 == 0x07))
> +            {
> +                Local0 = Package (0x02)
> +                    {
> +                        Zero,
> +                        ""
> +                    }
> +                Local1 = DerefOf (Arg4 [Zero])
> +                Local0 [Zero] = Local1
> +                Return (Local0)
> +            }
> +        }
> +
> +        Device (S00)
> +        {
> +            Name (_ADR, Zero)  // _ADR: Address
> +        }
> +
> +        Device (S08)
> +        {
> +            Name (_ADR, 0x00010000)  // _ADR: Address
> +        }
> +
> +        Device (S10)
> +        {
> +            Name (_ADR, 0x00020000)  // _ADR: Address
> +        }
> +    }
after regenerating the blobs using

../tests/data/acpi/rebuild-expected-aml.sh

I still get an error :
Using expected file 'tests/data/acpi/aarch64/virt/DSDT'
acpi-test: Warning! DSDT binary file mismatch. Actual
[aml:/tmp/aml-2YB972], Expected [aml:tests/data/acpi/aarch64/virt/DSDT].
See source file tests/qtest/bios-tables-test.c for instructions on how
to update expected files.
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-O0B972.dsl,
aml:/tmp/aml-2YB972], Expected [asl:/tmp/asl-NO6872.dsl,
aml:tests/data/acpi/aarch64/virt/DSDT].

../..

-
-        Device (S10)
-        {
-            Name (_ADR, 0x00020000)  // _ADR: Address
-        }
     }
 }
 
**
ERROR:../tests/qtest/bios-tables-test.c:554:test_acpi_asl: assertion
failed: (all_tables_match)

(test program exited with status code -6)


I don't get what is wrong.

Thoughts?

Eric
>  }
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> above changes are reported after running make check V=2
> then I launched ../tests/data/acpi/rebuild-expected-aml.sh from the
> build directory and it putput those reference blobs.
>
> But I run make check V=2 after committing those changes I get and error
> which looks totally unexpected to me:
>
> acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-LZSL82], Expected [aml:tests/data/acpi/aarch64/virt/DSDT].
> See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-FTSL82.dsl, aml:/tmp/aml-LZSL82], Expected [asl:/tmp/asl-ZAWL82.dsl, aml:tests/data/acpi/aarch64/virt/DSDT].
> --- /tmp/asl-ZAWL82.dsl	2025-06-27 03:34:45.518848387 -0400
> +++ /tmp/asl-FTSL82.dsl	2025-06-27 03:34:45.514848036 -0400
> @@ -1,30 +1,30 @@
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20210604 (64-bit version)
>   * Copyright (c) 2000 - 2021 Intel Corporation
>   *
>   * Disassembling to symbolic ASL+ operators
>   *
> - * Disassembly of tests/data/acpi/aarch64/virt/DSDT, Fri Jun 27 03:34:45 2025
> + * Disassembly of /tmp/aml-LZSL82, Fri Jun 27 03:34:45 2025
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x000014BE (5310)
> + *     Length           0x000014AD (5293)
>   *     Revision         0x02
> - *     Checksum         0x8C
> + *     Checksum         0xEA
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
>   *     Compiler ID      "BXPC"
>   *     Compiler Version 0x00000001 (1)
>   */
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
> @@ -1929,24 +1929,19 @@
>                      }
>                  Local1 = DerefOf (Arg4 [Zero])
>                  Local0 [Zero] = Local1
>                  Return (Local0)
>              }
>          }
>
>          Device (S00)
>          {
>              Name (_ADR, Zero)  // _ADR: Address
>          }
>
>          Device (S08)
>          {
>              Name (_ADR, 0x00010000)  // _ADR: Address
>          }
> -
> -        Device (S10)
> -        {
> -            Name (_ADR, 0x00020000)  // _ADR: Address
> -        }
>      }
>  }
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5158 -> 5310 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5244 -> 5379 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6519 -> 6654 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7603 -> 7768 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5360 -> 5495 bytes
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
> index acab6e65febbc210158d4c39be0680bbb90250f5..b897d667971500da4732000091a6f0828d05d89e 100644
> GIT binary patch
> delta 173
> zcmZ3cu}_oBCD<iop9lj3Q_n^&8IgJccg`5S_+Y2_0B27F5pPykmtbGs1!j}87zzZL
> z85t55NKKlYAt=lxaKZfK(_qso--+U{d?gP%`z}dXz&<sTi)l$h0as&30t3U6gatB_
> zv$)s`gjksvco`B3nmckB7!nH-A(GKe+`$G0@f`7vE<p^@P5i+I7V#YMl8!DxJPZts
> OU=c&8G!Fv<69WJ)j4yfs
>
> delta 19
> acmdm|xlDu0CD<iIO@x7g>C8qh84&<COa$Tp
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> index 54c27e7d95b4956ed1b5dee0d299ccb08dc2a73e..2cef095bcc1bb404f8cd9ec77a879ed81c191875 100644
> GIT binary patch
> delta 156
> zcmeyP(X7Sg66_MfEXu&Zv}_|+kx0FO8%K;@e6Uk|fU~E8h&QXNORz8R0<+0k3<ZMB
> zj0_12q$W+y5ESMTxL|(rX|QRP??mxezLJNXeU~IGV4s@F#k3@$fUB`1fq`L3!UCDe
> zSzPP|Laa;-ybK8i%^f)m42cDa5XtB!?qCChc#e2Smmr4dCjMXpi+GNB4o8<D9tH+R
> F1_1j$EA9XQ
>
> delta 19
> acmZqH`lG?+66_LEBf`MI)VYzXNCW^oYz1ck
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
> index 4330bc97cba0950191c45ac833533db7a190db81..372ca3d7fb1e2927c7c12f97eec406d597f294ab 100644
> GIT binary patch
> delta 156
> zcmexv^v{^fCD<k8pCkhV6Zb~0T*-O?H;x#+_+Y2_0B27F5pPykmtbGs1!j}87zzZL
> z85t55NKKlYAt=lxaKZfK(_qso--+U{d?gP%`z}dXz&<sTi)l$h0as&30t3U6gatB_
> zv$)s`gjksvco`B3nmckB7!nH-A(GKe+`$G0@f`7vE<p^@P5i+I7V#YM9F8tQJPZts
> F3;>E4EZYD8
>
> delta 19
> acmexo{N0GlCD<jTT#|u->Fq|YTuA^&WCm0K
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
> index 7fdbc03e2bf9fb7d35704779253de36e362f0bf9..c2779882494e16920787b8ab7b4cb3c3b70f224b 100644
> GIT binary patch
> delta 168
> zcmdmNeZz*!CD<h-LXLrf$!jCmN?BzA7p@q+_+Y2_0B27F5pPykmtbGs1!j}87zzZL
> z85t55NKKl&K}IZRNx}m5shM0%OA-pW8aomg7?va~keQst#a<x9%EZ9SkWkRvk;A}{
> uSda*jjBer%HZX|ih<9`eVu)^%2{y2RaCjIP7#YxH`GXCiN_iL<m>2+L6)WZd
>
> delta 19
> acmca%v)P)<CD<iovn&Gx)9sC1D`f#g-Uey_
>
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
> index 969b4f6560d3ae39f5b7e0064b7122905476fce8..ebbeedc1ed30d811315c350f4cb42f8aa265af73 100644
> GIT binary patch
> delta 156
> zcmeyM`CW_4CD<jTT$F)<>HJ2nXCn0iZX7Xs@xe~<0nVNVBHpa7F2TOM3(O{GF%$?g
> zGcqJBkeW0(Lr|DY;DY(dr@^LGz7xe?`AQyk_Fa;&fPHEv7t@l20<Ol61O|pB2@7N<
> zXK}F?2(dCT@G>M6G<W1MFeDZvLL{S`xPuK0;yL0SU4j^*oA`qbEaExhIUHSrco-NM
> F8359@EocA$
>
> delta 19
> acmeya^+A)%CD<k8g9rly)25AF&qM%8i3Z^S
>
