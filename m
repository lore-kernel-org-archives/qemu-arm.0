Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5647582lfh;
        Fri, 3 Jun 2022 07:04:04 -0700 (PDT)
X-Received: by 2002:aa7:848a:0:b0:510:44da:223d with SMTP id u10-20020aa7848a000000b0051044da223dmr77622730pfn.66.1654265043889;
        Fri, 03 Jun 2022 07:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654265043; cv=none;
        d=google.com; s=arc-20160816;
        b=eAR610x2vjd4qLsg4KnCWBwslDGu/DW+//ElSqY+M+Rg7cztH7KRMXem62WL4UboHc
         l/nA0+j8qfDwl4bhsjDAA7xCsX33YApaTF9rvX/3GZUDASCfhDGOb0RupCy/IeG6mD6B
         kbnq11VEqQd4fT+ok03+ymzkp93aiRmz4TCWl6/SNVbj9JYVpF3ksn/6EYEGeH13Ui9o
         05XmnVI+EQaPjItQQ5Tb1SAz8Jofnpqa0zZ1/RmOK55nLMIxlxt8vWQ9JDhkoDg0CX5O
         5C0svwfHIctzc7wRyG5pZ35hBfTx5deYL8/ZAHQIfAHnOU95rFbtuvm3cMgzblb2EdvQ
         kBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sUCDG8ZB37f3JxtItIbiTafcH+tldRv5hwHPRFbKPIs=;
        b=krWxodwHJlI3ZiW/7RtB+yoAhEl1LhXsbR4r2MQB0TbHUlZSxtuJjASNUHGhKoWM8G
         pic/3DZ7l89SnnXPNP8elpE8YUE0wd7wML/NLJ6M8NePCDxnNeCZ65Rv9V+lRH97uzI3
         XW46EuDX0515hHK5Vh/JGV9XOo0L+c1KJZvaal7d0SfYg2GbopJUrTWo/XsNMot+OaCC
         8UQbgbYyy1Z0vi/Px+X7BMyP/1G6TRZoISp4veUBQO7pwr6lPlvpMlrYOLuUjq64Bxrm
         zgdTPy9satq965zm1fgEYcHL+q/OnT2SY1z/byeQXCADY+CoBBqfn1JASqfHtBiVXawH
         XgCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rKUHXXCJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 192-20020a6216c9000000b0050ce67b49a2sor4204098pfw.59.2022.06.03.07.04.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jun 2022 07:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rKUHXXCJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sUCDG8ZB37f3JxtItIbiTafcH+tldRv5hwHPRFbKPIs=;
        b=rKUHXXCJBSrSqy6isylWK7oLyQQqd2LiA73SWCwR5BP75XS0oaj4/eStcXemn7f7mG
         GRMe6+38W6CYF//xxKVrjMhbRLIDV5NIgO8G9XqjL9XlFe3kcaUPeJkn/PHrujq1megB
         Hac2/ElcR3wSqyFHUwGT5VFFF4s5Ym72H+V4YwjC79rboNQ2vZKEILErpX0GmuHHfbgI
         sjg5zcftAqZGutg+8dqVuEZqoCMDXcTqcKVsjjGaXPNDVbqW/ouqALLl1kvn9ESd1rfq
         yclWStEfC1HwZgk2EzXk/Nk9XLdyoKb/b4DaugoaSUVHWC9OVlZq8KspWS/xoqAG0jqj
         USWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sUCDG8ZB37f3JxtItIbiTafcH+tldRv5hwHPRFbKPIs=;
        b=OEkynz2aS9eUdHTvCTUM1qTSgk16QgRNGcG0eRw+9n0c8rvbANcfQ8iAjI2xek5QqF
         sJ5zF7sCtEdh8Z2RxjJKQYxE1yWApPOQVHfY+MDcyHDkGGfgpA8hHpZ/o6CLy7a6ciMK
         d8h3/BAUyGW0OJxuf24MJGsgnWcguTUe606b1nwexiSHYrh69Qd4NKRXS89Ycr7lpoV1
         HLgQZztRjsPTiphmljwMyd09DOpNCbOT61ipOAr9YBhPwdl29lwZn8Srw7nmqcOYQaFZ
         yv5eKMln5eYOITBtMWF7yoVqRcOM4WHLUsS3Bem5/m6i4Uw4TWIXu/9IBNIoex8cykPo
         dUeA==
X-Gm-Message-State: AOAM530gWOxagFIORYO0826surLcXkjACaJTf69ziga+NCmDBhaNgWjd
	Zx5uLrhzNIFL2fuOXbujjHhRqNNHB3nZ6sB5
X-Google-Smtp-Source: ABdhPJwAZRkAHYBju760wRgq8IeQGH2moewesed8s4Z9Fk4GJc9nWGBat+1yDhWBSYH1Ae/8iuL1VQ==
X-Received: by 2002:a05:6a00:803:b0:51b:d3bb:3f0 with SMTP id m3-20020a056a00080300b0051bd3bb03f0mr6812225pfk.57.1654265043337;
        Fri, 03 Jun 2022 07:04:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94? ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
        by smtp.gmail.com with ESMTPSA id h188-20020a636cc5000000b003f9eacd0684sm5498771pgc.3.2022.06.03.07.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 07:04:02 -0700 (PDT)
Message-ID: <8baf9cbc-3cd4-bcd7-c60d-b68bf0784779@linaro.org>
Date: Fri, 3 Jun 2022 07:04:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt
 machine
Content-Language: en-US
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, cohuck@redhat.com
References: <20220603111849.1481100-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603111849.1481100-1-drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2TI0lywuOfx1

On 6/3/22 04:18, Andrew Jones wrote:
> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

For avoidance of doubt, copying v1 comment to v2:

> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 0b2b0dc692b1..c19022ea977d 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'

This will *not* work without further changes.  Fedora 29 will is old, and will not boot a 
cpu with FEAT_LPA2 enabled.

See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")

Which makes me wonder if you've actually tested this?


r~
