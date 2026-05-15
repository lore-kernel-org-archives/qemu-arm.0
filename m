Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C44CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:05:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnXx-0008E4-5E; Fri, 15 May 2026 04:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnXw-0008DJ-8k
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:05:24 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnXt-0001bi-9h
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:05:23 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso11576247d50.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832312; cv=none;
 d=google.com; s=arc-20240605;
 b=imiYRXf3sorqxH5/GCoeDzHg+iuvTgDIRx8R5AYwoN7dIn6ce7rhmmJJVzn4a1JFhw
 CxL4DR8XQLXexAN62f+hlXcQ3kDwsRtjbtpzodbtMsIYZJkM3JKHyPkxHHZAoyHn8O0c
 3R2fQ+HidWN1KDotMWg2CiOu5zucc2DaMJFizBb8fNNTtbOBVlcxEnGtVQAw19b0hob/
 zrdzuxJtSqIDeLbDkDMHqiYeAXg46qCquIZSwAf3QG5yBIh0N+q5wac+uLwC5po95YHJ
 WTynXmtAp1mh5lvFEv9aOj/8gY9w2qH8rrBRDr68l6hajAnrB9Y199FMu0Bjp5nEnaV8
 TmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HnYsEQVL9dMO2N/s53m3HWDVMwKyMQo5sK+LOR840cE=;
 fh=aqNIMequa6dOEIXi7Gj+txigXEIcZHTp0+YU8EEkZ7s=;
 b=T0Z0peLfWrCXoOpfjbMx6Ahc+6uTqyHqlHJbrwfpX5zS8XOQ6lq1cSmOo8fI9BzjMQ
 mNew2mnncW2FSBqUDKj7jZssxaNQvxjm/krbNgP9O2UGo36z1mfewGLmt4PltfJ/e3Ag
 exjBf9d0y6MLAuSK+gYdOFZXLs3q3T6UsMDEqiXLoz+aP5AIi6qOVks9fuZVEc6OgP7n
 KBmRGATNCjoQqH9kqdDQjhpVwRzLyv2TOvmcsNRuVtk7pEUM0j2ZyQorXC2aGr+WOoKJ
 9V1Z9SFx5EF+tak1pH/gzv57UStOXP+KPkhNUOJBZvt4cwymPKv4vjFUJ+4OgyMZMNOt
 Vj2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832312; x=1779437112; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HnYsEQVL9dMO2N/s53m3HWDVMwKyMQo5sK+LOR840cE=;
 b=g0161VOFJVhWls+VIQPFNSBQLopjUJ0hFVFbNPLD+RR7xklpx0NsgF0UYGFwr0BA1M
 iFd/tkcqgf9MUORxUygwZnWvVjDKsvLznlkTZJm3KS0iVjRMA/YmAvwfxy+qAiKUSDNi
 OSSHaHPGCUKVcZVqo3lwhMxSov3Sm7xY1sXhiLG9S90mjfR75mRU2s6hi35FwNWWZQbO
 XO+sNMxeEgBOJVdm4MVeGDdA2XvC5aVVTGOBTRW/x7yJpMuIg5CgfDYApauc4qycOLIP
 Ax1CBXa3XdP3hBdeGpt8i22wSje7lLh7drzy5iEOEbKJJMs11hRN3G8Zxf9ujeQDEEh7
 MaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832312; x=1779437112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HnYsEQVL9dMO2N/s53m3HWDVMwKyMQo5sK+LOR840cE=;
 b=krQ0OHZnSlv8yrM3GgMsOcuNBN8yIED/KXAW9fySPhlhCFwAem8vbPNb8m7z/GmbKB
 RB0XFMsbMU/g9hKTaN1I+0xG4X8p2seklM4w+MmnLCJdnXwOzFJBsWaXZR5cXkrgHGMW
 pQA6IPLgOkMh2CcS+8Eyf7g47SV4UpK6n0PKBGAR4R0U66ofVoqHvaPsbX/0ogMVcvvi
 0sOhzyp3zoCNFxBNExqwtyBnXkUesTHpClQ3TEGWleS70VwwwiYtUvBLpPVWGCwhEogA
 sdg97p0tSM0XdElHEJi5v+3gX/WEi8mLX+iqaEmrqkuR87XJnD0e8GNyvg8tmTevvBRL
 lDmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9hiYiv7D4vTOo1ERN6bs4qCZ75e8mrSB9yINnz2CxaSORvKZrI+QuOf3dhK42K8uCoGpHb/zXJXw==@nongnu.org
X-Gm-Message-State: AOJu0Yx+pJza4L5K6L21lRvrN3P9tvz34Wl12n4y2Od6UNulC0MD7SAD
 D6Los3sZY8Xx8B+rcBDfQ4k3zkaugL0ACb/b/1N9WJEqLWp6fm4NJ8diX1zwwhWje7e72bakRwJ
 Sn6ijKN0lTaZa3HHrfpxhy4AXIjHK2VtNBzx0QowScA==
X-Gm-Gg: Acq92OHI9ZOKuXJ6NLsbglAAWA8Vhgqais4aWh32aGUeYV4E8qesC6LriLkq3aNHuel
 0DfKAtNgHInRuUnJ5AUXpuovc3W2To+Vi7mnk/fMJVgG6FORt2mHvRq2jgM+a0P9R9PAfEFeq4l
 NyWpDmSRop72VXL8oO5QNahvLuiXO5oUwgAgmtxjbTVQNGGzMpfRlU09D310LXCA6lb+FRgK0w+
 SE/9Av33oUvXytPtyelKHd5OT6I4dZR06pWM8jH5obzYxi8uEpDEKFBp+bGwH9O6O8mae+ObClp
 uVf0IM1S6PEn/waqO+JHxcJ37G/BHZAMhV8zLYs+ECHnsIbc4AP3CS61B3lMxi3rKm4=
X-Received: by 2002:a05:690e:2501:10b0:654:28b9:e50 with SMTP id
 956f58d0204a3-65e227f64f0mr2343975d50.40.1778832311545; Fri, 15 May 2026
 01:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
 <20260513105517.146706-12-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-12-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:04:59 +0100
X-Gm-Features: AVHnY4LzgOjijIKoT1x5ObKE2BRtNh7QeM7Q1sXVSLElYpvF_8q4hMwxr_Jcw90
Message-ID: <CAFEAcA_QMfn6OvjuxfG0m90ZP54KpvkpnCjuVUakiCs5KEjUMw@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] hw/block/m25p80: Add HAS_SR_TB flag for
 is25lp016d
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Wed, 13 May 2026 at 11:55, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> The is25lp016d has 4 Block Write Protect Bits. BP3 specifies
> whether the upper or lower range should be protected. Therefore,
> we add the HAS_SR_TB flag to the is25lp016d flags.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

