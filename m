Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1366207wrp;
        Wed, 25 Sep 2019 15:26:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmAcFLMly9ozc3cYzS37ZOxtmcuSWbJyq5jJTUlR3/+BpTJAZmf4+NNO5PQXt7GuzMxFCA
X-Received: by 2002:a6b:b291:: with SMTP id b139mr258494iof.281.1569450372675;
        Wed, 25 Sep 2019 15:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569450372; cv=none;
        d=google.com; s=arc-20160816;
        b=kKl8xN2Iwiuj4CPTEJh//x5G4edUkGHrTNWaqqrbR6oT9x9HkJufySGvENiQymx3rS
         n1bcBuCoD5Dx7kHX7VrBmnal94KiReLctCGsbpsi9m1UreU0fI6qDID/337mtFx9fPEV
         xfH+0XiTrwjx1jzB8K6UDwwFmCytKnN+IX3Dl1sv5Vo8qRxRqnVU7h6gKC6TBdxBJVCH
         P864fducyjkPOYPvxMrDjbCzz//jQhu3gqXWqXshn3NQ3o657MZjOVPzDsGZZTRfAF1k
         IZgIJhZhzGuwZOSLwZDZ3XdI2ZMJ3sciDfrGeEwSIYcPWQudsnuQmzUEMkslo7C7KVB8
         2Ixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=Ki4KWdct/PxQ711z7Z5gWMHnI3AztE+laXxt2f5hC1I=;
        b=rmpr5sIUot2BYJP2G2y86fUszK3/i50MOHrCi31WzkDVGuO9MIzNAY5B2gyVzjqsHf
         OKcTHMM0ginOiXoyWEVCkhoWixlnL4YeJRpFo8gyNHbdZnvS5/z+Z2RpjZmjRyjDPBOL
         FmlRPwEiNNMB3q/B3IlTzJ3AdBr7cQfzrKE06c32yhwf71j2YZAuQj+VqAtBeOriR4tI
         VKcU2oR6h4RAt8wHbGfbEXW1omZd3IRlAHNOiP2qndJTkSVPndL8X3dhVgkFjC/vfIl3
         t9I8G2uNcYdda/e0Qo+fQjwJLD57K1mrJgl/U2nMsTBXFQYLZS3YjCvFfhj947K++q8V
         om3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x1si56864jap.46.2019.09.25.15.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCA5489AC6
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 22:26:11 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id a4so133703wrg.8
        for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 15:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ki4KWdct/PxQ711z7Z5gWMHnI3AztE+laXxt2f5hC1I=;
        b=q7v3zf6kYLDWdswXS3U5yNeDm8UOv/6EAA/HRqAIJQyYctdPHbPgdDM+d7NKVXoXg9
         dzUSbnFWXY+C7nVjbeO2uAFcWAX+8lQKXgjSDpiSdy/dDQ2Ha0ig5Z4FVTGCtOohQHSG
         /nBaPrR9olaCACl5TqNLNZCMHdG1y0A+/FsLcRgEHVt6J9p1KEWKkns7P+yd7rQ6DdJq
         iBKleFddbg0cvx5BVW1FIBY+KJmCMsEnp++6N45uDoSpm+16yP6Cp30LmjViLgRh91mG
         COJuw8MXLgWML15TV+2XUDXTFzkRkfP4TQlEWrDKyqwNjuZ+zIprPKWAof0HbKG6ZUSj
         +tgw==
X-Gm-Message-State: APjAAAV3aD1eaAD861ftKPZrLEIFrwoiK7rPi/ydcZAaolK654sTMQV5
	Sl1W3NWs0OztjDCyuTFuFZBHJYbywXaPs4ccMN5MoWdZNeIgdLG5mbI3TyJmO87cBZTC3BvZUa6
	vltG73L+6YL/w4C+g
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr353679wmg.25.1569450370632;
        Wed, 25 Sep 2019 15:26:10 -0700 (PDT)
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr353670wmg.25.1569450370481;
        Wed, 25 Sep 2019 15:26:10 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id x5sm276669wrt.75.2019.09.25.15.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:26:09 -0700 (PDT)
Subject: Re: [PATCH v3 20/33] tests/tcg: add generic version of float_convs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jsnow@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20190924210106.27117-1-alex.bennee@linaro.org>
 <20190924210106.27117-21-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1bcee6a3-fbc0-327a-340c-8e0eae655119@redhat.com>
Date: Thu, 26 Sep 2019 00:26:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190924210106.27117-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: SXUCc/5RBQNz

On 9/24/19 11:00 PM, Alex Bennée wrote:
> This is broadly similar to the existing fcvt test for ARM but using
> the generic float testing framework. We should be able to pare down
> the ARM fcvt test case to purely half-precision with or without the
> Alt HP provision.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/float_convs.ref   | 748 ++++++++++++++++++++++++++++
>  tests/tcg/arm/float_convs.ref       | 748 ++++++++++++++++++++++++++++
>  tests/tcg/multiarch/Makefile.target |   6 +-
>  tests/tcg/multiarch/float_convs.c   | 105 ++++
>  4 files changed, 1604 insertions(+), 3 deletions(-)
>  create mode 100755 tests/tcg/aarch64/float_convs.ref
>  create mode 100644 tests/tcg/arm/float_convs.ref
>  create mode 100644 tests/tcg/multiarch/float_convs.c
[...]

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
