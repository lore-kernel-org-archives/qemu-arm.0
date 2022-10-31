Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp778332ejc;
        Mon, 31 Oct 2022 01:21:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6eq1zcFuSCCEbMru3tpTunhON86kB1Chp3CSd0ZOlx9EAFFSJ7cfsTmwjeS4XAIeEmZr5Q
X-Received: by 2002:a05:622a:1a25:b0:39c:b862:7318 with SMTP id f37-20020a05622a1a2500b0039cb8627318mr9441209qtb.147.1667204519081;
        Mon, 31 Oct 2022 01:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667204519; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2/SIqVuIklCwzzDojTv6Wmh2mDaknJC51l/Ju8MnPMVDpydG88IxyT7LgJz0b/zoh
         TdNqijmz5i5Ucts6sLcZ3CWTddHRHZVIOGDzjyONPPfAJDsc2rzl5U/DEYG4fyvuzLsE
         gX0NA89vu7uG4hFwzgSobQTsjQwNzSalkTaj9EcO6qD3uLy5uNs4wBKUkiV0KbaFyS3S
         1yihBtvQ06VnBvJFoqTe9jAk7CK9rqc5PHhmDhIHN0yjO8fHZSoBUqq3RkTkeuzlBc1+
         yKfhqhpq0xgYpE53f0wlflW3p6Z58k+g3Ya7NCv9D+3aN6tRLPV8bO05e7DLn1imzqIZ
         X7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tBVSlDFe99sqTWtCb8HKi7D8HNcy0+FflhqJUiCgRaw=;
        b=BK90I/xVqyMuJFcu5Aag+adSSVgRA/MYubS3fozyJ4uQibrqpJnrwiRu++Hs8BxCXk
         RZbTmwSml1PDTwBwDBVjopPcxwQv5eKGjHiAjArUR181iKA4tu+0z6+7fTT+80cGix18
         Ys33JzX+XKI1x5FfpcOgOFnBI76IXTOwflSQFWgM14X9XUhFUSlFk5AqYvSoxPbQFuzG
         KcSabi/UCgaxT4d6iOXtdzxtx/RC6AbFfYVmegwGqf2cFYC8Gm3Oesx3U8VFqcPt2Jl0
         YYxAkf4KxW9Hlh9BomVaiNmDRH+hKAH9lVZvqNqckfMLDU6FGsXJYX49tlhI7b02v48R
         AGDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCag9tah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq17-20020a05622a1c1100b003a4f4d6449bsi1436459qtb.127.2022.10.31.01.21.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 01:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCag9tah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opQ3K-0008G9-Kn; Mon, 31 Oct 2022 04:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ3H-0008B0-8R
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:21:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ3F-00012Y-O5
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:21:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id h9so14901576wrt.0
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tBVSlDFe99sqTWtCb8HKi7D8HNcy0+FflhqJUiCgRaw=;
 b=QCag9tahbDab+mMbX/oi24A30IGtxCC00sNzaqcQ2Rx6ZPDM+Lzt4HAuOmgu22vHJN
 ZPHmLRWhiOoRPeU/oLhNWyidByi76q9H+JIMpUAOl/+zzNVi7hxhzchhuUaxjDatBw9r
 vmaG2hovX8zLQKYRKVqxTIfqjReUzIbilc+M689Ib7ZHqMdCi4vDJ4inpdCfd1UprfhM
 LPa3kDpW/bsFpci7Xn7WL+MhNASCM9gAS8CSig0fgA6jybSij8Oa7g/NWd7qzo2JoZOC
 qOVHHsNIuOBvZ+66362KBuHQ4aaD/Em7NExZgK+2Ffeub2rgfW4Oy7X5/MWYUBISvDOx
 F2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBVSlDFe99sqTWtCb8HKi7D8HNcy0+FflhqJUiCgRaw=;
 b=kM8b8qZIGfC0LVq6qTG/y0yI8PWJzf6b1WZwi6qxmt1CnEIxJ1xKNiduubHC3I1Ljs
 G94ZHqRR8GU5FftMigu1eqyBvCyzDn2Tz1EokVKn+Dy4+yfB1SbtvLcv83BRkhgzNrZB
 LuLGaS26aWchNNIIMFrkleruNTWh4HJDSL9LxessKsp23GKURlN3gCiRtB3lMtZPwtEG
 ra4LhF4IFMIAE5oRIWoasAkBHKh33V77yrLylgwtGvbkrtkI/fmBUMqUVsdFbbBcOxXh
 mNSykqvqPpyl5RaOlIABey0Xh8J4uHj2oo9Vda9ZkM85VCZQJAlN9KeZOUpPM0U2aC0W
 fB6A==
X-Gm-Message-State: ACrzQf3cahLHPcaHJvo1JHyl6bgc6mfEW1kBZcRCUH8KGIyCiNF8qhzg
 lgUCpnnJCowiGgZERw9ndu8KnQ==
X-Received: by 2002:adf:e88e:0:b0:236:792e:f2a2 with SMTP id
 d14-20020adfe88e000000b00236792ef2a2mr7050785wrm.220.1667204504234; 
 Mon, 31 Oct 2022 01:21:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e11-20020adfe7cb000000b00236740c6e6fsm6275029wrn.100.2022.10.31.01.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:21:43 -0700 (PDT)
Message-ID: <8aa499aa-170e-3e6a-8461-f42072fb9b45@linaro.org>
Date: Mon, 31 Oct 2022 09:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 06/11] hw/timer/imx_epit: software reset clears
 the interrupt
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-6@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-6@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: 6HQzAZ7ju+Ku

On 25/10/22 20:32, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> ---
>   hw/timer/imx_epit.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

