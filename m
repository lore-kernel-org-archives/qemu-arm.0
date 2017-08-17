Received: by 10.223.183.22 with SMTP id l22csp2600785wre;
        Thu, 17 Aug 2017 13:14:26 -0700 (PDT)
X-Received: by 10.99.43.5 with SMTP id r5mr6051600pgr.313.1503000866241;
        Thu, 17 Aug 2017 13:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503000866; cv=none;
        d=google.com; s=arc-20160816;
        b=hAs/Rxg92TbLfZ41u7k4mDRit4rmnvChM/EV2rItszAUTz563n4C8e37cqt6xGNufy
         LqaO6zx8CU4EnjUOUibg2B94X+Qgnh02gSulhkCSbCVvP2eb/CJtqm30jHC1WxaOQ1+r
         bJtJw/Heejs6cDJ3JGsbA6aqMnVFkvQlmhDWrfGtpWmIrHn92x2yfgDmI79D0rEFhki0
         Ac4r/lDQ6aFwVFaFv5FQsm4wdjWMYAocEsM1+lOqM38A2vQXjBefiF/WxqSKTL/b3CeD
         jDtN9nTNwI5wILQgMLHm/YgsarsOzFGxvdbUcuClAwKnQDSW1vZO0mIpkRp3nxtj9fPJ
         14TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=2hz+3hhto0pQ81nNrRWmept0WBAQPHlK2qU6cEjZt9w=;
        b=ZEq3LuvVFXz+lIEWg6EJeNde1lN5DUsFOTEc54dK40nxq60YJPzvirN1zfnW50+0DD
         OtHtyA5ul6mdYbYHfo4s2uxX8Gt6jBOEB6IFAhrx3zBMcb1YVj5Jtay/l6U6KpOCAB/Y
         uHdH+cWq8xs/DqXT/HfhLt8n4AJhY8fqZC1lutgztFUDEKDId/4TxLDPGWOYrHIfvaei
         P9AL8tPZdRtS290c6QZ0zS9bj5IEU6EXcy5/ekE+EcBMlNqt4ee9Eif1vgnkjy1hvAjb
         /7dLQd5WMYh5AjA8uWF18AckqVxujHkbtcM1uuiyQFcAPFuoSIUefR7rYnO5fRrCkizx
         VmNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bnOu9DeU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::229 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com. [2607:f8b0:400e:c05::229])
        by mx.google.com with ESMTPS id a5si2677277pll.285.2017.08.17.13.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::229 as permitted sender) client-ip=2607:f8b0:400e:c05::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bnOu9DeU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::229 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x229.google.com with SMTP id t80so22100904pgb.5
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2hz+3hhto0pQ81nNrRWmept0WBAQPHlK2qU6cEjZt9w=;
        b=bnOu9DeUsnrfzteVAY9/+V7E/T6uplI/VVb7ReyIgozVVzLdmbAd/2jB6ZXnCY6NuI
         Ik9d/z31KuBHmzd42nucI2GlXGrv/wR0mJKM4EjE5MqKUClbM1bAUJy+6idQE4bWoncO
         vIOd8kCkQ1BnLobqpKYOTMzwppBDncRDsy0ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2hz+3hhto0pQ81nNrRWmept0WBAQPHlK2qU6cEjZt9w=;
        b=inAUziNqRisF/iwxQDqzmfo5ZA7PDRl0ypZBUDAnPO6OpH6jtRJ18UHsPggXsjQE5E
         ZvJ2char5n9/p12CcYVqnRSid0MTjK2l1dS+/7jgpYUAum5W3hDToCrfLWIrbtgEiNIT
         zRYQAiXi9qlIWR4gH7wiXr2z9kgT/D+rqmEg7ihKZ5d04VIAQGUYCHu1hooAwsw+y0xO
         mUyBtdNJ+7vu65B5U4eElHClcd+87qR8vEWQ9nX4Xpu+K7qGrxe5hebAVssptNkmhgGT
         Q3o4d9MZVCcl7cgA3qqX28iTp65ScJjS9Ne1iW37oddUhnAQzrXRjnko59XM6oUmUFnI
         /+eA==
X-Gm-Message-State: AHYfb5gKLOu+4Y4LyyZtIxW1MWA2TxwYt7mpxF8T/909avcTXd+Z1nBM
	dWuSMeY3ekVRHz/uUJk=
X-Received: by 10.99.140.76 with SMTP id q12mr6346204pgn.45.1503000865859;
        Thu, 17 Aug 2017 13:14:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id n12sm9351750pfa.148.2017.08.17.13.14.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:14:25 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 6/9] target/arm/translate-a64: regnames
 -> x_regnames
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, rth@twiddle.net,
 cota@braap.org, batuzovk@ispras.ru
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20170817180404.29334-1-alex.bennee@linaro.org>
 <20170817180404.29334-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36653cbe-3043-da48-3303-864f07a428bc@linaro.org>
Date: Thu, 17 Aug 2017 13:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817180404.29334-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jOSLLmfeh/17

On 08/17/2017 11:04 AM, Alex Bennée wrote:
> -static const char *regnames[] = {
> +static const char *x_regnames[] = {
>      "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7",
>      "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15",
>      "x16", "x17", "x18", "x19", "x20", "x21", "x22", "x23",

Mis-patch?  There should be uses of this array to be renamed too.


r~
