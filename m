Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2357496ejc;
        Mon, 9 Jan 2023 07:42:44 -0800 (PST)
X-Received: by 2002:a05:600c:5116:b0:3d9:f296:1adc with SMTP id o22-20020a05600c511600b003d9f2961adcmr1918996wms.33.1673278964566;
        Mon, 09 Jan 2023 07:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673278964; cv=none;
        d=google.com; s=arc-20160816;
        b=pB+D5/FEeRa6QlbNl8z7lHOabCUqXE8cjexpfVorLKUIdtOS5Bm/GecYlNDpHZkmwp
         LmAiI1Ny1d59AhQ/b9c4pJMDg17i8WYn9wE2lWd64h5W6p7vsfLyzV8tNCnUWoTqF03Y
         bhU9EWGJHtBZgLUqIXkukWFLbhFKpEl9c4obvTvOFi4HHM2QFTwUzwqrwD3PR97VzhDY
         3je+5QNpRmB9SYM6tZ/UqsCn+8jfzy43G2anFFu0jZbW3VHiO5QWLSxn+M6qI1+tyQFa
         zvaVjeMqG7PZZFNFKz9mRxWOfhFVz3cSMQzr3l3RE22dlacjmpz9O6kF94e7DHXGYPCM
         /0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fcjt8GRqrhxCOLryltN0KqgWw+coxdZhL65SUIiCpTM=;
        b=PoSZuUDl4I9mOIwPuTfX347LmZ59Js83gfKAPtPCmOEdMmgackatBDJG7J/9pvWM3v
         ICYF2ux6/W4cVmEXrW9o6CIHWPnY40RY8JHPcbLb3kAIhzL8Z6OY8frU4Vg7JwCWdWBJ
         IdP2HlSLdG6Rfyk97GizvMc7dG0aoIwi4UjqII1xAMLglUrgFOSPbGAQLZI0h1dCtRPY
         yixO8AuJ7sgalgPx10CW4hDFPwDc4kmp/H0kcW7XFJQ0Ys86OnZryl2/6B+NWD+A9I5P
         1+GXAQD+8Q5NkKcndNUAKRxpJX617L+jKe14K5S7feqq5pHk8p3ce21YTJDDFV5LVFNX
         ianA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OGatsdms;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p13-20020a05600c1d8d00b003d9ef8a598asor1308940wms.0.2023.01.09.07.42.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Jan 2023 07:42:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OGatsdms;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcjt8GRqrhxCOLryltN0KqgWw+coxdZhL65SUIiCpTM=;
        b=OGatsdms3DoVwczZHLZWLXesCj/uT3sd9fdHbKL2VMJmZ+nTNX7UZtESkJXyX46kdx
         pzKzcrTJqW4D6vsVYShyaSTnYmStMm+n72p0FxSaqcfxRPLzQCFXq5ifMwEKMFw+a3qe
         cI6wj6RydMG/tKZ8tqSIuRymmIvil9tNnYimeYt5M9Gc1D3IRxnuvS2MV7W+jMAyecvA
         mwO6szafw2eo1NI6PnyZPwKzEZkkxht+Y8Xj9QKCTsbpRFZ4OTNyV8Ql+XltLxAcObSI
         qb5mseQILnHq3rbEgpsGr3IhjdbM2SMJrlCcrnWYJvfYIKA/ZTb/yirHuNEbUZUgTg+4
         RhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcjt8GRqrhxCOLryltN0KqgWw+coxdZhL65SUIiCpTM=;
        b=a9NNZnmKrH9JQ8uOTqHBsqeqNooo6CRIuNX5LTSkZ3CDBqUw/L+1yKScM9vvpvUpqV
         RFZ4waCYzrnFMysdO3Gcy697K8Y1FBWkG4ROjcRLNMk6xg5Dzsg0wYlHeNx9l+jDks9Q
         7Us6dX+moteJKczjSOhGA6md9KS9rLebhZUuS6oT8+2e6h6FypEYsrdL7ICF2pdoLu0C
         H2aMuIWFsJg7aWuu/WpXKgRMIuHCVCIYj9qi6ixQ3rxfNn5IbX3/Hxay4gN+Is0e+5uP
         tXL327kqyjAjQnZhCpRipPW1R7NlWbqWlZ7xt6PFsU76Z9547MTE+TjF1DmdqxJswntE
         AEoA==
X-Gm-Message-State: AFqh2krOEkYNqwbP4MVM4RWxc1w1GyT8Oxxs2vZVdqNpyAWr1oyC9O5F
	ldxJaSGEfXyKVY4KP3UnnkMr2qL8
X-Google-Smtp-Source: AMrXdXuI7MdGERFuzvq+xL6DKSivwjYprEYi0PtD0l//qkh3ehodzS8UMsn0377vf2z28daKrp0n/w==
X-Received: by 2002:a05:600c:35d0:b0:3d2:3f55:f757 with SMTP id r16-20020a05600c35d000b003d23f55f757mr46209153wmq.20.1673278964337;
        Mon, 09 Jan 2023 07:42:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id t8-20020a1c7708000000b003d9f00c8f07sm3799458wmi.21.2023.01.09.07.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 07:42:43 -0800 (PST)
Message-ID: <2a1d1243-2675-8be8-c35f-8c072065645e@linaro.org>
Date: Mon, 9 Jan 2023 16:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/avocado: add machine:none tag to version.py
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221215224725.3236-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221215224725.3236-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ewV0gtY5whTm

On 15/12/22 23:47, Fabiano Rosas wrote:
> This test currently fails when run on a host for which the QEMU target
> has no default machine set:
> 
> ERROR| Output: qemu-system-aarch64: No machine specified, and there is
> no default
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/avocado/version.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
> index ded7f039c1..dd775955eb 100644
> --- a/tests/avocado/version.py
> +++ b/tests/avocado/version.py
> @@ -15,6 +15,7 @@
>   class Version(QemuSystemTest):
>       """
>       :avocado: tags=quick
> +    :avocado: tags=machine:none
>       """
>       def test_qmp_human_info_version(self):
>           self.vm.add_args('-nodefaults')

Looking at previous attempt in 
https://lore.kernel.org/qemu-devel/20220104122104.849084-1-alex.bennee@linaro.org/

* tests/avocado/empty_cpu_model.py

   Forced via vm.add_args('-machine', 'none')

   tags=machine:none would be cleaner.

* tests/avocado/info_usernet.py and
* tests/avocado/vnc.py

   -> Fixed by 5104b73824 ("tests/avocado: set -machine none
   for userfwd and vnc tests")

* tests/avocado/version.py

   -> This patch

* tests/avocado/migration.py

   => Missing

Maybe we can squash to this patch?

Meanwhile:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
