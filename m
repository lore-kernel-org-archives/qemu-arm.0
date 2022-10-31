Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp914323ejc;
        Mon, 31 Oct 2022 05:13:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pyB9uZ1KjdzXEDdVYqMZfXpbN0fTvhSDD7ZNvfZKs82VvPjvLl/Z0Zylc1slW9EKUeRUf
X-Received: by 2002:a05:620a:14a6:b0:6fa:faa:86d2 with SMTP id x6-20020a05620a14a600b006fa0faa86d2mr8655991qkj.162.1667218430450;
        Mon, 31 Oct 2022 05:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667218430; cv=none;
        d=google.com; s=arc-20160816;
        b=DEuFC7n2TcWwfIuFKTwgo6iwSh7mRh8/Md8UejEtgzn2S+/hZuh8OZ2vJN0VolGXHi
         f+oZ9vN2lV2sL3BN5V6dRcacJ6jDwn8Eq6eDs5FcVfZ1sZOUa9kEg8Kr6lZNKSfl9tIu
         hU6eIj4uN9Pfx4fxNtG7wAnDoPDAdLNyKQ7QsXZbpSjYUgZZWJareIBdNQPFMmg1fh4z
         wPUXmZDjSgOfBCxawe/+7WK6+FCP8gUhDECKKaqBalg1VXVEOhWHG53ZFX2PxJEqI5xr
         zBd6qXDSCu2t7wMq/bGPKZtoAPf8JsLifE9lK6atvvaxzR2s5Je3ntJpjeuB8b6OEYKH
         4bNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1G+4LwU1VKoRUxuh/kntcjDgazZy+0SjMvPNler7HnI=;
        b=tUysZN7pp2sAXU3sVpw+Q66id6S+Lk5MzJ54KMUL9mWBOBNEZuW2sdyahzB3IbjEd4
         GZltI/nJASPm06MNcz7x1tJ815qTUMqjz0V5ay8oCfN/F0lutZzR7/Vdq/Ja6gs54hOw
         V4TK0r43P3kyNNU124QMPh3kSbr29+/jZDHVekfViX6uFRGMuDZ0qqlCD/fUA3adHRZw
         OiKgX3Ae8Qnw8+MuUpEAs+peAeY53mnQEZqyOw5/XW9qa7MVRdZCdfBYAkcDSFQpqSbT
         cscji6hfw+iNNf5EUuE2rbgJZXDKvpJUIDtvhZW3RMcmbrxGL8jDEcbQy9T/OElQTYG9
         U/QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILoKRZ9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020ac87ed3000000b0035bbb8056acsi3693180qtj.327.2022.10.31.05.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILoKRZ9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opTfg-0008Sm-VV; Mon, 31 Oct 2022 08:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTfg-0008SF-8v
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:13:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTfd-00056B-F5
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:13:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id k8so15716249wrh.1
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1G+4LwU1VKoRUxuh/kntcjDgazZy+0SjMvPNler7HnI=;
 b=ILoKRZ9avYXkhBGvtfNGLaKJpR5sscPfTZk/ghIqarvs8dWUoeStGbdlB6/NxWhmit
 Dn9j2GkUc+DqquXyNtg1xl5nXcc1lICZarIQjWeCFTRc3uQLFUfOjiDKOGkpzK5MGXuP
 CkkTswfi6w81paYwwJO6BrRUhTDm4JAqS3lJA0yGHlUNu1awxrZ8Kvi7gEicYUFJu33c
 SPUQDwfZPY7A50eXDtfpPEyZEiJs+7ujLwweqXmCf/xmrfBxVuUJ+5FoRZe4APPSVQbS
 Yz/Vr9/ETDpB1OH0R+SfIlkc7VwWiGHSocIVK3gLmyy3DhFh31mCkSKL+5VpZ2364W3f
 Uy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1G+4LwU1VKoRUxuh/kntcjDgazZy+0SjMvPNler7HnI=;
 b=D2bu3MGBk1icjBS7kTLwEWm7R4ybJn11lR4ZPWXDndB5M/hyoqNuYYHgzlrXDKsu5D
 HC7Y6VEYDc25c7eC3BnJfsQebeHOU9ICx04e8Uw2PwvFqlPjIaG/RwxEOtI0gyiwGESt
 qs9aJd+3UzwJ2cw2zoaV0ADih5s9SefUhXEXxXwscwMsVb+Uhnt68xUzo33w4atAB914
 MBCWw/Ur/CADbyYjxqr43OhGMNY5bhXH+ZZMtkCTAWe0+Q4zHbTCyLjSfdLtyq10mcNC
 stF8NogNblJ5Hvy7vYymrM9jCslktjCxJgQgBRmBccPPhC0qDGi3PaVHKE5wcTPA4O4W
 /AKg==
X-Gm-Message-State: ACrzQf2v/WUORap0Zc5b2pWWNvTKSC4r9NZMou000gOkEJz6vKFcMzsd
 Vv91lUuG60Nn8D6nICWB7/GRcw==
X-Received: by 2002:a05:6000:156e:b0:22e:6bf3:79d0 with SMTP id
 14-20020a056000156e00b0022e6bf379d0mr8038759wrz.456.1667218415282; 
 Mon, 31 Oct 2022 05:13:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d420f000000b0022da3977ec5sm6877732wrq.113.2022.10.31.05.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:13:34 -0700 (PDT)
Message-ID: <43366a56-8268-f369-a484-ff4df0b85aca@linaro.org>
Date: Mon, 31 Oct 2022 13:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 0/7] ppc/e500: Add support for two types of flash,
 cleanup
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b5xFG8Uh6YfJ

Hi Daniel,

On 26/10/22 19:18, Daniel Henrique Barboza wrote:
> Hi,
> 
> Since this is being sent to qemu-ppc and has to do with e500 I decided to
> take a look. I acked the e500 related patches, 5 and 7. Patch 6 LGTM as 
> well
> but I'd rather not ack it it's SD specific code.
> 
> I'll send a PowerPC pull request this week. I can grab this series via 
> the ppc
> tree if someone with SD authority acks patch 6.

I was not very happy with the SDHCI changes and sent a counter (simpler)
proposal to Bernhard, see:
https://lore.kernel.org/qemu-devel/20221031115402.91912-1-philmd@linaro.org/

Regards,

Phil.
