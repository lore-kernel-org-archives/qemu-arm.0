Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2713287ejm;
        Wed, 3 May 2023 02:34:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HusgOmOCMDXTaNw+3BAeXhB9hAW3C62iuHHH4yzdvKNuRvstNTK2mRMAM4o2VG3xLebWM
X-Received: by 2002:a05:6214:29cb:b0:61b:7680:1283 with SMTP id gh11-20020a05621429cb00b0061b76801283mr713498qvb.16.1683106483188;
        Wed, 03 May 2023 02:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683106483; cv=none;
        d=google.com; s=arc-20160816;
        b=XknWK6Bqp7ZbqoqSYT4ADsBcrwUqPttg7tRTOkyhkW6tuHfpbSLiKfEo9HhG2W+0FH
         QDefvzs6YMLXonMrsv+ewka5nhNsFdQBQxPGW66BN+oLzry1vJnV8oYPHF+49cjdCfb4
         Wn5Rvm9ZMgKqitkAc9QUJburECkZF2T0j8yJUI4qd6F7t2JOMaxu8BxyfViQNZJYnIQO
         ABo/yWLWWyI3gPNPKrZ8jUEUN98JQ6kxQvdFcLxwfNGfb2H2F5KzGCwF7LgSxdq6D9t9
         zvZHc7248uD0D+/Odh140A49fZcuvncqBr5OMayVJQ8fZk3Hfc3vfqR/C9uqsZ+JGh2d
         wchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Tjqg7kCYsyCb7j42RiZFjdXyBQhukHv/BpkJuuVPrVY=;
        b=GHvHzZWZtVjyVLZQGe5gNCbZFUy/xNNzm0PxFOOns+ojDNnQlDjiTluaSppNed8ntv
         6yJERuWD/gjeKPoJ5ZxTscdCtyfMlWyvxQxhWj8zHRzsAPupJmLSz6XK4ffk0lYKSj2t
         GK0S2WJXOfgGuEjP/dTyL/pIsAChQrhod4AwSAX75AY0fByKYgH3n3ElihQMppmsVtB6
         ZTRJuPF4P/bTUt7WyMysxQNYrpaiwB3MGX2FgkCrLRIt6WGtyBrPjv/oKXu0Qd9SQHTp
         QpfrpsjJdLT8u47UcBy0ojIzih7pjhc+9RXmT+xbKgrNlJSnGjdNdo5qTJgqpu0973i5
         oyFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IjuxzEy1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bl17-20020a05620a1a9100b0074de9fecc4dsi18635917qkb.383.2023.05.03.02.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IjuxzEy1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683106482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tjqg7kCYsyCb7j42RiZFjdXyBQhukHv/BpkJuuVPrVY=;
	b=IjuxzEy1Oe4kwd5HDHgszthTxuwHsKBiMyJy2/eOQLCKbbR3XrkF9ZnTDAK4mpWsZI7LPv
	CUSVQCsXHKzv+ddH9TG6kkPRu1H1uuugJ/5f0g9kbqxIJgP3NDlw2QqzxKtDReF1l4hLyp
	jtCnGcKQQzT8u+h06B4s8EsEVHQlkBw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-4CB-Xy-8NYqzfI5tj1ZNdA-1; Wed, 03 May 2023 05:34:41 -0400
X-MC-Unique: 4CB-Xy-8NYqzfI5tj1ZNdA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-2f446161e5aso2990495f8f.1
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 02:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683106480; x=1685698480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tjqg7kCYsyCb7j42RiZFjdXyBQhukHv/BpkJuuVPrVY=;
        b=iH237DLiq6s1jTEqz7uXn62y63Fl1qWjU0jCSW/PWZnTATI0u0uYO+dy0icLvItk/C
         jrcfMFVpaWoFMJWesX82tFkwJNkTE4dQFbkIieyWKenW8nq9+9t1WdkjqH0fSxuwTryJ
         fri9qMX52k7vkmUchT7j5uTyDcR9bxcNrFtNWfpBqWMTHhseswbU4FdqarXA6nhMAjKZ
         UfG1R2tNUg5bRPVvz3L+CuvJ1rpa9GgCLw2kecrIM4kp24G1EHIoMGS1JU4m/M3uWeLh
         2SCcrBSLANhCa5x8nWrG4UZDNyIQWjc6cWrYfSlbwuPqASE2TaYw9WNRnH6+irnWBB6G
         SwnA==
X-Gm-Message-State: AC+VfDx1tRDJvZVlg54y2xWeMxh+cDUwmTq+jy782Fqg3WGAkR8Ie/CN
	eoAWh4rtC7LN76OYqkYmmcQYXZCmPRnBO9QKNSqa1QnZ3XU9GMy9hAdzCd3p8YRM1/bb/AQJmSJ
	WOtFrCR56NKtYMppCgnlOdsj4yb0j03pDQTsH942FIEAbocEPi4iLAjBtx/3EngbKs4sy4X+P
X-Received: by 2002:adf:e442:0:b0:306:3911:dff0 with SMTP id t2-20020adfe442000000b003063911dff0mr3618534wrm.4.1683106480690;
        Wed, 03 May 2023 02:34:40 -0700 (PDT)
X-Received: by 2002:adf:e442:0:b0:306:3911:dff0 with SMTP id t2-20020adfe442000000b003063911dff0mr3618477wrm.4.1683106480224;
        Wed, 03 May 2023 02:34:40 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d6850000000b003063a1cdaf2sm3421996wrw.48.2023.05.03.02.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:34:39 -0700 (PDT)
Message-ID: <23155e96-8c8c-335e-6bc3-9df5f0df5997@redhat.com>
Date: Wed, 3 May 2023 11:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 19/22] gitlab: add ubuntu-22.04-aarch64-without-defaults
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-20-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 91eSEpTQdj5O

On 03/05/2023 11.12, Alex Bennée wrote:
> This does a very minimal build without default devices or features. I
> chose the aarch64 runner as it doesn't count towards CI minutes and is
> a fairly under-utilised builder.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../custom-runners/ubuntu-22.04-aarch64.yml   | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> index 57303c12e1..f8489dd3fc 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> @@ -45,6 +45,28 @@ ubuntu-22.04-aarch64-all:
>    - make --output-sync -j`nproc --ignore=40`
>    - make --output-sync -j`nproc --ignore=40` check
>   
> +ubuntu-22.04-aarch64-without-defaults:
> + extends: .custom_runner_template
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_22.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-user --without-default-devices --without-default-features
> +   || { cat config.log meson-logs/meson-log.txt; exit 1; }
> + - make --output-sync -j`nproc --ignore=40`
> + - make --output-sync -j`nproc --ignore=40` check

Reviewed-by: Thomas Huth <thuth@redhat.com>

Maybe you could also enable "check-qtest" for the "build-without-defaults" 
job in builtest.yml now?

  Thomas
