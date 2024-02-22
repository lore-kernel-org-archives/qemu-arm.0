Received: by 2002:a17:906:2b0e:b0:a3f:52bd:c6f4 with SMTP id a14csp9354ejg;
        Thu, 22 Feb 2024 07:10:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeckLNB9KsWQCGKLIETUIW3Eh0CkNneao4crQ7CTozZl4nrJTFyKsssBZEkvfXIgxkGXrepaqrgcNDE26zduzsGnAvTjnA
X-Google-Smtp-Source: AGHT+IHBgYqfTYSDsDifbhqWSdywtPFWnAx/PKbzNwIIByMWV7PZsl1+m6PACgMwTCiui2AJmBZd
X-Received: by 2002:a05:622a:4cd:b0:42c:6714:f3eb with SMTP id q13-20020a05622a04cd00b0042c6714f3ebmr28118284qtx.8.1708614647493;
        Thu, 22 Feb 2024 07:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708614647; cv=none;
        d=google.com; s=arc-20160816;
        b=JcM5QMMGKsHmIXKk+qDgceLDdq+Usj2A5KocFxhvwuY+WUZdlev+tR+AusWY4Por9a
         ACO1YGpyu8Y0AZjAgpAtF4XltjiQBcLgVpJqkfoaJpzI0o7pgqoHHztMdTYQop+HpDZH
         dLXgKVTdJ5rhfNunVvBgKFdgXONP0qF61v1HfMXdVh1mGchmschKFV70xGyaz9K1K2TA
         UkpY8Z6ejf/fQ8pNC76s6wCKNvip6BpGYyphmDf0AFEs9vsqqdfQQi5/APTyXIjcCGf3
         8zMzud3wlDNkmjejMi0Eh2U8nCKfp8u3LzlWqY9KzI+twm/rn3z1XcN1GOhACWSp04gZ
         k6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FLsiWeWVvWiLk1oKPfx2xvXtH70SJ3PIlJHsnuC0fpg=;
        fh=x8A4tiAIBh2uXjccyN5+v8U3ZZpHoLD1CcsY17WOCQs=;
        b=IwzXBhKhfa2vhf7qKlYflt9ZmczB+6xs7nOpAZoL2zONopjtmzZcBTBWHtwYYJjKKA
         3O7ezT7bE3bHsuZMKEKikAo2IuuItaD/pcCuq44JiLMhgqh1CmXiIkcBB4kRIR2pwPVQ
         Aw9URQMHWfG/8bbpseoXqIhvtU73RTU+qdty3sUNbFgFDrX96ChQJ4nw55yFFZbtrPwu
         ovDuvYsKrrRPR7hCxyR/ZR47KuiLtbpyc0F2AT9+9EjthWwn8oxtj5Ph4mwMEHnERoXw
         MERZ96GEsqzsstnY6RtFLPHwCO3ODplsa52NGMwwoMhheBesO38b05ureNhRmxcpMx+6
         TvFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KI/fWGIs";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020ac8664e000000b0042dc8edb6e7si12743571qtp.657.2024.02.22.07.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 07:10:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KI/fWGIs";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdAiO-0003u3-Mm; Thu, 22 Feb 2024 10:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdAiM-0003ta-E4
 for qemu-devel@nongnu.org; Thu, 22 Feb 2024 10:10:22 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdAiI-0005K9-BI
 for qemu-devel@nongnu.org; Thu, 22 Feb 2024 10:10:22 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso6298499a12.2
 for <qemu-devel@nongnu.org>; Thu, 22 Feb 2024 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708614616; x=1709219416; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLsiWeWVvWiLk1oKPfx2xvXtH70SJ3PIlJHsnuC0fpg=;
 b=KI/fWGIsXvZ3pQY9vwRofm5CYZDBHt93iA+lSpBHh5lzwI/ZjGK4bbEXLL6ZEail4D
 mosvjL8+oil4Ia3ORFVmw1HQ2AyMmvR8g0rdQt1hyzziEDlq/lqRz6gNswg0TB5kfPGV
 lQAgZNccFShAkdNbOd1Jq/zSQcjeb1DhGrcxcA6MBmxzw4gRRgM6oWKSnW2dWhiudrib
 e8STnXsCWBFikZD7evh4h3ha+eZm9VqQlKhAxK7Daksu1JQoNL50lt+FAlmrnDj3HMxD
 DOT+pgZyDoCIMMyDyd99itRTWpzKMxWVrv66BPf5kSflp6tFI+v1u09xN9OJKdg3za5y
 CclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708614616; x=1709219416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLsiWeWVvWiLk1oKPfx2xvXtH70SJ3PIlJHsnuC0fpg=;
 b=VOeY5o73afE55ovFq6K+9fQw1wl7Q/dSPrGvV6IQPq0qKbbyhwH1MFko2H/cB9QEnR
 aLRMwdGr9HuTrJFXNvc4/VfDesgFoV7M1MxQz3RRtRMd/BxLk+CBFqGofhzkJnJ7/DCv
 A2i7SrpYOEqI1a/F3UIl/xZiP+ATgTsYJCS15htlX5IqIQuUsbobJF+9CQhiMnBOT4Ft
 +6tMSgiNYIih41rYtULUp6W4xK5WUw75T8zoyzSV60beqnLDsltbCx3EJetNAtRUJudx
 BIyoPHMrrfPyuvlZ0DAgtBuCWjRLG6RxWDuVmGaLceN2c0OQK6iTU0ZZI4eZ49UM0k8L
 XhtA==
X-Gm-Message-State: AOJu0YxKNzY6iWczbQNkg/L1WiD+n7uLqkHVXpNDBpOb4R5g/IeZJ4ct
 0N5o96g8Tp9l3PkTHNH6zpO9L8jz/E2qFTdod6duiABqjJatxVDRiFr7ZGKHNenJfX6QRwHa21U
 o+MZtR0G5zJi6FiLlG+1eWddMZxg56EmrtH3RBg==
X-Received: by 2002:a05:6402:33c9:b0:563:e5e0:85e3 with SMTP id
 a9-20020a05640233c900b00563e5e085e3mr10920862edc.33.1708614616757; Thu, 22
 Feb 2024 07:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20240220184145.106107-1-ines.varhol@telecom-paris.fr>
 <20240220184145.106107-3-ines.varhol@telecom-paris.fr>
 <CAFEAcA-Vq+r2ivjttHMhZyyFBcPpNst2CQNQN9TRbCZ9WfiSAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-Vq+r2ivjttHMhZyyFBcPpNst2CQNQN9TRbCZ9WfiSAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 15:10:06 +0000
Message-ID: <CAFEAcA-0YoNML0vcM_5Pa6TE_9miDcvnonJrGt3P5V58_wLx=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests/qtest: Check that EXTI fan-in irqs are
 correctly connected
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iPCunZnPWOMs

On Thu, 22 Feb 2024 at 15:09, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 20 Feb 2024 at 18:41, In=C3=A8s Varhol <ines.varhol@telecom-paris=
.fr> wrote:
> >
> > This commit adds a QTest that verifies each input line of a specific
> > EXTI OR gate can influence the output line.
> >
> > Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >
> > Hello,
> >
> > I expected this test to fail after switching the two patch commits,
> > but it didn't.
> > I'm mentionning it in case it reveals a problem with the test I didn't =
notice.
>
> The specific thing that goes wrong if you don't have the OR
> gate handling is that the NVIC input will see every up
> and down transition from each input separately. (This happens
> because a GPIO/irq 'input' in QEMU is basically a function,
> and wiring up an 'output' to an 'input' is setting "this
> is the function pointer you should call when the output
> changes". Nothing syntactically stops you passing the
> same function pointer to multiple outputs.)
>
> So if you have for instance
>  raise A; raise B; drop B; drop A
> where A and B are ORed together into an NVIC input,
> the NVIC input is supposed to see the line go high
> at "raise A" and only drop at the last "drop B". Without

...at the last "drop *A*", I mean.

> the OR gate, it will see it go high at "raise A", and then
> drop at "drop B". (Well, it sees "level is 1", "level is 1",
> "level is 0", "level is 0", but inputs expect to sometimes see
> calls for "level happens to be the same thing it was
> previously", so it doesn't cause the NVIC to change state.)

-- PMM
