Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp842312ejb;
        Wed, 15 Feb 2023 12:44:17 -0800 (PST)
X-Received: by 2002:adf:ef8a:0:b0:2c5:4d68:5515 with SMTP id d10-20020adfef8a000000b002c54d685515mr2816139wro.13.1676493857257;
        Wed, 15 Feb 2023 12:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676493857; cv=none;
        d=google.com; s=arc-20160816;
        b=LKSoeAWTBNgsOg55/7CwgOXCZwTsUkm2GSqPWfn1+p0xKPNgH/KGlp6fv0R6tMqQZn
         shLaVydiLU7Y/MA4NHo5QA8UAAdJgg5Q00EhZTsIX3f7z8OWt/eb+rArz2FymZK199Cx
         E3adyO2zMTB5QhZbyA6Ez3mtAt/1C9CTmIqi5VveJkwNLI0H1yAADKpmZ2qze4+luaoA
         UiHrdKPRc3vYKDbjodstSmOITCoWhhfdCrwiOqeOK2D0lLjKPv0+0cUVdYNcf6UPl0n7
         dYWkqVFoKm/V7OzuuB60Zk5V1TeX1y+qXBiG5EGdnZNi+HNjf6lh178uK0Hcx9n/PoOR
         FY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wpymyfuKQ8Qvg5hphgre5Rf7sINLs+KPLSzQ6wa4lFE=;
        b=cYdzHpQoRtCRPgadMu8n0wxF2i/FL3hvG8GGQ8CDUVur/jJNBykBEXu/3RaB8xHCql
         tUY0ggsd8wPM752XGHfAayb24yShnibIzZvOwMiZ3UfbhFt8+XI4Y8wq9iEYi8nKxjyd
         Qk1uQlNj8PRTrC1b2dTnmZvy8IIh7v4+7+XavfiFO7kmAVTUhoexOSYQJ204bsIFD8QR
         o07N1ULFpHQCA0eKi14asCTj0/FnGLG9vf7jX54nX8TaofuQ0zTJiIe7o3Uk1mypjvAm
         54vcj9ijtolsTlVHyBiDWUX9u62yyOQ7kqnbB1jZQ2ITIliT5gtG1gGCkMwhugeJpvdy
         YWZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y70M5ThK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m15-20020a5d624f000000b002be518094a0sor8118236wrv.58.2023.02.15.12.44.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Feb 2023 12:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y70M5ThK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpymyfuKQ8Qvg5hphgre5Rf7sINLs+KPLSzQ6wa4lFE=;
        b=Y70M5ThKuiN+Nk3FUFZKd+lvOj/fhX545DDyJp4O4nh8DQAUuUg3cgI7N8oS/S0Owl
         70B2kKZ12PQ+R4ON0FjvRvpCfOLXwNp7Lm3c6YVCXJW+BuA+USh1ubRSoaLmFvu9epGB
         zE6kCbH5/jJOKBx9CT+1YgoW8DUpU7FZWOW1NObQyRpDk4eGhIZNkao3bI+mRMxOh9eb
         yHPA5Y1I6X5uEJmJNhNVFiyyE8bakv349b7pmH+EoaJb9HqsdMvclK2ZH4l1PdONNXx9
         8BnUiJUw+tiazCZQE8aUq1M0vv1D52ShRoj127FT3ydXiQjVo1mj08zE0p8XHuHtepX/
         IV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpymyfuKQ8Qvg5hphgre5Rf7sINLs+KPLSzQ6wa4lFE=;
        b=hZn/gclDSZb9kmHj7doln5ptFSFJqHSoOPl7LfTPcU3pm06Y/TpZ8oQ88U6Wmoj7uu
         eSNGR65bO1Wr8bwErRAUERUMr71t6pAWlegc98RdO5q8HNGzAekfatWZ2GnPoJacBmH/
         g1nYSQngHc24SewI19dqCoXQKAFBOIQK0eIymKZRHiYgsFFf30M19XAUMKVNWoyRy9G5
         fZhYQsGphhyaVD7tSt/PBNnvaBfPCqZOb+982JALe+HvLnGsrYKYQ0Gt9dfDHqN3RozD
         M1oSvf8EuHhSS22St8Io/k7wCKPoe5orasHoY3ryC6MQN/0u35rT986n5JdLD42E+SjS
         TBoQ==
X-Gm-Message-State: AO0yUKUTzoNV6vE95CLL3M0hoWS9W9r02gwtHqfZoeGDx0VPIAeH6fU8
	7Bviwkir0YewAeCLPTXL5b9iDgK83LHprbl8GO0=
X-Google-Smtp-Source: AK7set+OCWe8nK9HCYNvk3hNNv+Umpn3fW8v2PCJ4RcR+qHnmiZ5P+634voaPYEVpRJHGzv73sR8pw==
X-Received: by 2002:a5d:46cd:0:b0:2c4:872:e929 with SMTP id g13-20020a5d46cd000000b002c40872e929mr2903172wrs.16.1676493856668;
        Wed, 15 Feb 2023 12:44:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id h10-20020adfe98a000000b002c5501a5803sm11496214wrm.65.2023.02.15.12.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:44:16 -0800 (PST)
Message-ID: <0822739e-eb54-b948-a076-e7c252ec72ad@linaro.org>
Date: Wed, 15 Feb 2023 21:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 04/12] tests: be a bit more strict cleaning up fifos
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: l4cZo9yOGtpZ

On 15/2/23 20:25, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
