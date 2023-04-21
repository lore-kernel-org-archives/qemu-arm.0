Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1329400ejm;
        Fri, 21 Apr 2023 11:06:54 -0700 (PDT)
X-Received: by 2002:a1c:7318:0:b0:3f1:7eaa:e2c3 with SMTP id d24-20020a1c7318000000b003f17eaae2c3mr2340861wmb.24.1682100414230;
        Fri, 21 Apr 2023 11:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682100414; cv=none;
        d=google.com; s=arc-20160816;
        b=XrdDWBz/c7nKYSksF/+kM84XJwOhWzyb0Fo/xgXkFEpB7fKL7UyzQmo5r5OY0CQRgN
         M3X3nuPdOQHS54a78chq7h749V4RpVeu5lYDdN8tv0Xa/53DztqK8MzEohbn0fO61X/e
         F6cOYNvXgxpPKefkCWRW/KUUiakKxuR5EXsbRYjv7u4PEiJ/6mYO6u1cEnTTfurFr0fz
         6ViE7/9ShRAgnHC9ATBMuzHjVnq6m1/yyF6wyPBf9igq8AdQIzn9HSNG4KYj7vXLYOqq
         m/GeJ6C4kge543mgR4vMv6HStZmCKxMGvpmQlx3IvUTSIWQTSunvAQFu/xyRIcHjdpKo
         4MuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PMv4D0VJfTywI9Nd8ABZBx3lwI6qG06/eyj45xd2sqs=;
        b=b1lWUpVn4PbcSUKoWQ2Qz8nkCwyuknwtCg0I7fLc+g8Ngg5ZR974zmuSqskr9ygtto
         BZBxGAQz7GQRDkbPbPYK4ipfK7gnGHgX0UzX3WJgyhuCF18SwSkVL+mHo2bvnVPMYS/f
         UYWrqJ2rwoPt/7Zus/k4q9Ehm9TDja1wKPdoDtk8VTIUgF8q+UjMvwEYO74Dd+2u4Je6
         ewmS42Wfai9WiIijuK6b33rxUX7OLTXS+n31l5N+LO/Tct29QaQGOgZprbK3D0RA++3W
         mOB5RsFz4d69okp+10J67R4oyjYQxUti7AhpIiSGCfmcKeNgPMBwVSQ+Ua6TMEWYPok1
         9d3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zu+5UE2S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t12-20020adff60c000000b00303af95ac06sor964172wrp.91.2023.04.21.11.06.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Apr 2023 11:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zu+5UE2S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682100414; x=1684692414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMv4D0VJfTywI9Nd8ABZBx3lwI6qG06/eyj45xd2sqs=;
        b=zu+5UE2S9nJbllUoQdkYK303rkUANml/z3PH+h1CjhT1X0xKDBu2mNkZ07UEHNLR+F
         a1YQzIXw743wlwgMqlmspWXoaubAVcqiPKCj624k3uTSFf7dlNh91tEw8QnVopVhuRrn
         chsOGzX6RPC6a7EoP44sxi3S188G6b9bRlQn8NSobcxJMuuTIY5LfMzjk2JhERREDXgH
         1YdGvmr2A/fHJCB7whq537b9BnNH7hPC1TzuIzDYHFbNDO5P0ZWI4dqBUu4hEPhdb4q/
         670+hlXaYoN3uzew62c39spr2ohNmCGXasIHEVmGQYoxK09IvFOkjQKwkW/wvtkoPvWY
         7T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682100414; x=1684692414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMv4D0VJfTywI9Nd8ABZBx3lwI6qG06/eyj45xd2sqs=;
        b=E/h6+hnthQMtcYXHV5256bfnvwYnd0i0mlnyLyXRu7/eaAqNMEevxuGUXJY/la6u3i
         EyFNSWL/QLjHJPEqxgseHAZB9tVxKp4z2PbBUvoy+H1xPJezopHqQT5IW8/LGAMLGjit
         LYICpK9MPuPhvXta2zAZWbPKvGirXA1AcSSKEX1yUxI2guhSZ7Fi51ViR28EC+9BQ8yP
         TROb8PCQdzzQ0oBwxUTKEZ/dVl8emT4LWVQGoA8uYmH95BQk1jxuexO8K1dZlIC/2jOL
         Q5akbvBYbg/kSpjWAIqg32EhywsO51YClHyfYcRzL2Uq68N8To/5vdhFSd/cQz6OmQ3U
         9khw==
X-Gm-Message-State: AAQBX9dGDQyuz4BMJdaBTu5DewEI+uH0PcQQmM+Nj0WfjbUgJNuBjCie
	YA+vGnaRXeFKJEKn9vrSyGNbCKEf
X-Google-Smtp-Source: AKy350Y/y+WHoOy+iIAu1YA/9gE0ANdp4Vte3e6po4qt60teMIONC7wQXu0BiiNccxCq3YDdkKm30A==
X-Received: by 2002:adf:f58d:0:b0:2fb:db79:748e with SMTP id f13-20020adff58d000000b002fbdb79748emr4793262wro.65.1682100413815;
        Fri, 21 Apr 2023 11:06:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr. [176.184.28.119])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d6a83000000b002fe13ec49fasm4846938wru.98.2023.04.21.11.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 11:06:53 -0700 (PDT)
Message-ID: <3175956a-ab3c-7259-1b28-6fe54043238f@linaro.org>
Date: Fri, 21 Apr 2023 20:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 06/11] target/arm: move cpu_tcg to tcg/cpu32.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-7-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: C4EVFBoOUS+q

On 12/4/23 14:18, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move the module containing cpu models definitions
> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/arm/virt.c                         |  2 +-
>   target/arm/meson.build                |  1 -
>   target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
>   target/arm/tcg/cpu64.c                |  2 +-
>   target/arm/tcg/meson.build            |  1 +
>   tests/qtest/arm-cpu-features.c        | 12 +++++++++---
>   6 files changed, 15 insertions(+), 16 deletions(-)
>   rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)


> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 1cb08138ad..1555b0bab8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>           QDict *resp;
>           char *error;
>   
> -        assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> +        if (qtest_has_accel("tcg")) {

Can we add a comment to explain this non trivial case?

I suppose the reason is "KVM is builtin but not available, so we don't
want to test the TCG fallback", is that correct?

> +            assert_error(qts, "cortex-a15",
> +                         "We cannot guarantee the CPU type 'cortex-a15' works "
> +                         "with KVM on this host", NULL);
> +        } else {
> +            assert_error(qts, "cortex-a15",
> +                         "The CPU type 'cortex-a15' is not a "
> +                         "recognized ARM CPU type", NULL);
> +        }
>   
>           assert_has_feature_enabled(qts, "host", "aarch64");
>   
