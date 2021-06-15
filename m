Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2995173lff;
        Tue, 15 Jun 2021 07:14:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwsqSTBHHNzMeXm6LXczfzvrxHA+FaC6TLbsa731AwoJ7ovJ2YL0wPjcJqxCckBRRS79sZ
X-Received: by 2002:a17:906:480a:: with SMTP id w10mr4536962ejq.18.1623766461515;
        Tue, 15 Jun 2021 07:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623766461; cv=none;
        d=google.com; s=arc-20160816;
        b=auFkOh60ZP8dlj+cDD2dOkjD1TS7tV2zmC+1P7QXMBCPwEtDoxNMHSSrmxzokXtNz6
         5kfoM3HY1UUwA1MlD9FXpXcVqGC48X2vWI44HGvRIv083UK1p5vtla2akFjUqrpmB3pA
         ZiN5hwAr4nnByFxtNe2zwQDsOAu44zERA4DeS8l+mICkhoUSP9Nmp6MNljbizxE6k+zH
         j/7b7sfg2sgUyD+vPC/rnATiQW6NTVzNzLfCXSO2HFL3pS6x8NTs6QzTa5deT3ZL0dm4
         FrKKmsrZaGesP/SWcf7+wsJoIhfYmW0+Kzf5UAOmmPH7Iez0xGZH5Vh9WhqGIYN33nN+
         Wong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGKwXYDOrUJZbFIaPks0Bbjn9N1nJOlm+daK1f6jgg0=;
        b=o5sxg+IgATqy06mvF3ItuIARBjtbhj7QHahl9oMBNcaxDyJA1NDavlVgXgsv3CzTg/
         QgwmwxhAcc7Ty2YXiHfgwaVnYyM3jXqw+SsyCxD3S+lKNxhUwP1CzjI1mhFsWyLwjykh
         xUsf4rsNNUl1Fsy+XUwreFLzUn5uEZheVuKkn03kky/iY1GDkg1pcB9hJ60a3khatIOG
         4s2atyQ+2qYUv7BTSv7kHaWGeXDMbF+6tJg86OfZYutG8CivIwunQb748ymB8+6EfbcK
         GujDLBBVplI8+aI764ZVmuPzyGHDXL49Z/PcY4UNY/pIrabVTh0s2HL5kaDKZatgW79X
         SZTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IWTGt6nX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si16887009edj.103.2021.06.15.07.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 07:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IWTGt6nX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt9pc-0001XP-I9
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 10:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt9id-0003o1-9J
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 10:07:07 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt9ib-0002Ig-0a
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 10:07:06 -0400
Received: by mail-ej1-x635.google.com with SMTP id k7so22781692ejv.12
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGKwXYDOrUJZbFIaPks0Bbjn9N1nJOlm+daK1f6jgg0=;
 b=IWTGt6nXjnIpIEb1vHhfU7E81ogi9Hg18xTIwKUiQllYHSL8cnTOum4ldfz7KgJ9KO
 iPn4QMSSiK1e8S1EjIzWv5D9ezXCHzaJpMQZeP09JPGka3fE9aH2q7ov6UX8zd7RIdgB
 V6IrBSsJFiCiYQSnGcLg7R4QQBrBJ9cmDQOcYMFj3rvkqtpN5PA2O5h6ARGv9fn9yog7
 RV2vUJReAJOgIVlzhKoPQx/dXjmUOwtJltEv2Fi7LImnC6byOxPyFumi4v/J0paBXHzC
 mm60W2dauIYckLQcjOxzmUSVlIzDB9lbq2k2DXUKcJTF/L2tF761HBqsohaoUQNlC3CP
 reow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGKwXYDOrUJZbFIaPks0Bbjn9N1nJOlm+daK1f6jgg0=;
 b=EkikMmwm3hdZvVgHkncGaqBJ6ZxhbFZI00wMuQ2GGMMy6CeuYv6als3XDU/cYdyamm
 OK76HP0seVxF5uNdn8h455q8Zt/O74MbQcMa+5oT6V25XcWSDECfOxsSxr/w/NcPh9jw
 iMRuftHwJAlzWNTX31/CBAh27PEIC4dO9TTnVyb3/TXuN+955jjgfLLfp7k0t+gOVptV
 VcrSAdq9sDUlI4f9GDGBtbC1n6SDtQGdvDCLhQSp2bfFn0Pkk4/ZXukdQQptbQIeD7Xw
 Fuwp4KldtlUwG7jxzZ+QsnokvQgYdYw7D7eyQzDQQTThz55XVmmu6WvW6t/DnmLFqmCM
 8diA==
X-Gm-Message-State: AOAM530N/b1+0RHERwiOyGaTJL0SiexN32mI8WuHPkZ7hReDgdZauT5h
 +jVi+inRPITf/X4Z/7YeSog7+4xFk8IP8WjYo+XdnA==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr20773832ejy.407.1623766023326; 
 Tue, 15 Jun 2021 07:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210608202522.2677850-1-venture@google.com>
In-Reply-To: <20210608202522.2677850-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 15:06:28 +0100
Message-ID: <CAFEAcA_P6vtoqttG1bdegmh560xNkzjcBQrdBK77BNv9di+H=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] With the pca954x i2c mux available, enable it on
 aspeed and nuvoton BMC boards.
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MOWGHI9YvJ1a

On Tue, 8 Jun 2021 at 21:25, Patrick Venture <venture@google.com> wrote:
>
> v2:
> - Dropped sonorapass patch.
>
> Patrick Venture (3):
>   hw/arm: gsj add i2c comments
>   hw/arm: gsj add pca9548
>   hw/arm: quanta-q71l add pca954x muxes



Applied to target-arm.next, thanks.

-- PMM
