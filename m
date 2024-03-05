Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp136706ejb;
        Tue, 5 Mar 2024 13:50:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8TMRijjds3aXWrGFKd7C7x7Ndqm9hMQreBBdkbnniR8W4/xnu4/4m6hW+mMAw4YhzrdyUHoIVaC5BCR+Rh2jAVB37Efh6
X-Google-Smtp-Source: AGHT+IGdwIIp37c9x7tZEEvu6hC7A+j4DH5kOeDEj1AVjUIkCi0wCVEa1ByI8oVV59ZHBuksCXXt
X-Received: by 2002:a05:620a:148b:b0:788:3e85:1f2c with SMTP id w11-20020a05620a148b00b007883e851f2cmr142935qkj.69.1709675431350;
        Tue, 05 Mar 2024 13:50:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709675431; cv=none;
        d=google.com; s=arc-20160816;
        b=MmotXj8/A5Egb4f3dhDGrv5zYuaC2a/9YcMzwdfv6gpjsLAnlZfmF6iKm5Rn/uLWcu
         obSDEtXkn2Bu/OmSYLGGVGufIZfvE3pMDoZt1fa+l6HnVhsxu18DzJlkae1BevCelY3S
         2a0Asx+un5TjqQQMvrSCJHocnQDx3LV59ptzTGDb9HLqUVFoVJz31/6zzE2W5Dfvufht
         bjz/qMLGWkp4QC2zF5TNdzIaBJVOc5PAe1XQn5j20UxXWfqa1pza54aPM/KApY9xhDIi
         HwBukdTxWHQCOLPkiUOGlmYePOG89UDNFyt3pEPpXpvSpw3tdZxmXY+wjxCY/GEmmeuq
         xzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=oygv0OkQASVVTaTkHVAoVdc59x6Y64m+u6pKDlUiJ/w=;
        fh=gu1f+saWV0/YoXk/PDmVgUTaf/UqGz27wLFJe9n+j6c=;
        b=NQ93JgN7a25BIqwTlNbEHvEWM1/6mv+7PO7NkMQf59His2VjUkoGugIFYOxxacEf2T
         sYWDV0TDr3Fgw/h9l2/kpMvbNzx+GI4YLf9Gh23sf3JPdt9nckM3DXAFWAggsg1sxByF
         8DSP3l8miQA8nuordKyBSVSwZqkdjjRi3TccMpAUuPpL5PsX4Z2XWZhozwiqOJNIZNIy
         XAv9jjVpykzzPhXwj8bKnD5+BJdbBSfvBiI6JjRn4YsY885eO+p0d9K9osDy7kdBp4vM
         uyFfW82w6/sOqSosyMGpeSGTieAQfFh97GiH8LSorxkk+Hu5Zv2P5DSy0TKguCIMDWul
         bP9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHoX4kvj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020a05620a204e00b00788269fa624si5654158qka.711.2024.03.05.13.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:50:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHoX4kvj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhcg3-0001DH-SB; Tue, 05 Mar 2024 16:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcg1-0001Cx-JT
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:50:21 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcg0-0005og-1v
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:50:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d7232dcb3eso45812995ad.2
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 13:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709675418; x=1710280218; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oygv0OkQASVVTaTkHVAoVdc59x6Y64m+u6pKDlUiJ/w=;
 b=VHoX4kvjI26pIFXHfnfhesU95hsI3VhpukLwn3vdW3lp74JRGxh4rkEvoLGVdm3U/n
 Jm2LKSHBbtkBcwUUZ6MMgMQIlOEcT81NdVmrrF7/cHI4J60Z5uWxSUJ0LDcaGOJ4NMhC
 s2XsSEUXwGnoPFKdyB6XGYFt2vGFQZqGOi7aCMT0pHfGxCxJM/cQ4YlVpDzlVIBegDfK
 S6z4FaAh4Yoe3fQC1QxqUiQlTbqfk/6XG+8h5n5A1Fo53FSopbbvX7L0TCzLVnf4R3Nf
 1VJsCA2P2rTcPFNVxslVdM2NqQ7ORr45KZnjaC2yjPLHTO/POqCdmzqGWRhdIoPox7ly
 6W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709675418; x=1710280218;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oygv0OkQASVVTaTkHVAoVdc59x6Y64m+u6pKDlUiJ/w=;
 b=KqW5Om/fuyAE13ft5vZjygx53kUKej0qrFID5KbN+Q/db+2IgVq7jWtkG5BjMT0GyN
 Y94IQOCExfCwOirGFCL4TpxVIKnScGVclYvwZaV4U9evG15mozgAO2n5KplSPIUaGSUo
 Rp4AhZVuzJGkeMJA7HBj5QMkkLADE/Rrm3WhKAXDD+cAVMaMV8n97QMeFC8iz5GXbNqJ
 uKXRgmA8gA9e19AipYu8at5zrffSeU73lhLkgt2mLeJQ0Khyc13gfFlgzNMfRXu/EOmU
 B4j8jzqxp27Bd1DBuCJIxM2C3gYpBfM2aeghEensL0k2GIenV53m9MlscaA3fls+izGI
 od7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXosjzGvZYn04EaEou2PS0ydoVGS5ZU8pyRfSI++TuclmyF+7RjZFDmXGcsbGe07pd1wzxlFSEXWGqeOqXZ8W6jI6lI
X-Gm-Message-State: AOJu0YzJ9WNFswI++S6iFgd1hjSGguzhwjNp3OkTYn6GSvGajLy/hOHe
 f+1ypmdrjW1m69w1x1SoInUGc1o5ThBS8rVl5SDeraDCP6mFOdnaGaPz/9RNHyo=
X-Received: by 2002:a17:902:c081:b0:1dc:cee2:5ffc with SMTP id
 j1-20020a170902c08100b001dccee25ffcmr2743786pld.6.1709675417677; 
 Tue, 05 Mar 2024 13:50:17 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 h12-20020a170902f2cc00b001dba356b96esm11131789plc.306.2024.03.05.13.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:50:17 -0800 (PST)
Message-ID: <1dd86523-572d-45be-baa4-6095981c5923@linaro.org>
Date: Tue, 5 Mar 2024 11:50:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 17/23] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
 <20240305070331.2151131-18-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240305070331.2151131-18-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GTtlXEnR/WI3

On 3/4/24 21:03, Jinjie Ruan via wrote:
> Add the NMIAR CPU interface registers which deal with acknowledging NMI.
> 
> When introduce NMI interrupt, there are some updates to the semantics for the
> register ICC_IAR1_EL1 and ICC_HPPIR1_EL1. For ICC_IAR1_EL1 register, it
> should return 1022 if the intid has super priority. And for ICC_NMIAR1_EL1
> register, it should return 1023 if the intid do not have super priority.
> Howerever, these are not necessary for ICC_HPPIR1_EL1 register.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v4:
> - Define ICC_NMIAR1_EL1 only if FEAT_GICv3_NMI is implemented.
> - Check sctrl_elx.SCTLR_NMI to return 1022 for icc_iar1_read().
> - Add gicv3_icc_nmiar1_read() trace event.
> - Do not check icc_hppi_can_preempt() for icc_nmiar1_read().
> - Add icv_nmiar1_read() and call it when EL2Enabled() and HCR_EL2.IMO == '1'
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   hw/intc/arm_gicv3_cpuif.c | 59 +++++++++++++++++++++++++++++++++++++--
>   hw/intc/gicv3_internal.h  |  1 +
>   hw/intc/trace-events      |  1 +
>   3 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index e1a60d8c15..df82a413c6 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -795,6 +795,13 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>       return intid;
>   }
>   
> +static uint64_t icv_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /* todo */
> +    uint64_t intid = INTID_SPURIOUS;
> +    return intid;
> +}

Needs to be implemented, similar to icv_iar_read.


r~
