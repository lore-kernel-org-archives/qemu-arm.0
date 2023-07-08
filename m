Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp185056eje;
        Sat, 8 Jul 2023 10:23:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFZYuoJztL8kIJkmib+5eZJ6xaYfWRqFsD2Wr58yapcQbvVGAGtCXEhBVkqfDrxeC65YXit
X-Received: by 2002:a05:620a:254d:b0:75b:23a0:e7e9 with SMTP id s13-20020a05620a254d00b0075b23a0e7e9mr8368582qko.74.1688837004631;
        Sat, 08 Jul 2023 10:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688837004; cv=none;
        d=google.com; s=arc-20160816;
        b=GIafRSJ37ollwsUkVsajt4/tqvwVPHrsYdN5aAtxMwDRn4vi96PUpArR+dNnyoXJhc
         4rJAjKTtBUPkCpLdolGcTpcnYLeSYCqjxBHpqVB6D93gT7a080JCdP73DxJXPWn0OBcS
         pPY31Ioz5oFFszKBbFRCfc20heSO06limtKLsh7QuWV6cKFGg1dKbrtGvtG/HsVqx6Ki
         bKcmYDInpSj1Tp3pEbU2tVc8i8qAv1rSxqBt/aCeuVKlcGS1ZrD3EghbHNvid5NWz7DF
         IBzIgzIsg4wiXr4CV6JKQT9RLPQFnIVusSg3Cl1P2uEyQYIZsBIeM68hBNhHqZcOSGRz
         b2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UFXhPbWy61iJtRj+ZuUvFxrT2pwdqr/OArFh6WTMQNs=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=zPCGKsuoSYh51NrLr7J7qBeV/MO3kvpCXoWlmMkR+6QZi/ouXee2hGcdzwNzkBiY4q
         oEuq+SJAQgXRmglbXht3fmZJncPQJH2sX3XTl0joiptA74LwM1D3o60XJxov/PrV7apX
         ZNBO++72tZOMUwIrdH38eG3Xqzxz5vLXRvXzCRcvkamlZ7cu8YxJIuYKLCGiIPeauPau
         4MJAiXdApuepUdijrvL0BaYKSw9Cf4WCRGcKiOIy0mIBXnWRxfQCmTr3LwW+HHB/5IEY
         MEygaFygPrCh6FhFf0jfqLbF+SWkLkihlyVuD6+UHbokE+boT+dz0NVxov9muiZw02LZ
         YiyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TE/JgFHv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020a05620a11b500b0076772fddf7esi4232298qkk.292.2023.07.08.10.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jul 2023 10:23:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TE/JgFHv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIBe1-0003no-Kq; Sat, 08 Jul 2023 13:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBe0-0003nJ-JD
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:22:52 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBdy-0005dW-0c
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:22:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so7275621a12.1
 for <qemu-arm@nongnu.org>; Sat, 08 Jul 2023 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836968; x=1691428968;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UFXhPbWy61iJtRj+ZuUvFxrT2pwdqr/OArFh6WTMQNs=;
 b=TE/JgFHvOIHB7Qwg/GSY1PUJBVFz/hcIUFfEpxorQv2okNGyu4fFqPWUJfmK9zfoCy
 1+PtO+PuiFHTpOTAdmYlPJFyzLgl/pkPdtrTDLzTShpvr00T4hV6W8f9EVUh+DUMJ9va
 l0Qa29JsNt/mq0EBfLXyxZ50cqcCIEkuE26PGllOmwqWJcm2Huby+ymysuWj+o2UAFCj
 dG4UgIEHwZI3LC250yFS+Ik3EJ7+RFeLgTe8Czy8TC6cy+nTc9LZw2OGnHNG88Hcz7q6
 rFfBfd+YLtII5RnzH1Wc5ZruGPr/dlDzrrxrI3PNVki5obXgzyPNPp344e1tL5n2IJP4
 Akdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836968; x=1691428968;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UFXhPbWy61iJtRj+ZuUvFxrT2pwdqr/OArFh6WTMQNs=;
 b=AcLLvau6Q7uhs/H1/qOrDIMB3Ejvo/3gWT80QwOsHVEwjKK2cypcLfMKI13WmKoOne
 l0ZvX5Z+ZRdadDehXt7BXlHKZpHmedExdkibMTTWHa1V1O5QHnRnbwA00yc54nwhvPtP
 OsCqCEA8D7d2jafoiNY0i+WR1JDuGdobQirleckvhuD5Jcuxq4xo7KIeZqgmGcIP7kVF
 FmmPNNcz/7dciB9571VsPJVce7V4+LAcyIpk0xDwIUOP++QUZeBTEY0hUpe/V4NZ3/vL
 xMqf52dvFMijokC7vv6CFd9F5bIH73dZ6dbXHGoWRNWQ9SpOfmp7RG78/LptQDGpzKq5
 Ziaw==
X-Gm-Message-State: ABy/qLZ8UjAWCEgsGhHBNHaOxYWMY7Fc7ki5X5xrnyWETQLCgs1QPRx+
 o6PcJUxcWcFWGmx6bPrEOUJBIA==
X-Received: by 2002:a17:907:86a3:b0:982:a022:a540 with SMTP id
 qa35-20020a17090786a300b00982a022a540mr12296627ejc.11.1688836968371; 
 Sat, 08 Jul 2023 10:22:48 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 qq28-20020a17090720dc00b0098e38d2e584sm3693408ejb.43.2023.07.08.10.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:22:48 -0700 (PDT)
Message-ID: <ba37fb19-7037-40a3-e5d7-cd6c4e041634@linaro.org>
Date: Sat, 8 Jul 2023 19:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 31/37] target/riscv: Use aesdec_IMC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XUf5KUBszThg

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64IM instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

