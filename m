Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1856256ejx;
        Wed, 28 Jun 2023 01:38:27 -0700 (PDT)
X-Received: by 2002:a05:600c:214d:b0:3fb:a576:3212 with SMTP id v13-20020a05600c214d00b003fba5763212mr2989478wml.39.1687941507828;
        Wed, 28 Jun 2023 01:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687941507; cv=none;
        d=google.com; s=arc-20160816;
        b=0BbL6plCYizCHf4imapD/sfQWlcvgHDGNZ3x7LQRUB7mBzXmv/X6q8sZUdCu0ZBbWI
         TVJV6MrExQTabIDZ2J+u5tKPycsPHWvptB1NFsKs9dRy5QeSrvoesOgFg4zIfdGvtiI5
         q/7zWP7PWKM8YfF2yEd8L1keHG44beKdc25EilY885VKGSYCNoBXxcqTmEPzTmH7S6H/
         A/8SP7+JUY8LzskZeoXXmLxhKaADE03g4+zZn+PhvZ1Cm2dwnihT1PYMg2xaacPoDeob
         KlBNrKMoChaONWwffI98g50joIIHR3YYITBAv0vRKuHrAJZsJTM6hRrhqnz4fspLTpqV
         2Dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W/XpKXvP62dKscJ32XVUD0R+qNXsILZ9xTkZ/daFwu4=;
        fh=b+t/FAgjZ7G5k2Av0DENm9ClElwuldlNUYmeE5L1xxU=;
        b=JLiP9/dbgACoMjkCeIcrQeKW30KFyDYEY0agI4wj6A1hegjE2HRYU6HMY5wfWNTP5R
         x5HSgah0zQDCiY3uhqfmj+TneMSZYMnWUDPlC4jY73XoGYja1NpmNW7+0gcWPjgrpxyw
         ka7XBfSrCkIWx8bwlA+zNpSrc2zdIPhXVJtrOlCutOi3U6vuX6l+NT6QdfGEH9HvBls3
         zowNBumv2RxI6wLBIhyIx/gW5c81y56EOKPx1yYeV0mNMn6qCJGu0I/Ubi2fMB4xdKbM
         BaUjFSp6Y2tFMYmvQScE8rTV6BQ3VvsDhSQxezLXlKZGFt+whUwGSbnoKIjmvUxrjXQV
         iTHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nekdtCm4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y11-20020a05600c364b00b003fa981988d2sor2344745wmq.6.2023.06.28.01.38.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Jun 2023 01:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nekdtCm4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687941507; x=1690533507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/XpKXvP62dKscJ32XVUD0R+qNXsILZ9xTkZ/daFwu4=;
        b=nekdtCm41gKFJRW+ZxRrbZXaN7cAQZ5SzaieTmLPbsR1nw8IdQPJztv0rGiKAd1OV7
         tZo3cfKLkufRjaLXJVQn6t9+Ab3IRbngyCTvEZYGr7qaHUSrW/KBsfeGPg9cOOq3VLwu
         fdtA6LirLs0WAIqwENb+u9YdbdMGAYFkOHag4tx1yxquNceaGwWWjvS2owOoer8EkIN1
         YMHR386Fk0vjebyfBvnwiAZepK8eDDyqQ9InJyZKCqr8MG2EkiPgvgI9r5AfM24THFNN
         9KjxDsc/aO4lhUMkBw4g0kgmEma1IBeoPzOM/9qBfUvEe9PIj2HgIV4gKOT/Cu4vznKt
         Vf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687941507; x=1690533507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/XpKXvP62dKscJ32XVUD0R+qNXsILZ9xTkZ/daFwu4=;
        b=YXtLYu7nzJo1Zbur1EGJidwgola+Qn2jBqH+6TE6gHjl88B+sZxDTIifoCjwVCaiKl
         LjtbxeT3iDknfpUdL8ymrU9CF5iFo891dtYd5cDW3ca8hsc62lIQVtjClr0ZBsaEXODb
         cb8X44xZMdk9Bqky2guoq5iLpg4JJjJ5Z2e2uevyW3BHdmTpweDmHFv15vbZiydOkTq1
         +qO9AuWTyyMZb+k/ydDuf2bxvFKMrtksfkLd0AovgwOM5W82dTIkn4K5ocz/aNHr0dE8
         kEYiIg0bvKjFF1YQ2sVzy/cZn7jrJ0HtfzVmnhI3xXfOXZYd2yKe9mhkUV53eztlVTVH
         Lq2Q==
X-Gm-Message-State: AC+VfDxikbUnpEaFmg/FoULiDKwZvv2eDpSNkKQCQx8HhNcXloFvQtCh
	HUukIMo1UYQ8YhovFXF6VrJCnBQzcx1INAm/H9EyFzunQ3g=
X-Google-Smtp-Source: ACHHUZ4nNzGKdhNcnC5eEQl6KRDb+Q/S5pYGe3x09a0lx5JjcRhnlQAS7io9SLzsOmXeZe2SraXOxg==
X-Received: by 2002:a05:600c:29a:b0:3fb:a8ef:edfe with SMTP id 26-20020a05600c029a00b003fba8efedfemr2783441wmk.18.1687941507354;
        Wed, 28 Jun 2023 01:38:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.208] ([139.47.41.103])
        by smtp.gmail.com with ESMTPSA id y12-20020a05600c364c00b003f7f249e7dfsm16174140wmq.4.2023.06.28.01.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 01:38:27 -0700 (PDT)
Message-ID: <fd860df5-f8d0-77ef-f99f-629f1631d577@linaro.org>
Date: Wed, 28 Jun 2023 10:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 15/36] tests/docker: convert riscv64-cross to lcitool
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
 Bandan Das <bsd@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230627160943.2956928-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SSQxhN+q/QMT

On 6/27/23 18:09, Alex Bennée wrote:
> --- a/tests/lcitool/projects/qemu-minimal.yml
> +++ b/tests/lcitool/projects/qemu-minimal.yml
> @@ -4,6 +4,8 @@ packages:
>    - bash
>    - bc
>    - bison
> + - ccache
> + - findutils
>    - flex
>    - g++
>    - gcc
> @@ -21,3 +23,5 @@ packages:
>    - pkg-config
>    - python3
>    - python3-venv
> + - sed
> + - tar

Same comment as against v2: Why not squash this patch with previous, which adds 
qemu-minimal.yml.  Especially since you're changing it here in the next patch.


r~
