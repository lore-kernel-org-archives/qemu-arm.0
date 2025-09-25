Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60E1CAC5B1
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 15:53:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1oHL-0001P1-Ez; Thu, 25 Sep 2025 11:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1oHI-0001Mr-Of
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:53:05 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1oH7-0006Na-67
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:53:03 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6361a421b67so846294d50.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758815567; x=1759420367; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ej2kfEenYWciEKFeoUnTaoZstIz+4FcxndwBUPyD12Q=;
 b=IZyYVlsAeQ1eJwlOs/ANjWYfHzV0VarLIXIeQXSZgg5ZFX0GQNTIfIBIyrXgrFNc98
 /YXqFVo5ipKUnVaj6f/OApkhfRfK/Ke5DGBl6N9xsSkMY5WTQH4Gv0OAktT7tClBY+sp
 HL2b7cwrp5Yw41MYkZ82l/ElxZnAKkWpgFdiWUl1o4gxaCTCXXyIMbiCo7rs3XxvM+Fx
 HSFnxfMsCo4XL6DnT2EaLiQonCB1IE2iyru8VnJtdcDE6Pmsy8KeLSIOz48Sy/P7VYZd
 KsKq2xkg3VT6apG+aCb0SPE4It3AK7FsFuV2hGOKx4fQATHXMdd7fIZ4qQpBVIFhxgJi
 Z+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758815567; x=1759420367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ej2kfEenYWciEKFeoUnTaoZstIz+4FcxndwBUPyD12Q=;
 b=UF6d44tder+cJb8/29Pg+PgnUOmAUWUGU6xsk9Ezcf/NnOkTxON/oN2fY5tTkULaED
 KR7ic9Z2XZ0hAweF6F8u5Uj/KpeSuxxnTmx0lddTP6hPStQRqJ9c5fxb3e1NDIQDafCe
 IR3X7m3uFl7dR3sP35x17Yzrk/nsrrGg9hY8GSalEmV4mkCQwDu55Xao3dIqgePqYLdl
 LmVKTIDBZFySknf8NJfSNEmHA3Xhi0nBsmjn1hGBM0EhWNv394cr7xkSBdUKDEt6wP9X
 5k2Yuy3I2u1iOe7xlrfzzNCELhnupEhNEGasLlw3VQyVpvE0jxFAIzTrzOAdk1wpcWn/
 vWzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ANYao24JcADxTbX0JJQQ1ePyitzLJUKHT7dkaTVnBimxKrY8Df2o1/ZdLvECoEvoiG0dKpe+fA==@nongnu.org
X-Gm-Message-State: AOJu0YxxsnUUJeBzh5onJWkV7QoZzr04FZfHdWFDYMnxuwI6H7yoDEz0
 cHbFzdzMLNq3+wiRfCdSTqU5eK9JWWE4MOo4oHzmldDnH4Bawb8z/r2AVBpEtJeSdRBlMl+rT+Y
 Hq4Jhuq4TW+dO7cHushWS0xD7FULrk8pcswPIMklviA==
X-Gm-Gg: ASbGncuk9iHY27RFe7O6DMjolLrXE+evYB4MUIcrwpy7XlTKnRNIj7DKiMSS1T+4B9x
 bynjDbhGw+RyGKRJlgtpV3eDrAYmuf1abpO/ZGHm/5Z1qihLowrwSg0DhHIPnoh5pLxfz6XVR9m
 gj0/utu50JxGjoJrKjbIwrUk5tvfBPBtu7aOdBQocx3olCBL7y+TpnAvLv7ZPDPXlrOuNLivVbg
 HG7dA/y
X-Google-Smtp-Source: AGHT+IHXYAQgBKbnb1wbhQA2Pn0DLxK9OkJzn87QvnaygyapBcMB7RINmXNTB/ABdIbdhgk02EMuAAQxtZEOV2gf8os=
X-Received: by 2002:a05:6902:f81:b0:ea4:156d:2cb6 with SMTP id
 3f1490d57ef6-eb450183d5bmr1079844276.7.1758815566646; Thu, 25 Sep 2025
 08:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250915085914.526890-1-chigot@adacore.com>
In-Reply-To: <20250915085914.526890-1-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 16:52:34 +0100
X-Gm-Features: AS18NWC4WXsnS36G6XByG6ymozPxaYFldqbo3Zjg5KqwJYSx6eHR6inPLbt1064
Message-ID: <CAFEAcA_nyokFvRx=ckattffrM9Y+OGRv3GmdYKNvdJdzuXxWKg@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/arm/xlnx-zynqmp: wire a second GIC for the
 Cortex-R5
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 15 Sept 2025 at 09:59, Cl=C3=A9ment Chigot <chigot@adacore.com> wro=
te:
>
> From: Frederic Konrad <konrad.frederic@yahoo.fr>
>
> This wires a second GIC for the Cortex-R5, all the IRQs are split when th=
ere
> is an RPU instanciated.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
>
> ---
>
> Originally, this patch was member of a wider series. Other patches have
> been merged since thus submit it back as a standalone patch.
>  https://lists.gnu.org/archive/html/qemu-devel/2025-06/msg02328.html

Note that I am assuming that one of the Xilinx folks will
review this patch.

thanks
-- PMM

