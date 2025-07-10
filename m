Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770EDC83F1A
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 08:25:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZmb1-0000RF-FC; Thu, 10 Jul 2025 04:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZmay-0000Nu-IF
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 04:25:32 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZmav-0003RX-WF
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 04:25:31 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e75668006b9so670755276.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752135928; x=1752740728; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=acgHka7sbRr5uiNsPDx4WOnHScsSttI1fU0XPvU2Hic=;
 b=laxPbsK1PC4iZk89jrFtLG7oggzayOvUAkAzr5nc6BDBHcdpo9S7HCTNmN5LeyO03D
 m5kPdmBKWerPcgkd9+qDMoZ+GruCFQDu3hLCMxb5zp2mFXgyPSG/VlCJyg9pWQiOw+Jc
 rSrFUDWCCCygT4JKvXEXhLcHmLSPwT6kfTAksvQ8I5bi+nyRM9XM1rnGf94tUvuJqQ9m
 Dw8IgW8aHGgJplAVNfVWVqZRcjsSLCcSe7ReHMA/BGccyj91F4LzisuTH3R3kh1LyQXx
 Uk5QOIDtvwuR41MOJPYr0yfUdKOg+7UsYdtFn/iyQgYZBWWR17mSwFEoN5PnVRzGrSCJ
 tY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752135928; x=1752740728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=acgHka7sbRr5uiNsPDx4WOnHScsSttI1fU0XPvU2Hic=;
 b=CP4/f4Awaqheg7gQj3hSpaRnI8JSb8sys62yf32wszlDjs5SQ4fUNf0voTJmVNCp03
 u4a5KuCYU0KSpXVVWypxcwyUSa+eG/zLyxjiv5aHqLodkEJaO3KleB2x5ydXfuhPtjF+
 HFHY3KR5VLDUtUH0fyBvxcW52g76OuW4+IBSx0S8lw6ewHZ8AEn67sCpSyhUkQvNZC5i
 phILTMRAZOhMPSwHL6Adv9OBPJVYto616+FAxmld4t9RGPk7+YOdD38xyJHarVEheHx1
 Ueomg6RQ9aI0YzyZABD5+Ww9ozg/tZpZJulo/OWFvUG4r6pVGJ60RtlyBHnEsXwWFPQn
 tbCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1/SKxxFQfrisSAwEkPzCf8+bxvxSIM08jpTfZPaoTUMqU7NW5Jcvgp9YHzoDUKk0YFeu3HAOsaQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw/Rny52n4BBFhf5wjfQaJvOxUCQL5aqCYP8+IcctWW8KoHA0WD
 oYTL3i4skVOI9NWLMJY6RIb2MPwQWzPgzpoCGxiYuYp5o7axqMurKgCLBVNuO9qRGX/ZyDUbFAW
 XSQk5HbqF6T6IVovd60+e2+veHzJjjoKHjFVf6eOjrw==
X-Gm-Gg: ASbGnctnqLdyuNPwo77sBdtu1XhDs1CYNDr6tuaSOEzsP3sn+mFG1paCOwcP7O/hS9l
 B75zpGmHJM04VGg5LY/ec+E47laCawjP15ETSO78RVrnY11JR2y6Qmt1k8bsS2/SgYmxe8NxTpG
 e6vqU4sHg2wl3EI12WudUFnVbjhDh+n6FpuYRfHzAnQj7cjQNN8wAQ0q8=
X-Google-Smtp-Source: AGHT+IFpRrcfF8Uk0+C5Qe85D0WzINbVduSwEAQvOAxN17bJY9x9ODZXksSGcixYLVZSPmife9oyJdq4bvCtbI9U0jk=
X-Received: by 2002:a05:690c:62c1:b0:712:e2b5:e61b with SMTP id
 00721157ae682-717c467e425mr28819237b3.13.1752135927587; Thu, 10 Jul 2025
 01:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-2-shentey@gmail.com>
 <4c966437-91b4-4c07-a07e-1a54f51329fe@linaro.org>
 <770CC742-A924-45CC-ADEC-1300910B2AA6@gmail.com>
In-Reply-To: <770CC742-A924-45CC-ADEC-1300910B2AA6@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jul 2025 09:25:15 +0100
X-Gm-Features: Ac12FXzKxBD16uElk1dzBwMfHruNNN8aHeClaf_DlyswXYttT3AR1WZS85APdX0
Message-ID: <CAFEAcA9=ay1WTcYn+xminuwDGYgpPGn2_gDzQ49tPN184yz_+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/fsl-imx8mp: Wire VIRQ and VFIQ
To: Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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

On Tue, 8 Jul 2025 at 23:29, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 30. Juni 2025 08:59:22 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro.org>:
> >On 29/6/25 22:48, Bernhard Beschow wrote:
> >> Allows to run KVM guests inside the imx8mp-evk machine.
> >>
> >> Fixes: a4eefc69b237 ("hw/arm: Add i.MX 8M Plus EVK board")
> >> CC: qemu-stable
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>   hw/arm/fsl-imx8mp.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >
> >Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Ping
>
> This patch doesn't shift the security boundary and is already reviewed.

Thanks for the ping -- I've applied this patch to target-arm.next.

-- PMM

