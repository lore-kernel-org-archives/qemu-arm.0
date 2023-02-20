Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2532779ejb;
        Mon, 20 Feb 2023 10:57:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9zATDNWd6ddFGt7GGbeJVoIuNBV0ej5VQ+9gN8zwA3TuEvI6dqfGvAvvY+z2Q7+1LBCrru
X-Received: by 2002:a05:6214:e8d:b0:56e:c04e:c48c with SMTP id hf13-20020a0562140e8d00b0056ec04ec48cmr5032005qvb.25.1676919466417;
        Mon, 20 Feb 2023 10:57:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676919466; cv=none;
        d=google.com; s=arc-20160816;
        b=suvTj1mD7cL/Z9v3kKlJ/JIzI46iw43karm+fD8PBteCkdj/oCmU8WZcY9jxpJ7/04
         VGdFesWRA7OTwIEQwBDILmOZanSTYUBKutm5YfjVV3SsPCpjRBz8zqO7/AiRKaQKF0I3
         TOXKzL8AImjtuKHbiEeawCNwMYpC187X7TMKXYAQtFhfrIMQLS2AfJdyJrrJkw0GUXPq
         tHear7NsrOMaqXWW2/s0u/s0tlW1PLa57L+2ujXaIjYVobR9EzXFap9cZXu2Y0hykMUn
         ITVdtRtCVqRNOZUK0Ou/AWykozSuViJvywySbqOi8YN6B1/gfSIP9cn/Sw1nmio6/67i
         074Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=59OILGZq1goYLb2j3kwFEicXFGE7Rhg80OG1p6jumeQ=;
        b=cSX1kiAMZTq9fqzetyRonVGO+YEd37w2Hr/OmprRSEvCzsAn/v2m3IcCE4smnSyYu5
         chpINpDezTj37Fnt/A5SPHLhnrhzNi7wT15/Yh2dws1x3LhTrt0Zm5tkEx9LaxuESsRa
         nc6Fvffak4yUF+AsIfndDU0gnHvjtWux/OFApjbPRYNXVMy6poVVvOCT3QHz+NeSe95U
         Q1NOhsqtxmZwh/cpz6lEmVumoIvZWcDtsysOj5KTa1KnjVWcqhLTG/0zplw0QUlZx5RT
         /shnCtKxJRkjqMPKZ6avgviEFHVqL7kqxu1akvEByG+Fzfbgmk+BsRBELwAAU45wZfqI
         EX2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDwMz41a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a0ccc86000000b00496d0f8702dsi1813518qvl.392.2023.02.20.10.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 10:57:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDwMz41a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUBLR-00037x-QC; Mon, 20 Feb 2023 13:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBLI-00034v-FQ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:56:54 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBLF-00079z-QO
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:56:52 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso1541022pjv.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59OILGZq1goYLb2j3kwFEicXFGE7Rhg80OG1p6jumeQ=;
 b=ZDwMz41aGShLfkpPEMa8JdfvXNTJZAO5IZg6Lr7BRg2s94deJ/lwBUyzGwpWBkSKqM
 qbFCfxcJBn4tBiS7K0Js1S08M7DGMwgDd0EE96oVza7/2PJIP8Djn3KF2Bdl0t67Zsw6
 NR156NpRYD1irTqwytVD2OhEoShPMcxwQudxMoLPplyksQdU6TvkC8ndrPxZfFejetsP
 II/PQPOyDMtLAV7i4lLM4pdcfvAnhVuE68ebPOA1PFxQhgK6l1ICWN1znNKpYb/ZguhN
 +u/lCOBfCc8NTJHFp1P1OoDVGwjApLNL8jyY8FHhqA2q4DZB43eUWURXOxDvc3lWZVYi
 IRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59OILGZq1goYLb2j3kwFEicXFGE7Rhg80OG1p6jumeQ=;
 b=ENYjumBXMXoK0j3FQYAIl5HDPh/IEForhawZ60wzUXnJ0VGUF1AVd4WUj1sA7Yo5s2
 OBYB2yP9qKsxEcVitlJe/ZPtNi4avN5pYzadbnfxZAEMkrLb213lbtYs1TTxXffJvL9x
 JnutTo9BuBNXKvM8ML3feVjbQKURRY2O9Aa6IiGmUoBUk8dlKRsk+SWaLoqB304ZuZzA
 C64CoSI+6Lemllj1siyXeNm3u6qBHMm8rt8TalygJka5L08d8Xke/y/X/YkRdBJWTLKh
 HJTT2Brdpc4B8MVKYKrcfRI8/++r9TI+4LhcDDVJENwgsvATEZNwMaH8Y4KnMxyytwmH
 g5oA==
X-Gm-Message-State: AO0yUKU7eJVCqsKVDYjZmoaUB99IvtseDI/qn33N93V9vLmkj3HHDivJ
 h86HjBR3twHBxd7bvkDk8SCzVg==
X-Received: by 2002:a17:903:280e:b0:19b:c6a:6bbf with SMTP id
 kp14-20020a170903280e00b0019b0c6a6bbfmr2122370plb.8.1676919405869; 
 Mon, 20 Feb 2023 10:56:45 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0019a60b7cc0esm8206217plk.248.2023.02.20.10.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:56:45 -0800 (PST)
Message-ID: <0c394e48-0a03-7152-69ce-cd5e034dae91@linaro.org>
Date: Mon, 20 Feb 2023 08:56:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] hw/char/xilinx_uartlite: Open-code
 xilinx_uartlite_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: xC/v6XM6eOaB

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> Open-code the single use of xilinx_uartlite_create().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 +++++--
>   include/hw/char/xilinx_uartlite.h        | 20 --------------------
>   2 files changed, 5 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
