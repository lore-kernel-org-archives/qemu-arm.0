Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05857F01832
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 12:55:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyUi5-0007zG-VB; Fri, 06 Mar 2026 07:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyUi4-0007wX-B8
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 07:55:16 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyUi2-0005xE-D3
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 07:55:15 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso7838382d50.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 04:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772801713; cv=none;
 d=google.com; s=arc-20240605;
 b=iy6Bqpmuy2OPar8r3rkqhkM/b59f+MVmiHlA1gtrJXBSMUy+5hS0GgrLEXBC5M2wSs
 f4a+18k6WgozD6psdzeqoGvKN518BrC5+0hOo3djoY0e9wYqE9j5eb2bsmfCXMr9zDcE
 mW6YH3UDVvIp334PZ0dO/RIIp98DpTXneS4ju74hd34S00EwlseBwMJf/mu5oDjBNY8p
 IG/lC2J42XvtPRavOgf+edqCDQ0cx6CgC9wP/j8h02D6fMnvbkiPstK7xjaPB+yxCspb
 Uj0TQqOzVQd/BIwO01KxSuadtDF1/kByrMNmlMHrjEl/KOnWwNTyN8d0knLlcfD1chCx
 ln+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zLZ5XQi3wxMRFR5Uc3e80yxjBAASCbrgfZjbhYmh57Q=;
 fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
 b=iB/mrdkbrNz38Whi4aAJUbA2IiGk5ZC4mKQwBbnf5e2jydyVQW24sY8w1wc0tW0Xol
 rmzLFnbPXcM+JcNfvONgVmNeOLPe+qrx7ids1f18n6KPex9g3O3g6MSyW2C3pLbv+ws8
 e2ZslWlQql21kFLzvfTNJgTM2qSCbe/fdQ8oDRKZ9wixHD9P/rOF25+d47GflE2jXRIB
 crZ0EQfA7NaOIq0CBlf2xVDvFYOinO/rlxzWvTriCM7X9CQ7LoBmaNqn4uwyHRXdpj95
 hhJAhRP65GsgODFUPwkLJUS1xbbkjNoMudtplYGx/u969ie06F1qInnDpkrYhop3zKSr
 JUgg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772801713; x=1773406513; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLZ5XQi3wxMRFR5Uc3e80yxjBAASCbrgfZjbhYmh57Q=;
 b=vtxE1R/HDdiPo4dcVzBE4nUnpb1iKCTs7EmsAbqoa4OTUdUHsBlTuOscK+CEg8vUHE
 EDnM9MiOEf+GUBwIQKhiAiMoWsIXsuyW6tTraII5yp5CB/9T64ezMTBUkqDUMCsjgd86
 lK9w5vmwud/GXa31j9jaoXy35cN06i1iDdAOBA/2N4XawXIxb4pjC99slHFKL2QWTc9r
 inOmoesCskltNunPJaQfJyf8H/uwAdy1OUEcHb/Iuvt7ckMmNYZd5UEHrHk/+qVfEIsy
 F2LOAhZcAePRLXmd7klv94Yy/bh6vd3BICF82FicvWt+0Z1hbstJAFkWhjovJRmaC0Hr
 oYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772801713; x=1773406513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zLZ5XQi3wxMRFR5Uc3e80yxjBAASCbrgfZjbhYmh57Q=;
 b=RXn6EvLkVTFC+K02JSoSgXCoWKSKMJ+ORLxk8uWdlMwQk96lMxSm+hOdD7PwZCyIcR
 3BDshvr+046pcYGZbSGUnLK2tT6G1Z9cZ0eEbWWujVwy8bxdWJZG1yk+iYoL3qsXYbm7
 lqJIwikGwCnmyaqTVt/jFk8647PVK9UBur1CIpy+7v6v2jlGGOn9RNhha5/JM/amWa2a
 0/Fhspeq7Bpn20jJ9A1Ipe48PeAYftgcyd3fsi9XRZA42CyEyZPYRuhl43IEjs4K5soX
 1UU/7F251RZ5o/AyjtugJ/jiIqFW5vGkeAkZk3SYkHrP+cwkScsMo4ux3ganFm4Ret73
 NZ9w==
X-Gm-Message-State: AOJu0Yywz2D0J6QXS76ITC9ditfHKFzeRp2Ukqlu73RUe9Ahatl1aEiJ
 hq1jV9TNjP9NzZplHoRZh42TEmMDG7csiq9GDFmFJ0Z01BdTsmMbK0d8hQrxvNhZFbOCOK5MAkz
 kAeUPZt6g/cvvh4Q4ia8pjLYqIdS5mtqySSPycPipGg==
X-Gm-Gg: ATEYQzwQP2MUwSJSSwVCkS0k1CqMTHqAC4lFS20P0NsrqogmDU4gzACgssfbUlk6Myw
 Wnkihw2H2lYiNDbFJulgGR9B8HqaILMUfs2Zns1Jdzb5Gv5fp6E3o8PA7EpNhO9I+qux4oZoNSH
 KxtpJ0Z5+wSz8B/XxKXlwM8c+BSWCjGNocLIcUW0VEWGEbtetYNxdLFPHCzAdGJ9Y4F6t9/m/qH
 +QKPU0WKSewQJ8Cn9rshAsZRJzHndosClRD98bVjUQcNv9631jQRXe1gPsSNZGkxJ5PASL4RZKw
 SVsDiRhH2YCh20tgb6l7rRsG/39HtYUlpu9phnu8oP59Z+vX58vCE9eMlnLKWlSFF8A=
X-Received: by 2002:a05:690e:191c:b0:649:e501:21af with SMTP id
 956f58d0204a3-64d1407efeamr1690715d50.14.1772801712546; Fri, 06 Mar 2026
 04:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20260305175711.1119025-1-clg@redhat.com>
In-Reply-To: <20260305175711.1119025-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 12:55:01 +0000
X-Gm-Features: AaiRm50NA0K-bBGJPO62ii9Vs0LBZqUlrHmxj-_xci6bijdT2fZbOVV5-Eqn8kE
Message-ID: <CAFEAcA_dAZird_b0kPTaSDu0oBPyBkobj92xw7haQJR53jvgKQ@mail.gmail.com>
Subject: Re: [PULL 00/38] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 5 Mar 2026 at 17:57, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit ae6e281633769bbc7424523d0ca1163e214571=
ad:
>
>   Merge tag 'pull-loongarch-20260302' of https://github.com/gaosong715/qe=
mu into staging (2026-03-05 10:48:38 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20260305
>
> for you to fetch changes up to ee357844b13904a826ffa77834cd08e10ba1e9ba:
>
>   tests/functional/aarch64/test_aspeed_ast2700fc: Update test ASPEED Open=
BMC SDK v11.01 (2026-03-05 18:47:46 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Add I3C support to QEMU, add an dummy I3C device and extend the
>   Aspeed I3C controller
> * Update test ASPEED OpenBMC SDK v11.01
> * Fix DMA64 address handling in Aspeed I2C model (AST2700 SoC)



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

