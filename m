Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8489706lff;
        Thu, 16 Jan 2020 07:08:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQffUSqdIn97rJOncopdS5BbYxxbb+sZTtel3GVV/HkvsblEqb+RGN2Rc08x3KMPWmGt15
X-Received: by 2002:a50:ef1a:: with SMTP id m26mr36873933eds.289.1579187283082;
        Thu, 16 Jan 2020 07:08:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579187283; cv=none;
        d=google.com; s=arc-20160816;
        b=g96hqt1xQxP8LzOFhus0AVEJCltEfZDutfwTQlPDQFkQ6RacoeEJ1Fo5VAGR7FNkUE
         qmvY/R7NC2Y+7/OFzpshqmdqzqAWpdMUu59lZL/zGLdjaxYXKwYDm6GIy0Eqg3a9tstj
         snRnfP3gDbmhFw/sixs0r8+cis2JBzkk2B44lcKRCVg3Z1cGqrMUaJFUHfRIMcLgQ3SU
         Bi9EkSwHUeBQuglDtPDrlE1XslBQuC24PUZ2KWCJEmTHZybyrSONZeZ6E6Z/WxuDSF57
         sBElmWkEfW+XJd7q9IjBYVZoZfRUgXxxI9GW+ADFj5bwNOi55E/zB90CcKmPvyCWtGbH
         yPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=xqx8onJkFwRaxbtn/yTJuM8dq8+DussPiH5hqaBh7mg=;
        b=eDDPLe+QQGp+wjq3+E2jk9FXTloNY8x/iRSuTcV1avzLVjhu5qHQ8FBXx020YGwYdP
         vu3BmALNQS/2HM0NDeeOMVOBJlDTd27YQxdiJfCRvQEEapL6fjJpaS5xzVhGpQgJPk0h
         V+vip7QNhLL1upKNzYIRvZW/VbM2FuUDtlUIaQjWoCzI6uYhEJrmh+UUUSMSCXN1efaH
         XlFsCTQohmLC54yxj/Ei11WUtPFtnML93IcnFH8cGzhitJAETGEING4qxCh0nByRizlv
         oQdNEAYi1a20ZcQWdVXL1IROsLLYwpsReDMOKf4AB0F9StpIzwFlsF6npzvGX3Ltf8Ch
         Ewtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OL4ut5C0;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id z60si163412ede.566.2020.01.16.07.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 07:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OL4ut5C0;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579187282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqx8onJkFwRaxbtn/yTJuM8dq8+DussPiH5hqaBh7mg=;
	b=OL4ut5C0pKJ7okxIxrTKbn5BslRdRU2Y+XmawqU4bvhiu+p5LoZnJvqTU0ncegnduIPNwf
	2w9tL2e12Fw6jkjpy3o0Mj928AX41D98mJiPpEuTTvtpYngbfgu9fLJGo+7igQTYpcIe5j
	xgi3rwVSXHkpIYerz06h9Jbb/1TnfDE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-DC-RNGOmOqaQt3WmVGWTLg-1; Thu, 16 Jan 2020 10:08:00 -0500
Received: by mail-wr1-f70.google.com with SMTP id z14so9455472wrs.4
        for <alex.bennee@linaro.org>; Thu, 16 Jan 2020 07:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=utdWfp7ymQUKhwO0mN+1Ng1mKtF6uE+xQ50My6J3OQw=;
        b=W0AWWdvhX2ZPF3eFccCeozsPs/br9z8ckP8Bk+rR44GwHjiFT2uT8RK+MpvC5zpNeL
         r5tH8eizLgGBw4GOvwCE6qBTk6hfeNvSE2E8bI/liXit/VNj1dypfeDySITwyorWQwsJ
         I97vDFHldkqUljgkQdF8ppTCSn2vCiB9gVtiv1rITEa67TIU4rZl3Y+xKjKoqXW1iXN8
         YEefLY3kalUl74mVirrNBI/9eer2206WgKFqQZL5jzjqlUa3UYkriQdmLMiCODEB3d6X
         iU5Ueh+ZDETq4q1VEfMpFw+IC5o8NVCNMUgsYOV+xqz200wjRaKyh00yUEJxK6atQh+/
         SAqg==
X-Gm-Message-State: APjAAAXQq/TE+cjg2l5ByGZK4ZQ80yvy8gJSF5szQdGh/V/Bwh72MVvi
	AXwIflmfqbVvCvMvtCTH5/dW9JbOVMkJ7ZhDrSbbH4LPHdzzlVu6MFE+5B5wayA+QyHgcPnrCZJ
	wTVs/+XBAYO7aWstt
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr6801457wmj.90.1579187279243;
        Thu, 16 Jan 2020 07:07:59 -0800 (PST)
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr6801451wmj.90.1579187279117;
        Thu, 16 Jan 2020 07:07:59 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [10.101.1.81] ([176.12.107.132])
        by smtp.gmail.com with ESMTPSA id w8sm369250wmd.2.2020.01.16.07.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2020 07:07:58 -0800 (PST)
Subject: Re: [PATCH v5 02/22] gdbstub: stop passing GDBState * around and use
 global
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8625a1b-3264-b6a6-21bf-82a11d0fdcef@redhat.com>
Date: Thu, 16 Jan 2020 16:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-3-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: DC-RNGOmOqaQt3WmVGWTLg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: BWMl2WJIc5tp

On 1/14/20 4:09 PM, Alex Benn=C3=A9e wrote:
> We only have one GDBState which should be allocated at the time we
> process any commands. This will make further clean-up a bit easier.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> ---
> v3
>    - remove final *s paramters from function calls
> v4
>    - a few fixups for coding style
> ---
>   gdbstub.c | 561 +++++++++++++++++++++++++++---------------------------
>   1 file changed, 278 insertions(+), 283 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
