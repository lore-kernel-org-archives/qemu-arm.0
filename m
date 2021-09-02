Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1451691lfb;
        Fri, 3 Sep 2021 09:27:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy90sYZdiuZS5Vpl01ZMhsSqe6fp93xIob5bI2KqMmZpwZdExwHUN3Bfgl+sNgAGoxl4DRB
X-Received: by 2002:a5d:8458:: with SMTP id w24mr3617575ior.168.1630686458528;
        Fri, 03 Sep 2021 09:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630686458; cv=none;
        d=google.com; s=arc-20160816;
        b=GmI8ihrht/LhaQVp+Sihpo3H0bKHZrN19t5cpeUaxY0VlTMp7xRojkwxxE9ywRiIqR
         dSOvM5h7cS9ugwc1WfKwD4tAJ9eDlVgUCPWI403X2ZH5yJCws+Y9HN3disxGCRUr2N0m
         J/i9toVJHmnos0WLJkN23l9b6djGPTWDtWyicZlpYeHZIUkqkVb9hgEpnOX8jrfmgrd4
         5Smj8HoOKxJv59c7Gjny5l0DYJa54C61sWoHaWQ2A1uF4Mz4Uv4/a/AjtUr8zwBtIVb+
         4eqejjBY7d6jCKk7jQBSDLdeMfuDSGni5bzO8/RYBwpDwZ8caIhil38yBDcDGH4jPFvd
         HLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xbF6RpD9Jef5bcQtzhPmcAPpIO9sDkBA3EFd3DffmBU=;
        b=0ERDpzbfZt1m5Al1RPVfpzDkFBXfzOQlvDoC9nnuVQw3J76/L/O1cPtsurH3gpiu97
         6XqG2K+dmPdsSeOlnZ9MsLjXKjNzDUnrCysHEBRoTA63jfZcQ/3YA9avzpyshm2Jd9B/
         rZPi7ACEvckwGSS3Z22uiBDFMjSgaD1PkxzDF5xy6Hh9SZ5uQNQ3xTwO1Nwx7pIMKYZH
         929mjBrIAsVqegtlsJApTRzD0L16qbN0Cbysn8QNympF5TyGwf5g+wBOYZIVmcGlsFrt
         XZWv9bHFEpbuytWXflaO7l04sezTGzTJPzoxh+KVkMsN+3Uo+a6KVOrXq3HeigZlgZkD
         RArQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=G7eWQEqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si5781813ila.10.2021.09.03.09.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 09:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=G7eWQEqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMC2S-0007IO-TT
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 12:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMC29-0007Gz-Ok; Fri, 03 Sep 2021 12:27:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMC28-0001QW-7p; Fri, 03 Sep 2021 12:27:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z4so8991204wrr.6;
 Fri, 03 Sep 2021 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xbF6RpD9Jef5bcQtzhPmcAPpIO9sDkBA3EFd3DffmBU=;
 b=G7eWQEqku73Bzvw8R0KK1QnreGLb/vpi1xws+D9vGi7eUiGGeIYJlJiIdMOO3gcch/
 WoMYJ06eKAascVnrhU82JltFc3Ys9d6YKkde3j+Yi2rtgtxjIX7FppQnmBLcYuHMMG62
 vajShNiF5HIynf9IKRclfF4UJWsR9HwDLz9qP44denc4nTdnpviG6cPVoVWkxg8UKZDX
 zDM0E0hC2ge+DwpFqjeCv5Gka+qTLU3Y8dzUYRfKFY2UV5wWJr9oGbKxSeUtc1Wb7nBd
 qtII7gdxqLxVKJqsSTcwOyJDSyH1zFnSB3/7FC+ihzosit4gzTSLZRebz7DPSmmfCxjf
 isNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xbF6RpD9Jef5bcQtzhPmcAPpIO9sDkBA3EFd3DffmBU=;
 b=px38O3/19rbRtKQsx5kxmRNS76AE0lVoFYtnc3IzqPLt6UseFH8iNMR3w5SV4RC2zQ
 7q7VCCmoZ437BwJ/C5abDZQJ4XdfCs2cN1GwLc4i34TnttELsNXXUA7Vft2Vx7msFGZ+
 nkTmw2ywTt/zr5bLekjJeY2QroZgt6qfSjjV1zDIcyNVkuqIx7m8rtfSNBXzZVKS9ZJg
 Y4dGw+EEREBpmB7tXdrn/ZyeP2zjQy3t7siV1qZcu2azH5ZDQoB342DKct1pIW7RzRoo
 Mfd66rpjI3OKL0g9nM94zJErTIsWwJnDqSt8vVFovkT0TJciJ7BrHjdH8h74gpZo1koD
 j1aQ==
X-Gm-Message-State: AOAM53115DAzI2oubM0e8YAm5qHkCyiaGpAjksMieuczomS/EVT+51XY
 2U2U7iOnht4hbbTONUx1JDSepIHLE88=
X-Received: by 2002:a5d:554e:: with SMTP id g14mr5218336wrw.48.1630686433223; 
 Fri, 03 Sep 2021 09:27:13 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm4280144wmq.36.2021.09.03.09.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 09:27:12 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Optimize MVE logic ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0501929b-43f0-d29f-ae7e-59bbe2b9f2cd@amsat.org>
Date: Thu, 2 Sep 2021 18:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qEjWagCmtn/z

On 9/2/21 5:09 PM, Peter Maydell wrote:
> When not predicating, implement the MVE bitwise logical insns
> directly using TCG vector operations.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-mve.c | 41 ++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
