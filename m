Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp663459ejf;
        Thu, 11 Aug 2022 10:42:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5AbqDB7bcIfjhPWfL41GoB/+iDiRmE9x0sqvVpSemdEgoAvyFPZvWMOZOeI1i4uEN9QKe0
X-Received: by 2002:a05:622a:5d3:b0:342:fd8f:5a44 with SMTP id d19-20020a05622a05d300b00342fd8f5a44mr246841qtb.84.1660239754804;
        Thu, 11 Aug 2022 10:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660239754; cv=none;
        d=google.com; s=arc-20160816;
        b=B0Vbzr/+5Egb6gSVvMp8qTD/uiwf+NFa+lJKDLsq6zlKtL2SdIi1kMzO8KOCqmkDKW
         X/MeZaD5ap+XWNsxHzcgkONgaKSpu6gteFYLefNxbE/0Mo3cgJubYbTieG0E3AZk/4tq
         m4L728/ozJyP7iVlucfxpr6V2PMI+1M4KkjwRfb0+WyOReBHSLPk6Am/D7liYUVT2UqS
         Qx1ZMdsMia/1NIqsOWid2mdD/rSnw0HRSqWZZY6tOWdQ55WH+x3czbLnlG/dQGCBH2rq
         wC87pkUHrSaoJe7vPx5Ff3/hZYzydKs/PEq/jVHKV25iSgc0jdcWrY+zXPr16XQC5Xyo
         0DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=SaQMuBXfEOyNnbG7/Q1+A/2uIPSOOD1EHOFoKJDwMXA=;
        b=ck9JZWrcH/4thmCP64CXnRiemefvAgyhF02ku0eWGGR2HaHYHNdbfGU5mnaiqENkTw
         iPzQbhXe1Ge3dvZasGqupqSOjfUjWzKx1JSs+KdM2PbC0a6+IJBkntq7IO43OkkMOucI
         bgav+WeldJsyqPahXwkCiOIG0p4dJyKiD1RnCcdEXXR1bt6uQQ8KMLDTIUI1L8ZAljTd
         VVFIwtAw2NYnUTvgss8JiTppW1Z6fXkN98ZojKQQURyvFIesCIW+etg5cHHCWo/tooyy
         jqTcAbIWTafb7Fa7iDv5NnhrvDbN3AHfhyYwVK1zzHlpRRWi7AkC8nt6TMg0mmKpmfkJ
         WaEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GLIXhl37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26-20020ae9f11a000000b006bac4fceb75si56739qkg.756.2022.08.11.10.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GLIXhl37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMCCY-0005S4-BK
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCBO-0004nO-Sx
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:41:23 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCBL-0004hg-PV
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:41:21 -0400
Received: by mail-pf1-x429.google.com with SMTP id d20so17063784pfq.5
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=SaQMuBXfEOyNnbG7/Q1+A/2uIPSOOD1EHOFoKJDwMXA=;
 b=GLIXhl37IkHLn1t+f+gY0rYyS6uDDKmTwd+kPTA+S0QUIkf1K0eyg1ck6phHUBm0Gz
 KeveK/pF7z+Ody8pwoMaXOR/SGUihu+wpnDx1HwNcFBiOWcrgp6jGMKNVR4Eh3yYbG68
 ygLwY9FOsORkgS5wUpuWNeGHs6EFiEB1VZXLCt4JdgD2QBTUYZLOLJFh/7DrOJRovpQ8
 svJ1fonGEA7JU2zgbRBja/GrfGvBSV22ARiHIxgJC27IDZVm0NyDyIH7DLQ5LihV9y4k
 LVZuj+kQfUjKXv9vOlluN4vzzpCwxdUnj8yaE6k8JsrjhI54DluZHkRYvfseTgXn+d9b
 Cl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SaQMuBXfEOyNnbG7/Q1+A/2uIPSOOD1EHOFoKJDwMXA=;
 b=qQU591TdNCcyhmzawTklwxfOaqmJGSgaFsSb4GE6eKpidEL9YRGOPeeaOkp8BBmDsZ
 wgUiR391ON1NPVS4eBJTdYn9ljjOP9eCXZVPsrq8DFx6xGGLiN+vRw0DagsZwnkWfHgV
 WWRfb2NcnFfI5c1hnmz5+O6i8gYfiSe7VHOKNNIKu4xDbvxmteCAHBqt6ozPsT+J+24x
 xdeL0XYYq8JxJWPlRPIV71Mh/DEFqNjO0hhiWJn0Ea8d75perF0XO/r4chF7ACWk722X
 wr7p4uuo+eT+ygLnwEIeobHuM9iIYjneiQVnZjFckUkMTLZTsNcpdHdiOP7PqYwNYMQV
 SVJw==
X-Gm-Message-State: ACgBeo2r2cFTJefM0Lk/ZbsyGdK9BonW0YLuCKuN30FATAxMbQ646EQS
 BcV6ZX86oX0PLJmIOHFn+BEL1Q==
X-Received: by 2002:a63:4b1b:0:b0:41d:548f:8e29 with SMTP id
 y27-20020a634b1b000000b0041d548f8e29mr135636pga.77.1660239678310; 
 Thu, 11 Aug 2022 10:41:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170903120900b0016bfbd99f64sm15402794plh.118.2022.08.11.10.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:41:17 -0700 (PDT)
Message-ID: <12988a80-ff95-cb09-dd1d-a8745aa00885@linaro.org>
Date: Thu, 11 Aug 2022 10:41:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/10] target/arm: Don't corrupt high half of PMOVSR when
 cycle counter overflows
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4paMUa6vf/xU

On 8/11/22 10:16, Peter Maydell wrote:
> When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
> to indicate this. However a missing ULL suffix means that we end up
> setting all of bits 63-31. Fix the bug.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d7bc467a2a5..87c89748954 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1186,7 +1186,7 @@ static void pmccntr_op_start(CPUARMState *env)
>           uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
>                                    1ull << 63 : 1ull << 31;
>           if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
> -            env->cp15.c9_pmovsr |= (1 << 31);
> +            env->cp15.c9_pmovsr |= (1ULL << 31);
>               pmu_update_irq(env);
>           }
>   
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
