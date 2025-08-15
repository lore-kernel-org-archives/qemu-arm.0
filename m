Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A7DCA0ED1
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:27:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umuSv-0004Az-7w; Fri, 15 Aug 2025 09:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuSg-00048d-0H
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:27:19 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuSd-0000Mv-Dr
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:27:13 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e931c6cf94aso2283841276.1
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755264429; x=1755869229; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qqnRzV7s1N9jHFKdRP6fm6kcv/FCXOcv3Bt3/lnvHMY=;
 b=iK7UkAiuVlqOixQOF/j1Gt2bjhyjCGGQaxKpFFTqs0AfT9sQFaMxeoge6ggwlNpRAa
 9MHkpSqHKE1FyMoUGagqbYDQ0gBD2PXfw7B8GINKgi16urVi9N5XR+RP4ge2JmK0Zx3l
 Xv+8/hSMpnbAuwaTrAlm8OWyutsHnSLpuEr7K3R+JBY8IClC78f7/Xj576CEBV5nKsCd
 +WyvW17hkWhlk7qVoYyMFUeiLiDCZc4WWn1xcXr16sHYrg8C8r5+7kmZqiAM0sgvhG5a
 OHzNkdLtfF9FegpXpXSRuuUKzJWhkOwrmIsQAlnFUhXeUKCL1L4TlOts+FiidMMoZlqj
 meWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755264429; x=1755869229;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qqnRzV7s1N9jHFKdRP6fm6kcv/FCXOcv3Bt3/lnvHMY=;
 b=KJ9KIQLqbDnojKo+1JTLCBn3uqoOwo1yx2mN1u6K4rW524FlqEMKBCuDFnYgygnBjv
 yBui4Jw7xbeg6/xcRO5EsjT/ITA4eA2dL9lojcXA/RzgRFxJByPqGlIp9XzIbKAuDKQ5
 2atXYr4ELzyT/Y46S+c6LRIQf4ctwguCVyc5LtPfwySEbDIfmBWQJzr3mlQQcakIi5cw
 SgYLd8SotylbJ53G/6ADAc3kNUuEV+BVgvnYF6ZMJ2dEiPUZl2SV/ZFVaNIh24irLmdZ
 kn5WX5DBdmTqwmDkonNdzKvwbaUmFnjbuXXfbMbCd0mWgWaB5zDIaE8C6VioGpcYS2B9
 fkpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUImg6A5G5BTscXP8V1BioQyOycixD1V4UuRZ8bHZjSzC8Iz4aVGn43Kh53FZWM6wl8U1GdclVWmw==@nongnu.org
X-Gm-Message-State: AOJu0YzlBvshGO0K6nuw1nwuty7wFqzBLon6HjRZnk/ifUqoNPRQ1zn8
 JmY+5D8B0rS2eKRLOgY6RHvQWvKWb0jvjw2UZ9hbn80RyBAmozH3GDBRPpWSqHZJqP5pxN9t1Jt
 owEAkrAdVSDSvl9MGIpKdlhIcgrKftvFbJctNeD/Jqg==
X-Gm-Gg: ASbGncuhRRQ1ehMI687yYqe9BfIlxLmRfMwdi1TXhzQ7/doe0lzZLZXx+SAqaS7jDbF
 4VnwsLuz66wmmsbq6MRotQQf4wdhtJGs+KtFpwC6/cfszhyzDKJLIiJu/6Lt6Kom5b0duDnIoFa
 /vu6krRP7qvVKvbjT51O5UxroURhAXVjwwfNcKApLdjS7WwKfb7AjyPmpV58alNWip8VhX7aXXL
 nqpEwlz
X-Google-Smtp-Source: AGHT+IEOd1655jx54fNrs9oD/nRMi4nQWbyFKxMk1XnGrDMhksQTWuTbxdJfm/QfkUek4iR2KoG56EZSE/jFTlQjpQQ=
X-Received: by 2002:a05:6902:3310:b0:e93:cbf:d675 with SMTP id
 3f1490d57ef6-e931ee69dabmr7699286276.9.1755264428949; Fri, 15 Aug 2025
 06:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-6-richard.henderson@linaro.org>
In-Reply-To: <20250803014019.416797-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:26:57 +0100
X-Gm-Features: Ac12FXwheyiN_97YS-rlTtRA17HFTkDgm-qlY7vUzOJpEcwmU3AOaYRfDnfCixw
Message-ID: <CAFEAcA_Ea0=n4xB0BuJn5qODTd1uhrjqGCLAHR+X5BsK+GYhsA@mail.gmail.com>
Subject: Re: [PATCH 05/11] target/arm: Implement CTZ, CNT, ABS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Sun, 3 Aug 2025 at 02:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 31 +++++++++++++++++++++++++++++++
>  target/arm/tcg/a64.decode      |  4 ++++
>  2 files changed, 35 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

