Received: by 10.223.183.22 with SMTP id l22csp2608827wre;
        Thu, 17 Aug 2017 13:23:53 -0700 (PDT)
X-Received: by 10.99.100.7 with SMTP id y7mr6383512pgb.430.1503001433045;
        Thu, 17 Aug 2017 13:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503001433; cv=none;
        d=google.com; s=arc-20160816;
        b=jQDuLweD1aFvW7h2BWIOvpmbMx38/ujPo0CKF1AcEnGQutP9Ql2M5n6F2mQvORKwsJ
         O4x+M3leHZz/v0cMxFSifU/6UWaldA5U10zwFJPQ/2xemLnYKZ1N8KxBJd0GrfepSucd
         p6cjWJR8FkRRhYogvB7/l/YrUyGbb4xp4kKqyHDeC0HvJ6cZvK5pHX26CL4lCZXiiLze
         y6fhkFxACG2IS+Ja4e3y36fANUFm8EVLGmGOXvyqTO/Nhk4xrP5hMFjbSpKammiao8/Z
         PekOMrww7bYXlHw7HsBx9cyWBqwalxzZidop7sXmplsW/gAsyNxvxS1EXXwmWZnj/czG
         9jLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=5ntoJ6WI/p14qEKhiuzconGBr/EddIsnOiFkKGFcB70=;
        b=mewiebxHIW1RJDKS34CVrFfVYHqfyo/BXO0CVde/R337c78PPpB4ZM5oFmSoCG/Ftb
         Ur9mb5mrFMkvC2hmMhXHbOlaEpT0qJiFWRRZlofdckblJGUjwPbhpTNxLX1vzuynSp1J
         QdR60Lc5/WLSiC8tO6Xv3PwSMU4hzt1EjUSF0LjBauoFMXzWppPUCGAGx9WOHx2/BEiE
         Ot5IzmkCjcnqk4lTXvC6AoR+Ee+KOc0lj74Qj6iwBjytuHDMNWJJRGUVBJGbTKqzq4U1
         SAX+dXKVewgGw/TPyEH1RBGkMxb9OShT2nHwopLrAarU3vdel8tDb2aiBc6p0OTFYWue
         Hv0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYgpJkTL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22f as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com. [2607:f8b0:400e:c05::22f])
        by mx.google.com with ESMTPS id t14si2441628pgn.3.2017.08.17.13.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22f as permitted sender) client-ip=2607:f8b0:400e:c05::22f;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYgpJkTL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22f as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22f.google.com with SMTP id i12so49863876pgr.3
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ntoJ6WI/p14qEKhiuzconGBr/EddIsnOiFkKGFcB70=;
        b=GYgpJkTLipRUQO1GJB7/7wcf5tyNXTUpQMozun7SoWMupwtOcjHDc2WScSzArNm28+
         q8ePzWfDzh0pNqgq+DnCxdJEKmOor9gUX/qffBm8pZAmSjUSIHDu535uWnxsgMx/ZBO3
         Oac4wLgNVQaqH04h3FJIst3hgrODRGLi4jp7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5ntoJ6WI/p14qEKhiuzconGBr/EddIsnOiFkKGFcB70=;
        b=R1ZtRpdYFP1tKyF6gDP6ROMp5nMinfocg9Q3qXyqT2eZsIdFY9QlX73FljVGiyq9kV
         aTShSUEi+dpK/VblKj57cmAU5I1TpFekJfCP0vCpU6t/JyeMCQzHxxqTQNMPFOVC6s/4
         28NPmkOoPLfh0zr3Nss4MlKWRLK01+3D9RJM1x4bA/FZpPc1aJhkKWXAjIgx0bISQXnc
         TGWEf+qKGi9HdR4CHRzNal8+Xqy78rxY7C7R/tbSir8oC8i+erxUIh9spUs31pf4K6GI
         NzkQjsQZNpFFkXaJ3jr4lehIANhRefKRCWZ8zICy7JF/R7QPyWSXnViD52sz4MaIQTmF
         AUTA==
X-Gm-Message-State: AHYfb5i9M+R+ekUUi/9Yf3c5Nxo038D78fXJtk8TmbAhoa39FN32QpDP
	3f3CWoWlBbYDj04ndC8=
X-Received: by 10.84.236.4 with SMTP id q4mr7024449plk.423.1503001432532;
        Thu, 17 Aug 2017 13:23:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id z125sm2257042pfz.108.2017.08.17.13.23.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:23:51 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 9/9] target/arm/translate-a64: vectorise
 smull vD.4s, vN.[48]s, vM.h[]
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, rth@twiddle.net,
 cota@braap.org, batuzovk@ispras.ru
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20170817180404.29334-1-alex.bennee@linaro.org>
 <20170817180404.29334-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0aac1365-72e1-ff17-b9e2-4bdd5c34901e@linaro.org>
Date: Thu, 17 Aug 2017 13:23:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817180404.29334-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: qx1uHloSF9mv

On 08/17/2017 11:04 AM, Alex Bennée wrote:
> +    int32_t *rd = (int32_t *) d;
> +    int16_t *rn = (int16_t *) n;
> +    int16_t rm = (int16_t) m;
> +    int i;
> +
> +    #pragma GCC ivdep
> +    for (i = 0; i < opr_elt; ++i) {
> +        rd[i] = rn[i + doff_elt] * rm;
> +    }

You need to run this loop backward to avoid clobbering data when rd == rn.
I thought you'd put m into ADVSIMD_DATA.

> 
> +                if (is_q) {
> +                    simd_info = deposit32(simd_info,
> +                                          ADVSIMD_DOFF_ELT_SHIFT, ADVSIMD_DOFF_ELT_BITS, 4);
> +                }

It'd probably be useful to have a macro to clean this up:

#define PUT_SIMD_DATA(t, d)  \
    deposit32(0, ADVSIMD_ ## t ## _SHIFT, ADVSIMD_ ## t ## _BITS, (d))

  simd_info |= PUT_SIMD_DATA(DOFF_ELT, 4)

that said, folding DOFF into the pointer that gets passed in the first place
seems a better solution to me.


r~
