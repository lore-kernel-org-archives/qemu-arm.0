Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3107147ejb;
        Tue, 21 Feb 2023 02:04:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/keNpnePbnc+xjMHMmp49M4f/iaZid0/hbCRAQOQIdSRly3NTy2+ayyhYT6M83JvjYJICY
X-Received: by 2002:a05:6214:dc6:b0:56f:979:b1e8 with SMTP id 6-20020a0562140dc600b0056f0979b1e8mr9769439qvt.48.1676973868008;
        Tue, 21 Feb 2023 02:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676973867; cv=none;
        d=google.com; s=arc-20160816;
        b=FmD2+LHBabXAcMj+HWzKQ+1g/sMlEcTgpg0dS9oMqvC3Ddq3svO8332bofOOipyVsI
         WTJSfpyMbOreKNtUsntdiuhA9qs+YbbUmCakQpYu3U/+Q9vRSpMxwMt0FxmwGGf9KHOm
         qdRyyPmXJscxA06zbc72ATR23BAP9HjPKK7g6B7rpZId5+n9Pi6/B5WPoLKO4vgm9Zxo
         UEXfb0QbsK7LDKgVrRy9jxq6nVjlrXmQMK2DOHjkWQkWPlRcQACIRXuD2gRzH6wz1hy5
         1CJAOTFsxNCypWZHjFZ0zRMvRpDDGbOL7Ms9rli1NWfl2Bi7hCIX7nzHXNx9EXp5umJv
         +CoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Dxm85y5xVyedPy18kRG7+gwmjwt5HmGfgZHePGEhj4U=;
        b=J0LnKIgFuXwCD8R58PabJ9RhjRDhrmLJ5DfxrRF/iC+iv1obBfvX0O8hj3ElE7NO7t
         r6feD5mtDUbpiSmgvzK6fc4L5rraoOKvGqWviyPObarbvayUK2um8zIvrVoXQFXm40Wz
         eHSxd+ejZ5bnvi+SDCgYthecFOQSX/I5uUf93M9XLkk1EH0w285MfwU+Hdu2nAUU9Chb
         322Fb1v93JHET/75uUSXkTSlTwI9IW4fCzhjOGWQHTVoO9qx0p/BsHmWB7B4FnQko7LF
         IkvbdCBXb77t5HmipLYARl/+mHEIC396U+9F37zBtvXwMoJ7hyR1/4XByUrVd8UbGy22
         GVXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UYPIkShP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f7-20020a0cf3c7000000b004c703352c1asi11070924qvm.372.2023.02.21.02.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:04:27 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UYPIkShP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676973867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dxm85y5xVyedPy18kRG7+gwmjwt5HmGfgZHePGEhj4U=;
	b=UYPIkShPBA7L9DSeMGP1gLcMwcyr9v/7SVGWUyKgym3vtqZa6M9BQQiieYtwIgfoi0EbqG
	w9FymA1+POPgqNV+rBsdcgoyqpXX1cbnleh0UZqWi5EcuefG7JOm7K5Vjmw0sm/VJsqoPP
	PHDD11yb7j8iMemDGusQZftW1O2gKIg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-180-SE2GcOjkOwqcuAKD9TNbWA-1; Tue, 21 Feb 2023 05:04:26 -0500
X-MC-Unique: SE2GcOjkOwqcuAKD9TNbWA-1
Received: by mail-wr1-f70.google.com with SMTP id m7-20020a056000008700b002c7047ea429so237986wrx.21
        for <alex.bennee@linaro.org>; Tue, 21 Feb 2023 02:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxm85y5xVyedPy18kRG7+gwmjwt5HmGfgZHePGEhj4U=;
        b=QO5IaNhKVzwlxbnim2x86ttMQziv3QA9Afjwq+6eW6VtazuUm5IX155drG/adZ7Ioi
         kLTJI1FeOmGku51BPC7D/yQv+pAg9EVwO96j4juzRWP1fMYeaFpgLfuNMQqmnCT1qr8P
         ihuNNB7iCJI0sgAaxJ7hJ+jjIIzFBsfz9rcJ0hfnJGO/wDZgHfN6qNuSRctrkRlomRxq
         V4BFxQZryJWRlugj0ifXXeMAhdbBSm/0EwoVAxKKilD8stX/AHRuviEHKEWb7jmogpOj
         KAvlHsR4pUcQ0eIzpRkVsIYvYEAfbzs2KIESCZhGaEnedo49J/UuKCip5XrvK9sErzEO
         BwzA==
X-Gm-Message-State: AO0yUKWQfeaW93IXjxuVmaTz9cmdQz0in00ZOA6/+hBEz8JXZdiEZRHO
	TxB+WjQAuIsjAXRoAzZlxPeVvJRs8moeHi6ws+2Ac26mX1YObKvhxPiHCL0goY94jegMG9SW2LJ
	N6LtzoVLy2P59lztC9bkn77/BfN7G0cz/95Yv6Wkzrl80jasu5Yy92ylJLZ9Y0nAQmKJoNW92
X-Received: by 2002:a05:6000:10c9:b0:2c5:52f5:c63b with SMTP id b9-20020a05600010c900b002c552f5c63bmr3552878wrx.11.1676973864006;
        Tue, 21 Feb 2023 02:04:24 -0800 (PST)
X-Received: by 2002:a05:6000:10c9:b0:2c5:52f5:c63b with SMTP id b9-20020a05600010c900b002c552f5c63bmr3552828wrx.11.1676973863675;
        Tue, 21 Feb 2023 02:04:23 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id x17-20020adff651000000b002c563b124basm4223543wrp.103.2023.02.21.02.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:04:23 -0800 (PST)
Message-ID: <2f29e811-6fc8-7e5f-0ce8-49a409348d6e@redhat.com>
Date: Tue, 21 Feb 2023 11:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 05/14] tests: make fp-test less chatty when running
 from test suite
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
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ed2+7r/ENqqS

On 21/02/2023 10.45, Alex Bennée wrote:
> As we like to run tests under CI with V=1 flags the softfloat tests
> can add up to a fair amount of extra log lines. With an update to the
> testfloat library we can now call fp-test with the -q flag and reduce
> the output to a terse one line per function tested.
> 
>    make check-softfloat V=1 | wc -l
>    759
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/fp/fp-test.c            | 19 ++++++++++++++-----
>   tests/fp/berkeley-testfloat-3 |  2 +-
>   tests/fp/meson.build          |  2 +-
>   3 files changed, 16 insertions(+), 7 deletions(-)

FWIW, the testfloat counterpart can be seen here:

https://gitlab.com/qemu-project/berkeley-testfloat-3/-/commit/40619cbb3bf32872df8c53cc457039229428a263

Thanks for tackling this!

Reviewed-by: Thomas Huth <thuth@redhat.com>
