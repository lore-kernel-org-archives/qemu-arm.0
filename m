Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B05CD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 12:38:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSZzw-0003G8-Iv; Thu, 28 May 2026 08:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZzu-0003F9-Nz
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:38:02 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZzt-0004mD-7o
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:38:02 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7dc6d090381so7343037b3.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971880; cv=none;
 d=google.com; s=arc-20240605;
 b=OTEOL3EAveVFeKh9XC13ODIngwv15mbHRei6pJs1ng0CRHXJDtnHfAz7YPnHpNTPJS
 kI9OuE1BhW6IPs4vEMs9FgjcS0yP2GImTxkvOZqoiD+KQYKEuq/2ZpBNocyyNrUwhl3e
 XX8hmBUQSXqoLAWn9F5ftYaLzuGiQWWrpZmtm00PSs2ubpXPok4/0DdQM4Dc+7Rrri3S
 NjWSqsXdJ2RtU+tLGzNXlTeZEHYBE2/t5/C5JjnJYLsUaOa7K3YqG8kojwaHekpaesHL
 r8gVvXSXXBW2IpDS2l3Y8WjIvJp1/J9doUFoPgCNk82Bi7hOgsUBxkUd1k0JTTBjYaDo
 7Piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V7HSQI3HABfV3lbYNyFf8La0erSfo+jTRHzPAU5T7YY=;
 fh=0n/dH731qceYS3uR5fHvpDx0YhxTDj8D6Rmsy79V4Yw=;
 b=T8jJCVq1LhN0Oz0gMiDnr53ynAooS6rWp10vy8h9x3n+49on77iZO+9wG76INePyds
 gW++orFYl3G0pZJn7AVEv+NDQ2LPdwPeIZfdegCRuTEDp9fg8XUKoQYfn3kRxYGIN+Lw
 tIJD5z+2Ygd4S4DZ+iQFOD8kdnFJOc+TSg6yxU9z8cwg/4iV6EVLWMP1XWIW7QZ0NkLS
 bmVr5I8yX93YdLI8fTOzQ2O18N/MrE74aa7oIGU0f+/hawO16aOVz+6sUnqu6EjZJCKW
 oMfmvyurTPV9EiCFqLzchQ44ngZQk2xq/dnnmSGy+JpBED5y4A5yJP3MxsaDYy5Bfcdx
 5bsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779971880; x=1780576680; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V7HSQI3HABfV3lbYNyFf8La0erSfo+jTRHzPAU5T7YY=;
 b=IfXAv6I9Lt7ch83pW9ZXAJNEE1m6Sv7vqlS1g5Ek6rxtJggbSWSXU0RuOpsFfmZDW1
 EtwjhhRl93Wd9VEr8+re3maapf7sq/RvjemOKCwmZbb5mstNqyssFECx+dLJ/ghQjzZI
 a2URp9N7Th+vemB7YBZ1d/gDO6ftTnZMMKVJyry25fzuUuf0KYFIjrHQ+A4OXm5EyDpG
 UJduGrNgB+4oyn42tC9yixr5tKGKxuj9TzLnx91Ub+ORidKaPYB0oEhgBqRAUuBBrkaX
 JjQ/ybVG44JV0Q63NHK3sPvw6siQmF/LzMOKhgfhuECk8pHb6T9eGN/R2ENrJ2t1r+R1
 Xycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779971880; x=1780576680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V7HSQI3HABfV3lbYNyFf8La0erSfo+jTRHzPAU5T7YY=;
 b=YvnKEGFWMdY/6S157CeoJYEP/EYncHKkqe9wCsNpHGSQzBqbKxxuOZWNLNk0wlLhGl
 I/an33g6fPoAb9meekYCgJ0ax087rRC+e9mzCYKUYM1TrgOYIj5s4eHJC0P7zJbB5LQv
 PbG9RUAQ7Ztm5ba6/CSAeIDsBOSRldqymflBg0XB9bcHZItXb/gEfzyJkvdrrT1qiaKQ
 Wp4xjKy0GIgbq3YeIDhDviI+IFdUfuQ6ELjB+5Pjb13zXwPgPf7q+ShhI5ZgE7H1ornz
 UBr3rkDXYkAiCP2RnV7FHJW3ejlJCGb5vi/auODI4iC+6Hm3zNoGED4DUObzn1D7Dcin
 ABoA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8p7UfKZik90fhuT3KCIPD4ALRI2Jw0JlJpHARPDDtI02HZPNhVAxxaUvUG86e7v4diMC46QspB5g==@nongnu.org
X-Gm-Message-State: AOJu0YxmOv0770zsqMjMTSioxnANRZG4Zq+vG27pYYgPR0Eb8A0JOFpT
 1vS4CkYa8mv5vmxRMZYQWujrr9+H+QLGTHyrfRxXVtlCbVeRjNYNCs4TA33Pp/WVShsNuI2DDrs
 FT9mNw4seFyXblktgVjLn3dGoxRnc4oit5iGExVkY5A==
X-Gm-Gg: Acq92OHZn5inWwt33d5kaGTv+9W3XxHwOoMtGZ7LYXouj7xFzFpfK4Tffp9ACVfHN+v
 s3eVCrE71FM1RUHOaAmcfUcfMP9Xobx06EjovmNnF1j+n0gnFFW15ooGPHIWmEcPw9c2rOEE67/
 pZlDXZM4jc6twqcSLxklj+l2P4PEn7EMTlDahOTJfSsqL5oWBlpOYqSDt2IKuf84zbnPq6tQYDp
 0jad45zjmQM+XeDzpgvO+9UcTMEh9iOB6oQLk1brOfeFWL8o7cSzlLW5Wez9GgeJJUb+DqWlC4/
 RmW2wEvdgK9LW7gf7Dy4q7Kj6megJ0N7SjyhRc2CWSSxmulOMv1vxI3dWj3u++/SLGE7YNzKW0i
 0EFaLi7qtdAXn
X-Received: by 2002:a05:690e:4287:20b0:65d:bbff:41c6 with SMTP id
 956f58d0204a3-65ec97dc2cfmr21627007d50.24.1779971880065; Thu, 28 May 2026
 05:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
 <20260518073401.11279-16-corvin.koehne@gmail.com>
In-Reply-To: <20260518073401.11279-16-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 13:37:47 +0100
X-Gm-Features: AVHnY4LZLdcMhmAu_fnB0Enrx4F8ZLyE0sDMTo-42CjgXrnIz1peAo8r17Pwcpg
Message-ID: <CAFEAcA_JWn8SDKVgca_o59dfxSfqu8vtAA_XFb3Ew+pb+_HW=Q@mail.gmail.com>
Subject: Re: [PATCH v7 15/16] hw/arm: Add new machine based on xilinx-zynq-a9
 for Beckhoff CX7200
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Mon, 18 May 2026 at 08:34, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Introduce a new machine type 'beckhoff-cx7200' that inherits from the
> xilinx-zynq-a9 machine. The CX7200 is an industrial PC based on the
> Xilinx Zynq-7000 SoC.
> The machine preserves all standard Zynq features (boot-mode selection,
> SPI, UART, Ethernet, etc.) while adding CX7200-specific hardware
> components.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

> diff --git a/hw/arm/beckhoff_CX7200.c b/hw/arm/beckhoff_CX7200.c
> new file mode 100644
> index 0000000000..6e27515886
> --- /dev/null
> +++ b/hw/arm/beckhoff_CX7200.c
> @@ -0,0 +1,80 @@
> +

Stray blank line at top of file.

> +/*
> + * Modified Xilinx Zynq Baseboard System emulation for Beckhoff CX7200.
> + *
> + * Copyright (c) 2026 Beckhoff Automation GmbH & Co. KG
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

