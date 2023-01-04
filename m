Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8317636ejb;
        Wed, 4 Jan 2023 14:23:58 -0800 (PST)
X-Received: by 2002:a05:6402:528c:b0:48e:c073:9453 with SMTP id en12-20020a056402528c00b0048ec0739453mr7053727edb.15.1672871038061;
        Wed, 04 Jan 2023 14:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672871038; cv=none;
        d=google.com; s=arc-20160816;
        b=ONcN7IaWDAqs7qBKdNEE6TUxTrUfphkzfyT3uv30juNvmwRkvvjuDvLaF2S7i9sJdz
         fARtWbAmUm0GZyTLG6zko4d6fAHfGqw9f685JwA/VWbWnq1aL33aDBq3wwVJFOVR/Kal
         uNBtweQRMRih7W73FqJbcEY8ItAkevLAYmq8sZY1RdP6RI5Jaq4uQFGyASexdyRR7TRy
         a7FjHFyPGt+0ZxHt9OKT4iyJFMGmxUTTkYq9nCkgYhd91ykSnmEorPULCxIGoquvDl2M
         oUG104/DR7LOoMRppTaiCawyyjwQA4+ssWF6ptMIxF4Exb75pWbAHUI1qAEB0LMKnTMI
         nIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DIkypwTaaWTlckWXQefPtrQkiwOP24I05HAJaAq06ag=;
        b=SVXYAVFXiFXnBOEnOyCB5LbUYh+A/X026iWqiUyNSN0nYOGcyYXTF+Vi458mRmX4gX
         HNmWc1NxQPuhUibJ3x22FU/j5pPgl7SKcxxVO+/+ictUjmW6L4iV8VQCFm/26p0Q3+s5
         bwn/fVySBRTJ50i26G0lweNNjSmz+K8WmD7NER5QF1fAJH8TsmfN3IX2Z/M9NDGDIcCp
         i6An0SEsc34YaT47+aSJCrZr9WJf2JSClIoJFSE9Z/EXG3ieGlCzILIa7fpizrBKaYgK
         g1iC3AwIOruVdLOv4ZNZV9zoxk8wyoc+GzY3BMALwikhiN0KjB7uR2Vtn2fwYCi2z/+m
         IWSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJ974XB9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x7-20020a170906b08700b00780813177efsor16026284ejy.32.2023.01.04.14.23.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 14:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJ974XB9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIkypwTaaWTlckWXQefPtrQkiwOP24I05HAJaAq06ag=;
        b=wJ974XB9BpxMBe9Pgnchlz+l4L1HTk4gyKGA9Fj0dys6orTWN+EGeH15zw2PFmtIqe
         Xpzr/2jfkkU0//NwoZRldGuqXMDpHXpgIcLl2sQbvlmJRIvGfWFaKBSWNlMmwrSDcSES
         W7xTYPTCvtP9NE7YfD7Sy39Fy0DUDBgjP8Wa8H/5b8LqNOMQPSPIafi2OBV2DFc2AFz4
         EVfpe8rGvE7vLtYT6qanTlDrH49Fi+msm1iiChE0OsTxBV6gkfQKgFQ0g/VuakyPDj6+
         l6TRkmhAsRSc84Qtm1TDx79tHFy6NoiXu+aZpyjQCjTx3jz9BAnDJbz7/CqD1MBqnchL
         8RGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIkypwTaaWTlckWXQefPtrQkiwOP24I05HAJaAq06ag=;
        b=v1z2/C+CpiU9mk659E5pxXYks/kSTQJR3+4zfOP/9igox3tlJ8lY3IjoRAPmM3KFqd
         S5Yjuh9jBgs3saKaqS6ER+6V5pTCYwkCBrzvN103SoOM5bWhrjF1orehU3PYlqLM1fGe
         6ou8roO5d1eQ6ymLrEVbJ/zz4VSLgDUZ/+VTfoOjkYOqiF8fQWza4IaVnwfrDabqBW24
         cZ4n0B9Sj4WbX/gqIjQr9ZJDlGrTFPr+M5k82Q3aiYCAaZ4F+cd3ribis6g7tpnMp+4R
         qMYgyG8DkblPPSxHoCZSMZEgyZFHH/Wf7U2LFH/xS1tMTb2hVle1Ek0osx1CDONl95rj
         NTSg==
X-Gm-Message-State: AFqh2kou/FqyBu/cFsqcFkygKACYgsIzOT5WI9mwzjTsiRPWJSNbLmBk
	ItkoGX7Vt+MPLKoKSyL98NjRQhg9
X-Google-Smtp-Source: AMrXdXscnnFLjpXh0r03eNcxCaiOQrTTjyYml8FdPgN4eLCvrx7hJfLKULXGQX2oBHQeRgpRSANirQ==
X-Received: by 2002:a17:906:8447:b0:7c8:9f04:ae7e with SMTP id e7-20020a170906844700b007c89f04ae7emr42606095ejy.22.1672871037797;
        Wed, 04 Jan 2023 14:23:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906181200b0077f324979absm15602113eje.67.2023.01.04.14.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:23:57 -0800 (PST)
Message-ID: <d08701a5-a9ee-2392-6218-764411af54da@linaro.org>
Date: Wed, 4 Jan 2023 23:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 12/27] target/arm: Add tcg/meson.build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-13-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104215835.24692-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vrRn3eFWEc4c

On 4/1/23 22:58, Fabiano Rosas wrote:
> This introduces the target/arm/tcg directory. Its purpose is to hold
> the TCG code that is selected by CONFIG_TCG.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> We could squash this onto the next one perhaps.

Yes please.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   MAINTAINERS                | 1 +
>   target/arm/meson.build     | 4 ++++
>   target/arm/tcg/meson.build | 0
>   3 files changed, 5 insertions(+)
>   create mode 100644 target/arm/tcg/meson.build


