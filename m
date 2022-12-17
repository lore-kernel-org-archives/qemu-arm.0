Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1800055ejb;
        Fri, 16 Dec 2022 16:02:37 -0800 (PST)
X-Received: by 2002:a17:902:7d89:b0:190:fe60:48c4 with SMTP id a9-20020a1709027d8900b00190fe6048c4mr281445plm.21.1671235357039;
        Fri, 16 Dec 2022 16:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671235357; cv=none;
        d=google.com; s=arc-20160816;
        b=XfuQl14dUHvzah7VlEzOSTW24TcmsyOSdOwsDLFSkPfPWjPlcIG1kDAJQr7X36mW0L
         c8wm4zjCiZ+eaMDGaSIlODDtAIMnH7D2sW9xVBlwzGZ9xIQezttwQialXQbMMYtTovDV
         CJXygZWKkxaLSFBel+1XhXXMSFZauEiTdQBmIwemZe6+NcUb7BRJ7juQyAvxyc6Qp59I
         wwbgV5mbOceUckRloFtLGhPjlvsGxHrgrW5nVFxtH+eXOn2XAt+SGE9wEm97KnGFExqr
         2J0Te7ncbtHBb368DxeawJi8pt1Q1hTVYYzMRljaa3eqpsOtS94h3r61klvfMmJSBlC6
         HK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FTNF8GdetRsvzolrB/PraAedUHNM71Iq3K54zGZxPzQ=;
        b=K8WkbcqJPHz2PGALFEcyx8/ED5PU+Q3iIggwOmJwvqjPp3EkbGYzLpHc33blGcMqXw
         RmkFfxIOWccKgwn9/iXmlvPIsnnf7Dv/E7lDa5tV9P9mX4BBXpJnVpIZyIJMucU1XycV
         T9xs0TAcAR/ONvIUXRYeRCb3j3g1k8Ohi6aJ55e+PDx/Y7f3kXqrvy2xKMLiHk1Daprh
         MUPs/tAPoLS5af+1c8UX1OHihMKZt5vlfYdcBvmiO6RzyyHbhYSQE1W+u+OhRB22PEDF
         PgbeE2B3R9XIG8xUQztrcjF8r3FVpKdMzkMSrx391sae8l/ifYjziEFWXajrT8eRz0Hi
         c3nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnQbJa12;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o12-20020a1709026b0c00b00189b4ceb637sor1749123plk.113.2022.12.16.16.02.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 16:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnQbJa12;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTNF8GdetRsvzolrB/PraAedUHNM71Iq3K54zGZxPzQ=;
        b=TnQbJa12FYmbTVjdm7XIT7wVQwhaUtDJenSyThd6Ul5VJVOSEnEhG00QD2WFlcammw
         bCwx5C3ToMQLCBgBZn7VQBkC/ckoyFqJDNs47mp4SJ5W25RAAd/9k9vrRuQZBHvMVATz
         Yd4U3RR/z/C6nFhfdxKfPhVuBEqeF3nlruZfuJFaiZWUP3WnW/Sw6pRwRw8Ux6D5V91f
         lZSFPnhNX6o8wujgjdgz0bKN1ebPzm0JI1sgPYbjuTO+ZElJCHCYXiMNJgq4E4P+4+P+
         Fz5Y4XmGw3ICYFqdN83grh6oxSl507uhlih/1Jf4dnAnHR7QxUBgv7ZwVeOSrACuL6Wm
         YuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTNF8GdetRsvzolrB/PraAedUHNM71Iq3K54zGZxPzQ=;
        b=sy2dJLVuIZAjtVkr70Jt02RWi1L6e03PNxXbnXjMBDxu46ijNmoOsErlLUU4u0eSjG
         PxPpTsO555xh8ihDV2MsGM3A1FrVhVrOJxOH4+Apifzw6ccVm3DvMTwfzwE6qfiNAmHz
         Zn+lAAlwcwCNsSm2FHVc52YrSkw67Jt2TOZC+/S834tJNVX2ROufNUROSsz0POCwksYm
         YSWYTSxWis5MiwCj5eMgX6Rk82NTKlJOk/hlT39awF1/jPWBvsm7J+1L4ErnsILMLbTy
         ivxICk8XT0P5NqQUOhL1tAv9TzphTfHm/V9uQ509aRnryuXfiJ803awWalAAzmPhFqf8
         K07g==
X-Gm-Message-State: AFqh2krsSYloBo5Vl1vq7jYkYNsYzVyV0frUdHU7DTpNW5gr1y2QTL54
	i+Qu37Io2akU+fT9ZpHnx6eOUGeT
X-Google-Smtp-Source: AMrXdXvEoMsclP3IdRIOqc0jUs+tPWd6GnWs2+EniG1hT8vIHHubL75tYjp47V/SNIIwo8MUoHqflA==
X-Received: by 2002:a05:6a20:8ba5:b0:ad:f2bf:bc2b with SMTP id m37-20020a056a208ba500b000adf2bfbc2bmr164002pzh.60.1671235356551;
        Fri, 16 Dec 2022 16:02:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b? ([2602:47:d48c:8101:c606:9489:98df:6a3b])
        by smtp.gmail.com with ESMTPSA id b17-20020a621b11000000b00576a89978e5sm2025821pfb.63.2022.12.16.16.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 16:02:36 -0800 (PST)
Message-ID: <afce49b9-c2f0-cb74-86af-b4c9b50165cc@linaro.org>
Date: Fri, 16 Dec 2022 16:02:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-3-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216212944.28229-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: CAepfPsHPity

On 12/16/22 13:29, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> make it clearer from the name that this is a tcg-only function.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> This function moves elsewhere in the original series, but the name
> change doesn't need to wait.
> 
> Originally from:
> [RFC v14 38/80] target/arm: rename handle_semihosting to tcg_handle_semihosting
> https://lore.kernel.org/r/20210416162824.25131-39-cfontana@suse.de

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
