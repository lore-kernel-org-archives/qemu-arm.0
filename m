Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7550805lff;
        Wed, 15 Jan 2020 14:46:30 -0800 (PST)
X-Received: by 2002:a5e:8d14:: with SMTP id m20mr22651567ioj.282.1579128390586;
        Wed, 15 Jan 2020 14:46:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579128390; cv=none;
        d=google.com; s=arc-20160816;
        b=zwGeCiymBk3klxDrpdLMHmeX1hW9OmQXrQrXH6ld06i8qeLY4mJ9u0YSGMf5KfjMMh
         Z50cv5UgA5oOgqFoZ1gcif30Pa7o0uQmLJ8pcbx9KPyUvK3cflfsQnfmOEpQXoPalwdi
         UBgHQJZhOhBKuSQpKWhUGOGOpYA4jShT4ZheScTEI8OdXGApJA9QkEL4Xvh7U8rTEbHs
         KjviAo6gCU0BCTh4CeK0S4Jsvy5Y1uC3uY7p9RySrVx1gTpUvZVHo9Hacks2CTATXsnd
         gw0KhRHWyc7CnXvCrkVZGt385BRw5DUekaYw1MDEIQ97OwKmFbiL0OY8APtZqzTjyhar
         T2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=qf8LJpxXCPca50BvU5HXYv2o9w7EnnZUiPaTuA7YnC8=;
        b=BYPvTPrdIt+ARVpqd2s3cmSsoK2xsYigWq6+8CzD/FWWDctTp7UMJgByGb9YIhikiS
         M6dPVKe7Y3ZJlayH2dtH7Y5u4UlOgqlf8HT70NRm1OfoozRYhFuuNVqkTAw99k5mTW9H
         JEEaAfmU7AFOkiVYR3fCVKcLC6mUkjdj+i3mK+MEtacH71c36nBAqhowU6sz/rTwtTnw
         g+hbFzOG98RZX8I/ApHraUq3p2zNrxaGG/MuxKgY2e5nQBi/taC3qaqRbgjgRJuTEnMM
         V3j8gs07CXtWxZxlvG6FQEYQPol+tz+YJB0w4RXyXbUjHL6oGdZ7Wo0ZJsswgl0FOQ6i
         JxDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MIQabkcx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n8sor14419627ioc.64.2020.01.15.14.46.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:46:30 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MIQabkcx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qf8LJpxXCPca50BvU5HXYv2o9w7EnnZUiPaTuA7YnC8=;
        b=MIQabkcxFFWNtGeMJA/r6yy4Uf+cXQacFxXYe7kWEVWU/4apwBQhVFMPvu/3zYGBgM
         g3f9M9bDyKZH1qOBuHnkj5Uba8YyI1H3sZCtbiMsUw593VDdPbfq3swKFN2kS8/kZ3gN
         lwqQqnrAGgY2ej1ptokARTD3KWnsvIZt/cXmbA38h/LiGemqWvZpGnD6PfmU5Hb+an2C
         uDt6k04Ig0L1HVtTRt6uxrU4QtLzBRncsPsqv5t5nZkqRC2EhrIpeli64vkwcepV2pA2
         28x/7NrFK5my0tMKEbdBKVjIDpXMBi2GrI04TeH3XFJc8kaXgNk0hRo7yroplzmZznnr
         i04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qf8LJpxXCPca50BvU5HXYv2o9w7EnnZUiPaTuA7YnC8=;
        b=ZAOdOM/YAxqUMEbBi832VIeBF9/GzXe9EXEGyu+RvzfX1WHlRvKT+U3b8NYcStC1HT
         1FaqEHK8OSBZjXQWy2P+q4bmCPqrVIXWmZKuNtpQskt00Lo2TytnrTCwtai6a1/iLdzg
         +jfHDYeYrvb2mN8+es917VZG36f9lwVSyevStW39vTP+3oip9INbCfy7c5u6+5iPU2sw
         p03xYuwZzoosbvV6Jo/6JuIiREGsS135LJrhHFm8eSOMbub3HzQIQdZmzaM6J1k1jt1d
         rJjAJijvh0iDXR6WmOrpABvN01FIVosgjfqP0XVjxVS2ZTJAREwnjxuklTlQLr63TS8F
         XaIA==
X-Gm-Message-State: APjAAAXjV+943mp/yRlkbYvwGY4OB4KCfwBKcsCz3aPQ8otqIzXc20IU
	eVrQt/BzuWCLUGKQsT0wuk8iofP+
X-Google-Smtp-Source: APXvYqx6YydqDUPcyRoA/WMKO09xvqfX6y3pJhq3N078knsBE9zCBUnCPJcYHXSEwI9Fw3Q/y859Rg==
X-Received: by 2002:a65:66c8:: with SMTP id c8mr37350285pgw.161.1579128390001;
        Wed, 15 Jan 2020 14:46:30 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id o7sm24349273pfg.138.2020.01.15.14.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:46:29 -0800 (PST)
Subject: Re: [PATCH v5 19/22] tests/tcg/aarch64: add SVE iotcl test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eef4b299-26fc-6e46-186d-c63d1fe47991@linaro.org>
Date: Wed, 15 Jan 2020 12:46:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: DuwpWzjbEt7K

On 1/14/20 5:09 AM, Alex Bennée wrote:
> +int main(int argc, char **argv)
> +{
> +    unsigned int sve_feature = (get_cpu_reg(ID_AA64PFR0_EL1) >> 32) & 0xf;
> +    /* Exit early if we don't support SVE at all */
> +    if (sve_feature == 0x1) {
> +        /* we also need to probe for the ioctl support */
> +        if (getauxval(AT_HWCAP) & HWCAP_SVE) {

You should only probe hwcap.


r!
