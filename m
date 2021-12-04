Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1112038lfk;
        Sat, 4 Dec 2021 01:52:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB6/9Bjsws7QYdMmDhGq11lB5FE6frOXXVENRxtpYGE730QAxqPRvBLy3l73snRXcrwi++
X-Received: by 2002:a05:622a:30b:: with SMTP id q11mr26648125qtw.235.1638611551916;
        Sat, 04 Dec 2021 01:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638611551; cv=none;
        d=google.com; s=arc-20160816;
        b=fEOR+ejyp/7+r0oeCuAOFypTqHHHHHIc/Jy9V/ChrCB+86lriuXSTOrIJoWIqbWu7h
         MbB7VxrvGqbquUZ17NikDnOX0R97G5JP/dllO4bz4u1kawmDdBpd9fYMxYjU8TUxSWhW
         N0WANtb71yjOoy3lQDJj4Gk/+865raZjiprN5Lgb8HYQ/GIhS2J9OATMt2nWEB8EB4Uq
         c94h7PKWig9JQ0EgKNDTk6ANG3lKQf4y7LcHDkDAXnAYUZQmUo2Q383+Z4OZ75wUhhZE
         qzNbEk5EO61fWnBERFes4MTwV1CEeRyWU7m1txwIMUlGUbhazsFBSMi/Ch8CJjmlavPw
         7GWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qbidtpu0baBz7GNuvBe/1oywA/I9L9Hvfx0VmYa3hZc=;
        b=wK7GaVaddJy0w1UrIgzhSjNLR+FMX3Ih/rqHVfDtcAGFZF4GEngtBzldEn1KBvaGpH
         zpn7F3NzqjXXwt7G1q75cRjt5mhhnsj3rsnAV8WFanGA7F2tSglYDqh6Vz3X7sYHRo8O
         yNDZvQYgDwdGrCtnxBNTE3fMmGktpA28I1qDwgqSOinCl1vKZB9sfQ2x9twuxcxx1GDv
         jDV0pU93g3xQ7/zZBYvy9r8aWTz47/HaNP1KMHVo3yXjANjySlbY5p5ugwdnS3KCu6I6
         Det6W+SXBfu6U5qZSq3TSl3YUBHthmRBgXqgCuWTQ+eePeZpDqyj6lCdLxU01BCeJeG5
         5x7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="m/qJ4oRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd2si5662625qvb.112.2021.12.04.01.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Dec 2021 01:52:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="m/qJ4oRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtRiZ-0004BU-E4
	for alex.bennee@linaro.org; Sat, 04 Dec 2021 04:52:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtRbi-0004Qg-AB; Sat, 04 Dec 2021 04:45:26 -0500
Received: from [2a00:1450:4864:20::42a] (port=40862
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtRbg-0003K0-7q; Sat, 04 Dec 2021 04:45:25 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t9so11033263wrx.7;
 Sat, 04 Dec 2021 01:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qbidtpu0baBz7GNuvBe/1oywA/I9L9Hvfx0VmYa3hZc=;
 b=m/qJ4oRzjFRQK3WVRJifPTmXE2rt9dxo5X22CDQe6vOL5/ERn01oCfCYsEy92594l6
 guk2q0ZcxzWHRACuyhtx4qg6NVSGLT3UaBSIey9g2nrRNdUKfzEKfS0/MSEpMXmADJky
 YT8X6w+uqoSe6OLKba5lbq2LshSkDCwhghkY237YaACyFMcjX9SssYg3Xvj8Gw1AX/pO
 jtXRiPbdcGIXb3wYaVrXLUOBWJwsUFn3wYVSBOcfnY2Hxf67hqjOiBoYCjip3bMoBrlj
 s8xK2q2sy1LMsXndbuUOqDTWRVTdK/PSl+ulHoRHHmzwC7XF1w/+uxXV+e4wQe6SJ6/m
 vKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qbidtpu0baBz7GNuvBe/1oywA/I9L9Hvfx0VmYa3hZc=;
 b=N3stuw6Jomi/mRzXPSMH6UwSZfRxAJNYssri/7RXbY19WuxfYTGVD55uKWbEoi5CC0
 tgJfFnyHtocBVq6zrOBiym92pOWvmRSjvTDoGjXinESXUG9h7Y2j11ubPkG3XT8uWhKc
 Xc75ciPBk75o/R9HN0XW/KPyXMCFJwAn1Iem1ywHYQTs95rZhXI9aUCN1tbwsJ83v53k
 s3wEeMSLU/OG0bIHffHn1NSJSf3UsDWQUloQvwl64Ep04DMleeqB1duhso+EmDGJIB62
 VALDzpIWHwV+G8UckhP4vYVBpQ8Qcc4maaCfzMOg7Q0T041SBf820PrAbZipQ/wMdOxW
 gMSw==
X-Gm-Message-State: AOAM531vhX38435SLAC+RmIp/tO9sJrOVcfdHXN6ijG1Rs3WDrkjDGN7
 y7IRhu0GWHjCF8htGR/KQy0=
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr27571636wrz.231.1638611122034; 
 Sat, 04 Dec 2021 01:45:22 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-109-18.w86-222.abo.wanadoo.fr.
 [86.222.60.18])
 by smtp.gmail.com with ESMTPSA id b15sm6512200wri.62.2021.12.04.01.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 01:45:21 -0800 (PST)
Message-ID: <bcf8b277-1a91-4e9a-308e-32cbee12e48a@amsat.org>
Date: Sat, 4 Dec 2021 10:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc fix missing queue_flush
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
References: <20211203221002.1719306-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211203221002.1719306-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 hskinnemoen@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUEt6Nx6BzR1

On 12/3/21 23:10, Patrick Venture wrote:
> The rx_active boolean change to true should always trigger a try_read
> call that flushes the queue.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: introduced helper method to encapsulate rx activation and queue flush.

Thanks,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/net/npcm7xx_emc.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
