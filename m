Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE8BCD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:55:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTJv-0002jT-3Z; Tue, 16 Jun 2026 08:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTJk-0002cB-Uz
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:55:05 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTJj-00059h-Fa
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:55:00 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6607e80a846so4583952d50.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781614498; cv=none;
 d=google.com; s=arc-20240605;
 b=HfNal+Ocr75dL9ISeQZ09D/7QskORib0NY+KsQ4Hhy9Dmh/62yuejQM0cGtZjuXM/5
 AmJaIK8C/xs66xG0z7+c8pgu/7wnCagx7uXoPMgzzbyXnL8hOgsf8i+Mr7N/cGoOj6JJ
 oaZd7n3aSkFEcJmpIVC+l1rl/ht0iYTiMDsGhW/CGIlJKbAAg6f5ybAX2W/WF910irOJ
 Xv72tMC4oDlfV/himB9TXEX6E05Wmjprn8mhTUGT4Y1jUcKhSYJFzPTNmDzHH+teqlrT
 XwFFAbSpkVwcDHGyxly8feX8Hj5/RpRFSL2Z0F2B/aVlkG6gIlfmKHvyLGbr3WVxjALq
 LSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=k/xvOiSlwvHRre4h1mmO8adGvzPHOl6OR0HPA96PChc=;
 fh=THj6MY/6m8ulyCjuFREGQ2bqLO60z/mUk+YrKa49KIU=;
 b=EsKk3483GyuuGMsoUVU0pSmNpt7KZRGxyfgIj+lngseHzqh8XqXox3fToB2Zzej50l
 Auy5UiUbGpFZEYd9h4pnTIpHnbPYMG2teTAYdjU937W2X8KGYrJ/AeUFE/o6qB5ZTp/n
 t+hiIx31Ree1nzAetnsDcL1Ym0lEVI+k3LCI5LQz76sTpbA8rF+XHbUjuVq+66KigzFa
 T5k+RgTl9aLvoZodXhlelth4mr05XO/MH6Bp1b0L13OPwYBPyyyS1QCTzc9O3Y0YgCCm
 UzdeQ3dAHjRJ1gIjfG13jrj3auXiPcntsRFw7u1YbN4Gg2PIwi0GcCnKVEstcu60ssyu
 edRw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781614498; x=1782219298; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k/xvOiSlwvHRre4h1mmO8adGvzPHOl6OR0HPA96PChc=;
 b=yspSxe/FlQbSqZTZDTOsb7pX2BxM8CbRwh+qMw+phP2NrIK/kXVREOGw8jrPmOwLHy
 zPfbG7NB0eEa9Oni/hNXXW+fD3L5GfdRc0Dz39UiyrZR2EUVsOk17jB+bCNnKJYZZyyn
 xG2Xw4FGI/KXs02OFtL2meREWnlyiN8FmQAJ4UGaittgHVshqH+oYghisRK2kIYXNSI8
 3exBp9oJTUcC3ghP5hHbmMa+4jR2opYabDba8Vh6rCqR2f5ZTSPKLZmY6OCFs7UzApGU
 qHem6MZwjTq1gpIo+eh9V78dMVwN/MsONrI4rlT1axrDtsB1snshNSgsynZvlNduaiTT
 Gr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781614498; x=1782219298;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/xvOiSlwvHRre4h1mmO8adGvzPHOl6OR0HPA96PChc=;
 b=o8GCTRo1UyedjRxcilzbJy9xAbZm1qjiyzW8m7yVrpvEaz+JrD1WHcA9t4hSRWJNIC
 IUJ9YlqZds2jtLiUVn91WnSRrLPq+9gRCZofv4EbkmlDvmVgNCxsZKVUYmFhSOnLUUY6
 zWmHlOB99uQNGByqGULYc0/fne1JVCvt9c9nyYyXLUPCojWYPISe4GwH22hJF4XZjRkb
 dQ5L/Zb+wISr3cssTfh7cClzZF0iD4opXpR58mSz7f0dlPIkeT/3wBVqmXGjDrJxI+rG
 kIjiWyuTiQ/mSV8NFHSLRH0Y3oNntaX9ka/fSinNlsKda3PmpsBqlvaeMum/LdSXKq8N
 Eo9w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8AxZut2N1x7t1dIh/NFrZb4HQeBlETG6SkGNTJcdZwHHsGk8+Uu3/eASyM9MI+qGxzkTBSQHkwEg==@nongnu.org
X-Gm-Message-State: AOJu0YwFj9PfQr74mQOzvYdB2jqsoB9+y81DyL6XTCYX2NlqVpoD4JNk
 dMpqL4DZuEjD2ziFyt9LiUddpHWKFhCO3d9LpGGaHlAwP2OLd5o++dZXyJ2HFqAYk3xKcsnpTLt
 HpZwBkbmTNmC69Y+7wtUjTcJjfzJgfaPokRIHJCXpVg==
X-Gm-Gg: Acq92OEr+NrMrmd/x3ZDXxbUkKTH/f7cas/Uye3jIVtwJtJ5em8yFO3wBVdebePkPSm
 py60I0UMBix2CLh1leIN9fVvMOoUihp0A0yLYLOHy7K8pBuY/0GOGgbigq9SV3M4nAGgdBvWW5u
 ZGJhiEU0P4gf9spekOE3QkY4CY7CoVbEorkieySh1V6gVZb7Cra+LHRW6gs1WL8/fpVjTKZbY7I
 8/ZE8AtMUY9UME+teOp9wwrpeRTkZ0lGQc7hdu+5NFw0HynDj0RBQOc9uDBgbVzQjnh8XhWQdBf
 5Oq3gYjHMiNxIG65ZFZGGKQWHRY9bgdjVmTzguWIwjc/hSOJfdutcnV3milVHdyDf2U=
X-Received: by 2002:a05:690e:128a:b0:65e:412c:c4c3 with SMTP id
 956f58d0204a3-662850fd127mr11948499d50.65.1781614498012; Tue, 16 Jun 2026
 05:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-17-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:54:45 +0100
X-Gm-Features: AVVi8Cc9NQbaQxz8iCFMON7Q0cFhzvXgxs4jOa7dFUB5HSSxX1sOe_tzZ9RTQXA
Message-ID: <CAFEAcA8h0kBujpwY85XwbWLXb_5+293uSjQHwVKNwPuoubM+xw@mail.gmail.com>
Subject: Re: [PATCH 16/25] target/arm: Enable zeroing in DO_FCVT{N, L}T macros
 in sve_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the low bit of simd_data to hold a 'zeroing' bit.
> The simd_data field is currently unused and always 0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

