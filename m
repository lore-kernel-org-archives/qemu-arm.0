Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2143943ejb;
        Wed, 21 Feb 2024 12:11:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQPNUT+XS5pPYnG1mwWDGy8cCTcd0DknpT3iYB7RlclyASf15mf+YyXn/xmHVQi6kOJq4CakEcFYJWCd7kWPJPa86/z+6c
X-Google-Smtp-Source: AGHT+IHcgV2amtc4v/9FxV1zNgZvPsFmH9BURA9noP0WeLVU998SWesi2IqMWUGUsI2y/Qx9AnPp
X-Received: by 2002:a05:6808:2189:b0:3c1:34a9:5e92 with SMTP id be9-20020a056808218900b003c134a95e92mr22376401oib.4.1708546294843;
        Wed, 21 Feb 2024 12:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708546294; cv=none;
        d=google.com; s=arc-20160816;
        b=J7bp4cMPNR12rMi0wBe9rP6EZXLNby0HL6YpKYzJrP0a0VRPPprflI/++pm0Yo0qcs
         8V8dLGLPJh8LSySw5cvKl02VfVZHMa1wpQK6cYJFhiEsa/0Pv/0sEjHO04Y5jNL53HUC
         naNMmCdsKwDdsLUWxO7rZL3+/rc6Ce60X7D/M7G0WO6TyQ5zpI/weu2Gdo1bkmdCO5hl
         kna0/uOh+CAeARd1E7ArKru2+EWsoPZ2yOntyhBFd8GWBLMDQFl0/CnHJb1gA43kCj88
         52wP80dstVQ2bjbOkMj4ZqjIYwr2TtLRs+4k40SfgNbfuvm0o063IbtLNTQ8+Hx1DhW+
         3y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=oJxETZhAAwqHJ/cWk/f8wkdlcV+eZ+HAWxywPdOBY2E=;
        fh=L07GZWOxK0ouS+Cx0evka0HFF98c7KoPEZK2g4G7QMU=;
        b=Qeo9uyABpvIE2XUN38CBvFZL3+78uKP6CqY+SMsMuB5vqDiHX+FyyZACBcKmxfLwtC
         c2XfF36wKCs+5rvfd1DGfhz3I+UtJ1tUcYgnrEsZy7NDz8ZIZbSdU06OOtv6AVm3RYXT
         +OB7wL1V97GaOZvE08mTvdPKTyA++rbixzSosESJkBk0AEi2Mpvk2xYcSY5ts0DRspof
         uTAEbXIwlft8DsBFUySC7KJbnz0klGb8UBxipk3bvtmwl/5AGgB5R2Grm8L8KvpVTDd8
         NFwtew88NPoehBYz8kNNTJGrPAP0kU0UcsGVSxI9LtbuhLwjrUSh9QxM9zvDCiK4AuZF
         XKEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tnadip3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020ac84e48000000b0042e2872dc1bsi4694619qtw.754.2024.02.21.12.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 12:11:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tnadip3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcsvr-0007fb-Ss; Wed, 21 Feb 2024 15:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcsvS-0007X8-5z
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:10:49 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcsvP-0005oL-Js
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:10:41 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2997c5fe6abso781661a91.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708546238; x=1709151038; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oJxETZhAAwqHJ/cWk/f8wkdlcV+eZ+HAWxywPdOBY2E=;
 b=tnadip3ZB91kp+rt3qIkRklJoQyiJRnDjQqAMz489TvWevtfrBOfknf1YyKRysp/+p
 fmeCoyCCSVtVsspUMvht875MUMOtNjm5ap50FOXGdcks1t48p/CZQ+fInyZ08okVRJH9
 Dq2hSbYwTRqtppTyFIm3qadNxxsl3Qqg7iKLybuN8Tps+yENJHSRnszJXQutVxCwDyAm
 0e3QlM8rpjcDnSt03cqPdNACvup0PWkzXBcwE6RvLTKr6wGJkcpJd1YEr1eAtYcbKCe1
 XuuiDxI41d7mFvCptj8xotIgNZxrHR5dTJd7DvLXwhlhldDcBBx/mY/0K5QSZjsfSrHY
 qbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708546238; x=1709151038;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oJxETZhAAwqHJ/cWk/f8wkdlcV+eZ+HAWxywPdOBY2E=;
 b=S0PGT0hLOJuhofbQc01Lp8njEFvW6mtS1ENXAzxEMapSfNyLVpLXL3QO9v47GokHY/
 1HOFO14talVdWe6PfDQJLWlqiYbdZPB08F00UABDfNMPGDNSnoL2H+kMmZh87rFBoUM6
 oCvdo4/1dIyFdNzZcK2ACtTKCAJ+VCx29LnvlOpktt57YeRPnC2071HKmIg/jA0jdNPH
 DA1KyCcWm9DDVDvovAIF/SRZhZV0fUcT3R9l9jQsI21hWL9azrb1goNf9po+HIDyEK9J
 RGAChGQo7s02qrHfwKk7IRnVXUj55z9RJFp5kLOmSpkRlAG7bgyBD/TTY45/+PXv/rzE
 jB7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK+WVSkuqK04n+1Cvjya+161YoT9vtiCYNGQVDSIuXkrtX/XucY1eTtqe6PCo8zE+b8vTkjy5I/uoq4zSHfBEJUI6d
X-Gm-Message-State: AOJu0Yz9RDndXxUpEV/60kam/umfPvQirkC4HgTxLtJnFSxw7rTVRhfN
 nPW4kJPf7PopqoVeUPxhaJYIxRpF+O1BC+D5qNm3vW+Jh5hQZ+YSnkwlrA5y93A=
X-Received: by 2002:a17:90b:1017:b0:299:3236:734 with SMTP id
 gm23-20020a17090b101700b0029932360734mr15561639pjb.42.1708546237824; 
 Wed, 21 Feb 2024 12:10:37 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 e18-20020a170902f1d200b001dbcf96004fsm7857273plc.148.2024.02.21.12.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 12:10:37 -0800 (PST)
Message-ID: <c02228ea-4f24-46f9-b6b3-34cba3059d69@linaro.org>
Date: Wed, 21 Feb 2024 10:10:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/22] target/arm: Add support for NMI event state
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-8-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: U31OnLoUlnqS

On 2/21/24 03:08, Jinjie Ruan via wrote:
> The NMI exception state include whether the interrupt with super priority
> is IRQ or FIQ, so add a nmi_is_irq flag in CPUARMState to distinguish it.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/cpu.h    | 2 ++
>   target/arm/helper.c | 9 +++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5257343bcb..051e589e19 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -603,6 +603,8 @@ typedef struct CPUArchState {
>       /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
>       uint32_t irq_line_state;
>   
> +    bool nmi_is_irq;

Why would you need to add this to CPUARMState?
This has the appearance of requiring only a local variable.
But it is hard to tell since you do not set it within this patch at all.


r~
