Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp29769ocb;
        Mon, 3 Oct 2022 06:52:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53mW4xb398OYZ0n0P5wIpDJFeaRKwGzAljeuSXBo/FJsAFlHEQHHKS/fOZ+eeKn++2HFx0
X-Received: by 2002:a05:620a:e81:b0:6cb:d90d:3021 with SMTP id w1-20020a05620a0e8100b006cbd90d3021mr13726184qkm.435.1664805176551;
        Mon, 03 Oct 2022 06:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664805176; cv=none;
        d=google.com; s=arc-20160816;
        b=JlkM0jHp9+X27aKIhNFifsJg5dq5KV6RK3P/bEV23QCPW+tRXMHOLERfLYOdI6mZyZ
         L8xJaDFf9TOLT1REhrOsJr7Qsx+Exd9Jvh7xqZFSRnMlk7UNlJNCqC5W8IoC6ObUgoAM
         lMC5G3GSUBycnwLDBwJRz+auNBUgR40GkMwHsC0E+VZSy/nv4IfvbDMV5iT0Ipe+mQ6d
         c5TcXAnooU7/w/5rcqkMRjx9dCbTH5pgBczjWLITIUX3SWe5fu2LUET78KtRT9DiE8uW
         +jnCJ6G8nAxYmHxUqCSr+fouyLdMnykbTUIB4DKZofpb2dLHhpzik/oxR4+KjIoWCVpu
         N9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=C/LW3SGwgcKpvNSwJZJuAeJZ9pLgZrmnmQDkqA2AhyY=;
        b=c+RPlIst58xwTgLl7mqtNQ3G/Q+7E8T+hQWtJEaOE2GCVgwXZICDGbLPTWN4Mvb/84
         Ibv5+ZlPlweukDljYjvChlgl66NWn9woAm5JOgiHyDGymoc0S7+Bi6kF24/KByzVPC5W
         LVpizKdXgLw4QIIpbpiBIfDxstDOGFUqIkkv6frCB9LlGEpU49d8Kg5EiMbbYldhG1g/
         mj1bnF7eKMIZ9a66zcUuWOFrtbsH7SvOEnnbG+tgXGNKamH5DlzKOb5VI04qhF5WB3tB
         mZdH+k1l8I+4le5wF1juXxHoo6EA0knaYeNEEeTVUjPDeRUQP1lSa3yBXWnI2zeyg/iA
         S5ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f1+fm4Cd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fa5-20020a05622a4cc500b00330cb523547si4097803qtb.216.2022.10.03.06.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 06:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f1+fm4Cd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofLsO-0003Vv-2c
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 09:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofLm1-00085V-Ij
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:46:22 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofLlz-0002ei-Og
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:46:21 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-131ea99262dso10714303fac.9
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=C/LW3SGwgcKpvNSwJZJuAeJZ9pLgZrmnmQDkqA2AhyY=;
 b=f1+fm4Cd8iz1WFF8Wus71psVo6KYF7l4BFYJosT6zdosLN0k3bzijAg0uElxOGS/kT
 SEjwcOywfuefYLs57YdtuNyKWvwhxqExKdR30C8cWH+mQDZfEA0Ui1yL2oX3zwctrj9f
 Wq6wpq30ppCfC0UWhmeldvSYYZIhdKb9D6Sa5wHLHKbkzmWMyWdqDn+Ek9EWSgFERwbR
 ZsQ10jfKaTZMp0ff8H4kUGbgyx037z/WEHWvs408fTLLn0TfWsH+z/mqXk5HtiABivag
 5crpEYjew6avzEYcTlEZ4Yx7+P0J5ySQwiJmwwaYLjs4OCWreByCFCIOZ7Zg5nLztPwK
 81tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=C/LW3SGwgcKpvNSwJZJuAeJZ9pLgZrmnmQDkqA2AhyY=;
 b=NYt0G/ZZ7mBr2aqrCqHaSayHs05O+rke5wCBaBHeROQwy8aWn1lJyUsxJD6oT0jv6g
 evYl3xZ+LbDv/xtttO5FOGaIk+EzYApbsa9pDDJlicAubCpJOeFLWjYuUqCvbs3//CNq
 8CeiCljYYBvk/DwL8WEKP4NWdLzJfTMvev92ZBvS17KbuLOVlGtx4JrgX2me1ImCLO5j
 jvgk4x71R2sVJgm7mXz7T6j9I39KVjVgAhcNk7ilF3GbturGWP7E75xNgalEONLJgTlq
 VbPgDtUm5qi6Fi49wpR9EiNDPl8m6+0w02PspIegjt9nxNfYQIP9q56h/CszOoBrcM+Z
 GeYA==
X-Gm-Message-State: ACrzQf1eX2d2mV4bCne600SECGGkTpEaWZPWjXphUz24hM/5U934XlD5
 i+yE94cyLCS2PTLcz+4ITFdNGQ==
X-Received: by 2002:a05:6870:4720:b0:131:f71b:f4b6 with SMTP id
 b32-20020a056870472000b00131f71bf4b6mr5710090oaq.13.1664804778027; 
 Mon, 03 Oct 2022 06:46:18 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e3:6069:e8b1:115d:14a3:4a1d?
 ([2605:ef80:80e3:6069:e8b1:115d:14a3:4a1d])
 by smtp.gmail.com with ESMTPSA id
 62-20020a4a1e41000000b00475f26931c8sm2095802ooq.13.2022.10.03.06.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 06:46:17 -0700 (PDT)
Message-ID: <223e0624-3a6b-f56a-2563-dbdf120d5c8f@linaro.org>
Date: Mon, 3 Oct 2022 06:46:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] target/arm: Don't allow guest to use unimplemented
 granule sizes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
 <20220930174853.2233633-2-peter.maydell@linaro.org>
 <3ebee616-2a99-10b5-0902-d41eccbec1f2@linaro.org>
 <CAFEAcA9SzEge=PUKJ4gW71gF14NS8aH3JwHwmpVeDXnd18XvFA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9SzEge=PUKJ4gW71gF14NS8aH3JwHwmpVeDXnd18XvFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.467,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZoyQ1Rd29C6u

On 10/3/22 03:28, Peter Maydell wrote:
> I'd assumed you had a reason for using two bools rather than
> an enum in ARMVAParameters, so I left that alone :-)

I think it was because the existing code had variables of those names, so the patch 
changed "foo" to "param.foo".  :-)

> Putting GranuleSize into ARMVAParameters brings us into the
> area of enums in bitfields, where I'm not sure exactly what
> the standard says or our supported compilers allow as an
> impdef extension.
>   GranuleSize gsize : 2;
> seems to work, but is it portable?

I think so.  Leastwise, we use those elsewhere.  I would certainly expect a warning from 
any of our supported compilers if we were to use too few bits for the enum type.


r~
