Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1034316lfb;
        Fri, 15 May 2020 19:51:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKT5l+H5EMpbRSz4kD5l0hL8HN72kWbBRMT9hq/Io967R9CoKFJN4S8taf+AhbbWFoBy5b
X-Received: by 2002:ac8:1622:: with SMTP id p31mr6473489qtj.256.1589597473995;
        Fri, 15 May 2020 19:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589597473; cv=none;
        d=google.com; s=arc-20160816;
        b=oXgFuQFPkAUdtkfdshv0Nj0/WQO8F9pSA3CVWP13yqPv6vkE6Kdq8s25IBgxQZfOoZ
         iqKU4gSYoG/QIOndMHyWhOx7kAVX3FIlGc8ZRt6pkcYuNNx8TmGBDsdte9o0+lewOnjg
         zZiXH7vGpKz9wcWkNYw36WJ6fAhHUbFJtjWv32vk4Q28m0MsoL+znaanMC/cQElxGdEk
         8huaN2aRgrhErswCofv6S0CDg7J1G33jvvJqXb4PYJUY6hGfHkagRHO7u2Gq5K3WjVKt
         mdFYhlkOtqFIsTBvB4iXUUmONmwI+eOTay0os839720wmWwL5mk9R1r5q2OZMsa0neI6
         1+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0X0Zx6pEY1UHzRJ1SYAG9EDHSAXIFkMXfeOz/bWm+bE=;
        b=y07Rvh7sZxnOUhVLrXiey4NdN2dFVvgTdfu9TaA3yzsTAeTJq5iPeORsza+RzPwKFa
         b4Z1Y5OWhNSG9+AXuWkFuRPzDCiVcJcMFBMGNKYOUu2BrrpDYkFtQK4/jXEPd1ynEiX6
         S7fPFHGBaml55D5kHFMzFnNOrK8KE5trIUB19aTMOOgxd68LwN1NQgb8WWXqhi9vqb82
         rU6JjOTqbKLsfrr/BwMu2lOzoD4nwFk5kFQ4HKx23LeSqfs5umBhZVrQAXPuzlFYP5d3
         cm1NWpbZX8R63NBN6tIJcuu49gq2XVk5lg1VaJbaL/XIWALOuerNKUHHZeB3xZoGuUIb
         mIYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rHGNfYex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u186si2226565qkc.342.2020.05.15.19.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 19:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rHGNfYex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZmuv-0001Ec-CR
	for alex.bennee@linaro.org; Fri, 15 May 2020 22:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmun-0001Ch-Iq
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:51:05 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmuk-0008K7-TC
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:51:05 -0400
Received: by mail-pl1-x643.google.com with SMTP id k22so1667689pls.10
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 19:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0X0Zx6pEY1UHzRJ1SYAG9EDHSAXIFkMXfeOz/bWm+bE=;
 b=rHGNfYexiIg+HWlfZRVVBtzUzT+dLX4kBQ5wTRYQd7BC5yD9GJ3LHWd1JWrn3xXBWG
 16M6olHT3lMhzNcUJ6fRCGmTgPemxk1OhXDfpoO3T7f6GACOYC7/y8TwzonP5vx0PCnp
 EobhLT3VWFgxqnIY4DMCNKJOf1c9kqG1vONFcuw8APAiMS5Qc7k0+ik//cbdhzcKvImQ
 tiHcQ0gHDauDNqaW3QrWiDvVRyPoI3TCdWoj40Xx8JcwkvLllGWAw9CisNbP6+YDkMTb
 0LqVAK+U2utnHTXaUMFKvyGj0A954LK3e23meqJr9TnujiqwV5F90Iob+NYtoM4v7Pkk
 RtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0X0Zx6pEY1UHzRJ1SYAG9EDHSAXIFkMXfeOz/bWm+bE=;
 b=NWv7+6eIz6hQD8Q79UJ9sQItBEGzPR15Xv8IB/acy8QGbH6bjZ79zBYfhp4mIQSuz7
 +Zu2l4JEtn19htpObwl9vjAW7lx8Gs6StOXL9CUXY3pwzV1NU46NTU3vmxks5DOGD8jh
 ifHCcqM7wARILkXrSbihXQh9TAtXbdgTQ88AvmPmvnuw/Q1dJmD6Ecp3irBW7XG/VZMd
 yYBuZILjfm9hV2Dem6XR/K3mIQBeojFMavGk1QvOo/QszDJsJdcv5yvd8AaRmVDtRtE8
 ArXF05I11DN/uA1Kdq6999dYZW5xBL5mbWYYHW/3llkErNXoSwgWSGF6uEx/zzUoKWpr
 Mx/Q==
X-Gm-Message-State: AOAM532phHa+wIsYfKwRtIMrkj14EwOw8DrN/QQHj9Q1ZfSDT/lOiGW+
 Uv/dG23HYLTG/afF+f+kt92M7w==
X-Received: by 2002:a17:902:7202:: with SMTP id
 ba2mr5420393plb.93.1589597461198; 
 Fri, 15 May 2020 19:51:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s136sm3057676pfc.29.2020.05.15.19.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 19:51:00 -0700 (PDT)
Subject: Re: [PATCH 10/10] target/arm: Convert Neon one-register-and-immediate
 insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96522b6c-8d33-51b4-cbdb-e8973f6487b5@linaro.org>
Date: Fri, 15 May 2020 19:50:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mJjxQMmMzNRZ

On 5/15/20 7:20 AM, Peter Maydell wrote:
> diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
> index f27fe769f85..f4eeb84541f 100644
> --- a/target/arm/translate-neon.inc.c
> +++ b/target/arm/translate-neon.inc.c
> @@ -1821,3 +1821,154 @@ DO_FP_2SH(VCVT_SF, gen_helper_vfp_sltos)
>  DO_FP_2SH(VCVT_UF, gen_helper_vfp_ultos)
>  DO_FP_2SH(VCVT_FS, gen_helper_vfp_tosls_round_to_zero)
>  DO_FP_2SH(VCVT_FU, gen_helper_vfp_touls_round_to_zero)
> +
> +static uint32_t asimd_imm_const(uint32_t imm, int cmode, int op)

It would be better to match AdvSIMDExpandImm and return uint64_t.

> +    case 14:
> +        imm |= (imm << 8) | (imm << 16) | (imm << 24);
> +        if (op) {
> +            imm = ~imm;
> +        }

You could then handle case 14 op == 1 properly here,

> +static bool trans_VMVN_14_1r(DisasContext *s, arg_1reg_imm *a)

and you wouldn't have to special case this at all.

> +{
> +  # Logic operations, ie not VMOV or VMVN: (cmode & 1) && cmode < 12
> +  VORR_1r        1111 001 . 1 . 000 ... .... 0001 0 . 0 1 .... \
> +                 @1reg_imm cmode=1 op=0
> +  VORR_1r        1111 001 . 1 . 000 ... .... 0011 0 . 0 1 .... \
> +                 @1reg_imm cmode=3 op=0
> +  VORR_1r        1111 001 . 1 . 000 ... .... 0101 0 . 0 1 .... \
> +                 @1reg_imm cmode=5 op=0
> +  VORR_1r        1111 001 . 1 . 000 ... .... 0111 0 . 0 1 .... \
> +                 @1reg_imm cmode=7 op=0
> +  VORR_1r        1111 001 . 1 . 000 ... .... 1001 0 . 0 1 .... \
> +                 @1reg_imm cmode=9 op=0
> +  VORR_1r        1111 001 . 1 . 000 ... .... 1011 0 . 0 1 .... \
> +                 @1reg_imm cmode=11 op=0
> +
> +  VBIC_1r        1111 001 . 1 . 000 ... .... 0001 0 . 1 1 .... \
> +                 @1reg_imm cmode=1 op=1
> +  VBIC_1r        1111 001 . 1 . 000 ... .... 0011 0 . 1 1 .... \
> +                 @1reg_imm cmode=3 op=1
> +  VBIC_1r        1111 001 . 1 . 000 ... .... 0101 0 . 1 1 .... \
> +                 @1reg_imm cmode=5 op=1
> +  VBIC_1r        1111 001 . 1 . 000 ... .... 0111 0 . 1 1 .... \
> +                 @1reg_imm cmode=7 op=1
> +  VBIC_1r        1111 001 . 1 . 000 ... .... 1001 0 . 1 1 .... \
> +                 @1reg_imm cmode=9 op=1
> +  VBIC_1r        1111 001 . 1 . 000 ... .... 1011 0 . 1 1 .... \
> +                 @1reg_imm cmode=11 op=1
> +
> +  # A VMVN special case: cmode == 14 op == 1
> +  VMVN_14_1r     1111 001 . 1 . 000 ... .... 1110 0 . 1 1 .... \
> +                 @1reg_imm cmode=14 op=1
> +
> +  # VMOV, VMVN: all other cmode/op combinations
> +  VMOV_1r        1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... \
> +                 @1reg_imm
> +}

I wonder if it's worth repeating VORR/VBIC so many times.
You can just as well do the (cmode & 1) && cmode < 12 check in the trans_ function.


r~
