Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1028240njb;
        Wed, 14 May 2025 01:25:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURje4XHVpvWrr9ADgcyTshPYkx8XUh3M8KM4utoFnrdVGMfop0srwJDvEutOFxmQVtJXMoOStD7DnfOg==@linaro.org
X-Google-Smtp-Source: AGHT+IEokttaPEgMAFCJbmFhF89IW68b1HSJ+LKd7h6CWXXMTh46Fy59kF507rhcrNN8dZw7Yta8
X-Received: by 2002:ad4:5e85:0:b0:6f8:8df1:655 with SMTP id 6a1803df08f44-6f896ed808emr33150336d6.29.1747211109524;
        Wed, 14 May 2025 01:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747211109; cv=none;
        d=google.com; s=arc-20240605;
        b=T8CO9cDYus6f3mkUGWJ5iV7rcNBbEi05K+rH6+Z/putNStNC5PJgGcoeyiw9k+h9D1
         dQ8elNCDcikoJqwdAo+QFrVqO0axOTI8Cq207/I2Uo5CGE+JgkyxXeqamS5exgcsIisH
         B7seZPy6CRDTYa/kA3q2yo31GmmpYP9q6Cyv8iWCN+FwK7kurVQ/sYlEW0GMldiT7b4/
         dAxCoqqyCq8CdWSqV54r/5CWhinj1StCrtykzSnhuJan/763OI1H9tsaY5Elj8ePlhLH
         3dlPIM9fvGMQyroP/kwelQWv49iZbYPlhaG4o8tOVYq1u8B2Q55VpAVAjOKmXQ+HGpoM
         lnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=av46M68xXgOR7pc4VwZhztS/jiJDHfHlHQ56qBxA2sc=;
        fh=k4X1ufopEcfoWk2Bk1uc0BMA+VaT3QKc4AmkLepESzA=;
        b=IcE0N+mmN+WQf3EG2nOMI8ymxoUH3wxnC1bTipwCWmFG4PuMjc/FgDm6Eb/Qh5GOQs
         KjOJNdsU9ycreue3B0IseL2JCluLT4/zdHQfbIOVpaNVkI6CtjXiDGqOWTbzh3QatR0W
         GyzQ41GZEGI9ENM0pf2vNrjX6WLZ2FW0WZxAFIQMC0NqhdFTdTV9FvUKHFtkOQ8eZ36E
         ujgG5M67+OYPboCuDDxH7v7b6vt3xeS28Ge9yJ37bW0pTP/MZWwxk4a2OVcbz4UqifuW
         52GOabCUqeTb4j7KKmf/wxITJjUdRTlC7wCkf9/0CRyVt4wkLmbBdSt2Nx+Qy4To+RyJ
         Hp0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvpsRp7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd1419c993si796514785a.114.2025.05.14.01.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 01:25:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvpsRp7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uF7Q8-0000Ex-Hf; Wed, 14 May 2025 04:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uF7Q6-0000Dx-A6
 for qemu-arm@nongnu.org; Wed, 14 May 2025 04:24:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uF7Q4-0005Z6-IM
 for qemu-arm@nongnu.org; Wed, 14 May 2025 04:24:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442d146a1aaso59974805e9.1
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747211091; x=1747815891; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=av46M68xXgOR7pc4VwZhztS/jiJDHfHlHQ56qBxA2sc=;
 b=ZvpsRp7XNjmDUgXKp/vyT/uYd4cK4VOcfuYzraEZGAp9g5fr6Trj3UKaWmKT81fgO6
 r7oPwiJg3cS+g8YCKNzsRgpoMvnpsB5iBR12scW5YKGlpQn/uvIFojk+ziPsZ1k+iaix
 CssNKeDmquct3pM7eUv2OiC96qNAAva51Gv57TYSk9yuV1NdEZu40Gu/sFDuOp5JvNex
 mwIR3K3EQ8tCh0YhxOeuTmuMbtd+u8pa/2Do9H+LKUNgS3yT5OKSxmdcGK6j4uJWgzC9
 jv8TNjs+A4SZjIKk1wWjT8vSEm9HQf06fj08nAvafVL+2sFfba8iGxefys/Ziz4igm3F
 zfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747211091; x=1747815891;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=av46M68xXgOR7pc4VwZhztS/jiJDHfHlHQ56qBxA2sc=;
 b=EH+XxoNC6i79fPYGjzwgSgrzsv9RvL+qkleYsTkGyfnJN44crAoPtGALq29Wn4L81A
 wDyqv4eH7F+jLEhjG9Bq62iwtFE6IQXgudg2EdJcVYwaUv5WoEijIjix5qKOK8KNVC6B
 MoUSyIMNYudemRlRZSVUHwE72/YuToFoZVH5J1A82lKf1Oen/RXoKFEAdhbuerfwIudL
 TQwf5EvFv6uWebBZDig/s9habS8WQHBal94f9XQbAvGkkB0gPv7oxI+841lPyEs+1rag
 K5o2S3dpBnreDP0zbm4NqRsXCd98AYhdLeuEXuzt0J3pGuYKlJQTYvZs6Mx3vz4XmLi+
 aFvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ3CBbd3yIDFqo2oONENdpRAsYPHWuMAYjaXaYKLpbhZegX85ApflfNBaEjDJKfTc93D+fG79iHQ==@nongnu.org
X-Gm-Message-State: AOJu0YwVE1aiqP27OleVDbEvS7EsaaA6W+xZqN8FN2NgOZiUXJ9oqa9h
 V43c75MTLvq5BbciM5a91ESStRG+qGQoszj0vsChYFmJGwqMcg/xY6rPk2wRM5JvOb4Wh0uHJhh
 pxWKnBA==
X-Gm-Gg: ASbGnctU1YYuagUV1XdNtfyEO+tDBbaPWLFWNiNcuNM4bcNIlpRxIZWoRBZXnCtiDjF
 IyofwXF4NaNVzCGgnZhQPahxe0u7ijvg+7uQBIvQjkhHiiTHcwjfD0k8oIoraTaMRgFnKglw6kY
 GcglX9O/JhpeRlVZSHawYM6xRM8RMeHvw8jd5J12BnresEhw5vVWiC2ZnuWRD88ipNY5wkVGRdi
 G5zWEgs3QXzAi+WLyA0LA+mZRHA6m7h8dU3ljJuDOfDxVMnbYIlYTdvqJUzw/gwqPimwWWgD/jP
 R20RXVlio/WAoO8xW5+gg+B+TxyDW7AmWHdTi2ByFWTrCJAkpYsEQdEEVe2m/BWyL/86Feg1awW
 2Dh4QNm25bPhOlRQb
X-Received: by 2002:a05:600c:a00a:b0:43d:3df:42d8 with SMTP id
 5b1f17b1804b1-442f20b9ca0mr18553925e9.6.1747211090986; 
 Wed, 14 May 2025 01:24:50 -0700 (PDT)
Received: from [10.61.1.204] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f338050csm19216975e9.10.2025.05.14.01.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 01:24:50 -0700 (PDT)
Message-ID: <b6c81748-091b-4d61-8d34-beaa0442aab3@linaro.org>
Date: Wed, 14 May 2025 09:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] target/arm: Add arm_cpu_has_feature() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-17-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250513173928.77376-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: C4CAwg/de/yR

On 5/13/25 18:39, Philippe Mathieu-Daudé wrote:
> arm_cpu_has_feature() is equivalent of arm_feature(), however
> while the latter uses CPUARMState so is target-specific, the
> former doesn't and can be called by target-agnostic code in hw/.

CPUARMState is no more target-specific than ARMCPU.

Did you really mean to use CPUState?
Or is it merely that arm_cpu_has_feature is out-of-line?


r~

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu_has_feature.h | 2 ++
>   target/arm/cpu.c             | 7 +++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/target/arm/cpu_has_feature.h b/target/arm/cpu_has_feature.h
> index 2adfccd9208..352f9d75bed 100644
> --- a/target/arm/cpu_has_feature.h
> +++ b/target/arm/cpu_has_feature.h
> @@ -62,4 +62,6 @@ typedef enum arm_features {
>       ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
>   } ArmCpuFeature;
>   
> +bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature);
> +
>   #endif
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 8c9d161f2ef..759636a3b0e 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -54,6 +54,13 @@
>   #include "target/arm/gtimer.h"
>   #include "target/arm/multiprocessing.h"
>   
> +bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature)
> +{
> +    CPUARMState *env = &cpu->env;
> +
> +    return arm_feature(env, feature);
> +}
> +
>   static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);

