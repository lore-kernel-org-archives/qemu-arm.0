Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4804202lfg;
        Wed, 12 May 2021 02:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbiwMtJMCbKN4mojYe/k1u5vupp8gan+qUBz13uebDGu6d+5ipwtd2Jwf0cFy+ex2REWsU
X-Received: by 2002:a17:907:204b:: with SMTP id pg11mr4579442ejb.433.1620810600569;
        Wed, 12 May 2021 02:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620810600; cv=none;
        d=google.com; s=arc-20160816;
        b=jUrVra7duEMTRJYDlvIjqaM2eDgNeASakyJeoRkex3E6LnqGNID6Nekyer0Nsem/TV
         /joY+AO71iGBC4YYjmapCc6TLe4FzuFJMHdhGDGGhluxPUYtaZA/GKxRDWLdILV9IR4g
         hwq9MpPUk3066Ya0cI2GbQ9nN125LNP0WmJF97ggTx9f33wGXFerFa4tNV9ZHgzU/5Mb
         Q6mZadgWgqjJIDJv/9kuEX0ZVsZ3gOz/6/XYUTdkv/q8mQBJToinHvM3/qNn6dky/rCu
         EOpXAoWTviWlug5owVeWrycfqLvBqO0qTQdluG0xL7KkHa9YZcOrq0fmkx1bpPjAYZhi
         5wmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQJww8A5QoxFrBjoOiXtQv1qCgOH9lUFrDON1t21/aw=;
        b=QOaAJDCkLkFZCoNErj/WET01r9fyl5uyOeYvCZi7Ia+YboqPFn36N5h4jGKbVG2hOF
         vmnlZo1qkTw5kNVe0iBCtExSsTNApgTug50Y4ZeI41wonocEW6qlpCErh7Y0zzG7mKYB
         mioXUocSOatJhvLj3U/mKXLZTdGlOxcqzbQEntYdHFOJBvgdFs7TXMYJc8P5alXWh+oW
         hmTbTj6bd2pywWsZCVKGqSnMKElCdo57kZ+ieKAKlSeKyOCYolSy1RvYyaGgLPE7Lrw8
         cgfm8V1ara1uPm7EO5DcDjRzYOY1nxjzzIiZsToAH6ikS7dFpGKbUQW/xNl6Xjukjgw2
         3aXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l7MYgi1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk10si2734251ejb.70.2021.05.12.02.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 02:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l7MYgi1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgksR-0004z2-8q
	for alex.bennee@linaro.org; Wed, 12 May 2021 05:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkrg-0004yh-OQ
 for qemu-arm@nongnu.org; Wed, 12 May 2021 05:09:12 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkra-0002M7-5b
 for qemu-arm@nongnu.org; Wed, 12 May 2021 05:09:12 -0400
Received: by mail-ej1-x62c.google.com with SMTP id s20so28378942ejr.9
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQJww8A5QoxFrBjoOiXtQv1qCgOH9lUFrDON1t21/aw=;
 b=l7MYgi1K4przHzw/eCFJ8zCp27aiGu3gJfGix28GHxw1H2hT+FNQT6JVcvUvOvZwFD
 GGxkaPZxWdyN7/pJB7ZuOW8MxBAs/vW4mh8YslUwsVE92FW4fpHuTUmUEhvOPiEqtFLT
 WWYc2NcrMvlEaQ0xBHjGPFopNOQxnhsfft/J1bp9gQmahr5C3ZdoznVRa8doEJAi/osq
 9iKXg60ke4mVHZCxRr7EbKfbP+94NXei2KSdQiU5pxcJSpLsl9F4xYUnu2j6V2aMhhHJ
 ZXf7EUtMkb5oWJB1IirryioNAtOVE4Kz0PsRKIgsh/69N+x9La0Z5D5ERINhUIkZVKYq
 e7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQJww8A5QoxFrBjoOiXtQv1qCgOH9lUFrDON1t21/aw=;
 b=Jcd5DovL+jsg8qMIf2tf60rQnkVMFhzmEsqlZ8o0ht+jdmRRIPfE1wuwemNMc192bS
 IagFMLVFMkDiEfHByGQPHRFbTWH3JvJegAUFqN1TNlYBMEMJMQOApYDNlIFvsKRAH4Wl
 T+iEIhflq1hoQ8VpWax84lHFruEfVHot/+6fw8EL90R1PA46BgyH2Zkaxf81TfuMDRWa
 71B3135zs1Q89AfxySIrKFVr82t7BRVnwsOSHTzqqyzSb/44epfe07Pe2NLq82dvmY5m
 Sb5mFWNSR255cOHNuQoLoxR0p3uU0F6LtZrp/S802AJrDlYv4Q87PhLCZf8GMWV8CHRS
 ClwQ==
X-Gm-Message-State: AOAM531wnRexYVGgZVwp0/7s9m1YPY4fkv2cwv9Gl01nDClVbJinz+fP
 GpDF6Zm9rQ6t28KDaJNoNA3pVh/djvmCqvupoNF3fQ==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr7096514ejb.482.1620810544388; 
 Wed, 12 May 2021 02:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-31-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 10:07:51 +0100
Message-ID: <CAFEAcA_X==5NGx6WWmvvCvJYx8rbO-EkSi=F=FtjWQ_C+qufbg@mail.gmail.com>
Subject: Re: [PATCH v6 30/82] target/arm: Implement SVE2 WHILEGT, WHILEGE,
 WHILEHI, WHILEHS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /z8siynhmzL5

On Fri, 30 Apr 2021 at 21:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename the existing sve_while (less-than) helper to sve_whilel
> to make room for a new sve_whileg helper for greater-than.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Use a new helper function to implement this.
> v4: Update for PREDDESC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
