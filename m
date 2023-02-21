Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3109210ejb;
        Tue, 21 Feb 2023 02:07:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+t8nBCGIaEGjuEfZOlpsHdgeqluPkxCIymRvzyDNvIa66P4TgD67y5w9YK9kUadSv9ZSPc
X-Received: by 2002:a05:622a:1387:b0:3b8:6db0:7564 with SMTP id o7-20020a05622a138700b003b86db07564mr6714470qtk.44.1676974051942;
        Tue, 21 Feb 2023 02:07:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676974051; cv=none;
        d=google.com; s=arc-20160816;
        b=dr9CUckC9VD9lZx8JbqqE9Bhhcv3ENx4KkQkqN5e6NT2k+5t2M1hj+uDdEF5XtskZ4
         dlU67U+VwKLj2nAsGheRfs+Q8pCGbrmjRjxZoA8YxImUZVdnWTIzOwoEedseHGCENy/0
         KSZhs+pcqKomRyv/3rPPk+qNGLvXNT5PJb8E8QefaRZChHJhiQyANKg1YDhtC8BCOSj5
         W8JIBPoYYMkv/Al0L/kqQzOX3op/FO5/h73TQHoQLK+UaQYAj4m7Ftr2d7rDxyFwcA1P
         TnFipXabuNF/VEteU7IRdFsQDNN+K1/2lI45s+RFNbYu7zHoBRnM+LM1TVvuzq4b4fVB
         5Zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Kemu3tO5gYETTSD14GppNL8mfvdfn+An8mCMM6uYLPM=;
        b=YZ9xKZPSpceA5LvXh2o4e1FkC5QKgA3cl+CHqGKUuT1lb8xagAa9MgY6lbjvPobruL
         kQUTzLxT/UL6yy6vYVB4Nu1Ccelx0xSwc2lAF42YA55kTR7Y9MK54ox8Nqco+XV0fiWU
         5Yu+tAIXVJg+Es7QearJFIuZaHgkjQPIJVb7fL3KWxNtpV+zsH0KJQXNxbHaWaFuhIwD
         rEfoMvuSg9oHNF5O+DfKMt8X68UvXVCv4K4CdWgWUHrVZ1mSlf0Yp0cSH8T3iTRl4iCz
         +6KMzQ5mnaQ1YyWTv1+wW0up3/1ioU7+vL56Vo6zo3PaOxsLSwbl3pyhIkVG6lbcUs/1
         4vyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M3FaYXgt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h2-20020a05620a244200b006fbdef09390si1273289qkn.96.2023.02.21.02.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:07:31 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M3FaYXgt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676974051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kemu3tO5gYETTSD14GppNL8mfvdfn+An8mCMM6uYLPM=;
	b=M3FaYXgtyWLgjr7NuZjhpcq+Y5/+eD6coAisNDUX9CUp9jV/ZjvMk3l+Yp9kR05RtB+VV3
	V895kIxVEiMox8/265CkGFtLuvWQb6lliZ77l0WXP+qkvvrVFNG5lJK4ny/2C5i/42X9Bw
	sJkbX3t7ySrA3o0q2KqJCoEe1q9hldw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-E8OnnUVPPHe14jXLTl6Krg-1; Tue, 21 Feb 2023 05:07:30 -0500
X-MC-Unique: E8OnnUVPPHe14jXLTl6Krg-1
Received: by mail-wr1-f70.google.com with SMTP id d14-20020adfa34e000000b002bfc062eaa8so762593wrb.20
        for <alex.bennee@linaro.org>; Tue, 21 Feb 2023 02:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kemu3tO5gYETTSD14GppNL8mfvdfn+An8mCMM6uYLPM=;
        b=HIuWkwXQ6Z2+M4mJYfEd8wC+n94yftBGoAQZFzGmXM6NQQNheHIqIjoSjovOBgs/RJ
         cZZ9Df21PzPPFuzppM27XsJ9dDpMr+DIxUaVJlo7ZuPm3e0UhW7YG/2Frse4uB8H9V9Y
         iR3a7yZWylc8jWgZKPoeBXl9U7FA9GfbPKb8lsRPBInOFW0p+cRjosWliai+BrvJobJq
         uGxH8y3Z4oA6TcOjo+d/ByHOqufPE1mouyW1XU/ihfGpV0N5Bvq9VIdSj6tSrc3lws/K
         i7sSYV+orBJMbuKeyMe1Y7jmezzgdgsPZERdjMqE50vjz2tkTBzIKF1xAPYtmsjO7UdA
         zzJw==
X-Gm-Message-State: AO0yUKXeUhdV1q20RLH0vOc4e4F0uFAWSRPc22E9MB6kLeTBIW/HFaN2
	TBON71zy644kek0Kq0+E5JOCxhz/XZv/mAVrwaiWeyZuq1bbT5Jir9P+uQ3fFknAyc9FhP33uC5
	ufx23f86ZUtMC1+1I2HpcGM0R6+yTxruwRrJxaXLiCuGWAkOPiOid0/oa4SVemPvgLnZeLPmk
X-Received: by 2002:a05:600c:244e:b0:3db:1200:996e with SMTP id 14-20020a05600c244e00b003db1200996emr3368773wmr.16.1676974048062;
        Tue, 21 Feb 2023 02:07:28 -0800 (PST)
X-Received: by 2002:a05:600c:244e:b0:3db:1200:996e with SMTP id 14-20020a05600c244e00b003db1200996emr3368732wmr.16.1676974047784;
        Tue, 21 Feb 2023 02:07:27 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id fm18-20020a05600c0c1200b003dc1d668866sm4586253wmb.10.2023.02.21.02.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:07:27 -0800 (PST)
Message-ID: <47357c02-bc71-c6b3-db94-2c52402f362d@redhat.com>
Date: Tue, 21 Feb 2023 11:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 04/14] tests: be a bit more strict cleaning up fifos
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
 <20230221094558.2864616-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HKhAMc7nh2k0

On 21/02/2023 10.45, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 04b75ab3b4..c6e66a8c33 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
>       g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
> +    int err;
>   
>       if (mkfifo(fifo, 0600)) {
>           g_error("mkfifo: %s", strerror(errno));
> @@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
>       object_unref(OBJECT(src));
>       object_unref(OBJECT(dst));
>   
> -    g_rmdir(tmpdir);
> +    err = g_unlink(fifo);
> +    g_assert(err == 0);
> +    err = g_rmdir(tmpdir);
> +    g_assert(err == 0);
>   }
>   
>   static void test_io_channel_command_fifo_async(void)

Reviewed-by: Thomas Huth <thuth@redhat.com>
