Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1872725ejc;
        Tue, 12 Mar 2024 07:50:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHm8TO1d36L++xAiP+nVoA6nc8Vq4Nbidp4ydMaKd+DAun+5/1exodaV9Cxk/6VyhAy9xT6e9tgIfxvaFOjwVaZ0zGDJ6B
X-Google-Smtp-Source: AGHT+IEV+NpHhb/l8kJ6egWFCs06WrDgrHx6HxVGeNr7aF97OscPMABy6Q4RL109576YRdptf7OS
X-Received: by 2002:a0c:eb49:0:b0:68f:2b9a:75ec with SMTP id c9-20020a0ceb49000000b0068f2b9a75ecmr491241qvq.61.1710255002328;
        Tue, 12 Mar 2024 07:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710255002; cv=none;
        d=google.com; s=arc-20160816;
        b=olKLZxDhzeDQeMzDXRzgFqmh5XxB00VwnTLVOzDb7TDgMtfvPlEaQ+nc4MzRFL1qbz
         zO5aDWjF/LK3VajlwflTqTa04OD9BLPm/M07y7QR0XKRMY5384zHzu+uQR95MUoB2C2e
         bdFl2HYSzNnbDce5k+w9AGUO/8SC/oSz+m6ji4NrGyLFdaqKYdDxZtOgBpMp0jZDHpeN
         BOxIz6CuNUrhIayiojWQLMFcBe8Kl26+dGl6eNia3aUnPak3LXysLBWTffPGz0oRIRci
         gl2q7XbzJTLJ8c4K5IcqVQpWFaH0xO44KEypZAKXsynlifSE/ABhN3VTQ6AzeckkeVZK
         Tg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hGlAorUVssSBcEt1yAdhq3ZZUCMc/3aU7B9ByxNY6IU=;
        fh=hLnfsvQKhj1mrqeGy6G8q8v0tYFWJP75OdzAoNimgjA=;
        b=DuVXQq6VCc1x8pCX6LE+baqj08E1DwbeFdqimUWvj0RXhImnlBvdx0JSvSNvs2Ad6o
         wRYyJMO041E9g+PmtIBu1U6MzryuNPJdBLCsjyKxv6Oy5RoY7VAonHsGjgrs+MFVdE01
         ffBk4HHSjYiCKvhxrF6uvgojEQXFXGPpqhNQRpang3Nrp70PhZWvfUJ3LqUuoyTTqhky
         Vez71xHgA4Vxm5vg0CFJqcZV7n4Gq2RSMoc/9poYDAh1egiPeh4pQV9Ud2ygx94ltUQL
         Fs0wAdP89Bu0ee0HcX5biSxECR1RSrqDWuDWIT30FgFz9S6RHKykc/w0eDPNYHgw3OWa
         J4/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MQaFUTtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh15-20020a05621429cf00b0068f69ef1ddesi7514343qvb.397.2024.03.12.07.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 07:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MQaFUTtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rk3Rk-0001v4-6z; Tue, 12 Mar 2024 10:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rk3Rh-0001rb-Qa
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 10:49:38 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rk3Rf-0001Dh-51
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 10:49:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so7052055a12.0
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710254973; x=1710859773; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGlAorUVssSBcEt1yAdhq3ZZUCMc/3aU7B9ByxNY6IU=;
 b=MQaFUTtWWqX4qixkidcohfojyUhVcMZN3/ZnjNtjzV9QR8Fz66h8AheSLyhN7oDA1+
 qWn0toS+6ObJGH/TFWvOyZaXrv6rl0jSk/ZduAJvGaV5jtIxlrxlpLJ9XyjKsPbNz0B5
 Vaxv6cRHokW6w1a2tepTIrxTQZbvq6UJnwSukWHASK3bTCQJfID1QwW2M2CAmXgRxpks
 uvUOhYW/mnREXpm6D66SpfjzS8JsPt0dDUOCQdEfKhTef0uy4ZGxgRq97fzc7mXN7Keg
 erfRLVEy8l4wshcLNrZt5msjDy6H25Mmjv2zcDID1ETXg6d+N24K15HXqfWhCfpYU0v5
 OmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710254973; x=1710859773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGlAorUVssSBcEt1yAdhq3ZZUCMc/3aU7B9ByxNY6IU=;
 b=AuwwwGCOhY7qNYYYPWAv8kuyMhuPxfvAyKH5JBchAy6NzAYBknVlAz+61EPxN3+ruX
 fgydS1po5QAU4jJ4fzA8F0qa5c7j+t9gKo8IzdikCFRieXsJdDWq+IUGbzompLHBDe19
 3uvN6X06CHocJoaSHmP+B1OIsPlf/62pNLAprENpxKnxyh+nZ28TVnxvb95/5vK1hHas
 /tBpH9OX7CydLlmWGLnKnLVapiPCF8iSuQdySJ/F+sarEquAn1g/cDv1O8NhVvdQ6J4H
 1NGwmnJJsO41JO1ugDeeqIP2giKc4HM6a3iEXmU7nrwagQtUHmJCOOjQ20DoH1716JYT
 4LxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAp9Jqm+W7HejmTHYoFB0eEPtBI0SVLGtKIAqjaF/RMM+wnHU3YdLBa9jtWZLOwL9gqRohGY2GR0hQ3jEeWUDf82mK
X-Gm-Message-State: AOJu0YySGD6fg2cAvyWl1rJU7pHvGgjqCCSO69jmu2LUrD36EvBKkAUD
 Zgz5fp31WFGhSmGunHjgFuwT+CGFoC0LEeIxCqKZm8GuljZAlG9qhmUJyPYNiYBRH0j64gUH81P
 kiN5XYr9pWiASQ8AT1ci33C9wMeQMquR5DZVw9g==
X-Received: by 2002:a50:ab14:0:b0:566:1725:1c86 with SMTP id
 s20-20020a50ab14000000b0056617251c86mr5769634edc.12.1710254973607; Tue, 12
 Mar 2024 07:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240228120215.277717-1-ines.varhol@telecom-paris.fr>
 <20240228120215.277717-3-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240228120215.277717-3-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2024 14:49:22 +0000
Message-ID: <CAFEAcA--9tcBoFGznv4cFCNYGyKvgtav6aURL1t1vQBDFLwLYg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/arm : Pass STM32L4x5 SYSCFG gpios to STM32L4x5
 SoC
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Samuel Tardieu <sam@rfc1149.net>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: kU98/0XhNFWe

On Wed, 28 Feb 2024 at 12:02, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> Exposing SYSCFG inputs to the SoC is practical in order to wire the SoC
> to the optional DM163 display from the board code (GPIOs outputs need
> to be connected to both SYSCFG inputs and DM163 inputs).
>
> STM32L4x5 SYSCFG in-irq interception needed to be changed accordingly.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>
> Hello,
>
> If SYSCFG inputs are exposed, should GPIOs be part of the board
> rather than the SoC?

I generally approach this kind of question from the starting point
of "what does the hardware we're modelling do?". Does the actual
SoC expose these lines as pins? If so, QEMU's model reasonably
should too. If the hardware SoC doesn't expose the lines, then
presumably it handles the DM163 in some other way, in which case
QEMU's model should follow whatever that other way is. This isn't
always feasible, but it's usually a good guiding principle.

If you can explain in more detail what's going on with this
particular board/device I can maybe give more specific advice.

thanks
-- PMM
