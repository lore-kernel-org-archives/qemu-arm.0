Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF39AC88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:30:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x630i-0006dy-1J; Mon, 14 Sep 2026 05:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x630J-0006WI-N3
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:29:36 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x630H-00086G-U2
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:29:35 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 00721157ae682-85d46e4cdcdso13288447b3.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789378172; cv=none;
 d=google.com; s=arc-20260327;
 b=XoUFj1HVl2ODsVGs4Pl4XtwFqJ3YNDqBmZOA0u6eOySBNwd15JEKZn1S4Fs4K/Hw+0
 HJDc/83If/WS9zb3N0FMu9b1KAEsnq1x23fAYuF1NI3WYTKdX6xsb2meIS9Gm3/kEEfs
 ShBIvDdsAivvj32RTROLgQG7ySmvHHlwsg8tUUtXRochW4IACpMtk6vD7ggp2u8tdL/j
 axy+34w0wIB4ffdkKvI/DChTNAFEl2eNMfTPApLMoVypNRuGjSKMlbI/GbJn+oAvossT
 HdFwdNa6PMIUm/DEwFdXj/kvw7JPvioU4No5lZD7UlaBTSw+tw3bdbuc+YuMGW7Mo+NQ
 YkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+nnJwaGlgH6eFFaTQ5yar1VPfJUy50dmKxlNCgUy0TU=;
 fh=29HbMbD3PdueAR0UkAkE0qwSmr1wzj2VIvZYlQdZPx8=;
 b=ozbdCsWTd8zpb7MX4fVH6bLPyaUUasgtRMWHH/nc11ahz+5i9ln8D/oMDf4WTDobjt
 m9XxruwkMP09c216CDzWQPYXJ/kXWKG5jo4fpJ9qgoeFk4YdtdE/VSdm6NpXlMKgNp/Q
 z1d6psO0+qmX1rW3//kZ36Qmo8wPeddikLmOpulIrWhT1N+2cC6MbuH06VYFMCY2dhWt
 WtupUPtr09i+qxXD+TMG0CHetPoYYvUeXf3OU0D/OxgprPPFn/emlo4khxjbO0+u9viW
 pkSVEPed6TQB30X1Pe8M/7EPL6bFrFgE1G4dQF4Ibvtm/ooQL9Q4LseVmXUB3N8zwhD4
 akOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789378172; x=1789982972; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+nnJwaGlgH6eFFaTQ5yar1VPfJUy50dmKxlNCgUy0TU=;
 b=XBOO4KFxuhYxi4m66QIg6NJRHSs4/Bj4OUjz/obOwxT/9dTwb2rAorg7SVf0/yp8w7
 5U+DXa5Rr/TKZ6lg+jnRwbSGn4NdTrSmHm67rXOqNPVoiZXiPdFeaOiUvg2DFP9xpqjN
 MvRbtobEDlzYElqaldY2CClMc4l0w7sWQnV/cW0uX7XQb62VVVEkaNhTNi+gqYLaPxvD
 TUvhGvlHHKzyskEKlZp+reztBPEdNQz4y+S5AB80eH6GrTTzykh0QVneusQPJM/X1MdB
 YEfrfyhoM7GVZjLDSjdbEef8n4yBT+FFK+ZIw4jswmiHiRMPx9ijvbPdeGf3AIFchDgy
 qnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789378172; x=1789982972;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=+nnJwaGlgH6eFFaTQ5yar1VPfJUy50dmKxlNCgUy0TU=;
 b=dSMcz6ow7cmOiPevVPE4UonlPWDZN2PzieFwr5w+XvTUoPLG8VzCEe+eNPfCl4ZKee
 fVkI7CwGB2cbgWT6iLtN6AcFnNLIGwuYlf7PLdQfODr7gIStWL7d22LJp9YYJuP0kilE
 TmiZDF+V25tHegsrGmdlCKjoM63FEDgTExDuufqyiUAufq1/gMlUAnN1WVu/6S0vhIL1
 U/astlBgkVnVxbC7kjSCmJhNK6pA1FZGYLv+KNyAkSVRfZQ/AfIATpH4B9+Tz213JGYc
 I5YuXtK6oF4AgoMJA+Et56npNzOJaX09hAUZQA5thu1MsgLDJ24sBKCzPDWlNE7WuoSU
 1KeQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZ0q+pyhRtM/Wivl9biIiF0O6+hRdcI660H857FfdACZKaQ0cyjuW1rEHUr/QHzj9PDvKFCJwHtw==@nongnu.org
X-Gm-Message-State: AFuF++nQ6EUPY9VX3hbk6NKRzora4y7Joi3IV4x5qbmcDsP6CLvrdSk5
 huA1FJuU17AE+lET2/fp3qjgtTcx/19imJRGb9sghZVp2G1Kfp9aBM4xhnlHa6tta+bZ+Dwkcmo
 TY3OiR28PGEhNxklW0muXTd95iDZWeHBbHy6Aog6l3g==
X-Gm-Gg: AYBFou3yeSRwEfiFm7PNBBcMzamxysA2dAxhZZUO39NcFVrT4rSIUgDGPZLrHRTUNlb
 tOP8Aq8bk1fMYA9kz23lpnBk3/fOmtcD7iIfXVTwkbkMcn7YToJPyFdPoocpP4jsz6ld0sUJDXC
 KDkbu7b6w/uhVSnHgAwtYjGPhT9P5lGh9NGiX0jrZvMHqJ31jXh/5FEzgpfa8JkIjwp7n425dk3
 1TqR5o+LgSus7pG3tmqS1isvJI9Hfbm84uj87eEGTSnC4wRCLpyo0Cb/AVHI+CKysjTcXnz9qtN
 eRToizXV2KjPA7dQxbZz6XDEcWkMoxWEI3/7KoDSb7Ge0mZrAmeRXQXbNgXJ9AU8Hd76ssS0zmj
 vXoUVmAJSVrY5k6bODu4zIaGfSMlx2bzSnALyLCI=
X-Received: by 2002:a05:690e:128b:b0:671:1620:5b56 with SMTP id
 956f58d0204a3-6714dfc8c89mr579298d50.7.1789378171553; Mon, 14 Sep 2026
 02:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260913-bcm2835-v1-1-b3719ca0df13@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260913-bcm2835-v1-1-b3719ca0df13@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 10:29:19 +0100
X-Gm-Features: AcwNN1W5qkZ7ZTgrNWoY7SU-bxJhe0texKFx4E5yacAv4loVyh0ochkqEdfQrPA
Message-ID: <CAFEAcA9aJJc_yRNYbATjA8d4ggZr_B=r5EmVNma1rzhi_ZrWLw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/bcm2835_powermgt: Free the watchdog timer
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sun, 13 Sept 2026 at 07:44, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> It leaks with introspection.
>
> Fixes: 21fcfb604608 ("hw/misc/bcm2835_powermgt: implement a real watchdog timer")
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  hw/misc/bcm2835_powermgt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Hi; Thomas Huth sent the same patch a few days earlier:
https://patchew.org/QEMU/20260910175001.76278-1-thuth@redhat.com/
so I'm going to take that version.

thanks
-- PMM

