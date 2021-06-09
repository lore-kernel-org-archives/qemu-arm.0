Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5648091lfa;
        Wed, 9 Jun 2021 11:46:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEVuq+Nr7dDgRiZVFHoLqKrWuWlsPmVuZv8eM9z0Sr3u+BgVBCE0hVGGF4vVC4byL89Mrl
X-Received: by 2002:a67:ffcc:: with SMTP id w12mr1998370vsq.47.1623264403155;
        Wed, 09 Jun 2021 11:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623264403; cv=none;
        d=google.com; s=arc-20160816;
        b=E6MyPN396SqGfjTZoUpydvVi0FPpHbpsv4IA3mk8Tirou3rPGJwK2lxVXRIePDurhv
         Sbd77hXHOQvTIhuy7Br8lEBh2Yn90iFwIF2Vgxin4hyqyvK2I32Nt2Zd4F/GMHrCiWPx
         T9iNqQMUVex29b3w24EKAm4ZFxiZfAOvr0ra4KkheBQyT0HavnehVXOysCgxgUk5jjhB
         ICVmGzTWMyG734rIN74EdOPJ0EpnQ+p+DeJQmV7AJptEPj+OcWBwPxAMjeyNSioUmwWo
         +t5Hv9bZv6uuPrp9GCIeiVG9TTuXnp1fK0n+hwsc2VDz86+ahqwc1P71QKO658vXoakN
         rZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/Uin4XqPrAz2/vNBHfGwPiaqhkIxO96IYuRI8mGtWpk=;
        b=DV93F4Lh/67u1iUMiFmFquvRH6cwOzW4vd0rysiMLk/wVtai1WadQ4F7uxsrw47grC
         WjH4CDXM7nPwTmDOxhKeN1p7c6cS6EEO7Ll/erEBDJWYvtJx5S24PSQ9lnurzRDYK0mn
         f/p2fWT/zjHFEXdXJA91JYg77opnDZWTU6jf3MMmX9i4GFCVyeQ9HVxiLoWTebMJqmTo
         2ozUWVjjcacRKeq18poFz/g5QaJ0QyXX3ewnX5JgFNMbp925PRffAmKwWXaIgmbLeOXY
         6acT2qUYeG8OYZWdfaTxYaCR/smdod915DTzLsnP0uDxNJ4hEl3uHdNeExyGBJD+WC2K
         WNbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aFNsQAuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si348660uap.167.2021.06.09.11.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 11:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aFNsQAuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr3Du-0004Qu-8e
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 14:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3Dl-0004Qa-TK
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 14:46:34 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3Dk-0001wC-4l
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 14:46:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id k7so1963098pjf.5
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 11:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/Uin4XqPrAz2/vNBHfGwPiaqhkIxO96IYuRI8mGtWpk=;
 b=aFNsQAuwEFATaKo/VXuzkt5Hh/xB/VN2PvT8+ov1M/tMdg7QKsGhaRBZNLilnCbust
 AIkHmV8tZvRJuBbfRvzp39emgepR31JymMMAa1Vcz9pQww+s6gCHRdZYFtLTMLDf/cKQ
 3qIMGcKyyLuYAZKKgAbh7hyZm8YRxJQo/ktd7J48ZwiQi9ApbME2GHejXMiTcz1XECum
 E3ay96OLP6xtwwcC/1ywPSGPlvavpw2LQKYdgfEhtULJMJuydvnwD34DJRffCU0EryDn
 H0MjHQsItPSxgbFTwrBZM8BJwGDP5DKvrRIjI/EoPxJKtlgGJdVW9zGjPERjKPj9siE+
 zbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Uin4XqPrAz2/vNBHfGwPiaqhkIxO96IYuRI8mGtWpk=;
 b=XpdwDgQwMA4OqIzEBiYxyQHcp7N7iUQZoP+1W8aKEuCsB00iZAM5GUSsQP6+5EBjns
 FIzXwBy1ZfErx/ZJWIxCnqXNtjgDLfzzkERjUYNqfAsephSE+e4XYeSjLxDU0J6nxPev
 dwntb4RDxowAu1VBesq/oBR/2w06cYfHqoDWYrrmJvyGGR4FjgRaegg94wc01HnX5NvX
 e+pINnR7lp8FaIohzoLLskPf19a4KeGGkjWmg9YcDaihUcEYrxqgqPC/mzJ3lYzHSfRd
 HmSUlRRItrOmMOPu5O2axE/vpUhIZ9Yy9GrhFrkqHJm1LZGB7UEwMGrmYXuvb+yOw9Pu
 doag==
X-Gm-Message-State: AOAM530EHQMxyuqIwFFJP/0xQkshsnPXcoq3EnzVmLSH5QMs1K2nR9YU
 nOvO9r6gl1kzq5BHN+YbGhsgYg==
X-Received: by 2002:a17:90a:f193:: with SMTP id
 bv19mr12262310pjb.86.1623264390683; 
 Wed, 09 Jun 2021 11:46:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id e2sm463954pgh.5.2021.06.09.11.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:46:30 -0700 (PDT)
Subject: Re: [PATCH 38/55] target/arm: Implement MVE VQADD and VQSUB
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78b08f04-6d1c-4cd8-df76-436b9a2380d8@linaro.org>
Date: Wed, 9 Jun 2021 11:46:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CxlW8wEVhtFR

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +#define DO_2OP_SAT_SCALAR(OP, ESIZE, TYPE, H, FN)                       \
> +    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
> +                                uint32_t rm)                            \
> +    {                                                                   \
> +        TYPE *d = vd, *n = vn;                                          \
> +        TYPE m = rm;                                                    \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> +            bool sat = false;                                           \
> +            TYPE r = FN(n[H(e)], m, &sat);                              \
> +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
> +            d[H(e)] &= ~bytemask;                                       \
> +            d[H(e)] |= (r & bytemask);                                  \
> +            if (sat && (mask & 1)) {                                    \
> +                env->vfp.qc[0] = 1;                                     \
> +            }                                                           \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }

Perhaps slightly better as

   bool qc = false;

     qc |= sat & mask & 1;

   if (qc) {
     env->vfp.qc[0] = qc;
   }

Maybe reverse the store into &sat (set false if no saturation), and init as

     bool sat = mask & 1;

Though if you choose not to exploit this kind of conditional store, perhaps it 
would be better to fully set *s within do_sat_bhw.  That is, do not rely on 
initialization to false outside the subroutine.

Which you choose,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
