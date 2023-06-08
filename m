Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp386748ejb;
        Thu, 8 Jun 2023 07:44:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dfhlrvvg0x3+ek2OBgLYpgT0OXndSOcEQ/22HLzSnRS+KjUW8BB2P2KL3aQN+og4dtqcC
X-Received: by 2002:a05:620a:8b8c:b0:75b:23a0:d9be with SMTP id qx12-20020a05620a8b8c00b0075b23a0d9bemr4744950qkn.20.1686235473911;
        Thu, 08 Jun 2023 07:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235473; cv=none;
        d=google.com; s=arc-20160816;
        b=whp0lQMvfHyz9kLot2IOY7vrQ/NT/9O+PGg0Ayh4RKUhanI4OEq4vmqUmwYbSUY+oW
         /j/s8Vs3eK3n+edj2v3i+rm6LPqvpLpqAcOuPbBmuDEQOgM+nsJTI4hUHFiaDiP7s2UH
         hQeWnDGeedor1CVKC8nEykQIXBpX50KAAVi3+IShKvjZU0gsbKLyA/4sus8m41+MNiuK
         AvNHnUielOzWF/z9TnHjW1R2iCLLH6+T2inozAZN+8sSG/crySyWCvyhTxAgVaxhK4RP
         d+iE4CqpLuMrBS6y4g+yXVhIPiRuWFerpsFCeKDugSLCca3yf34i5yxRs8k8BDFQw9Zg
         WfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jE6wQE9U4UnMMCgMqgeRyKAGQgeZeSgVMgY10bo5Y50=;
        b=gZutA2rGEWSe/eqe1mXWRZjT06r6l22eCP0aA3RwnhzlQMqvKyKVSSrNW3yh84Qmo1
         YIdInFVgvYB+41JUsdoNb5GQrfjVs1Km2wlVc1SN71nhwSF61PwjJZhU1wci0lebkVNR
         Ua6hkeoUil68eT7TYqSo7DnKfzjEGT8BHi8g/QBCP5AY7H9vLpeM1JOjNaHwx+kGKC5d
         mrW0nLYWObJmiG290UVhr8L23Cf2seJEjcsdHpOj2iOiuT11lQCBLulRRNr95zluHnsy
         7zRKEi15FxaLwdh9m/mDeJ62WbS2sRTvU80WsbA7/r1yhOcaUwMG30n9hPfm3dsBaMHJ
         Obpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdk7okMA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23-20020a05620a12d700b0075cc05fcbb3si667445qkl.462.2023.06.08.07.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdk7okMA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7GsA-000572-H5; Thu, 08 Jun 2023 10:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gs8-000564-RM
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 10:44:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gs7-0008Ke-8Y
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 10:44:20 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5149e65c218so1242024a12.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686235457; x=1688827457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jE6wQE9U4UnMMCgMqgeRyKAGQgeZeSgVMgY10bo5Y50=;
 b=zdk7okMAmhAnlQdrnqUSKOhVsMRvSpOVVPSGaLwM7h2rnUiQRlkOd4ZNXgNwod8Tcl
 FLNVBRGlHOmTJ2tu7UtHsk9syAUdiWfhqbM5PGhAN1S4LzAyHf4bWdr9n2Z2t0xKkd9p
 WUoqB8v+T5+pQKOetkD0zr5K2gbJdLfjWv79LRN0tzr+2sCoIhmkopuGDfpV5m+AwqsL
 D9V1buOMa+cTf22VggQYJ9oYygYkcMB4ygufgDR3ZHv5C22eX3/rd2RA0xwa7EPNOjzH
 wFUN1/BBPGMHI7tIdnypRlh20D9/F+F+5rUUMP6VFHh+p4Z6SLM3KcROunRKQrh/gelU
 g6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235457; x=1688827457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jE6wQE9U4UnMMCgMqgeRyKAGQgeZeSgVMgY10bo5Y50=;
 b=b8OlgyTM9K0jrCOjEq+k5IBRDReMCajrCX5e73HVskDfzIrlkjcu+ccDKJDSbc06Kz
 4wci7qTOTVhNn81G7AYeOeegGsU7cRcBgVSIA18k9Lc0IU0cgqaFhPfM0Qjz9TzOmcW8
 PUtZhBmmGYZQnts/elr4ELz3rp4PWALPTo8KRc9xL/nBgoAoMRREYEN1Eiz3eYZMtUjf
 0ux9s2llDuRdx0zwgiEorA9HKeqBF0W8IJ+DQxjttufkVxJwz6NgjWynylQjofUyETyy
 /MLz1YuN1Go6a/KkiOqy2ID6Pv9BiYYNRTtZriDaPn7PCDIg/Df8QmqcSesx7YxPzMI4
 wK5A==
X-Gm-Message-State: AC+VfDy9iV+3FbCkBpeHP0NZvBkln41N/b7agUTzVOK1cirIqr8MF/rG
 8JfYHBXGyrlRHCJqYz3dRJemnsOrQJq/Ua7QZXtIug==
X-Received: by 2002:a05:6402:70d:b0:514:9239:49f2 with SMTP id
 w13-20020a056402070d00b00514923949f2mr7177839edx.37.1686235457549; Thu, 08
 Jun 2023 07:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-7-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:44:06 +0100
Message-ID: <CAFEAcA98X-1k-7Oiicg-yfF4-NR4=ysD_LwLWvX=fmxhUcz=VA@mail.gmail.com>
Subject: Re: [PATCH 06/15] hw/timer/arm_timer: CamelCase rename
 arm_timer_state -> ArmTimerState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hiPTiwsD6WhM

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Following docs/devel/style.rst guidelines, rename arm_timer_state
> as ArmTimerState.

Ending the type name with 'State' is also a little old fashioned.
But anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
