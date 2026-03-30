Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BE71061B00
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 14:35:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7Dho-0003OJ-0q; Mon, 30 Mar 2026 10:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7DhT-0003FC-LY
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 10:34:46 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7DhS-00030e-71
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 10:34:43 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6500040f172so4859796d50.1
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 07:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774881281; cv=none;
 d=google.com; s=arc-20240605;
 b=gK9Dppv7Frnh0vhYej7oE7bl8oJpNcSKk37cNIU0uLuPbkq6z2aJ8G2oUcC3f2Jjy+
 Z9dgjcVVpbI70LXmCD/rPsbuQi4AjSSFkZVJCQx6t4zX6Z+j55nJBuYFcs5H5/SwDVpL
 64T5/ZIhS44C6QkH7FYwC1znmQ94LRUS0IATmNOIKuGfu+ygAIu9MU0GXhyzJHtAyCcs
 YqmhenDqiWveZttoUbC6cgdI4WS0LLH5eta2iuP7TO8tiS0GOBOVzNFjXtL7j3Nmrmmv
 s6EIl4+y6k+P9EogqU9XzgkmV1+dcVt42uyrMpM6nZfNOJaR2M4ejrC78p/lqbs7Ja95
 SYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xfIDoX2tZ9PCNuGnIeBtnGzuBkj4vnFxxssiPbLK1E8=;
 fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
 b=RLPXh4TQwo5B/8k23DhoygW7k6iggNJLgzeHd5fgg+mVoZ9rNXk5kfzc0bFPpXBQy2
 4ViPbbH5tjeroO4qmyMgw72WIFM89Mwdl/YmZCo5nkuaPMt+MuYTyDkw9xNOKF/8NjjQ
 BjG92b0rlqsgiiiUqwJsNgyCo/Q6DoFIF+p5j2/xgLMb8yI+5/iEnBgMgewjGm74bWi8
 nhLOh2+wpDNu7IvWWoRKFVoM8FqQYy3XY1QMSlIeyw0rx033f188gC4DL7l+NB+bAkSR
 beoDRIjxcy35Gsfp+Hv8Btaj2HtNM5yKfvcf7abYVgZuISgX4/gxSiwJ2Ky9w14QZnmW
 vfdw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774881281; x=1775486081; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfIDoX2tZ9PCNuGnIeBtnGzuBkj4vnFxxssiPbLK1E8=;
 b=UJ+7hHcZpP16BbV3dH2JT4oN01nreUShiXKBqME3FIXsLB83hOKJUiXduWcIKGK0Yr
 usuUxCH9RpcxjBdBidtAAqZOufDPlCYKzuFn1iDu47EM/+Jyp1twC3CsAxJOtaiBAozB
 u6WrT8t6u854U5qZkebDDImhOUdvx8kNgS2+HlLb6DHuECHXmErZa2SmRtpm265ADAqn
 TaeVv9/IGfhD+XaPPwZrafO3EW7/1VJyOAKT4qsDlL75lo+OBOtdzGT1i5H091ngCdMG
 wMX1Xs6rzFv/Po1eXFv5AdczHEJ7aXEshyIt70/g8PCgzQJY1gapuaaSrZ9KiZtSKk/T
 ROAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774881281; x=1775486081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xfIDoX2tZ9PCNuGnIeBtnGzuBkj4vnFxxssiPbLK1E8=;
 b=mqjl9ZrHpBqrK4kwbaZLWIzJMXPXlgj+5xDS35tp75Og7eIqRVgYNjA9BjKEaZ8q23
 eI7053N77HPB9fNTp/hdDYmW2v67FqtvKeJII8U9O6G+Kw8nlP4owg18SsAKDwTWmFRq
 LZy6DTrf4MRc5u7IcsSqsqgoVyVV5HD+KOZYZ8mpQ2czkKvALWf2k0SWAAnwJZD+HUYd
 8og4/V8BepJHguddTwaSJNi4m69G1UGY1gIv1b0M9dcRVdlE+J5HUHnDY/8sIQGt6/5U
 vUSSuqvcBz147njUbk0LTjQSFdAW2NulCHHtI8XGdlYpEA4975NRBKoHd97HGNacydPX
 uUQQ==
X-Gm-Message-State: AOJu0YxgCtsBGKyrVcnGJJpCtTP/yq9O07WvqbMV+2YfsYxpUH5RvQfM
 wMetQGrdir6pndqgq5+urMgAVnzV4cL5XOwezb5CHjrphnoIhW/nEvI5hYOdIlWQW+/Mo9uzAK7
 xGnLRODUyViVEa3jyhsFoRlGyS4zq6e4o7qgRSkF8Dw==
X-Gm-Gg: ATEYQzzhEzZ0cd1BeSBlbTh9PaKAjT7JWdfUX77BWbXsjBz69sy8XVCG/UR078+nlQh
 EfW3xt3XOPSLfQKCHVRbaOqPboDnVMfuWQGpvxakdFFB8P5z06Bj6Y9zP/GJ4J5n+PCedBxTDD1
 mUm3UnD0pXKyIXHOK02/gnfDhhDCQAZmMfg9I9rj6HSZMfcV2vTFwFv4kHc6Eu+CfkkzY9Bj5JG
 djf0K4Xpootbys+HmW/RhZrIyjuMlFHhX8XIVy9UngA/AmT9iIcVP0RkPLz3ocah2Ef8GKsaQGQ
 Cve4UkjMylEFbyxhX7ti1NZ/uMYZfC/ZuBb90EKFSxAHJBhDO8k3XQnd029edhO9+fo=
X-Received: by 2002:a53:d24d:0:b0:64c:eb9d:d331 with SMTP id
 956f58d0204a3-64ff741cf72mr8610250d50.64.1774881280746; Mon, 30 Mar 2026
 07:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260330114853.638753-1-clg@redhat.com>
In-Reply-To: <20260330114853.638753-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Mar 2026 15:34:29 +0100
X-Gm-Features: AQROBzB2rErDTJ2EHX6NmNGHuRSDgC9XuaCmnizFDUZ232MsUyzOVO_5wSPJrVU
Message-ID: <CAFEAcA_sBu+A3hv-aFCtEa5uRBHzfkhwhW0m1VHDqiR711u_Vw@mail.gmail.com>
Subject: Re: [PULL 0/2] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 30 Mar 2026 at 12:50, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit 91f6a9cb1b0f11afa74ef7fb20d5579d9dfbe0=
20:
>
>   Merge tag 'qga-pull-2026-03-27' of https://github.com/kostyanf14/qemu i=
nto staging (2026-03-27 18:41:05 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20260330
>
> for you to fetch changes up to 9160305d92d2750e6ca3ada8f048305c9290f03c:
>
>   net/ftgmac100: preserve full VLAN TCI in TX tag insertion (2026-03-30 0=
7:36:25 +0200)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Complete lost interrupts fix in the Aspeed I2C model
> * Fix a vlan tag insertion issue in the ftgmac100 model
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

