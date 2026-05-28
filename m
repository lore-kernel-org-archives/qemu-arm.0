Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BFBCD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 12:36:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSZyL-0002cj-1A; Thu, 28 May 2026 08:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZyI-0002aa-Va
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:36:23 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZyG-0003Tw-BF
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:36:22 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-65c24be9e4bso13261643d50.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971779; cv=none;
 d=google.com; s=arc-20240605;
 b=eOrTQJ0eFsC1bBTn9sQGOO5RiDiBAWT7Nj/0eFDXXMu5MEV3jPB2kZQNjILWubIxVl
 UQZDnJeSidi+9h4snJi18pQtkqWsCPBHEKGpUt7RzGI8V7FwOcUZ4pdQ/qGkT5yABeaW
 eJ9VcFVNqlQ8wsgIvisXihzzAgel3qwImdJm+JWqetdhJbvYABT7fF9nBTwk/e8x20/e
 kGzE+37nYWaLYotlcqlaNwRnYXlQsc0TzBpPJRV8TDpM+/fJTzwOQzZo9Vsf30BrwdUc
 fLhbe2EzrKQzTm9/RWtWoAHOOgiInPpfium1U2YH7ySSl+NcsgLHTt+cCRG6Bs2mrSgt
 bD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ektGrxW2dF9YmfpqRLqpny3BO+8C4wfKPTZVBiCxCh8=;
 fh=KWBW1W68gjqDraIq4lH2jhpqsXlKLhf0OCD/GLvCkAU=;
 b=lIFaS1xMFPoo6g/lKCC2DPE0KppdKOC4+g0E0bniHtRafIuWQgDem4yROSbt6rclx6
 DuKBIyXQsicUAkxJJ9LutPqpVfm7uhASsbGjfGfqAvgCnriqFDWTZ+v186BcN9kJ0sgY
 Z0H5m3x4wofQ7M+oVPinAHeyQNTPx3njmX/2QcfwkZ0qLhM2dk8fw8no26/5VCcEfb+f
 dx4WHaTxC7h0H5PaByTT/9msMMHM9yOfCQwb2b1e9EyorwA+dx/XJVQ2NnPgel8f3qkH
 OXP3fCIixpxG3qBKjedKYiObA7OxlhV6LsF1wnT+lNr22hPgtHsqKVnJcTbvxPXiX+KM
 jaSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779971779; x=1780576579; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ektGrxW2dF9YmfpqRLqpny3BO+8C4wfKPTZVBiCxCh8=;
 b=E88Pt8yC+WFFdLb3Mxx/jIpzq0frY9o66JDiqDVAkRG+4DdShN9z0OizxXzNPPCTGj
 kNijvXE+tx4MlRYdKHJUIHHoByO0lUYWiBaJRvNXR3ayvbV5bQr5y0y3awKtwGQLhrsR
 zB7xsfGPrJYzeIAvwRhrfkxK/ab+XxCV2rob98XCLqIMPrdG4rhPeIQV+plkusozQsW3
 TrsNhHIkAnPP3MwwXWMyup717m6osftUuwfcva8d0b28MWDhYoeXx6yzqPwmlYU5Iwpr
 QLKIod4y89MMkeCd7tqoi77KVWV08iXuM0qQ5FADOk0cnT4+Sn00LaxKSu/j8Ih4sLlB
 RqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779971779; x=1780576579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ektGrxW2dF9YmfpqRLqpny3BO+8C4wfKPTZVBiCxCh8=;
 b=dW8g5AbiYLz+/tu6NaG4TbFyIWk2qwN4x6bWdiHekeiVXkS3XXtA6MYeUh9j2JL8Eq
 I7SspBdCbhfNNYpGwZJb3Dc/Y+8z6UezRznmHm2dzPqmGmmWtCCObtMpjlz096MstpVK
 AxAJOKRdUv7CUylZA3te6EW0tYEzGJMD1x1kyNsABTCmSsfGD4jhbmqA6gSq9JTs3gjI
 w1YBzJBlXJMdYwuZHcCqyIHi9sKPOLGtJWyhKOIq9tm/0jlA4XUSWfq9ujUBpBfZdK02
 g/9yMuorsGLWvYuWJeWwwvjRltS2m5dLGwLGMmqXOoEKVC2EsVWUGkZPzbJ2RPMKJjMl
 YpDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9QQQh9x9gIXYPPz/EDfP1Ov6g4DmcrnMaMdJYC8T6ijlM3mna2DGu0TXGx3iqMYp4S4bFl3YY/8g==@nongnu.org
X-Gm-Message-State: AOJu0YzWwlUjbJjH6QBVUbkUSRTZ0EzD85Wheurk5/SjKoiwmCFlCAR5
 qr3a/QCcAqiTn3RC1aJnXoEVtL0k9Anypu6Vfb5YeqzkNqAslZtbIjOFSTQ7MllPtLajxtt43Yd
 8I7aEq1RfpuuBRd+dV2DHyD+nuzqqfvws9PCgEh54/Q==
X-Gm-Gg: Acq92OH6lzt7j5N7l8gil/GkhYENPUZVpZGcc1ZtddTFdAT+Ojp2Tp21JE2L50lCDzj
 5CuC/i/vsYR7hYL1WcseXP25Hw2MwPOdlnNgUE2OR1qe4imXYqIAi3urxpceLe1oMUvsHxyV04A
 DBq4UDZUusCsslNHbUO/KQiG3uAjHz5DPURDwJwIFHXsDJwPAghQ/JpU2j0niZi3rawx7855Zt1
 vOO95oqEcH7eHnq70LSfjtKLHjsCGIwRsvTFrH11RGQ2sX64CZR+AkaCCQ/MIFVdpD1QqsZykVF
 SdUvIm4gtFGG45lTl3c4PVy3DC6I+e9sLT96hk0uovjkTkw3Tq97icHmRtT+o4ll3HjkwRd9EsI
 efgtxefD4Pdc+
X-Received: by 2002:a05:690e:4401:b0:65d:81d3:c1c8 with SMTP id
 956f58d0204a3-65ec994db8bmr18486706d50.45.1779971779068; Thu, 28 May 2026
 05:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
 <20260518073401.11279-15-corvin.koehne@gmail.com>
In-Reply-To: <20260518073401.11279-15-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 13:36:07 +0100
X-Gm-Features: AVHnY4JgCYlfefFg2nL2FpbRiZAcf7rj8vVOkfMIZ4DzNwZ7OML0HD91d0n-RYo
Message-ID: <CAFEAcA9S+xCcV8Kk+RBMsGWPD=BNzYHe6mWW_hGqLrRgCXD1Vg@mail.gmail.com>
Subject: Re: [PATCH v7 14/16] hw/arm/xilinx_zynq: Make PS frequency
 configurable
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Mon, 18 May 2026 at 08:34, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Add ps_clk_freq to ZynqMachineClass so derived machine types can set
> their own PS clock frequency instead of using the hardcoded default.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

>  static const TypeInfo zynq_machine_type =3D {
> diff --git a/include/hw/arm/xilinx_zynq.h b/include/hw/arm/xilinx_zynq.h
> index 662b390431..bf411f1cc2 100644
> --- a/include/hw/arm/xilinx_zynq.h
> +++ b/include/hw/arm/xilinx_zynq.h
> @@ -24,6 +24,7 @@ OBJECT_DECLARE_TYPE(ZynqMachineState, ZynqMachineClass,=
 ZYNQ_MACHINE)
>  struct ZynqMachineState {
>      MachineState parent;
>      Clock *ps_clk;
> +    Clock *mpcore_clk;
>      ARMCPU *cpu[ZYNQ_MAX_CPUS];
>      uint8_t boot_mode;
>  };

This part looks like it should have been in some other patch.

thanks
-- PMM

