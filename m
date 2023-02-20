Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2528224ejb;
        Mon, 20 Feb 2023 10:50:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9W4vy5N/stiL0l4bPD9Z7L/d1d7THpmSOLV/i7Q/I1fY3RbOm5Yr9DBLwz+1bRsJtH4LOg
X-Received: by 2002:a05:622a:12:b0:3b9:2b0:5e7f with SMTP id x18-20020a05622a001200b003b902b05e7fmr19373184qtw.32.1676919018541;
        Mon, 20 Feb 2023 10:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676919018; cv=none;
        d=google.com; s=arc-20160816;
        b=bfHXcBrs1xY30wp2wyl1Bu0/faIzJmfGBLOeEbzBsf/ZtOyKDNSSYlIxHwemkltJKS
         oV+tU+4G1jymzJsfVMDPZmnMVwAE92aYOWPfLrwGJolYJVSb1O+wclcGvxS3n+LaMM+P
         zVPwpwYlWY78YRORU5dA1xkPP4pYszkEaZVADXW3VJvLcNYPGYrjqSiHrO0reqnPutNg
         XkqWqKmiKbN2fcMHcY7eP376KZN1zH+RKYZOU8FUdQPhrnP3Ke512vwO06n14mlR8EID
         mo6cEJklJeobtzKDftwlsld3Vbw3df3jaZZuv6cnb0GtLVP13GzQDy6JvIruvdlAhzWU
         S5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MyqN/991YvXvjBMmxSpqD+Zg/swWdcPq/AR4aAx3GgA=;
        b=FtzxwLsvbbaX9XZUKw4Zvatxw7J9prDiNnmcII+QFMQywfRE8DKRZsPIxEaeP7JgPp
         s7zAZH2KG+pU/QFjzsQ5/GnBwuh9S10o7FEzrQ0jK5I+neuBWR5+jZFmaItGXNygiwXX
         sfTEcntIPkmP5kQZfbxqynVPtuxpjUrAJRQFO9MkK9AA4HP5bcGX4VXovtLHYYhkYkS9
         4RxSQz7Wpd0nZTATnHCyq1EO3D11+hnwFuoR/OnDzUMmwnfbqa2r0y+/mUB/6fEd11Pl
         1dfBtAQrTDBb3UQSOqi7cbPI0lsQT1ir8AF9HAq3jLySeAzpsSDaKYmgKh1uwEv+oL8U
         WpBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qn/E9e1N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22-20020a05622a119600b003a6a81a8830si9929843qtk.111.2023.02.20.10.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 10:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qn/E9e1N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUBEj-0004j2-0p; Mon, 20 Feb 2023 13:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBED-0004LI-SE
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:49:44 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBEC-0005rI-10
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:49:33 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2203647pjj.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 10:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MyqN/991YvXvjBMmxSpqD+Zg/swWdcPq/AR4aAx3GgA=;
 b=Qn/E9e1N8LjqAZLWziM7+N2oe/tCL7fCffEu5sUQPp0McVG1HHCDQu1kEHiBLkcUiq
 KH+X559lp4thEX4mCc6HcLjMgdDqP9+JrZy0uWhHEewnBisk4cUKNLTRApXKUlKP5Ff5
 gJ+hYMZ7b5A0QIDslhq0iODrbvXeRKp0wV9p979jYSJ6V6aLXIMYJhyKMlLBzSMrtYan
 5RcODmc9fZAYwsBHBXX85z1jlnxybDgL6Q4aRQqdHD63zSceF7XJVM6fBgctd3xOmlJD
 9kOtbZHv/6lmbCK50ZpiRBcQ61OmzRQvhlEpOte7g2Xn7oA2Q05MfZN0HUgF6ivs8W43
 guLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MyqN/991YvXvjBMmxSpqD+Zg/swWdcPq/AR4aAx3GgA=;
 b=CrnSGOZ8CfGX+8/6GA6GO8hwq7QLaYY8y/hCxyEul6Ap/cTSVrtnZlE4aROUVkwvrc
 Kw1FoRJ6FPuNishfkQKbWCwwuhsI4norQrW9TsGONbnkVFCVNXV+BmK88qAF7CY6LMXb
 LwPNsRn1d/cFsk5JYUHw0FFf/jwFnCBdNMjqbQUAKyw9piqLPgGWDOfqRajUUwXFt8Kd
 Kupf42mMyrK8cWIF2g42BN3H0sbq8nItg7lFfrrWOUQzzXkStWjzmJieCyvm0Hi+ZgqT
 rArrye2Aywr2x/Z3hkBsCbjEvUTL6hnizcS6L+Oo5eITs0BiWqkX4P1wTLZI3eeXT6P4
 C3/w==
X-Gm-Message-State: AO0yUKUKpVrMGUvR2kJrXI18I274GD/aTCyZ1x/FNTv3SGppi+edJ2mk
 26PgyRyzFcPq4h1fLuCDsigUoA==
X-Received: by 2002:a05:6a20:54a4:b0:c7:8644:a9ff with SMTP id
 i36-20020a056a2054a400b000c78644a9ffmr3232203pzk.57.1676918970321; 
 Mon, 20 Feb 2023 10:49:30 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a10-20020a65654a000000b005022111ab31sm953422pgw.71.2023.02.20.10.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:49:29 -0800 (PST)
Message-ID: <5565c71f-b573-6b03-f4bd-f8c35230be86@linaro.org>
Date: Mon, 20 Feb 2023 08:49:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/8] hw/gpio/max7310: Simplify max7310_realize()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bWJnaUAj4AS2

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> Since &I2C_SLAVE(dev)->qdev == dev, no need to go back and
> forth with QOM type casting. Directly use 'dev'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/gpio/max7310.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
