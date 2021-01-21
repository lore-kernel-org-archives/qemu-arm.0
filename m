Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp251776lfb;
        Thu, 21 Jan 2021 13:24:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0EgUYjwzaqeKRUFA9QyjYYR8H45qirWudMKtMY6Bzd7ONB+5eLD9UuOpidAfI/+d/HHZL
X-Received: by 2002:a25:5015:: with SMTP id e21mr1970776ybb.71.1611264281872;
        Thu, 21 Jan 2021 13:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611264281; cv=none;
        d=google.com; s=arc-20160816;
        b=xWNDWudmP/vX2YA4k34fIPjqsKvs2igc6rS0htLFJWkAGwHEqhR4WnkEdgGXWNdr7d
         lVpSGfEKUD6jdgyWIijAUHysDtTkpLcRGc57CNHnsJbCSnMFidqIEMzSGmQMK9DIIb7v
         xLwYqKGXnaBN4pWxDH7ZO9vyLeA0aN2MOFfSZesKjs+ErD5irCpDqgYMvNxywXUHmGr4
         tN7OAhJyWrt8jAr8TxO5SrM5uHyC6uEahj3lqISuPMMnx6nK/Hm/tZFk8CjKg6FXFVCp
         DJa9J6hFOeFUagwk8RQhsDEiV7PnJ4R8m0ewpSMRh5nPQ4EAI6NEi4io5rMy3ket+yzt
         JzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ktvptkmbOc3LIbss4D7YnGlDoURR3Z5R/uvzj8wLRmo=;
        b=ZTqTRLVTWxHGtqrggpf7MvMR/oVZh1y6z2v2DJnDs5PUqx0aLKzsU748dybz3Hg7ag
         UBRkufFj5zjtnMZQ4KJso4+qSv5eIT8f2oWFatTG6NPZ5d+J85UP/x7yoRPwX/tIKR/x
         ZPzkAd9KDCjAILEErHQVguLa+asT7AYFBXd2j8sazj/WMnT7f1MdOFJ4MEibe6vtcNw5
         TuvE8xRkvgWJ85C9OPIZwU49RtBUEIFFbhvG1IR4kJsq+K1RPzi0jTHbYDRkPw3GFJ43
         VrdUBakFwKlyjnV5Go/OabTJBD+x0e9aDdppXvHBInyah/IrnNL6dBs/xglEA719mjOZ
         +iRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RaXIuUyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16si5712838ybm.143.2021.01.21.13.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 13:24:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RaXIuUyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2hRZ-0003tU-99
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 16:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hRP-0003sN-VI; Thu, 21 Jan 2021 16:24:32 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hRJ-0008Lw-1e; Thu, 21 Jan 2021 16:24:27 -0500
Received: by mail-ed1-x529.google.com with SMTP id f1so4181787edr.12;
 Thu, 21 Jan 2021 13:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ktvptkmbOc3LIbss4D7YnGlDoURR3Z5R/uvzj8wLRmo=;
 b=RaXIuUyGFX5Gw1vsS1n+9F0BLKVyZd2K67doAEPdhZTrD+J7PuA+iBXpCRkPhcMP8b
 h21r8F3/+wz2vdqBGwtXP5ss2XVNURIFOiem8FBPTQ1Mz8dDHb8hi4qY3cRU9gqT1ujQ
 1ij1Sid8MtU+GcU3axeTMbxiUi+IN+I2GjQK0IQEg7qCgiyaNSskYRFaPrdZvmwb2SWs
 bhvwiIhhItDdLJQlJwIpoJyeH7GH49uSB0S1jtpf34NPbTHvFuhKQUxXeCzLe/ZhMxVj
 L6GvaNzOctrlsetOFgMd2fCFKMqjuvzXqByb+6LE3IyC7wALCDQmQblUlHUpX7/mtXS8
 EQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ktvptkmbOc3LIbss4D7YnGlDoURR3Z5R/uvzj8wLRmo=;
 b=qzCvmB9IrQN+hJfEwYv35rrYeVRiOUZlMrflf2Mu49m1lJhtVX4wy6KmlyLZ/qosov
 3oGW6B23Fwit9ZpbBEyimrz45FymfLLW9urLv/2S+POyzMt73ldYfXXbIpFa8FJP76hW
 GOfXXsoTXYMRUS9c7xre6MSSmy10hDgxR8Oi0fPEvZkHKSTYIHAzPyqd67CO9grOHiub
 er3jGra4g7yKzFTEivYRCk+rcCgEeftRnLvZmTtwCy81stB/iRL6yTu+jk5V8BMixqSQ
 231ShPdC4LqUw+Wn/TbKJ1lTsvGOY5cWzlawS/BM8sigahmz0cT7aGG1jM81b29tk1EN
 Qllg==
X-Gm-Message-State: AOAM5315obWrDBdB6QnrdyUEcIHEMRlfpXlM5B6yV1a6JGrH/hjv8wOL
 2l7UFZJDI9nLkl+jY6IlxGM=
X-Received: by 2002:aa7:d148:: with SMTP id r8mr857092edo.127.1611264261523;
 Thu, 21 Jan 2021 13:24:21 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w4sm3460329eds.40.2021.01.21.13.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 13:24:20 -0800 (PST)
Subject: Re: [PATCH 13/25] hw/arm/mps2: Create and connect SYSCLK Clock
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ded564bc-71f4-c12e-ed66-481a2f2bdda3@amsat.org>
Date: Thu, 21 Jan 2021 22:24:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mp6xrXW8R7bn

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Create a fixed-frequency Clock object to be the SYSCLK, and wire it
> up to the devices that require it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
