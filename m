Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADF5CCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:50:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vArDV-0008R4-9e; Mon, 20 Oct 2025 10:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArDT-0008PO-H9
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:50:31 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArDR-0004Re-Hu
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:50:31 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-63e18577613so3534094d50.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760971827; x=1761576627; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ndRZkqcU56h8E7a0PHlhQiBdb/If24Z16pIA7ywxeMM=;
 b=XQ2WnCUrbS4tIRGB0KftWDawrjP11oEFzcU5UKbrbWizZlw9PfqxDmZxDm/QVUIFKv
 Ccv9AVvmj/9Nb8GXIs/APFehFYHg5OWGfv9dw21i62EjC0Rx/3ZTPVZ2BU0LCaYbOzY4
 l/PYGKHwkRmc/hNvvrVyrZXXLBjqu/GhvmKsSRHllbXzhtGzvwHdXQx78Bm07ka8O66i
 1jZ5wX9XLek9LbcsGcZ62DkGTBgPS4iXDwNOWBNg3FlnAVEbQgjUb9CST1uIH731JFFY
 o4wiOPnMRSyeW9+d8ZHkYloAOQ/bJxj5EoTEuferznMJZj7noWZNgyhdFtsC6y1ZTsll
 5evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760971827; x=1761576627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndRZkqcU56h8E7a0PHlhQiBdb/If24Z16pIA7ywxeMM=;
 b=eVIp/sHgTZDSnzi0vjwm+mplz6M0zJ2vMMA0m0+i3Ejv5v2MFljrOmAkQk4+BvsFr2
 98JtkYW9R8RoX3RBzuac660dshjcl+m2qF/PQQHrqvGLUHcobfPiewjSug+JfzWjicxe
 r9cwSlbqpZ45QBUfxFuPQ70XYky3LgKotusk0kK6uZLzVd02NDqUfPvyTj45bVFppy4A
 96gXascv3AUIJ4O6jtqRojdzAjZNgPtxnvdO6Ct1C+khN7zGFm8+Spq9PE/sT4pi0RoL
 LLYG/AxNk4c6/L8Uao0bOXcTkI3ikE4qS/XGnkLXgGzbeoor71bcwdiYYmf2s9HjvNQu
 0gXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyh6+ozoHDYoCAEW910XZTK3nicaYFL3YjV/u2tTvwF5zgDg4sm90l5F9SVpRGsIu/XMGebKiEtw==@nongnu.org
X-Gm-Message-State: AOJu0YyhPMThsxYgUvbiocIpPowRXKH/Tvm0YJ+bsW5fSby+6FVmoGo+
 Yftjn5Ab6CTbF4HyQbvvE1IYJwq2wdQFTPslKANSsJd1num+tfYYCpoQgh7aEJgbxWDg2XDq/mx
 z9mS8uUAi7omi26GeC1HNKdmn+dNJ8eX5Dd8uY//KFw==
X-Gm-Gg: ASbGncspLpXpGIU2e496sOxa5FxG7zY0x5N5t0ceqj5UryH9HgxGpzLXceShaZZrW1F
 mB9KCrajBh6tjj3NWo9VR93TAAk6bgf6IKwbCc688yc/VGFp6fzsmz8tZWaeA4uIb57Fq56/PZ3
 65qvHYs0JMEZ7bmu2IRBqSUp6lJfsa1hBCHoNJySkVbU6cbe5f+l9wDPliHP9QzlF3hFhmcjzYA
 H5qrJd+v7gUdNa2rDAy7bUqcKktsiJxvFvDi/YEvPNh7anXZuqWFJSCW4Fm8zV2gDBr9X4xgQDg
 zkdujjY=
X-Google-Smtp-Source: AGHT+IHEGT8WEyne+HAhaYxprJ90OJgGfruhhepbboRmcpLxjZ2b7J3v28t4UBCDzuORvy7FXMqFhiBhWzT5mCMkHNo=
X-Received: by 2002:a05:690e:408b:b0:63e:221e:bd38 with SMTP id
 956f58d0204a3-63e221ebe30mr8741397d50.64.1760971826947; Mon, 20 Oct 2025
 07:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-31-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:50:15 +0100
X-Gm-Features: AS18NWAYlZQZ0kEvYCaJjGuAW7Voyhqa4k-evTfWOg8HX0IOgFpMNHMXyEphWAg
Message-ID: <CAFEAcA_Zb8BbCRMC=y4o+1fD=UKbkZkzg1VbLb8XiqKL70=f+g@mail.gmail.com>
Subject: Re: [PATCH v2 30/37] target/arm: Implement TLBIP RVA{L}E2{IS,OS}
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

On Tue, 14 Oct 2025 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/tlb-insns.c | 52 +++++++++++++++++++++++++++-----------
>  1 file changed, 37 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
> index 6c07839e3f..cbab7f81f9 100644
> --- a/target/arm/tcg/tlb-insns.c
> +++ b/target/arm/tcg/tlb-insns.c
> @@ -1031,11 +1031,16 @@ static void tlbi_aa64_rvae2_write(CPUARMState *env,
>       * since we don't support flush-for-specific-ASID-only or
>       * flush-last-level-only.
>       */
> -

Stray whitespace change ?

>      do_rvae_write(env, value, vae2_tlbmask(env),
>                    tlb_force_broadcast(env));
> +}
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

