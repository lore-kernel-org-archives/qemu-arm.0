Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp152541lfq;
        Fri, 11 Dec 2020 06:53:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqNvhUwRvJNqeH4Zfq3bdX5dMhvia9obld36BQ2SediTjyDGBW6FrZUUxw4N7fqznoovRz
X-Received: by 2002:a25:d4e:: with SMTP id 75mr18535651ybn.340.1607698432408;
        Fri, 11 Dec 2020 06:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607698432; cv=none;
        d=google.com; s=arc-20160816;
        b=Wf1gbV6yxRn0Bb7TGoDBwUPJK8094sWWU6U/8Mz1YEXS9MqJwz4yyHDLBFhLOgR116
         kVn3UsRCDuE7oqYourgjcI0RNTEIru4sr861vAKZhlE02aVcuFcIcwPdubUpwUKsqsuX
         3oisXezYrvMKsdd4TscL2lu+xrXdKdqpQpIQx+1PnO3q8aMTy2Ck6zTuGr7BKqr7n/7V
         Ih6vKAtBwY/It0iHsYDQ81EJ7HvqvVhHhRJCf7BxZdgwCmDGoz1c42+ARIlJEw1/2jGB
         /WwCagmXDELJG417Wso/yEa0SjE2Z6j2gZ58lUPQ+dVHGdXpggXMFFDbXk4MdPKhPJX5
         ml9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xwWBnVV1bFk4F8QzHyWz6r0Hlne0TDXOnKuH6aZAkA=;
        b=OfPeCh5r17NgBKN5Z/iKvcOZ6ty/c9JN1sQXxKQPuzVFjxV37GZZsVrro3SPlG4CR2
         yZSPvVIuA/rZbjsnIwI8mev65T9FF7d4pbPWZer8pJCT7dFh5JGo+osT+yxy+nv5n1V8
         ALpPwqxMfhypHxX9Wvb+MceCbdk4ZhVGmkUz4ChynWJbfMgrzLzGGQSyshegaQ7gZh6V
         6JCRotx8BmU30RHs7mTVOPsGx+YqkbUjW3hJPIUMcu6YGPu1R9UufnakIsAd1Fr1D4QT
         7RzwIbchvfAREBxFngk6QP+zotwzzL2FvMufmCE0H/XSD4JX9cSsmAbBii0IHrkFtVyT
         l1AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qom7LPPp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v64si5428828ybe.91.2020.12.11.06.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 06:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qom7LPPp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knjnr-0001Tn-Qg
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 09:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjn7-0001SS-ME
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:53:05 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:44518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjn3-0002y2-81
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:53:05 -0500
Received: by mail-ej1-x644.google.com with SMTP id w1so8049114ejf.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xwWBnVV1bFk4F8QzHyWz6r0Hlne0TDXOnKuH6aZAkA=;
 b=qom7LPPpFE6Zf7J9AypPvxnvpvEic4/dfItpgqDuKZWaNcQeyQdc5G/HNDe/3IyT+L
 vnnvJdlNxDmVqTsF5ln1WWYsWQWSZsP/6yK6aJCzUbjdUU1NVqudK9O9MvcLbSkzkTS5
 XZTmk27q5cww1Tq45HIQtp+Z8gitAoDRjSaKOBVQS5LsT4Pb5IaWP4jCxBsgqwYRo1Sg
 zD2UFIqZHR8L5Euwi2RKWVh9fHTzX2aZOqjIoTgMQREl1Os1NZzr9yrLQT1y0IZbj5Jb
 AAmuxO23LRKOhgzK9n1MU0EMZH6Qb3AuIW7u4e1W9JE6Ts6ATcR3p0DJcQ3C1G8sMqp8
 Abjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xwWBnVV1bFk4F8QzHyWz6r0Hlne0TDXOnKuH6aZAkA=;
 b=UwN1BlLx0l5MEioCqK0ST8BoFCJi38WwLPpN8mRGI/VVeAXWbDwp4ISQdM9OMTwPYb
 epJSw4om98DpeFtLtUCFX/rZg5HFFu7OmFud+VHzuN0bzgrsC/fUEDk90LfsXCBxla5N
 if/rDPvkB4VjfO3twR35R4SXAv7l50ULnil7AyucQW+n/gFQGuWt/sFrfdJO4CN+jgWn
 L6YJ1v3Uf/OZvpd3ptv6cqcEUQXSIOyMcCkpAazcIm0h+9PLC5WJ6Ge8gUTqwED32eHw
 4E/pMq8Zb4SwX1folYfxVH9I7qhXVc0GgL818P8UwddxGCflXLmGeX9oirObt6Ta53Mh
 Pq+A==
X-Gm-Message-State: AOAM530maXEP60O9467+dfhFSaWsyy4wznmT6+Q4k9GDLnkrrklBhlh3
 D1JzsityDywacRQRwaG65i+WssqzC+QAQfjpPgLZmg==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr11355221ejr.482.1607698379281; 
 Fri, 11 Dec 2020 06:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-3-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-3-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:52:47 +0000
Message-ID: <CAFEAcA97VzikoPsr-mqPWbeRVLMS=a51hzS8sDNjQOZYJymo4Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/arm: make ARMCPU.clidr 64-bit
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gOPhTmyVgSgd

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
> 32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
> Extend the clidr field to be able to hold this context.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(checked that none of the uses of this field are implicitly
assuming it's 32-bits.)

thanks
-- PMM
