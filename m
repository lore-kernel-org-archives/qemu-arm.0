Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB07CA0ED1
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:10:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umuBY-00069q-8h; Fri, 15 Aug 2025 09:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuBW-00069W-6u
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:09:30 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuBT-0002od-Nd
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:09:29 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e931ceac585so2130284276.3
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755263366; x=1755868166; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eNnnnAKQC3kbe0z20XYAbU8h7BreX6jnZJOpX4WVIi0=;
 b=dBgwdTy82x9WDNYkFkoKOhXKeb4/9EJWaTSLBwnbQpSHstw4mQTzC2R0ScPaPuVjpX
 ree7IaBX3gOGtv/WmxmoG5nJ+MgHjqI7L3PPppHKDXonB2A3WgHrtvugubmv2tcru4H4
 ixX7+1BZNRlu9o81CdZEnFKm9dtTRkbqedHTMEWQz2oGFd9PgfywMcmIb0qTc1nY7m6L
 dWneQjPE6dmUgwObZqzLUKqLpLuBH6U7OEz7wW1EA/285ZQeSr4/FovBWEF5ab3WG8lN
 v4J6WYInMSiMGyfahEtZkRDD5cfWtr3NFKIXeA5vqrGSUgfUkQDVNRaigLlgJ6sOOYuQ
 J8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755263366; x=1755868166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eNnnnAKQC3kbe0z20XYAbU8h7BreX6jnZJOpX4WVIi0=;
 b=Tb6iwy4GWjzKtWuUXFb3aYqndOKnrdn+iv56+ewho2qgATAlEaFuq8ZbyK6leqboq6
 32agP5eFvCYnyXlWR5peAoTH5Uk0YtiWMf6FqEK4OT+i1r9zyDdPp064GwZsW5+yGfUn
 lpQ+eb8McJ85VdtRERwd+E1reSPSLEuPY8a12lRJV7jS0E5XGAHKW6ZXEnZFjDnuhrPu
 Hu557HTzDciWHWn2uQ1LUrHomIXzg7lohQiWWb6cOod5NruqZoeGgDWfk2yebWinMWkY
 qExKqITVzoJVhoascIswttG8rcwzx8f8tdg25cFUbkrCrfkVVnmAo2hSos/a+N2k+Xbi
 jCUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO6RmzqxW7YUnxzdU9vs7Hcf0DSrW9wCbFmDFQtB9nuwOeEpsbRKKfxg9uferkFR8vtjAmPBCIZA==@nongnu.org
X-Gm-Message-State: AOJu0YweqG2/U2nmBxaMSjoPmY1CjQZvHJQJRdWN4BHw9R51QwQVAH6t
 kPADOKDeY1l1Rb1ZDqN/YvvcLq0yOBDxYjG8v6OeG7K4tyQi03t/lkb5Mpnxkj/VfiAUv8No+4e
 rBsN+SqyKOVk/msB1sOL7awJ8n5IGW2lEVzGu3oSCgLbfFcvzFDTs
X-Gm-Gg: ASbGncu/4kEii+LGS8LpRSS+ZHcm7b4X9Vu5XaCOgrjzN+VKms+xcGDF/B2GUWgBsQ6
 MEA5qDW8LBlwXmEuxPJClqPmzRR8K/oaqOtNY33BAZcM0LQ/w+uzVzoa/y8gExKHQW5HOqQqWwu
 w/KMi8xUUu1IX/Xl7PgiVGLg4oD+oGVO6b+SZSYysLrI8UZ5rDafnCfRdotrO9GZC2KVLbgDyrU
 3/z2SY9
X-Google-Smtp-Source: AGHT+IFcHyJy/F9bQKIEMST3bfgy2Ezn9plUC+TFKkh9vPSFE6OrJ6Z0C3p7rSGRXepIDgu+VrCV0BAW4hWaCCnPsqs=
X-Received: by 2002:a05:6902:102d:b0:e91:d090:8250 with SMTP id
 3f1490d57ef6-e93323d602amr2642509276.7.1755263366212; Fri, 15 Aug 2025
 06:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-5-richard.henderson@linaro.org>
In-Reply-To: <20250803014019.416797-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:09:13 +0100
X-Gm-Features: Ac12FXx43hKic7iXid1o2BczbfgDd5c0e5gvEQa8e7enoBdeGX0BzUwXZhg4am4
Message-ID: <CAFEAcA_qMsMonkx0Kwkuk+S8p7vcSQo2AeWGKB4zKtUMTP8Qew@mail.gmail.com>
Subject: Re: [PATCH 04/11] target/arm: Split out gen_wrap2_i32 helper
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Sun, 3 Aug 2025 at 02:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Wrapper to extract the low 32 bits, perform an operation,
> and zero-extend back to 64 bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index bb92bdc296..64a845d5fb 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -8231,13 +8231,18 @@ static bool gen_rr(DisasContext *s, int rd, int rn, ArithOneOp fn)
>      return true;
>  }
>

A brief comment here would help:

  /*
   * Perform 32-bit operation fn on the low half of n;
   * the high half of the output is zeroed.
   */
> +static void gen_wrap2_i32(TCGv_i64 d, TCGv_i64 n, NeonGenOneOpFn fn)
> +{
> +    TCGv_i32 t = tcg_temp_new_i32();
> +
> +    tcg_gen_extrl_i64_i32(t, n);
> +    fn(t, t);
> +    tcg_gen_extu_i32_i64(d, t);
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

