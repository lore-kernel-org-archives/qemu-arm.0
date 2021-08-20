Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1293875lfg;
        Fri, 20 Aug 2021 06:12:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Z3iyT5eF1IfdTM18X/DjbRJbI7buRK2iZD9VzAoq8zDGN/GoT197Wf9i+jAYbv6irPpn
X-Received: by 2002:a5d:6186:: with SMTP id j6mr10457894wru.115.1629465157751;
        Fri, 20 Aug 2021 06:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629465157; cv=none;
        d=google.com; s=arc-20160816;
        b=OVVTT97A1KvH2i+Eqd+rFUKq4PnWdhkeCGON3B3MPxg6ShJy/GBcEIL1e0mIqIdIiF
         TGRRlZgQSUDQpC2nuXMcU10zyACFrnLeiOUG8hMXmBnYLUc4jjfFt3z+p5b2wSykw9pJ
         VCdczxoImpWDF2cR/fMhjktgiCyY4BxUzlivbLfNJEqSU1AIsD2s9pQ0LwrqjsbLrdNl
         B1HFKk5LI4iM/qOBV13XICVc2uIV59pVI76IXYw3qSt9y39pkiDq/VhrPiLOAUUgY7Vv
         eDDf8HtGSNm2cUgA6DJjnK8LIOHxit+jy3dzBKTsL7gwYYmKs90WaKEtXSNkcB7o68/M
         2vTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iOMtO4oQp0FcdnDBTcSbIq7I4YzdXwMkXhfYk9DQs90=;
        b=iO1SobrGRgT6cLr0EYTpNdVjgcV7ckFO1Plb+Q+GDmwwKAzAIxNNMt3DX5FGShXIB5
         Eu2zfkL999Bf5CbgxYO7vUQeB+GOmpMxoEo1EILGb8xQRxqbZUDM3ikULdMqOpuqKt82
         tZL6PH6chlep3KlYEVzNqx5aRJa4ShDsrPxkOMmD8ohJcmDF2AkeVHeZPD/Y0CJXM9Ag
         0CGPEMTbun3YTRpeLPLDGjAw4R3fv/7i+fwkKrM/10mCxlzmUtbf6uKJQ0/advaYFssP
         06Ef28vRPrh+8zeMsQBOEj7HC09jD+B1cN9mSiIcts9iRmLj3lX+DCyaq6RdRbhY4jR2
         cBqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FcdMeTRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si7540999wrd.3.2021.08.20.06.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 06:12:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FcdMeTRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH4K4-000458-Bm
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 09:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH4Jw-00044m-5X; Fri, 20 Aug 2021 09:12:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH4Ju-0003ox-GG; Fri, 20 Aug 2021 09:12:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n5so1874639wro.12;
 Fri, 20 Aug 2021 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iOMtO4oQp0FcdnDBTcSbIq7I4YzdXwMkXhfYk9DQs90=;
 b=FcdMeTRYLEbrQWSEbvFMMHBA9nlPR3/LqMbETnHojPqzW4oNY1galf1y8hGrWJqYgs
 3xhFp8TYFEdMDqoqurDibdigvTGMUVEnQaOkdzmiGUJZHCeq/foU2yN2sEgwHFPNeMkn
 brcBy126G5GvOHh8yX7tVyVQkzGc2Td+LL0MukHSbOilFaY59Vw9fVVHTWWgiVh5dW6r
 2306FAAyZvioNwQUAT1j6BRtqqCn5U+ozOUleA3GbuAZh5pqAvkeuXvRwpHUa9cbfRO1
 6Muprtz+bqX57r95lmh7UVK82A/n/Cs3Neh+xu65hOnSftckVHxeEE+d9mb0qed+PVnF
 iz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iOMtO4oQp0FcdnDBTcSbIq7I4YzdXwMkXhfYk9DQs90=;
 b=l+OZZQZ+Gl5r4llSac5M7Bh1SEPy8WKEzq0HTJ5HhdMAkasrlD8UijeVCNhp1mA/IL
 +C+skrjzJnxnxksrLPHvVMSsTEOmnv7poLQBnPMGfFppDh6bMPMWbrP+kxhF/WsVOUuY
 Ku3/uGkUlVv99FUO40s2f3CDaUdzHdJyzMYpf7mg3IzODgB8jCDOMyniOsz2K/aVLn8M
 tmtru05ap0gA04lx4uB3/LWsHHXYQkpr1hVyVyH7DPlTShE3VpQNYoZCvPm3nOBojRob
 ABVWXWP5Xqo628I+i2jrnWYP2OqzT8z3DdjsXoy+gu6MjKN5BX6MVlGD09JrLTmKZlcJ
 Vuxg==
X-Gm-Message-State: AOAM531qQhZbw4IhTuv0j4sNPuD2j5iYuZqDmXomUAmj2+KCP0tlim8U
 VEjoVsLKuvdFdtkq3Zcv0LQ=
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr9660777wrm.324.1629465144743; 
 Fri, 20 Aug 2021 06:12:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n13sm5136069wmc.18.2021.08.20.06.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 06:12:23 -0700 (PDT)
Subject: Re: [Patch 1/2] hw/arm/xlnx-versal: Add unimplemented APU mmio
To: Tong Ho <tong.ho@xilinx.com>, qemu-arm@nongnu.org
References: <20210819031525.653995-1-tong.ho@xilinx.com>
 <20210819031525.653995-2-tong.ho@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ed761e82-0fc7-b311-bf34-94dbe215e5c4@amsat.org>
Date: Fri, 20 Aug 2021 15:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819031525.653995-2-tong.ho@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.49,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: alistair@alistair23.me, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohEvksMRxkiW

On 8/19/21 5:15 AM, Tong Ho wrote:
> Add unimplemented APU mmio region to xlnx-versal for booting
> bare-metal guests built with standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit

This link is not very useful.

This one is:
https://github.com/Xilinx/embeddedsw/blob/master-rel-2020.2/lib/sw_apps/versal_psmfw/src/fpd_apu.h

> 
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 2 ++
>  include/hw/arm/xlnx-versal.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index fb776834f7..cb6ec0a4a0 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -376,6 +376,8 @@ static void versal_unimp(Versal *s)
>                          MM_CRL, MM_CRL_SIZE);
>      versal_unimp_area(s, "crf", &s->mr_ps,
>                          MM_FPD_CRF, MM_FPD_CRF_SIZE);
> +    versal_unimp_area(s, "apu", &s->mr_ps,
> +                        MM_FPD_FPD_APU, MM_FPD_FPD_APU_SIZE);
>      versal_unimp_area(s, "crp", &s->mr_ps,
>                          MM_PMC_CRP, MM_PMC_CRP_SIZE);
>      versal_unimp_area(s, "iou-scntr", &s->mr_ps,
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 22a8fa5d11..9b79051747 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -167,6 +167,8 @@ struct Versal {
>  #define MM_IOU_SCNTRS_SIZE          0x10000
>  #define MM_FPD_CRF                  0xfd1a0000U
>  #define MM_FPD_CRF_SIZE             0x140000
> +#define MM_FPD_FPD_APU              0xfd5c0000
> +#define MM_FPD_FPD_APU_SIZE         0x100
>  
>  #define MM_PMC_SD0                  0xf1040000U
>  #define MM_PMC_SD0_SIZE             0x10000
> 

