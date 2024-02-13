Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp133336eje;
        Tue, 13 Feb 2024 05:42:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnnPxDYFmuTWrVPK9QKMLb8Z+YV9QV93gWSe2jz+yXcsQaQrQrnzxAKLsbbnnp+01tSF4c9i4YxmikXnPY2srBb8rsWt4v
X-Google-Smtp-Source: AGHT+IFrokur/MXoc3A5RN1uvUBMe2L6XNHuEH/CrxyTvLZvUMMzMsfQpIsVUvrOXmcQSA1zALWf
X-Received: by 2002:a05:620a:4714:b0:785:d44f:16f3 with SMTP id bs20-20020a05620a471400b00785d44f16f3mr6228527qkb.42.1707831771679;
        Tue, 13 Feb 2024 05:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707831771; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsHwFc2Mb+71Lie7wJ2j7WLZIieuO0gjzB4yFJV2djB6X+6HzdKFJ2bnr4YXW3DXRl
         rFVrxJO2pPq/juJ1ToqXkS6el6hIUdOuqdxIlgPTHeI7yAueWJ31Y70a720lBT6TEwrs
         /uVJmvUD5iDsXP3FgBSVpcwRE6beBb42Ylh1rM/ynkkS1zyVfzuhh4FVfa1yLFMlYdYM
         as4W+nbdQSFnQ0sxRLtkuCjuQ5wTQOg5w1mtFMV9aTuHt9XJ/UvcMOlf6zpk0GCE7L/6
         Hlktve35kcEcTH1U4qI1qI/k7bgQen3G/UiLeRBIh4thKpm2b9a6jiHUNI7PUAlqbEs6
         ex/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=xffuTwsj9hhicMrnU9gj0YroPO7MfvKEOdjjRwyDP/w=;
        fh=F7NBskS9ouNnmbfwrlQRGkpmM7aDMrSYLfl85AeaNng=;
        b=wOHmjIcBjSDcwGak+seAYE8eaPSgw6drMKluEqRa70Q0+xFwqYYpWkP7iXs7AxukXM
         QPi0Kr/LH/qfRq/IcXUaLSCVuu0uvrXOg0tvxmWtBJTLAkeZjunPeO8s+L5Osnh23f7L
         Ies4Ci2kUq8GhcIGaIm74RMEBpB06mIn6iyL9H/QuTKMq+B2aK0POpkf4eLNoIGtPrq7
         sasQoINXpR+4C2FzBb9ZJhb6TtaVjbD8eJOtJWWTyNdrQ8CkTr531pbhWYBF0GgWfjOk
         FtWc+6GqdtwvqnKUV/v2XNKmDefSzwH4vKXiqMMDk9E9vI1fcpFdRtMit8eWoSh4Vsai
         Eogg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwWHiohD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXEJ043XWOTx3EiCsjngLDdNzBkNIHARgBqXKrk/GrNDmYbSSxHVvBX4V+boxfaWf8nI8SNRdde2XZZ7dF7XZMwmcac0F1X
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi39-20020a05620a31a700b00785d664b73dsi5171744qkb.462.2024.02.13.05.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 05:42:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwWHiohD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZt3U-0006FJ-NQ; Tue, 13 Feb 2024 08:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rZt3T-0006Ef-2q
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 08:42:35 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rZt3R-0005jA-DF
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 08:42:34 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d0a4e8444dso49242881fa.2
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707831751; x=1708436551; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xffuTwsj9hhicMrnU9gj0YroPO7MfvKEOdjjRwyDP/w=;
 b=lwWHiohD+wGMawrv2Tt9YCh3v/ru7aLUMzCkbHuT2us/7pSp7pBYBPUyEWvCNp4nDz
 Lt3f6mJAvSsFF0G+6avpW2DMqMLC3M7SRzrm64eFmMmex592AEs6iVLvHuwVOEpSY4m/
 JlqUp6kjcjz6aiVIFJvv1t7V3cdPNmqjIUykjkj12bGncnAPL6pNKFhSp7FbVJVSxeSh
 smizV/Oy5wROcJ7EuEvWFQIPditxTdXHr53cAz5VWx7phmT5qkO1wEoptwlLQPXcvNJ9
 Y1kZq2ZhV8o0vWOp9t5KO1IKP8FYKJpQdEY3Nxw9FdETaZInIAz3IYOboIC4W7I9Brno
 1p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707831751; x=1708436551;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xffuTwsj9hhicMrnU9gj0YroPO7MfvKEOdjjRwyDP/w=;
 b=qfGcQfCfZ3BI38DArErOiNT1+WSQ+5H4z1cD0lawaewIX0Rv0IfEfD9KLimOpoXk6Q
 OeeDHHRw/tdZ694yRX2EhG36WgsBPRcuu8xZbScRyf+IvPtAPDKxOa6iE9NrYbXKXu/8
 jlddMMQP22G1Bz4q8D1FL8Pf4wVmVDuYofzWxcs48QJG8Ff8s54EIT2/VEgdUOUcTsAc
 BT3QwRuIcIfGr5ikW/gmLBb6lBCvMZtvlFu1n8BCph2b8tgzNZ22XcxkYn3Eg3PQR45X
 Q8kd0kgbSa+cB25QdqgDMyGm9kHxIswF8h6Ed4Qq5KvOhH+SwbkIUh6ARb3RsPKQ9BvW
 TzdA==
X-Gm-Message-State: AOJu0YzTtOQfNWe1G2T5fPyeppXqeLWQ3Ir9aoUUJa1g/Yd4ydfFr0wD
 v29bSCFDloDj3TfWVY7tVolLvldIDwZh9YP1yjWux3FyKcV5mqmYKE9GX0+qqPA=
X-Received: by 2002:a2e:a0cb:0:b0:2d0:9210:fd57 with SMTP id
 f11-20020a2ea0cb000000b002d09210fd57mr6193990ljm.18.1707831751027; 
 Tue, 13 Feb 2024 05:42:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOf7FSTcsr+w1UYF4rBo2gZdNch0CX2b2xGJP7zKUE3VO6vJHGZTFmOSURFA0lQDOEcRk39sZFQWhntjvwIzusr325HYvI6zMph/M2k5b0nCU+BvDwmiSJrbeS72vUPw==
Received: from [192.168.1.19] (83.8.197.133.ipv4.supernova.orange.pl.
 [83.8.197.133]) by smtp.gmail.com with ESMTPSA id
 n1-20020a2eb781000000b002d0fba14be8sm506581ljo.83.2024.02.13.05.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 05:42:30 -0800 (PST)
Message-ID: <ede43fd1-9005-4f02-9494-73cfd898e3a0@linaro.org>
Date: Tue, 13 Feb 2024 14:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: heqpM9ueuS2t

W dniu 12.02.2024 o 15:36, Guenter Roeck pisze:

>> The machines I have in mind are:
>>
>> PXA2xx machines:
>>
>> akita                Sharp SL-C1000 (Akita) PDA (PXA270)
>> borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
>> connex               Gumstix Connex (PXA255)
>> mainstone            Mainstone II (PXA27x)
>> spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
>> terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
>> tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
>> verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
>> z2                   Zipit Z2 (PXA27x)
>>
> I test akita, borzoi, spitz, and terrier. Upstream Linux removed support
> for mainstone, tosa, and z2 from the Linux kernel as of version 6.0, so
> I am no longer testing those.

I do wonder are those Zaurus models also boot kernels which QEMU boots. 
Would love to see someone still using those old palmtops. I put my 
Zauruses (collie, poodle, c7x0) into drawer long time ago.

>> OMAP2 machines:
>>
>> n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
>> n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
>>
> I never managed to get those to boot the Linux kernel.

They were working in 2008. I was running Maemo and Poky Linux then. 
Never tried later.

>> The one SA1110 machine:
>>
>> collie               Sharp SL-5500 (Collie) PDA (SA-1110)
>>
> I do test collie.

Can you share kernel/initrd/config? I wanted to boot something at 20th 
anniversary of buying one but was unable to build anything bootable on 
either QEMU/collie or physical one.

