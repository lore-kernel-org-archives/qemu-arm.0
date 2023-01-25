Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp25727ejc;
        Wed, 25 Jan 2023 15:28:03 -0800 (PST)
X-Received: by 2002:a05:600c:1d19:b0:3db:1838:3f01 with SMTP id l25-20020a05600c1d1900b003db18383f01mr27223439wms.32.1674689283079;
        Wed, 25 Jan 2023 15:28:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674689283; cv=none;
        d=google.com; s=arc-20160816;
        b=txP5jiV50qTjr6RCmoewMxc+KeSUjuK3RM6Gjd/VDq+BycuhmeJgl8qn4QEVvwEJND
         KYg5qqPxDhcuVdEd1MrOT6jzLKP9mz1q+Pc0iEBJMqqvUy1flg2wJvfoRe/bCD7HvPz/
         JN/eDc5uuEuB0twlKNSfyKjP197r229G0hdU28Ig1Dg/f7uYt3ecVBscnBwKXOeT9anc
         lQ5oq1GHoFm5lhU2h4lLIPeBOpSAxATcUaWaeaieQteRWIRgCzSCWfFknJ3ts62BeQzK
         v6Fdgb3+yggIhMLv9LbumtYGC2GJXxc1gaIXYWO0f9avF11t27G+mvzilMLQaoRaaEnm
         krOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8APanKUAnmdWhnlPqwkZQ0dkpyjqYhFtC8FxZRJrVQo=;
        b=pdRjWejc2CrDBLr3v/K22l8yZSJDSpUu69R1noA/28OouMXV26ZFExphj1NM3qihH6
         /V3lO6FC4IcqpTw+FVqNv8lrfem0OH1X84q1FjTD3JHYQMzhqCUB4zJZT1++vNjlxm7E
         eoqD9VzLmEDoSvR1A0lDuoEkgoOUDGHy/2wLFCnsiKGLulDJPwNC6r3X2c5AUQn2j8f+
         YDE/TKjMjvKoR22EtYt2NXwlaueWJxu5Z7OXyN+kAAv7nDFG/b4wW/UXTg2o7jr6MFf9
         hEPK3oFCSC0xAx/pDQuFSxBbqJqVINUSUh14CSs1PGybxQYkfAYGUR25gOub5kbHa1Il
         WUlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdR81LnF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p9-20020a05600c204900b003d23eed82a4sor1164461wmg.29.2023.01.25.15.28.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 15:28:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdR81LnF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8APanKUAnmdWhnlPqwkZQ0dkpyjqYhFtC8FxZRJrVQo=;
        b=sdR81LnFyZgwMVsnliSYqoVmW0m0qufSS2Cjd1TJ0Zq2Kl+j9P8HlchBi401NCLKvE
         jZoGy7QalzBOkEUppfnohuHR+3odvFcMkDY7rYTdgUFuAg/XISg8Rj82iQ+15tv+lSEy
         aI3VxthtPT4ayWECFEjYPjrGmbiic/hO7lEf0DXZWWO8XYANG291FSGihMdVugsWi+vA
         U61uKHDULyN/VSR8cY8uew15wRcUzHUsrgFxQMD27zjIAc7t7cl2D7CdBHb5ncbjmXIq
         p0VsZDou1V7XHS08AwedGDQr/FD6zx4OJuBJU6qdZTkF2qHCOsPDw1ut6+tBuEpMQ7e0
         VETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8APanKUAnmdWhnlPqwkZQ0dkpyjqYhFtC8FxZRJrVQo=;
        b=inGhEEAw7mkah7t1Psev5ao7f+jRm9VMQofQjfv43JkUCeVthCKydlLUPIKEx5X9vz
         5fA6YF1p5wV3RUzrxH73u0nKGuMzXLDbwdCdQEL2iczl7NsaB0hCpTLeJqJ6HUwI1iSF
         6Nars8KO70kDAfm0D7U9nJ8GWurQO15v9zfM/NkdjfqewbVnbIbPACKxsb/yO9s/eCkJ
         OkXn+WwgIb2v+bvWll/kY7n/dmiQwv6VDp83WN4FmNSHX4gyXvslpRSAiStktyJ/C7PT
         43f8gUa8VNWjsuify0d8CDjA/H7HYi8F87pkrBQCDxnxK0k9+4ksfLOmj6ylhnq4hSuH
         Dotw==
X-Gm-Message-State: AFqh2kqEzhSStbtXjtf6M6j7TvyYoLN1sy50k9WN23m+qYk3OyNkCer9
	bb+fd2+LGamSiIj2HWXo8eRYsQZe6razGodfIWc=
X-Google-Smtp-Source: AMrXdXsdPmpe2e6wdelvK1dEM/px+x64bIaKi5G/OtBl2SNChxbrns5ZqMYjPNCkArWGSWnhgW+A/Q==
X-Received: by 2002:a05:600c:539a:b0:3d9:ef72:190d with SMTP id hg26-20020a05600c539a00b003d9ef72190dmr32442647wmb.19.1674689282647;
        Wed, 25 Jan 2023 15:28:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.22.181])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bcbd8000000b003daf7721bb3sm2886105wmi.12.2023.01.25.15.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 15:28:01 -0800 (PST)
Message-ID: <4095f853-d9c3-d0ef-e441-d98600a4c80f@linaro.org>
Date: Thu, 26 Jan 2023 00:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 34/35] cpu-exec: assert that plugin_mem_cbs is NULL
 after execution
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-35-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-35-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eNeDTxBrzc/+

On 24/1/23 19:01, Alex Bennée wrote:
> From: Emilio Cota <cota@braap.org>
> 
> Fixes: #1381
> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> Message-Id: <20230108165107.62488-1-cota@braap.org>
> [AJB: manually applied follow-up fix]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/plugin.h | 4 ++++
>   accel/tcg/cpu-exec.c  | 2 ++
>   2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
