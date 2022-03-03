Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp845227lfo;
        Thu, 3 Mar 2022 08:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytjkrgK5x40+DpN15oMTpYc+9b7T3u8wT2nO7Qdr07fUHgj4SEAF/bDv/9mDiiXktSt5Hh
X-Received: by 2002:a81:6044:0:b0:2db:d62d:3729 with SMTP id u65-20020a816044000000b002dbd62d3729mr14957171ywb.197.1646324948867;
        Thu, 03 Mar 2022 08:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646324948; cv=none;
        d=google.com; s=arc-20160816;
        b=lLayiQ+br3oQWfFkClINHaISWPXUrWF0VYoLwrUDPZXXK20znHUsCN2Qrtxv5fFH5L
         M7X8Y3/ijKCJDe40px+HwUsSviCSSn5090mLrtZe13mPYDKUHKfgUtDsrVmiJ7EDovfY
         Wm9i8BPzX8S4Qv0vmRLYIsQ6L84f2P3FOuAxIPRFPYFPaI1h/zt5aVJVXZoPH5lg6hx/
         7vnEuurTWpIKw1vZjOaiR7BV66Sdqqa1H6rRHNfuhkYfFVRIGqLC9jFMcNvRHwanDqZB
         rqdjzHHHx1r5clFZreRvmUGYe4KTI89WpB7gBBf1cBgk3q28TSbMcjQhyD6RxS8YvEnN
         PCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/0eQs/C9V89avD/GHi71QtNzui5pImpS/5egAbN3FxU=;
        b=rHJoIe+DAptPVWAchLQaH+BM15QeQEAffCXzWUFCMciDcDUN4BbA0gm2Pox7vdHDUh
         CSboaHRC3K038oOfC4MMcAl0T2FFvZrPrtvyKU4RGfQs1cu52HzoKYjToJYcxkB6XnfB
         wrQA6sy4825z0YCchkVhojQWMFs8ClNeI/AsqOCkMSibhQ9VrJk3j99e9d4NIluDkNTp
         yYui12ca4OD2o5FTjMOJKajoy8jVhh0GNXygaxlLFG7B5xMvZnXcDh4rKWqawu1N8Fer
         Yz0idkZOPRBPNL0Rms+/HXFK3A7wSlBCVIN4nWl/LoyiAlYB7Y1t3zVflL+k/dI7ETZX
         qCxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yTALXuod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u185-20020a2560c2000000b0062107f7da00si1847832ybb.506.2022.03.03.08.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 08:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yTALXuod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPoKC-0005c8-Am
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 11:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPo2M-0001JM-8K
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 11:10:42 -0500
Received: from [2607:f8b0:4864:20::1029] (port=54117
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPo2K-0000AW-Bo
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 11:10:41 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bx5so4930561pjb.3
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 08:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/0eQs/C9V89avD/GHi71QtNzui5pImpS/5egAbN3FxU=;
 b=yTALXuodykVMwrvHmyDR1OukkmuJCzlI5ZDAf2RtNcLEjQ1ajPgqnJiWaMgrJfulvr
 vG6euNgVzW6BGu8L7Bfu71XHNUmEwTqZj4rHUMvLJ5VuEefo0rt3b4Nj7Q0aUBmIxHLa
 KJZlG7tUXPS5DZypXQrm1ejesm7iVHAXx/q8KLXmROOn9VgkhMc2nf0Oxf+T4KrE7Xcl
 lV7zMiE60oE5bZAh73O8Cb3Ufj3VtEQNEJOqhI3qgYujssnSw4Q416YKqY3mVAQ8xzn6
 05F88pb/QH4mP7IwQSeeMbQd/TySe+Gbf6oOIZ/tkPZFV7Ibn8rnIUtyVC6+c/TEPoNJ
 CtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/0eQs/C9V89avD/GHi71QtNzui5pImpS/5egAbN3FxU=;
 b=np+6vyBmxH1t//0md55BXsnxJEMfH2bQXB4AZ4ZXaY1wdyFOkr+02k69kPpOj0CO9Y
 dk6F1EP/kfvwNt2FNr/xhIOxZMX0NjP/M6ZIxM9lHhsQdeYHxJ+O4SyE6o9Vs27GPjx1
 IP5+lPsIjlGpg/1p6BDfl0A52zegE2JgB1eOEuugiihmZj9qKJ8hvqGKzxozMG+zDdn+
 S0MyT6Od5IPrjDuLyHULhrO99o8aRrQTveyU5kO9z4lhn6H/aOxa+LCkNB378PQCWP4h
 KYYtEgjt36H4aGY+PTZLS0FqWmloDhwsPVv25+3Mekx2UO+YDjbJ+3URQlLl8SxYag+P
 Dguw==
X-Gm-Message-State: AOAM533SWrfFRGZCZViypccJETdw63zIQteJtnEkVY0/94CxoruZvmOJ
 n9/FPhd/GnbztQ/98yPrB86ikMO1+bq5Vg==
X-Received: by 2002:a17:902:c94a:b0:151:8a66:ee8d with SMTP id
 i10-20020a170902c94a00b001518a66ee8dmr12777916pla.163.1646323838653; 
 Thu, 03 Mar 2022 08:10:38 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm8659399pjp.39.2022.03.03.08.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 08:10:38 -0800 (PST)
Message-ID: <4a7c14c6-4f79-2ac8-e1fd-8168eaf09dac@linaro.org>
Date: Thu, 3 Mar 2022 06:10:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] target/arm/translate-neon: UNDEF if VLD1/VST1 stride
 bits are non-zero
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
 <20220303113741.2156877-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303113741.2156877-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: UYbXAvOhh2Ac

On 3/3/22 01:37, Peter Maydell wrote:
> For VLD1/VST1 (single element to one lane) we are only accessing one
> register, and so the 'stride' is meaningless.  The bits that would
> specify stride (insn bit [4] for size=1, bit [6] for size=2) are
> specified to be zero in the encoding (which would correspond to a
> stride of 1 for VLD2/VLD3/VLD4 etc), and we must UNDEF if they are
> not.
> 
> We failed to make this check, which meant that we would incorrectly
> handle some instruction patterns as loads or stores instead of
> UNDEFing them. Enforce that stride == 1 for the nregs == 1 case.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/890
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/translate-neon.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
> index 3854dd35163..072fdc1e6ee 100644
> --- a/target/arm/translate-neon.c
> +++ b/target/arm/translate-neon.c
> @@ -657,6 +657,9 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
>       /* Catch the UNDEF cases. This is unavoidably a bit messy. */
>       switch (nregs) {
>       case 1:
> +        if (a->stride != 1) {
> +            return false;
> +        }
>           if (((a->align & (1 << a->size)) != 0) ||
>               (a->size == 2 && (a->align == 1 || a->align == 2))) {
>               return false;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~
