Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4037623lfg;
        Mon, 28 Jun 2021 07:10:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3V3RdIoronXaTqZh4CT9v9PdJjcIljPHadO8L1kR4SHbSGHq0wqT/aNz8pYc4gkxzLA7T
X-Received: by 2002:a05:6402:49a:: with SMTP id k26mr33226846edv.279.1624889401654;
        Mon, 28 Jun 2021 07:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624889401; cv=none;
        d=google.com; s=arc-20160816;
        b=LCwHCoT+pkKmND/MIw+OOyR1DfLOcLx/+H3WEI6qXHtUYWyW5POOUKftA7/L/b/Pwh
         Kk3D0BvgTGp7TbgWHhPxaro8gsRxg0HY8MaL94QL8IX0u3MPqZq4Go5S+9Zo69/oVgzG
         tWdSTSz8TaE6mDzCr0unsMwLAqG0rgg+mknJhfaX2otWcUUcnI+5L0/5gzOz48BrvsIE
         RZpU2F7wyVGXXXihiI3IvmpRP8OaRGHNPn/HlwGqiH+m+Yvvv3BRFEqpJEkbHprEM3u+
         8Yx4EUIYxs9c1zw+04ZnlbaOi8EDDxhaWqjzr4Ee6Gx52OtkhGStvCh6XMhrkbK6u+L7
         ZMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EFLrL9OrLLi2HeINqX7M48N+rOXrbw+6gHzvInvhcc4=;
        b=UpCZa4B0fSa5RZYZ3uEs6eMt8ee/wIC0sRd5jyYqE/nTiOLOmxPGE02TzxukPluOzv
         aZXicqwDhv9Jbrh7uljbkB7VMeqvXbQcOvmWoz4FUuHnVkWnKcIC3RhUtMVjz6NFffPf
         0axuJiUQ+c3LGOuwhCGTPPNAEyVFkcd8cfNBSm+moR7flvehCiDGUQaYDiEogDd46y2L
         ZB+806PcYq3ZhiHmbZONjSrOwNslv5lCxRiqiyahPZaH6IbHzuWubi2VAxuPp6AivyNW
         CC57IxYFYgXo1wVnhHHemqSl6THqxuv2j9n7vlYlCQU5vqZdomMKEyDzZh/TJ0MWxIUn
         w6BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fxQM8PWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si14085826edv.597.2021.06.28.07.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fxQM8PWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxrxY-0007oj-Nx
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 10:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrw9-000490-QU
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 10:08:33 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrw6-0001tM-Dj
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 10:08:33 -0400
Received: by mail-ed1-x534.google.com with SMTP id s15so26067531edt.13
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EFLrL9OrLLi2HeINqX7M48N+rOXrbw+6gHzvInvhcc4=;
 b=fxQM8PWijU6VV8jANRH++raNoExFi/g8DaPwunMzle6/TEkVCJ+qL7mfgOB8cz44W1
 GaXPDs+Nu1j6KyVQrDT7FuZOdwto/K/B45i0mbLDDKvYPPHVWHBILPrMftvsOPbNiIM7
 /A6MzmhMokOdR5R3y+a+1UJpryTI2aE2ESAsm93Wn41KKp6t62wPuBOruRyMxzx1mxu9
 1oFUuYsPvtIE0tAJpAg+Ph6R3MFh1py1pT1mx3jgj0N6DRNQ/AyBqQk1Zs4aE1UAyewl
 T69+1EWra8kdArLBUuwjaU+eiaSQgZ0ZPomju+VVOz/3VYrLudwiDoMiPiLWvyvKzh35
 NxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFLrL9OrLLi2HeINqX7M48N+rOXrbw+6gHzvInvhcc4=;
 b=IuPp8jQhyWToYnh/5J1GlrpKZ76cpMof2aDwGX12ad7GrJXWQPbfMY/l8z/+IjKybI
 8CsyNomfKBPbJ2IhUahPNXhntfauFBGXLxCQH9gEggf4/zdadpwqBIMyUbfhv9hgKr8z
 nYssr0LBNA3yaD7NWo5GqWlcuSvWTHwHs4OQ8WOJaXlO3Akvy0I4Qtk8XZYo8N4zWgww
 ZAujAH931sQvu4FaF3wtm0DaL7xsCBRidwhULdipqfFPHVcvFrfZcrqQT0gcSyYEWjVu
 Qt3e+j+SbYtTG4Lpsoi/rqa6J8keKO6FdiGWcRf37Btx9FQw0LG3Fw7qUwNIVAPhy0/a
 8SSQ==
X-Gm-Message-State: AOAM53043Rn6XbyLY+Ats09VZu6O4YBaJ8RxYUg0yxfh+0nmRT5YZ2NN
 9IUAx+y5qTbJgx4AFBbG/puUAhGmBWL0yPcOq8xYIg==
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr33110745edz.44.1624889308918; 
 Mon, 28 Jun 2021 07:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
In-Reply-To: <20210615192848.1065297-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 15:07:52 +0100
Message-ID: <CAFEAcA9mqyn6J-W_qiZ_T=JbsBuahZuLAXXc8c9ASarVASbg7g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Updates docs/system/arm to include new bmc machines
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w6C5ROOWdNIf

On Tue, 15 Jun 2021 at 20:28, Patrick Venture <venture@google.com> wrote:
>
>
> Patrick Venture (2):
>   docs/system/arm: Add quanta-q7l1-bmc reference
>   docs/system/arm: Add quanta-gbs-bmc reference
>
>  docs/system/arm/aspeed.rst  | 1 +
>  docs/system/arm/nuvoton.rst | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
