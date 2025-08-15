Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3527ACA0EE4
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:29:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umuUW-0004zd-Ie; Fri, 15 Aug 2025 09:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuUV-0004z3-3e
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:29:07 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuUT-0000Tg-5F
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:29:06 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e931c85710aso2028834276.0
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755264543; x=1755869343; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NtUg4zCP1cQxctfX7RM1duig9eXJcS9WA10ZXGZod/o=;
 b=eQP3Ju5aP2bnyKK/tVL6z/p+K1W3PogHJlKca7UsACN7MbRNQxQzu1AhmyDuM3XQLp
 97UUnhbb++sCqSJY8/JzGwVZMJnAYuj3iOs7surqGEk3ICURUPm0gTCiAKp1S2cA+rPx
 /TNVtIBNie6TBPSlu/UMCXkU+3RB0GY3GAtyciBT9hsZ2vgI+rOEPtf0mN2xC7VrmOi7
 sjQTfue8FNsZRl1fOCKIzioRvViL3UyLiC0GhvvoNFjB+6DGM2j241lXbu/is1+n2aV8
 jHfVH82QGGstaoLGR2vg/4VU9Ikt37p7dLvDCDwyKAHQZjPv/J4Hrptwl3ljBHAviAJW
 uK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755264543; x=1755869343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NtUg4zCP1cQxctfX7RM1duig9eXJcS9WA10ZXGZod/o=;
 b=hagzZpjWTf5IETdfRB3sprYItRSC7WfBqbDRIZmJlqh1UIl+B5XFnInf8sfKvELvaI
 L/ZyjTGrv7LJ5QJNjQEKfqQKc5uCaG+A1zxLO7eTOnnylul5cWEw/M7BRuA66gRzs8MI
 oT2LZ2pFTdQRuVNun+fqJuoPuBDGkMGx67Y5nLD1WDSrejhrcgUow+0brz2BlkVeSXWX
 hsKxgzBAQMziLe9NOr9OlutjeadorYt7Z81tD8UhkYZblcaJFzrKSADSQGFSvJY1Yhwv
 9j/i0jtg34W3LYh6W/VUYAE+z+/YneZGPRZ5Y+BfxwyWU7wA2MGhg3YRveiOdDAUjK6C
 ts0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXACrAdtQ9Q66quFAVAjzeOePwTxBWNf4+7RnWrkeEjcxS7suQ2BV0wFlRYAKgn+mWJrJPy7IQzcQ==@nongnu.org
X-Gm-Message-State: AOJu0YxcGnNkprCYpaMfZPbKDgExnZNHdK3bm/nv4O/Y9ca78ptSvQO2
 5C4fgBsQohzSIBQHHJtGAoq78BXraoqc9XJz+2pIhim2TC0/7CVFsVPMek08gTY+TRnQLvVimbZ
 bs2ntfjhXyZKhVn0jj+HRwqEEDCGwgnayJZeRviPKdA==
X-Gm-Gg: ASbGncsZ87vQ3qspLKFR18uNqSig7PB5ZiZtlBD060dX3lmueXDBEx6BPKqbE/Gw+R2
 haBsTkwXSZEXcQzCFV4wK2e7emHIqQ8I5wq7H7upM57kzpmqs39ajf87Kpxrr3LwSljEFSU6XE4
 FSDQvFSO87kpL+ra+oj26PEk/ZAuwteoSou0cJQJfS3jbC1hM9R7Y6FN0Wr4mm/UudE4IZXEATA
 whZfvlY
X-Google-Smtp-Source: AGHT+IE+3IYRpsJ6UGQXreWYIzjdg5nNmd2++7jhB5+ujaTE4tTVahps0SEPRY0/q31xj8XjMxaLhvoWnnVxc3HEyN8=
X-Received: by 2002:a05:6902:330a:b0:e8b:4282:65d7 with SMTP id
 3f1490d57ef6-e93324af7efmr2350411276.25.1755264543433; Fri, 15 Aug 2025
 06:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-11-richard.henderson@linaro.org>
In-Reply-To: <20250803014019.416797-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:28:51 +0100
X-Gm-Features: Ac12FXxZ35oXsPBq5ZH_If_vK91Mav0NZnunQR61fnHf--8K2RmXzmJ77El2zTU
Message-ID: <CAFEAcA--tAuxyo_-rS7JN6a8twzwd9q39HJHULrt=wG7Y+GpqA@mail.gmail.com>
Subject: Re: [PATCH 10/11] linux-user: Change exported get_elf_hwcap to
 abi_ulong
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Sun, 3 Aug 2025 at 02:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> AArch64 is about to add the first 64-bit hwcap bit, so we
> have to expand the return type.  Since the only user
> assigns this to a abi_ulong, match that type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

