Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1482608ejb;
        Mon, 20 May 2024 07:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6p8/L11I/AdzDaPNrunzXVDHYOZX4Vnv0N+q84zyMQ12JxuMEL9MQ4dcub0/k+SdYCAn1vILQwAEcy4Vy9oV4qPLXTSkl
X-Google-Smtp-Source: AGHT+IFFs6g04LeBOsGUpc8z0Ur5nEodbzoYtDkqABVnvX/s1KgnTwSk+5999lNb5MrSrxfoP8IS
X-Received: by 2002:a05:620a:1794:b0:792:c25e:2d47 with SMTP id af79cd13be357-792c757646cmr3579493585a.14.1716215514016;
        Mon, 20 May 2024 07:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716215514; cv=none;
        d=google.com; s=arc-20160816;
        b=MaQd1/3Npxiq8YJt4TIl5RNnrahxmZRFmKMZ5/efl5uyT9on0PDjA3u2NFWNp8VAk0
         QCFfpwxLUgJd8AjrR9SH7P57UPBQa2frPoDcBO+60HOX1s0KHgNkFBvxAMF/mD5YXx1b
         4gDEvrTTzKH1OJSGPXocrhKxcnR56goSqucimXOoD+G1zkN4VUIxpkAlYFK3Pazn/fhP
         9CDDpU8HwsyU1AZC7Uc55AFAulNGUNFS/CQi+pqMdEyTwRoR4PnS62SfxL2dehnWSMzo
         0mlUEUhZIID6ZpWs+Ds9bRiB7HbUC9jucNSfs21U9aUheXFFkMQ1veqZteJ9k/k12ZgB
         LYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FQrsIrTGha1sEB4quc4TB9X8cKtObMYxA2+AiK9KBeQ=;
        fh=hpMPifPpRZpXL9wjEnOgB6VGaHgD7hjChKZROt7XWY0=;
        b=hOeDXbCamaSUyJ+kr8WbU33CglJh8tFExkehJfybGFjH6HAm0HskvLX8OT1Xjzegqc
         pjpwqm+WFba+sd/T5C0KZCcDBQnG4EsevfiKycmoIqFk/6wqdfrSXWgMQlnhx9krOocL
         Kpe/kxY9ELohzonrFYlTOL6yA1rbiMaUpD7a55WvJhHEjfFEboxYQJcG+UHIqImwbBZg
         G0acq2wlgCf+ywNm7xc946q+IUqpM7vX08AB5ESHX8ldhQkK3NKBL7pGJHry5H0Dw1o5
         GJ0a61A/vIfLG/ZK+haMHBumBnU0gNc34sXxZFYhpVSmFzy8xnHOQZPCT+vLtRWtwDHG
         WysQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zxd9beCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf364ec3si2505940885a.602.2024.05.20.07.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 07:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zxd9beCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s942z-000733-Rm; Mon, 20 May 2024 10:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s942y-00072n-W4
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:31:29 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s942v-0006Y3-Az
 for qemu-arm@nongnu.org; Mon, 20 May 2024 10:31:28 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e73441edf7so2153101fa.1
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716215484; x=1716820284; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQrsIrTGha1sEB4quc4TB9X8cKtObMYxA2+AiK9KBeQ=;
 b=Zxd9beCWjtgk0LPJKqSdNC8aekk0bq9eo59xEq8IobStGJ3ksw+y8l71KHcGr7n+D5
 DwzXBFMYzgU7KxKirToRTpx5SuwP7+qBFQQLuU71qWZRsRjLd3nVlUHmGNv2176CtX91
 2mL28V+LT5dzzHSVhY/nRnqtlgo/wvABDgyRA90a/xZjklk9huxrrGvlXzy8F/LiwAFM
 CsNNKKBREeJaZEG8RIOSA8ZlJCYQGUWGiTuFQbxLhftmJUwjXeB1JVxxboYYvsAI4uwC
 Y9gnRPULDIuKwlxlOtUw0AE7M5q4MKLxkvO/zhja808nvV8Cw20mNo/+iQ4+T4vBARyO
 tU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716215484; x=1716820284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQrsIrTGha1sEB4quc4TB9X8cKtObMYxA2+AiK9KBeQ=;
 b=gVwbKeV2pzHrlsSFivk9u7ysaIfnTqpLk9r2ARlmEEoOLLhyp9MJcMYmL6EOKFfAtC
 pabQ6nHavyIeuvmbndN+4RuLpu4f5egMuW1qxPvrIZfur8w7qI75UQ/pO8lHtRwgvdnS
 /F07SL/5qyowEXJ5nMy4JoEmtvRUy9XuCpEvb8JR//89p0ZACIoVF7dyCe8umyG0sv9P
 HjoT6e/Jryu+q5UfQK4wRwGSCvvWjrGpErA9ZgJxoNqqiIPgS6yh+IbIdgHSJE/pqFkW
 GncOKfoIe7JkbG+EqbI/1ei5BEQOWlpRBXc7LBH/mjmkFrYmVi+GJOU+gFzl3e1Vrs1S
 HRtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtim2+Aci9CzIzP9+ZyIYS3bZPtPuFcOegXtjnpD96E6R0+kMVVxPwO+bz9p09R+iRp+4vW7PG/KIm1WgFk4r7WC9U
X-Gm-Message-State: AOJu0Yx3TfvsdsnlJccwABVjSY6eYTsX7CouQ+rJKD4vVCydi354LKck
 SiuO0UkFuZE3+H0SfZcHjdW9nEsd232YYH8EPcMlKRvdx8QXvkIgB63tjlFvUpV1RxCOdxrvjdJ
 w/ZIUEzpu5Kqk0dbadTqNqkAK8BG3iEM0YuZWvg==
X-Received: by 2002:a2e:b04b:0:b0:2df:e705:7b4 with SMTP id
 38308e7fff4ca-2e51fd2dc7cmr193284831fa.10.1716215483616; Mon, 20 May 2024
 07:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240512102013.211127-1-ines.varhol@telecom-paris.fr>
 <20240512102013.211127-4-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240512102013.211127-4-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 15:31:12 +0100
Message-ID: <CAFEAcA8T52urOcc9vsPtO5R8ZBTHqGeLJBtmRmZGvRJMwSAyCw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm: In STM32L4x5 SOC,
 connect USART devices to EXTI
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
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
X-TUID: BmAWtYRKyD+1

On Sun, 12 May 2024 at 11:20, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> The USART devices were previously connecting their outbound IRQs
> directly to the CPU because the EXTI wasn't handling direct lines
> interrupts.
> Now the USART connects to the EXTI inbound GPIOs, and the EXTI connects
> its IRQs to the CPU.
> The existing QTest for the USART (tests/qtest/stm32l4x5_usart-test.c)
> checks that USART1_IRQ in the CPU is pending when expected so it
> confirms that the connection through the EXTI still works.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
