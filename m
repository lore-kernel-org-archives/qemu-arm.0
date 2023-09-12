Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2287378ejx;
        Tue, 12 Sep 2023 13:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu77dyJtGqkp3Hyt99T9ldFugh5CzrSTZnvXxgHWJnOjNhHWjn+csdE+AtnEpF7EoG8mqo
X-Received: by 2002:a2e:9e14:0:b0:2bd:16e6:e34a with SMTP id e20-20020a2e9e14000000b002bd16e6e34amr596283ljk.19.1694548998413;
        Tue, 12 Sep 2023 13:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694548998; cv=none;
        d=google.com; s=arc-20160816;
        b=ckblmMv8uHtA+YKnUNBWXU+Kq1EfYr729iSUPxqz5a5PfpyosEvTh5opsJAEaLOgs/
         GSzGJOZHql8yWPr0jBo3J8rgXSQdIeCCUPd2UyOrQqx9WXM5nQIzHfwusrPJkXC1IE7q
         I3l/p1ry3MSSXGDUyuf1jDFxF4lF5fjMoJ4gKQlDYsFe9GojSvLg0nq/qa5p4n97V5dk
         FYGeZm0Dvkoik70XvGDlyhdjeDmicYQN399nisAIo5grch6vRjAlN1+8jn3G9O0b0FuQ
         9bv90WuEE8TPkUf9yDynKJnS9+VA3dFCTWMvr3G4b7+GXDG+UoESWr8B0L7qGJ2bFCGB
         COGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qr39NIMHGuHWXhJuFHiwVLAXS8gppAz9QKxHYpXDcD8=;
        fh=bPRR+rfR36xxkUDmw4gDtK83z+HVFfFjMj6OQkDWuC8=;
        b=FU3PLZM0adr2CcWpgMNxh70DTeHj55w0q3RJQ/u1TDzbaVO05DHJT/CVRm2f/amJo+
         gIHJRJptWz1GXpyqeEhWYQMtTQXWRO1GyzAIhUG2IUCpTm6eB2+Mc656wmjA5watC/YN
         E1FuKFxoY8vHNOdF4fsqjYUnrkgcQgFXc7g13wfsqMqxFewKghZNfWRdvpk7QMfDaWAc
         J1MTQ5WOwq4fDUAm7xAV4iz2mZ8bWid48Ka2+tXssYsUHurDPPylZskQ0dXzHnwzJ0Ue
         ywrBIbTRmqYFBYEx0dTFgDgmRW+0Fpm6GZa2OYd2nyhmF3NYoOHzQdVm7LPWah3Gurx0
         jAaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=StkuzUVp;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gh5-20020a170906e08500b0099bd7b2663dsi9028602ejb.142.2023.09.12.13.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 13:03:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=StkuzUVp;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694548997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qr39NIMHGuHWXhJuFHiwVLAXS8gppAz9QKxHYpXDcD8=;
	b=StkuzUVpx+XB1HY/JvuG4Od48x8ztR0jIHYkkiCra3SVz80UvSGLAJh9tJ3BpREqQMloa5
	Q99bWWqcvk8AzK5b9jCknj1s7rCGVXXC1v3DZW+a5z6ihCW6poTbgTXV3f/V19umY+xuP+
	IzY2ytCbg+hbjExgHlZ8eCb1WH+xejg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-O8gyfn1oN_SgCC15IxCwoA-1; Tue, 12 Sep 2023 16:03:13 -0400
X-MC-Unique: O8gyfn1oN_SgCC15IxCwoA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fe182913c5so46796185e9.0
        for <alex.bennee@linaro.org>; Tue, 12 Sep 2023 13:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694548992; x=1695153792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qr39NIMHGuHWXhJuFHiwVLAXS8gppAz9QKxHYpXDcD8=;
        b=LAlu2VLiu/bv0uEvE3cGrFGJpxwWMeSBPjml7dtB0FNQl1ZCX6cwVHw7k+qN8/9QY0
         kx0Pi6htEqgkgCrwfq8rIE9wK/euWIaWQbbLrD7gv+TaGPIxjYaangRss4bZfQSjd5t9
         6WVhX9ItM/1U3aB/F/lu/+GZfyH5kx3HLCq3kd2Ba8w1MyywdvyRiLoGAk9wlUGBCkcj
         576Xs7F/hrCLN+6V9eCk97b/TdTsv/TxvS4VKMkEKnoAUYBUJGZZzkQG63XaH+n1vHXj
         Gjv3qxAOXsdkJppL4j50LFTcZqS9yBlX5vE/sY7zSxSIuLKmaXXOc1CTOhYCJ/FUVZec
         9kAw==
X-Gm-Message-State: AOJu0Yzca3SijeT5HXsF9I0bu4OiOKPnoAJFFgXgbsTSNfkg8Ny8WlOV
	8thVwVcVQDDmP9UY4Jir2cKKn8sTnbGXm2rmZx9gyvNVhejeuOS/GYtVtIhAV5X+cYVUXNfDiyX
	kWCSsYLVWIf+ebC5A
X-Received: by 2002:a7b:c3d0:0:b0:401:73b2:f043 with SMTP id t16-20020a7bc3d0000000b0040173b2f043mr448999wmj.1.1694548992632;
        Tue, 12 Sep 2023 13:03:12 -0700 (PDT)
X-Received: by 2002:a7b:c3d0:0:b0:401:73b2:f043 with SMTP id t16-20020a7bc3d0000000b0040173b2f043mr448987wmj.1.1694548992319;
        Tue, 12 Sep 2023 13:03:12 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-179-28.web.vodafone.de. [109.43.179.28])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c260d00b003fef19bb55csm13814609wma.34.2023.09.12.13.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 13:03:11 -0700 (PDT)
Message-ID: <5cbb92ab-f8b5-4d03-5698-06d0a0b7cfda@redhat.com>
Date: Tue, 12 Sep 2023 22:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] ci: fix hang of FreeBSD CI jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230912184130.3056054-1-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: riu2xnHcXvdu

On 12/09/2023 20.41, Daniel P. Berrangé wrote:
> This addresses
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/1882
> 
> Which turned out to be a genuine flaw which we missed during merge
> as the patch hitting master co-incided with the FreeBSD CI job
> having an temporary outage due to changed release image version.
> 
> Daniel P. Berrangé (4):
>    microbit: add missing qtest_quit() call
>    qtest: kill orphaned qtest QEMU processes on FreeBSD
>    gitlab: make Cirrus CI timeout explicit
>    gitlab: make Cirrus CI jobs gating
> 
>   .gitlab-ci.d/cirrus.yml       | 4 +++-
>   .gitlab-ci.d/cirrus/build.yml | 2 ++
>   tests/qtest/libqtest.c        | 7 +++++++
>   tests/qtest/microbit-test.c   | 2 ++
>   4 files changed, 14 insertions(+), 1 deletion(-)
> 

Series
Reviewed-by: Thomas Huth <thuth@redhat.com>

Alex, will you pick these up or shall I take them for my next PR?
Or Stefan, do you want to apply these directly as a CI fix?

  Thomas
