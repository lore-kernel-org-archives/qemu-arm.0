Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5641897lfh;
        Fri, 3 Jun 2022 06:56:45 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:162:6ea:4d with SMTP id z8-20020a170902ccc800b0016206ea004dmr10408240ple.144.1654264604860;
        Fri, 03 Jun 2022 06:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654264604; cv=none;
        d=google.com; s=arc-20160816;
        b=hGD3cO+2Ggy1c1ftI5RRvG89qYltEYfkCCXBQ0bYwmlauKt8jrAZUSRqKJJ3E0NzYK
         CiZhGYgimgbDAcbstNPcTwlhsv23qhPRtpJUrdjTGJh4Y6nGpW119AuwzXlmPCiFn5Vj
         N/XoRaCxWUEv4ZSUNdajHjzJYo1cbGi7gAG4W4kNIrd1smeWXLxtM7bsTBvr+exmIJhq
         dR/BORBiHFGNW/KcG2cHfaXMCoj5y8CFsvXVrb+6zbSsrnX0ByXClrYhCX6wXhIoV7yS
         DKMIPUB3fvpIs4k0TfQW9Li8HvaWshvXEpye8klXxsM4QkzM8X+ztgVZM0Rgm+z2ze6o
         3hRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2rFZNp3tEVk5EQHNurOELSnUFyS8vkXaUKspXf05lY0=;
        b=kQwAa4J7Sk8XECSptFppX2IXCWCuN4HA5uPVqcsEy3ZOgGlNgNROaEmERCnjNgJwhz
         elUCL+HuyquZtw+AtxS8EddQBelp7sZpOP9ogIRHd7Om/5hN0fbF9nLIrMo667NZuRHd
         tkLbX27ts9Ekj7VLYV0ekic9Xc7Ph9yvLfG9d0fZs7xXCMwfxRFQ7AnQs7iBcui7SYWH
         8sph9xWhOwA+Wq/4gy10PjChkIkC3Mk121g6pqMt1wob+MkgTuGqSU2JDjqDtao3NMeh
         HRDRzJbsvcJr9+souME/HkLP6rdWcUB0scu2jOF9r4Vk7Lp+kA6qchdckXiO7tBnqQd7
         eq0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bVSmJrLD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2-20020a170902cec200b0015d29634accsor3677208plg.26.2022.06.03.06.56.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jun 2022 06:56:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bVSmJrLD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2rFZNp3tEVk5EQHNurOELSnUFyS8vkXaUKspXf05lY0=;
        b=bVSmJrLDinK94aVusIYSSf08UKLXcOOUV4HuLvLitJl00w3MYQuMswJKI7QlrRFXQ1
         m8ErJb80Zr6mujtuLyazG8lrOXt6ApdXjt4FQGahIfq08gR59fp8JYBEr+NUwiv4WzFd
         40S0g2WdAAsdSH8dFsKHoWT/4wOWvRIDaYkj3P1HYfApoXvgPpl788tTbv/LCX03gtO5
         q1+4HtNF2HSyCyZ+irpzQq/tA1Ksa1hOOFfpR1wJN5JfPBJ7F1Lwjsr2wKw2IsS9n2vu
         7Xw632jMqIzrBo4hDDIASUMGwK+2BcAVS5Dd/AuGcNT6QJZaJuPllAb6VzzZbEXaTkQt
         M4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2rFZNp3tEVk5EQHNurOELSnUFyS8vkXaUKspXf05lY0=;
        b=LxLyvblVEaKnTnWk64jKH0+cEDayn6yimCuX9VLdnrCnbfSlNy4iApPZnYZpiWE7LN
         W9JGHmGn1RUpCNR6rSqYNdhVTXVGnQ/gosnisvt5InIuRjqE70GvPCoGdiPiCklUrZLt
         i8aje23BCFOSOdFg/EJGXvfb3OovQWgu9iqkJVAx2uB2aWVx5VNcCZRlJVg8vxS4bytq
         Z8/FGQ+OyH/dq+Z43T0Yex8eCm4Bzf2RrSTeN9yI5HVuqfJvOWmhSPNKJmkut2fK3vAv
         jpLJaj2IMtMrbvEvJpY/OlyzS1Kodx72nR4O5p5Wuly1oTP8IioTV+JKIatL72hFUm9u
         Ek0g==
X-Gm-Message-State: AOAM532uF2nhzuxoZVNmd0cIeW83pJwoFSUaJ2DjWKf3KcljNUmENy5i
	f2+dL/L6TNb/aruLX923GlzZGHxChzatyvkb
X-Google-Smtp-Source: ABdhPJyAIlkRbdiQGMGTgH7RBhrqDMPAJlSYVnuLuIy7jR+G3dFWfVkmDioiQHggPrZDaasvYm/ZJg==
X-Received: by 2002:a17:902:7149:b0:166:4e68:5c41 with SMTP id u9-20020a170902714900b001664e685c41mr6091529plm.25.1654264604232;
        Fri, 03 Jun 2022 06:56:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94? ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b0015f2b3bc97asm5528406plk.13.2022.06.03.06.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 06:56:43 -0700 (PDT)
Message-ID: <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
Date: Fri, 3 Jun 2022 06:56:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Content-Language: en-US
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org
References: <20220603092505.1450350-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603092505.1450350-1-drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: LEftQIMZ4FCF

On 6/3/22 02:25, Andrew Jones wrote:
> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.

This won't work without further changes.

> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'

For a release this old, we'll see the kernel bugs wrt FEAT_LPA/FEAT_LPA2.
See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")


r~
