Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2557998lfk;
        Fri, 11 Feb 2022 13:08:50 -0800 (PST)
X-Received: by 2002:a05:6a00:14cf:: with SMTP id w15mr3421405pfu.53.1644613730266;
        Fri, 11 Feb 2022 13:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644613730; cv=none;
        d=google.com; s=arc-20160816;
        b=u5ubyK4+eXA9nypGi9cOnpDq5McV48x9ClL/8RvU7MwegmkKy9Z8oTjoUtNBEFFL1v
         pOMZXEJ3Z2ovFxlQ5jtE34drmaM+3iXrLgIf7nr6tKVYWVRl1/Ns8rqb6TJdz364gtr+
         WSb5wKK59MRWcz9p5otccrq71sPzY/b7EaX1/eBmLo67r+Azi9R/OI5WOqi43uHZiNhI
         6mQE+O6aLplrtiPSPDrhd8wGnlqEvUi0kgM4Cf5oseK5GLnYyW1Fdpnrv50HaPo+/0PK
         VNymv3gN7clDcCycKeIW99q/DyJAL5vk7s3c1rtn0FvjDrxCyf6bGD0LSlzdCyKIKbt6
         NM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KvBmh/CZ/sWwt72gvRM5m4DRUd8nt0syzXPJsN+auJ8=;
        b=eynCYPye7+Qn/88W0s03qIRYGkin1PHaFlsaxEdEWeMvEihgBaA9wWmpe1QAA6ukzF
         gu/VhbsoHyoNU50eW8oYxAR48Iqu63KvQXoSn0UEslFMEoz9FmiI1XOOlaHn2AVwwR8Z
         ZsQ1RZMCvNVh3Wu+yP75K2Qkii7KN67vzIvtmpqvDyw6+21AoPBnT/AX0TVcqhVo6smJ
         hglujFO6nPhUMjAtKXKRFXtxBpN+ChP2o4q7KLoRhsRvDlFeOA289LvKMvi4dWHSbKSP
         h2XCt9oV1ltBcrWvlSMlv7Lp1AM+adyOJrw4/jmpSKC0RyQpUx2wpHzAYcl0FEJvDCDh
         F5oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AOs/PwuR";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i3sor11779384pgq.18.2022.02.11.13.08.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Feb 2022 13:08:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AOs/PwuR";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KvBmh/CZ/sWwt72gvRM5m4DRUd8nt0syzXPJsN+auJ8=;
        b=AOs/PwuRLawJZ+D4XIJnBJHG9YUlqHod8Qk4EoWV7iJauIS9PRyz97NrfhB7bp+DhM
         Xm3NpNN91Fn+touE8m8MgoRGZki4zTtwjl8KHxPSNzUFOaZXr7waVv03OQQTMpMU+Xd3
         K7K36PYTx3zWdABj1bTrdJ55J1sgRPVgZou0BJR3KDsQnIMXAaMwYFqrk2lTk/M6bUI2
         9Xik+e35PGVogtjXB4aG63d2vEaBADbQaoRJeRyAiFfXP9pOZ/Xpzc/l+k1j5ZiBw3jB
         RmJmY89LJZXLW3ugdk7BvoBRYxX2VWOjs/TLDm0Pv+Oba1uoqIUHbUz9oxqudENw7Jdm
         f4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KvBmh/CZ/sWwt72gvRM5m4DRUd8nt0syzXPJsN+auJ8=;
        b=lpmmjuKj9IjVnwTME5S8biSULZ29twU4+ORgF5GF9U3UvtXybLldJitHNvG4Mm5eOK
         r2RxYbYpYcmWFi24OWU8821qniImIsPC6+z1Ld6jx/Fteaue25wqMQee//FxdQJRG0Ss
         PEIGRrpnUESRzcUhoQmcbP5r2kTTGndzO9N+hBn4l3jU5sXsHkg1n3r/Vx8q8qNi2w/Q
         wByj+EJkrEXcDAHB4xayrBx0st8bDM4Mjs470+gicrOraAtyyz0otgyKArsjXcfaAuMd
         owvfGGXXo/kKfkDNLCEz1UdxRev/z2afaaHFFT5aTmP4zhs0f0EjlsLsKloCxVNXxlb3
         JzdA==
X-Gm-Message-State: AOAM5309nAdi5pufr2Lors85cvhlXQhxTq1+QK5vaNegOr+DECNrkuya
	SkIrP9aq2hrQzcir/Hd2pkh17CoR5t6l1imbEs8=
X-Google-Smtp-Source: ABdhPJweSddqvOBLG7DbRTZePJO2Msv0n/5fqZ6ytcxNkJw5D9VNmTrBA3RyJLmW4N4g4lQosygGdA==
X-Received: by 2002:a63:69c1:: with SMTP id e184mr2829747pgc.495.1644613729695;
        Fri, 11 Feb 2022 13:08:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.0.0.163] ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id h10sm29238609pfc.103.2022.02.11.13.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 13:08:48 -0800 (PST)
Message-ID: <f89c70d5-6159-9dd0-0bd2-00efdca12b3c@linaro.org>
Date: Sat, 12 Feb 2022 08:08:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 04/11] tests/docker: update debian-arm64-cross with
 lci-tool
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220211160309.335014-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mZAoBEF54HMY

On 2/12/22 03:03, Alex Bennée wrote:
> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> As a result we can drop debian-arm64-test-cross just for building
> tests.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml              |  10 +-
>   tests/docker/Makefile.include                 |   3 -
>   .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
>   .../debian-arm64-test-cross.docker            |  13 --
>   tests/lcitool/refresh                         |  11 ++
>   tests/tcg/configure.sh                        |   2 +-
>   6 files changed, 173 insertions(+), 52 deletions(-)
>   delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
