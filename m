Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp606918lff;
        Wed, 16 Jun 2021 11:42:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxifKiDztkOEHjjRw7SjeAAnd0LCXJoPtxkIIXGou+E59VSQJg8r5Z6mteFR6JimTYCaCQ
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr466057wmj.66.1623868979779;
        Wed, 16 Jun 2021 11:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623868979; cv=none;
        d=google.com; s=arc-20160816;
        b=TnvjIWKTpwUgDbfOcfaqPm3eeGA+DrxhzF5z/AHGcJg4np4TVadOqFTS1mV/abbcOH
         3/9qKsk6KhL3PpT3vr5z6uZ67joaYoTATh1nYtK/OuJ1+OWuOYPfWh68K2w8yV9ilfD3
         tHy+RCJBLVrtSScoVmW5yywXY7h1mbnDRu7lIhImT82adwEa0kL4sWeLvmJZjGy4j4M+
         7cr6beg55Op2tI+4nctPm5EFVVU8Buszpn1CX0OJLVxtEcHnMUZvQM+7RdzLnlyUplZp
         u0Mf8I7Go5gp9/I4MRNZPKz7f8d0gDLS4PYMMqwxCHbV2t51p2gcvD//nJV5juN8w9vp
         /NRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fWkoyrK4CXu0aepe8nYrhP8lrISgrviKpdrNqt4ahLs=;
        b=Q47xLefb6yHEXRRS9Jd30qeT2YmN2Eyd0zsu++6C0z+crbi9dU7FHolf6sMcoM82Xd
         7GsAqLKY6fRS9T6ifrrxDptWSJuCMI0gaZodm8pA2B/A36f2knNnt3RhGTm1CUa2WAAW
         yH4ggx8zXygNkQtd4GlpBe/PRQA6KDdXn81zoWKMWTAiktAWVAqqIqLx1rO/6up2TTmw
         L887aXQLdLuQXPi9fdNBDUFZSnZ0JUYWFZBsUUo5wuhxkDlhrddt3vJDwJLLtsb3z0Pc
         WIcq5rPX7Lni1AAfeNpxE+Dngb8bl10ombaI8SaPavVW6eW7sTvDEEbvD5GnKKs7PFHq
         i+VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQX0wq6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si3201803wrv.572.2021.06.16.11.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQX0wq6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaV8-0005uG-VN
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTq-0002mz-4Y
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:41:38 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTn-0003WH-6z
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:41:37 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so210387pjo.3
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fWkoyrK4CXu0aepe8nYrhP8lrISgrviKpdrNqt4ahLs=;
 b=yQX0wq6VuRtyvApcGv52l6HsMqucpUCO3vTUofowaF8tcq3JBNt+wCDxtk+q8YdMmM
 g22fukt/sko8LIrwjlw5/12RDrSUKrTxFI/eUalmXBiUzeEsua5J5dUIAMUneCOiR9Dh
 ucPV+jMOrnW2REk33Q7NrCDXxDGxzynlZHeph1gb3d1x2YL1HjgE7eNbl10jO14Ac7s4
 Okxrjs6AxXee/frz5Ip3nGRzq+wc7atZRQTpUqqVJDQV/YPuwzXXAo8hjrhewroojKkp
 8gyKwS8e/JFnYR1umx9Z/GtMCm3Visl70f9hvbUScSNktCY31ch60X72NFWu2ieUYHDi
 f8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fWkoyrK4CXu0aepe8nYrhP8lrISgrviKpdrNqt4ahLs=;
 b=a3PZgvCaMT81UYaRWmQAFuA5BY/1Nz3tV5opKM6XwSiCdZlVIHvNSM/lc7PZMYQB17
 NgGYTrkfP6Cnskovpt/m5oQfnwU0klrMGjIXrICoJN6bKIWVVAFNICwN2Jl1B0vJhOuU
 QSF2np2lMiay5pNcujOS1yE6hhxwG9fxO62ZZ99EG1iBXuNVp/eM7mpzVzV5W0Av5hUJ
 DIb0NNjzksmGJhNj5+LYI1wfxkHtIoYX8zJheSf3AQPFYKd/pLJj5SJCDTCnMTw+SHoG
 th1Evb+Hts165/StbkgrNV17KfmT/mZGvp0s6coVMkJAmScPgyN9LNa8D6FUkp2pts7V
 3eDg==
X-Gm-Message-State: AOAM531PNJpv7RNxgRRcgKKY2AfHEqI4cEHRx1Q4O3WDDW6TAY1Xo1rd
 OTGyne0abbRLEkUM++f2fRzC+Q==
X-Received: by 2002:a17:90b:f84:: with SMTP id
 ft4mr12630257pjb.104.1623868893767; 
 Wed, 16 Jun 2021 11:41:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c207sm2788547pfb.86.2021.06.16.11.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:41:33 -0700 (PDT)
Subject: Re: [PATCH v3 07/13] hw/misc/auxbus: Fix MOT/classic I2C mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdae4eb4-d6b0-0d09-a0c2-08875952601c@linaro.org>
Date: Wed, 16 Jun 2021 11:41:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Doe51UGdllo

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Since its introduction in commit 6fc7f77fd2 i2c_start_transfer()
> uses incorrectly the direction of the transfer (the last argument
> is called 'is_recv'). Fix by inverting the argument, we now have
> is_recv = !is_write.
> 
> Fixes: 6fc7f77fd2 ("introduce aux-bus")
> Reported-by: BALATON Zoltan<balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/misc/auxbus.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
