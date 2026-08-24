Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD771C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 15:40:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyWmF-0007B6-TV; Mon, 24 Aug 2026 11:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWmC-00079u-NR
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:39:56 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWmB-0003vm-9J
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:39:56 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6a157f90752so6148080a12.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787585994; x=1788190794; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=f7FW8PzCdN8q/L4KF0s21kgYjEChheqzhlsCPdmVE+g=;
 b=sZg4ZpoD5AGowDna1aUo76LuS/+7IppyQQluOVuHvp2kVNOhRI97EdHsfIAWIcJ/bm
 dkpjDMXaWDX1KJBcCo6j/uLPBYSZ3BzhkwEZX78O//oJ0BFWrYM3wPXLXRaqUcmpU0FC
 B5uOeMHXHiPSTiQPj7lnfYa5PTPOoGRrjgxwTOzE0JGtxduPpRrEsK+8oloAahAdwzbL
 F0NyknB+wQmlN/dWH/jmmYU+VShu/OU8AVls63nnmIU3kwJjyI9XIZEr/lYRRfoSxPiC
 vEK9jsG9YTFQckPQ/83ajt1T/J1QFE799+bs+vWAzmiemhDeAZO3DLsYRODwXMfjkD+a
 XF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787585994; x=1788190794;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=f7FW8PzCdN8q/L4KF0s21kgYjEChheqzhlsCPdmVE+g=;
 b=sHQwDDFYUivX+joL85er8snSh0WgbnKeN6tp0tVnPapwk2cNSJ0EN5km3pdOVrGtId
 YImMpp273H+B6E+39qYpTAe7JF9LK6vWPWK3OXS2A2oredSF3qnCMCo6/XttcGKebkGw
 hx7CGeTJzSGpV2AEl1eaSH07G6Cejsy3XjDGVwketZ7MfwwLXaKf/StnSWZF7sJSndYM
 XrdctAwYHE5CdYPfxIBjBUoF96HFv8lxrE8JO0M+SCnGKG/AvEOp2IbASztIVrgTOq5r
 xVoc9rMy/yFplknQ2K3sUlyZEB/S6NAjNQYj6ba9vWwMTs+XERqz8o0OKBaWeV5C/0Nw
 g4fQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqh3L7LlKQhiyMc6+kotj7i5NlR4eXvtDVx4yRO4o647tFKssBfsIuyr8cXu0fdoadz52Kjz5xyzA==@nongnu.org
X-Gm-Message-State: AFuF++n6BK1hKwq/ra6RqHk6Pnrx6owV3uzQR3iKDAQ0tkOtpdxh6JXh
 Ume09Z0eqallnud4G5jKv3kk+iknCLNSDZFRBkwgmk6caOYTq2mWfWAXk/GX/la7hTI=
X-Gm-Gg: AR+sD11We8VIauYPrYa3n7OMnNdz0wZo6tADSMAqMo7svRM2d2Qy/yUSwvalOx5jESg
 YefO/z60lwotflODzOj0Pd04PSpTlrB4QM9VhPHRzkyPxKzN2+0EXNyj6QfWcc53YpXigKFU9J4
 ClKrJ9csKfGg8rds64e9Cdcnx/AdUCEIrmzxPRbZDLapWZlsAKmAIutazeSS/dBfmtiSHJg4hWe
 t1FqsHfJZRogBj4/DWU+qQXC9N/FAPOIFW5bjSIdTvz0dogCRfWwidNsJm4paZ73SNEu6RK4U9Y
 BeZGMfW/k6UZYIUnCiXS+8szJYbdCe/XZKjJI73aD2oP5gFJqEWOQWfXfDiq1WFsyst9ZXK37lg
 CAGTHQNrMqDQgtmXkynzYW8PnrLrzA+PCIDNN/liStFP9tfRif8AA7oS5Mevsi6HVOaqlhJ5WQg
 v8ZiKkgcMjGTTPOIt3sfpcJeSImcjF15fp8ThVxFFOBLnXjEE76psofwoPsTk2
X-Received: by 2002:a05:6402:2418:b0:6a1:bff4:645d with SMTP id
 4fb4d7f45d1cf-6a42f14dfb7mr33731063a12.2.1787585993555; 
 Mon, 24 Aug 2026 08:39:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e012f84sm13652408a12.8.2026.08.24.08.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 08:39:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C38785F7F5;
 Mon, 24 Aug 2026 16:39:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,
 Bin Meng <bmeng.cn@gmail.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [RFC PATCH v2 01/14] hw/i2c/omap_i2c: add a dedicated
 CONFIG_OMAP_I2C symbol
In-Reply-To: <20260820124824.618671-2-wafgo01@gmail.com> (Wadim Mueller's
 message of "Thu, 20 Aug 2026 14:48:01 +0200")
References: <20260820124824.618671-1-wafgo01@gmail.com>
 <20260820124824.618671-2-wafgo01@gmail.com>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Mon, 24 Aug 2026 16:39:51 +0100
Message-ID: <871pbnsf20.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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

Wadim Mueller <wafgo01@gmail.com> writes:

> The OMAP I2C controller model was only buildable as part of the full OMAP1
> SoC (CONFIG_OMAP). The same IP is used by the TI K3 family (AM64x and
> friends), which shares nothing else with OMAP1.
>
> Give the device its own Kconfig symbol and select it from CONFIG_OMAP, so
> that other SoCs can reuse the model without pulling in OMAP1.
>
> No functional change.
>
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

