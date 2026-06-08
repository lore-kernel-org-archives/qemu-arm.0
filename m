Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D84CD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 16:36:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWcxU-0004O2-5o; Mon, 08 Jun 2026 12:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcxS-0004NJ-Ps
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:36:14 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcxR-0001SO-8V
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:36:14 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-bec2ddee9bbso915571466b.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 09:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936572; cv=none;
 d=google.com; s=arc-20240605;
 b=kBEwzPQkkJK+fNhZOYXSvoRBitdW51CxZ32hIsm4VaVdelLuZVGo0f4NCn3F99vmzY
 HG8bnbOfYstGpi7tZ8sreO2DboIT2gJzX5G3GVauJOd37jP1hP0hmSdXnv/9qfzmn1nf
 YiVSIpfPimYJLf9h0WJTHYaVccNMsAPz3XtQ7ivavh+y8LgCtfz+C/6O93g7vStHVJv8
 kUVa9RJ99tQUelrUEr+3dGXtDokttmbWIiRP6ku5di6pt+6r9VHERscSfWDjzeqrZbKy
 n1Xk1Wmd6KLU63bVvECKqI+CS6xR4bZdOUZ20ZPrc2gICeCbq9TkYIVZeZoxt0lNnRVg
 m3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NwmNCLGkuspzIgI28Et1TAD4Xjw7J4i47cOhJHPACAE=;
 fh=o4SOxIoyYyysnPLjWq9AmAMVSLW04zPo/tvpYY6eUsc=;
 b=I6naxM7d09AxI6KiODBewfEXpH+rE5Z2PbpyM5CM9qp1bNF/cuL+NbAqTgYBAn5IR7
 XB52QVg4oUBj08OMpUgct+i7OYls6G5Is+ZR+nRh4vPRAmGW+hWe2SYULviyEYOXXEKh
 6l+CGsEd5hhLZ2t/S3AaDnxXTurB5FnKIMqcDKETM2T+htrsEL/v+wBttjiq+iPV9Mye
 GfhQa+Be9SBxJWk1EuCx7+iuaiyfdqlBtXNKQkAEg0rVZXrx9P0gsACtB/4DoSe5mh+0
 D3gK5u4EXzRqisZrz3eHHXmo74uMoS+Mk8zbEx/pdsmUCvaH8YxJImMB4StDRQPa8F9Q
 yTKQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780936572; x=1781541372; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NwmNCLGkuspzIgI28Et1TAD4Xjw7J4i47cOhJHPACAE=;
 b=xR+8vaRia8renAl0rhK6JRLsraMlcM8xtSX/t59zK9Tlz3aeoKhL35q2ZUZ/c5DOY4
 KT6rkDLgov98hOx4BThxV6p6dVT43EfJJvJgPIRX+TPlWkWOTPcSp2hf8MSpkCj+q046
 skvR14ILbwDpYR21UOY+YDaMLnWSLQiLhzYEjDcqpQLzUHzWb/OmpI8VSE2BXEZATBt6
 nQHvG2VpyZ7rXC6eJ5UzJFtXeGZDgIOELiQXnYERutnXn6GP0EDQIqGBQYUzTLE8SW0f
 VASvKMWfRvHi9C6GxcraL5770LwLe7/icMwdYcar5HUy7CuDZcKSEk0acZYFCnbV/kzU
 h+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780936572; x=1781541372;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwmNCLGkuspzIgI28Et1TAD4Xjw7J4i47cOhJHPACAE=;
 b=aVJoZWRJBZZLsQBBoZsWobJWtBhceCQQ3GhtrDdbvh0iACF1Af/bKX1WJtXAjYETOY
 yrqKiHt8bj4IrbTmzSQHjthErUsTx66l4K8yEF5ZyrhBTGl0lojAufiVk90NCMk0g7k0
 J5gE552LjtQUoLHxLu6j7Hcdzy28vkfYMmiNdaSFD7F6N3a4o4OjmsmvR+hLDsct/stY
 TRPuvoaxXYdIny4MRWyhuyZ90LX2ytSP7dsZg9DNVlrubab2ZY46nwMwSXhfmHPZqPEz
 C9w8WLCUmZG6HE+Q4NtEbGDJatMxI3QN6AUqAiekS8qccgdzVRQ1eW6m5vBkpSI2cYUf
 sP8g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+F3z1Twcuo/RIxOSjWWewiwpCwcJ4t62m+jiLRbLqfEAdcgWDffcyW5NJyg+UvqNRlwUphpWJXBA==@nongnu.org
X-Gm-Message-State: AOJu0YyJBj+96dlSiUrr8FBHXC7+/8M3h48SQP21mVEnbrndvoKyKqC4
 DDPNBoW/nUYjaVIAFFJRgxJQRTaXShaJJnMVw32G/jAuPUE5Elefq7Xgx4B7Gf+N/LiSnr/+Z5F
 FEtqWPdVECEyZ1ciD+yWcf6wadaxkkLy2V8frUgrrYg==
X-Gm-Gg: Acq92OG+0YViTXkQ8grfckHESVP0Gns54APG9GiYg4DRxbUsrZqULER7IcjpVvynoBK
 bn9sfO1fcbChlYWItVjtCxOZNNmnbwHwerRJ6wVVoSVZsSch9FdeIJdUXqX0prf1Tb90HkeHbBn
 /2ZMkke5EbURe53bBl+tm5RKn6b2VLo4Qna/2bdvoo5j7wNYjrTuf0Z8cZ251rPK6bSyWM+4M/J
 +zYxYj60cdzNt66Out/dV48EpBIYuXkTj7SYM1eeEQOU6Hk1w66X/85jocXoHhmVwB1P1JR5w9o
 Dec7f6pkOZGl1l+3iccuUYmMc6xOm32QO26jPD412/zi90Ab/KncXQOHHaFeCzTEHdIwLI9FccN
 N8Q==
X-Received: by 2002:a17:907:75c2:b0:bec:db41:e4ae with SMTP id
 a640c23a62f3a-bf3737ebea2mr555282266b.43.1780936571371; Mon, 08 Jun 2026
 09:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-6-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 17:35:49 +0100
X-Gm-Features: AVVi8Ceep9zUbh-cOsDcs4ya6Q6mN97MphPOKfCRFqkWAD8wxZqdo3ZHUzUHu38
Message-ID: <CAFEAcA-L_u_jJL8aG8OGuw9Xixz-LqZrgtTnXp=aZog4jRBQyg@mail.gmail.com>
Subject: Re: [PATCH v9 05/45] target/arm: Introduce arm_init_fp_status
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Wed, 3 Jun 2026 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a function to set all default controls for a float_status.
> Other settings for specific FPST will be set afterward.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

