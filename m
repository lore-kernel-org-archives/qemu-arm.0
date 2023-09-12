Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2260988ejx;
        Tue, 12 Sep 2023 12:10:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:549d:b0:134:73f6:5832 with SMTP id i29-20020a056a20549d00b0013473f65832mr706212pzk.16.1694545822006;
        Tue, 12 Sep 2023 12:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694545821; cv=none;
        d=google.com; s=arc-20160816;
        b=YlQuj68zwznYPoEi2e1guI9TDAl8w2s+sbFeOq2pCUzaCn7ozPoBvbPCN0S3Af8GNJ
         jM31cjvInZktQ3r1rs4v5YaD1Wx6s7H8vud/YrwjpvORLuvpG83EfsJTanCcZ/c0E14h
         1ChmTMphyhk+1uF5+LAUux+gxBw1VnlfZmCfMXRwmsn3APRHawZ/cFSvoz4IDexKyU/J
         F051G8LFHqpzqYAsCoDg6eY9UTYVUUHnNvQtfB5JB0if1R0Zp+GXtbJldlb27c0aJefJ
         /bnjctzlEYm4Lpt8q3sOQwaKOMNSDDOpmCg9u63Ubie+mXfvr7GBjLW4BwhmbxDLdT80
         K4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J0F7emHqf7jwZ0AzaPOVzUlYIxLK3bJ8bGEf+7nTrOE=;
        fh=s49aLptoFhBCepm6f5Ys4Xo42S1mqXif0aSC9wvaz2E=;
        b=o9zNe1ALzpYcN91DFVxQR1xqDQ+Vr/f2pGXHZ6Q4UEqnz2I/oxEnUQHb8H+M4uthdf
         RLBOkSSxoH2HfLpyRVtESmh44opXDvCUNM+Fbz+9b/UdiPHWlf6BUO6ybEddsyZJkLts
         hdqSARPpwGhziOp54TxSvUCvdLC/ZELV8igFnViCEJfBSzOE+9nNuIGf/0ZcT/CwVuuq
         FZk6NwKvdB3I6FIIUrhtY4gf3wADWDjB056q0tM2OvemEEbglA8FQP7Oeq/ArMI42q2h
         a0wZ1/hltZptqNlP+4QbCoBvEGk/WTa56ygkUx4H/9KFCgjamlrloKOc2qj1SlmrdDGP
         kDYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yg32a2ok;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k19-20020a056a00135300b0068fdeadf45csor1913243pfu.5.2023.09.12.12.10.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Sep 2023 12:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yg32a2ok;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694545821; x=1695150621; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0F7emHqf7jwZ0AzaPOVzUlYIxLK3bJ8bGEf+7nTrOE=;
        b=yg32a2okURSDLwS7j7to6SbizpfsmOUWQ/k6Y21SLxVEwnkTS9ghjNz8ntDGGh87mR
         YOdJ4mL/bvgUCjMAQ+VPBUxEZY5oFHYcePBcxk6ES6x6ef6WdlbHtPcGrLhuvuBwFaDg
         4kjPIFMPLiMpQF5v+3yWd/QrsUCDzIiX017e5y+H57FtNkSUrcd17o7sZ1MAurCm+HUm
         J7ash5cvcvnD7ODvHPv1GQfHCdxe2mQ1r/LnWVFSyy+qLbXfQjsb/zNqfkrodriLoIlb
         HVoRDeygXQGDAIzPHGtldzxWDODIpnolESD20oGWYlbwBMGwdFwwMbwALKkzbOi4fNja
         wy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694545821; x=1695150621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0F7emHqf7jwZ0AzaPOVzUlYIxLK3bJ8bGEf+7nTrOE=;
        b=B5wG5gNgDmuWblDLCaLg0aDJO4E+HUzOQXT9cD6ACs4yLGANbpaEs6Ql1y3gdTjVtE
         P0MdBeF4j3+4iqzpppuDROSJNcEsGBy2siBW1OztQuMQXUjWjunqbkXkyQlx8gq0l+Rs
         KjWlLZI0P1WglgTj1fP0mSI5bW3AW6pElcnNMbyYe3AXzBjOPnffrAZ1CESk0qKfrDck
         lIXe6T9ggMzIvpqwFxj03ioIbinmlMKSsvhEpNrHdki4phoV/PYaz7ASHU0DcOJnmJGG
         YyoKQY5BGmWVOQMSPVqDCSLCR9LUVmpJHtFXE7Tz4bhF5LCYbnAtebF8As8YZzoZGbxc
         G/vQ==
X-Gm-Message-State: AOJu0Yz1S0FMNXqRkNmvsFHN101sthraiefqi9RfE5xoAI97/FKeiegR
	aeQhrJMC7cIK/H/XhVVcKsdcvnY4
X-Google-Smtp-Source: AGHT+IHuAWe+Grn9yxLGFss6l//zQ/MKZXjCs43cx+dg1u2DAsDHtd0TJ2Ag0SUVu79QLT0uafs3JA==
X-Received: by 2002:a05:6a20:1607:b0:133:38cb:2b93 with SMTP id l7-20020a056a20160700b0013338cb2b93mr703439pzj.9.1694545821447;
        Tue, 12 Sep 2023 12:10:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.131.115])
        by smtp.gmail.com with ESMTPSA id g19-20020a62e313000000b0068fe7c4148fsm1710364pfh.57.2023.09.12.12.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 12:10:21 -0700 (PDT)
Message-ID: <61724857-2edd-e19b-aa37-23658cd4119b@linaro.org>
Date: Tue, 12 Sep 2023 12:10:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/4] microbit: add missing qtest_quit() call
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
 <20230912184130.3056054-2-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230912184130.3056054-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UpqiYgtZ4esp

On 9/12/23 11:41, Daniel P. Berrangé wrote:
> Without this call, the QEMU process is being left running which on
> FreeBSD 13.2 at least, makes meson think the test is still running,
> and thus execution of "make check" continues forever.
> 
> This fixes the regression introduced in:
> 
>    commit a9c9bbee855877293683012942d3485d50f286af
>    Author: Chris Laplante<chris@laplante.io>
>    Date:   Tue Aug 22 17:31:02 2023 +0100
> 
>      qtest: microbit-test: add tests for nRF51 DETECT
> 
> Fixes:https://gitlab.com/qemu-project/qemu/-/issues/1882
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/qtest/microbit-test.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

But I think that it's unfortunate that we have to remember this for each test.


r~
