Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8724CC5CFC1
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:56:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtk9H-0000jd-83; Tue, 11 Aug 2026 06:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtk8u-0000XM-Pw
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:55:38 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtk8s-0000OB-JC
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:55:36 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-81e8fa1b8d6so38305007b3.1
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786445733; cv=none;
 d=google.com; s=arc-20260327;
 b=IW72rdXhqKKO+9sa9ebc9RG8cEWLibggslXcO4HyLi6aEWBmGUZCFqKWnICtT14VZz
 cX3/tc+uTZu/AO2O9VOIrOhrq+l979txhrAzNkJCdFDZESqIyXAO+9+66RSqi1B3hp//
 4GeBkhXmR/V0XwF2qsQqbZcC2cYG2WtUU9pn/Kasrk5hZkMnnunua9rGrjgOet3hbBdc
 rDWefqm8DLLMkeyzI9KlS5Po/PxU1jSkZqkU3LDiX3OomVJABx2641y/Z63dth4i7uw3
 AjhnLDKynYhdAk0VDn5GP6eP5Q6/2PVCjs6+yCC547t5K2My5H3ea141H0FkWEUvFQM9
 de3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WZ3wcahnXNlAgbdHHJ1r5HEIC1YtGEznpsZJ+BBGOKo=;
 fh=5eE8cEaxHk9NGIKMbE2M9CuzJUD3QmKoJoaGuOnPSDw=;
 b=sCW2m1Ag4nh+lMWHkD5UtGiAnypHMgBUB/KBQJUFtDgIzBlJbq1MUNCKAJWUjKYBTy
 +0xQnCODHc+Q2eHrxgMBzB9IzzO2sgfrO//ULP4Yqg9HCHw/uE2Z59WpCE3cULH23AZS
 6COMWorzVHc2u/RPaDpE5pSjer+X1sXiOAhrTGlGRITqVEatsnjKzIHfjljzoyYqpFq5
 JGqzoEgVCkwWChNdJrWzkL/98ycOR26nCyG6gnlO56sKFkBaHmDN06BMxhFxzcLaLip3
 ieKywp8fZnbTzYs5exerUVrshq7zUCMxmz4xsuSwI55mpvZU20Rp1XaPxOON30F861U4
 1T7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786445733; x=1787050533; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WZ3wcahnXNlAgbdHHJ1r5HEIC1YtGEznpsZJ+BBGOKo=;
 b=pGo7NSClY4Im+djV5jm/0o0VbNWM80ufQ15nBqn1kVz+2peBnR4t4k5HWMLiiyBTH5
 rvjSQjLjbVH0LtQv0W4YFEgDWXLt42nHayLmuzuIeeYb1MGdWAgByP6qLCiaFpPr854k
 Jax9xTJN5X+KUNWlN1P4xlJF49NUJqgd8sG4sZDFvgfcQrC9h443pNd6ABn7Y4X8lTuX
 tgpM4XlbogsUF1eCjpB+/pOrnv5JsWG4Wv8h+kC3NaF7Jx5b3PNvjju5oS+QDbk5Ymo6
 wqITnsCYzP05hKJcM6Nz+U+GUmV1ngMIYezsmMYKCxeyCJb7rRcyQdO5UYF32ejDQSmE
 qlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786445733; x=1787050533;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WZ3wcahnXNlAgbdHHJ1r5HEIC1YtGEznpsZJ+BBGOKo=;
 b=HXe80Tn/YtnlIldSeSGlqj+Ehl+/CmHmhYuIW/F75dbcFj0YNkU7oJlycP0L44C9sd
 Gq7rhffRH7EYDv1M+YbMn/xZiwPXPnz2/ctl182weWjdDItQlKp756WuuO/n4siHXR0x
 5sUVLpq9S8OkhwBmjD7aoQsGN7L4Vny2N2f/Bc8PMaeWVdrFNlQdTW175effFt6SKwaZ
 g2SdV2viYTezjorFjR65BuGzz91xOUGE0ybpKVnl73/EFLblPUYWyhIYyNt15uRXWDiK
 JzUonDF9sQVauZHTPiAtP4LKGl8TIuHMzHhCR/coEZjowpJGs60obFqO5ZK9rDhT/Uid
 8grQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/45pAbw4Yy8hMEgXYqDWytUEcT00RDOMiZyHjoFAI9r9IWagXb8tEjh09mxMtnYtmRCExL9oNrw==@nongnu.org
X-Gm-Message-State: AOJu0Yw01xGTZ10l+d5XfCx24M7rNX6R8NAQoOg7i8sEGjh8trdy98q4
 H7nlefAgFJt2tQcXKT8Zfz6tkaHQuCIGHNR8316D55+GR8xcwHEtLhR+uc6En7QkUWkyy+rDaYq
 zKBfYnEWfqT+yVvxprTmTjUX0yOf0hMMhhkYla7CqTA==
X-Gm-Gg: AR+sD10vlNrXkKoDRqBkgz25aUUUOGM2ARqiUjqZ87m0y0stqEG22dFK4hrBvfDHu4C
 bp9geLirtfZys4rVp9r3gsXnBcdPloxD8KniL9sXI8IXGyGohemlB8kdC4MuC4lbbnP/ET53GjA
 K7lTAvHcV20dhB27WkFQeXEGK4Oa/zvPluKjVUjWwnKbC9TzCTlPcdZr2lzx789I6YdcBEGXKA7
 wEOmC06+DdAS+SPOHgo9/8ltTF3btabDSR05tWfJooHI5YvjwONyKArsTF4S//3d3Miqz+1jN5A
 8z6SEdwp7gnP2W0f+Wj8E+Joa/P7aoUywnDZQ3cvSmMvyfp8d5bJRXNwlwOOqwhwPZJkwByRw5r
 SnzkT/1T70vLMYEFaQA3SnmZv1ZI8
X-Received: by 2002:a05:690c:680e:b0:820:132b:6309 with SMTP id
 00721157ae682-82f2f9cb639mr15384167b3.35.1786445733261; Tue, 11 Aug 2026
 03:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260725231142.61663-1-marcelomanzo@gmail.com>
In-Reply-To: <20260725231142.61663-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:55:22 +0100
X-Gm-Features: AUfX_myK-7XcBQfqWDo6fQ2z5EUWa-bWZiwC5hawV0ImSEhcGiljoQnIhNM0iaE
Message-ID: <CAFEAcA9U_y_yox+h6zW-rDeMC20-t5KWmD077vg_sMca2RwewA@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/raspi4b: fix watchdog and GENET bugs hit by
 modern distro kernels
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Sun, 26 Jul 2026 at 00:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Follow-up to "hw/arm/bcm2838_pcie: make PCI device enumeration actually
> work" [1]. That series (plus the GENET/RNG200/thermal work before it)
> got a real Raspberry Pi 4 SoC far enough to boot official, unmodified
> Raspberry Pi OS releases end to end under raspi4b -- not just the
> functional-test suite's minimal 2019-era kernel+initrd. Doing that
> surfaced two further bugs that only show up with a modern distro's
> systemd actually driving the hardware, both on paths the existing
> tests don't exercise:

> Marcelo Manzo (2):
>   hw/misc/bcm2835_powermgt: implement a real watchdog timer
>   hw/net/bcm2838_genet: fix per-ring DMA status and RX ring selection

Patch 2 is to a device that's not in upstream git yet, so we
should fold the bugfix into the patches that add it, rather
than adding it and then bugfixing it afterwards.

I've taken patch 1.

thanks
-- PMM

