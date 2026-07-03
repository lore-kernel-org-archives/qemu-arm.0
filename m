Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E20C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:59:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfafz-0008GG-Cp; Fri, 03 Jul 2026 05:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfafy-0008Fv-A1
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:59:14 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfafw-0006MO-UZ
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:59:14 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664b3831a20so538721d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783072751; cv=none;
 d=google.com; s=arc-20260327;
 b=ABAfRbHSJ7xtwMbr7SqJbipjYzfrPQnoB9fCkre3Krp1BoqFVmXXcH4AfU2r4avF60
 beoeFT3YwBmLA+4k+YsnRaASo6O6OqqPuIzfiQooke4Q1wqdE9VuEF862dye9Sz+C2mw
 7wLrD3VAPDqBe7wXy3yt8ANXvNlt355eChYxAf+RknV5dj+Q2+WVqk+1vZki0Sz4bIE/
 DgytXsW2M0nKuW87ABL7EjMvoLE9FA3+JHSjFU5iI8dzZRyUJNsd8rWpO9Zj9fPS/TqE
 MRGj08XGNmKpfxNuxD02oWMURyYk47GVGssWlTcKbqtCduZ2mvcfcz9NSSxlVYGY3O0l
 j1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AoiTYKPuGd8/4vXTOmKUZzPml9GhwnmxVTdu+0EkMrg=;
 fh=UV+tyUv9YAT3+6FrWIT4P7J/ND2Akd1HWepJMeWUlD4=;
 b=CsElmGODzAZ5Lo76YxqF8qR63eAKsavTntdjoqnYLFKRob0Hd06f71wcf/eljJ7DJG
 3Vx/zOZA8HhWN+ZCDfSdLvv9zdGtjLXzTwbb71qr/itcXeVcnWz9IS52LnruaymM/MkQ
 ruKTmYVTaYMV5X0fdJ1MItxXjOCzOqcAWsLCh6TbA1cOZq9mtVI5hX6qwmkqDG78IhXJ
 yIt/Ovn63NlrVgZzq8ntSOtCCi4q1XIaE/stASbxohdDeifd+a+p+vB4rgnK5Cf7wPKj
 IodROvqCvhwc0iGMFDnsOd8j0zbIVkr/xC8/hWv9G+pACQ0GSuSCDq5KdF2XhI6qjgeJ
 tytQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783072751; x=1783677551; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AoiTYKPuGd8/4vXTOmKUZzPml9GhwnmxVTdu+0EkMrg=;
 b=jsNeo/Y3BoXoE3xjyoOOdFokXFpHxnLy3jlZ+bMGUsZ2Vgkxyfay33UHRwyFLuQGal
 V8uu5U2SEi/PLcgVaQ+VnFtDZw+hyrq2GQ1kJdgsVf4YZZqlRykWchHY4Jiektyng/9o
 Ykta+UWCazxiZU55VsbFlvMNtScvc246vvTd0KNcwPYoU9lYRumjtvmnfTNkUMP6+VXD
 RanMVzaTfVWG2MHOws0oAPBJfn8AOfq25hdbr2c68GfKoMPYg1rriwFPGeHYkamvVT0h
 0+NZNkQGR7G5ZXZ2c4Dl3/7thUpHaIigIy54k0ovDpVcBpQ/Q0FMZijZeL7vCagguo9t
 PrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783072751; x=1783677551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoiTYKPuGd8/4vXTOmKUZzPml9GhwnmxVTdu+0EkMrg=;
 b=mWHkpzZZD2gs7vuoeWk5C3hRSkml1jj45E2rG1+H9cVZa77kDKvEsDr56rQOk7vfuH
 bob8+ufBmEXel/Q67f8qGyt243neh4aYiiL6gpOfm8+vCpXckiO1Zj+PQVDOI82nnccF
 5I7lRRwEyLeYbd3c9GG5O12uve7p8v24q7E3B7KMqUiDmbUaUrvgZuxP9uB2x6YPNT2w
 DTKvm8gmrUlo2sZkJ3Oegp98tU3YWRkUhy6vIGjhwXtg5zEVVulA6u2FSsqMcJERzJTE
 dW/r22zd4A9/AX3Dn6Iq736Vb2IjoOD2xPlR7+oyKLBi+6Tyepyx9AX2L0oD3NgawawA
 ENrQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0wlMbCNJCC73R+czmsV5+Q/jmkDvGMKfW+8yItInw9BxcGJByUKoXqkNVDjENSIBRyW5pVkMF2w==@nongnu.org
X-Gm-Message-State: AOJu0Yyo8I6PiWaHSZ2lLHKoEmvvTKDwuNY/ODmJZSWcolmaKq/uxDKR
 6umH7Ayu7hlplfn+sc3k2jmXwWKbRJCPGKGKI8enGIzi0ZjL4HV4COPToXhH804PmjUJhOp9gLN
 aXEjC2AS7r2aVt8a02GYCyKLvBhR/XaawE4qxNIYq5g==
X-Gm-Gg: AfdE7cl5dR5MS/dNZ6gCBd4mFfgxFv1jfGtnpG+sF51VSnZbn9QBX2fxAWzUmKZCs1g
 dcEfJc9FsYTbmRcsxpZ6h5LXxirljX7GgrO/T+VRkUMc7ETJcOHyO+Q9Y/kFzQEu0PAhfeG3yU+
 Rr6b9QKzZKtBx0sX9ev7NT1KiCdhqwGJDk1GUme9DIQrab7STtpQWhm+j6ayE2ZCg73Q+zjWMWP
 SN8s5BtKiT+t4HkmO5pdLKeuMnMwr/FMzqTWH1YcPAYNvCNPXhEbHdqJ0W95hnK/ndKPdceM6F8
 XKekQgtKOkd5uqvadgcOCwXNF0lYTpb37VGNFWMXbFNaiu0V/zGUcIju4cDoc94SVTw=
X-Received: by 2002:a05:690e:418a:b0:664:ae6a:e9a5 with SMTP id
 956f58d0204a3-66521d54781mr9218668d50.75.1783072751406; Fri, 03 Jul 2026
 02:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260625161855.5132-1-163wangjack@gmail.com>
In-Reply-To: <20260625161855.5132-1-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 10:58:58 +0100
X-Gm-Features: AVVi8CfGHeq34WW-jf92qKhEhtKsmAIj3TkjRMaUcE1sjTGnf8dQKdJIOE5w9_0
Message-ID: <CAFEAcA_iK1yK2rM+0mDc8b4Y7wYNsmsd4jrU+0Kxkr4_FuAsbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/misc/imx_ccm: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 25 Jun 2026 at 17:19, jack wang <163wangjack@gmail.com> wrote:
>
> Signed-off-by: jack wang <163wangjack@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/imx_ccm.c    | 18 +++---------------
>  hw/misc/trace-events |  4 ++++
>  2 files changed, 7 insertions(+), 15 deletions(-)
>

It looks like you didn't send a cover letter for this v3 version,
which makes the series harder to deal with. Anyway, I have
applied it to target-arm.next and fixed up the compile errors.
Thanks for your contribution, but please be more careful with
testing for future patches.

-- PMM

