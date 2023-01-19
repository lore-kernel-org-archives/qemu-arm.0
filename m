Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp551262ejc;
        Thu, 19 Jan 2023 10:56:04 -0800 (PST)
X-Received: by 2002:a17:902:c94b:b0:194:dda9:7b40 with SMTP id i11-20020a170902c94b00b00194dda97b40mr772805pla.2.1674154564029;
        Thu, 19 Jan 2023 10:56:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674154564; cv=none;
        d=google.com; s=arc-20160816;
        b=gb5CxS+p3YBEQ5edkGBgH5ZZVB5e46WRAd8gF8af4uzHP32Uc+BdN7+nUqgHFyEHQs
         uoc1sVGq7UOy2LHxzGhhfIF/EpoNqT3GaDIob/+xhRfnBYAVlj3JnEnk3CxKRctH5Jxw
         zntKkyhHxdhIP12jOF/Wahza5KoweK4Xxy9V7DuvVnLuPScyz2KpaAPEXyLmFuXPgw+x
         xPDHtXHBYqjT1IDKdjWEpRI3V3+350KV4HvymSJeD0gKrRQm+ogbm06m06JETT4BydF7
         KHhlydGiDq0R5MzK+t24VsGOBqW4mdfhNSIJDwtakgfjR0wT7HsbTjhdcAh/BdfitGO4
         sQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rX3Pwht2yHicLDeRtafLYUYKacRt12cPGiEU/nNxQEc=;
        b=LLoPjDR9wQ4jV/IF7HZ3jUDavzBhEhFjUXWWp6OWZKQM4becUSzMeGgtfExTzx5qO7
         K0i6k9Cvf8nfUTMOG+alL/+1Og46hyYk3nlbKL5Z932rvRuJkp7kRadQ+8lJGwrID1xv
         MQ8bfrlyrSIqWI8GGIMSrVTlpPhnzYYCKeT1Dq3JSneus64gtVX//cW+DREvOCVBqcKC
         BusEYPeLDIDdrgl5WuPBgjG1CMQRgdnUYRY1K84H9K58mMjsnOkRcVcOQcEpHM8rzn6c
         IO5moO73NcPg6RQJ5EQAnFPQ97/KCzl6Qu1wIZ1K23zQ+ma6Ey2a149fzHbxDmc2IiMU
         bHOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IawTwvWt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay1-20020a1709028b8100b00190ee7a9d23sor920039plb.65.2023.01.19.10.56.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 10:56:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IawTwvWt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rX3Pwht2yHicLDeRtafLYUYKacRt12cPGiEU/nNxQEc=;
        b=IawTwvWtJvGJPMQBVPaVBRfK0Qpxwk9A6gSyLOSmvUb/XE8cEiKxNFLaz3o5/aDq72
         caTw5jRGuHskMTumJ7JAjUs6o2AU5oMsiVGQJL2X7GjB677TV7zjJeSwfyOvcvDMf0DB
         p/nYOD1qE8hMeuBouRlGifVB6qyFJn/0mWCpdHWq/b6/5t/olh6QAwNOko8ge215msbx
         mvsdToRG1LPuVXevK00EDhEiUYzPVmGJM9aytRj5ybN77dOiBbv5knex2YzeK1gcXQfs
         q2Ck5TRDmVmcMu6rTpziJp3LJXOHbz+DTvWTmct0IAmuTVr6khuIbu2EoPRSyuauaquJ
         S79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rX3Pwht2yHicLDeRtafLYUYKacRt12cPGiEU/nNxQEc=;
        b=y/ruqhiGFElqFl/KvmVkFmbvl2k0O+vmuFj0SqoYZdPTNNj1893ZtDlugB6fFM143O
         anFrHiGb1a6Sjs9+/UULhhwiGbYx64DEPnWGQLTEqsprWvQrGjVl+erjj0NKPygUFrLq
         XC74rigR4H9uEUMivufzNbBlCnjy2ifuMTwL5JyPgwYMD7YiZPFC/0e6194eaZ4EWS+J
         xPH7NQ8btwDakbFwhiyy3FG5qkKJStR/K39q/XXNSyw2jglCkNyOq4dNY57PdwgccVFq
         +fCMQHsHP15wAUPxy2U+95zNT0dyQaDVufSs8EusKXKXzEl3t3P5/nycpgWz4AE+lEDp
         Cthg==
X-Gm-Message-State: AFqh2kr8oygBN0ud90WzqOxH1iwguhQGf7aAgt2FMebGcWExOcZqnTSm
	f1ZVXVUf+15Cd6UzX30bhb7AXg1N
X-Google-Smtp-Source: AMrXdXvzpeyRpiMvkDsYbRc52NM+/uuuSmn1yTDfQCMRtzt6aJyVO//IJnxnSWBenrNReczIr6zkGg==
X-Received: by 2002:a05:6a20:ba11:b0:ad:5a4d:95b5 with SMTP id fa17-20020a056a20ba1100b000ad5a4d95b5mr32359362pzb.40.1674154563534;
        Thu, 19 Jan 2023 10:56:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090301c500b00188fadb71ecsm25474434plh.16.2023.01.19.10.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:56:03 -0800 (PST)
Message-ID: <ae3535c7-7b96-1832-7ac4-1c6cce1cea0f@linaro.org>
Date: Thu, 19 Jan 2023 08:55:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: m+n4zHNOcXK6

On 1/19/23 03:54, Fabiano Rosas wrote:
> QEMU machines might not have a default value defined for the -cpu
> option. Add a custom init function that takes care of selecting the
> default cpu in case the test did not specify one. For the machines
> that do not have a default, the value MUST be provided by the test.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/libqtest.c | 99 ++++++++++++++++++++++++++++++++++++++++++
>   tests/qtest/libqtest.h | 11 +++++
>   2 files changed, 110 insertions(+)

Looks plausible.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
