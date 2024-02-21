Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2146312ejb;
        Wed, 21 Feb 2024 12:16:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXKUX6W5wUO7C6TgrYum/y6jQL9XYl2/bvLSki8bFTziCrWmc+qqfLyt0YRj9Il50P0+TtV5pkc2me0NbNz1XHeum5nWlIe
X-Google-Smtp-Source: AGHT+IFfgPEzW/eKMeHXkMu8jynkNZ9YMKjmlcVAAoT2gdXVnTEu02fNNqB4yM5Vvt2Ilrl48iv1
X-Received: by 2002:a05:622a:d0:b0:42e:38b5:1604 with SMTP id p16-20020a05622a00d000b0042e38b51604mr2627804qtw.50.1708546596047;
        Wed, 21 Feb 2024 12:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708546596; cv=none;
        d=google.com; s=arc-20160816;
        b=KMSfKY1O/0XgW6itqK5iXC8zvAqYHSF7HdIy6RjKs09cgzuzVLMRZh40RpDyYyObDV
         ujNm7VcRMxN1GRQa0LZy93c10c21Q/6dOZA1vOJP2oLgXK40PJJU5YQrv2X3nyqiVnKp
         vGhu+mVDiSq0MtT3ty2tiV4lD/740qsk7ijgAUsw3K6Xp3/McHv16woQSYgwWs8FnzO8
         yOXGYOMUl7uuFWuPyx+9uO3YNscJlma6TjPQZlrpiB91mM6ezd49OAfjtZPEZiIXRxLL
         9sRrwt28WiCmq2BWsyZdWegq1fviQO3KB4HbLCVVji1uXX7uF3Kf2ArKb14EEyPbxps7
         fMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PVkpFAilUxGp8au5ffoJ9uG8M+v2FG1V+AJA3Dq5Oo4=;
        fh=xtXDyp3K/r1S+0r4LuWi9megmNayZCex7rbg00iskFI=;
        b=gWkLfcM5EYKFL0o18D1SrQ3ydINCK00TuE3/7kK3t+RQVwS6Oa56UsLVsA0KENY8QO
         N9eoEIcSR2cv37C0qak4+A6o+/xm/2tbRSKFtVQOFFihP7sSnojaO8zqeJN4w3TpAvhO
         wnKXHWdtmYmi9iuY06w9uChzImhvh5filxb3oEGWo+w2IDos+JGvlqD3naLds0dZJjTB
         pshQpwB1rAh/d/b0k5AJBKeIwtAPoZfGMxD0NZ9J4Wh5OZGKCaI2zkq4m5VOVjM7ZDY8
         qk+yF260EtOF9v38ZQ3dMjNBQD/vgUDOuLy3dzOmJZ7ztLiLhFXum66i5BF2Mm/d90XG
         zUtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v9/q6JCr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f41-20020a05622a1a2900b0042e1614768dsi7271723qtb.768.2024.02.21.12.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 12:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v9/q6JCr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rct0w-00011S-Ju; Wed, 21 Feb 2024 15:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rct0v-00010I-11
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:16:21 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rct0t-0006l9-6Z
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:16:20 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso34594525ad.0
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 12:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708546577; x=1709151377; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PVkpFAilUxGp8au5ffoJ9uG8M+v2FG1V+AJA3Dq5Oo4=;
 b=v9/q6JCrtpWBfoUATZJ5eZWYIqj5uobMa1+25ZpaPUyM2BXh20lZF5KVQQaJpy5BhA
 hkoExxDvekRQJz9/aAKrnPUhPOnIFpvG4Whzq7BbtWD4Y4W6x+x/9VSAKFVmoCqfsDqI
 eU/0Ol12QVFGsB6iy2mZ1KsEoFzOZ7qRJwgsvZ59MBGhvWFLONKYpUXtusWefkO4c7+G
 aOE4uDfIUpICa5epD2847M0R2Az+q+EdvG5KnQ6Q3q5AM8Q8FpgoUHWLZmK/VHR48BXx
 TZp+gWN66QhoaPk/g4+QrsY9euvYJZ09flkNwQJ3LYyouF8ZtP1mSvQo7w1YY2fEnMFc
 gLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708546577; x=1709151377;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PVkpFAilUxGp8au5ffoJ9uG8M+v2FG1V+AJA3Dq5Oo4=;
 b=f1huWlXSiCbvo8fVdrsfRVVRTjeOjGuHCbhXGlmcq0M8RyyKqLyeqByXXRXe/aywGP
 rxvcyOSFUghn+o1iQ/wo2GR1Yb/jM39MTueteVoqrN2/T2H5sFyoSSeNdNb7QVXsFP+t
 mNuz7BAW2wT6OXT5QmSS9fG7LVMDl65jnD38aWz7vH4RVccJPcToWFKvkBMSmFXryGg8
 A9pG0AYf38GyGaYaK1ZsT3lwSHLAC7cJQBFSqM8mIQoN/4d7pYjISIv0pvAasI/PCN+o
 f1PGEU2vuUPxL2PcX2DojxX4s7MH+aN0JRsjfSR7+bc52L/VZ6esU6s5RQXkA8qWR2Bh
 +qFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmIH0ULtF9+7kYvAePQOTWuZdSkyePBFGzukQk65XZbJlxi2oculqw/CexvIAmT1PwqZuS0DS4wi6UVxQhMfcAmSxv
X-Gm-Message-State: AOJu0YxKhz8XPjEM4yIOrbykLxstMmXGT0COKzaBmGk/f6uYohZDfjgJ
 RR9tGcnNheqAwEJHocKJpllZLBKid/JfwJwGHHfI56NIfd+u09nR9p32qrBol8I=
X-Received: by 2002:a17:902:7593:b0:1dc:1c81:1b17 with SMTP id
 j19-20020a170902759300b001dc1c811b17mr4453755pll.55.1708546577258; 
 Wed, 21 Feb 2024 12:16:17 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 bc7-20020a170902930700b001dc486f0cb2sm88345plb.208.2024.02.21.12.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 12:16:16 -0800 (PST)
Message-ID: <e70ef6af-61e0-4656-a9bb-3b418b96ac2e@linaro.org>
Date: Wed, 21 Feb 2024 10:16:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/22] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-10-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-10-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: Y4HfhvrPX3/i

On 2/21/24 03:08, Jinjie Ruan via wrote:
> Add support for FEAT_NMI. NMI (FEAT_NMI) is an mandatory feature in
> ARMv8.8-A and ARM v9.3-A.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/internals.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 50bff44549..fee65caba5 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1078,6 +1078,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
>       if (isar_feature_aa64_mte(id)) {
>           valid |= PSTATE_TCO;
>       }
> +    if (isar_feature_aa64_nmi(id)) {
> +        valid |= PSTATE_ALLINT;
> +    }
>   
>       return valid;
>   }

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This patch probably should have been sorted before the MSR patches.


r~
