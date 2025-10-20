Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68ECCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:51:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vArEC-0000fi-Gq; Mon, 20 Oct 2025 10:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArE9-0000dE-8Y
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:51:13 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArE5-0004Sa-Vo
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:51:12 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-63bcfcb800aso4768961d50.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760971868; x=1761576668; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pnUo0H7vcYpXWxH62kAs5qwIR2CbIDJcmu735FNcVQA=;
 b=AN0izEJcOjgV62IFR82aU1kOxmeeaHwXTB/AR1dAq1L8zLrMZZWza6WcQddLcKPVFG
 ykp3ODRJrr6EbmcZFLarC8FdXuDCqaIHR8jRyvyIZ0H8zz3BIgpYgCgDOsWG5aIe60i5
 UKEgoXj8EKoouuUWNPJQkBZS6AfqjRKhnSpp3I2UEuTmUcQkay1igHAaT67hH/QNEGH8
 j6nMuMM9tIWuV3HL5cmR5LR2NIXRVrmrJaC96LRuGDNfsexgsDx0z+7UQh+ot9zAxk1z
 t1yw0x+XJ2kmzy+whqR5UzZ/qHNn1/6z1oeHA3mI+1ZZpPdN7c28tsfeR1pLyq/Uicxq
 Yhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760971868; x=1761576668;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pnUo0H7vcYpXWxH62kAs5qwIR2CbIDJcmu735FNcVQA=;
 b=Xud0DSX9bXgZcspb3cPHH60Zsbu1bFFHC/tNULZfbsbUp2fNB0AusZYOqmfhK6qlnB
 037On2OuZ2MMycTNnBpR4yPeH040un4JHUsocvFchvu3BYWUbDtDRTzSlDwUKVBxSoXq
 MNTcQBlR8rHEugBfdvfsKrr/eJuDDJIVraEVh6m4wbKbutc+7U5Mae5Wb2go20Xajpio
 PXhfOW3dDmgfiDCjmQqsR/s3JDkcQuiyqWSYgWSdumvF4sjOgsQW82ETgP+4PnIeQFVx
 xhFyqcV4cnxqSR0RVyTqRHyGHa0+fFDx8nohoVW1kaI0JZE8BHL+HhtjgSOM9rk6pCV+
 zwGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXkCQhKg4Qj6E9V3j4xIZFn1PnF/MvNMVZh6ZUF/wxuG9NxJKv6gI+8Re+4whMyPxY0wkNIaCYMw==@nongnu.org
X-Gm-Message-State: AOJu0Yyzw7Os7pGl9xeeMqh/CGRH4uaQagwrKI9WH5MZb4RkfFCGKkwZ
 ZC0fLkKVojF2laA11gys7V07GA4+SNO88EIRlGvQByrNxXqk7L49L/ws+ipwTxGXyKw5iruH9Uo
 44j7V5b0mtyPJECLIgsTTyIJ7taUTPV03KA7L8d0Ulg==
X-Gm-Gg: ASbGncvzDWISOaRFD9uJqPIfpqWdL1OVp9KdFjXFwsU9GjFhDbPYOVuBHdZOPLv2pV4
 GtgUt+g6lxVTHpUbuqDeniwPlajc+yJ20RzelCe2YPZO7SFXIn8esNle5FJLkuLUScVbzEUk0W2
 fawlPn13FfNSptsW0ODA/IqyaBPecfbX2OYtaHuT9V0nXkojDdqN85MsAsutNS6kkOrdQxuFsDy
 nxCXKdMOWVCeg4bN53DcqDhi+YM++u2LI1j0g2/fjdTtRu8ctZ6DC2T5s0rJap4ljR3SFTw
X-Google-Smtp-Source: AGHT+IHBublffbeLsUla2pmH05IR6VDlmfVJy23SzY/ANJRGA5FHIAWg87UNSITA/1iwCoQxr+IhRf3sSIvYp7opftU=
X-Received: by 2002:a05:690e:11cc:b0:63e:1943:ce46 with SMTP id
 956f58d0204a3-63e1943d20cmr11713280d50.38.1760971867960; Mon, 20 Oct 2025
 07:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-32-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:50:56 +0100
X-Gm-Features: AS18NWC5asMGk64F-C3lPXS65sBdJGycRyxbFDy80R05cLZM540sUQYgoj4vDyk
Message-ID: <CAFEAcA-h5QXVdacxK=Mz2y9jp0TKcSaQ+ry=ZjvL8ZP0jOeUhg@mail.gmail.com>
Subject: Re: [PATCH v2 31/37] target/arm: Implement TLBIP RVA{L}E3{IS,OS}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Tue, 14 Oct 2025 at 21:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/tlb-insns.c | 53 ++++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 14 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

