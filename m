Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2554348ejx;
        Tue, 12 Sep 2023 22:54:52 -0700 (PDT)
X-Received: by 2002:a05:6512:33d0:b0:502:a4f4:ced9 with SMTP id d16-20020a05651233d000b00502a4f4ced9mr1205262lfg.62.1694584491978;
        Tue, 12 Sep 2023 22:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694584491; cv=none;
        d=google.com; s=arc-20160816;
        b=qhvG4+/2W4mRGEthqDOkezqSLJuf46bIlpP96tj9Ks8IeTxjjGwHJ5WWFCR79px0Xr
         RxtPPmFtiVHHjmgkRbYYwICiJRgImcMn6vsAtSZY+Gd+5D34/YAMQkt1Fx+kW8TbGV2d
         I67HQIQEYE4RmNGIOUKb2+lihbmopZOgAeRdlRJtyz15gBJEQtF+dZ2QFZ3/UUTPSZXo
         n6bH/8Sk3h+FVWI1Se7sA+sE5re85qqxLuakwOoMVbQvKVu20dD89AZlcTzGTmeM8auB
         cW6XQh1NDau4577YAp+VbH6DHHWpdrVEM/lPiw83w3WdBOUAJIf51NGjnCJpU6gNyHeB
         NbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZKPvNQyBs+vs3I8fZOSjCeF/0yGMYMuEac8xoLH2N7g=;
        fh=bf2tleYB2Gl29ucaGXzmp+HmT2qtp6x4owpW6Yjb234=;
        b=hK5kA7b88BHrY2il860OakKt+dhSY3h3dXZvmxogjkx3fpbNsEvYU9ps2Yu0k8NLX8
         Pd1u7nCybZ/R5WX/ZnLfl8Fr7YJIQujDj1l2uhSfxLG81T7W6pLyKZYtMvlupRFxz1fH
         8kcKQx3Iwuw2sp7b1jpWRuapn70ysYclAeG8L/Yh1gxu3YmHVjo5SrDpb2n5TZcd4uZX
         +2XNs0LYbWgwOMFUVvdOfsUf2Cisoq4AvMIxuCiaA24WIVw5aKk4ipucXUfBWg9qifW2
         IObMA5CgAxMKOK4/tujM0BgoUMYCaDtEVpx9FyhsOiala1Kl+kAkO8tHhLApq9ByXYG3
         IDWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f0ltrCW5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q9-20020a0565123a8900b00502db39c06bsor226694lfu.8.2023.09.12.22.54.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Sep 2023 22:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f0ltrCW5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694584491; x=1695189291; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKPvNQyBs+vs3I8fZOSjCeF/0yGMYMuEac8xoLH2N7g=;
        b=f0ltrCW5MaiVXzNMNvqpmj2fwGJyJeLFxaOok38PtoL+8ISktNi1vWMW0Unm/2Yeci
         06qWsvwm5nwfTwueujGjvIrMiAuPTObBB8cuTazfoJfysWcRUPxJ+YUZaBj2F9prO+Bn
         p17D67esOE/2E+upkO3Vg+o3WqsPJDtaM7B2Id4dZ62/VbHJrJWhInym036cvj/SyNdw
         h0PoSESyr2LcedtURrZK6onHIyUN6Hx3XcUpBtqnoEyCUsLpQ13xXazAUTLg94lVEUZc
         BqUWqbP+vr6D/KQZtnsSexvJsCfWbodhDOhHzZ15tfqcBJM3fgp+GNTR4Xng8qfGl1CH
         UPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694584491; x=1695189291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKPvNQyBs+vs3I8fZOSjCeF/0yGMYMuEac8xoLH2N7g=;
        b=ItQQYXJpymQbp5twKO6XUwvSWiWtHoU98qjlHUVH0U0viveSVZ+emiPQjsQFCn7ryw
         QfSbUmNux98Kdzc525mIHCfvcknxqVbMW14DgotF6PjjxWmZalHOKRterom2TWFc4JgZ
         YQ3fJATA51mbMQ3y8cBnK3mVBuVhO1FCqJBZc1UIZnh9UqNDZpjhQ8d+iJscTZ02vt78
         JscQF71pqrnoAN9zH+xk5pFqhKQNL+X0BtuAiNzPEMHgwJIQbEFJeDRVpa6N1Hk6Gkbr
         Wjensbv+uI3E0FA/7lD4nz8O+nfdcqmBbNCDwvLpnbvilOFqkNM+sNMtQ6/I74C5gy52
         e8Mw==
X-Gm-Message-State: AOJu0Yz5L0A4WvLAr1Hi7vQ7hCuEsXx2SjzZLyU4slkWZR8W3cbuWkrr
	GiI64izXei004qUQVZpCYOb7JEeS
X-Google-Smtp-Source: AGHT+IHy7kim5wKyBRfCsYI1k7Ig8jS1Z86GAxcoEIeK2jhCysIA9WfbpxDSV4n9UfdpgCJ+3nqACg==
X-Received: by 2002:a19:2d1b:0:b0:502:a0e9:8820 with SMTP id k27-20020a192d1b000000b00502a0e98820mr1001800lfj.47.1694584491300;
        Tue, 12 Sep 2023 22:54:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-241.abo.bbox.fr. [176.131.211.241])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906394100b0099bc038eb2bsm7717523eje.58.2023.09.12.22.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 22:54:50 -0700 (PDT)
Message-ID: <ff8b8e0b-d0b0-6194-4d02-9cbe134d5eac@linaro.org>
Date: Wed, 13 Sep 2023 07:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 3/4] gitlab: make Cirrus CI timeout explicit
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
 <20230912184130.3056054-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230912184130.3056054-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rRwTTDf/OGHX

On 12/9/23 20:41, Daniel P. Berrangé wrote:
> On the GitLab side we're invoking the Cirrus CI job using the
> cirrus-run tool which speaks to the Cirrus REST API. Cirrus
> sometimes tasks 5-10 minutes to actually schedule the task,
> and thus the execution time of 'cirrus-run' inside GitLab will
> be slightly longer than the execution time of the Cirrus CI
> task.
> 
> Setting the timeout in the GitLab CI job should thus be done
> in relation to the timeout set for the Cirrus CI job. While
> Cirrus CI defaults to 60 minutes, it is better to set this
> explicitly, and make the relationship between the jobs
> explicit
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml       | 3 +++
>   .gitlab-ci.d/cirrus/build.yml | 2 ++
>   2 files changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
