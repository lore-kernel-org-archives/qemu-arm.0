Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp99239njb;
        Tue, 30 Jul 2024 18:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNjKfdfpHVw8g0ItV6Py0adkDelPkJzs/G8M0LQgoph6wazFGWyT94U7S01PhtHewYmZbIkfI8nf5klK9nLWUNf5z1UgFG
X-Google-Smtp-Source: AGHT+IEH+klvqW46kNVihxO7MR+lv2rvFfgtgTYUa2WklEoNJ6jFENelv2OzwVvGV72mtGEWnx+2
X-Received: by 2002:a05:620a:25ca:b0:79e:f9f4:3e99 with SMTP id af79cd13be357-7a200c957demr625068385a.1.1722389590163;
        Tue, 30 Jul 2024 18:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722389590; cv=none;
        d=google.com; s=arc-20160816;
        b=HSE3PCc8rp9oHpL5TBZBJXnUPR0pjNtka6lul5Yiw1+8RKWza372SP0M0jJ2RrCeB2
         36+k8bI5Ve4OvInSFgbHEkdIeMiN4ZlJUylBY1GVyntkuIKo/UchN5eZCjSQY6l9IE5U
         NJClVbfKg0UOh9bYNUrZvBj9DQym9F2s12PlPFfKQ5VPPWBbX8RLQy0152lM6Vkl9OVt
         PCAIYSZTeEcMzZRiI0i9/wfhZYxQ9M1p91xJYcPlh6Tj0FmdQQxVauU58xMSDCQvqQVH
         ii18+mfocuSQvNADsw1XzgQ6WMMH31aH5t87RHoLXzM1Fxu19R9pg2M1OpIuj//eWLtE
         OE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1oteILznRxVr7CPFVh2RmwhT/jBsMn+PiHmOwHDEC+k=;
        fh=9bB4u0GwD4cxCOQ9ZuV/muR18HZpfrnIDeBNJDQene4=;
        b=DLGDQompBA3uaeh3txtrMyO/fFg3ar+M0ntIgd6jZwLMrFfbNAjb3IA4b18/nLTA9N
         Yz4E4SHZ4v9ZqjBHhPS50y4APe6MIsvwT/n0tx4L79OwfSEl5vbyczVfySgZcvpB9ti2
         iz//b/q/qYarBt3Di+QeZSuxpN71/GVniXZq4ItIxbMCjVctCnkAVzesJCSj9VNTE7og
         wFmro3ycE8jI1wAzhpb9oy/2rtb7UiX7xhP5X+4mTaBwHWbhKxREvkOpTGtQN7kreZFd
         GIO0pe4DkSaJBsWUsStZKayDJMP/viP6lcON/4xZrSprs/CobjWF+6MIXn4pfyhL8lKJ
         uvVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phKotCfx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1dc4dc775si1294940885a.460.2024.07.30.18.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 18:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phKotCfx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sYyCj-0003yh-UK; Tue, 30 Jul 2024 21:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyCi-0003vK-IK
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 21:32:36 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyCg-0006Yy-TH
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 21:32:36 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70d18112b60so379572b3a.1
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2024 18:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722389553; x=1722994353; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1oteILznRxVr7CPFVh2RmwhT/jBsMn+PiHmOwHDEC+k=;
 b=phKotCfxFqeZ6FRt1VlahNmhaqAxCbJyRsKXfjDNda3pxDHC6mJs+9v5F9HeKCSf1L
 GjLzJ109aNGW8AC8BotiCbrwuIxtFHwLlR101AfdsZvQjWgJmylUH8u6H7/03vngbC9W
 XyyjnGrSm64BopRfLb+q+CvD5VVkewe79SZe4x01aYr6K4XuiARhXrsapwkLlgWVXaSL
 SrelCRn60t670QnyGiuSU3gty0q3bgBWDj8FQoP+AIug/3AlNtlCdJ9rgtvZY2oJoPse
 ad5WHeuBDTucxrqPFWjj7JdwkWroCfWieSnOu5CDvVFsK6TWZ+ApXNX5O+jkt32Ic88T
 oJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722389553; x=1722994353;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1oteILznRxVr7CPFVh2RmwhT/jBsMn+PiHmOwHDEC+k=;
 b=LVvuhSn3vYk19NjsZOkurLGX5D63S4gnStyIfgDsgYwL9wiUEZ468XOGWi/72lMhqe
 F0EPL6t9TfApBf3KiSznUTHtnCLKYGwlIP6Gma6inUUT61wysmS3yUFNawq66fe2bUHm
 6s5fGc8mwVOAa6NIQXPpATUc5j/vdF09yymwZbzK80P+5UwYBdX43sybX9rhXn/RVut7
 vVw/WQBpR2BXuFUDPaDXr0cqINjKzRU8xoYbX8r2xzh6METmmcNHV7UQ5+hnHPLAVZY3
 43veetcGl4RvfDqRfXAxBJH6/xUNWjPe9GeiXA08q/FWxxnq+F9MDX8A3bCwjnZamLbQ
 rIeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNFEhAEO7IhtwbJO+n8pIIfUdRrAzMP1OxjS7MHL1Fy2IJHsS2pDb3KNIMZwXsWczBWsr3vRSFiEcAzrcj9c7VYpiSYWw=
X-Gm-Message-State: AOJu0YxnUHuma3DVa73LzBBRBjeAhRtgjBaKU78Q23knTssjjFIjsOeJ
 W9zdrEPPGmaw22MpA4DRtLeRSvEgu0wf5zgazsDqULw2TrsBcS0GZJroHfnyM8Q=
X-Received: by 2002:aa7:888a:0:b0:70e:cee8:264a with SMTP id
 d2e1a72fcca58-70efe400da0mr7110101b3a.1.1722389553101; 
 Tue, 30 Jul 2024 18:32:33 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:7406:659b:9ac8:69bb?
 (2403-580a-f89b-0-7406-659b-9ac8-69bb.ip6.aussiebb.net.
 [2403:580a:f89b:0:7406:659b:9ac8:69bb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f7d6b09dsm9460736a12.10.2024.07.30.18.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 18:32:32 -0700 (PDT)
Message-ID: <f02477f2-2851-433a-b8d8-0c2b3d1358f5@linaro.org>
Date: Wed, 31 Jul 2024 11:32:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] target/arm: Pass env pointer through to sme_bfmopa
 helper
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240730160306.2959745-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oDjaFw3iMn6h

On 7/31/24 02:03, Peter Maydell wrote:
> To implement the FEAT_EBF16 semantics, we are going to need
> the CPUARMState env pointer in every helper function which calls
> bfdotadd().
> 
> Pass the env pointer through from generated code to the sme_bfmopa
> helper. (We'll add the code that uses it when we've adjusted
> all the helpers to have access to the env pointer.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper-sme.h    | 4 ++--
>   target/arm/tcg/sme_helper.c    | 4 ++--
>   target/arm/tcg/translate-sme.c | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
> index 659867a1faf..f12d903aa44 100644
> --- a/target/arm/tcg/helper-sme.h
> +++ b/target/arm/tcg/helper-sme.h
> @@ -126,8 +126,8 @@ DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
>                      void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
>   DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
>                      void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
> -DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
> -                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_7(sme_bfmopa, TCG_CALL_NO_RWG,
> +                   void, env, ptr, ptr, ptr, ptr, ptr, i32)
>   DEF_HELPER_FLAGS_6(sme_smopa_s, TCG_CALL_NO_RWG,
>                      void, ptr, ptr, ptr, ptr, ptr, i32)
>   DEF_HELPER_FLAGS_6(sme_umopa_s, TCG_CALL_NO_RWG,
> diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
> index 2af2b957cb6..f172225b2f2 100644
> --- a/target/arm/tcg/sme_helper.c
> +++ b/target/arm/tcg/sme_helper.c
> @@ -1080,8 +1080,8 @@ void HELPER(sme_fmopa_h)(CPUARMState *env,
>       }
>   }
>   
> -void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
> -                        void *vpm, uint32_t desc)
> +void HELPER(sme_bfmopa)(CPUARMState *env, void *vza, void *vzn, void *vzm,
> +                        void *vpn, void *vpm, uint32_t desc)

Per this morning's review of do_outprod_env, I think env should be penultimate, as for 
other gen_helper_gvec_5_ptr functions.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>   {
>       intptr_t row, col, oprsz = simd_maxsz(desc);
>       uint32_t neg = simd_data(desc) * 0x80008000u;
> diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
> index 8e9332f1898..bcb502feb05 100644
> --- a/target/arm/tcg/translate-sme.c
> +++ b/target/arm/tcg/translate-sme.c
> @@ -355,7 +355,7 @@ TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a,
>              MO_64, FPST_FPCR, gen_helper_sme_fmopa_d)
>   
>   /* TODO: FEAT_EBF16 */
> -TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
> +TRANS_FEAT(BFMOPA, aa64_sme, do_outprod_env, a, MO_32, gen_helper_sme_bfmopa)
>   
>   TRANS_FEAT(SMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_smopa_s)
>   TRANS_FEAT(UMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_umopa_s)

