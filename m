Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE43EFCD9F
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 10:01:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzttX-00068f-Pp; Tue, 10 Mar 2026 06:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzttQ-00067F-12
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 06:00:48 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzttO-00053c-DJ
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 06:00:47 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64ca9ec3ee7so12325230d50.3
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 03:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773136844; cv=none;
 d=google.com; s=arc-20240605;
 b=dQJ2bF2P3CmQej1GmTgivld2iVSiRZbIlLessawyXG1Rr4iwAKFWR0pX6A63nqW2ni
 Ok36dt0q23RtQrtljWaVtFbBmLxyvJflRUxvrp9+HQC9iGOKB9x3e5NoQZlLbtEjdjsk
 0H2Nq9Rqy6j+7KCNYR3jFpnPhK0YV+p22Wunh3Ik1rW4VquRhdWewvSIbyCegs5Uriid
 ZgbLYtZMfNtAsHwg9/dD2NZJQiDJ6YytiY7d3JWWoV7YMCR6qbIW5oWrnG/+kyyzWZ36
 nOaO6NBBX04qrt/Wtnxw8PMAOWIcwPV6bDWcyyJ2w8h18+QLxQ5Z0sSN+DSNuztsTiOA
 EQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vA538xkBYu+c5ZewwjzFctB957ziu1EwWSk+8q4qAS8=;
 fh=x0HrWEmKwzoVMCibxpcQMYwnZLf/Fh6D+g73IemyOGU=;
 b=UtqBzFlUQIJrtfyNzGHdN/kwqc9nKAnfKfiP2MYDp5XmjrILTS7sPjwwPlwalcC1vN
 RO4yfiSl3/kINSl/F8HfTItStJjhJa4sk/GcnNZTiBTvQ2h1pgNL+V3AY25p0WFu6+xE
 NfkS4V+t1TUo6SKFqCEFL2hxGPKusiAx/aGOonme9jzNPAYA9Byl20i/nYqyAEaaSNjp
 Wx1ddiyISlLy20SczFbqur+GkfV6mUVxpi2VH85Gwo1b5ngBWPkkVugOlQfWuXS0zoE3
 KnBu7435JkjI6XF72SYQB8yqWQZV8rahPIvutsPTqtFDjF9DXUBPULm48aTZJ7WNYL7M
 58rw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773136844; x=1773741644; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vA538xkBYu+c5ZewwjzFctB957ziu1EwWSk+8q4qAS8=;
 b=FbDOiIlA3TbIu1f/Bq3GAGhxnMGb8sp/aoCNjH/ZelBaLLFXmTl6d4nAQuwQUs+QEr
 59V36LMiTjEnEJI1/BeZoPm11qBftCNAju4APeipebtvYYCJLKhaptGqSw+NwT6HeWl+
 M240jq6Q7fvZnnYpoL0aPgh28jEZb7+flGefdCyFvmb9GnMA/3g0FDFnBUQ2IAz03AbF
 0VsYG9ztoHtYDfDodBpYubEkBDTa1xCyu2Ng7XBeiD/Za7SAJgOecwVGRjzBidpiI+Ro
 f+NPP3lfI+HZ0Ss/4bWqSmVYofCXRpzI8s7B5vRqY4m/sCYf2tkJJ/gl5QHphH5v/X5D
 PQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773136844; x=1773741644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vA538xkBYu+c5ZewwjzFctB957ziu1EwWSk+8q4qAS8=;
 b=tDdLp+t5e/qMiTNVkTpTrZoyRZOT1hvLeWUG2TX3vXYKLMJ8zXCW3g73zRPZQ6yuoI
 Arjja/dECzu0LIvuLa85YpVgodLGWMN8sgclsy6Tu0p//DoFImRs2p03e7aXKXG5UhJj
 rWmE7W/8fDvAVYvCRn5jUxtLudV3gcwnPljMqEQWUfJ5JPl0XFFOlfmMhjI8qlW59MWh
 8BqHq6Z6YsbX28T0DmhBk0fPAasM6ro/Ay/oP4JSuAA+aGIZn2xf9ZLsSZCtPfBSAT1H
 qtYvSUOSO2c0hnOT1NohJfShzLCf359Y3Wws2oKZILcJmzsuIsnOO6VADwLKhi+bnKIq
 364g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5yEIh4kE53ODOZF5i4Rbm5jPDxpCThvsE4DCkt2o09kZaykJ0yKx/9rz5iIjEOLXW9jWCTPtwWQ==@nongnu.org
X-Gm-Message-State: AOJu0YxjF+tq7ss67kS0W9mQ3w/I1pHrImNyZu/W9Ygd2WAVWKboMR+M
 4INF7Ukk3j2i/wecMupwKj9i7KrE7B4cuwF5+Q4ywQ7c38dmpRV2PxXYVXQCDKEELfdQHl3X8pL
 dNIl4Pkr/23PtCNLAsR1y6b89I+oLiMDCOl9LlDEuHA==
X-Gm-Gg: ATEYQzwe+D/b1dGTYTn2YpwPrCnt2jMDThlr+8yYX4Gwk70r0ZIxmuyqf6OyXcKTulH
 SFpDAuScs4HH+zbVej+6mFD72dzzF2ceahJUZHJrwKwyJy13jNNO55wsQxIfEJBp6Jfg//lH20q
 MK5H5E6igDGqphdLeZhddykd76rSa0oz2ldjcxCt15AB0KvZJalhL/dZSW6D4vPcZVXy9GcLcYt
 ddQ6oNvMvPDTYyerAK2L9NbgU0DqgTP6aTUgLw3pRuPgIRPh6ir+hSqIBqadFf4/2coaZ5WKvyS
 WJoA+bOR3/tspyATtNfGuT4XUM/Xgn7BO7DhTbQp3+sDrzKkK8AxGvjUpvubKuO3CP0=
X-Received: by 2002:a05:690e:4105:b0:64c:a2a4:476a with SMTP id
 956f58d0204a3-64d1414c8c6mr14466003d50.32.1773136842691; Tue, 10 Mar 2026
 03:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-3-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2026 10:00:31 +0000
X-Gm-Features: AaiRm521S2O4yW12FYeF5vn5OVw-337c587GtbvWBH-2aPT1g1EoBsPEuS4-f5M
Message-ID: <CAFEAcA9cfiDB3+=K+MsHptujVhcPexwaf+1y8kHaV692ORAdgQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/arm/fsl-imx8mp: Fix parent of ocram memory region
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Rather than having a NULL parent, let the containing SoC object be the
> parent. This cleans up the QOM composition tree a bit.
>
> Fixes:  ("hw/arm/fsl-imx8mp: Add on-chip RAM")
> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/fsl-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> index 0119a18416..839c925e4a 100644
> --- a/hw/arm/fsl-imx8mp.c
> +++ b/hw/arm/fsl-imx8mp.c
> @@ -671,7 +671,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
>                      fsl_imx8mp_memmap[FSL_IMX8MP_PCIE_PHY1].addr);
>
>      /* On-Chip RAM */
> -    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp.ocram",
> +    if (!memory_region_init_ram(&s->ocram, OBJECT(dev), "imx8mp.ocram",
>                                  fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].size,
>                                  errp)) {
>          return;


This is a migration break, because qemu_ram_set_idstr()
includes the qdev path of the owning device when it
creates the name of the ramblock for migrating it.
But since we haven't released anything with this change in
it and this board isn't versioned either, that's not a problem.

-- PMM

