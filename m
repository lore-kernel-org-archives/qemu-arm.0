Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1515496ejm;
        Fri, 22 Sep 2023 11:33:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0TWL/BguMUiT4zjv6B0lnW0foByI23DQi/wdeh8zaQPWZpwqFYs1hhCW23feDdbiVyb0z
X-Received: by 2002:a05:620a:34f:b0:76c:ea6c:59a3 with SMTP id t15-20020a05620a034f00b0076cea6c59a3mr256008qkm.46.1695407602407;
        Fri, 22 Sep 2023 11:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695407602; cv=none;
        d=google.com; s=arc-20160816;
        b=EJQEW67903YBjrUZw6W6oh8UVve51iYHJ65w0gN2nF88DZC/yfihAX59Mk5MAJQ12v
         cPDfqwMERPRDqtdTxCoAgf0hnu/oP67Faop9EjoHMmh6nexKStvbuu5g7gBg5s2HV8CE
         igTgd5Nn669t3TPnPw9t8VsrBWYCka5iFpqTel+1Demw3s61PuHhFNLFHNHuwaP7BGnU
         bhpZH1YcshDNtMkiixLjlCuBX/JigTjN7mRHtE/4vb4wiRUxfEXqLuR0OWk7XBrZC/Hm
         Hprh8HhKtwXGz+wavdRQEVTLF2jINpRkfLm3Bv+NzZ+5kCLS5eMDa7U7SZCxEAbjpkdS
         3wOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w38Xu7XC0+JK4ZoEBsrv5xcn7n9833n4YcixKlJnSWs=;
        fh=MKvEl5Dqf0X3NpnYvSQYgJcpLJkVvhv54SSWkojjKxU=;
        b=nFkZwXb9Yq+hvozfp+GrAMw1kbs9NHHsrdzcMs58WnqaEScO9rRduFxLrv9aY50fwv
         N4mbYfp0fjS6533ve4JTBa81+Rgmxsb1FuJr6CcRil3644K2QMD7AuBda2RvzknqlXtN
         XLztapqy3xixOmCNs4u/buyZL657G/0pHpWxAOoXaZ52AYlY1SZHkn9QvKLULjx6BmK6
         sS4SgjJS6EsiKtAWgxAAidBMjX+aPsTfCrg/oc0C07hOiL/IvnWCG1Fpa77FmSJWoOjO
         I4uYqJLiseftMdsIEObWp5ijc4A5IqGW9OdGWwEJ1ok67gDsTqf+Vb2i70n6QypP31sJ
         Ow8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8isdKlo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh22-20020a05620a669600b00767d49d0fffsi2574721qkn.128.2023.09.22.11.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 11:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8isdKlo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjkxb-0008MK-BZ; Fri, 22 Sep 2023 14:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjkxa-0008M3-Bx
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:33:02 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjkxY-00034J-SN
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:33:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-404314388ceso28896985e9.2
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695407579; x=1696012379; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w38Xu7XC0+JK4ZoEBsrv5xcn7n9833n4YcixKlJnSWs=;
 b=A8isdKloFvAbhC0+lxydjHk3raXgtSk7wIncXq7CKaGld/5/AbqOKURTlTWlYc9dY1
 TrC2J7b8FuG+EhRE+XDIJrRHsA23gPqvAOK7S8rFd6k4m2dI0fUwrGuwjfFh9PO3KQfp
 7mkMLVVpT6bTh5mEt8aOGfPkNMzkweaBCozL/N+1ZWVoL1KSPUxY70Weioryhvr3W8Ia
 4K4AuLEUDRs4SdDX6GscDM/Y848g92/gbi/EP9qe+kx3jIZl1dMijgbkFLlhuGywQMu3
 /zQKe50woBo6EPhOLZid87Z8UknlrSvxIAnEKAk1SD8wwHXkdCo2GvGLWb6ywSKQJGNe
 v64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695407579; x=1696012379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w38Xu7XC0+JK4ZoEBsrv5xcn7n9833n4YcixKlJnSWs=;
 b=Ji33x9+ITwl8VDAicNtWUYoGPzcQzPN59OOnsJCR8bo891gJyWGcDVGuh8WYk48gtr
 p2+Bp1Ga2N1e6aERUf5apG+OPvkcceXfawacizxkSKMrRiFt6g2jWKXWQUpxxAx+URWs
 OsVxv/8QgguE7lm4vkqK4CexY/PGmr357egw/iOm6PyQ6kiWiWd+RrSRlabxCLYgBczf
 UyfJzAgSkfcPOA88AdWcLK1XqVQFhLsjWR1hGEfRtyHEWEybLZ1lvwUC12rt9U6pS2gP
 2AOFZM8hO5NqMtfIM8/32LhyMkS2d8Q0i1rLQhPvKds1fx+/dDa5eTiIq/ENCHW3YgkS
 HZug==
X-Gm-Message-State: AOJu0Yw7UlETiVHsg4au5AYe3TkMckYkfarBaQbXTgz8XJ1k4CkOwH9b
 i104teDuxwuMEEgj5BKOw8a6eQ==
X-Received: by 2002:a05:600c:b52:b0:405:48ba:9c with SMTP id
 k18-20020a05600c0b5200b0040548ba009cmr129620wmr.16.1695407579165; 
 Fri, 22 Sep 2023 11:32:59 -0700 (PDT)
Received: from [192.168.192.175] (181.red-88-28-23.dynamicip.rima-tde.net.
 [88.28.23.181]) by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c251200b003fed7fa6c00sm8167276wma.7.2023.09.22.11.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:32:58 -0700 (PDT)
Message-ID: <845812e9-5dba-a34b-28e6-842e5f374ad2@linaro.org>
Date: Fri, 22 Sep 2023 20:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 4/4] aspeed/timer: Clean up local variable shadowing
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20230922155924.1172019-1-clg@kaod.org>
 <20230922155924.1172019-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922155924.1172019-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
X-TUID: CUFyJRz6QuQp

On 22/9/23 17:59, Cédric Le Goater wrote:
> commit 8137355e850f ("aspeed/timer: Fix behaviour running Linux")
> introduced a MAX() expression to calculate the next timer deadline :
> 
>      return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
> 
> The second MAX() is not necessary since the compared values are an
> unsigned and 0. Simply remove it and fix warning :
> 
>    ../hw/timer/aspeed_timer.c: In function ‘calculate_next’:
>    ../include/qemu/osdep.h:396:31: warning: declaration of ‘_a’ shadows a previous local [-Wshadow=compatible-local]
>      396 |         typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
>          |                               ^~
>    ../hw/timer/aspeed_timer.c:170:12: note: in expansion of macro ‘MAX’
>      170 |     next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
>          |            ^~~
>    ../hw/timer/aspeed_timer.c:170:16: note: in expansion of macro ‘MAX’
>      170 |     next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
>          |                ^~~
>    /home/legoater/work/qemu/qemu-aspeed.git/include/qemu/osdep.h:396:31: note: shadowed declaration is here
>      396 |         typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
>          |                               ^~
>    ../hw/timer/aspeed_timer.c:170:12: note: in expansion of macro ‘MAX’
>      170 |     next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
>          |            ^~~
> 
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/timer/aspeed_timer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

