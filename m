Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10250815lfb;
        Mon, 3 Jan 2022 04:04:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvHvISFPMY2dwvbbRoGjACCoMI6ly915tS5gc+ZVSVQVjw7akzcSOkD5ezZFwwDVPKCDUM
X-Received: by 2002:a05:6902:134a:: with SMTP id g10mr42581416ybu.410.1641211457982;
        Mon, 03 Jan 2022 04:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641211457; cv=none;
        d=google.com; s=arc-20160816;
        b=I/NfH0PkQjsOok/etrnNmvvQn8yhv5JnnIuR60RNReSV+PrDJNpU+BomBT69tvPiqu
         S4YqNliwlBU8swGAGduHpWO3P1vwyAuZvXJLpknz0r365/NL5/X2Ga+Xcs90cHPzxaeX
         P7/8EMEKkciUfrHLOzMrCN9tWqbFi4PrCEjfUjaFFiK4nnrROS5AoqXzdQSFe9nhYcGF
         m9oYg5qNMi9HxJxWnPLLErYbcOwve4sw+ldBbwN9mMVOvtOM+UlzJaWdc1StIR6ynlAD
         oSzbhNCHGv0F7NK8qsrptZhfQnKvVfwVLYpQkp6iwEUX2hinsqd6ksfoqF1mvsoOhoPX
         HlcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:date:from
         :dkim-signature;
        bh=9p0xxnBiVLvOkaeWFClMhARsy6aSq3+y00WEK7Ytv5g=;
        b=YJKkft3PUsave1i1n+P/kiV6da/tPCidJ3Gwl+QuqaNQo8Lr1Ir6rgmcBA8Lcjwf1z
         Ba7pNGoQr93ap3c4BlK1/HMelKCEy1xIYTWKaPMeEo/1tT76Dil4Xb1uqjISAt1eEb9k
         RS0ce7x2h2UUPrUx8IlsHBDVkL9pfSB15+wCA2O3sMe5+gbhR7+pWwfTPeyRMPHRrSSK
         FWCfb+lPixFrlwH82+vq47TD8eK5/0PTewoI2VKr3OKiH6/bb/Kr0N69Waq6RatzJdPe
         IYiCIo3iQYv4m05IQ6C5H+1qIpm8+9rEogrJvcU62/L/G/14yaSjkvOYkYkPI9UGrpiG
         swtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=xN2e09Pj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si32283697ybk.405.2022.01.03.04.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 04:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=xN2e09Pj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4M4X-0001Hv-Bi
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 07:04:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4M2P-0000G3-EW
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 07:02:08 -0500
Received: from [2607:f8b0:4864:20::62d] (port=41650
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4M2N-000713-H4
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 07:02:05 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z3so24721290plg.8
 for <qemu-arm@nongnu.org>; Mon, 03 Jan 2022 04:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=9p0xxnBiVLvOkaeWFClMhARsy6aSq3+y00WEK7Ytv5g=;
 b=xN2e09PjT4we2fI5VSdnSKPLKyVO7u/9YMCnkoimG8AYul3S49CTg4L37l8BZrShf/
 Ss+nUHk6n9T3OBM9YW1k1A2kJxkFZ76AOP5DdjgQfhUcz1T/Zy8ZgH39ifF6CLji+vr9
 JVr635aLQrT2SK4wpCJX/kj3xAJWq6utmUkS/ncnSt0JtK7u1L/2JUykfMVkA8nkPK2k
 618K6DDcEYyVVScpuxV1Xxjbz66QdSEr//qEcSyVfr84Zsy6axbNgGwUyx00mWfExHBQ
 ru3uBBpHvKbxMKa0Y/AjKmjJuafrY+HL/5AV+CzOMtAcTit3Jbb1UHgbE/bXBmzq2sNQ
 s9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=9p0xxnBiVLvOkaeWFClMhARsy6aSq3+y00WEK7Ytv5g=;
 b=R65gzLI5jYCpap7VLq0oQWfXAVkumyePTqNVdDuJXIaRxy+voy3WwriibTJZBuuJlc
 gb1P/uqo1y44ep6ZSsjDMHTLdxyZx9rdz/K3Jbbr1ts2Y3AkFGNJ/0oXyyhLSn0B71jS
 vzJ2YCpw7rG/qPmzEY5Al4aRGxQoFDGv3177B7ssoQOJd+l0Vw5CzeYbGJK4HJa1/n6x
 kU5Egc2s8QYwWjalXmwZuIk6u8euX9uvzXlt9YndhwYb8jInjciPzgP7wVfXYh2r9IWU
 C0+YS/jtZdlAfJG0O9MsvuSqnUtGlLR99aia09sObX4oS4LArB+D5CMAQqBWC5LQ0SEC
 qsWA==
X-Gm-Message-State: AOAM532pkS2iDg0nUMui6ugpPQ7BeEB6gkzypXRAYfdGGO3P3ZxyG+Zj
 8fCbjJW+0aYTkWSXRkHuzk4RGA==
X-Received: by 2002:a17:902:ea0b:b0:149:68e0:9a91 with SMTP id
 s11-20020a170902ea0b00b0014968e09a91mr39571877plg.172.1641211319185; 
 Mon, 03 Jan 2022 04:01:59 -0800 (PST)
Received: from anisinha-lenovo ([115.96.198.244])
 by smtp.googlemail.com with ESMTPSA id y27sm40022514pfa.12.2022.01.03.04.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 04:01:58 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 3 Jan 2022 17:31:52 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 7/7] tests/acpi/bios-table-test: Update expected
 virt/PPTT file
In-Reply-To: <20220103084636.2496-8-wangyanan55@huawei.com>
Message-ID: <alpine.DEB.2.22.394.2201031730230.14895@anisinha-lenovo>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-8-wangyanan55@huawei.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E1t5fXBpMcBr



On Mon, 3 Jan 2022, Yanan Wang wrote:

> Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
> to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.
>
> The disassembled differences between actual and expected PPTT:
>
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20180810 (64-bit version)
>   * Copyright (c) 2000 - 2018 Intel Corporation
>   *
> - * Disassembly of tests/data/acpi/virt/PPTT, Mon Oct 25 20:24:53 2021
> + * Disassembly of /tmp/aml-BPI5B1, Mon Oct 25 20:24:53 2021
>   *
>   * ACPI Data Table [PPTT]
>   *
>   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>   */
>
>  [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
> -[004h 0004   4]                 Table Length : 0000004C
> +[004h 0004   4]                 Table Length : 00000060
>  [008h 0008   1]                     Revision : 02
> -[009h 0009   1]                     Checksum : A8
> +[009h 0009   1]                     Checksum : 48
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPC    "
>  [018h 0024   4]                 Oem Revision : 00000001
>  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>  [020h 0032   4]        Asl Compiler Revision : 00000001
>
>  [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
>  [025h 0037   1]                       Length : 14
>  [026h 0038   2]                     Reserved : 0000
>  [028h 0040   4]        Flags (decoded below) : 00000001
>                              Physical package : 1
>                       ACPI Processor ID valid : 0
>  [02Ch 0044   4]                       Parent : 00000000
>  [030h 0048   4]            ACPI Processor ID : 00000000
>  [034h 0052   4]      Private Resource Number : 00000000
>
>  [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
>  [039h 0057   1]                       Length : 14
>  [03Ah 0058   2]                     Reserved : 0000
> -[03Ch 0060   4]        Flags (decoded below) : 0000000A
> +[03Ch 0060   4]        Flags (decoded below) : 00000000
>                              Physical package : 0
> -                     ACPI Processor ID valid : 1
> +                     ACPI Processor ID valid : 0

I do not know this very well but does the above two changes (flags and
processor ID) makes sense?

>  [040h 0064   4]                       Parent : 00000024
>  [044h 0068   4]            ACPI Processor ID : 00000000
>  [048h 0072   4]      Private Resource Number : 00000000
>
> -Raw Table Data: Length 76 (0x4C)
> +[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
> +[04Dh 0077   1]                       Length : 14
> +[04Eh 0078   2]                     Reserved : 0000
> +[050h 0080   4]        Flags (decoded below) : 0000000A
> +                            Physical package : 0
> +                     ACPI Processor ID valid : 1
> +[054h 0084   4]                       Parent : 00000038
> +[058h 0088   4]            ACPI Processor ID : 00000000
> +[05Ch 0092   4]      Private Resource Number : 00000000
> +
> +Raw Table Data: Length 96 (0x60)
>
> -    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
> +    0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
> -    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
> -    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
> +    0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
> +    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
> +    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/data/acpi/virt/PPTT                   | Bin 76 -> 96 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  2 files changed, 1 deletion(-)
>
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> index 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..f56ea63b369a604877374ad696c396e796ab1c83 100644
> GIT binary patch
> delta 53
> zcmV-50LuSNU<y!BR8(L90006=kqR;-00000Bme*a000000000002BZK3IG5AH~;_u
> L0000000000uCW9Z
>
> delta 32
> qcmV+*0N?*$ObSp?R8&j=00080kqR=APy`Gl00000000000001OcLdh}
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index cb143a55a6..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/PPTT",
> --
> 2.27.0
>
>
