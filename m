Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3353840lfg;
        Mon, 1 Mar 2021 00:01:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr9v4hNmraNiaTbvUMpZGKtg2vz02zUfOySjozv/58jiMYVwgksYD9RRZKAi+GT5LVxMvt
X-Received: by 2002:a05:6e02:1ca4:: with SMTP id x4mr11949886ill.58.1614585678079;
        Mon, 01 Mar 2021 00:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614585678; cv=none;
        d=google.com; s=arc-20160816;
        b=cyvEUqgZyu4Wain9iW362e5FJUjZyfWYLKrC9DTmnBa6mQafzR+iL8rUVA2ctmHtuy
         94WY5FpgXpot09UOBz0GxrQDiwbh153tIaJsWpfhIonCGhGxZHrPZ9Fyv6r3315FHPlF
         LiqfEWisvt9YNs4XA9zSmpWCQgUcqG+Z4BXrWFvRT0TCQht94djkwuVfY/kE7LfRpqtk
         YimEkFuZdcAfzRuSlxTseRB90iNFIcF8vRgUZVObxc9r85JZhTmKOx71L2Fz6/rmfstQ
         H+38wsNtmEiXxadY/txzgZy5X6H4C0PeOIwyOcQVacfk2d2ooxXeA7T8MuK3rgG1jjfP
         iFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6IAUTYmBUhNDoXikDH5pivcoExP41na67y4A6puUaoI=;
        b=oER31pG3BOgv8c0CtRw1shpjL7Qg+TCcEwNHmWwK2R2WpaNAX30+bvqWT7wiYBoPFX
         gX5PCKZqmiTuyB5NKi7hLmsk5VWr9cTu8GfXAWkP2P4BZ+fseifkU9rvEnTXdoMAA+Pi
         DVWB/RUtd7udNta9330bUY7bdPBMLYKfD2DusRhV2F/MS8m8cNiMCSCUS8OrYdjwnAB0
         GQAGKgNzQbfo4ORRkmzf0QC/6OvrNvZqh6hsz7e2E0BxzVKe6tSwKk4hHlHgI6tEJqoI
         MV5N94NzZ+49iHfN/izS9Lq3jVdVBc+iWWgUgNkScHD9LH4FvihWns67d5w8088aL61e
         QFXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XgZegYFM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si15414573ila.40.2021.03.01.00.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 00:01:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XgZegYFM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGdUT-0007pf-8v
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 03:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdTO-0007hn-01; Mon, 01 Mar 2021 03:00:10 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdTM-0000C0-Dr; Mon, 01 Mar 2021 03:00:09 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h98so15013397wrh.11;
 Mon, 01 Mar 2021 00:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6IAUTYmBUhNDoXikDH5pivcoExP41na67y4A6puUaoI=;
 b=XgZegYFMEjQipazHThSSvTQo7+sPGRvJereqH1wqfrOUJ4bRIDbn59SPPmPO+ldmN2
 HavsnuRPSMhZ5ByqqiOuffk/kxgjfDL1bjicYJko0WdXut0paG5ipnSzHbz9Pickc/T5
 GjGXjvt05extpfHQ6bxve0qQWew4zgr7KvsV77APNC4qHuG9uVRBr63/pGFzGpPgIgPb
 6fMCeefJi+rOlj4bkObbpNVOz5jmR5aDaDqBqiNcFADW8tWV9ByTNQtaBZZtJ/SQHowm
 sdbQLSXFa33aiHbEzFR8z+UVumX1FjhhhdbQI/MZIjPXnFvj/GWkHUB1dfn6Lu4bhG6m
 QSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6IAUTYmBUhNDoXikDH5pivcoExP41na67y4A6puUaoI=;
 b=Pu1Sv61SHtWo/m2nBRx6SvLTNjENlDgOku2T6LcD136wWPQXc85xAWPdLE5vRUJkjU
 uSeG1JGohKdfCsb/bUydAgd1XJK3Bm0J58rPWxo4/C8apGnP1p0/JRPG6SJiGb7hcNGF
 qZoeA5w6AVTKx3UL77lKrpnilayOguuyE6fKRUiZydViDjzai2Z21GHb7jH1dPe3yjHJ
 lb1hbdxwiWwK+1zKrbcbKIBzLiOul+g8UHxpSWanD9725ql5YEP0LeOQm7MBtdP1V5uh
 tSvNnKT8rxURP8HUbPXXtPdEF7YtbRRi1JTle4e9ikHZcb9Xx8axUCTnjkCtSHoPjfhQ
 aUdQ==
X-Gm-Message-State: AOAM5326XyrUpEhaJATxPCJSKcvUnJdjzeaHZ757hUbQjD7KEEHfF9Sh
 ZMQjdsWfy55b7gqm9b6Irlw=
X-Received: by 2002:adf:a59a:: with SMTP id g26mr15492389wrc.271.1614585606652; 
 Mon, 01 Mar 2021 00:00:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d13sm16399343wro.23.2021.03.01.00.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:00:06 -0800 (PST)
Subject: Re: [PATCH v2 3/5] hw/arm: ast2600: Correct the iBT interrupt ID
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-4-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08798e9a-405c-1316-9b4e-2ab7547508a2@amsat.org>
Date: Mon, 1 Mar 2021 09:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301010610.355702-4-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gUy+wvcsgMUD

On 3/1/21 2:06 AM, Andrew Jeffery wrote:
> The AST2600 allocates distinct GIC IRQs for the LPC subdevices such as
> the iBT device. Previously on the AST2400 and AST2500 the LPC subdevices
> shared a single LPC IRQ.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

