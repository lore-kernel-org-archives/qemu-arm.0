Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp666605lfr;
        Wed, 7 Apr 2021 10:35:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy3KX6Nr6bRgOtE0AbXyiyRPOPh+Lefwj/+sV2rI6Xae6e5r4g+hyjMi7TeKGA5+LK6KVh
X-Received: by 2002:a05:6638:dc3:: with SMTP id m3mr4717892jaj.130.1617816958401;
        Wed, 07 Apr 2021 10:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617816958; cv=none;
        d=google.com; s=arc-20160816;
        b=JFfJBoiaiQrDcMQOypDV/i1EQuvTXsTm9jG8dHhggozv8oVd9ZN+5cqTYhevo/NmtY
         0Y/Inn2nTGfjyv75f9TfB6HIs7m+nNHVAdc7Vh5FiGaGK9e62Dt1GudyQKlmDtR/qMlR
         l+rdam7HOalTSLGhtagMh7CSwmM6C0ZOe2zq/KFXoGfVuvyIr7IvxJ9wBYhxh2IRVqna
         uzyfbnIDYJB/axQB8CI6UjY1aCVgXBH3sFZalrIwIGQ4QmAqCE9zKmZfcBIrHQ2+hcKE
         r8E2Y2S+NNADoQTH4QC22hrApmFe/ickJDlqR4r/LasD/sdIJK3y3PdCDbiEt0aHIALI
         PERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=n/8NFr3CO5ikP/M+M9fMssrRA/jFiaLPQrSEIVwPoX8=;
        b=ksp2gEqVLFL/VxwkvnCi7tBwjlf5aVKGP/J8ae7QiXdeDQMJlUiXGwTSoE9mSSh7GU
         NdKo+l4QnIZD02EcQy0jNcuERvZKWvFw4oDT1NJ3OOllA0OVeE9CWl16HSeSov33Rob6
         ew+S+6DXdPtNH56/bIfAzbp3MWitPp5d/Gy7wKzu3hBMI8agcBkCuNNiLZRQTAt2I8Zb
         abcblDuwC716dtOEw0qCWfyuWM+KNImpUOOr3pIwlXRglNQarJ8djxAd55r7NoXStR6O
         fKs0CcbApxV+XDbR3xQht1O/pYRnjI4wIhXLcLGCYKa9c6qkdUfcao9G09R7ZqyK8W/e
         p9Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EVV8BsU3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si2797442ilm.159.2021.04.07.10.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EVV8BsU3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUC5t-0006GP-Ls
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC2h-0002y1-IQ; Wed, 07 Apr 2021 13:32:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC2g-0004Ws-05; Wed, 07 Apr 2021 13:32:39 -0400
Received: by mail-ed1-x532.google.com with SMTP id k8so14437873edn.6;
 Wed, 07 Apr 2021 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n/8NFr3CO5ikP/M+M9fMssrRA/jFiaLPQrSEIVwPoX8=;
 b=EVV8BsU3ftn9Sy9gun0QZOo1DbtAQXooQsKO1ZIuVrKwcRrjP67NA+1lOrRAREUiyX
 m09Rt4IsZiJsKwoEFcK+7+TY7zEf+pWe50TPIrIcGVDIV9jfrjQtdTwaEMU5why0s3Jd
 qRnlPlPDLD+lqDnBBAYccgrcG+Ugl8a8l7w9fIsCPdup+JGhKCuv/Vvl1vwoCdcrXJg0
 bruseXRhSp/hXjjUmzw12BecEiJlajczHIKqg+DaWolQmYOiR689oR+enqL+gtISzXaj
 ZIJ4pl0OiiyQ3pbs5ZIdNvkx1sT8zV0DgFZnVNMGoJewKTqIG8Iybgi2abwmaqJjcBVC
 1PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n/8NFr3CO5ikP/M+M9fMssrRA/jFiaLPQrSEIVwPoX8=;
 b=beU581SKWLxk8WxF87psPLFY12Vuie6onre7czqeNQzu0eoYrSwwpvyFz/JDjsvxCl
 bswYmwEv/6phL7F/dMRaN0fGWJJ3EBP3TI/Xd/izNHTCJ6H2SrG7Nn5ueMv2jrE3VpyZ
 L5gDOa4ZjNms7ycHSpvwIgBK/UTJ2ARr/9EvBJlTJf736JMd2j+DDNzgJXtLPcDDMmNO
 FPN4I4xjkuYqCi0KbhDs5oS7wPsIRAbLLnFUbmoy7G3U40rGFi7iXlLW4aTvJVwIIQuc
 zGybwMZsHWUSEqiQ0kTbLbeUMHJ+J9worT1ctky0CA/T3Cibz8hs64s8RwRa2OW6pEt6
 rr0w==
X-Gm-Message-State: AOAM531ov7sQa4HxHj6buu8EPOZgPzHM80+qaZa26808NIT88/IoBpQY
 jgqH9eXqVunNgOjJaEtEeMc=
X-Received: by 2002:a05:6402:280f:: with SMTP id
 h15mr2290050ede.150.1617816755769; 
 Wed, 07 Apr 2021 10:32:35 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id df8sm6604754edb.4.2021.04.07.10.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 10:32:35 -0700 (PDT)
Subject: Re: [PATCH 01/24] aspeed/smc: Use the RAM memory region for DMAs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df3e45cb-667f-c440-fdf7-a66d03c6ef54@amsat.org>
Date: Wed, 7 Apr 2021 19:32:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vw0rASOQAx7

On 4/7/21 7:16 PM, Cédric Le Goater wrote:
> Instead of passing the memory address space region, simply use the RAM
> memory region instead. This simplifies RAM accesses.
> 
> Fixes: c4e1f0b48322 ("aspeed/smc: Add support for DMAs")
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c     | 2 +-
>  hw/ssi/aspeed_smc.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
