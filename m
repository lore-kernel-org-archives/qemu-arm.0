Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16CCE668B4
	for <qemu-arm@archiver.kernel.org>; Sat, 20 Dec 2025 11:28:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWv86-0007Vr-Iv; Sat, 20 Dec 2025 06:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWv86-0007Vj-3n
 for qemu-arm@nongnu.org; Sat, 20 Dec 2025 06:28:10 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWv84-0005co-9K
 for qemu-arm@nongnu.org; Sat, 20 Dec 2025 06:28:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso19279055e9.0
 for <qemu-arm@nongnu.org>; Sat, 20 Dec 2025 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766230086; x=1766834886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0fm3U2J8/+VxcvIgSr7gIxkeUcO6lgXOKSa0Y//itI=;
 b=Cj4Hf6VVjNbMYW/PbJxQ366oCUQsSrZv+vtcF2kMxGOr7HNWR0sFDgYKloWEuBSCJj
 SqDETDwJV0Op++n6Fk19MqBDEXF7l9RUbJlProgBjNqaLM0NPM+7yPCNuyx3kg+hhzrm
 1UtY3r6vmaKDciWCUWgHKAC488M9PM4lJVP3fEW5qreUCaBidPSSygqrJRCT7rJFB46u
 sKItkcJQ7+Lv6YW7/cTl1xxUOdVoMq3D1ZbxklPcFnanxpIroW746bCB4hcyuJfTOdTB
 B5xiA7koD7hi1Zt9qa0dYPawwLa/MF7qgu6FCmI/q0Ezm49n0K87IgFVrVpej59hDNpt
 gEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766230086; x=1766834886;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0fm3U2J8/+VxcvIgSr7gIxkeUcO6lgXOKSa0Y//itI=;
 b=gtyenTwBQhlgjhpSeelfElHZ4PQRTBSA8m3GchFDmpWavYTcWjz9sHHLy6skeofFJ1
 QKN+ytguDrJiK2e46MC3/ON55FyIaki9h84bb+0lJ2FCimpMbetTajXW+GWZCQffZ+N7
 T1yr4aAyNWluWLzlUap9Ju5EVhAJWk3Z9MqG8KZlKvAWuv7CLS8+APBCOnsbfQkMlQnr
 wxZ6GdOcmSgb1Hbh/AZ1TXlGpxiJFxSn63PhhkxJ7w5HmRvBF7tp8caI9BITG8Y7T9OH
 KFJTdp5zo2W0YXEnF3KxcQc4CYZrXOQ+YG2jQopiH6DjApZezApvf3lMDnPe+wiucPZZ
 7tLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB7LPEC5XbeL0Od1GnMDbfPlmH4JzDi+PPi1doNsXAAzEK+9E/m6m8GHTPi8JRvRMoJZKIRa1SIA==@nongnu.org
X-Gm-Message-State: AOJu0YwTFlSK/u1jOeZKP7z2ZFpIvCruD1eiSImeOm1xuVPcuKr7Ogx0
 4jWeD6dOn1LVSuFFbnZbpiCauFuTPzcaAivhY3iT/G/8ZcIh0KvNIU2QwVrVxpLfafY=
X-Gm-Gg: AY/fxX7eemktQmM5PJKiQbcuo8tVM5uN37Iz0fKQAN0cMcwODThOKCGeQd3QBfoLObW
 bw2Q5/D37Qq6v0te7ilgH8EZNUmmleb3vnkqol7UfxFsgxZGzLpCennDTkhLjL8gtTu/DkBisIU
 7wDA4rqHaCCOuBbXzhOXQVvo/6izwrj859PnGqRsOVqIYFDUBSRp0Fsh7FACObYc8VRipxheq0U
 1WcctITO4u9AT84hbnYrN+ClZ3Bjr4rLCb6d3I7atbYCwyflAQg7aqEnmjaQegGQ/G6kPjDFebN
 47QcUH7gS2RjYOvAHryoruAB2h+M0pT3/EjtbX0RwC9pcG99Bn3WXoEGhneO9fOtO4wDu6jPNnY
 2qlTvWoY2UptqWQi1yZZ8JnUJHxudDVvdKDitSIuEgd/Ja2oQ1bGVE9T2IpZFMh1UGeBj4tdAF3
 Z8/F84s9vDuE8=
X-Google-Smtp-Source: AGHT+IGHXzkZ2+MnbIUO47sz53odNmfUlpILV20NbZVmTrmI3ZySeCLHd8yav9Cqq0a0X9a3hTXoTA==
X-Received: by 2002:a05:600c:6749:b0:471:665:e688 with SMTP id
 5b1f17b1804b1-47d18be89d5mr76705015e9.17.1766230086429; 
 Sat, 20 Dec 2025 03:28:06 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a210e7sm52315825e9.3.2025.12.20.03.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 03:28:04 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 15A9C5F7C2;
 Sat, 20 Dec 2025 11:28:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  thuth@redhat.com,  berrange@redhat.com,  Jackson
 Donaldson <jackson88044@gmail.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH 4/4] MAINTAINERS: Add MAX78000FTHR section as orphan
In-Reply-To: <20251220072416.3745923-5-armbru@redhat.com> (Markus Armbruster's
 message of "Sat, 20 Dec 2025 08:24:16 +0100")
References: <20251220072416.3745923-1-armbru@redhat.com>
 <20251220072416.3745923-5-armbru@redhat.com>
User-Agent: mu4e 1.12.14; emacs 30.1
Date: Sat, 20 Dec 2025 11:28:03 +0000
Message-ID: <87ike1z930.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Markus Armbruster <armbru@redhat.com> writes:

> This machine was contributed by Jackson Donaldson a couple of months
> ago.  Its RISC-V core is not implemented.  Unfortunately, Jackson
> isn't able to serve as maintainer at this time, so add it as orphan.

Commit message doesn't match contents.

>
> Cc: Jackson Donaldson <jackson88044@gmail.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3efc943c9b..c493aceffc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -871,6 +871,15 @@ F: include/hw/misc/arm_integrator_debug.h
>  F: tests/functional/arm/test_integratorcp.py
>  F: docs/system/arm/integratorcp.rst
>=20=20
> +MAX78000FTHR
> +M: Jackson Donaldson <jackson88044@gmail.com>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: docs/system/arm/max78000.rst
> +F: hw/*/max78000*
> +F: include/hw/*/max78000*
> +F: tests/functional/arm/test_max78000fthr.py
> +
>  MCIMX6UL EVK / i.MX6ul
>  M: Peter Maydell <peter.maydell@linaro.org>
>  R: Jean-Christophe Dubois <jcd@tribudubois.net>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

