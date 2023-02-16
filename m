Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp202335dll;
        Wed, 15 Feb 2023 23:38:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8AdjLDFKc035nu6zBx/EGtB6ZFnPh/i5ANPRw/IwZS8xNc+jTtZQit1Vt3YlrYbc2sPvW1
X-Received: by 2002:a05:6402:1914:b0:4aa:b225:39a1 with SMTP id e20-20020a056402191400b004aab22539a1mr1335107edz.20.1676533081814;
        Wed, 15 Feb 2023 23:38:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676533081; cv=none;
        d=google.com; s=arc-20160816;
        b=U46UDSIh1G/sVX3JpP4T3ygjJ2+UEWVT9iCbm48AeqgnUT6Nwssew7TPt3I95f3Ao9
         21DQWNDalmjLKHIzIWD0lif3JyIVbGSVC2UxAEhNPs8yH7nE1h24CO99qTgst6EwAB7L
         5lq8/egDPZgrbhm6q3UBEyzq0RYap/bcciPSuZBiXZEh3rMq3bGXNbSkB0fw2OeTuORZ
         yMwCCvk/LDYOP1ktfwEGmLIApzL5eh8L/sOS26d36r+tO02Y7ipplGZdkk+cXBdILL6f
         SLVkf8WsAanz5Bze89rnzEdF29TzH//muQW5kYLyr3K8m3bXBu6vBnCIbhJTKgKSiOw9
         3p7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4IBR1SHwu6ZT8H16tIJvB/Kte+LvBpPr85s2MmaP5VQ=;
        b=mxskXq8WOliUy/ujPDuDqfZds1QCvvujdKesdK5WK9V29QD/FayxRJD109FpuukUfm
         HzJp+/+z54i0z569KPgpYUo+uahDje2qw5kBKQK94wjlQpNP80KmhwPMouO5syZnYUYh
         8gSSfWkkoQoP3ojjQEH+yqGyIFrPuyPNcs4eUpyc65DkQaHD3n+TxBkj2w6TcX5FQH9E
         Q6hv8cgqcA2rcxd5/0s4fYa2oMt997Rhoax+WvAbXjAT0P/Mj3hx1+VtURlcyMkRoRP7
         kBwplAejpCKv2XQ8noejl+XBdZ77Hx41/Kv3MjHsQhbBkakQkc0z1rea+BD0U8G3uYl0
         8a8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QFANcc5S;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w5-20020a170906968500b008b1417d71f3si1045519ejx.977.2023.02.15.23.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:38:01 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QFANcc5S;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676533080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IBR1SHwu6ZT8H16tIJvB/Kte+LvBpPr85s2MmaP5VQ=;
	b=QFANcc5SMxvXXV8wiLnB7nAabtSwiHVZtNJ1hzWXb1JbgvNGIX6hBR008+xUwVc7GY9zKq
	S6P1HhH+VuqXbzANEpVNx7e+4ybZnDWKdGHYqu6FVUlNVxwRaGgeSr/OMujuzvHkWaoIK4
	z2a063290ea4jSolSrAAK5op1dwf1VA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-6pUgaNp6PW-WVW8w_Z7sBg-1; Thu, 16 Feb 2023 02:37:59 -0500
X-MC-Unique: 6pUgaNp6PW-WVW8w_Z7sBg-1
Received: by mail-qk1-f197.google.com with SMTP id s7-20020a05620a0bc700b006e08208eb31so718362qki.3
        for <alex.bennee@linaro.org>; Wed, 15 Feb 2023 23:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IBR1SHwu6ZT8H16tIJvB/Kte+LvBpPr85s2MmaP5VQ=;
        b=7w02ybNXE1feeZEycok263CShtZg0HKS1UWfGuRnzBa3b/MWHscgd/BxwcgBXDYgf+
         UYdi8Kdg9RBuJYSjW7KFgxxcjnMO17J7w8/wgAOHj4eiegeuwYdwnjarGN5E1Ez8RvDm
         D7GjWdzBLU5cm+o/O0IlSDkdeX2SIRHwgR0699A186peZQfkva3DrnN56e1eI3I5Lj1d
         Qpcs9i7mGN3OrZ8Col4FJPtM9jShf16LCIsIxaKW/cJUvUzLbrqJo874p9W3eo4atvK4
         qI5lpd6UDvs+H5KUkWsXGlDbTsmQY2urV10JBQkutyyM+rkZ5YYMDih8eExPmda/x7r2
         OCmw==
X-Gm-Message-State: AO0yUKXoDNWJ45+LKRQMnpIHPMHWDVYPaK8kOKZHaEdLJn3bziWChz/y
	1QrB2/X98haF6F6rYbsEu0LDACk1O345dkadyf0mtSDYoJIewcxw8nanx7TTvOVvlJqDk4EwV3U
	eb7ummMPARPH/oxujz2KlSnqtE6IHVMEoDUOht6RDEuApLn7KbmmuF/dV5CxufaWzH+oT8TG6
X-Received: by 2002:ac8:58c4:0:b0:3bd:48:70a3 with SMTP id u4-20020ac858c4000000b003bd004870a3mr6958960qta.1.1676533079146;
        Wed, 15 Feb 2023 23:37:59 -0800 (PST)
X-Received: by 2002:ac8:58c4:0:b0:3bd:48:70a3 with SMTP id u4-20020ac858c4000000b003bd004870a3mr6958923qta.1.1676533078848;
        Wed, 15 Feb 2023 23:37:58 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de. [109.43.176.144])
        by smtp.gmail.com with ESMTPSA id a4-20020ac84344000000b003b2957fb45bsm816701qtn.8.2023.02.15.23.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:37:58 -0800 (PST)
Message-ID: <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com>
Date: Thu, 16 Feb 2023 08:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/12] gitlab: reduce default verbosity of cirrus run
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Cs+UnrwE1fcR

On 15/02/2023 20.25, Alex Bennée wrote:
> We also truncate the echoing of the test log if we fail. Ideally we
> would want the build aretefact to be available to gitlab but so far
> how to do this eludes me.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus/build.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> index 7ef6af8d33..6563ff3c7a 100644
> --- a/.gitlab-ci.d/cirrus/build.yml
> +++ b/.gitlab-ci.d/cirrus/build.yml
> @@ -32,6 +32,6 @@ build_task:
>       - $MAKE -j$(sysctl -n hw.ncpu)
>       - for TARGET in $TEST_TARGETS ;
>         do
> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
> -        || { cat meson-logs/testlog.txt; exit 1; } ;
> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET
> +        || { tail -n 200 meson-logs/testlog.txt; exit 1; } ;
>         done

I think it should be OK to publish the artifacts on cirrus-ci.com instead - 
you have to click a little bit more often, but you can still get the 
artifacts there, see:

  https://lore.kernel.org/qemu-devel/20230215142503.90660-1-thuth@redhat.com/

  Thomas
