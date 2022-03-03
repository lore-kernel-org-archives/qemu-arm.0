Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1057191lfo;
        Thu, 3 Mar 2022 13:45:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrcymJWkQOdKPbWPs94kR0S8NVW6/l5CT0GsIw6fL6mY8i6djOU7w6us2iHCmtm7P/ZOty
X-Received: by 2002:a81:38c:0:b0:2db:9cc6:cd9f with SMTP id 134-20020a81038c000000b002db9cc6cd9fmr20804403ywd.340.1646343939981;
        Thu, 03 Mar 2022 13:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646343939; cv=none;
        d=google.com; s=arc-20160816;
        b=DD8Sin1iJuluAeZ0wpqTR5PUmFwrhPlRPTwKOAPcsJTyXnre/MWkDMYx/mPSyHufur
         QdObW2ypUC4iopNyrgWrUlLT6E/kGL9gQRtBFuyD8IksQ+RZF0QHFRWUApSK/QZuv/yY
         uho2QK3g+NhZ3GHv01VJQeeca/HUYxU2dM+6WALkKC333YejyQybvg1vv08nG4zzrpR1
         xt9oq3sRTjP+QBWlLFiGLPsLLf/jNc3ozdVRE0ipoYbsE+7wMS+HQsdmE2f4R+j3+ez3
         NUSRHGbbEZiZAGxYn+KipmXfpX6o81OmOZcEobdHKoMF5vjpBTw+9SX7M5K4pxZ7pOvd
         WQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Zwf1VHOd3vRXDsiIr26IiXADhKVWHQPzfiSFdV1cRQo=;
        b=qErVNAyKCdbmmVWqB8wmYQb0mB+FPKEjQBBgWOLhrnUGGqgnuCo58GWzaMaSUQYgmJ
         iDcYi2ccFwDcr3TT+l9sjixNlC36zWyzV7ZpRKr9Y1RR23D94jm0WwmKkJgbjOB+Yfc5
         76Jo2TPLLBuIxcKDk8Z7GyQGW26A41Eo4VIgAVpnRK56/iaxlC1+GLWPJVZS32GyGxtU
         DOCN5bPLjLx8S0lOHvSTc9lErGk5whTMZ/hQe4z57tD/V/7JpBZVkl2FLqoFKkGiZnJ6
         9erbpBFOqJLz91IlPx9pViAgKNkrsjnebsE2LIwO1FSRBhpCVDAUOGpmMWM3ZNOujXA4
         AZew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GG4Q1M+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e206-20020a8137d7000000b002dbf50ae690si2625867ywa.409.2022.03.03.13.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 13:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GG4Q1M+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPtGV-0003ue-AC
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 16:45:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtGD-0003rH-CZ
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:45:21 -0500
Received: from [2607:f8b0:4864:20::1030] (port=43752
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtGA-00052r-Nn
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:45:20 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so5128351pju.2
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 13:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Zwf1VHOd3vRXDsiIr26IiXADhKVWHQPzfiSFdV1cRQo=;
 b=GG4Q1M+GQLmmYI9qsOyxth3UFsqxr7yyljqOzcMkyzdk0Ft/yXBbkqpwEzSQGon8gY
 ez2JpOK9aYHNLMjYV99Kq9qEfGatHiYSqMweHiuxafV/Jd8WVtM8P2Hg17FYggmWHwtU
 9I2x2GpQ9gsdIwBTE9o/Nm0DRjKM3q1jInfEsDQmrOfZKOfxSHp9H3VieQPXnCeqLVx7
 XncVAwDIugfdPi9RfaLeWrucTP4z49Xcf0nERpry8i1Xiw7mTqmiWY5zfWWZjRvWWuhf
 BUkbseDw25FIPF3P5uPaBMmSXJ+xsFrV2byEU3lCJ6Tv51GWj6htbpB11xsK/r4mrLA1
 Mw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zwf1VHOd3vRXDsiIr26IiXADhKVWHQPzfiSFdV1cRQo=;
 b=cnBMNoRzwVA30DOkoDHSP7ifj8gtnjMVhAnONDDhuB0vF593ziOA55XMQMHi2QB+gb
 CW61SwSwn7Xz/8RhwotS72Y/i4gCGXax0Ue0mSe2UHu+OafBxOdS4Il35Rp8vSZux9aL
 pZIPBdFDiQdMyVTkdIQ6eiBBonCApwNOobJt22zOq7qIgKQeu6GMw4b4Z4dfkW+YPRvj
 RCKaRelgDc4zAvpA3vkMr5dRrHll8B5FpvoYrd9zoMRpvuSksM+YcYMJUg7vcQ1RlV7H
 M15onJuoAHQ/Np0sGsJiUbC8bEpaOkFmnyObwk+OnWT/7b9jlBkMx9h6BiDZ4WjKjzB1
 kY6w==
X-Gm-Message-State: AOAM531trLVSyEketVAbL9e6/I6aYGGvgN/1rA9C25r8IewT56/NK1HG
 OCZKaDFH/XK3BkUTrhIuf4UhBw==
X-Received: by 2002:a17:902:9895:b0:151:6a35:dab2 with SMTP id
 s21-20020a170902989500b001516a35dab2mr23103437plp.118.1646343917153; 
 Thu, 03 Mar 2022 13:45:17 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056a00245100b004c283dcbbccsm3648989pfj.176.2022.03.03.13.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:45:16 -0800 (PST)
Message-ID: <7926be61-7536-e683-19bc-51154f0424cb@linaro.org>
Date: Thu, 3 Mar 2022 11:45:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] hw/intc/arm_gicv3_cpuif: Fix register names in
 ICV_HPPIR read trace event
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: JvVmH2XNqtMu

On 3/3/22 10:23, Peter Maydell wrote:
> The trace_gicv3_icv_hppir_read trace event takes an integer value
> which it uses to form the register name, which should be either
> ICV_HPPIR0 or ICV_HPPIR1.  We were passing in the 'grp' variable for
> this, but that is either GICV3_G0 or GICV3_G1NS, which happen to be 0
> and 2, which meant that tracing for the ICV_HPPIR1 register was
> incorrectly printed as ICV_HPPIR2.
> 
> Use the same approach we do for all the other similar trace events,
> and pass in 'ri->crm == 8 ?  0 : 1', deriving the index value
> directly from the ARMCPRegInfo struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
