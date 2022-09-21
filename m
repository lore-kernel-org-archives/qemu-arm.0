Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2180509ejy;
        Tue, 20 Sep 2022 20:39:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6WBIb8wxmjCHgyZAT5FFQfAs5m+olFe6p/uZRdCO1rjKJyF8E+6tvpTe0kkewBgeVhA3vj
X-Received: by 2002:a05:6214:300b:b0:4ad:14c4:39f4 with SMTP id ke11-20020a056214300b00b004ad14c439f4mr19235930qvb.105.1663731576054;
        Tue, 20 Sep 2022 20:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663731576; cv=none;
        d=google.com; s=arc-20160816;
        b=1AvZ3OOFKsLFqtBMOxYOPwA+oC/9VzoejsIl0pu41uEsrgmWd/7uKAENkY3IKaJLzd
         flOtiJ20Bog5YvwDMk3vp9CLIHedWTh/w4GLbo4ZTGXh90/ne87JZr2je1ycf9iNJAh6
         ZG92Pl3Ma6sMJDGp42h2D/FCe0xvoY1O3F3wDwj8871/Xa8HeaEffJIDx1pGLr0jSXti
         n7QLoj1DNs0pog0h+Ow4Q66R2uWwkVQo8lY0oCcCtep5EsfCzqrgddSv0RIrJZWt1RD9
         k22WDYf+NEx5bts0NpG4dKmhSpjgzn387ZWgP8mXv1eWkwX/o+R/fmCNmGuPN6UkF6AL
         NsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:date:from:dkim-signature;
        bh=Pisq04/i5dMZRRAnqQgcsqj+f6A341WASX1WPhtmeuU=;
        b=AiduJ153QErNLmZAxx50f7B9CzjNRU6TXIzeokRhd+l47j8WYcmRcTHC9t45S1J+cW
         xQ6ZvF/p0RLVC75PcME1/h3BOVcS+Giy610d+grQPuG3Ql96rGfdZdlCZfIb0rPP2cJp
         Y+/yoWOIUU2kajVimQ5TzlqZsmRvi/8G5SrEiLNOtFY3717yxr6Sz63p9kO9HdBwDGk7
         zc25d8BOI1RgkSgTgVKmZ+ZOZr5geBoiXwBr8KLvX6sgEzmQeeKyV/tpcWvhjrtGD6wf
         Gt1MCi1TBHC/L8cJwrFKwsk9XH5QvxHk3zk3XxKJqns54CWFqjVrEcHiOP/4v9XF2FT0
         5NPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=SWytpzWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020ac86884000000b0034488de98d8si698142qtq.755.2022.09.20.20.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 20:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=SWytpzWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaqaF-0004iC-H4
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 23:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqZv-0004gt-5Y
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 23:39:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqZt-0003cm-FW
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 23:39:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id iw17so4423051plb.0
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 20:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=Pisq04/i5dMZRRAnqQgcsqj+f6A341WASX1WPhtmeuU=;
 b=SWytpzWiVqARiNHSoFsNitipq+OhTUIzOgpEENvmrkZyLwHbFIb/XbjpxQRS0oDNB3
 4WzEoWABx56nnON+gPJYwPVly3pVBCIHDU6gZCTNxJE6Mrjl3BrW6kEFFmvfpU+8uiEw
 /4/XRRNn+c0mas0A8DYi3/kwaGmPZ4xOJcuhfmHVIhOejXopp1jSCGXwYCVKirhkC1RK
 jYJNE0Qswgn6FDH83w5t8hYUUsnCLuF+80ADHlnjXeKaF6l/gQ57SsnoIPI3In8n+U3H
 1UZsgSxHDIomqff9RVKe2hZ8Gy3SYXK1m+6Q1rTjctFNoR5G42zxogWnpEV9hoU+48G+
 zhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=Pisq04/i5dMZRRAnqQgcsqj+f6A341WASX1WPhtmeuU=;
 b=aEyV8qauNfoGnue1L9dztGjrMrOk5YMIIJ9vtjur7LQ/+n/7u3jWmT5LupM3LSs/CG
 1TJ+Gdt9pzjEbxKXZvsi6dOw+vQXIMyx4Z6sgYM4ICCUDqSxIEAvC/Y7B7Ar6gs/PyT4
 Mwz+wCdUMQdhdRD7iI4Tv8SB3qi6DiO3y4Zv7fXf/cz08GRpyRmhb4gBQsuDAd8CkoQE
 VAvCrNgEJihOIY9TtlMi8LriYGWQM18a3SMoOnEHs3CkJeP22y2h32tK5TZcI3r55W0J
 xhtYDGDwloIs5aIwJD4TsQyz7vA6gxtnaFL9Dk78olxoUyn+eymI4xQ2zxmTi0/s3lAQ
 o90Q==
X-Gm-Message-State: ACrzQf1JytNNA+oSSmdAKmoInazEoIpZekhf7f4piwvoZPFboGtQ2e9Q
 ZzFtBplaK1gAN5QGLN3RWdAoug==
X-Received: by 2002:a17:90b:30d0:b0:200:22a4:bfcf with SMTP id
 hi16-20020a17090b30d000b0020022a4bfcfmr7116519pjb.181.1663731551963; 
 Tue, 20 Sep 2022 20:39:11 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.244.51])
 by smtp.googlemail.com with ESMTPSA id
 i1-20020a626d01000000b005363bc65bafsm747676pfc.57.2022.09.20.20.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 20:39:11 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 21 Sep 2022 09:09:05 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [PATCH 3/3] tests/acpi: virt: update ACPI GTDT binaries
In-Reply-To: <20220920162137.75239-4-miguel.luis@oracle.com>
Message-ID: <e69478d3-12d4-f47-ae82-1c0f878bd8@anisinha.ca>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
 <20220920162137.75239-4-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I/8FSZd3YxPq



On Tue, 20 Sep 2022, Miguel Luis wrote:

> Step 6 & 7 of the bios-tables-test.c documented procedure.
>
> Differences between disassembled ASL files for GTDT:
>
>     @@ -13,14 +13,14 @@
>      [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
>      [004h 0004   4]                 Table Length : 00000060
>      [008h 0008   1]                     Revision : 02
>     -[009h 0009   1]                     Checksum : 8C
>     +[009h 0009   1]                     Checksum : 9C
>      [00Ah 0010   6]                       Oem ID : "BOCHS "
>      [010h 0016   8]                 Oem Table ID : "BXPC    "
>      [018h 0024   4]                 Oem Revision : 00000001
>      [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>      [020h 0032   4]        Asl Compiler Revision : 00000001
>
>     -[024h 0036   8]        Counter Block Address : 0000000000000000
>     +[024h 0036   8]        Counter Block Address : FFFFFFFFFFFFFFFF
>      [02Ch 0044   4]                     Reserved : 00000000
>
>      [030h 0048   4]         Secure EL1 Interrupt : 0000001D
>     @@ -46,16 +46,16 @@
>                                      Trigger Mode : 0
>                                          Polarity : 0
>                                         Always On : 0
>     -[050h 0080   8]   Counter Read Block Address : 0000000000000000
>     +[050h 0080   8]   Counter Read Block Address : FFFFFFFFFFFFFFFF
>
>      [058h 0088   4]         Platform Timer Count : 00000000
>      [05Ch 0092   4]        Platform Timer Offset : 00000000
>
>      Raw Table Data: Length 96 (0x60)
>
>     -    0000: 47 54 44 54 60 00 00 00 02 8C 42 4F 43 48 53 20  // GTDT`.....BOCHS
>     +    0000: 47 54 44 54 60 00 00 00 02 9C 42 4F 43 48 53 20  // GTDT`.....BOCHS
>          0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>     -    0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>     +    0020: 01 00 00 00 FF FF FF FF FF FF FF FF 00 00 00 00  // ................
>          0030: 1D 00 00 00 00 00 00 00 1E 00 00 00 04 00 00 00  // ................
>          0040: 1B 00 00 00 00 00 00 00 1A 00 00 00 00 00 00 00  // ................
>     -    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>     +    0050: FF FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00  // ................
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/data/acpi/virt/GTDT                   | Bin 96 -> 96 bytes
>  tests/data/acpi/virt/GTDT.memhp             | Bin 96 -> 96 bytes
>  tests/data/acpi/virt/GTDT.numamem           | Bin 96 -> 96 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
>  4 files changed, 3 deletions(-)
>
> diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/virt/GTDT
> index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
> GIT binary patch
> delta 45
> kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*
>
> delta 45
> jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8
>
> diff --git a/tests/data/acpi/virt/GTDT.memhp b/tests/data/acpi/virt/GTDT.memhp
> index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
> GIT binary patch
> delta 45
> kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*
>
> delta 45
> jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8
>
> diff --git a/tests/data/acpi/virt/GTDT.numamem b/tests/data/acpi/virt/GTDT.numamem
> index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
> GIT binary patch
> delta 45
> kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*
>
> delta 45
> jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 957bd1b4f6..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,4 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/GTDT",
> -"tests/data/acpi/virt/GTDT.memhp",
> -"tests/data/acpi/virt/GTDT.numamem",
> --
> 2.36.0
>
>
