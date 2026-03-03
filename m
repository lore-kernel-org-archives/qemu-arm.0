Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60235EC1430
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:36:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxO2r-0002Mk-SI; Tue, 03 Mar 2026 06:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO2l-0002Le-Kd
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:36:05 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO2g-0000RD-Vv
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:36:01 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64c9c8f8783so5761698d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537756; cv=none;
 d=google.com; s=arc-20240605;
 b=DyWA7CocmBPGOOXh/4jkICcSPsacC13ZYPHSf9Az053V6oAlcG+3jaY3r4Wfh9jBGK
 WHize/iW7mFMP2zK31wisL2o6nulF0Bg+3IVvixMZilU087ClyuS2jT3zDSU6VkzyFp3
 1Bcu125PCU8EEuI3+RU0Ffpzjz0QG4+WyzrRZvC1E/pwHWZH+NuRE2zCZlPfqgPQGVOX
 OYa1EKmfuXRU8jLeDErn6DvUHa3P6NP2EvTkVDvxQLZJn0Y1XB8mnzfafyQ8GZugE8Wf
 4cq45/wprTMaz5t5WZe3Y8V8Kpksk5MyBkXdOEkFwkJYE8nmMY4YaRmW1RpjqCtBcpw2
 GBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jNYUG423/WJwFfBAvxtbOTUONG2D9Kt6+fOOWN5TPU8=;
 fh=U7CQ+Lf8L5iJdsry3uDG33FUa0g+rWeetwLQSySbo2o=;
 b=OOmwSqrVbu+1bndIPRrdXZaH5A15gSHIBJBZgUGREE+P8w+fHvWYlRzqS1rr4Qs0xF
 5VvEnCSITOLqg13wDnjKab+puwKfH9odWxsKwZKO/Y+1jRTaS5XL+kO0FdFi7TGWCS4/
 0/54ZV77QL3zgBPLZTMvRARechLqhdCHolbWU0GDSn4sux7tzwVLF39ExkDiJVr6o0sT
 Z8xsPSJCX4n4fr7UGQxHoCb+Y1taYv7WUZg7dSa9qdQv82UzLE5R0+sYzodo97BdfMTK
 +VuCY0nIIPKQebkNBPKnt+S3eeeKrQ1iIQ7z5e0cQ01sY/Ve6d6kR4Cv+3h9Ln/+NpkC
 RbHg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537756; x=1773142556; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jNYUG423/WJwFfBAvxtbOTUONG2D9Kt6+fOOWN5TPU8=;
 b=oNjCIEJw/kWLMAkQPoG2UYcOw6vcTSBtBFznPc4eq68HfdWqlziQeauEkFnqj9S5+S
 mQE1YGj4684Fccvo8qP66oZMe6mTC8GupdQUitKLDYQ/w/daSsZQLugXnriqY9YRrj9G
 71JUZz7PeOe81NkhyJRv6Z9VwznjnW14BowkEJAjUmwAElDojNUAdHAalj7BarlAWYo6
 2b2mUukcaIU7XuqR+d5N4vAxTxGonvsN/kAM5KSuTd53bJUNfjG8fr/6vK6iZPDMzW5P
 KbSRs/ivnmtbAdV0A6jNxXNGHPSGJue/KnEfGZC0EnuT21i7FHKxJqgLPPf1wVOZPczR
 T6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537756; x=1773142556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNYUG423/WJwFfBAvxtbOTUONG2D9Kt6+fOOWN5TPU8=;
 b=LkV7p4Ylgdxr9NeZftNWseK363PoF+XBFuZv6lcq6/o+/EYLh2i16gsigTf14HpUKl
 MMG4UIbyUBYuDAqPqoopQk7PA9X9HhlH9spkSFe80+bDupVvarvSfuXGpdPC+L99DdQz
 iA6g8TgH8MGXmt/Q7/MoubokLvOJTVKtwqufQddEbwnRmLHyzFYORhZYmNvO700wSXTU
 us59IUKb/fc951We/5CSqSCLunZEnNmIJSL4TxjS+KSnFIm8CV4ViXHDI93SRanxfx+N
 ETmEJuIkYH6zjnLVP/GdyLDktLKB4iSS2rRKO7nhrKKH/45a7IWdh6Z0GmOeXrNm/GKp
 2Rvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5dohIbW/15AOPF17PgUPlFNp90PYJaKJCOspSPiQWWR57/kBvmRwjiY2K0rzYEExywwfG2NYxig==@nongnu.org
X-Gm-Message-State: AOJu0YzhM+JRomT7Jh56ZlqskN0us8uVWwRxNQRD8TGNSfBgCCzAoD3q
 3ppHXnFCWqZTclXXdP4hhMzqmoX8HIQ6IaEvW8V/P2Zyiq4JWP0IZAi1cm4k3uzeZzc+kW0WY2b
 BUWZzhend9fYDuUoQ2+QsKAFCEaXUcYI41GycagPqDQ==
X-Gm-Gg: ATEYQzxQ/4+yEdx6ZRc6lzom1qfCpSr8ReoPzwuUESt4heIpPfIOG5bxUehyk+xlAoV
 yOQAA89SYpM2xR1Xf4NLOj+iizpYOIVlUL+trRJ9uZvz0IALYKjOt16UAOv6BmheYy2YqIyyUaO
 sCDsvaeF8KfqGdO6U4hyN5NEanvBG7VrMLbEl7X194PGhOppILzBMJ/RnyUpj8nW8787IVEFRfh
 35zFe/UQYCJyyxt1gT41tlovAAXrHWR1Y0GbB3/rmeIY+CUMfGrXF/Nbi6oXqr/2T85wFwEKQTG
 k4zvZbuu4L3itVwPU/pBvG81mcl6jDCZ9GdvVUVGWInLPeEzPb+ETPcaOi1vLtWyBfI=
X-Received: by 2002:a05:690e:130d:b0:63f:b6c0:23f8 with SMTP id
 956f58d0204a3-64cedce4f47mr1044985d50.33.1772537755702; Tue, 03 Mar 2026
 03:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-11-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-11-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:35:44 +0000
X-Gm-Features: AaiRm53MAL6nwdFOQhIgqc9wlQyCd_q1TMPWryaEYM-utEPDBCxRiSBj8YrVuJY
Message-ID: <CAFEAcA9beXAZHHnU-E9w3Ze1yA-8=Eq+nmjpqL3iuFHVwGk8yQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] hw/arm/aspeed_ast27x0-{ssp,tsp}: Do not access
 SerialMM internals directly
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> SerialMM inherits from SysBusDevice and exposes the memory region by
> means of sysbus_mmio_get_region(). Use that in order to avoid accessing
> implementation details of SerialMM.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

