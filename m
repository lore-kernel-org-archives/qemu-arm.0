Received: by 10.25.44.15 with SMTP id s15csp3821801lfs;
        Mon, 10 Jul 2017 12:32:43 -0700 (PDT)
X-Received: by 10.237.63.119 with SMTP id q52mr6667035qtf.49.1499715163048;
        Mon, 10 Jul 2017 12:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499715163; cv=none;
        d=google.com; s=arc-20160816;
        b=Wpz3sPQtLJ+dFqkyoVIqiXD5+sXGVJYyFAW+OTk55rFYI303N871/QSkYSYXQQSQ9R
         Bs9+ax2GB+yjWdysRfCs2fxxpadhcbuU7RSPQHc4egv03B4ZFvLrh2u+u0/0GMZnDbON
         1t50vtmRdUsV8A/h//xilPMCFbPYBF5PICH3qNDtomgSsvGcTuBBjGHsIH+slQD7i2sO
         If4IVoBeLHOz1jWVxpB1lxFAIv5aV75W/ddJjnaMPzAKNX8d5Mhqic3pgrw9IbjXb2VR
         Xi93pDRoDjFJfPOVUh44NeeZo0A52Ei44VFZfbT7qEDVogcc5kWBl37yDpm+WlH799wp
         MkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=XjOpAe/CCNrpSrmcv+qW/vT2pmYEWYqFHa5DkxV9EdQ=;
        b=DQKtlgNy9LUjDrvP3sR8aar8KWo5Jh1R8ahbW++H4x49EmtiFe7tU3HYjr17aBaw9d
         wKnnR3/RmHis3sDI1fuEpck21+t2G7jcK9lm/L9c4LfiCgZtpoFWeu05fRihmXFvgtF5
         1VKxH5ARd/ZPEL6qYlB6zH1bBH+Z8bVbLPLgZ78kI7YjNEcObGRS8ZvOvkA+vVF1Ho2m
         ia+KPapiyd6RfRuAnkM/K/ZZZ5nhYnck6/qotDPpDJFwHnR2Bl39vKgwaRA7Zrsy4W/P
         BzGWWICgppyf2WQP77c32wDhAD9pDfGwaaYlTwwefs/IkWWP1VTyO7zajpUr+IWEjpuM
         ma3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Tz1VF9Mw;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id b11si11669340qte.178.2017.07.10.12.32.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Tz1VF9Mw;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id 16so14151262qkg.2;
        Mon, 10 Jul 2017 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XjOpAe/CCNrpSrmcv+qW/vT2pmYEWYqFHa5DkxV9EdQ=;
        b=Tz1VF9MwPdflLm/ft0RE0ky8qM/Py1elSV8thwAV/CDx8e7fwoBA5HGP8SW85saUZ2
         tQw+DD2hpS9hxBm0mMVp4jwsBoyH7hESs5hAu4zV21c/+uyS2B3EsuZFyYrFX+pW5zIi
         9dHKZgOOC5hNYhe9GpkmV8X2K4aW1KNMyJhjdKme2iy2xC9lmMeh5u4XhPhwwBPgIxkT
         dHYKpouoNaXgzZbPKAstOk3H2zZwLUqVUydlmhhr8r+Bd7+gd5HmQz3kgb93KPcpucIQ
         sK+6onhhnvV0u2qQA86BMmlKBzgbJyP4OYnHb8gStHqqSIxbRx4WXT1pgszlJJhk8a6f
         rYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XjOpAe/CCNrpSrmcv+qW/vT2pmYEWYqFHa5DkxV9EdQ=;
        b=CQdpe1BWDxPp7SI/FVPCO4tqsUc8+YrANpOrXyTL/coat5h9+xoQgJLhlfe4kFwUE/
         BVLHKEeIdWyLMLHi/8sEX8mEL9NQWG2k7UdCukHFZXqdF2HzRyqtNFLxD1ElU3Od7Er8
         Hw1qHCIOtLTv/QN8ScUWBRGxWJJVm7D+4CHdCD80IPLY1qulUhx7NjiUjTsH26rmdohy
         jQQza13viBiOiK5OaNd5YjUP4Qs6oZDRcMyUzlAf22X6GZEzUuzHBvhimCCGevoX2kaN
         wNylGjaxZ8125bTcWIPGpRtxr38SL6DFjfNvZI0SoKV9tEZvBTRMz5TdZLr0tN6wEv4Y
         QALA==
X-Gm-Message-State: AIVw111nzeD6uRh3PW/xMrBhhv8brWYILhBPu+xl0X+eYnLC7M6hDdAR
	8w9zNKHpsOSVHnXjUZM=
X-Received: by 10.55.43.144 with SMTP id r16mr6440597qkr.59.1499715162658;
        Mon, 10 Jul 2017 12:32:42 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id b13sm9911229qta.25.2017.07.10.12.32.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:32:42 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 2/5] target/arm/translate: make DISAS_UPDATE match
 declared semantics
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, cota@braap.org
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
 <20170710192128.9048-3-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9cb61dcf-d7b9-9b64-7f94-9e85a87c433d@twiddle.net>
Date: Mon, 10 Jul 2017 09:32:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170710192128.9048-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Wt5Sl0ACzd1t

On 07/10/2017 09:21 AM, Alex Bennée wrote:
> -        case DISAS_UPDATE:
> -            gen_set_pc_im(dc, dc->pc);
> -            /* fall through */
>           case DISAS_JUMP:
>               gen_goto_ptr();
>               break;
> +        case DISAS_UPDATE:
> +            gen_set_pc_im(dc, dc->pc);
>           default:

Modulo missing fallthru markup,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
