Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8742CCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 09:59:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64TU-0002RQ-I2; Tue, 07 Oct 2025 05:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64TT-0002Qp-Ac
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:59:15 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64TR-00044R-HJ
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:59:15 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-635401a8f5aso6547990d50.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759831151; x=1760435951; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0WTpUXsfNB67Yw901XWHeIgLb02rVsYQ1S5cu0Ru0to=;
 b=eyPq96grH4GIyjb9vFw3dOGkqS5zSOiHdsP3YgQVy5uvJw0wm02cqEdo6qVIUKX0+2
 J1i2axznrUK8eOnZT0BuzplmxhLkiSwDpCxEQLanHkRBuxtJb02eASapqY6GZ5W5unFR
 NAk/dLigoJF4o30nuLBo/h3hzrU/EWVquLfzrZ8YPU/gn6CMTxqmbZ3AChX0GPe/bi8S
 C1quXW574WFfGoscLCv0MglHszdrsbgh1BlFjewDgYp/quDqwaeUtQ48Zk5bSPptjTF4
 OD0nQd9xqVHRXEqfIUeNpHE0eD2TolsbYsG1uzqOoC/BULTAQVViU6NJ7no639nnylZs
 bxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759831151; x=1760435951;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WTpUXsfNB67Yw901XWHeIgLb02rVsYQ1S5cu0Ru0to=;
 b=tBBGnhYM7+xNtIXfgnUhBD3Ri0k8cbKVmDwZzeWFO+rtFhitaTFn4OvW0KX48i7orS
 iNzDsx7zy0yfP1P0g/PRupAewY+NJnz2eztOq5sI3/ObDOzdad4perFO99zH+xfwYB/V
 3t0bPmNTBSpM3vjCYqUMBbrxlWX/sRHKALCTsnU5ZoL/a6kzawccALoeZD3WWbuKYJlk
 h89bxinSTPVMaf80kw+hA9IHT+RVn+k6fXBesvmJwlJ+A82IoCRNZis9fjRCKWZ8Bl8W
 sZb+yicma1qlVGB/1Pil7XqcEm5oVCXpbYcSnLvfe4e6NwNT5fbn0jG0fMmNVhNGC8aG
 0EHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3TJtBsdU5rkRSaSkhWsKpxJPnGcAl66mgMVl/HIQj9IqJK7rF0/TwVaVPjxeS8yIGk5gprQf6Ag==@nongnu.org
X-Gm-Message-State: AOJu0YzwZo2wO5UidEx56NLF3fUQ7dZDwR1G3kPniwFk9Voy9blKF1z8
 AjERofUD0TqTMqdJZafNye3tfUcSdKOrQo32fp9aZnVtNwjO/p/fAFOr7C8b4LFAOlxh3uuRgMs
 bIxGnP4Lp/Z4ue6KNHBTtMQW+HP1d4tsdOAJtJkz8/Q==
X-Gm-Gg: ASbGnctTiPY90leQLfRnWwtuTLIXnr5PkNyNoBLGqFeVrKDqohWKNPUF7RRX9KMRtUx
 ucmVhKqcKQ/4TDdCl6ei6X9zoSzBtoM8izZoKm/BQerGwxZJXOAQEoOspIwbeD1xtb6UII4Yp+X
 1+dodVHUamXyJ/kdiqZXOWvj+bPKv+12uRQCHtAmrj4qQi6H670OLlEKnQ91bVP92c7MKoeoBEk
 7RWgo9kJwhYB2+giw8wZzLvI3ZpFVQ1ZBIeT34WgcxtWI0=
X-Google-Smtp-Source: AGHT+IFbvFz81EZ/nNMwG93LSz25meD+v3147ZLvDyMf2Ekxg9KJ9yPuWExTgtVJRxemIWAgLkQ9ARgDCQBlCngd/30=
X-Received: by 2002:a53:bacf:0:b0:63a:6778:7437 with SMTP id
 956f58d0204a3-63b9a0f33b6mr12306593d50.37.1759831150936; Tue, 07 Oct 2025
 02:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-37-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 10:58:59 +0100
X-Gm-Features: AS18NWCf_5dg4llJU_-tX4IZ_VmPCrjZA8GFHcw9-uLH7FADt6UzpeWPiHpWym4
Message-ID: <CAFEAcA8ZPaEboGDjBhkEENPP5EUW=-TbXRCaoKo9PqM04_ggbw@mail.gmail.com>
Subject: Re: [PATCH v6 36/73] target/arm: Expand pstate to 64 bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 3 Oct 2025 at 18:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The ARM now defines 36 bits in SPSR_ELx in aarch64 mode, so
> it's time to bite the bullet and extend PSTATE to match.
>
> Most changes are straightforward, adjusting printf formats,
> changing local variable types.  More complex is migration,
> where to maintain backward compatibility a new pstate64
> record is introduced, and only when one of the extensions
> that sets bits 32-35 are active.
>
> The fate of gdbstub is left undecided for the moment.
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

