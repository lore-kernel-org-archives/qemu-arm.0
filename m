Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4081575ejx;
        Wed, 23 Nov 2022 03:15:59 -0800 (PST)
X-Received: by 2002:a1c:cc0f:0:b0:3cf:9c1a:2fd0 with SMTP id h15-20020a1ccc0f000000b003cf9c1a2fd0mr5849457wmb.3.1669202159136;
        Wed, 23 Nov 2022 03:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669202159; cv=none;
        d=google.com; s=arc-20160816;
        b=tJnSk4e8uY1a+XZiNgNXlKmtkzMxAQkdCTR0n9FDSyZyCsbbalS+Avu9kzRid3bUAa
         F0cx7zT2m1uf3uCtp9UcHefWXlyieYevt7f5eX9Zfd8IDa7NoKgDHQJr4GEz0UTj4+3U
         HSnvWymd7EIzITlGYOx3PH3hfhr4qa+QyVir4TJRGclY1DLxvRZQPpP7hP1Y00ptMGqn
         01zbvGgnaenWavE9zHl+M5BoIpyQdy68OgW4kJe0BADhRUrKXdVGGxf+F9+PUpB0n+Cy
         jjw/VywljCXmLRAOToUMJuqHSbe4wvD2rw/RV7Z70RxAIaYwtO3YGQ1NzlIShQDqGaaD
         rJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YV5GjfqlGMYqnHplbI75uo+sg4za+NNKjasDAwq1fCg=;
        b=OZ/nXSAAXbCPwcD2XesEk6M797NLzwEQHdxbIyxe7kVPzz5jWlikB2AMEBZNq+U8+H
         3VMZ8AYueg3Xk3VsvDysd2J2FaLuvhOmNtBTence/rN25V5hmgOwk9Cme1laC7n7Bqbt
         31wcuiSbIPrpQJsuAe31x1vYkzxsbIgp/qge4Pgil5qiDFxvAoVL0QsymgUdDDQY7PP2
         EL90BmyUN6pMAEIN2/oCL0zkS+y1LTJKw93cygGSiZ4cO74RU6OvkEDmP4Bp4kZnfPLJ
         Hl1v7O/5Pwo3HeBY7uppd70mFYWQByfUpeKjHmgLe/aikFljzxPEh9Na/K0WgX5ECbo1
         Ze6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kd/HF14x";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p12-20020adfba8c000000b00241bfbd4468sor412905wrg.27.2022.11.23.03.15.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Nov 2022 03:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kd/HF14x";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YV5GjfqlGMYqnHplbI75uo+sg4za+NNKjasDAwq1fCg=;
        b=Kd/HF14xXMzAbBsh9f6vVapVbS2Nn/uRgVWWzdCSphRnMWIoCLxeB2o6XuR4+HFZXe
         I7gwaehQFk7JROUfoxmFNd5JKyMvNO6F6uw7mwBM3fogD5ELs06u7vpOv5WUuVCalG0U
         Hhl3iwbN0Or2tTTFUufRu1Gm7hy7GvZdlCM4NhasuhFNb0I3hkYKUVUdAkNxZYVUONr7
         VDg/AqD+9u2i/QbgU97zsUxoT0M+w0rD/9JLAxaJJMsAb2IX6fXatJYn0aos+o8Cmd7Z
         hHOgAftUPAurqFo0LaXctKtDCjIXfGzsxTKUgy7FeZcNUAFt6re0kS3Heuh8KOWO50yf
         +ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YV5GjfqlGMYqnHplbI75uo+sg4za+NNKjasDAwq1fCg=;
        b=VQCtmnklVqwYrReL+5sghlzqS9m/Dsw3YJQn2aBbzzSVpo4i79ES/ZhX3K417GN1Yi
         NMCj+fDXGHJQMjOX0LjUBhaM4r7iZliZGNFq8F5GtH3MEY1S5qqN+gA5OnXrbORQWsvH
         2sQg/DSlvEzd5gwLOKB2PU+p1rZBJOta76blUj4tTHcJ4aWRrqXe2GQKKBcE35XGQ5yi
         VbfObXmEsQYSBCgJGsCpXJ1zFc4XHppM5lKNuor+7jznDSC3cc+8kDrE0tGQj7/TAJs6
         lNwer+CrJh4KVPvEN7hCiX5YonxJhBjxjmjrmQ6mnJNCvZxoYbm1+Qu3jwPsKLv+ZCnW
         Z5Ww==
X-Gm-Message-State: ANoB5pkqyWVwfsU+lZ7y+KCe2LXrhPcX5fRmTaIGPgfe2/+UDpA4dkJO
	Efv3MxAS61md5nYFkcmF8tpTrh9OAnqSedmq
X-Google-Smtp-Source: AA0mqf5jaTQFrS1ssTI1gKi9rSFsexIy1OUMt2+3fsDxo69koO3EJdo8F58gpgAIHMd81+fc73NcTQ==
X-Received: by 2002:adf:db10:0:b0:236:58c8:2ba2 with SMTP id s16-20020adfdb10000000b0023658c82ba2mr16680726wri.224.1669202158559;
        Wed, 23 Nov 2022 03:15:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id o42-20020a05600c512a00b003a3442f1229sm2099959wms.29.2022.11.23.03.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 03:15:58 -0800 (PST)
Message-ID: <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
Date: Wed, 23 Nov 2022 12:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118113309.1057790-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rZEc79D8k5gZ

On 18/11/22 12:33, Alex Bennée wrote:
> The old URL wasn't stable. I suspect the current URL will only be
> stable for a few months so maybe we need another strategy for hosting
> rootfs snapshots?
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 4c9d551f47..5a2923c423 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>           dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>           dtb_path = self.extract_from_deb(deb_path, dtb_path)
>           rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
> +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
If Avocado doesn't find an artifact in its local cache, it will fetch it
from the URL.
The cache might be populated with artifacts previously downloaded, but
their URL is not valid anymore (my case for many tests).
We can also add artifacts manually, see [1].

I'd rather keep pre-existing tests if possible, to test older (kernel / 
user-space) images. We don't need to run all the tests all the time:
tests can be filtered by tags (see [2]).

My preference here is to refactor this test, adding the "kci-2019.02"
and "baseline-20221116.0" releases. I can prepare the patch if you /
Thomas don't object.

Regards,

Phil.

[1] 
https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/assets.html#registering-assets
[2] 
https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html#filtering-tests-by-tags
