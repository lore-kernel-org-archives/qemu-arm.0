Received: by 10.25.44.15 with SMTP id s15csp3831877lfs;
        Mon, 10 Jul 2017 12:43:07 -0700 (PDT)
X-Received: by 10.55.60.13 with SMTP id j13mr6549785qka.71.1499715787560;
        Mon, 10 Jul 2017 12:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499715787; cv=none;
        d=google.com; s=arc-20160816;
        b=K2Ru2wHb6JI8HTx4ooD9KvLBVK7ZLJdACblri+XCoceGzpl31NQnN+TQB9fDuWP90F
         EGXeFZ0G6ovnKSkOiIw/DU+r0wCD+BJUP5FQbCG7VO9g/gTkZDoCzGIcVODoRV4P11qY
         0axkAoL6XhWk6/zxpgiVs/3gJ3MVO7jBe5l4Gk2qHbZaASPNPV8IAa0YPaVO4pZCftnE
         CbTSQs6FiOE42+lEmhzqPrj7f1MJPh1DFsMadY3zHpev+cs8zhNuLzyI0kjGW+MJihqh
         0psGKItEZCIhhlUF9+PNIHGQ9RVurFrzpKJV+F36ga+xoZYd/0m/Jvht5OqfuYJx9yjc
         0WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=J9DALqAqLARxqOPOmvkJNbBG7fOZ7pp0nnKC9l1rxYA=;
        b=dNM77y8orlmlpAMI7NTLjYDXkGivaUbCIKvPzEqA57xXctDJnavThnuw1JekerrHSm
         cRrguuHsI12Vg0bZO/ztPb4KQolOTZx+m9ZvPnwhY+QNG/pB1FFcvC25YH8XgO6U2Tmu
         KTEo72cf6Jg1SBT9YdurEVJ3WIzfRtwaW4IawvuBsrNQfMexfSuJI/S4RmgvKHa91K6P
         mtBXB/I+uJ2BCljt/NHqXTDBx1xqKhIHAv0qk15mC3QuEi6/8nvGrRsRLP0JF9f5rPAd
         A8aUU/nK/8zIwQW9NGJEaXnXfYkJQp2gUhvYgQin1JnC2s/4Qk4p1EAUpFaxSVVsYSHa
         Duog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=S4xGX5Ce;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com. [2607:f8b0:400d:c09::22c])
        by mx.google.com with ESMTPS id l64si12112676qkl.189.2017.07.10.12.43.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) client-ip=2607:f8b0:400d:c09::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=S4xGX5Ce;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x22c.google.com with SMTP id v143so83073035qkb.0;
        Mon, 10 Jul 2017 12:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J9DALqAqLARxqOPOmvkJNbBG7fOZ7pp0nnKC9l1rxYA=;
        b=S4xGX5Ce6H6wvlnmPIZXPdtkdyEUMt2TBWYK6KRj5yfAPRYRCPHpRWTxGax5isCkKm
         iK6B27TQUHcm7uN/kSM7u+q2v0/5bDGApu0RAx2EdLTts1VArz+d3I/GlZ+fLg8ypRJc
         CKXSWrWFtrpgoyJSKyVGBSLCFL8d3TIwaC7WUDhfa//CDBWCX9Z4h8TdxpskGchdiz8Y
         SsXeXAg0amcm/A2T2XDXPoQDT6YpM+QyGjOpJcUA+DyLKEgiLfi+puhGKDAsTIYZ2Gsm
         2uBpJyV/2N3vt7Z3dWaTO541KUcB34DdH5jyFlupEdbFI16UbY2cUx275sqq3p6/3T3a
         Et/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J9DALqAqLARxqOPOmvkJNbBG7fOZ7pp0nnKC9l1rxYA=;
        b=fb5P4fJSnici+WLQBgSZEkqax4DI3cHnXC460oYY7nj3oAohk3kw70nciAp9hPInKn
         4I+0yf7LbcZU4TEg7Ww/VpOJNhrhHqK6aDu7ofpTbtGSLWNOivF+aYzGXY3WE+zbAlSP
         Faa68sDeU23n8HMJf1u0b85EVYdiDafbvnbJTNI96WsRIuMHnwVvY3O61EyexOOHWSwR
         lDc/s2/x2l0Jc4iy0t03m6CAflU9ghKKtlxpr/ani8M2eftrTM+W3G7zIhrXcSQnupID
         oBM3ktGtUdnUp4e5ClEbLFhtHxA/A5KkA/uYNqYrwpFGY98lbNCS+Gz/CLIq8Hci76JL
         2sAA==
X-Gm-Message-State: AIVw110yeC9Ynwj7/E/JMj1VN1XpGYwGc2RYrWLLlUPYGHU6onsaz2Qu
	PaR7m6tKNP0u49gdXuQ=
X-Received: by 10.55.139.68 with SMTP id n65mr6378139qkd.172.1499715787214;
        Mon, 10 Jul 2017 12:43:07 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id a123sm2552485qkc.0.2017.07.10.12.43.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:43:06 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 4/5] target/arm: use DISAS_JUMP for ISB handling
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, cota@braap.org
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
 <20170710192128.9048-5-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e21159d2-42aa-1b08-5ea9-2f367a8e452f@twiddle.net>
Date: Mon, 10 Jul 2017 09:43:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170710192128.9048-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Iikte7EIZ3vM

On 07/10/2017 09:21 AM, Alex Bennée wrote:
> -        s->is_jmp = DISAS_UPDATE;
> +        gen_a64_set_pc_im(s->pc);
> +        s->is_jmp = DISAS_JUMP;

Better would be gen_goto_tb.  The destination is known, so there's no need to 
go through lookup_and_goto_ptr.  You still get the icount_decr check at the 
start of the linked TB, which is what you're looking for.

Interesting that a64's gen_goto_tb sets is_jmp, but a32 does not...


r~
