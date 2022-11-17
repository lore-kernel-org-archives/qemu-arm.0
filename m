Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1195175ejx;
        Thu, 17 Nov 2022 04:00:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf49+jOi6XINRNL6v/cb7ndjvnI7mYsI24F415gC+O912uXPowX6VGwAH7SGWXv4kFm42b+5
X-Received: by 2002:a05:6870:64a6:b0:13b:b2c5:43b4 with SMTP id cz38-20020a05687064a600b0013bb2c543b4mr3958450oab.131.1668686444528;
        Thu, 17 Nov 2022 04:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668686444; cv=none;
        d=google.com; s=arc-20160816;
        b=T38OF23TEjWKDpoq0Ii5yuXPnGs+ZvpjMBF7UeZRPLmtVe0HDZTzmgYTrxACOrBXOa
         UN5vM/H6wjLjVRrZjF3FMN0wtrUMihO0R8RuD33mco6eoaaH3f2rQ98Ct5ecF8+sK5/a
         V27QV/IF5nsPCXsy8n/BLNbjY1CwtAgr0oIA2phmF5X9MiZNTI69AHs/sQU1Rs1gcRcF
         UVwUvJR1ILtee9ui9SL0f2ddEzfqlxPIDQdeXOui9u7WYxTVTkjpRTBgq6xR740me1+t
         cm0Efn1dfTFJMiCqWVg62tSO0wFJjCnIluNvnZC8hgZrjC+tTByLSRZdrFMH6DB4q6Lc
         ieJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=g+Qq4oACUvhMUnJ4LB5qXsviLuIK5ln7ncUxyFy9QAQ=;
        b=jRTW/r42kk2vBt1a80EIrOBhXx7NpBPQTYMAqoeqdWX17O8ABOapnChoOQYzlRBa4q
         o6QS30gm8MkJdF1Bohu1kU/5asefml4xqWglZUa+jdCuZm9pAR+gGRpDP0Z6sI7b05uF
         MHz8T3jQR+7u109Wat1xQgrX4hYQe/O/zWYoY9+QaZ+9i1aaTrpVzlr81LI3LY3YU6pq
         U1bWQxk02JLSr1eX9Xn2woywFKhquSlAFn4vicScF9hqGHcDOPGc6A19UPRwMC5rqBmj
         qGxxKXDmuavXLoKN6l6WPM9FvswpwcX9YI2NFq7//IPGlFlBj1ZLY4sE+ulPT7r7K8KO
         Fnwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YpquIGE5;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l30-20020a9d1b21000000b0066d6c1108afsi447307otl.126.2022.11.17.04.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 04:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YpquIGE5;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668686443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+Qq4oACUvhMUnJ4LB5qXsviLuIK5ln7ncUxyFy9QAQ=;
	b=YpquIGE5V5UMclBqZWneI0SG6ow9vRYfg+Ny2xxcMo2o3mgvlN4qnyaYCdsfseD3yYIuXH
	4m84TLCgMolbEfbVqIIAmFEOwHbNVuRO6gyFMM1cFx4XLsy4lYaCzIoHutb5KrQG2WJtyG
	rNnxA77AFSJB/2+jUURTpWeHseHml1Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-fnE1ynqpMamPKBiKelkOYg-1; Thu, 17 Nov 2022 07:00:42 -0500
X-MC-Unique: fnE1ynqpMamPKBiKelkOYg-1
Received: by mail-wr1-f70.google.com with SMTP id r23-20020adfa157000000b00241bcae980cso28376wrr.7
        for <alex.bennee@linaro.org>; Thu, 17 Nov 2022 04:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+Qq4oACUvhMUnJ4LB5qXsviLuIK5ln7ncUxyFy9QAQ=;
        b=JTPje07XSrjnKvKegumXBYzXXjYrlqpkz6Fp07Q2/XSmcUeQfENcl+a6s+WEqjVQ1q
         U/AeD7jLdmSjmnHH31m9ctd6sYXGgzkWlb5lmhgBi4XoxOuId8QoEx/CBksVSlF07+Et
         t4LpG7UwLTmBnSoDlfGJWNLPfEiE7cciXJas33g1oNM4NGMI3/4eQ6af7IyEUcrHwueN
         QAkrNowy+psilETIjeLEcvAto2pWdGgyzInx31kZ3khGUiVxGjQe6cw0ZntKs1uOKQND
         Wy7eRNP6bf6hXUB2Hl0h+u4g01xyjk8pRVKObRaRq6mtROCEEbVmiRxiNAUbcw4jrDqI
         hV/g==
X-Gm-Message-State: ANoB5plcv+9MUm6JGaRMsEQQCh/JpOMWQVuQhkdO7p5cCc3bOCdaM5mq
	4yDTyQm2voEvu/PYwqMlgU37Fa3yzH7TcprlVQXCsV1DrNnL49yyIrG6VzhPfxoXObCjaV1snaX
	Qmjdd44JSEnnOZGw5
X-Received: by 2002:a1c:6a02:0:b0:3cf:71e4:75b with SMTP id f2-20020a1c6a02000000b003cf71e4075bmr1536965wmc.114.1668686441002;
        Thu, 17 Nov 2022 04:00:41 -0800 (PST)
X-Received: by 2002:a1c:6a02:0:b0:3cf:71e4:75b with SMTP id f2-20020a1c6a02000000b003cf71e4075bmr1536952wmc.114.1668686440839;
        Thu, 17 Nov 2022 04:00:40 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-177-4.web.vodafone.de. [109.43.177.4])
        by smtp.gmail.com with ESMTPSA id r3-20020a5d6943000000b002383e977920sm759411wrw.110.2022.11.17.04.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 04:00:40 -0800 (PST)
Message-ID: <f7472193-f80c-49b7-f776-358cdea40b7a@redhat.com>
Date: Thu, 17 Nov 2022 13:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux.py: Bump aarch64 virt
 test timeout to 720s
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221117111628.911686-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221117111628.911686-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NmvmThlXPzI8

On 17/11/2022 12.16, Peter Maydell wrote:
> The two tests
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
> 
> take quite a long time to run, and the current timeout of 240s
> is not enough for the tests to complete on slow machines:
> we've seen these tests time out in the gitlab CI in the
> 'avocado-system-alpine' CI job, for instance. The timeout
> is also insufficient for running the test with a debug build
> of QEMU: on my machine the tests take over 10 minutes to run
> in that config.
> 
> Push the timeout up to 720s so that the test definitely has
> enough time to complete.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index 571d33882ae..32adae6ff6a 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -64,7 +64,7 @@ class BootLinuxAarch64(LinuxTest):
>       :avocado: tags=machine:virt
>       :avocado: tags=machine:gic-version=2
>       """
> -    timeout = 240
> +    timeout = 720

Looking at some random older builds:

  https://gitlab.com/qemu-project/qemu/-/jobs/2897087089#L175
  https://gitlab.com/qemu-project/qemu/-/jobs/2897087091#L173

... it seems like the tests took 330 - 350 seconds to finish in the past in 
the gitlab-CI, so the timeout of 720 seconds should be fine for the 
gitlab-CI. Thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>

