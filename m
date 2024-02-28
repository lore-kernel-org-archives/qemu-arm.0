Received: by 2002:a17:906:6c8c:b0:a44:c09:7745 with SMTP id s12csp35776ejr;
        Wed, 28 Feb 2024 12:47:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdbI8bOKx13+EuPzgj+WBtLzcw9Gwe/WaV3aMyDy97G37QofBDqRlRm8OoKeQOdo/NL3V+gJLjTBX1732lNnAhDzyt49iA
X-Google-Smtp-Source: AGHT+IHhx920mcOY3NcdEx97qt/c3isg/bhUinZDW/RKT/H7r2noseZriYmFRim2bX88NnB+24CL
X-Received: by 2002:a05:620a:47a4:b0:787:d904:c4a0 with SMTP id dt36-20020a05620a47a400b00787d904c4a0mr188586qkb.22.1709153226446;
        Wed, 28 Feb 2024 12:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709153226; cv=none;
        d=google.com; s=arc-20160816;
        b=ysMmU6g63n5aDGCH76pyPEyCw9oSADSg/OPbiEH50tVXLYFccHX+bfVNVBhUS/0k60
         ABUFm2ldWoswLOWM1p6UXZdCH/0hZT6rgNW2Eq83LOLAJ26Q8bc7AKyMAelfSdJw3v3S
         XieGBVRfrnnUe6Wbm9wRGnvfiJZx+PYyRVoNTN2DmJgDYoLgKBPZE2QIHbuLXPl+tJSZ
         5l6AXPfcz9yUSnmybeMz3qTNiwcz6kMUb/bhQvIHZYwfawAQAe2bxus8WL3YbFcXkgDd
         3Fcn/fDwyfMsqlo490RjeZa0MvzWixdFpDauzDmE74DfTgGlrZOzgHRF3fdfcQQpnht2
         CImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=TPxX/CUHl7rtq5FN36qC1/v31dE3yPDzQam09K7oiq4=;
        fh=kKYXUVfSXoHRpGsbEA5bvu4MN7y29UUvGOLBwo/yKQ8=;
        b=cMp8V9jdCsScButGBO2ZYHYBz4VrKdVWvx1mX2VaI6g2iC5ep6gdnIBfm0x/L0jIP6
         X1QPV24QJrobhWhaEYrRSIW87zseralYSYoOe3qtpcb4JMTBv1LMTc8oXYnJmbbBWcVh
         CAwD6rGylN95+yQfU5PrQt5/7hbA5/rwWH8HJdEOWDJwk9piAUe3iqibdz7zhSh9y6Y/
         sMGbohklFY5xtnDgDyoPsp+EqKgM22gnc66NkNfhYraGCTYXT0Giza62qUHBhnsTu5PK
         Wu6E1CMU9GwpIpilF+Pf449tm2+PC6S5Mi9yliDIPgDZlWpKGIXg2my5ghV6/C9wjV5c
         Kp6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4KMfwg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21-20020a05620a109500b007877754acacsi320338qkk.533.2024.02.28.12.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 12:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4KMfwg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfQpM-0001Fm-VI; Wed, 28 Feb 2024 15:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfQpL-0001FN-K7
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 15:46:55 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfQpH-0006FI-7a
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 15:46:55 -0500
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5dbcfa0eb5dso136359a12.3
 for <qemu-arm@nongnu.org>; Wed, 28 Feb 2024 12:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709153210; x=1709758010; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TPxX/CUHl7rtq5FN36qC1/v31dE3yPDzQam09K7oiq4=;
 b=s4KMfwg0zmjsdmY/Uw/qVvRG9vcnEqGh9ltkqPIYPoCzGh87AL+q6EZgPSBmWqPmN/
 +EbAn3Fy9L+OK3b8JkJIbi5xSDxbNpuqclaImJPHAvXTvVN+r17tlYJOasvrw7Ms+Jdy
 s9VKpX7JEjZ3rnF7hhh5ZBXYOq4bUW6ehkDk9naUZdOQS/kOMAFx2P6Po5Kz9wbXRA8Y
 u/kKQQQ+poVbvVe/Y+Q8fHgqLp21LqI1slfnzO9A0/6tQMeRLlBosUv0uBmSTN74ggd+
 M3DFYJ5TAzdCZ6fJeaOpSsGaTAwStuIvR/Z2uDVRx2iQtH3E5NDuDWgPtWYXBaOqXL3A
 JRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709153210; x=1709758010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPxX/CUHl7rtq5FN36qC1/v31dE3yPDzQam09K7oiq4=;
 b=P82Mo59U6pvnk1/ZKK++OSxm4hlHTYvcV5LYG/mhhO3I47ENJtWD08y0kBWinWGDjg
 EYTdQQmKZvV4bWC2Tbj/axo2iH1IX/w0BUhHPHlixC4Aj+CO+fSKgcNPkVkvqqrg9meF
 moR2DGYTjRfSWM84u3GHuyfOxsJGiOl8mMhCQebl81gPdJaMvnY8GIeFNKBO8s0ijVqA
 53g7Oxn2JagQrbJYP8nQH/Y8Ws5uagUThKoSsjBYJ3OoiEk3QAWe6zztye9P2dpRHki8
 4EatB+GORcloCiXa7vUMpzF8QUXEaKSihWJGQ6ljh6WX9Qx5izoYvNoOtvyw+VrdSmr/
 InCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEjq5j/RPd8kXnce+Knd/zp8UZccjJ00w1AKKrNkDMrlK6In2PzxtoAIPp61GowqKjh2PmpmGvzt+KpbQAPakeq2tj
X-Gm-Message-State: AOJu0YzQnl6D/Ngzz02QAPmYZ3xeCcUazR3hqJrFb11MkUzB9XLo2kWQ
 TycjwXucmd2jBR1cAZOTpw8/mOJWtveyuywmScysJQvlQlSm4CR703by6JsfdE8=
X-Received: by 2002:a17:90a:d184:b0:29a:be15:9c90 with SMTP id
 fu4-20020a17090ad18400b0029abe159c90mr316304pjb.34.1709153209786; 
 Wed, 28 Feb 2024 12:46:49 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 st3-20020a17090b1fc300b00299ef19177dsm2168045pjb.8.2024.02.28.12.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 12:46:49 -0800 (PST)
Message-ID: <e8af9c95-0d63-4c2e-82ed-f129ba79774e@linaro.org>
Date: Wed, 28 Feb 2024 10:46:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 05/22] target/arm: Support MSR access to ALLINT
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
 <20240228092946.1768728-6-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240228092946.1768728-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: 0kfqzeDtxN3F

On 2/27/24 23:29, Jinjie Ruan via wrote:
> Support ALLINT msr access as follow:
> 	mrs <xt>, ALLINT	// read allint
> 	msr ALLINT, <xt>	// write allint with imm
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v4:
> - Remove arm_is_el2_enabled() check in allint_check().
> - Change to env->pstate instead of env->allint.
> v3:
> - Remove EL0 check in aa64_allint_access() which alreay checks in .access
>    PL1_RW.
> - Use arm_hcrx_el2_eff() in aa64_allint_access() instead of env->cp15.hcrx_el2.
> - Make ALLINT msr access function controlled by aa64_nmi.
> ---
>   target/arm/helper.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
