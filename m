Received: by 10.223.188.70 with SMTP id a6csp288852wrh;
        Tue, 29 Aug 2017 20:49:20 -0700 (PDT)
X-Received: by 10.55.204.91 with SMTP id r88mr196206qki.201.1504064960278;
        Tue, 29 Aug 2017 20:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504064960; cv=none;
        d=google.com; s=arc-20160816;
        b=f+ReHd+duR8c0RoH82JDGaEueHVKHVEjEUsHUApmh+AJ0N5Uo6kWst7RRXYg+F1nfM
         E6vEXeodFQB6LC6BtGAlcSaGUyYzm9Thm0Bi2C9KqPCZXoBawBHKlGm29QAJ72+J46CL
         ectIdGditraxMG+MzsBO0kqlY/Vh3YlV9g1yGmc6q/gdsbh3zMA2PLWdBKaQ1fpkjDtF
         6hb47fK+l5tBSZrLRc/6e5mkzrSkNoIl49GJFEX3oMI+h14Ma6HnjPrv11L0ROsEBle1
         aZfiwpZHrB1nwpHIHDR4Nt7ZKn9dSQUT5DXQdSRMJWb/vWEwI30D3a37IW3ATwuvb6yp
         aXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=Tvswuukwn5v4XeW0lPrBjqmxq0OvzzVjjEcbEMbXXXk=;
        b=nZemUti+L3k+pnR/KgJkcQSuab+rTS7Mpea6iAGgJx2uKGivS6qnOf1NxsfdmWLd1I
         Zi8fNQFdFw37EPvIE2u+/nscsroq3zYpfA8x1XBI06VOs6A6JdzxgYZNF26GOPKbF1d+
         XUY+yH3308w9OM2EZcemHaO1tvkj+AJu7Vebrtl6F0bsB/9lXmMB7HEhBngTdp6jCtab
         Yql3jWyby56yC3GoNKQ9OaXFVymesk40dD1EnpjZJWehMBJHSKmak907LhrDmmfzmIer
         MO31Vv6SZ4snrefHKwpQO6C9cqwhdFEixP4DRmNqMEAUgJfrLWRi83qLzObjmEtSTATR
         5R7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f4YGGEoz;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id z18si4380058qtb.134.2017.08.29.20.49.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Aug 2017 20:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f4YGGEoz;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id o63so4424102qkb.5;
        Tue, 29 Aug 2017 20:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tvswuukwn5v4XeW0lPrBjqmxq0OvzzVjjEcbEMbXXXk=;
        b=f4YGGEoz6voEqSntiewnzW+KFbAmO+/FvZoRX6m23Vqyow7m3X7fh7aDk6DA92SrMw
         Mr8Gd+IjjnCgi3Yl/MfETtuZOJd9pZQHdQDqiJgTSpWojZP/vZN3EG+kdGDG07+tjS5G
         VlA1bF99YGosK4XRG72qs9pebmFif7ntk3fggMXYWR07B8XU0HszlBr675X6UEi4Ctzl
         FrNiCUpg+OxJi0mB+awn7lkNIE+d8fuGSPSRuNAOH4Gw2Ga9Uhr1E3vlG3o6199TmJ9f
         vFwkECuQ5w1gbIR0WeaYxwxvxLbjF9/HLq47AHBN2IeMqFXGA9Vpcr2PnmXODXEftMg1
         l/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tvswuukwn5v4XeW0lPrBjqmxq0OvzzVjjEcbEMbXXXk=;
        b=QsDDTBqGLBjh9bJ9w+wwh/h6Jg452PynCoZVvC93Sv3hJqlFIRpTguWxjc7+JV7cnL
         dkMbKo7r94cx9cwkrgv4MpWgXCStpbevNm3cGc+IMQXPMcQ2Xx8a4HPak6LBgk+9DgfC
         yERpkugZBx3my0qW99tCClPdGDJ2FXe7MJh7KC2baHQoxqitWTOQ9mt+mb772eyOuFxF
         ei4s1139P8gwcT5/uFGtdw68Ef4+8ivu0oEBnca7plk5tRVCt1CbK92w2H32RkqH9H/4
         l9FewgsueDRuAbPsQEHAkFYFSwViuXc+yD5572oLvndw90T+AnH5Ga9aDMnUEYbYgyNa
         vdgQ==
X-Gm-Message-State: AHYfb5jbk+NFdmIx0Gq6OQrsKjvi4VDXZl5NTPPC5xxebnrd2DkyX7g1
	s/n65C6/z86fMlTShrocRw==
X-Received: by 10.55.70.75 with SMTP id t72mr8403093qka.138.1504064959776;
        Tue, 29 Aug 2017 20:49:19 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.43.33] ([170.51.33.248])
        by smtp.gmail.com with ESMTPSA id q14sm3125651qki.90.2017.08.29.20.49.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Aug 2017 20:49:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 4/8] tcg: Add operations for host vectors
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d2deee54-855c-0e28-aaae-4253e1f99a0f@amsat.org>
Date: Tue, 29 Aug 2017 22:34:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170817230114.3655-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: i8rJnPkA7x3H

On 08/17/2017 08:01 PM, Richard Henderson wrote:
> Nothing uses or implements them yet.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   tcg/tcg-opc.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   tcg/tcg.h     | 24 ++++++++++++++++
>   2 files changed, 113 insertions(+)
> 
> diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
> index 956fb1e9f3..9162125fac 100644
> --- a/tcg/tcg-opc.h
> +++ b/tcg/tcg-opc.h
> @@ -206,6 +206,95 @@ DEF(qemu_st_i64, 0, TLADDR_ARGS + DATA64_ARGS, 1,
>   
>   #undef TLADDR_ARGS
>   #undef DATA64_ARGS
> +
> +/* Host integer vector operations.  */
> +/* These opcodes are required whenever the base vector size is enabled.  */
> +
> +DEF(mov_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(mov_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(mov_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(movi_v64, 1, 0, 1, IMPL(TCG_TARGET_HAS_v64))
> +DEF(movi_v128, 1, 0, 1, IMPL(TCG_TARGET_HAS_v128))
> +DEF(movi_v256, 1, 0, 1, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(ld_v64, 1, 1, 1, IMPL(TCG_TARGET_HAS_v64))
> +DEF(ld_v128, 1, 1, 1, IMPL(TCG_TARGET_HAS_v128))
> +DEF(ld_v256, 1, 1, 1, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(st_v64, 0, 2, 1, IMPL(TCG_TARGET_HAS_v64))
> +DEF(st_v128, 0, 2, 1, IMPL(TCG_TARGET_HAS_v128))
> +DEF(st_v256, 0, 2, 1, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(and_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(and_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(and_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(or_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(or_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(or_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(xor_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(xor_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(xor_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(add8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(add16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(add32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +
> +DEF(add8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(add16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(add32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(add64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +
> +DEF(add8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +DEF(add16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +DEF(add32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +DEF(add64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +
> +DEF(sub8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(sub16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +DEF(sub32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
> +
> +DEF(sub8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(sub16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(sub32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +DEF(sub64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
> +
> +DEF(sub8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +DEF(sub16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +DEF(sub32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +DEF(sub64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
> +
> +/* These opcodes are optional.
> +   All element counts must be supported if any are.  */
> +
> +DEF(not_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v64))
> +DEF(not_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v128))
> +DEF(not_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v256))
> +
> +DEF(andc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v64))
> +DEF(andc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v128))
> +DEF(andc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v256))
> +
> +DEF(orc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v64))
> +DEF(orc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v128))
> +DEF(orc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v256))
> +
> +DEF(neg8_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
> +DEF(neg16_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
> +DEF(neg32_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
> +
> +DEF(neg8_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
> +DEF(neg16_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
> +DEF(neg32_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
> +DEF(neg64_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
> +
> +DEF(neg8_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
> +DEF(neg16_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
> +DEF(neg32_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
> +DEF(neg64_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
> +
>   #undef IMPL
>   #undef IMPL64
>   #undef DEF
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index 1277caed3d..b9e15da13b 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -166,6 +166,30 @@ typedef uint64_t TCGRegSet;
>   #define TCG_TARGET_HAS_rem_i64          0
>   #endif
>   
> +#ifndef TCG_TARGET_HAS_v64
> +#define TCG_TARGET_HAS_v64              0
> +#define TCG_TARGET_HAS_andc_v64         0
> +#define TCG_TARGET_HAS_orc_v64          0
> +#define TCG_TARGET_HAS_not_v64          0
> +#define TCG_TARGET_HAS_neg_v64          0
> +#endif
> +
> +#ifndef TCG_TARGET_HAS_v128
> +#define TCG_TARGET_HAS_v128             0
> +#define TCG_TARGET_HAS_andc_v128        0
> +#define TCG_TARGET_HAS_orc_v128         0
> +#define TCG_TARGET_HAS_not_v128         0
> +#define TCG_TARGET_HAS_neg_v128         0
> +#endif
> +
> +#ifndef TCG_TARGET_HAS_v256
> +#define TCG_TARGET_HAS_v256             0
> +#define TCG_TARGET_HAS_andc_v256        0
> +#define TCG_TARGET_HAS_orc_v256         0
> +#define TCG_TARGET_HAS_not_v256         0
> +#define TCG_TARGET_HAS_neg_v256         0
> +#endif
> +
>   /* For 32-bit targets, some sort of unsigned widening multiply is required.  */
>   #if TCG_TARGET_REG_BITS == 32 \
>       && !(defined(TCG_TARGET_HAS_mulu2_i32) \
> 
