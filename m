Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E4ACA5FFC
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 12:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xER9L-0001v5-Ka; Wed, 07 Oct 2026 08:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xER9G-0001tK-NN
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 08:53:31 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xER9F-0006mb-3H
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 08:53:30 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8ac9d666d4eso40290607b3.3
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 05:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791377607; cv=none;
 d=google.com; s=arc-20260327;
 b=UV04h841mfF8Jl6/M4y7h50bM7//fOLIglExnlqCCHpzqX1lmrhEYnTmoABQoLZVR0
 VzeBEckj8JtOC6/dTNMKYpUA1/agUufiVycifN+QXOibQQGcg7Nemb/DFKVyVSybD8A3
 fLj7g6+1yG0z681vnXVK9GPy27quLd0IEU200l8UmJZNRuBxQW7HTOzF/2tnfUpHhSI2
 UUFpnWyLIESDGD8lqE3NSERFNJeTFHe7sNaF5DNiRJyGWAP/oOJahKmrUdX6vPYEX2/x
 dWgMzoLbydLzRAvySW0jHuzdmTTb2dlWYVA66ECTDZzVrurT+1qiFqJ0GeNFtvkLy+iM
 eI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=AofFlWPWOabpA9EhCWh1GV/m9w1x1lBYtBymb1woM/8=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=FX/eCKKdjrUw/oD+bP2FJ9dPG9Nj6IUMhU/V2XG6TY35LcouXi/Zj0fc2fPzYrG0Yo
 sNHKhv3+LTbLPYac+PD7B3xkg4UaHV+sovJ4ZqniJhFt+BCE1s75cCvVg9HX6JBb8EBw
 uNQEa+o+3/uRnMpTBu05F5P5DQBXdarcubuf1NnTG4883Que+9oqn2IoYDvcP+oh8EUT
 PVtImRSw63GrnOgOaeEDYU6pKVDTzLXIuAZ2yja6Pxt8yTYf6PEkQr+/lWhN4/sULf4m
 rer1QuMcRSFtq0wlp0zaoehZ2++uO76XfcvubCjwyl7pU10b3mlDaRAoJ8tka+eTiz8H
 0xzQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791377607; x=1791982407; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AofFlWPWOabpA9EhCWh1GV/m9w1x1lBYtBymb1woM/8=;
 b=IOzQc411rcElURkq6S04qnC/urxrwUY0DFdEZ6/tisiZxvMiWgy2JjTJfc/zXDkZLN
 cRnjxpg1xzBfmz2XDNZTqZi9jwCwjCdvHLIbGePVN1DypQe43N7hxMwgALptfo10qaiq
 C6TZZWVHKqkgouDvRCm3W19bckuML6+BRQYPZfHbuRxFjV/PdSzwsGdspr6mtTz0kpCb
 /KJnqeDa8DPxXt70IkpiPXZzGLQG2ghlb09Fra05kTBHKH3Jb1XPlTLeAHlpkIoAPwQn
 6jWP5vmKWh0KO3N8oAr4PYE6EC6IvMVthFf8/G4ONo7u7pw8pAE8USDKXtipnlLX7t5C
 LPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791377607; x=1791982407;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AofFlWPWOabpA9EhCWh1GV/m9w1x1lBYtBymb1woM/8=;
 b=Gwa3WxAK0wpUai0NwrjWDqT1yramyJUhdua0lc72Qd7dxCOtoWSRlYGZ7vr9bV9dfX
 v5wemctbi0qEMrV0qhXmo8roHUHGn16/6tIWYBWbTZprY479g756MU3cdkuQUKEtqUE1
 tsPodr8HR9HNJF0Fh+FKer0ul9xJ0W9psgFyG5EpZ9GsrCOvamJHfgJCWsT0A1NtU/Fx
 j1QCTdLLxLdEYYMEC4BOWpDvkDJbp5AJ3PTT8DDb7Mc9uSHANwyHJiyU0TjXL4WyswWc
 S5FoY2ng+HMiaUsgjLTlVzy4pB9E8eAIpyQHh4+IUzeJy7Zn0HC8WVG8N2jr7iPDsfCf
 IMSQ==
X-Gm-Message-State: AFq9FYKsMamMw5sTzp6hJUdsI0EpbP64iB8FsboO5ko+ZwvzK1YtzKY9
 mKDD7Qk+X/Ikbm3SiZlsnHdMEohlp3X1YlwcP0AEhY77MxMhsubDB/JT2iJrurFP7tKA3U93R9Y
 XY09/6EU2qNiuY0rGNiKCkIfgJISwFN+Jby4rsb22yOqYDoO4KfCP3e8=
X-Gm-Gg: AYBFou0CeQGRaXdy1VvXYfWqh+ehYxgoO+NNijUDKIXdZP4T6XQGmHn+ZsyakA4q60Z
 hi5y2AfNhmJEIR75S5tmc2MWmFlfWEWlDanSRiQ/Gq6EE1/vnxLLqlCKQB92dYhoZasd9j38KZ8
 roXm7xzYwih3EBr/0IbE0wzlNfyCNCc7PNwW+ft64UAkWSwpvPPXZH9O3PA09x5p+BZqkTvxsCc
 NgnxWVX50T+cXH4kzms+2dIe1VWoYps46Qn9uyQZpUUic161OAoJtH773L5l8RIqqMwWZtry2PI
 XGnKDZbauoLO1stIwlkf2wMOCDwT/LcZpe5fx0nUbike+wrdkWHmknx6cRv2st5TAU3P33Ah5Mt
 Nvrv8eSTJsx81+kEwbAk5VxHj2Z6CdY/QyW/3jzs=
X-Received: by 2002:a05:690c:e1d7:20b0:8a8:31af:381 with SMTP id
 00721157ae682-8b05b16abb0mr11024357b3.83.1791377606335; Wed, 07 Oct 2026
 05:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260914160020.327787-1-peter.maydell@linaro.org>
In-Reply-To: <20260914160020.327787-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Oct 2026 13:53:14 +0100
X-Gm-Features: AclHuK_bDTVMLk95Gy2HReWHRreUgHG3wWfY7M2VVSikSFCOYrFjuchpQM5v_tM
Message-ID: <CAFEAcA_30Oq5e7U2+GKeE1YGF2F5hp8avDo6tJaAs3aLeD+_iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] hw/intc/arm_gicv5: Minor fixes and cleanups
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

Ping for patch review on this series?

thanks
-- PMM

On Mon, 14 Sept 2026 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset is a compilation of minor fixes and cleanups to the
> GICv5 code that I found in the course of implementing virtualization
> support:
>
>  * Various in-memory data structures are defined to be aligned to
>    their size, even if the guest provides a base address that is less
>    aligned
>  * We had some extra blank lines that didn't match the style in the
>    rest of the file
>  * We were unnecessarily extracting a bit from a raw register value
>    when we already had it cached as a boolean in a struct
>  * We weren't tidying up our allocated memory on finalize
>  * We can re-use arm_cpu_set_irq() rather than implementing the
>    set/clear IRQ/FIQ/NMI locally. (This doesn't matter much for these,
>    but VIRQ/VFIQ/VINMI have more complex logic in arm_cpu_set_irq()
>    that we don't want to have to duplicate.)
>  * Now we have a 'max-v9' we can clean up how we deal with the GICv5
>    needing a v9 CPU
>  * having the cpuif identify itself by IAFFID and the IRS do an
>    IAFFID->cpu index lookup is unnecessarily clunky
>
> Changes v1->v2:
>  * fixed the lack of ~ in masking calcs in patches 1 and 2
>  * patches 7-10 are new
>
> Only patch 3 here has been reviewed.
>
> thanks
> -- PMM
>
> Peter Maydell (9):
>   hw/intc/arm_gicv5: Ignore low bits in IRS_IST_BASER.ADDR
>   hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
>   hw/intc/arm_gicv5: Regularize spacing in config_readl() switch
>   hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
>   hw/intc/arm_gicv5: Free memory in finalize
>   target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to set IRQ/FIQ status
>   target/arm: Only allow GICv5 on CPUs without AArch32 at EL1..3
>   hw/intc/arm_gicv5: Pass CPU index to CPU interface
>   hw/intc/arm_gicv5: Pass cpuidx rather than iaffid in gicv5_get_hppi()
>
>  hw/intc/arm_gicv5.c                | 72 +++++++++++++++++++++---------
>  hw/intc/arm_gicv5_common.c         |  5 ++-
>  include/hw/intc/arm_gicv5.h        |  1 +
>  include/hw/intc/arm_gicv5_stream.h | 10 +++--
>  target/arm/cpu-features.h          |  8 ++++
>  target/arm/cpu.c                   | 61 ++++++++++---------------
>  target/arm/cpu.h                   | 10 +++--
>  target/arm/internals.h             | 14 ++++++
>  target/arm/tcg/gicv5-cpuif.c       | 41 +++--------------
>  9 files changed, 120 insertions(+), 102 deletions(-)
>
> --

