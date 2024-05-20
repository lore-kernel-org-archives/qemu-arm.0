Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1485635ejb;
        Mon, 20 May 2024 07:37:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMkDiMIFCc3JnHGKKobLK5UOxfWf9NGHRgzveQc8Gka5TYJ5+FdfTRYBmBLsPXI+bF31ZhUTactUBjXqGOu8TSeF+3RDM8
X-Google-Smtp-Source: AGHT+IFMKf/2K4GeIU3Ett29vTvRc2QBkLKSlZ6H0NOTyb453jEL+KG/TUPywjaA94I+j8qYZvER
X-Received: by 2002:ac8:5988:0:b0:43d:e550:896 with SMTP id d75a77b69052e-43dfdb8ad0fmr303456121cf.67.1716215821772;
        Mon, 20 May 2024 07:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716215821; cv=none;
        d=google.com; s=arc-20160816;
        b=hX2rNBcT2Ir5gLbtuoAkor5Fbf6IbSSOqQVvxh8bArlUdiY06LjnMEaKs7RWy+xLuR
         tdqP2IxKlnEnylPlsB593jreHuvxI1ExeimZPxkx/Q/LOw78Fd6JzT/TxSx83pBvbZJZ
         D3BLjcuL7rOFlvxjTZ8+yF80yHlIi3jog387zdItEGBr2Q0vEw1RChDYwJpXmmKzCUVJ
         1ldmIokU+H4NR899KFeX3V/HV6DarYFhZBhfbCtMFAFO0cvB0gyGQyZbm6UfJnxooxFM
         aQ7qjYltL0tAvCr/koBvPQZrc4Tqt6hhTiqJI4bNwOHLahDTGDnxnzIAeJ9cDPzYTx0x
         Op8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AmtG5oN62yyAmZnv258bmJDRpCA4+HfX3KYlwsEc8SM=;
        fh=S/YqgaWz1ETYEqSCUqFhgus0reJ0t7Q40u74utfsD/0=;
        b=xxafOttEndXy2XpOyYV6QDK5JdtBx2Rd/V/4dPkxK5w4EANplITnVLqr3uK71hvJ2M
         3laIWZEHRET80ZPbIiClA1+gJLjlpbGI4HHMtRm7eAVuYUmTEyq97U1wTsWFWhiXd9YC
         xEc48YFXBKrMM4//4L25qnxSUErQx2oejVfDSS9jHPfROv9rhUIjQU6xkaXhrO642n/J
         CK6nlM29S8vC5vQNv2STv6Uk340vnewTjRCR9TlBdAPu3Rm/4ZgYEn1GhvUUGi9PcklL
         QgMyspH97ReLkzCqMw+2h9FYO3HY6rU10r/DhI1V3SxZw5H/NDzf9WEC6ZR6bR05HRAq
         DYeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nl/uQtjY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e2b58fa59si96450511cf.532.2024.05.20.07.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 07:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nl/uQtjY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9484-0001ej-Qa; Mon, 20 May 2024 10:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s947z-0001bz-W7
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:36:40 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s947x-0007hD-Rx
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:36:39 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-572e48f91e9so8347348a12.0
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716215796; x=1716820596; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AmtG5oN62yyAmZnv258bmJDRpCA4+HfX3KYlwsEc8SM=;
 b=nl/uQtjYnLeEnJUHNpB5BJ/03Gnq05uwS2rNC2O/W/bEwad1j54Zb1hcVFua5FYRxu
 OAyTvC+rLSGbhOKo22BaghNfkOfFjYAqn/PlVzsoZ4rQDuCom262CHE+llC9TmKe4fHj
 ebKxTHYu+MD4h5CU8F5DVY2RZ5d8i3LlfB4vAOXs1po+wMQbE3IZsifSPhUnj+iJJlFI
 cUbcbOc0JeqAd+cpTYhGE/78NgNeg4chmfMZqjQ5jOf5HwQC3HoUQEi2YOOsyfm6hdNK
 b8OD3sLWZgocbephUPDLAeXsPyj2kuYZmDNnkaGMEIXrREb6P9YYvitCgVnveG1N2uzc
 ibNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716215796; x=1716820596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AmtG5oN62yyAmZnv258bmJDRpCA4+HfX3KYlwsEc8SM=;
 b=tuQDVzX00wswX/YYN5/a0+nHdGOVighDNdbRptVQk0kJzp2GltXl1wvM2b0EPGIye7
 CiH6fdA+ybJ5hEhVGAtwibjkuj5c2L6xQvCtmwBoEhbTEzE5YB2/jpA9oHdSmqY3ggrM
 9kMRgfNKIF/RpIhruFs3ciiRKEafPh/LICF50bNSL597z69bphy6a2EkGPn5NL3RQgF4
 vjdDTtNhG31T5484W/b4QWg1vDQB12Ou1n3136iNBPp2q79BLkqjww6RfLyJTKdReNkN
 +Izd9txPA3FH4mqKzMnWfQ9R6F/RWJ8IxIeLAvyDuPS71KalmMNEmj5dt4hj7OisOOq+
 mXWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG/1Xz9Db5KGU4b6j3MUaG7hhq6I/qp8MgLOcEmTuTU6PGBj8zaL2Wl+uVlKZ1T9yB/GHvyPGhjtjx5+p+FT3+BRiY
X-Gm-Message-State: AOJu0YwKoV3rikOHbzbZm+zbeiP7whhrFpZpnZ/Lq+pH79gaVg352OdJ
 ibRJ6TH62l8Sab+Eb1lqsEvyD0Z8H4IPuydgjK4FwaBSrYnxSCzdWPaMrGIMoklabIoSSev6npg
 iR/3WKGEZBbBjk74NpjZwBacKot5Tlb555bgbVA==
X-Received: by 2002:a50:ab59:0:b0:572:a711:3daf with SMTP id
 4fb4d7f45d1cf-5734d7047damr17408817a12.40.1716215796122; Mon, 20 May 2024
 07:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240507185854.34572-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240507185854.34572-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 15:36:24 +0100
Message-ID: <CAFEAcA8=vnpPU7bXmd89PSXOB31aEp+RP41BrM1N2kY=nhc8fw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Check clock connection between STM32L4x5 RCC and
 peripherals
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3lbB3W/vHsXA

On Tue, 7 May 2024 at 19:59, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> Among implemented STM32L4x5 devices, USART, GPIO and SYSCFG
> have a clock source, but none has a corresponding test in QEMU.
>
> This patch makes sure that all 3 devices create a clock,
> have a QOM property to access the clock frequency,
> and adds QTests checking that clock enable in RCC has the
> expected results.
>
> Philippe Mathieu-Daud=C3=A9 suggested the following :
> ".. We could add the clock properties
> directly in qdev_init_clock_in(). Seems useful for the QTest
> framework."
>
> However Peter Maydell pointed out the following :
> "...Mostly "frequency" properties on devices are for the case
> where they *don't* have a Clock input and instead have
> ad-hoc legacy handling where the board/SoC that creates the
> device sets an integer property to define the input frequency
> because it doesn't model the clock tree with Clock objects."
>
> You both agree on the fact that replicating the code in the
> different devices is a bad idea, what should be the
> alternative?

I think we should use the approach discussed in the review
comments on Philippe's patch
https://patchew.org/QEMU/20240508141333.44610-1-philmd@linaro.org/
where if we're running a qtest then the core clock code creates a
QOM property which is the clock period; the test code can then use
that.

thanks
-- PMM
