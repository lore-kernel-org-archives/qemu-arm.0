Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1639724ejx;
        Tue, 27 Jun 2023 14:07:34 -0700 (PDT)
X-Received: by 2002:a05:6512:1284:b0:4f9:5ca5:f1a6 with SMTP id u4-20020a056512128400b004f95ca5f1a6mr13553282lfs.17.1687900054751;
        Tue, 27 Jun 2023 14:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687900054; cv=none;
        d=google.com; s=arc-20160816;
        b=kHZLisFcQD1D9MWuA2lqqzmHoWh6XpwRa2pfZe0RyEbJPw7yW7P5XVnQB3kLT6F4Be
         XPORVFvdCoIpGk5Q4PT2OYMSWv5/0i8Z/2khnJQv9s3MPHkfssNhgnmWpniiJp8QIHqi
         Qtt3KTduQusCZ3kKnN+dHPjFp5YEn0ixIvvZlECNV1WarC5BOrQX8nz/A3Po0fFHzOfA
         T10TxXXVzU5XM+pz6zms/hRL+Mz9v7QPgHb2MTYY0m7ivNYEI5bhMG2cSNRQ8qdrV9WN
         Kw5K8i4y4d/37O7feMPVnoYRAqI1riOXBqMbW3ep8Fz43+giXcDeVYkNrnbACxfwfyHB
         4IbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=E0JQjSjSQX8h/L1YEAK41dw+1ezNzjmO2CuBo78K9nY=;
        fh=Tti5iY6tdwKQ6vxlTSmZ6v2Y0jcLETgPWS1w/ieRBfE=;
        b=ouIDwOKfe4TuKuPKud1RBSH7SKSwX/XcFT5vBQxE6z7BCZrfGLKnfY5keqAHxzLG2i
         lQWrtUQz2NFrhuq74j1aIlWwoaUb6Y5osAZXiQhI5YWdn6+Qvo0gX1W5WUr8zgrO81Ja
         N9ivSW6S+UOyv2uglovJjTafL1/jgcMQnJ5nfv2eW9+J+/lRcDoLs/gAfUBPc9QyeTss
         C8ZNgERXx9rgm0uMox1m55EdCRXcWKkYINbdK1E+znRhSMfmeggR+AvMDorIXhuIcTil
         6VqYFM1JzTOG2bdQ7Q7HHhF33a+MOviL8koKtYNSvZvf11oBjHtcGjUtEt/lY3gL/8Ll
         N/PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzYUvYmH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y9-20020a196409000000b004eff386d73dsor2878860lfb.14.2023.06.27.14.07.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 14:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzYUvYmH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687900054; x=1690492054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0JQjSjSQX8h/L1YEAK41dw+1ezNzjmO2CuBo78K9nY=;
        b=RzYUvYmHzfSqGbKsz4uBPMzzXrHvmEUe4ja2k70ENcynVrJ4l9o35S3u/GEAUZOXEY
         6loQ4zwgvB3AkS4okRR5CO6grpbeV6l8yjJpFdHpR+bvA9lynR2jHo3B9h4fe8X4njdW
         2bgWjlZf+TZeUTvfudnFSOHSAoSoxFmeDegYZ52vjSWMzozMyeM9p36twdVjAyKCZ6r2
         1/bPZ5Hg5fi6zyEo2yvPf2I+siMDWvyK6sRr1D3eUXirwISWxppMtyoDGKzgyY5MMmWN
         iGPE3xSem3cWO9ShPyU7l95MDxOq079kd03i/w8TndLmmaHnVy1FeZT0UEOwXjF4R0JL
         Ke/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687900054; x=1690492054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0JQjSjSQX8h/L1YEAK41dw+1ezNzjmO2CuBo78K9nY=;
        b=E+nf5LG4FLbAnhXhPm7vd4SchxxKQQf49iCn12KY8dYd79ZmkCWvRSAaiLmjjk+Qre
         oWT11I9Yta+Rh9C9TImS9m6sP8c7OYeOhYl4hgA9cmWvm/M0Y84JH6uBdXI870rzlfES
         pFnYAI1HV64Ta5fn2t7gjRja4RpTxPYE6FO4Vz3GJWJ5ViSHEJi22x7HvuGlzopjEPmm
         uegU3SAx19KZgSNXH+nbWBJEbSZwxkEhBpm5S25U6EC6AzIfTHm2VJ0sJzfm9I20ZGa2
         7K/ZkZvGssinKjWQQbktplBVBVORqN8NHaSncQitX5NUc7k80HOPgABxqoAH2LCcKJwM
         KhVQ==
X-Gm-Message-State: AC+VfDzNffOTJh4lKsBY0d5h5HiSpPM+UbziGetbPwjCfVumB47aOg4c
	tCViTYHiu6ruLBMhHtiY4BWlKWE7XqigwYkMyxzmAQ==
X-Google-Smtp-Source: ACHHUZ627yEd6xOoOv0d8TWjwzaD7x7aAJgcbv9ncS054FTjHjeUi23K9wsb0IDFH8GAFWH26dMpBw==
X-Received: by 2002:a05:6512:2343:b0:4fa:9817:c1da with SMTP id p3-20020a056512234300b004fa9817c1damr6561711lfu.21.1687900054110;
        Tue, 27 Jun 2023 14:07:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id h11-20020a1ccc0b000000b003fa8158135esm12571961wmb.11.2023.06.27.14.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:07:33 -0700 (PDT)
Message-ID: <3755b80c-8831-b54e-793d-26ae3acc383f@linaro.org>
Date: Tue, 27 Jun 2023 23:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 08/36] tests/qtests: clean-up and fix leak in
 generic_fuzz
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bandan Das
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0kfJoRjMP7WZ

On 27/6/23 18:09, Alex Bennée wrote:
> An update to the clang tooling detects more issues with the code
> including a memory leak from the g_string_new() allocation. Clean up
> the code to avoid the allocation and use ARRAY_SIZE while we are at
> it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/fuzz/generic_fuzz.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
