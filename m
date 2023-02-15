Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp844820ejb;
        Wed, 15 Feb 2023 12:47:18 -0800 (PST)
X-Received: by 2002:a5d:5983:0:b0:2c5:3fce:423b with SMTP id n3-20020a5d5983000000b002c53fce423bmr537640wri.4.1676494038512;
        Wed, 15 Feb 2023 12:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676494038; cv=none;
        d=google.com; s=arc-20160816;
        b=ZghS8CUZv5EASMvZCEfaDwGF3Fr4HxnuTvTIKyRg+cf506aY6tEdO9nTw0U84RaoVy
         ODqbqWkA6L9MrI9Tsl9+2LofqmF6XvPMBVrR5cq5/8HczsVzVOtzDQaLGS7hVNvPO8P0
         AJhJ5AgtzbRCXV1KKcBeA3G57yu5oipiqC1WqQ1L7oim8zsTg3Sv1Y6DaFVLaxlQ90xo
         8fV6wLk20dNMxt8Gl9kDyctFeLEbk+1FNzDMv3ZWREyHWA+LByACD/8pAhKsNzm2Prcz
         s6w6bcp8sBZyRPXvCJQLum3g3k9frZp7qJBTeE/JueuLo8IdgkYwBz36RvH62rCJqJWF
         7awA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pJqRjEhlKl13zFx6NJMV4OwwodZkI1RwaD9JBSeHc0w=;
        b=Dj6eaYzxs1RLofZd80BhJlHo7ig8u3kjYuy43jIbk3vw/DOKAHNfKQb93NgM4CQvrw
         8LMYZdjKEBvcDMasUPZPz2O6ha7kLe9feTD+kgKRKK6hoPIEHnpFx/9x5RxsUNIbxYfT
         HDb2txPQKtiOYK6dKyi3mAvVLdlCiTmVGtbPiThcLsdHaodkGLMgHVyjKxR1dVfIWQEG
         edaonvYjE0UHw4OcYoJDdcmKVgxHWpqzhSTpu9RJCoVUhHeg4T4+L2FHKP3nPu+KRsRz
         2PpwOjfeyshGl1tn+4OOiK/PS26iTfms+xZKU4FIPQN4wHAr9XUdKqNnxQluQWleFjAs
         SHUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHfYTMt9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j23-20020a5d4537000000b002c56cedd8c0sor1591206wra.25.2023.02.15.12.47.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Feb 2023 12:47:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHfYTMt9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJqRjEhlKl13zFx6NJMV4OwwodZkI1RwaD9JBSeHc0w=;
        b=oHfYTMt9Ghl4YWAmJJKkgDEe6Vxt7pLoKN5R+TkVDyajYowbYv0BKmiiSa64XsLGN+
         keRn+FG/Q629s97/+tbyXUhvRytbWJuUEZUpXcI1n4BoVkhcTk7jIURUoixPVobczUIl
         2qWapUtTVpX8hndMMBO2Rlheu96Dbr77RVVhEwjR6gyMx0YrRe9ZAsoZHmLpI3qzQwCq
         eafAVtGDIpBHvqp27BKAz/PzKdGS/xJ2YXsSgp6NiFQqFANT11/dF9hlefrb88rK0ZgK
         U6lMbm2UNCJ1Ykbs+0FKh7Rl7Xi8xhF3r7Zl7oNJNp2hgRQgYST09e703OsHd6k3QGyv
         qjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJqRjEhlKl13zFx6NJMV4OwwodZkI1RwaD9JBSeHc0w=;
        b=ovnXDqhKQIo4WmftmQ8x/vVi5isFiqKQ1R2s9ncJOsYJvYEC+Vjk01eTjZWKJFc2+Y
         Q71DTbWlW17Iq813ZV+GNqJPZwdpmINJoGOnMf4uXZy3zVZ0D77hvZ+yxerkotYDZXqF
         x8asL9ybvmDKJV0WVswVoVcxNUGkJKmFIKMUwjULmadmkk7O93zTJeigI835Hrdmgw0j
         +X7N7yLNxzOUGdzrRMTKMPbBF3bn6pf6YN9eGwhwzSsNcXzSlI9fRPqrEzEhnco5tC0q
         Xdws3OxMCgyhg8fiN0fg0nFmiSe4v/tVPIZWksJXrMxrYEDjnkI+0uwU2B8YxGqMvo/r
         xOSA==
X-Gm-Message-State: AO0yUKUED5WRgYi/juH4/VlQ77Albu4Svv+6IJTsRRgyX+7flG8sUD6Z
	w8EMWJ7vGrIEnVEUqjmvHR90MX8H6BeQOwcXx2U=
X-Google-Smtp-Source: AK7set+a2IOcqn9xvjwBVMrNk1X+wc6aiLN27fyZx6tVCc05Ln8cFl9l3z/SQYrVHWk6aPZMLch8rw==
X-Received: by 2002:a5d:64e3:0:b0:2c5:5335:73f3 with SMTP id g3-20020a5d64e3000000b002c5533573f3mr440214wri.34.1676494037976;
        Wed, 15 Feb 2023 12:47:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id r2-20020adff702000000b002bddac15b3dsm16081586wrp.33.2023.02.15.12.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:47:17 -0800 (PST)
Message-ID: <534be66c-bd70-a4e9-0e30-6892d7b0c8bd@linaro.org>
Date: Wed, 15 Feb 2023 21:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 08/12] tests: skip the nios2 replay_kernel test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: C/NJpQBqHmR7

On 15/2/23 20:25, Alex Bennée wrote:
> It is buggy and keeps failing.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/replay_kernel.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 00a26e4a0c..f13456e1ec 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -349,6 +349,7 @@ def test_or1k_sim(self):
>           file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
>           self.do_test_advcal_2018(file_path, 'vmlinux')
>   
> +    @skip("nios2 emulation is buggy under record/replay")

It will be hard to notice the flakyness got improved. What about:

        @skipUnless(os.getenv('AVOCADO_RUN_FLAKY_TESTS'), 'Flaky test')

>       def test_nios2_10m50(self):
>           """
>           :avocado: tags=arch:nios2
