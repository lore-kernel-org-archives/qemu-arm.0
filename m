Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp196901ejn;
        Fri, 23 Jun 2023 08:10:29 -0700 (PDT)
X-Received: by 2002:adf:dcc3:0:b0:309:54b6:33b0 with SMTP id x3-20020adfdcc3000000b0030954b633b0mr19725491wrm.44.1687533029782;
        Fri, 23 Jun 2023 08:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687533029; cv=none;
        d=google.com; s=arc-20160816;
        b=wOCxMXAApfoY37OyQrlAyNcZFlAZmqafiTwyDDe9KPeOHPL9k0PEtdbO/SSXAWcOMv
         m6tP0PEdjDdSPkJ/mRd7rbB3S4cKA1T3rBe3Hc6hlR5f+Elo8VXrcKIpyoC6p6aPRsku
         +xbMp/lJZ/NP/nRKda/erEGC/aSLphhkn9unCKYOWz1TIac4rWLQULWoxIw4hJ4nQvxD
         DhfDkAHpbX8y53QXEFUm7L+UNTDyZgVICFUaJ4qnOHJjrR/293wfikrxVtcmOlb/CE+x
         7dS7P4Zp0NFThuyIVXUi+SO7Q0YRBla/TAeOBGB5LzOn1+Jh2a4S1PfhD9un2kaKavj9
         jWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P+Os7HA8ehxWwLwi/8yftirexa2vFomcZEFJ7Dyfx9I=;
        b=jg+tLcb3QbfQiineO82vBBqS9gNcDaQHyOGcOZs05Q3P0RDJM9FsioS4jKvANuLWud
         sEMMU49B43BF59jDlw+Z8eyEThx0DAlTjBSissDsSbr6Q56wmnetWYTwbpf6lsAUagqv
         k6ZexI2KeGGlsPpMGyNGjQCP4uMbDNjrrVQITiA6zheWE1FfM/n4xkZdJjfg4hTVLvfj
         zL8gxr3OKK927sH0IP0Ck3pVr++sPPp7hSz1FDZYbHjpNxqklB7Kdu39qpZ5QGmjSKZW
         KeUvfZBKHiFqHSAjg78hqhY9Mvvaz8WO7De3VtQ1J6sK18ZGO0J3O9cC7aLMr57v1Gzc
         zeQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q09nR9gF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u10-20020adfcb0a000000b00311159b7da6sor51832wrh.4.2023.06.23.08.10.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Jun 2023 08:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q09nR9gF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687533029; x=1690125029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+Os7HA8ehxWwLwi/8yftirexa2vFomcZEFJ7Dyfx9I=;
        b=q09nR9gFP/N+6BA4yzW3d4H5b8c4iMv4sa4tO/b8t2mYRtS1msUUWO7OzpsJ8joOyU
         DuM+cxBkix0MVGdJ5y2e0C7T99z8cAtiZBY2ljPnXLLMtnb8t+Z8vcmT39VwF8CWNUfV
         16vmy8z/83MlHJqMgHF09Wd2YMzyzZywbdIUMt+0FayihoiiUAy3VjxTAmYBpmSwYYH0
         y+vQuJFnwz4m2cP3T42QjB7/U/SEP3h95DOuABlXqOLNrlhp5+c4LqhUYDaEOWzCF7dT
         hHoGELQnzm43B/afT5npl8dPNb6+61YuI+qBGCSad25ysXdQiEbZSs1xre5z7Luf9WP7
         A3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533029; x=1690125029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+Os7HA8ehxWwLwi/8yftirexa2vFomcZEFJ7Dyfx9I=;
        b=HncLPSjQ3m8M5xefpnY0Eu4ABXhwFnanwanXDCB/TJyYcZzpnAyYbQ0qz2sZM7EGCo
         5h0XbW23M0Gjjosl2l+b0OosTLQxOtnIuH1ERGkdRdre2cfuKKUxN8xd3Lpf4avQyuCx
         vfTp3YbIj3qg56zFG5obbTQNCVMN4rxOMKDKHR7wRAj3aBQ3ZSlo1MuY+x1TJe6jna/O
         Be7tzflJnN9Yik9KSIkGg0ZtQe9p1rBNWofgU00c0v0mQd5q4E8lQA2dMRmSg9u1TdsU
         PenJevmcLpseCOHmJP4RTPapBw35rRl2miaARSUkKu9Jq9LJJiWv98gK4tJ2C4cxtZ/a
         7NUw==
X-Gm-Message-State: AC+VfDxcOnTWBNq08w51rZ4sZttg8CRg/4LNYkCBI4v7IwgNMj0Z/jYt
	xx4tYaF3yikd1uJdwBUFkuWYQl6nz2e92mqeaBred2Lu
X-Google-Smtp-Source: ACHHUZ4xySbNfdymxvCDpIMdVlSZhWDsKl2WKfDMeJFHcE/1iBhPaHavMX79I+gVSWIy2/FKhYP9WQ==
X-Received: by 2002:adf:f601:0:b0:30c:2bbf:bf8b with SMTP id t1-20020adff601000000b0030c2bbfbf8bmr17718908wrp.69.1687533029106;
        Fri, 23 Jun 2023 08:10:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.93.175] (94.red-88-29-173.dynamicip.rima-tde.net. [88.29.173.94])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d56c4000000b003078354f774sm9747696wrw.36.2023.06.23.08.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 08:10:28 -0700 (PDT)
Message-ID: <f93d8ea7-ddf8-fa90-2fc8-d37ed27cde21@linaro.org>
Date: Fri, 23 Jun 2023 17:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 11/26] Makefile: add lcitool-refresh to UNCHECKED_GOALS
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Riku Voipio <riku.voipio@iki.fi>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Bulekov <alxndr@bu.edu>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
 <20230623122100.1640995-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230623122100.1640995-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /KaNC7nwNOEw

On 23/6/23 14:20, Alex Bennée wrote:
> This is yet another make target you usually run in the top level of
> the source directory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

