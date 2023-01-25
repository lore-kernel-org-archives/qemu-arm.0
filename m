Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp25106ejc;
        Wed, 25 Jan 2023 15:26:42 -0800 (PST)
X-Received: by 2002:adf:db51:0:b0:2bf:b389:ae6 with SMTP id f17-20020adfdb51000000b002bfb3890ae6mr6186239wrj.42.1674689201994;
        Wed, 25 Jan 2023 15:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674689201; cv=none;
        d=google.com; s=arc-20160816;
        b=RMqCwMZP6dxyeqlFlvLBnD8zb20OKOYYf0giiqXYA1xoGQtS9gJqIu/0fL9J6E98ow
         bCo/LwR+EkjLebrWfMTwrHgN1wjLJ3Qc5nLee5yZF+jSH9JBW64Sn7xKpSKUT+1NO1gt
         xpE4yqJPjIRVf9dJL6dJTTnvQl+e+x/d73T8gFEjEk63IXnYxIK/wQwOyxpIs0QRbG9E
         QRH4NO3dGr5mcfPtLvBWiCTsIu2CpB3fnfyRvGNh+mVD88EQRKSkKlbyVG3WD3mNMe5u
         /e7av9Mk0dkzX6k7qYRw8TBXusvbZjY4EGGU41Qjj3OQVR/OMbGV85Ya9Ztzp3ulVBmd
         ppBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+qrguMF6QXafswABzj884yXejZ5kskF2eITDeOGbs6U=;
        b=MVCz02MotNsSxL8lB2i26bVRTc4JXiIG6N4eOTHBMMcOZCxNQpA8dz3/nmFUBMCR57
         cJsf0DmDCl5dq+uzD3Utgkw5tL9S/YEWClsnxZ4Gbwyz0kFuVYgrKQwjKZQbok1gOf2g
         YZMB7eudENl9ybA4ol4Nyvi+1t+hJ+XRUehX/mNZUrVdAxsngiy/GrCN49Oe0Jfu/RQR
         j4aQwpXZrV/EWbjS73jkmv03mWrqeVuzLqumRZp9/YKB/4JrmfYMFxAq4uG43JdnZgQ7
         1E2gW+bb13D5eubJoA8tLxPPqR7ngjlfUWJ1w/fRI0vSkaIuL8my8dJh10ys3+CCQysR
         wLBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cdzt/UkO";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bk5-20020a0560001d8500b002bfb743f026sor1800440wrb.13.2023.01.25.15.26.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 15:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cdzt/UkO";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qrguMF6QXafswABzj884yXejZ5kskF2eITDeOGbs6U=;
        b=Cdzt/UkO9981x0FFhxb83G/bnn8Eo8xYye+NAHsUm2aANXo5nlrnd4aaTnGwCu9wlE
         Z5VASCPnrrm2GKM1Y9Z5AKKULeRPK/sS9/mlTSLdKiQ45UtAaKRXnyDBIL48hq+3FkBV
         R1xuaUf6QeVbdBNGuRrIE9JfgtQvYdCduO1hAWVLpdg0gu+xXLn/Hjx901+d46fHFqeA
         93Zw0ZlcsUYdpaAUJpgCY0GaHiU/dFLLSx3UFJ3eios5PNMCO4NoQqvBcENYZXUovziV
         JoPGfEvaJl4SGRGnppzleI1/cXY8oeRVULeq5dZ/vmIf5HYSI/2tMPzj6xmw9yI2s4TF
         MIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qrguMF6QXafswABzj884yXejZ5kskF2eITDeOGbs6U=;
        b=4zEhDdMEPo96gQBL92Oe4pO8U9rXl2d7ejdfRCMyhRHMkLcHKun8ORR3HpKQjpzrsE
         Vi7DvYwKZI6qqR/8EeNY3mHQE7MsIln2Db0f952tXDYTwBqA5rocaoO+i+DWrOh0Xigg
         pmd7p07M7VyyJRwp35JSd4C8PpOCy84I7IWvUVrj7AoTBOkUkJG8KRs/hf1tH2x8gT7V
         EqHtsP7ytfaCr7U1tZt52SGsyEv4MOiuzxgf75+g0oldo3Fvb3LyUj9Q3DGgzTx3Y3JB
         g0I4KZJjTuvTGN1Nr2AWFSdzxs2NjZ7zHmywGIRgQtcfEYjJcpobPKXeUHbij02yhQIa
         jCpg==
X-Gm-Message-State: AO0yUKUl6dWeYDjiTT+U/gwDQKsLY1mnI49ABgRMR7HS2iC8Zyn4oSnE
	iBriBl/1bwv93B7k8uxrhtNAsFjt/0C1DyFDaU0=
X-Google-Smtp-Source: AK7set/Tnhc+4VZvKF/TmkJFvhGlQTKs23v8WXEN4+rgC5wMUcsw1Q5cpppdo5PkWYiFQJm0WJ8RRg==
X-Received: by 2002:a05:6000:1005:b0:2bf:ae2f:5776 with SMTP id a5-20020a056000100500b002bfae2f5776mr7135903wrx.12.1674689201442;
        Wed, 25 Jan 2023 15:26:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.22.181])
        by smtp.gmail.com with ESMTPSA id j26-20020a5d453a000000b002bdf3809f59sm5583858wra.38.2023.01.25.15.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 15:26:40 -0800 (PST)
Message-ID: <23fa0054-ba69-e1df-41c9-15c7b3e13b74@linaro.org>
Date: Thu, 26 Jan 2023 00:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 35/35] plugins: Iterate on cb_lists in
 qemu_plugin_user_exit
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
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-36-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-36-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xBsGfVhhStL5

On 24/1/23 19:01, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Rather than iterate over all plugins for all events,
> iterate over plugins that have registered a given event.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230117035701.168514-4-richard.henderson@linaro.org>

(Missing Alex's S-o-b)

> ---
>   plugins/core.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

