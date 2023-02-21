Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3115748ejb;
        Tue, 21 Feb 2023 02:17:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9wJ4Wr+L3gsYmZjcdnT02G38korufywSiouZe+C/02uAUfEmMwQ/uSjpeHojBMkkV6iur2
X-Received: by 2002:a05:6214:1d01:b0:56e:ab08:670d with SMTP id e1-20020a0562141d0100b0056eab08670dmr6964715qvd.42.1676974659768;
        Tue, 21 Feb 2023 02:17:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676974659; cv=none;
        d=google.com; s=arc-20160816;
        b=O8rZQTCLhiWG6E8EaFIkmFOcHbzkhsf1EOlHkvgw8y9biWBFxn7mgdkhcl3T2KOokm
         v4eYifzLonxDMkvFuY6iwJ+E9n2J6cmU+h0HCCoa4bSZZd5oD5glYiSFubc1p1Drz5qB
         T/kn66Olmxi5slu6fiRyyAPo/rhIud9kLPR2YSCEYhTGexFXbUrKOpzn7FV4K7FeDlPe
         b35pZTeJJd7O9gdY2lbsfkwtZcNM8ztfhQiuLtMxDo41636dua4QnxeAFxEyB1s3yS0I
         yv3NO2GPXD8s4iN56nBxsyELrQ6THVsjuuVMc+eApZtBmeROXlJykKTg5KSZZfvlmGEq
         5g+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4iEFF/b/QbvZzC3DBwRXJReUoO2iqpzmbxAm+CoJOHE=;
        b=Nj4ojoahwLQnGq19rxPB6Fw5B4glzWhr4RWJYbTnpV7IlCv4rWfvkl9p/e/CWwXNcY
         R2oFI0yz2UJLZa5a3bZb2aJxsWkprXseEzO4138dbq26/aGi2pAKr8sdxY08/yNuVHRb
         GFdhsBurz8LRzoQPJMAEPu8/8xjsChiX+ua8F79bY93dk5WRqJRl1ux22yrS0nWlt2kB
         u6dxmNpseBBG/kmO2qummaRc8MuI+LCg0SSiLu4PsUB3q2RShcM6i9Fc+r7nu3l2iPK9
         35KvRsP5xoSfqe+WUXzLp7SgXGR62h1gX336/fy+d7U0R0Sz6D9qlIthg9tdh2sqwB6Q
         g9HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AW3j64Io;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d14-20020a0cf0ce000000b0056b426c8345si11505614qvl.417.2023.02.21.02.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:17:39 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AW3j64Io;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676974659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iEFF/b/QbvZzC3DBwRXJReUoO2iqpzmbxAm+CoJOHE=;
	b=AW3j64Io5S8edK1FGVEXcRtvGZ+PrHnao3qJvd7cGtndNfNmxJEHv0AC6tdy9g1hve3aRM
	eXxI1S3ti5fjwmhUdVAMhUFQSdB8WL4L4bk7kmCDgS8xCcicWKO+5tyUWb+RmCWDdUkY8G
	8Vj+WfRcVx2tPdukhLXpRLGY80pD/VU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-9YufErsqO1q3XAmmojtvQg-1; Tue, 21 Feb 2023 05:17:35 -0500
X-MC-Unique: 9YufErsqO1q3XAmmojtvQg-1
Received: by mail-wm1-f71.google.com with SMTP id p22-20020a7bcc96000000b003e2036a1516so1813039wma.7
        for <alex.bennee@linaro.org>; Tue, 21 Feb 2023 02:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iEFF/b/QbvZzC3DBwRXJReUoO2iqpzmbxAm+CoJOHE=;
        b=Ka68eTFtLq9GRW+/w3nyGKTiuYdyPNHEiIxzlobRMMI9eXNDzHu4DzTZjKOPRQtsvs
         6tfibllhZJaDqj5GRJoQ0pHmssLVGvXKUolZ9JumXzs5qVOAfmqj6dsXzrIzjrlW4EOl
         ST2KutKbFZdZ/uBHkNwCge6VqcAaU2GpowsZQohNUmiF7X3f08HG2zmlVx3olNCrKbEg
         NZQPDNMsEtbsZa/LOr7ZGNa7Lx8BS/OlAuW1ZpObF/bs/n5KrPiNxl90fA3RKI9pNBwO
         75cuXOrssTpzgiG84VI1F05t0wAFGsukjy8WztVpbmjii6nyonkPgx8kyMtIQqW7M23X
         IP5w==
X-Gm-Message-State: AO0yUKXXlCzmHukvixx5FV2nRTJz7v+gFgNVg5ym38iDgAJfRtu308Ji
	NoJWYChaz+kigi4eBR/5n0IS0HK/TFObBUbveCdFkswYEysv1pxr7u6oMq/DqVEJ1nlgUpGrB/W
	IJGi73Y1t1ZozXGwUyyYPVk8bHkh4MjTVh1OnTampF+6ZvdAKn9RkiYSswaKsv1qXy+3bIzy4
X-Received: by 2002:adf:e9c7:0:b0:2c5:7c26:c2cc with SMTP id l7-20020adfe9c7000000b002c57c26c2ccmr3706335wrn.29.1676974654890;
        Tue, 21 Feb 2023 02:17:34 -0800 (PST)
X-Received: by 2002:adf:e9c7:0:b0:2c5:7c26:c2cc with SMTP id l7-20020adfe9c7000000b002c57c26c2ccmr3706290wrn.29.1676974654589;
        Tue, 21 Feb 2023 02:17:34 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c210500b003e00c453447sm3928799wml.48.2023.02.21.02.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:17:32 -0800 (PST)
Message-ID: <a182b11b-3f65-9daf-c3fd-f98cb335917a@redhat.com>
Date: Tue, 21 Feb 2023 11:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Anders Roxell <anders.roxell@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 11/14] tests: add tuxrun baseline test to avocado
In-Reply-To: <20230221094558.2864616-12-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PXICBuvwa7Mn

On 21/02/2023 10.45, Alex Bennée wrote:
> The TuxRun project (www.tuxrun.org) uses QEMU to run tests on a wide
> variety of kernel configurations on wide range of our emulated
> platforms. They publish a known good set of images at:
> 
>    https://storage.tuxboot.com/
> 
> to help with bisecting regressions in either the kernel, firmware or
> QEMU itself. The tests are pretty lightweight as they contain just a
> kernel with a minimal rootfs which boots a lot faster than most of the
> distros. In time they might be persuaded to version there known good

"*their* known good baselines" ?

> baselines and we can then enable proper checksums.
> 
> For a couple of tests we currently skip:
> 
>    - mips64, a regression against previous stable release
>    - sh4, very unstable with intermittent oops
> 
> Total run time: 340s (default) -> 890s (debug)
> 
> Overall coverage rate (tested targets + disabled tests):
>    lines......: 16.1% (126894 of 789848 lines)
>    functions..: 20.6% (15954 of 77489 functions)
>    branches...: 9.3% (40727 of 439365 branches)

Acked-by: Thomas Huth <thuth@redhat.com>
