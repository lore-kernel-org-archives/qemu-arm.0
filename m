Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1640003ejx;
        Tue, 27 Jun 2023 14:08:17 -0700 (PDT)
X-Received: by 2002:a19:8c01:0:b0:4f8:6d99:f4f3 with SMTP id o1-20020a198c01000000b004f86d99f4f3mr15655708lfd.52.1687900097600;
        Tue, 27 Jun 2023 14:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687900097; cv=none;
        d=google.com; s=arc-20160816;
        b=q4WD/NPlwa6A2zEUUYa8rI8mHQQtKycKiMNeGLlJ6ZqanbbT6TvLSji0lztDGSoihp
         V6mSkMNFsBniVu8/uCSVEtyhqam0MJ+afKAX0GxdCDzp9E21uQVSFgaJ+362QyxGKN4f
         nq6/geVhaiUsl0aI4thbHItIJaexM7Fp61Q8IVOU0pTL7BXHiJUlmV559CC/UEPyTYGW
         i/jyF9jjaPIFkoQu4xolsO8KqntIb2CqBtH++qkekz1oDC2KkRov1aQM3PNaiMFKUIvC
         GlGG+8p2BTe9ApFTV0kIEnVNukvZEgTbPkZ0QPY9XASn8BYBHdD5liB1Klw3NM0/GZ3a
         /WAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jPXqBjJQB6zR5aw2KxKMxwWAb2URZlZwWQZH6PKptXc=;
        fh=Tti5iY6tdwKQ6vxlTSmZ6v2Y0jcLETgPWS1w/ieRBfE=;
        b=SjzvoQjZvUpJXN73tc1fYnBurlBtffsDr2pC3JvhbqoBtXjihN1ZKJ2b49L8hhlpVe
         8MFFTbFNbff+DwU6qKvmCnKsdfFJ4vT+sySQXr/whIbXjxMJGECJ1hA/7+LlMsckZ/MI
         lkQbgSJ8eunOer7ct8n2dNf6DnBE+VvQzBwC8eiU8z9Thzrx5ooCzderMuERZKXghioe
         N137yJGAffaeXXmc32h7DarOeu1xW7HzeIcIpvqQrgb9gUUy2XZjNVZ/mAH6ZPccTKOy
         mX3fy0GulUXUMdauFOyk7mq2azSFua6l5lc/8EsCqX0OEcwEh5u7jcrCuC74IbRlGCM5
         lvuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Azm+eQM2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b8-20020a056512060800b004f9883ea09esor2682839lfe.5.2023.06.27.14.08.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 14:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Azm+eQM2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687900097; x=1690492097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPXqBjJQB6zR5aw2KxKMxwWAb2URZlZwWQZH6PKptXc=;
        b=Azm+eQM2DiLG8fFP9qKM94l/knuW2MHwkDDsm06Bg42SmlCPTZRJ6ktmYO+szrC1jL
         VyiZ3tKIf6dD7Evjrnr/0JvyLwOAnjUsSgPyY7m4lW/5oqoFb8/6eeLgVkT5CoiBz+n2
         LMG1OmpUvlUXiy40qE0RXCWSZpD3BlOF7Wy76olxr4/o9NDdMtlv0g+dYRGNlR3e+0Cy
         MTFDdmxoztx8KryVDm9vxjg6ch5KrMxh3FhXNZ8+BWFYpOitxxhifUrW56KMb1n5+PiJ
         VgAjKTXpS0M464ATF0CmaFO//XQkRYDpiitw6E5gKNyEpe3iZncyQZhas30GQhLk0UeR
         p7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687900097; x=1690492097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPXqBjJQB6zR5aw2KxKMxwWAb2URZlZwWQZH6PKptXc=;
        b=O7mtWKAJWf/RpjKuaL8sAn6cTSt8PDF/f5x5yDFPHf99n3kd9UxSOQdb9Ak5ZdMXPz
         yg3z+RLeYqX6U7b3Y29wqkjZmJpBxyFx5z282K+TmBmuXq9zoEAwhhivvYquZc39KF99
         wZ/r1CgrqEhRiIcPwqTx02gfTferqyOnTdWHn6okVlnzjc48G7l14EdpVKx2rs5i7P7h
         8mWMqDQb25Ba56/suJcxoXCvNi/gthfkItN+j4pfh21hzh/xXlB4FSX1jB6auQ7dT7c1
         nHuKRHTsTUS5S3IjiupGIOV41sZi7B6p+OUcnP6vl/saXD0/biaDng0fBGAUdaaq10W1
         Vi+g==
X-Gm-Message-State: AC+VfDyXe3eCBBcb/U4XQwkVuVlGvFmvryLeXVAKgtjQ+lLHzBbllkRr
	XsfhANRep7NT8rLkyaz0IVvGSzc8qs6hbKhO1i7S3Q==
X-Google-Smtp-Source: ACHHUZ6qlVbqi35MtXrToV6/Mi19nQVm35qAzeGjRxAoAv3f8dJChlRL1pe2wWuS6KEquo90SBKbOQ==
X-Received: by 2002:a19:6402:0:b0:4f9:51ac:41eb with SMTP id y2-20020a196402000000b004f951ac41ebmr12500440lfb.16.1687900096973;
        Tue, 27 Jun 2023 14:08:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id y12-20020a05600c364c00b003f7f249e7dfsm14945949wmq.4.2023.06.27.14.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:08:16 -0700 (PDT)
Message-ID: <cd9eaa82-2b29-8913-9cdf-22e845f4baab@linaro.org>
Date: Tue, 27 Jun 2023 23:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/36] gitlab: reduce testing scope of check-gcov
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
 <20230627160943.2956928-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9mnPryHuQemD

On 27/6/23 18:09, Alex Bennée wrote:
> This keeps timing out on gitlab due to some qtests taking a long time.
> As this is just ensuring the gcov machinery is working and not
> attempting to be comprehensive lets skip qtest in this run.
> 
> Message-Id: <20230623122100.1640995-4-alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
