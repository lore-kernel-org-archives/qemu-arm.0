Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp548418ejc;
        Thu, 19 Jan 2023 10:50:33 -0800 (PST)
X-Received: by 2002:a17:902:a514:b0:194:476b:1af0 with SMTP id s20-20020a170902a51400b00194476b1af0mr11653583plq.65.1674154233114;
        Thu, 19 Jan 2023 10:50:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674154233; cv=none;
        d=google.com; s=arc-20160816;
        b=xPcry7T+TTke8vNBpmG1ymRZXsgG9u/Plc0TYNNCJRJa3E1cISBV6I8h3CT5I0Xzke
         2jKc4yLGJO1N0JcEiL/XjY4TjkOeDASsX9f9w3WqCYiVkPaU07XM6Wd8MXpvGBLGY0y4
         Lxbm2v30zNXqIkHov5tDqHW/WfgHuxaquKn592Mqa47jZkrWwQoan3xzEzj7r2hFbCCS
         pXs9kYkovvl1k4lehjyRkRrn8/ScUt3OXBhmGVpz6KBaaWIC+4FL7F4FCFFCgIfuLERu
         HzgM09oct4sxFho8KTeLM2Do3kuVgBkcfL6PaCluwyAA2dYPZM1tEnZWh9VBsk6gQtEV
         /6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jGeO7ShSUWU9mLVjGUsUvc6XjVNAG03JJ8rZkWUxAZM=;
        b=CnaerwZ/Sv7e8bkNHxFEhKF3tb6GPinX65xUtX3Sob3WnnneRDj5p7CEvfh4BmM26l
         0PBG9VZF2y3qhRfd5yu1NyuWTRP3GG05w/UckYDpUfLgddWHdk5/m2dBny4bghYi4RWf
         8iogWi5LTHN3eyBRADiNEXFFC4Nvc1fBK6p+6uBDWAdMqJHkHQoK/Ajy0or9k/37WKnF
         7Wyn8SbyjdHR2vjdRQ8weWnU4LvGxVxialsL4xGuOKaxmC4zqejU+0F9wIyDtmYL2vao
         EPyiZ9N1dZTEddH/sQq1UPCXy0vSIlbEFdy0HmRM40DqynvMExdaS6KtLzNAWsA5LL5S
         X3Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfxMxYb7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c5-20020a170902d90500b00192fd37a18dsor17743557plz.164.2023.01.19.10.50.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 10:50:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfxMxYb7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGeO7ShSUWU9mLVjGUsUvc6XjVNAG03JJ8rZkWUxAZM=;
        b=lfxMxYb7aBcAI/CKnsd4he1HbHQldi4X+Wcd+qmjUQoSQ9PUdak/7+ohpYRacNepnr
         VjiZYz4tTSc/MPP39Dez91JlJ03s1XXz3MXeYTd4/EM1w+C362dCPIlKvSDA1btkg3N+
         rpKfrTa0v0Rlik6WTe3+1GGnsKiomvU1rt2li+3S45KntX01h8Lj1mlj+j52IMTLp3oX
         ilCjnUSL1+tX2vXnxIapPe5N2fozbbXTOPXJNh3wE4kYaXi6TwpwwH0ETNPUDE5ujt3M
         64Tms3cB6Tz07cCMTwyh9iqkSJsZT+ox5i3ZPIsoBkrK4ZDZtm/GoZWwWQBXZ47V8MpK
         JQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGeO7ShSUWU9mLVjGUsUvc6XjVNAG03JJ8rZkWUxAZM=;
        b=faJdCC8E1mQjS886ZLLQQfW93Gkgd+jpwp5YfKuXBLhqX+vPkts01RwrbPiWHEojN+
         HJPQ4ev4KPULOkYBGEmCxFClaeaktK2uV61AO28lo8Cl3ZtPDZIasR3/Wo5ePvK7tZ97
         6epu7cO4hpWAdjjruCIcQNTV2t3a62RxsC1VygFfZ/DfYW7gLaG3GTUuSaqSfcNiAK7t
         /+zkeycdFyQj8d01xGdXm4CT2/YBz3a09Ci5vWJ7M9qFR3Kkr8RpuN8amrCMA0K1hVDH
         FGrt4uFM9BN8yTTf9uR9s1mX5YhboasD0ozZpv+xAsfnb9pXOfRAe9vFXdTlXCaAiFHY
         3r1w==
X-Gm-Message-State: AFqh2kpa5T16Mf3cV3h373arj60T5QzLCi/YM0QxXoGmPnamu2lTdQEo
	5lnSG+uRDhXzBd4Py0wPn5Sqv2A8
X-Google-Smtp-Source: AMrXdXuaNQhiPeYd9Tk3evNFSar5odLm+eU5fiNKWs7yMch2AYoNOdW4p70b68U/NpIZY1eLX/0ERw==
X-Received: by 2002:a05:6a20:438a:b0:b8:6583:b654 with SMTP id i10-20020a056a20438a00b000b86583b654mr14219591pzl.28.1674154232651;
        Thu, 19 Jan 2023 10:50:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id z18-20020a63c052000000b0049f2c7e59f5sm20943880pgi.27.2023.01.19.10.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:50:32 -0800 (PST)
Message-ID: <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
Date: Thu, 19 Jan 2023 08:50:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 14/15] arm/Kconfig: Always select SEMIHOSTING when
 TCG is present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-15-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-15-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pCdtCJt2Zay1

On 1/19/23 03:54, Fabiano Rosas wrote:
> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
> default.mak anymore. So reflect the change in a Kconfig.
> 
> Instead of using semihosting/Kconfig, use a target-specific file, so
> that the change doesn't affect other architectures which might
> implement semihosting in a way compatible with KVM.
> 
> The selection from ARM_v7M needs to be removed to avoid a cycle during
> parsing.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> The linux-user build does not use Kconfig. Is it worth it to add
> support to it? There's just the semihosting config so far.

Probably not.


r~
