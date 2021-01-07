Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp417909lfq;
        Thu, 7 Jan 2021 08:11:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGvHW/m4myfoZldtVYe0h4kEh1LSdy79LsEhoyM4ghXypJzm3gLDkozBQW3Vfkv66Y49mu
X-Received: by 2002:a25:2041:: with SMTP id g62mr14719031ybg.152.1610035893228;
        Thu, 07 Jan 2021 08:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610035893; cv=none;
        d=google.com; s=arc-20160816;
        b=sZp+rATwNTY6MRNT9y5R3uIlVym2xOSheeSf6gERTd5j5sSTpP9xmsoN3lw2wm1kqr
         gEe6m/7tkZJyA9vlos5DM1qR17W0s6YdJbwO8yEOC91injlXINqDcEU2y1mrs2tYGJBW
         c5LfiHqb91JcmrF1vh3TGaJNZvVy1BAcBWlCpnFWTElwoA59PuT7Vhm5QRA/ChYkN4Pp
         AXCh3lxovYaqMPRZ39EAHURPQBHq/JHOIvV0olwi6Dll5cD+KSJd7Nv0AS71SC5GQdUK
         04WlZDIe23yQ3IxFc3ZoV2MryufrLn5ztCVwnQGQdvB8sCPXwrjB3JO1gPMnw74nx4TJ
         mZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
        b=QatBVIBygIPfHZD8yV8JRZ4p2VlxJCfgGaH8S1lg+WhWtqpM6JRsIbPRVyMz9rYmfg
         6GnsRIIWtYzrUKDbSnor+Ee3BNn9uucdkKnc33ETAXXMS4wV9by6DbkBp2XgjV6bkjnq
         mVZs/UDb+WlHXK461wTSxxIDlupPj36wLqJT8zih1+hfUnO8G+TDFHhopRMzvczD/P9s
         5xkijUn/6BF/0VdDSbMD7A1llJ0xQhbzf4SwWl6kzGu5h2IoIp2k4YT5DrwmHzDJWOsy
         u2/JtTMxj0dbwjMA52CLl6ob3KP5c0mpZejXVmyJ4k+ZhVTCdqn+IyE/UiXjBtD/LTvT
         OHcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nd7WyuJ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si7335188ybj.124.2021.01.07.08.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nd7WyuJ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXsq-00080O-Il
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrQ-0007CN-U6
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:10:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrO-000225-Eg
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:10:04 -0500
Received: by mail-ej1-x634.google.com with SMTP id ga15so10458295ejb.4
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 08:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=nd7WyuJ+hh7fLk9K/NM0NJ+ju8vWKQPvPqSKcfXB6UFIAIf24sxFS1C3NWkDKDUWEF
 btpXZqVMToyKCF8kfoMY7JPdX6P/+Guac566J8quPPJszDq0Tvty9SO1CfHdwa+LXH7r
 hu2+r7lChjWUefltPoedGKkz534a/nyAm6795AC3hfkLP4Hrk/BCm/U+AhOrEERdyojp
 LBr2lXODjSgoNlUlfgplqlmK9v387ZHHd28xPWD6nk/PpdATrY9i+VFYSra2ilMsRwcm
 UyJtvPB194PRYW7vs+FHHcF/LSigvSeGgsS+C/qxrf9ZizOtUvP3tLxXt3DF97ywirv+
 DPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=IH7Vc8+nbSvy69U0i03j1hVFjDNfj1UDe/2TOzHjvWronqO/LpDPgxcmwXz3FpXM75
 +MQl/y5qtwrdfyQVq8jIWPo66cJqwuXJ17ThxpSxneIPm+pIR1qgn15P0GCC7s9mlqqK
 tQBtliBEfNy0HNVdq9ILc0mRvc4vAb+XBlGZUNcuZrKQfNJ+Jl4b5HvVk4F7TCK6EucV
 wBeNYxdZf0zVqiLqi2cnJyQhNiJkTpE7SI6iPe9FlZpYeS8R8kSeohfHwkDOV5QVD9x4
 DNzKaBoBCHjFe5u5BI82SQ9AUnVGXhdoKOlaKG16rBdVA8vvbvnaJmIsbtFbfb5oFkI+
 Ocqg==
X-Gm-Message-State: AOAM5319Hma6Ge21lfJS7NKYZaUV2CBRIyZ//ut34e/86wPMBhzFq8kK
 wwl8ptRkiVnkrWhxbTWL+X4f16Ic9HJfmVilumxuWDqUKWs=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6732761ejf.407.1610035800885; 
 Thu, 07 Jan 2021 08:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-9-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:09:49 +0000
Message-ID: <CAFEAcA-+S8HJqcro3LuD02hHLdNKj1O58q_=1Fhp+7atjtRa3w@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] target/arm: Enforce alignment for
 LDA/LDAH/STL/STLH
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7QtBG9EplZzN

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
