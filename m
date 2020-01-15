Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7473726lff;
        Wed, 15 Jan 2020 13:28:20 -0800 (PST)
X-Received: by 2002:a17:90a:30a4:: with SMTP id h33mr2401994pjb.50.1579123700729;
        Wed, 15 Jan 2020 13:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579123700; cv=none;
        d=google.com; s=arc-20160816;
        b=fp3yk2w1YP3q6tHNeKPQwkplNkansAlX7QX3f7dUypnlWbNdcARDlP5nT5CvMGxn46
         Pmru4fmWfxzYZgcgSN8Is3n6tLiZI0EupzAmTSvm5ARSq1mBuvkUbUPs+OmOsTDVmwfh
         PbUfD9hbMqCYLUtU0trs2olgaNPbXt61t4HViJA8rZMmVnmbXTcSSJITKSjMTKvi+H3p
         kGg22BBN1pLBaAiwARH02bpPcIMxuqQhvx9Cj1W9Bep70O5dSZZC91vCUgGicK2DYmzZ
         rWy3n3Wc7EFeKyIudK077sJxXusgEqsu5l+Nc93+mEt4Cb0KZ6rOa4Z1GuGnkUoOAvP5
         6RNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=GjlaLraBKsptUGCtLv6cppvVT81pJhdKQc7NnUI8J5U=;
        b=pDw5AO4qEstUQVh0Rd+M7OhJKVStiMZmFwaZyVop4y/4kwzLV0X1WVY2tm9GDlKN5b
         0d7ako5zBPn219g/pdrYeEh21nHDk6CRhLwXNbFg3hfWrEx+vJs5Q57kDgav9g/FLZ2G
         bM3Nsn2hQzjk2ipmJfgHpSDCHwIdmb5XvrPmdm9elEnWcyS6yUmQoRGKKno51JG1sL91
         zmKLwrPx5GQF6aDleq0Gg0WOWdFKvRyhKANY4KLf6/yjTm/znEhIxndGGgWFwWtn8TI1
         TQRNJVAyg7F6HStPOQTwh9j1XdmXlj+v90D9XBbGN51z6CzWWAaNCnRtEi9rB/mSHvTz
         QkWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgW4x10a;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l14sor21875658pgm.16.2020.01.15.13.28.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 13:28:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgW4x10a;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GjlaLraBKsptUGCtLv6cppvVT81pJhdKQc7NnUI8J5U=;
        b=RgW4x10a8OB0jZ4sxX600KFHr8Ds2KuihfKHpPVpDEX2LGqMRONKwNEntfKZ+VaHGd
         9FUQ3FQZD6uTlNd5i3VMH0+pc58GYCT9Y0eRMUcL2TIienFAYwEihViT8xUt06pDQjlM
         a4KST5d9VLGH25rqmTXB58DxJIfy/w0Y7bReVNMiVduYlZ7Yjphk9arkN2bG7TsIw6xv
         UF/7oMajR/J17rnv4H11HrhUcTfGZuE43d+JgEQo4Ez9kki6+qFiXHPOXJBSFgbVNrwH
         XbJJgULslw2AWfodZdLXuVeGkDEifd1TBXhjxzHVf3U9BJMVrFEJtvWTH6cfDL8nxOOP
         Kmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GjlaLraBKsptUGCtLv6cppvVT81pJhdKQc7NnUI8J5U=;
        b=ACOwfo9jZDO7XIwhkoGraH2TBlpSlPNZ2d6WNuxk12G+85N5U2+sDK4HD+Iu8FA/NX
         ytJqV1ZuBiWbcejVngj37rz3Q+4MAE/vbjzAiKFAlqt1f5iqAD4ckOfE1zQeZyPAWSel
         pejatYXsrT7p8Ca1fqdIvnfbzsmdnLlHTDp2SFPUYjr1YgWLwZ085hoAZf+jupC+FWnE
         QJXUVVGnRF9S2gxR+WxlGQkvqWHFfoTVphL6OSxepJ7xpZU9Eg3M0QcKk+Vff7eo5FLi
         MtfVdEcj2MQY/X1cRlXGp0m4L58lPUIZvut4RlXVZdVWHFBHX/bsCp17WFSHJJcSsC8q
         /l8w==
X-Gm-Message-State: APjAAAXzaWwu53jkIR51K807mYJzvbIm2Mynj16DTYA0SAFM42H/QxmM
	ZOSJdE8b7MTXzptrMPS6/j8DptxDmQ1/uQ==
X-Google-Smtp-Source: APXvYqykKFIci5e1pFUm9V0MfNzpNC8l0HY+e7b2U4fuCJoqtBReNv1b5wQr94qkKcdm31R5kJTacA==
X-Received: by 2002:a63:2a49:: with SMTP id q70mr34564054pgq.265.1579123700176;
        Wed, 15 Jan 2020 13:28:20 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id s7sm746379pjk.22.2020.01.15.13.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 13:28:19 -0800 (PST)
Subject: Re: Semihosting, arm, riscv, ppc and common code
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Liviu Ionescu <ilg@livius.net>, keithp@keithp.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
 <87sgkimkma.fsf@linaro.org>
 <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
 <87wo9tkjxz.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81f25a9e-a52c-ca8d-4d4b-ca36fcee73ed@linaro.org>
Date: Wed, 15 Jan 2020 11:28:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87wo9tkjxz.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uIfqAxLrf302

On 1/15/20 2:01 AM, Alex Bennée wrote:
> Hmm, I'm not so sure. QEMU tries to emulate real HW although I
> appreciate that is a somewhat loose definition once you get to things
> like -M virt and other such SW like abstractions. Is semihosting even
> going to be a thing on real RiscV/Power silicon?

For risc-v, the odd nop-full semi-hosting call sequence was chosen to work with
jtag debuggers on real silicon.

As for the rest of the abi, the stuff after the debugger/emulator has gotten
control, they did have the opportunity to do better, and did not.


r~
