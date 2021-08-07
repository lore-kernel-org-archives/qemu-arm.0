Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp983364lff;
        Sat, 7 Aug 2021 01:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB9AyaquS8pgqDCjkmt/n5pJwl3QoONcoGZLjlLTcMz7OBVt51/jVW82VnEr7+BFEFXQhC
X-Received: by 2002:a5d:9955:: with SMTP id v21mr169405ios.172.1628323260492;
        Sat, 07 Aug 2021 01:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628323260; cv=none;
        d=google.com; s=arc-20160816;
        b=On7YmPnnjkt4oF1vAhkZldwLw6dHYzmA7o0uJoXNL3vQaxFk/gFD2Amof8HedmAiXq
         Xc5iYeZw9kuht6OqX4XoVqxj7o0FqeLo80qW0v6kSKeGdxbB7aNMC7mPvU4CWkz9pWBQ
         luxY6RAhx0VysDYeHZSyopyk0s2BbUfV5l1DV3x33xk7F1wkksFavRUtVY2g1YQAN59X
         A50h957WtgIBV/gXyqm9EMxosSoF2vyhMsU/v04pREUJG9zgGHHmUTcQtgek1YgQfMqy
         eo/P4U2qvKJKIgpzZ2u3seSYO6i3bErkSA7MLDXUjt2x6nApxX6hruclDj2nNootbLqJ
         2Zlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vMTOytzyo1doFUfpz3wZ8k460EeQw0S0LXECWsHvFII=;
        b=trwn2OrdNjLhzuiLqhCWrIHNr9VQtBckinWUIUf0cEHuZVqoIG/7AluqtMFmpZgkbP
         U6EHpqaTpMuxWIsqFf0ZjIHPsrLwOSis5yQGuypdfBkXpnYyuYBicUcJYRUIkvMSn5Ob
         NPN+tkw9FyiPlRRuYkneUnq8G4k1T4UmCPaEoaxQz6fehQMN08hDiwRtxIOrQqAcaAMW
         vdptzyvRTdDuP4Pb5xJSLxyoT6x1J+n4WWyyJQysnyvBi/fx6VQAfGIKI0W5S0F0UxlK
         VPoWOI5itUqgZsKwFjTVyFoiatRxYSMSUWfBKdrFuz0exIqqLz44o3jOWISMYiC2OB1f
         JngA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p5ZFLCtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si8252963jac.69.2021.08.07.01.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Aug 2021 01:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p5ZFLCtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mCHGN-00058X-Pr
	for alex.bennee@linaro.org; Sat, 07 Aug 2021 04:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHFm-00056K-44; Sat, 07 Aug 2021 04:00:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHFk-0002am-LE; Sat, 07 Aug 2021 04:00:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso10519735wms.1; 
 Sat, 07 Aug 2021 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vMTOytzyo1doFUfpz3wZ8k460EeQw0S0LXECWsHvFII=;
 b=p5ZFLCttYH9F075QGNw6lLKp29awPPL+RFM3zfyQjcxTXY/feZWNuthiBPPIdEKyHi
 B5ZinBQ/8jVcEwkBOF7KzLGNntsMRcJ7gEhp/BoskBAPe/nriiopJEsVS7/mvwxrJGsl
 klFcP/kKxratcnE3tV6/6G6pA0Dd8Mgjike9JaBtf6StfDHXWWqtlbL4701TaZTf1lKa
 AOBI+IN0tNHVJFHyiYE0j+JB5yBvUSzAPcih9UrWeV5nmo2X/wLz24ducMwugg7GHZet
 w0EtfODSsBYTmzw8qa+WfX9jhZXnrjC5YbBbX8qQoDkSsE1u89Iunm8MW9gra3EAuPgb
 XDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vMTOytzyo1doFUfpz3wZ8k460EeQw0S0LXECWsHvFII=;
 b=MyaHjKQLTiubYi4uwpNaX4t86bS8WyEPCVfQD1mjVSiqsPOYl4hYkxASBGKpRX9z1P
 y1dAdVlLkE5ScOoa8jX2YvjTgh2Xsz/frfAal7I3AfIMKp5tkcF7nOKtzgVGXyPRAXxT
 PL0JfpPHMvgX/4GimJIxZRV/LN7nS8aj1lr6OUhFzCi1oKq5AFl097rzkZtr5vuCHDLr
 D9v0bThKral0pLSGWz8x4fhS6l+fuvB/4xj+trihdJP8l3SZrVtphnb7d1fRnyRk9LUu
 D/ErymouQEs7WNfuBmvaREXx8Wdr/AZf+uqRsAQHLIDTply/IpoefoqrvezQYpNsyDtU
 U7Sw==
X-Gm-Message-State: AOAM5311+Kex5zv9tslyMLVF+41f2crEkigiMWo+Po2ePuNhkazv/TpG
 NmJVicMb2FpMjQJnjL4sf5w=
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr6875962wmp.52.1628323219030; 
 Sat, 07 Aug 2021 01:00:19 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id x21sm14184112wmi.46.2021.08.07.01.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:00:18 -0700 (PDT)
Subject: Re: [PATCH for-6.2 09/12] npcm7xx_otp: Use DECLARE_CLASS_CHECKERS
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-10-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <93092f6d-5dec-c361-9880-7c2852722b97@amsat.org>
Date: Sat, 7 Aug 2021 10:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-10-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: StZM1F6ejSNH

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> Use DECLARE_CLASS_CHECKERS instead of defining the
> NPCM7XX_OTP_CLASS and NPCM7XX_OTP_GET_CLASS macros manually.
> 
> These changes had to be done manually because the typedef and the
> existing macro definitions were in different files.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/nvram/npcm7xx_otp.h | 5 +++--
>  hw/nvram/npcm7xx_otp.c         | 5 -----
>  2 files changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
