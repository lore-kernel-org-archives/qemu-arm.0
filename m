Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp99049lfb;
        Mon, 11 May 2020 04:14:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypLeAJZHNxeen3RRZWK389lXOu/x9wejgYIL4UYt7pYfGGk9l65AqYspCtRnAEn6Hblhq92E
X-Received: by 2002:a05:620a:1187:: with SMTP id b7mr10882646qkk.10.1589195691959;
        Mon, 11 May 2020 04:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589195691; cv=none;
        d=google.com; s=arc-20160816;
        b=dH6qxgA6MpjQ6cyq4aErTSUk0YHNfSR54iSW/8wwSKoibWqQlDFh6+0Hbff9cemgUE
         7Uo+FeNzN5ZApBVXGGIh2wXR18K14w5iPNF2PpXAN1ZMZHtHbZZvt/GYPtY2C1f9XxyA
         wFdlcvZfMDrMkkQC3ROPodhFXgmoo5I/ufQK1eFP4upQ8KVVzDc5h1vJ+a67UUVG2qjo
         us90xVgDMgTtohiC/B7Sg5KF3JARJCMQ3A+J+shNr+fVtuJM1eQImoIKslrVlrYTEpAp
         W6ZUnrztIhhZETv8LdSjRpX+VkUCzVXPUr14k5TNyzt0yg2H+/iTuNeGSkaDRxkPuDfb
         d7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMDbJBu5+Rd0eP4QGCJnPPGRd2XqPGZu1QMu29plVuk=;
        b=MGmHMSjrQ2P+11Smzx0pGaz0I7JqBGdnq2yja/W124Sgb7uKZMLyeZ5Cltvq6W9PZ1
         vVuCR39RIzVThDP2En4an1eZpCrOaB8VKhyXu+9CEQ6C9prvHxmXhi6iMqHyke45mx6p
         yewraWGg7lv0U67YkWWMq3R8EbbGocuW9wmWeQqU2gkzqr6osY657FDvhceUImLewOkB
         4Bx4rCJoVsSV3xP0rMBWswqWD1EYaL/VEF4t89Nr3TjJPdWWa0Ny9htq3/W+Xom80Q3t
         6hjXYdQwCGvydBEFrL3wA5BjI6/NiADMhugzFLWwxMnQkcU+hTEZSlW3ZD9csq3chgJY
         5DeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyFcJVC0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si5532797qkh.55.2020.05.11.04.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 04:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyFcJVC0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY6OZ-0000Mu-Cc
	for alex.bennee@linaro.org; Mon, 11 May 2020 07:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY6NI-0007Zb-6w
 for qemu-arm@nongnu.org; Mon, 11 May 2020 07:13:32 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY6NC-0006Iw-Dd
 for qemu-arm@nongnu.org; Mon, 11 May 2020 07:13:27 -0400
Received: by mail-ot1-x343.google.com with SMTP id z17so7196167oto.4
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMDbJBu5+Rd0eP4QGCJnPPGRd2XqPGZu1QMu29plVuk=;
 b=RyFcJVC0xhi2jPq4KWOP/f3G3rVzh4eo7EmdCswcGRde8sxNpf5fHeYJhVa3gOMMKe
 0MYwkN1ISxuRPZWsVd/b5h/2EsasiYNOFNgbn82BUHslSixptrSffqSX3rwTaLAc+9zp
 AJXZbDpuUFQ+KyfMkhlOhOGjcYCFE9XPbho9wEmXrqKWijVjSISwtZlsvto+L/99MbDz
 qyZ+pLyPpTr+pAhm+cMLF0hq2m+lptm559WOh1g77KvzLOkyTvjJE6npuRiruCdbLNPD
 Ba8o8nOp6+Kt8vFQ9qHUndXCpfK9VbrQIbIFlobAKQ01fCBlgwXVHCbwCflySbkxbSVL
 1KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMDbJBu5+Rd0eP4QGCJnPPGRd2XqPGZu1QMu29plVuk=;
 b=DyYtYm97adZjImPk44gvtsYs7PN8jiViXlz29rtROnal+qBKdn8+NZaotxkP8ZtuoS
 IIgf7sxnXiZrkMAW5L2lv19OxuP5Uynj4gPgUdcvucqpd2zfJGIlYVy4Ocnf6G+lXEvR
 r78I2LI+4eZcTvJ1VqrSxKUzvD+9rCCJ0rIYMY+njzdg+FiEQMlJA0A+V8Ms3dlF+bNZ
 D+/6EnKnHR01xeXpglm12rckhpEe1Jyo2liQgKL+zDwE17xdWRMdJkxO4kiy/qYnEdvJ
 9sZwb1MEHVPUWLa5YMNW3mTHkxOSBDUWImsZTDJYhZuZEt0zYd4v4NIaInNukwzAV+MB
 jF6w==
X-Gm-Message-State: AGi0PuaBagyYPuoKH++kCbTC47pTbNkgIFI13JWuleUEulWm/NGjpGHB
 NZEQBLMBe9y5qreOfgYWnX4Kh2MZ8/na9iFeIdfCsA==
X-Received: by 2002:a9d:398b:: with SMTP id y11mr68131otb.135.1589195604991;
 Mon, 11 May 2020 04:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200507202429.1643202-1-amanieu@gmail.com>
In-Reply-To: <20200507202429.1643202-1-amanieu@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 12:13:14 +0100
Message-ID: <CAFEAcA_doVoCbX9y=UEJp11wjrpuS8+oS8OL=dz200SiULmEjw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/arm: Reset CPSR_E when entering a signal
 handler
To: "Amanieu d'Antras" <amanieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qa0penT37gbl

On Thu, 7 May 2020 at 21:25, Amanieu d'Antras <amanieu@gmail.com> wrote:
>
> This fixes signal handlers running with the wrong endianness if the
> interrupted code used SETEND to dynamically switch endianness.
>
> Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
> ---
>  linux-user/arm/signal.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
> index d96fc27ce1..8aca5f61b7 100644
> --- a/linux-user/arm/signal.c
> +++ b/linux-user/arm/signal.c
> @@ -244,6 +244,12 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
>      } else {
>          cpsr &= ~CPSR_T;
>      }
> +    cpsr &= ~CPSR_E;
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    if (env->cp15.sctlr_el[1] & SCTLR_E0E) {
> +        cpsr |= CPSR_E;
> +    }
> +#endif

The #ifdef isn't incorrect, but I don't think we need it --
if we're emulating a little-endian binary then SCTLR_E0E will
be 0 and we won't set CPSR.E. So we can drop the #ifdef and
the code is a little cleaner to read.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
