Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3257332lft;
        Thu, 23 Jun 2022 14:30:00 -0700 (PDT)
X-Received: by 2002:a63:4081:0:b0:405:4f9:e802 with SMTP id n123-20020a634081000000b0040504f9e802mr9149660pga.211.1656019800014;
        Thu, 23 Jun 2022 14:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656019800; cv=none;
        d=google.com; s=arc-20160816;
        b=PAutZDgqkf4x5L4OrB1nwthVJnx+3u7pqtYuiU25NsPFdrQEJhVgio1wsQIEjRMo6x
         /NMhhusCbW39KfIJWlj4XLaJVtvrRgO6828arzfUP/eJvSdgSYN/6ed7bkRXbFsq12eX
         otou8G0Jf38bn86QT/2Remv8qPBVlZFxoQMKVpQBtZkbAD4ZaJy/Mlx6uKDPQRTLjI9e
         Z9LmZYk7mzaQeYsZm8EjQuWLtmCTTPGq9P7b2cB1lhORUWPdaNR2EtkVXkQd9g/srPZw
         QIs0b8W3smINUS+PjeCzi13XsgtIQY1BkUOfCDCi31bw0SqAa1c/ZyOYW2TeRdRRVPSh
         3bZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J9l5Pqk/SpE6qJHjy7mA7oXoH1DF/ggN0MIEkkG0yyM=;
        b=Ks9u/HKCCzNsdPogruvi3/1dSknSGJHNVhHJgYCQ32PaawcrOkW0ZsNJUVZe83WflW
         pQBhPctYJfauobZ31Nc5KoXOjjBl28MO8qCXRptCFUswmo5o7MXOoG+s9n5krLZZ819u
         ORZ0gUw3OpUI9zKqC3xVivvQXtzc8ryewLZurvftGzHoun9LWAyGWj4fCy4f9e3j+AGM
         x+VUs9l6smZmtMbd3YVwyYOIQq7Zf+fFSSMtzjuJ3dLKSEgLWA+GXffRlfB8pG2gRtC9
         L/c1kCMs6C6io5nmhyKf4HY0Ms/n2ANw0hlWhq3XY2NVSeVD1ThEzXAWdFvYfGONJUQ/
         jdIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G7FDKjWX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q10-20020a056a00088a00b0050df47534bbsor116183pfj.78.2022.06.23.14.29.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jun 2022 14:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G7FDKjWX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J9l5Pqk/SpE6qJHjy7mA7oXoH1DF/ggN0MIEkkG0yyM=;
        b=G7FDKjWXQiNAjdIthSrN2jH55a0lq5oCQDsxNyB4NFqbZ3FNAKMfjt8MpsTgGTeGPq
         2iSVhwPKSxjZCCCUl1R1Fw9Ps4l4/BasRJRpQ2bCkWDV6fmdOVLnDrALUBVJbk9yTl2S
         UFleheQA5WGkYOI6+okiFRjr7bfwCogGoRnFu6EIcbCeZvanKQl4tv8jf70sNbaLIrif
         T/Uc7N1Ydhi0Zkrz19NKfutK7tsgTH9YPYzzRfyWeNXpFU2TaHcDLLPLxtA4hPEO/Gud
         WuoeL9gTFkqukzxcxD2oOFApI6yqFBDcJfC0/jdR9vp1QpBe0lWv23BdY6Y3pQ4Q2PH6
         n0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J9l5Pqk/SpE6qJHjy7mA7oXoH1DF/ggN0MIEkkG0yyM=;
        b=JNQD0d7hfnLkn/RVHb20gEuXV/B33LfAEpwl8Fb/XLpp+z4bZB3ZURb3ADzD84Tw4t
         jX5tevEOAjup9uCC0YpctKpsVhI6awCvcBENPtOWbBkyJoTu/6C+KyD7gagiFKvv2CNQ
         sn4rH749DBqJo+AKT1bihVV78NFI3xsTiOXoYFnm/vURIWRBx7y4VE1YYrYRB33nAKqa
         emtKP3GriepM2vVcEi3DPgffRZY4F7sc8+tWfTU7rmk0zucS+HrEuwX2dNt+qZEFShWc
         L4O0fuqkL2+XoHJqUor1B2DqH0M/MT5zabE9mhvk0vsQKYgfdusYFTqLrBWQeT+04g/5
         qZfQ==
X-Gm-Message-State: AJIora85MqBH/8dhABLPP3EDIXbvyn4hVwRMuwPTFwswzW4lEA02ziYg
	lQxC5L+dzgElRws9SgqXg+dkT1hu
X-Google-Smtp-Source: AGRyM1vD1ym5ZP8GoMUir3YD96azEX/HOBpoKan92G3qiar5bth9ar1HBopHQzeHnfJPtFb3EfZooQ==
X-Received: by 2002:a05:6a00:d9b:b0:525:7208:3d9 with SMTP id bf27-20020a056a000d9b00b00525720803d9mr663683pfb.82.1656019799506;
        Thu, 23 Jun 2022 14:29:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a? ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
        by smtp.gmail.com with ESMTPSA id c26-20020a62e81a000000b0050dc762816dsm110635pfi.71.2022.06.23.14.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 14:29:58 -0700 (PDT)
Message-ID: <0a1ecd14-69a8-afc6-f74c-18d5abf2e4d0@linaro.org>
Date: Thu, 23 Jun 2022 14:29:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH] include/qemu/host-utils: Remove the *_overflow
 wrappers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220623164051.506316-1-thuth@redhat.com>
 <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xYpZYBLUNomr

On 6/23/22 12:30, Peter Maydell wrote:
>> -static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
>> -{
>> -#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
>> -    return __builtin_add_overflow(x, y, ret);
>> -#else
>> -    *ret = x + y;
>> -    return ((*ret ^ x) & ~(x ^ y)) < 0;
>> -#endif
>> -}
> 
> I think I'd prefer to keep the wrapper functions and just delete
> the fallback ifdeffery, but I guess I don't feel really strongly
> about it. Richard, do you have an opinion?

Likewise I don't feel strongly, but lean toward keeping the names.  I will point out that 
without these names, one has to track down the type of each argument to figure out what 
is, or is not, overflowing.


r~
