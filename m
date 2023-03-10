Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1860062ejc;
        Fri, 10 Mar 2023 04:43:03 -0800 (PST)
X-Received: by 2002:a5d:5651:0:b0:2c9:c90d:6869 with SMTP id j17-20020a5d5651000000b002c9c90d6869mr16146305wrw.42.1678452182918;
        Fri, 10 Mar 2023 04:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678452182; cv=none;
        d=google.com; s=arc-20160816;
        b=K/OTKQxnTe0yP9PYnwxWpgRzTiI6WtJZ9Kcrua404PZErcNUGV8tZfYKAxu9rqaL9V
         TT8gy2+f+g4qAYZ7hngkGAq7hrvCifzQ+UB6Kem1HtfmYpbkq1HfPFAg2IpnHyGmIXdc
         RFnP9wkrdLDiXAnmsttsw4vfR22o7rijmN6veFXPeK2thsNkKGQ3Ou1atg4/m8m7VgxF
         AH8j4QjbovR7+nJnvxgsJd0mxabGT8AZ8SdF4r/J4jEIzGYypdLGuhlwBPVhTVUyk8Bd
         05pJyZZy5sx+hoy1qRTW3OLiDYX2RJYh5O8upAlwvsrO0RIaHciTaHCuYNuT9rr6R3dx
         KqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iwJ6KP4qgwdAuCXE7G/5v1FQEfFrIi5j1Uvcr9rJKbY=;
        b=lMjRsjxk3LbKkp7644Ad2idXojGxvGwe5fLzmY6FOPq9N7PTalPvGS9wjK7+BQATlZ
         k5gKeyLqEyaqTTfoRsizqYP0NRKjqIoe3/09i5M1ZzFc/lfp/oXJTbXDgfH8sc++gQFV
         EKXCQJP2xaBYIQgphtAj0+AMgw1Q42DclBu7U6MuxI6L6EE+b/rqwODZbjrZUiVepOli
         5u/LM1dhDrEWnm1/gZ8rTk4PjTtDfyYyA8DMO8hPY2QJAB17ex0i8uV/9fh/DS3ckmNx
         1PBuVb8+l2eoCxtprlSVfV5hVtoarLXd1H12MsB49+8D1Yio4jv0HTCxA4+vOyIWYz5h
         0rJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vspqxqd4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c2-20020adfed82000000b002be31f35ea3sor870862wro.63.2023.03.10.04.43.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 04:43:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vspqxqd4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678452182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwJ6KP4qgwdAuCXE7G/5v1FQEfFrIi5j1Uvcr9rJKbY=;
        b=Vspqxqd4Gk8LECVh/Cu0jmLIKhYh1rd8mkkcH+6emtzRnv5VXqBYCXSogzpBjzL8H0
         AWO5dAw/2g7OCDy8BA97aD3OD4dKlas9OzwA0rsKDMGcAT59yfwh2b9MNIOK+L7hIsZc
         +jw5Yk/wzH4F5n4s8H+DwGQxLZUAyifF9JDVTNjqFpANvYy9CTGcRnMqEaZMdT+ySfdO
         6DRwxdWN/nyfYZ6cTllmru/fMJ4Hp0aI9hGzup5Xyc3BXh8xfRY4G9U9rnX7iXuEwrQm
         2BIg5IFyggfhqOCObXzF+MtJ8Yh1Rq8f+4Vkaj9YuAdyQSaSVAmUnJXC1bQbo6XQOYJ9
         bFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678452182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwJ6KP4qgwdAuCXE7G/5v1FQEfFrIi5j1Uvcr9rJKbY=;
        b=SEJ6d7dXpShvDzIjKEtR7/amn5wevgi459j5Y/WjAWKDZ+DFpfMJTor7B5xNKDtLD7
         EamgiqVFzQa+GHzm591nNbQEhqT0Is56lxDh4BKQBbN8/D96yBYLo720TmBbiurx6/T2
         /Db63IqnKYmnPeWY9UbAOqQ53ijDsw/fTJV3RSwfAOwkbFq7srJNGVXwPEk39UyujK32
         Ud1WtEKjpJbgJHvrjPEXXvgZQF+IKDPQ7jl8LiqgG+7cR5qlD6ijwrLygDdHzqAnCJQt
         Kh8uWtrBbTQ2pBtSnLVOuBnXjEryiIC7jtVtMrqTwvoUzIthxYiZDr8w1yxq0SOToqwo
         u2IA==
X-Gm-Message-State: AO0yUKWExKTHGpcXtnqJe04iVYt+Svb/kVBU8VhrFwFIwYCfUy6bxkl3
	kp2KyTBrw04j5NSTmD48vCVaTWJUNEw++7s50bkUvA==
X-Google-Smtp-Source: AK7set/aEVcdVqGHS9nOa57VBe3dG32DdJb+uI5tVrKlL+yOVQCkuupMMp0OpSfv9v7WhS0hPlGodQ==
X-Received: by 2002:adf:eac7:0:b0:2c7:161e:702f with SMTP id o7-20020adfeac7000000b002c7161e702fmr17304499wrn.47.1678452182146;
        Fri, 10 Mar 2023 04:43:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] (169.red-88-28-29.dynamicip.rima-tde.net. [88.28.29.169])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d4ecb000000b002c55efa9cbesm2069371wrv.39.2023.03.10.04.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 04:43:01 -0800 (PST)
Message-ID: <bccf80e1-d4ed-248c-5702-885951ffe730@linaro.org>
Date: Fri, 10 Mar 2023 13:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 11/11] tests/avocado: don't use tags to define drive
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310103123.2118519-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sKbUsDJ1f3lV

On 10/3/23 11:31, Alex Bennée wrote:
> We are abusing the avocado tags which are intended to provide test
> selection metadata to provide parameters to our test.

Oh I missed that, good point.

> This works OK up
> until the point you need to have ,'s in the field as this is the tag
> separator character which is the case for a number of the drive
> parameters. Fix this by making drive a parameter to the common helper
> function.
> 
> Fixes: 267fe57c23 (tests: add tuxrun baseline test to avocado)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 60 +++++++++++++------------------
>   1 file changed, 24 insertions(+), 36 deletions(-)

These also need to be cleaned:

>           :avocado: tags=tuxboot:armv5
>           :avocado: tags=image:zImage
>           :avocado: tags=console:ttyAMA0
>           :avocado: tags=root:sda
>           :avocado: tags=shutdown:nowait
>           :avocado: tags=extradev:driver=spapr-vscsi

Can be done on top, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
