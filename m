Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1605623lfc;
        Fri, 16 Jul 2021 12:58:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD1N6httn1xipamTT94zxK2LCNFajnHAG6W1MTm9LPqIv++FFsNaaK8O37uTDyQvCHfAH2
X-Received: by 2002:ab0:6197:: with SMTP id h23mr16166297uan.54.1626465486024;
        Fri, 16 Jul 2021 12:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626465486; cv=none;
        d=google.com; s=arc-20160816;
        b=bNMjZ6rzCQaiV+qAf8TW1usLh7fFOpTHwMlMclXq9leiuPNbWMVAtq3B6p7jm2MpAD
         esgOFxkudee8lNzITRUbfAnw4Gf5SPE8PmS4awdjIa5WcOdzSyyYMm2h8v6N28BnC4Rv
         4/RAJg/8HNJa2hv1GtKKI+Qr9SVj39b/JcvGAn4C4GcTV8k2TCBXalUEDUkiCGefs42r
         Pfvuh+51KHkS5kx7wzMO4qOW4u+6yrI3Cxt8nhtfubdC/EGyEt/0evF6nBryYz4fN0+V
         70oysNFUSf949G8nUvZ3A6wX30VmVaZvMBI6ToeWjxWgkw+F7Z3hSOrE/f6EkuiM4x0S
         G5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mBWvxVQ+4lM+5pd6/LRpX+9YbUiacDr7n+RUY2UmbKI=;
        b=UD1B5vlfrfGyLmHV9MBA5o9eUthbsRwVrzc36D7k17q4LvZN0vrwMth9Ha7e9dFRAe
         u6GEMfF/OVBYgFvPTG9/OVpwnVQz6iw/alAplzjoaD276pCmyxfQoevhZMd5B3ItSc2B
         j9je10M/aMXKxuqhkwq3BvMXw+vHjWpqtEByrxMcneUtJHs589xBwuhdITCafll0Fr64
         IFfzduKJ9LGXLlkuIr536zLTJ+ZxtWrwVw4mE4JykhKEIrSSln61vMBerj4iqQdY9wwb
         Ns6ZRvypvUpdgomuJCEFpyfbC449ywre3YAO2Y/DuJ9ktAwdNopWd1wRbSeZcgkOgq9J
         gisg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fk6zIMtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si10660781vsh.427.2021.07.16.12.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 12:58:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fk6zIMtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4TyH-0007TB-AE
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 15:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Ty8-0007Sv-Bc
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 15:57:56 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Ty6-00040Q-Tm
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 15:57:56 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n11so5853520plc.2
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mBWvxVQ+4lM+5pd6/LRpX+9YbUiacDr7n+RUY2UmbKI=;
 b=Fk6zIMtq6ZXMTClkqh9/hgAskOqRBEMuYO//HQXWcBXOaP8rCp5mtuluXCjVMsH7ON
 qIsK4RE9EzLdDeEc4MFSCXKvwfHptU5Z5mK0P2lEw/e8/JKt1a/aXjjGPMIpyjB+/e0j
 jE89IntlHJOIYwQ9Jqlx7jm3RfeTJ8a/JZRiFLQTFWeletPTn+vSZwE3wvMUl0Dh9Y2x
 FKQlvgA8qUHxvz9IDtbXXKkw8s8/NAGkTRPJEQtqnKKYbs9keNoQJ8dTAr3PS38k6mza
 k4Y5+PdHIgCQ0bBZf7RLXSOeonp9vxNc1jIM+AViORONB0NOaQ794VM9k/VywJkjkw9N
 B+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mBWvxVQ+4lM+5pd6/LRpX+9YbUiacDr7n+RUY2UmbKI=;
 b=j61yH8wbOpPelTmPwerm1afz/pkJMe+TStSBt9fEED1dQKWEtSv+7jvAkEoC5a3ldh
 FlLrqDxWskJO9dZBZqCOLcgFY1rqNl/7CmY+VMm80v2NKygL0vo/Nr0Rd8kUogyhTS8S
 pzIIE20ujX0YI+1Le+wttWFbrlll1BVqIgi+5EyhEJ1Ewq54MpvtMCFRK2pPUxJjxRCx
 At9So2FU9N0VklEpA9W3/qGkTkW2xWI7Xzzy9xhVjzG/am/lsUQJIKdlqbSlQ1RWQ/b7
 s+FEcZXruAgzreofvCj2eDEds/OTwrdmKPShkKvOswDsFJ+nMTaAHUOLTLdNxoc8/yjD
 f/JA==
X-Gm-Message-State: AOAM530z/xPLXmnblhWXGxcakjm5rtJzzp2kvxfjq8/8dNysvDbNRWQk
 Bwr1NYLQBZ1JPiLcQjRLU/9qhg==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr17214198pjb.151.1626465472911; 
 Fri, 16 Jul 2021 12:57:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id a23sm10784892pff.43.2021.07.16.12.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 12:57:52 -0700 (PDT)
Subject: Re: [PATCH for-6.2 12/34] target/arm: Implement MVE
 incrementing/decrementing dup insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <170925ed-040a-d117-9e16-fbee7604f820@linaro.org>
Date: Fri, 16 Jul 2021 12:57:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zOVpJpY4hQyy

On 7/13/21 6:37 AM, Peter Maydell wrote:
> +#define DO_VIDUP(OP, ESIZE, TYPE, FN)                           \
> +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> +                           uint32_t offset, uint32_t imm)       \
> +    {                                                           \
> +        TYPE *d = vd;                                           \
> +        uint16_t mask = mve_element_mask(env);                  \
> +        unsigned e;                                             \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> +            offset = FN(offset, imm);                           \
> +        }                                                       \
> +        mve_advance_vpt(env);                                   \
> +        return offset;                                          \
> +    }
> +
> +#define DO_VIWDUP(OP, ESIZE, TYPE, FN)                          \
> +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> +                              uint32_t offset, uint32_t wrap,   \
> +                              uint32_t imm)                     \
> +    {                                                           \
> +        TYPE *d = vd;                                           \
> +        uint16_t mask = mve_element_mask(env);                  \
> +        unsigned e;                                             \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> +            offset = FN(offset, wrap, imm);                     \
> +        }                                                       \
> +        mve_advance_vpt(env);                                   \
> +        return offset;                                          \
> +    }
> +
> +#define DO_VIDUP_ALL(OP, FN)                    \
> +    DO_VIDUP(OP##b, 1, int8_t, FN)              \
> +    DO_VIDUP(OP##h, 2, int16_t, FN)             \
> +    DO_VIDUP(OP##w, 4, int32_t, FN)
> +
> +#define DO_VIWDUP_ALL(OP, FN)                   \
> +    DO_VIWDUP(OP##b, 1, int8_t, FN)             \
> +    DO_VIWDUP(OP##h, 2, int16_t, FN)            \
> +    DO_VIWDUP(OP##w, 4, int32_t, FN)

Would it be useful to merge VIDUP and VIWDUP by passing wrap == 0?
Or merging VIDUP and VDDUP by negating imm?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
