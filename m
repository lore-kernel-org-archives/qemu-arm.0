Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1639486ejx;
        Tue, 27 Jun 2023 14:07:01 -0700 (PDT)
X-Received: by 2002:a2e:88d1:0:b0:2b6:984e:c6e7 with SMTP id a17-20020a2e88d1000000b002b6984ec6e7mr5605040ljk.36.1687900021274;
        Tue, 27 Jun 2023 14:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687900021; cv=none;
        d=google.com; s=arc-20160816;
        b=jEYQwQ3Gci7MgiJuFLy/Mb7w+Vvg8mHe6SL6iPNvZe2rkc6ETJa3b1jSpn8IQuiNsP
         f5OfpPsEBX0YUZm4QzUBTXZ+YrGyy4MYx2tlnDQr2So3MiOww9pfJrEpnVeB7DHJIZO9
         vV4PN8Ry9D4O5InL0peTThPgft4Fn6KvFs4wX64bmsLTd9aJUnlTCiE3QyYy+j1ru+uL
         qbbOy9iGsJnMJD8bevzkdK3kedp0Zulr8iZdJYE2hCTNlhTl22E7fsnmbrqlKu8/qTEJ
         HVRWpSXhwc5SKqva/a1fk3pULxSOEDeEWmaNq5dQX3bTXnzdDTS9K1tjT0BvD98bjiVm
         QykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=APVxDd6lgCOHy9cpPK8Ts43N5aR9TxdOrvF2rjEZXgI=;
        fh=811jNNCzcFrt2tb7q68KsVGqM1llvKdgxhKnO534Pyc=;
        b=NtYE8gRTLTsBuUVwqg2iKnaHJxvfAErc+awfE14D2+ctwfa4y/CYMREVeRDBy1hcaB
         LGuLakbZXaD7ggBUKFdBKeGezvVHJD1kJ/oBph4QbHxzuVwqbMPBb3TcJuVqLY3mh35U
         ccmwQDzpJ7DbBMfDNwTOpFFfRxj78k4vKWUoL+bAv6x35ZtZs5Ovok+GeWhWngjaawGH
         EJulNncwEPAmCh53go6ngnkr4zelO6TMCnB5xIwzMfKR7TL5mXrs9EK26UF1MuYsxkp8
         SbIfqXbmPpRbLgqoP0gJOB8nKBkZAZwqzSikFdDlcwQA7UDGEgHkJbr4PrBBVkEIV85g
         /YFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb0C2eKk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w7-20020a05651c118700b002b6a0c53bd3sor2083266ljo.8.2023.06.27.14.07.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 14:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb0C2eKk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687900020; x=1690492020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APVxDd6lgCOHy9cpPK8Ts43N5aR9TxdOrvF2rjEZXgI=;
        b=Yb0C2eKkTp3V2e9OosWmbNq8jorJT5jkwrpqePGtcDz+MlXvb2vVHZfOGXQT+fIW0S
         0+PmHlnuFeCxB/XiEkwjxBnpeMuxU6/MzuXWPbnyz5sa1jIK7PWmpaf7Cpt+YqTAhDCi
         vMbQHJKTR+oAeL34yKd+wWejMeGLfL2U6dXupbmFQzpVZk/LUsaQotyklgRcCrvrawKm
         8aWYqwvI4O68Jwo9yLwRapbLcWJKK7S+XJjGlsypjXNeFK6fkFwBSemyvP7ak1JKdxHp
         J1UhstuikdnYcus/iieRXZy/k500oZCphnd4z8Os1WSZhhf+CaKg4hN7G0JvtOduySKB
         VoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687900020; x=1690492020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APVxDd6lgCOHy9cpPK8Ts43N5aR9TxdOrvF2rjEZXgI=;
        b=TnupYf+5eq9Ot7N5aqZf9UV/RMh9Dn86Qrc0/LeB2pRXoOSfBbViY5R6m0wrW5/LEd
         IKmkoMf6dlgvxPvsxF/2W4VLzk3Iu6AQ6qdeIrheWDDNeAVvTJmVwHVtXgWddsbNmaLU
         Z+uEg5r+pYlW0u8Yn3SDaoGUxx7jY3Ys+0O5hd3AnCiRlaEZzfrNSvgHcMpQc9IWfGlm
         DPr6875qETw2vqfxuN3njkaGIM2EDXgyfo6vFRssfbuMeoiPyLx3f4PZo6IyWEl53ndq
         TUgC8o8pKJVKOB3cDLjV7fGudMq49+5cABt4jVKASY1kTS5gBiqYzwSTuzE5GPMohv1h
         GneQ==
X-Gm-Message-State: AC+VfDxVSf469TRcxbzf8LLYUzNrfKWbLbp09AEvu/6L9viSrxj/TE7u
	CcIcsIgYM6oRJEd8LsSe5mTFklFuJeycU1QYmUgebw==
X-Google-Smtp-Source: ACHHUZ6BDKv4+8d0Fo6SS5SJnuE2OgJGSU/64zLoX+0duCe2qdln8VeYqm2b1wRBFW2XihjEfRnXUQ==
X-Received: by 2002:a2e:9b50:0:b0:2b6:9001:e447 with SMTP id o16-20020a2e9b50000000b002b69001e447mr5741786ljj.0.1687900020652;
        Tue, 27 Jun 2023 14:07:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id e13-20020a50fb8d000000b0051d80d7a95bsm3990985edq.14.2023.06.27.14.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:07:00 -0700 (PDT)
Message-ID: <b287b67d-7bd6-6b0f-1cb5-14fd12099175@linaro.org>
Date: Tue, 27 Jun 2023 23:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 12/36] tests/lcitool: Bump fedora container versions
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Erik Skultety <eskultet@redhat.com>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: w6zAWO/5diqf

On 27/6/23 18:09, Alex Bennée wrote:
> From: Erik Skultety <eskultet@redhat.com>
> 
> Fedora 37 -> 38
> 
> Signed-off-by: Erik Skultety <eskultet@redhat.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230623122100.1640995-14-alex.bennee@linaro.org>
> Message-Id: <c9b00e573a7a80fc6ce5c68595382f5c916a9195.1685528076.git.eskultet@redhat.com>
> [AJB: Dropped alpine (in prev commit), reflow commit msg]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
>   tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
>   tests/docker/dockerfiles/fedora.docker             | 4 ++--
>   tests/lcitool/refresh                              | 6 +++---
>   4 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
