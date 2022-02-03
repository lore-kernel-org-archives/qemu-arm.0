Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1583543lfk;
        Wed, 2 Feb 2022 19:59:21 -0800 (PST)
X-Received: by 2002:a62:b40e:: with SMTP id h14mr32436881pfn.79.1643860760770;
        Wed, 02 Feb 2022 19:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643860760; cv=none;
        d=google.com; s=arc-20160816;
        b=CxvARakg+YGse5/8LMWqieac4wDJ5M7Yy/CFNwAg0FbNc+bBx8a2oNsc5KDx8Wa3rl
         KVuSitIB8oO5TxshnZRgJH6X+vdOp2C16SipovKD+ZBs6J+y0bYEnvkyU66aaFQU9X2U
         qHWiqOnhV6IViijQg4icZvf+bDoiOyg9xYfCsp2XTcwCrdwo5LmAe/0KWfaSeLkLhUsr
         JUgTvvb+E0H1K62zS/emcpeFpp1vWddnalB3WhXNV/r85jbNcG9NJhJH3ToNovdhXdf6
         +dBqVEfYOcxYiEOB+Qh+8/JIkYKn3fuRY216j3R+qoJymTNTHtrAVetNPepZsvIfRPc3
         LYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zt6WytAulzRER2fkBm+Sow/hJOZpD8/PhHpwcscIyhc=;
        b=dAySwejebUGD9QDyRbqA0KEtes2bqe7t02UuW1exP7DRPnQgmY5s7WI4uQP/B3/XNV
         TV0/qCtM0Bmr+xOaRhXQ7cJdRfHcqYgVTqO2xt3MEXgD/ttyTrXdYOK1t0AS9YJ5GjRP
         N4t+wKh8AgUxdOzlTdixy6bqFMVGswE1WdxzeMJaW7wLGL5LNurZjbwK3kavWxxrlGGr
         S1PJVRusH1XhKA9qt5Am26O7/y4Ol3WDiEgG9kjJbXAEYuMPcDsZ7esPVn1oCsszW5jJ
         9VQ6/8ivzTUuO5m3gOktUWjJjdQmgPmIlYAn7SxH+5RkTiNk3VUvKmKfzfI/Sv8thSmA
         Qt+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rajs1tri;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x62sor5275585pfc.51.2022.02.02.19.59.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 19:59:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rajs1tri;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zt6WytAulzRER2fkBm+Sow/hJOZpD8/PhHpwcscIyhc=;
        b=Rajs1triwrR+L2t1ZBTkZo46hCqgFQknVyMnsDcisUSHqxOkoQGtOZw6p5mNvx7Vrh
         dlQdFJniaHbnIZfD9zUvtD9jIVdD13pEecq9TV6CX5UkdPySIHx1cWDN2Vut8NlijG4d
         b9KXW8TuV/pG1XAMPuGSEhtURV1/l+Li9l5sGPGw2JWwpVxxmMVL7Eb7itlVj485E3Nr
         CEvwh8a7HgZqHOe5nSWBKjC7enu85ZTdLRoPbptXOy7vPiZuOSPhAaVQ3ILpuyJL/POs
         Jekl0lUq+VDzYPIoAq2vV1e1oL/1FojJUAUed9SByaS31jfNXwPBzM0buip36Q5GoxKz
         wtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zt6WytAulzRER2fkBm+Sow/hJOZpD8/PhHpwcscIyhc=;
        b=wi7CMznm68iYrPulDMW854UFBER4kVIX+5WfXKxzbY+qVF/ePJBu6xaYUltD6SW5fT
         HcQUVqNsS/YpDXfu6xhyG5betdwiBoe/1V2FVx5YZ/OxtCY581C3Y0ZDQqO3jMXj3dfb
         KDnVx8ETdwI4xMmx/MJCIDBT/klBmcSUeaSBN+RMTRw3No+fEFtXZAAnmWHBvwFshVau
         kA6L/vIk7M4+8wsc9Tylvr2Eb2AXFQhHVx/vY6mCAwIVqLL8h0tJVXNT7nXOOrRPSDWx
         w7rao+hz00qfeTwJIycUqipxAiAHEg7QREf0BHG1eZau3Jep18162avuB9ab6T1F8oAC
         jwbw==
X-Gm-Message-State: AOAM533uUdoXZDzSycoTIlnDfi0CiyT18t/jDzwvP0AqR3fuEjOHBQro
	6zUx9MVWMxfECtr9VtWnFC+ktlQffHS12aQH7oQ=
X-Google-Smtp-Source: ABdhPJxgbr1fUpXrG+mQtJ9xNg5DVGz2Z+KuD7K2f8mNhLddnjZxyQLQgP7tuyrMCV7xQJ8NaWLi1w==
X-Received: by 2002:a05:6a00:2402:: with SMTP id z2mr30666869pfh.42.1643860760168;
        Wed, 02 Feb 2022 19:59:20 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id v12sm5561422pgr.68.2022.02.02.19.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 19:59:19 -0800 (PST)
Message-ID: <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
Date: Thu, 3 Feb 2022 14:59:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/13] hw/intc/arm_gicv3_its: Fix address calculation in
 get_ite() and update_ite()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: U5TWkd6/VG18

On 2/2/22 06:32, Peter Maydell wrote:
> In get_ite() and update_ite() we work with a 12-byte in-guest-memory
> table entry, which we intend to handle as an 8-byte value followed by
> a 4-byte value.  Unfortunately the calculation of the address of the
> 4-byte value is wrong, because we write it as:
> 
>   table_base_address + (index * entrysize) + 4
> (obfuscated by the way the expression has been written)
> 
> when it should be + 8.  This bug meant that we overwrote the top
> bytes of the 8-byte value with the 4-byte value.  There are no
> guest-visible effects because the top half of the 8-byte value
> contains only the doorbell interrupt field, which is used only in
> GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
> cancel each other out.
> 
> We can't simply change the calculation, because this would break
> migration of a (TCG) guest from the old version of QEMU which had
> in-guest-memory interrupt tables written using the buggy version of
> update_ite().  We must also at the same time change the layout of the
> fields within the ITE_L and ITE_H values so that the in-memory
> locations of the fields we care about (VALID, INTTYPE, INTID and
> ICID) stay the same.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 19 ++++++++++---------
>   hw/intc/arm_gicv3_its.c  | 28 +++++++++++-----------------
>   2 files changed, 21 insertions(+), 26 deletions(-)

This is confusing: 5-3 is titled "example of the number of bits that might be stored in an 
ITE"?  Surely there must be a true architected format for this table, the one real 
hardware uses.  Surely tcg will simply have to suck it up and break migration to fix this 
properly.


r~
