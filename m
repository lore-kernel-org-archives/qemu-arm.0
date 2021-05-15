Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1412672lfg;
        Sat, 15 May 2021 10:10:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDfIsCpZd7jmS+zzy4AggcLukknB5chmofX6U3lMFDR7mPv/6LpLsRrnt66Jy29ISgj7Tg
X-Received: by 2002:a05:6102:94c:: with SMTP id a12mr7670873vsi.4.1621098635967;
        Sat, 15 May 2021 10:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621098635; cv=none;
        d=google.com; s=arc-20160816;
        b=B/8O6PSwF16LZ/WnhhXasQRID2JCPhKikZK/qt/5aDN/29Yc7alWdvHCWcDHxkFBtP
         EIuYrszcwH7Qu0TaOuBAMifH2/rJuTtpCSEuekmT7S+mSSq5vyZQrodkTkLUUAuUtPjw
         mnbMQ7M2CWndHdd5SuudzlrNhOcj3AGj1rY615JVNz7p+MbUf94bvpWJiHEqZ1uU8Izj
         83gGJdW1y6aujq2N3vGqLVEeMY7XFLo0psyKoVHLxi6U584rhzfezyCypf3sPXGa1QVQ
         Vz29sq4SSh1bsy8VUzoUxO66GTdkTtXnMEb/W0A4U2bDmLs+QTwo8gDbAIxxu2J8NeXv
         huHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=x/F39kL6pOyM5m1mav9GUvGOkjanhCOsP6pJ1DEu9TQ=;
        b=xvGfEcRjuwKkPPZ9t7OncBqpSWbhy9u2ck3lwbEbG5RBgwCEygNH9tJUE2xrjzeH/K
         2XZe1ArR+gSYENc+ZHzOMS/rGSPVZoIIgCkRRw+7BmTO3Da9137RRSbjkGAUTW1YXBds
         zyoesXEGkNnSBZJyQsUgSdMYbsBmb5esWUwEdVX0RTimIQoFj4Iwc3zZWLYF/H8Xi0xP
         dFvJ5DlJj2XLM8oPt+VtCXr8cr3xgPIBrTPNpMCs26M6iB+Ib5AiDdSFzRW7v+LngNor
         wsDaRsmWUVQZq8OANLftxFZxW+sx1z6PiWwALHYgxA3aMlqXFp3tYFouQwFdx7Vw+0iz
         TPnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y0GrltS8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si6148975uad.27.2021.05.15.10.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y0GrltS8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhxoB-0006sT-9s
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxnb-0006sC-V3
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:09:59 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxna-00060P-8k
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:09:59 -0400
Received: by mail-qt1-x831.google.com with SMTP id y12so1906380qtx.11
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x/F39kL6pOyM5m1mav9GUvGOkjanhCOsP6pJ1DEu9TQ=;
 b=y0GrltS8m+V6dPlczXdnzvaILALK6/po9hpu+NF773R9fhMsqxJTR6mmiJ9qI5A0wE
 WoARlKuLf++EwuZrHxs368lgAoW9szL+Iu2f7bsermA6t4vtOF4H7Pr26IGtfZbpzJqy
 bamWZgFiS7/5PDqiRCWmnV3BaIcOqC82feRh9H+RwrJ7znCEsUd41xQS6VE/sR/y1HP0
 Cq/U/T9I2xKcCCviDbc0+YsUqZ8mODG0GX1ZvvgV0yC3P3Gr1ZGGD1uo4qVyrUqdnNdF
 L5djib4SxG8G51GRrqBM4yemzUhkkrrtwr4vgKVOKNKfmxjZUrY2L53aHyCf+IVo97UI
 NJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x/F39kL6pOyM5m1mav9GUvGOkjanhCOsP6pJ1DEu9TQ=;
 b=ZFatQy5PR1T/qUUPTlsfUy8vfpC7mlXmO+IfhXFusBUF/H+Vo/9imsrxutdHYKXFKN
 IilLO6w8JaKwKGMZly//Rj9axwgR7zKUJrwA2ZLvY9vvDXM7A2EoOHM1Cs3vDezjS13L
 KJifVsBkqX4IUkUVMLyXmWaK0FTTQkq7/z09hxiWaWnjQsIYfj2Vq141bRhImf874Sy4
 18biF+D9s7iFPzzMWMmGmc6AnMRJy7GEEsMY7YpfxOZNpxQm6zN/Uyem1QpeSOxdvIRZ
 w9Q6dLIceqdYPjed+GiHUr5QNN1xm6O9+PIWwGVyJuZTlArJLwKTUkr4iEJdSLd1PBRg
 5LXw==
X-Gm-Message-State: AOAM533uQkChlcEBx6eUSVPzbWAsFzuRbOOmaRQ2nGdrXb9Iuxvym5WL
 /kNL9mJ6h9pHfXe0gkoZxgd4RA==
X-Received: by 2002:ac8:1192:: with SMTP id d18mr47990874qtj.253.1621098597154; 
 Sat, 15 May 2021 10:09:57 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id e30sm7107966qkn.39.2021.05.15.10.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:09:56 -0700 (PDT)
Subject: Re: [PATCH v6 73/82] target/arm: Implement SVE2 fp multiply-add long
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-74-richard.henderson@linaro.org>
 <CAFEAcA9Oc+SiCcECG8pLaHSib87B7+ScSw-yk90pL0193jBCDQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0015562a-4877-8ca4-2a6b-9e597727bd78@linaro.org>
Date: Sat, 15 May 2021 12:09:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Oc+SiCcECG8pLaHSib87B7+ScSw-yk90pL0193jBCDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L3xrI/5f7GBB

On 5/13/21 12:04 PM, Peter Maydell wrote:
> We now have a full set of these macros in vec_helper.c and sve_helper.c,
> and I'm going to need them in the MVE mve_helper.c too. This seems like
> a good point to pull them out into a suitable header file and add a
> documentation comment that makes it clear what they're for (cf comment
> on previous patch).

Done. Moved to vec_internal.h.


r~
