Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3464990ejb;
        Tue, 6 Jun 2023 05:55:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KNBC5jfoEMeUfMR6LsOZOTCD9IeIRUNiPcZtsaZdVxWe+mB7KiqNn7/0kSqAuk7CiCpYH
X-Received: by 2002:a05:620a:3c8a:b0:75e:2a27:253e with SMTP id tp10-20020a05620a3c8a00b0075e2a27253emr1742299qkn.38.1686056142299;
        Tue, 06 Jun 2023 05:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686056142; cv=none;
        d=google.com; s=arc-20160816;
        b=HSNZZtX7rxU0XTrZRPz1ek2fWjMm1X81IkUD3a2ylmHWbPTnrYoZ30yjkBnMMDsPTY
         Mc8eHbOWQT0zcB3OWJJzSJU3fY8aqRGS8oZIacsF8YPOBDzThmMvUAKBZN2Gb9DZ0kYN
         pcW/3vk7HNEaYCF7N2DU60GoSanFc3pe5ezHlk+QDkLPzTLGVsLOz9Sn8VpuA8nPg1J6
         Ip23zQXOV+elP1NpEv4XoUkj/8CorldRADPPZjhj+8oB11WuaF4OkLluUb0JC+W7XXvD
         yfd1Ax9qSRVjRt/1NG6emeqL/4polwc7HsbrerwkvxTfnTm6ZWMyeJEDcNbXAtdvMtW7
         8DeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=85UBdEdERd4KJcJO5unaRiXp6CTnDnxCR6aFfSs5Cu0=;
        b=InIg/HEIQrCSToSP9UKNIdekb36rapxy3ZO3FyjmozEiMA8ngGCM40kCqOGB+KAAKw
         Cex9uedXoM1tmTLKuWJcdrOxu5BQAgsxB9xDzELp/2kSE/yE8Ohv0WXAzn5oykCWQxSe
         NUS3a7VNdVnt+zkpY06Bs16oChpbV/zQSn/gCilOTg5jfAL2h1AYMyz4JPJG80OK133p
         QvSLx7HV58yGGoNPWMn2tISoq7gOnB3AVBZ4MHAEOScXQoXlDA37f24YncfVhoLtnn1b
         mvDqko5SyYr+ymZs9dNJ5NFmvcKmi3ZRDe87mFaZwQgjFP+h6obCpkFePzT4dF07nQU0
         hHlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPFY701d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05620a130f00b0075ec95615bcsi1000418qkj.671.2023.06.06.05.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 05:55:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPFY701d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6WDd-0005jj-GI; Tue, 06 Jun 2023 08:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6WDb-0005hM-QH
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 08:55:24 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6WDY-0005e9-LO
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 08:55:23 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-514ab6cb529so14679127a12.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 05:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686056119; x=1688648119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85UBdEdERd4KJcJO5unaRiXp6CTnDnxCR6aFfSs5Cu0=;
 b=XPFY701dXLeyz8B17Y5CYy6jMBfAUGnPeqTw2fnNOVVCVaUITUcfy8CGQp9vjYTtBt
 AxGGImi9slDRg0j3ygXagQHssPnLvDtXMhRqwccgGJPbb84d/90RWaJ1SgjTirxy9C4E
 5p3Y4L5pxX4+hy0Xq7wY0uuI88ns7BXgC7NQBVJqYQmIA4oNfvUVUVSAmOYTg40pguB3
 W6K7XkXtJgYNAMDr/AunZhfAL8MEtCbCyyck4TN1ylX3thTyYYq7qj5pTZOENeI/bPHV
 z1tHj2Fnw4K8CZse8fkL3Hps7S3zpnZ2tb3UHFjMWcnXD1SIs6t2k5ZTQgIVg4AHNApA
 heaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686056119; x=1688648119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=85UBdEdERd4KJcJO5unaRiXp6CTnDnxCR6aFfSs5Cu0=;
 b=hqwi94tukISnKnYIUNxBMrSHyURImU9uFoxMzBqOzLAlxOxVAiI9c6yTNsyPQX9nzD
 y4R8hxipmq8T4XXw+4qfdSnq8aVGefS4j9LmEK+Pu9VzNUSs8vY3i75ByvxUGba/uwt1
 1ntrcPgZPUeM2T+gNIYZCLC0Br2cMnVllB70S5FQJv9YIoD4fp4QnBRLN7FEj/V38fLH
 ZI8yr+p8YxSIe4ogTTbi8yG2BQ6ApBtDldv+RAtHTOj/KYZ+GxmM4VxD0YwfJVQ9R5OR
 rH6FXywQD0xgi7ZwrSPBpUflfOA1zlYxxqHgvOOD0tbcLWbC5zavKKnlSDyZX4hl59jI
 HPVg==
X-Gm-Message-State: AC+VfDyWysUPAHrW72P0+X+AE8pf3+P/JP8phpUHP6C5rAUkEId/qDNY
 ydpXjKrQmqnzzuScvWvOeIe67p8iAhvBxuUoPQvRRw==
X-Received: by 2002:a05:6402:348b:b0:513:e95c:6eb9 with SMTP id
 v11-20020a056402348b00b00513e95c6eb9mr13389507edc.14.1686056118921; Tue, 06
 Jun 2023 05:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230606104609.3692557-1-peter.maydell@linaro.org>
 <20230606104609.3692557-3-peter.maydell@linaro.org>
 <635fdcd8-23fe-c0db-c912-3aa0517dd4b7@linaro.org>
In-Reply-To: <635fdcd8-23fe-c0db-c912-3aa0517dd4b7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2023 13:55:07 +0100
Message-ID: <CAFEAcA9cObnb11cSS_StbSHdP0aB6sDeqSHfjb3-qRBfy7K9Kw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/sd/allwinner-sdhost: Don't send non-boolean IRQ
 line levels
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>, qemu-stable@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yvqKFpSH2hNY

On Tue, 6 Jun 2023 at 13:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Peter,
>
> On 6/6/23 12:46, Peter Maydell wrote:
> > QEMU allows qemu_irq lines to transfer arbitrary integers.  However
> > the convention is that for a simple IRQ line the values transferred
> > are always 0 and 1.  The A10 SD controller device instead assumes a
> > 0-vs-non-0 convention, which happens to work with the interrupt
> > controller it is wired up to.
> >
> > Coerce the value to boolean to follow our usual convention.
>
> I remember once wanting to convert qemu_set_irq() to take a boolean
> argument but someone said using integer was more useful because ...?
> I searched a bit but can't find that in my mail archives, maybe this
> was on IRC. Any clue? (I find simpler to use a boolean rather than
> having a convention of using integers restricted to [0, 1] range).

We have a lot of use cases where we just want to transfer a boolean
value between two devices. We have a few use cases where we want to
transfer an arbitrary integer across the channel between two devices.
(For instance hw/intc/etraxfs_pic.c:pic_update() sends a vector
number to the CPU via a qemu_irq -- see commit f4f643882d9dc467.)

At the moment we use qemu_irq() for both. In theory we could
construct a parallel set of machinery for wiring up and setting
values for the "want an integer" case and restrict qemu_irq() to
bool only, but the lazy path is to use the same function for both.
(If we had machinery that made it easy to construct arbitrary
strongly-typed signal connections, that might perhaps be ideal.
But it's probably not very easy especially in C.)

thanks
-- PMM
