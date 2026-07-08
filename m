Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7F5C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 15:12:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whTwW-00040B-MQ; Wed, 08 Jul 2026 11:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whTwV-0003zp-V1
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:12:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whTwU-0005HX-F1
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:12:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47dec32798aso830690f8f.1
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 08:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783523524; cv=none;
 d=google.com; s=arc-20260327;
 b=IKdKtMFYVpIktAjCSFhiPSqCFHeN7M/BIFKvDk33r4d0LZvmqahjFJP03uvkToiIWw
 fUDYcukfxmJ8AGeKeCC3D88PdvuhuLyBemA7uFtQ2vfyhz6INsK6X6KPI4Yo9JrXa2Wz
 ulPBFQ1M87EiwklVrItVHAwYH9Zuu6RIQwA5c3x6nWzEFMY9Sfm2sp7SW0FG246PqST9
 t7d1k2/Yo2yOtjwTS5s0gvbQEungkRBujc2YLLPce5fZDsO0dNi02rV3BF0hw3iZyr2l
 CKwJ/lSu4o5BbMajDTF23jm7NsvpsZm+6OTeWpuwjhy9Hn5COxYRlTtaN0L3+4XRv7fK
 0UgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3a1hWsoVamXx8LIAPUq012ps2y8ekTt6uWioV93hNlk=;
 fh=4Fnlp//Anbscs5yJSDyJdDsb5vQx/3zvaunsQfixbjk=;
 b=b9XaHp1tCxVM+vNpiwL2+HN2FyNny8l93HIkeVdq3If9DgYBznN6CpmiLNWk1mf7td
 PD41lBi1kJXsJmCqotNmQ9YjIEOKEmzjqnQ1MzBxkINnh3XesXzNiULE43NyarfQVdOy
 G7BA76u0ZWvBxQ3sWDztzzpfNlkvcsNFDmM78rWNm2+Oy0Uq8pblP/+OxmtqQeUbQ5oL
 SkHiwWZZCLx+QF0hBEEXvkLFQep/NFE6eRbKo2OTycO3jIxXelZe2SbPHG1D5yIK9OGI
 ZhMUX59Yr2mzfTTgb1EfinasIewks3WbcFDcAENYCtWP59skXV8gic3ZJJqECJB8ZT/R
 Nb/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783523524; x=1784128324; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3a1hWsoVamXx8LIAPUq012ps2y8ekTt6uWioV93hNlk=;
 b=eilNnxNKCwVtW3X1Rx2mNa+x6DZoPawlXJ417ghZ0gWuP3clAr8swCqPuGaJyUPMhP
 I6RCNr0xh2mn8ZoRw/kLBXHxdE2oY3f0B7PK2PHAqp6cb9gqxVGljLVawU0uDKXq0jw3
 zImG8COEtO1043dcRQXN7/ue3naNi2NAC17WSDP8dhCjpcXwmiaThaa4SFMHwXlsaO+w
 +ECKzKsbO/O4g9Z8Kr/BWyhR7kvPDLm0iBbWNnj3EafU9WY1Dmdqex9FMnfJcovhCYGy
 dKZxIuAeokTYyWRJboAhq9SQ9PLiibAo6l09Ej1xWiYCKxGrsEjJnObFxcJ/AA5dhL5T
 zpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783523524; x=1784128324;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3a1hWsoVamXx8LIAPUq012ps2y8ekTt6uWioV93hNlk=;
 b=HTYK8wcv3q0Sg5jpG911H6i8qqdaaWcByrlZcFFxPtFrZb7AUj8HIEkbiG5NVdRASx
 0V/QhYzS/t9lgEmeqP3psiMNo9Hb5qI5Ivy/zZSlSqtUBZXmDpQW4pgwLHmrexqbgxVJ
 TqoG/yjyu/93BocudHTiBLwYaHvM1j4Jxu9IHuFbtKHHFWe8hnkezI2rNnKYAYNIXG1R
 7AXnJmkO0X4UQrTxQVXlzmwj80hW+mPLQVD1FzgMW5SySFUHhlhjCC8suI75A+0hnYvZ
 pJu7f2jznAULg4fD660GEZDdPwrx1Dx0fjDfcLMF8XHHh8TMGCXigp5MTNk1ReXXPy0W
 iYaQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpT+3jbdEAE2eBaD1V3Qpbotmdx+BAJv7CkGpqzztHEgB39u1lxpIKNYdsqLPUmbM/Qvypitu0qyQ==@nongnu.org
X-Gm-Message-State: AOJu0YxhQN5h6ZYzeGOAM1WMbspAYYbwRASj/K6Bmvnmd/LHJeU+uDRG
 G2CGBwtXnZCOEDM0Hmb5zXl4E5tRVXyJmzlgUj5Rc8i3vW3BwS7gwtzNiXIjyryURKYPtqJH7VQ
 AQG5XlifMj88JD9rPHWeIR4PTRo4E0n8=
X-Gm-Gg: AfdE7ckBp/jJ/71JS7cMTwFbNC/TnUrqvGzQNF7se80GiVaODonAOlwdaNMuf92LOXY
 6IsaSu7y4FsFilrO/XRG7n/LYqyMCRAqDZZjyIvY0g2uiBEGqIApyUdF0/b5aovMXBfl2lN3gvq
 cVFks49G6dO+rEJ361kMrC9KfjbY0uc86XxkQHgMYPmkqtEIcI1mdT2usFaffPt/aBCWjqkmK3M
 qeO9Vv4WnQbCdDAz3ttWxj7bUo8Ch6jEVxZls7GLyWh1aYQkDoBb0E3jiRD+OIaTJupGJfPB4JE
 fulT+4BjUQ==
X-Received: by 2002:a05:6000:4028:b0:475:c578:b619 with SMTP id
 ffacd0b85a97d-47df0797e0bmr3537040f8f.30.1783523524102; Wed, 08 Jul 2026
 08:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260708111544.1440761-1-clg@redhat.com>
 <20260708111544.1440761-2-clg@redhat.com>
In-Reply-To: <20260708111544.1440761-2-clg@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jul 2026 23:11:48 +0800
X-Gm-Features: AVVi8CfbYt3qSsXmCFYz__O7sq8kAHfp2j05SKOTq2DUih6oFmgKDry06GRsE1g
Message-ID: <CAEUhbmXns11jBwfc5ySZkbYx=Ss3ytG3q5VAAG1D+yevXfKywg@mail.gmail.com>
Subject: Re: [PATCH 1/4] tests/qtest: aspeed_smc: Introduce read_page_mem_fn
 for page read helpers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@processmission.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jul 8, 2026 at 7:17=E2=80=AFPM C=C3=A9dric Le Goater <clg@redhat.co=
m> wrote:
>
> This to prepare for fast-read variants. No functional change.
>
> Signed-off-by: Cedric Le Goater <clg@redhat.com>
> ---
>  tests/qtest/aspeed-smc-utils.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

