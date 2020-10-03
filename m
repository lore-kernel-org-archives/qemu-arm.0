Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2334159lfq;
        Sat, 3 Oct 2020 02:48:53 -0700 (PDT)
X-Received: by 2002:aca:cf91:: with SMTP id f139mr3130786oig.106.1601718533083;
        Sat, 03 Oct 2020 02:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601718533; cv=none;
        d=google.com; s=arc-20160816;
        b=dK7RFc2XLzApVr5SNrcUcg7lQoi/0ZNYghDsWN7euqx1q7QU9vOxWIMW2PuF8t4QFT
         cJLxYUGxRuNTI4Km5yXZyCRpKMy+F0c9qlpkNiJtqaR4nlCo/6mNcRIm7MFLD8HayseP
         RnVaj12A5L/4fP7/CYBUo6sombpBLWdrA0myV+u5Em1AepcGPblg2cClHQA7rM+sWjuS
         MEWCxiFWs8KY/jApmoamcojjE+VUfFkuYjRAmbaL7Qb7SDVkgQlWWDzIqKF81afzJO0D
         +71u+GZKLf+Mi5ma52ibWHorkesvch204JHxfSsGyR26WS9yom7mqy93pJNeoZ5vb46m
         YLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=reROD41lJiup6iZYSsuhFcjvbHAZP6Y8+IJM5pW4HeI=;
        b=s5yZh5u7KzuW5n3znRNo6VSEeWQSV1iVvv4hO8I9AJ6MQ04RZ7kcio3WZGZQCd+Paa
         z7hVVvQgxUsr7DbLhritI6KBTzqVeTYvHQXdTT4AO/2ralRZPdIiQINt3T+X86Nczd0Y
         GeB+LHTlOmrfJwth/4KI5/GVRe0qujV1VIcqyTJN2XllaLgrNQToN1Q40/+Muz9krF0J
         TkV6OQnVaYkGbFkhV5Kpj3utE9FJ9n58VNlItvhq0/qK8bWa919DdfLXbWFS7WGuNXBa
         3/yAyXnHwX5ONdfrjV7YrzqtkAr3oIObCnqH7guwtOUVBCMOdNuxqxhzVCpjHZzOw91r
         M6Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWdNuZoN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s8sor1853664oon.9.2020.10.03.02.48.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 02:48:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWdNuZoN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=reROD41lJiup6iZYSsuhFcjvbHAZP6Y8+IJM5pW4HeI=;
        b=sWdNuZoNp/SGC8O1o+gdEy3C5k23urEB1dAKsYNbDtYqBpmPE91qz4352lpPe14wGo
         Mjghe/3N7DZNefvUhoz4cGX092xo/HznXvL4fFclS1lB1/w1cIcyhQiCDbTcaBV4LN3R
         8JifkpLVgsGxtSvvCXK0J2h/7PWBL6nFzXnbBsbMT+So/no43D5TxYvFEGem6dDZr1Ut
         g+odFZH9QmiZiY/bgy1dXj/qXnIxY4BN1vZMnfU6ofwZDImCTr0XXN/JSrkO0NzFWwiC
         o2E5+E4aE57ASi0R094qVKCjKmichdgnY7+JPa8fU7Aj4l5JsrOzO12nkidNE5vOUXOM
         V3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=reROD41lJiup6iZYSsuhFcjvbHAZP6Y8+IJM5pW4HeI=;
        b=uKpMd7x3CJJhtuzkm1Hmd3FZ0vEO7IGYr0X+kn1GJg7Ojcym5eLHviyQ/QU0c8qYMT
         fIYvZxhUuBAZPa7HDMqz9ieIxzwHQqFJEhlKU3xU31fni9bYEOY3BsX3tTmryt4MTUPC
         2ECpL2A01BQKtbKi5m3TuXTYnOFoVQh2+9qcq/i87VBPFN5sc3ysgRC9xke0zjuCkQHw
         FUBmTwg1CYX+WJL+29wWcdS+6jpRc7h5Tk4+QNOS6OYE6tDVm0ZjUoCRKuQx7GWRjOhM
         OZgn26L+Tqar7sxeA04a1T50CDrd0DivVthHJRgpzIq0SqLb1kd2HZRuu3eupIOEbDrl
         avyg==
X-Gm-Message-State: AOAM532X0ol6X9FDuPA3cwPIoGfHFFc40B3b9jKahxAnfwDndMGlBZAk
	iDdjFAZNvkdkXmXYocbp1pqTn0ak
X-Google-Smtp-Source: ABdhPJx4UssWIUrC+FErQ3GDoZmOAg3dnXteUU8ca3qiO7110tjet5RiqpvMFtfazMzjUfQyFVWR6w==
X-Received: by 2002:a4a:c541:: with SMTP id j1mr5129157ooq.13.1601718532719;
        Sat, 03 Oct 2020 02:48:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id m6sm1077388otm.76.2020.10.03.02.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:48:52 -0700 (PDT)
Subject: Re: [PATCH v4 09/12] target/arm: Make m_helper.c optional via
 CONFIG_ARM_V7M
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9af8896-efec-c850-655e-1d1eb2629762@linaro.org>
Date: Sat, 3 Oct 2020 04:48:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AwQqqMnf08fg

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> +arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
> +
>  arm_ss.add(zlib)
>  
>  arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
> +arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))

I'm a bit surprised about adding the file twice.
Since ARM_V7M depends on TCG, isn't the second line redundant?


r~
