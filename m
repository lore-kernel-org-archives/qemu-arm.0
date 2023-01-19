Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp628239ejc;
        Thu, 19 Jan 2023 13:20:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3IDm4b/sd/SCa/70ck9kTNMUN+QMJnDg36JOrfUSGejRami3Aoqacvgh6Wpgfn39DAnt9
X-Received: by 2002:ac8:4710:0:b0:3a4:f758:fc6d with SMTP id f16-20020ac84710000000b003a4f758fc6dmr19068790qtp.46.1674163222427;
        Thu, 19 Jan 2023 13:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674163222; cv=none;
        d=google.com; s=arc-20160816;
        b=GmSAPKz6yudp7l6wciJEx86jxE7Fez0Gy/0eHSplVP6jBAaiMerU6UqA0vFmgaCiXw
         7XPFG27OSxa0dMAi0flL6uL8l6/gXOuCRS+G7VXnoyi+jJ2q2wn8PfB/+oiGhFKEwi4E
         sCPbwt3QiDppjcYKAkEo0k8eIudvXBPdRPpBQjy4orBX1JZuGrYhXE1QfICSDJ7Z6aub
         uXkNN8HL/zuB3Ktk0t8HO3UB2UKIEm7AKADG1Dv4+UVknGRCuL7S71JW9r2w9XETYD/I
         wst1czGsPlDoD5spbaZnT3jKeCoP6LUnn0valv+ylzBj8YrsxsIgkP2AtDvtMGG+eWdV
         B/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=72zLcV3sK1RlCOCsOdXIc/58H/AkVHfMnNzdXl4YEeU=;
        b=LtNP1GuC75Vjag9qvgA+/XblkSlsynKfsxi0PKpeICBviwnw45at5+nTvlyAAqtPUt
         +KpikBuvhP9BBEm+A/NtQ+Fdin4FuBlY3QTvgb+9JCz4TBafBEAUYg/kM1rZFM7DhzL9
         nuteADY4NVFNrdHApKxOcmNjEyKE3BZBA524xXH7HXVKdPSO7dz7J5uMRfpdlijsZkt7
         X9zvxWc6H/Aq7R945Mo9gsh+VlaOPqTFUBAYvmc0zOFF3MhrWcvEfGJNPNzlGeEyVXeV
         KICC61KSsWqKEB/xLqcxYwNWxlQi6S07yiEsJW9DRUgNvoovg2ew5+ToARVbAXy9qNQj
         VD8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9ssgleX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020ac85287000000b003b63b819a94si6442553qtn.108.2023.01.19.13.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:20:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9ssgleX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIcKW-0000mn-Ju; Thu, 19 Jan 2023 16:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcKQ-0000i8-Ol
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:20:14 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcKD-0006r9-Kg
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:20:10 -0500
Received: by mail-pf1-x431.google.com with SMTP id x4so2535021pfj.1
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=72zLcV3sK1RlCOCsOdXIc/58H/AkVHfMnNzdXl4YEeU=;
 b=V9ssgleXcoeejMPdq1Np/hHKxegHPs15Z0a0nQYDk3RuFypEag/DY2Lfb5tidWoo+I
 Y3xOVBaLwI+3VF8qe6TCTAawB0wbc2+F31SZVR2drOnW7jXqZ7u6GqGNeXet8NRLtgu6
 yAR/2HcNK/57TFc5S+PkeF2z+BV/lSnWFZgqKrAoR5sjA/7IZCHKnubxYrazIsgzuZpc
 gWcKKdpK1DkzBJxJhWcxjeHN1VTNqkEmrRacnWY/OSu+qtnEJAT4xNDHiiUjhfGOUqI/
 jpiGcgguza+0NdpoOvAz3ZOFxMh+6U1Q/7iZobPqkFpaQvFJlfjNoCo3b91lgjgUZWHa
 6oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72zLcV3sK1RlCOCsOdXIc/58H/AkVHfMnNzdXl4YEeU=;
 b=p9rr97cfd9O+QHLFwpoRERZ0uUyuiIa3uY0ZEpm5IlmuVmmaMacpLkBK0uhSdry8lz
 h+OUUHeqWA1bxkS9X6WJuyOiCkVZH4uOElOCqxOzIZT5VhEFuMjsINUFBKDVtlchRz8l
 8Bn8lNnqti8vekgSqt2bui6YwA0xO8SF1Z977bGjsVq1hCNWQ83/3MQkXnd24LQQyA/c
 6mifwzyCm6wcotxU8etEwzUrl7yIcGiwewQuUcUnAJ8aNoGojjRPKE/4UBUycE7/+OVW
 5txCpR42x2X06qfMCbI7OsYa/giSh3YIf9+rYGBovm++8KHnp/KcnT1k5wj2ca+2U4M3
 m9yg==
X-Gm-Message-State: AFqh2kqyZSHouE4Pj0e4bPFiRzale7af7PDM1qaRXgCDM3RDxx1DICiC
 5C/cKwL/RvDS7Zpu7cXo2N1d+Q==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id
 y31-20020a056a00181f00b0058bd244b525mr18742724pfa.17.1674163189382; 
 Thu, 19 Jan 2023 13:19:49 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o22-20020aa79796000000b00581ad007a9fsm998773pfp.153.2023.01.19.13.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:19:48 -0800 (PST)
Message-ID: <c4371f5a-3e2c-c6f3-b370-b34578bcf8d9@linaro.org>
Date: Thu, 19 Jan 2023 11:19:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 11/11] tests/qtest/migration-test: Only use available
 accelerators
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: J6OhA/IB0rk2

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> For example, avoid when TCG is disabled:
> 
>    $ make check-qtest-aarch64
>    ...
>    20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>    qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 
> Reviewed-by: Dr. David Alan Gilbert<dgilbert@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
