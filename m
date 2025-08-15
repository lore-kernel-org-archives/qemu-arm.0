Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A66CA0ED1
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 10:40:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umrqN-0001vD-Cf; Fri, 15 Aug 2025 06:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umrqL-0001uX-NE
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 06:39:29 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umrqK-0006oC-A9
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 06:39:29 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-71d6083cc69so16127307b3.2
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755254366; x=1755859166; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9wc/eqV5CJpniaNekjMFu9EClWKreI+sOXyh0BkdMtE=;
 b=Tz8cZWICI6bQ0g9VNM+1CjpNM6r9ydn6b36C2b3tApg13loHnQoCoaplI8buUtDq4+
 jBNAWWnAEEOUeHzlBnv/hVNGIrjaCFGSHdQUL/4yLlKHHcf4tiMfFspBoRYoLPcRUYMQ
 n51mNIuoY2nZ/gniT4pyTa+/Oqwl+FP3hpwe32jtFkKgYlARHNKpWxPxA5dQ7vzWK69U
 g2xMn01s1XWthsCYuHngw+h2s7hykOlu8zbxFEhqLq56VcRmZJ5QB9rYcs/vgRGaIVSk
 Neaj443Qyo5sxxpONpM7ykTf3H21abdA3XDPoGiJSBZhBOHW1vTazWgCh9jyj7VnQYnu
 FAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755254366; x=1755859166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wc/eqV5CJpniaNekjMFu9EClWKreI+sOXyh0BkdMtE=;
 b=lsN3vbxZFfGZCm+6GiVwfav1ENenE49Igycsoov/jJQYbP4XGoGz9g+Hy5Fjs7yWnC
 5J0kBIUczk9dT6q3De840MAnJuULaDFjnK8ZFSOCSlaABUqKCaCgG7VmxI6nT1A2bHoy
 P8vlP8bl8mCAE2uh6YhpODSibg9VUPHCVlh6beToyidENiSZd79MDi/UYA1Yi8Yp3oKQ
 62ogzHU7fDd5wWLVOM72yoA35YWz29GVfUNLQEIIeA7lXbV8FFPDAfj0mJxexiZclNQx
 J+pWK0Yxxiw5/l/dO1QFH+K0aDtoxuKDDZEopMZ1NE9YDk49fVeQjRqGsYBvBQG7k09S
 YolQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVvVnfcAhR6mI0W7I8HgGrY1qDSTsTipMc26ibVb4QbXja5poPkA0bSzcmlHVQhYeZzpFpT6kxnw==@nongnu.org
X-Gm-Message-State: AOJu0Yy/lqhAC39nwKfA50+qNdhUAGrXkQs0d0lw0BsUU+Pn/yoqw9UJ
 9g/ictwXk7LkEk/v72k+2pQZdRonLbNCsIK9BCOwAXgHvC4MpPX1I4k5s3VrsTXpPmXELO8SZ7U
 OL287k7r3aUOHiQggxh4jYxBCLKdPpRmrnps5gdU1xmliFCC2Dlal
X-Gm-Gg: ASbGnct066LaIUw8/fBMKJ4dUP+pHDbdHyGNp3zlHmV8zlRCQ+Oau6NUr7UXeZJBi6e
 fUesbT+Lg56ywBBTxbnaFWCYWaCsA6oTdQ0ZnfYM8ZaDngn9NhPDnCYLMCD5RhGhoSjSnnRxCwF
 Rk7XL4Q6d9QGb/QWTxuKTCuGcRIp9VegkveN0nAGjuPLujqyzXVgxTkEX2n5QAypgRhdbi+OvKB
 GTUzU2N
X-Google-Smtp-Source: AGHT+IH/GAPe0xMzpu2J/gIwWSUNd5criB3mTG9uE9JvpqBodcZ3QPZfBms61fdaWK6rgkl5vEFea6LbqyQuMTFYPwg=
X-Received: by 2002:a05:690c:a9e:b0:70e:2d30:43eb with SMTP id
 00721157ae682-71e6db0b8e6mr18300727b3.12.1755254366458; Fri, 15 Aug 2025
 03:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250725014755.2122579-1-gustavo.romero@linaro.org>
In-Reply-To: <20250725014755.2122579-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 11:39:15 +0100
X-Gm-Features: Ac12FXze1AQlmvC5N8zBROO2cVX_Nx756cuSGpZhiFsFbNrHNiXdKqGfrF8xRxs
Message-ID: <CAFEAcA8CB=iKVbs4tvyCRZBECxkH6WxXXZR=4=X-ci1Bbo+3Fw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Clean up of register field definitions
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Fri, 25 Jul 2025 at 02:48, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Clean up the definitions of NSW and NSA fields in the VTCR register.
> These two fields are already defined properly using FIELD() so they are
> actually duplications. Also, define the NSW and NSA fields in the
> VSTCR register using FIELD() and remove their definitions based on VTCR
> fields.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>



Applied to target-arm.next for 10.2, thanks.

-- PMM

