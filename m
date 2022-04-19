Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2605501lfk;
        Tue, 19 Apr 2022 11:48:07 -0700 (PDT)
X-Received: by 2002:a65:5b0b:0:b0:3a8:2190:9a07 with SMTP id y11-20020a655b0b000000b003a821909a07mr13442856pgq.462.1650394087299;
        Tue, 19 Apr 2022 11:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650394087; cv=none;
        d=google.com; s=arc-20160816;
        b=Cy5dYWcvI6KsF20uJT/o8yoYOtCvx14kvVN5DJpgLNFMDctCaAs2SnvMokugHhCrZB
         MfEk05blHZxjx0u4ZiWU195UMwEu8lgpatPIGP2mg1uO/oB7XMYLqnpR30b69PKe03hG
         SiAVY1RA+rimzOooWe7EXhCaJzwc3TBAEpj2XFN2/f3+vqbC4lhUJQ6ZMUFcPrtPCEJN
         FKYkgrbgAor9vwkVerkbpsKFzPwVdgdaUL3bdX1T6pg5X06uyASwr7i4UmVM6JMbJ3tC
         WXB2Z0ChmZ/WmmmUsj7R3qeGaDCVjSLCJqeY4mQzJ8klb7syVB49zqvNUcJPjnwcJrwz
         +X0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=i2UkB+JLKKKOdqkk2GYTY+zw9waMcxOpisxjMGoSIVE=;
        b=AqW3wSkawIR/WLVro7DumBCTsfNb+/64Ys+Fs8N2G2NG3nnYLEOuqV9RceYRqqFAeH
         udZ6SwH9TAfL3W5uEZRt5HA5gL3f+JGLy4UOMc7Bkr4tbOPAhVOwZ1vPbaU1HXmixGdb
         azG5km9eLgNDOSIHtuBFmh+paECuBjDVxKCYZNwVAyF6FSkP7K4PW471bxZq0RIf3gEi
         WtSuav0ZOuC2CNwRnQGqTH1K1DlfNGBdL62WwTBCdw4+N/2Z5nEpbrnNtMftSqQ2S3R1
         AG/GE8wwMnVrSfJepvvAswJqfZovGEXRwqlVyyIy8+f4Pu0EW9T6te8Riy8p/PjE+kfm
         eh1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DswTSGH7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b9-20020a170902bd4900b001549f0ca4e4sor4247plx.143.2022.04.19.11.48.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Apr 2022 11:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DswTSGH7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=i2UkB+JLKKKOdqkk2GYTY+zw9waMcxOpisxjMGoSIVE=;
        b=DswTSGH7RK8jJxEDy8CGtFg8+W3nNfliTdQt/nuFZVUs9hw6MgvIu/4bcEQc9NggbC
         jfNHw0duamv6Rp08s87cmIRT1+mWur1tlWHR1lO+VNSt/fBlM0Bu1lJcsMHMp56KkUM7
         6idvMdpNv+2vqqr0frCA6Gt67JzsGr5l50di4iwySb3YO0fdtjgnS91Vow5U+G3+t97G
         AvQBd1NS7xSjFDlM/n2qTbGMyZMO1tbU5uh6/IcItc1+rewHOVRIVFtE++YTBQauP2I/
         0JSmOQ4TW6tjq1c56q8FMIDl+eCgPu/WvzC0A7OjjXe6Ln05sZrE8f1xltmqxBBi08Eb
         yPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i2UkB+JLKKKOdqkk2GYTY+zw9waMcxOpisxjMGoSIVE=;
        b=OVI9yl10h2rTmZWwXF5AHV1Eb33AwPWUeZeRXO0LY5EHMCpmZykeGYkNEb7EKny/AW
         Sixqtv64zDlR447KDjfo8H9vCFi3gPu4rps2SqMpbmXzONyNyFf67dhZf+bS1gjkL0l8
         5RpDrK5wh3tTEcvT2hknHqZcseV3pNKdGO1R6SeTQHnBp4k9lWCawHzS0qWysr8oDWpW
         NK/9LzGcKjPphBWmuGIdKNh/UOq8cTqsVxurVoa0cMR7BdOvjdiXzJgNcpZpvNonyda9
         vLqSsvigWqJclNQ8zXuCRyH3UOnBIbr/oH96FwPoBANz2nrOLbtpUpQ3MqSHggGTvzHt
         g2bA==
X-Gm-Message-State: AOAM532JNemS4kLBQSOqVNxI+6rpCq8TYBsnhhYFZ5D1mJZjVO4OPbqk
	Mlo4NU67oLzXsLwd0S6/zyJNf7zQhtE+ejZc
X-Google-Smtp-Source: ABdhPJx5LwRBMi6sqGRfTZTRxsL3xXC6USi5qZ8KA8RP7xzN2AQMizjGZtyKXXnK/ZgtJHb7UfTXgw==
X-Received: by 2002:a17:902:e1c5:b0:158:e060:4f6c with SMTP id t5-20020a170902e1c500b00158e0604f6cmr16832548pla.163.1650394086869;
        Tue, 19 Apr 2022 11:48:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000a9100b004e1b7cdb8fdsm18432137pfl.70.2022.04.19.11.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 11:48:06 -0700 (PDT)
Message-ID: <a4acb584-2a75-69ba-74f6-f3132dbd0cf4@linaro.org>
Date: Tue, 19 Apr 2022 11:48:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 12/25] tests/tcg: add compiler test variables when
 using containers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HXFc9vfaV0kb

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Even for container-based cross compilation use $(CROSS_CC_HAS_*) variables.
> This makes the TCG test makefiles oblivious of whether the compiler is
> invoked through a container or not.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220401141326.1244422-10-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.softmmu-target |  2 +-
>   tests/tcg/aarch64/Makefile.target         | 10 +++++-----
>   tests/tcg/configure.sh                    | 17 +++++++++++++++++
>   tests/tcg/i386/Makefile.target            |  2 +-
>   tests/tcg/ppc64/Makefile.target           |  4 ++--
>   tests/tcg/ppc64le/Makefile.target         |  4 ++--
>   6 files changed, 28 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
