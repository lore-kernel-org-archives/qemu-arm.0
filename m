Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp8023lfc;
        Thu, 16 Dec 2021 00:22:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+LAOlgiEFdgo1tw/a+RmfxaTo/QUeSK5+GbgESvGz398lw9wmDvVKwwK2apDeFy8dJvOY
X-Received: by 2002:a25:fc0e:: with SMTP id v14mr12075580ybd.83.1639642949551;
        Thu, 16 Dec 2021 00:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639642949; cv=none;
        d=google.com; s=arc-20160816;
        b=FMcxHoWgQhQGU4r1hNTwvu00DKpA+f5CjvT/jgg1AL+IxGhKaEhxDjHEB2ZWtYzp1x
         XeUdCOPhxbxSoGM3nviQTv6HhSZn01HeltvnOK5nTKWf4KJtD0sVRVUjq3QvpX4xbOmd
         8rjeJ0oWx52m5k9bCzXMGAOX1d754onh4HfBf3SiHzJoT110yC73fAd9URQ9Wz3upafN
         Ykpj/A6X8pWWVb0Ei7MxXwGPwSTXMYzcaE2+lwbe7HPaoWIMM05t3iqzvPBkR+HeTGTH
         +WR+HI+D+gu18I6kE4Ursx9vXDmpgEPXLsIvcZsX+rt2kCeKwbJ6gtrnNpzvaBJ8btmC
         a6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Vd3H6S1aTLN50ghgeY+AqThH60JIHlU7y/p5g+hOCtw=;
        b=PfEMU/Jpdh5VI9yXHikFEV4t2OJfDYUVKEcNa5NhzltTSZybV0w/ibXXHs2x2gd3RK
         EaXsAhgRQtyBR2QT4RsEIa9+AhUr2kh4Q1oLg6ijxFIxl9wUtZOenYV9gduyu7ZEy3GJ
         UsBCiRmabSfZaqQ8Lz5/JBiWQRmR+9hXhZRUodkYby0/HUcExbbbO0Bh4CH1y8o+N7Pc
         rWFZKDSc9XtGbdR1nq6D+CxXCQYgDy2UQ67RHrWO2X9iDiSePipNr7ZIJ1fo48MHrFjE
         x5rTqfz7TmSlFEW6pZ17o5dBor/kANOYFSFlEhKSfm5cyVhnWdq/Toe8v3XPWdpn2Xsk
         mJfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iUpuRpsy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d188si5017411ybc.67.2021.12.16.00.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Dec 2021 00:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iUpuRpsy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxm20-0004UP-UN
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 03:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxm0q-00037Y-RL; Thu, 16 Dec 2021 03:21:16 -0500
Received: from [2a00:1450:4864:20::42c] (port=45652
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxm0m-000571-Cn; Thu, 16 Dec 2021 03:21:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o13so42570736wrs.12;
 Thu, 16 Dec 2021 00:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vd3H6S1aTLN50ghgeY+AqThH60JIHlU7y/p5g+hOCtw=;
 b=iUpuRpsyaR1OVM4WLlZ0BYErCd5GU9G97eDzpl+pSv/sA1nrdYjYEIgEKSdsU9DSVK
 1ODSeucwDIcKnobEyICDEXwuZmv7o0hKPBFMAl4+mJFEFAjlsumAvsM4kbFl7yLdsiB8
 K21B8gwF/zv2XDexeeojMDsjI4NDIHBloij5hA+kLtdpPnqpPveS7GUh+7siF4XTTXbh
 O9VLlnBfFDqCKpug/a8arFPM9zwTDGBPmXVItDjcu5wWUKMMgSS4WgmoDcoSGyEMbg4b
 r2roPedQNan5clQQ5FSfosPjWIYKuZBnEO6uEhcHJTHzuMVmN59evjpWB2d1uCdHGHrT
 O9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vd3H6S1aTLN50ghgeY+AqThH60JIHlU7y/p5g+hOCtw=;
 b=wKtakj5CvUPErjZMtwRg/UsDQVz2WWXb3OY0qQoEzybtKPMqkZm1eHAGO9zmfII9ea
 TkptPtlboVeEt9oaT8oiv0HrkD6yRw11tc6k4EhcsRbYup81FyD+M0zggU1+chAhPqWY
 QophFmom2yrm3x0gDQMg4M6/2S5LrG3Ze1pX3Am7uvFPHTDP837SK8Rld2tdN15Fo4OA
 R5DAH1sH/YTDfk9RqLUiedsY6+BpKG7hcCgx/6NiWwMeTXZqZDarl/daAKDYHGA/lZjO
 /EBNWaktOFNEQFsH7je/X4I+Bhi9wEX4QAkxMwZkl6r4SChJITg5wWbZlU4X4gMRYx9T
 6E9w==
X-Gm-Message-State: AOAM532Fjl8kVgZw1vMQRnoE0Upg+OtmSGwPJ7FSFaZkfIcRmuu+UcDq
 dZN9QgISoqBQjru1pYbjdgU=
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr7830083wrv.102.1639642870715; 
 Thu, 16 Dec 2021 00:21:10 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u14sm4273327wrf.39.2021.12.16.00.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 00:21:10 -0800 (PST)
Message-ID: <dca5a41b-858d-1270-1105-54fcee7fecc8@amsat.org>
Date: Thu, 16 Dec 2021 09:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] hw/arm: Add Cortex-A5 to virt device
Content-Language: en-US
To: Byron Lathi <bslathi19@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, bslathi19@gmail.org
References: <20211216064820.61342-1-bslathi19@gmail.com>
 <20211216064820.61342-3-bslathi19@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211216064820.61342-3-bslathi19@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ikM+XGdG4LHJ

On 12/16/21 07:48, Byron Lathi wrote:
> Add the Cortex-A5 to the list of supported CPUs by the virt platform.
> 
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  hw/arm/virt.c            | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
