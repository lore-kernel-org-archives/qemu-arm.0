Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp74241ejb;
        Wed, 7 Jun 2023 00:46:09 -0700 (PDT)
X-Received: by 2002:a05:600c:6917:b0:3f7:e78e:8a41 with SMTP id fo23-20020a05600c691700b003f7e78e8a41mr5291911wmb.18.1686123969484;
        Wed, 07 Jun 2023 00:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686123969; cv=none;
        d=google.com; s=arc-20160816;
        b=bLdPD/NfTgcuN15GfqJOprzDViaccftdjHrrKQZUxRPeiMzvOXQaGGwcPaKL8JY1p7
         FxkjXMMFPWUOYiMBXvE4PTMrrFp/1bStipPYZJew5OrjeribJ3tuwI8d7wR+AifVPJaW
         grm1RvHkNNvs+vZJLgibz6ytbeT0WtWgmyyalHOKRJ0CTVat0sNBDuCkhqu1fSfKnoz2
         rdBRfC/82/JifLDVzTSDLmss0fV0XADtRcdVRE9QfypBinvjTapmRMKrfXmDcnmK28Go
         VVnJWc2Yg+HvuhPEUeCEIN0oWgyQ+XcmRijNYsR6fJUn0gh/ENrVkTBTki5/Egq9Yd78
         XqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vhlc1WTWb6qUkp3RcdvjmxiUYof71kDU4Z2LTzmzunQ=;
        b=D2uUW3WSxP1qxbmAqs0Vn62Zrq+k5RxgsUjbGRbz7Qin0ZjrWfU6bY566sMOZ9PF2J
         b4AUHNxoC9EmN34yBol/bzbZ0eSuO7lCKcDEYyrCb4Y5ZwAvY8reBoVT0uTpfC+FdmOU
         VCije3Lme0/06KhfEkMNjg9YRllPEJnwA/3mS3W52UtkzknYTQl3nrTXmDHMh+QncsjZ
         SoYJCpJe71mtvWFlb0xyPJRF/nkTgxXBAvVBcsdS/cYvO8Pd3kcQW3pdWv6BiyXR9yz8
         XfipzaEv4/+HE0FMNwLTTkNJG78sm+tlTYB74HRXA7nxXtt3Xirkm5fyJVj6GarSsAo0
         5CHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdzmZokU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bj22-20020a0560001e1600b0030ae5b7a2c9sor289440wrb.0.2023.06.07.00.46.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Jun 2023 00:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdzmZokU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686123969; x=1688715969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhlc1WTWb6qUkp3RcdvjmxiUYof71kDU4Z2LTzmzunQ=;
        b=XdzmZokUJ7oyakfrjSIv74EQnIEBx1pKhruzK9m5R37waIkhcBjHajr+yQHYyg7k2I
         S42/6tKwSlJyANav3ZQ+cXj+agY69/6hRm2E1iuGObAEuzVJHEuLFSYIhnCEb0u9E9KW
         dl+ecUNj4ypbET9mwd78Q8BF9alVcyCZi3aKmhq9FJVo0C9Ue6rXCbvaESO9LGdFuKTl
         4oZ2g4UF/PLzHuIK0GOgPfQJ3iKII2myqB0HRW20xhuYxRJBwipQqWdkQ5Tz8HJEk4NE
         46CImLq2D+5+6QCGhFP8Td1HgeH8zTyE/0Pz/f6BfQs8CenlTCtrdw2mnTWXmvWQi0BJ
         6Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123969; x=1688715969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhlc1WTWb6qUkp3RcdvjmxiUYof71kDU4Z2LTzmzunQ=;
        b=MGNiAAA7Wm1pmbvLXDubvi1cpxbvVHUOP8NPcKTAIGHMyUnXiSue3RM1oTyLJ08mkp
         B3LPu/145T7ybP3AOLukrhKpRSRlvDpy7IRi7bDKcuXgkHTngspZdPlZ1saAB7nXys8K
         xYTJ74xV9NihqxW/STg1iJQP1U/VKRw4Fa19hfnCh1mKNeUQAcmbeVZdVBZH9X0/9dyg
         HB8ui6Az6obBWQ7/KJAR8WTuFN+ddXVeROqOl3SDqtBoPrs1GIEhOjorUfSXZ/+vzgPB
         GJ4+B6iq465x7kqUfpxsUtFE1pvpfBwsUYLvCB+lHm6TWlZ/aNYmf5AOhZH+54IQk9n7
         9S+A==
X-Gm-Message-State: AC+VfDxNUiHyg3gxUlT3X51Pv9ifWLXs1NaTu8Eh/XS3vnCHzP/0vjAz
	T27Xcjxylj38HakXhX42t+39i7Pv
X-Google-Smtp-Source: ACHHUZ5M1xLPCMkVrmN4TWQHbbx5jSporBkXZnk/KQ2v+PWERhlu11wTzeT7fs/Vol4dy7wF+k4PSA==
X-Received: by 2002:a5d:4383:0:b0:30a:f68f:9b94 with SMTP id i3-20020a5d4383000000b0030af68f9b94mr9495913wrq.21.1686123969162;
        Wed, 07 Jun 2023 00:46:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (bd137-h02-176-184-46-52.dsl.sta.abo.bbox.fr. [176.184.46.52])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c204800b003f723215b6fsm1197528wmg.12.2023.06.07.00.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:46:08 -0700 (PDT)
Message-ID: <8261906e-de0e-6487-ce3a-254087e9253e@linaro.org>
Date: Wed, 7 Jun 2023 09:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] gitlab: Add cross-arm64-kvm-only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 Fabiano Rosas <farosas@suse.de>
References: <20230606224609.208550-1-richard.henderson@linaro.org>
 <20230606224609.208550-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230606224609.208550-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0i5iqWJNSh00

On 7/6/23 00:46, Richard Henderson wrote:
> We are not currently running a --disable-tcg test for arm64,
> like we are for mips, ppc and s390x.  We have a job for the
> native aarch64 runner, but it is not run by default and it
> is not helpful for normal developer testing without access
> to qemu's private runner.
> 
> Use --without-default-features to eliminate most tests.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 61b8ac86ee..1e0e6c7f2c 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -29,6 +29,14 @@ cross-arm64-user:
>     variables:
>       IMAGE: debian-arm64-cross
>   
> +cross-arm64-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: arm64-debian-cross-container
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
> +
>   cross-i386-user:
>     extends:
>       - .cross_user_build_job

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
