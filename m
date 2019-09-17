Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5649942wrp;
        Tue, 17 Sep 2019 12:46:07 -0700 (PDT)
X-Received: by 2002:a17:90a:c383:: with SMTP id h3mr6971442pjt.14.1568749567735;
        Tue, 17 Sep 2019 12:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568749567; cv=none;
        d=google.com; s=arc-20160816;
        b=0lupDQjeA73C+yRlO2/e8OEzPz7LYzcyZbUO8Mbtf7aY1WQ9To16tMK7lW+4uXV/7O
         7Ccaz9xDRrIO3zGeud54tETo25f8ZkQ/mIG0c5srN86rtJlzp0Ba9DiJJXi7y87dinx1
         PWnZk296GJ/ANRz2NqKwBOjDhVBJfZN6/3B2V5uhDK7dExdtMu4fNoVNVBfM2BiVFttx
         CHHGDKrm6XVGnWPjf7dLimZfQ6KlTAsrg+OsI/Bep+sUZEd9e4tXKGEIN+2AS9fNeY3y
         cASvE+ztUfGIdaDH5HDV4rgbdLTesCNJjgRlSaQlWkwXbakm12qKM2fvLmWxd8QPDARQ
         KT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=pCvB+ztKeOZoegWLKI6FHVrttgtkui0XKV3KuK89r9U=;
        b=uw+3tZ2WqmeoVpmadnHEY9a+h7GXmXnndi8jJ/f4P+yt7CcFaJSbg9SBFuNYUiDUIk
         bHx3rku4/qOySkbQLq26s6iS/TILeyMDu6IqT8mDIVMfotOWynt2d8YiiZ2UdIJVgNp+
         q/1QTyIbtPkM6ly5RPTNck+l3mHSu+HKzzGXCt6PWTwMNTghOVCLcRkwQJfQWDAB8X/e
         Vmq2FOrcwPB6lDJ340ry4Hk/rGs8xpTDP13bojATMm8wHd6Y20WTFQ0RzBz54hohAWmq
         tT6pmS1kKxjG6hmF8YWAeDRaW+rOGoFawdoevp/Bjxqohs/MUNvkHFLbHcb9H5d11pLr
         3CFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2oj1J3Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f29sor2849243pgb.10.2019.09.17.12.46.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Sep 2019 12:46:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2oj1J3Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pCvB+ztKeOZoegWLKI6FHVrttgtkui0XKV3KuK89r9U=;
        b=L2oj1J3QLPHzj+D8yfPf4nGiOITeqqIXRJ2ZxNJb/0N0LGagu+NwMVaYND2jKGYTn1
         RJAJ2jjI1wbAstdeT2JIcHj/W7Gp3BO28aeqdWODiYTBzvE/+fzZBM6UD5Wewnu5Y69E
         P4W/u63ECSjGqA2SKKyO6sfoS8si4xkgpAU+TvRZUySEKDaVGVkn+XaJ+l8idljgBa+E
         0XIpF/lWadJrA1qd7z7FW5nra+Ffr/VVclKlPckboVSteyxC7yYdQbCWKQQGrXlTxYYP
         iIZQmpepbyEmANeAJTYyKo6S+FV4zs/22qneRmU46MaY5Nh1dIAPh26Q6d4LQHkQh7zj
         UuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pCvB+ztKeOZoegWLKI6FHVrttgtkui0XKV3KuK89r9U=;
        b=pMH/LenOnXJ6rFpzLCXbTEy/DjKT2/c1j1Tay5uaGi4iegGQZq6NYvzqb2o1zGEEWv
         Ec6ZZARpSlrCePHEPe9QMofGfLfO2yKSnYUriEGYnF+DjHuIY+Exsey0jtUPPKHisoCe
         M7QI+gDF1UmBJRpN60sW23R04MekmKidgQs9nK7sSrsrm9nwgW9mawLA2qKbVxdW9PBh
         TGfMOC6VwnOJOPIRwKN0IkY+4V8h/1FC9aQC5+6pRyb+aGx8A4SbaNePWxv/bbaRX/dk
         elA5bc4IPlecoWFs/H8AjKNIslmp/DEG41+1MPNcTrrFfuEkJHQI7gZnC+01OSm0tevD
         sdXA==
X-Gm-Message-State: APjAAAVESc80Xg+/Tr16+nl+m6mDlerRUFY9Ncr566TijS6piewTqVo3
	a0ieZIcg2FwBqXGeyC+T47LUS1f4
X-Google-Smtp-Source: APXvYqyA+54f/hQvBsW97e3599EiUGVl7tts2IDt6UPp4NNWtzM107WtYZ/KroExwVTPblC4bN/wTA==
X-Received: by 2002:a63:ec12:: with SMTP id j18mr476699pgh.327.1568749567190;
        Tue, 17 Sep 2019 12:46:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id w11sm5614141pfd.116.2019.09.17.12.46.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 12:46:06 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 7/9] tests/tcg: add float_madds test to
 multiarch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <afd9bc85-9c79-a456-73c1-fc19e97d1acd@linaro.org>
Date: Tue, 17 Sep 2019 12:46:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917184109.12564-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Loi+TdQIzMKO

On 9/17/19 2:41 PM, Alex Bennée wrote:
> +    /* From https://bugs.launchpad.net/qemu/+bug/1841491 */
> +    add_f32_const(0x1.ffffffffffffcp-1022);
> +    add_f32_const(0x1.0000000000001p-1);
> +    add_f32_const(0x0.0000000000001p-1022);

These three constants do not fit in float32.

> +    add_f32_const(0x8p-152);
> +    add_f32_const(0x8p-152);
> +    add_f32_const(0x8p-152);

Why are you adding 3 of the same?

> +        for (j = 0; j < nums; j++) {
> +            for (k = 0; k < 3; k++) {
> +                a = get_f32(j + ((k)%3));
> +                b = get_f32(j + ((k+1)%3));
> +                c = get_f32(j + ((k+2)%3));

How does this not overflow nums?
There does not appear to be an assert on overflow in get_f<N>.

> +#if defined(__arm__)
> +                r = __builtin_fmaf(a, b, c);
> +#else
> +                r = __builtin_fmaf(a, b, c);
> +#endif

Eh?

> +/* Number of constants in each table */
> +int get_num_f16();
> +int get_num_f32();
> +int get_num_f64();

This is not c++; you want (void) to indicate no arguments.


r~
