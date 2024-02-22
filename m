Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp32423ejf;
        Thu, 22 Feb 2024 08:07:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWpVlwPzVyEnbAUfX9kcIyl4WQZLImMrkbsEvV2eXOagbPbmZuljBnz6y3/JoTRJofK0TPRpOw8vAD/dfXyipgNo8F1RJYr
X-Google-Smtp-Source: AGHT+IENEwpAI3J14XSzesmoBxYVJ7K2kKbyGIS9+rHOaUyJEuoH8hsbNot3jLjnR+evLdeeWyGM
X-Received: by 2002:ac8:6649:0:b0:42d:ce4d:5c23 with SMTP id j9-20020ac86649000000b0042dce4d5c23mr19328113qtp.12.1708618024781;
        Thu, 22 Feb 2024 08:07:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708618024; cv=none;
        d=google.com; s=arc-20160816;
        b=eRa872U8K+4eIVurHKF1+fdmpOn2Lt/0cyJCSspBVCmtqRbc9kHJU57DgUIpiwzQUr
         xvRhLEWlo7FWNO7FhXfPqYZrnUM6cv7oMoyZA38DkvkCh/UbpS7vBaWfF15mLGZ+AZRF
         +4jSQm22SIYpWeXE3UCiuhxTia1rRne7HbJE6HWDRH5EYEKd7+fVzegIGn4tGgcdo56l
         yzrKA02YP6ZAKd+iaVLkvIaTKZTVEWSSH3pknwaU4WjIVBmD9AxTVYQoJWL9JTruW3Jo
         +7VSZnNBvuZIfhbwEL9llgqjQMovaso8vW7nOQKSWFr0KT9VdHZNzogbv6g/KdRzUbG3
         sfdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BRFafmZ5F11WhBARmug4Tv7dviM8f7AwVodDaKGt/bw=;
        fh=HdnmIevA0gMqKNML8aded4j4zOL3m5wmCAE/1UcyNF0=;
        b=IHqzqvsYB1c8ElcupYYp7CyZLiOqKfhbD3SMwi0D4EDtm1A4U4EwPkxXi/7N/pJRUI
         gteshpahMfziaXu3OYEQyUyIQ28SZ2j3lvzMVqFxNaDc39lQBWIGs7ll4fIG1UAuXYtU
         ch8pI1mcpu0+oNEhSpKrPD0AV3LBCk54zmt2o1lIjGHZelO7gPD/L1Fw/zj/SpFc8nA5
         SmDi/qkOwt1Jh3GWyE/Wn0BDzRos/4XT/IFiFhoylwPayV5+t1hDiZ0E/dcHzxjXtB/c
         0hp8kwDmpxAG25QV848FpIusS8w/kfXHKV4f3CdUHBJiNmdnobrIwlZSPN9UmEb8HL6y
         SnXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhmZ+OUu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05622a000e00b0042e5ac5b52csi451092qtw.382.2024.02.22.08.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 08:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhmZ+OUu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdBb6-0000F8-VD; Thu, 22 Feb 2024 11:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdBb5-0000Eu-QB
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 11:06:55 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdBb0-0002B4-ME
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 11:06:55 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-563c0f13cabso10386785a12.3
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 08:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708618007; x=1709222807; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRFafmZ5F11WhBARmug4Tv7dviM8f7AwVodDaKGt/bw=;
 b=lhmZ+OUuLl7uBoe+l8Fxs2XuFuyiOXlj5k/8qSVvJZYj8x/tpFCDZSa42z8LAdeT9j
 cvim4wnuvPtXQpu4CV/6uwqmqo61KnJhx8kuZA3BznPle5x7y2rx/fHTHTPrq0Blo0il
 77Bp4LX9qwHt5khilJ6CQ5oYNhenGyCrLMj95hzWoRBSnPUXmWOPr6aeDEi3/t/zu1M5
 XWgSwlf4nseW0vq4eXoj8X1ykrAysw5km9BmGnRYCYNz9JabS1NNhgPMF6b82obQu9Ns
 fGtS6NR6A0yN7tnO67idW8Wp+vTrgnf78nHLARk3nJo9fnAsytAZarQ8AMdPkjKkc+a1
 IWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708618007; x=1709222807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BRFafmZ5F11WhBARmug4Tv7dviM8f7AwVodDaKGt/bw=;
 b=QBM5DiDPm15VEAo6vBNkube/bqMM9jCYgL8sGVL5sMTzvQ4qccj1WPkKOZDAf9eBGz
 lImOT6tP7Kn0BgdhjGKX6aNczSwy0Kf7LNcjY1nwEcFY0WSTud1DypDbdVF/NIbO1+D0
 tWkc90uZZMYBXjjCmEeMZwWua5OXKknUgMrFHBJ2YmOYOPfot/7NrS0ZQ7YYZaApVjzH
 NQl44lQG5rmSkkqaxUblngKiKnmXIRteSbyrQhtI19NuazlWUQqLH/oOMEUe5eAS4LXK
 CCDg8PJNpQj2KmwWhYuu+8ToclaDsBRuITBWoR1de5Le7hFe18MDfDRE+du81MSfwsyw
 LbIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkd/vSGrt+6ScqArkTUFcVpN+eyVRokYdZ+o/hXU3mvILmqchWN3LUYaGg39emWnqd9VRs2h5BXe8OJ4tbFgkfI2di
X-Gm-Message-State: AOJu0YydLNvY3SaoV3k7W+Wehmt8H196ozqlPY+LpoHHGdVuIhVnp1iP
 ebyvCTNUdL6QDarR9BftXWkeqktO056gN4hK1bYdgA9LXP80cZgVyqVTTO+o6vFU/2e6XksO38n
 BWJEhRicb39S1eQoXy9lXm7ICncURki57bR1EUEgkRv+zxR4R
X-Received: by 2002:aa7:d595:0:b0:564:405c:dfa with SMTP id
 r21-20020aa7d595000000b00564405c0dfamr10701416edq.17.1708618007524; Thu, 22
 Feb 2024 08:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20240220184145.106107-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240220184145.106107-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 16:06:36 +0000
Message-ID: <CAFEAcA-m1vtGZJWeMWsYnjJKK=jrxWj_AXcmO43kG=_ZCqPdYg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm: Fix STM32L4x5 EXTI to CPU irq fan-in
 connections
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: Z3YGiiJdC8lW

On Tue, 20 Feb 2024 at 18:41, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> The original code was connecting several outbounds qemu_irqs to the
> same qemu_irq without using a TYPE_OR_IRQ.
>
> This patch fixes the issue by using OR gates when necessary (1st commit).
>
> I attempted to check that the problem is fixed by using a QTest (2nd comm=
it)
> but actually the test is passing even before the fix :
> when any fan-in input line is raised, the output is raised too.
>
> Changes from v1 :
> - using SoC State fields for EXTI OR gates
> - correcting length of array `exti_or_gates_num_lines_in`
> - using a for loop in the test for more clarity
> - correcting typo in test comment
>
> Fixes: 52671f69f7a4 ("[PATCH v8 0/3] Add device STM32L4x5 EXTI")
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>
> In=C3=A8s Varhol (2):
>   hw/arm: Use TYPE_OR_IRQ when connecting STM32L4x5 EXTI fan-in IRQs
>   tests/qtest: Check that EXTI fan-in irqs are correctly connected



Applied to target-arm.next, thanks.

-- PMM
