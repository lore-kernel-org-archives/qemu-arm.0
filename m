Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B4CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:18:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kFw-0007st-Vi; Fri, 17 Oct 2025 09:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kFl-0007jp-TM
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:12:19 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kFd-0005Kh-Bl
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:12:17 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-780fe73e337so24988517b3.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706724; x=1761311524; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D9xlQoRZeoR1UXPG1KXCkxosrjIsVdx7ZL3Vee6w0bQ=;
 b=O8TSKDSFEPC/bvWpl8qTUxz+E4ytuEkolgACQzUlU6dlLNVQERpX1B+LAUU33nedK+
 wMUOYnL7T44Zp8JOuakoHmd25T8RyfN0HzXsXR2TACUxOLQdoaf8JgwSjyoGTXzhc2o0
 UIETbzJJ+q4XMRd7NuO+XwCb7JyfBuy1Nm1thMUKIndv062dQkvMCD8ZGafCTra9YAZO
 E3haM7c2BZ/3w0jVfNeQHoAyl+4GPEWrxk9BLtqvd25Lv8ERheirRjTg2TO39bFK3vT7
 pghoUBlioLGH75KC5NtS/8MOkJQvBeHqZBa1HXKgUVqGlJSAth0K6GFHlOkyE2GPp+FA
 UDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706724; x=1761311524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D9xlQoRZeoR1UXPG1KXCkxosrjIsVdx7ZL3Vee6w0bQ=;
 b=RckqdTfTVdE5ftgxXIp95/vMMN9+SvDcgITKCX0esxV8J7xtHtU03Vhz95v7SMlYGi
 3917xJC/0lP/A0qk6bUh4ydIgJOA+Je6SKVkVF6oEx0rtYu+szxApBAq4+Ies6voRl3y
 lUKrSQuiRZ5NrsDTpPh8D6JSi//heqURVFtcse858gY5fKvM0DQX1DikMol3fDD9nJOL
 DIzkgLnOMgv+SHTZKafsZV/KNHqXGw64ixTw8V8wRw3BcaqKbqPtYVMtMalxNyORKS6Z
 quk4dtjpVAE3yXaw5eX2kqAIUXUz8sLmWsOphW6sJAFYqmUherMHnuiWxIUGu8raXnRL
 pTNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+QlqHETu3jAxLZCXB4P4p6UK+995uEgojViRT0XsZyki/V8ia1lp46C5MNS56H40eXEarUvFiOA==@nongnu.org
X-Gm-Message-State: AOJu0YwRkuBceFlbvp+vSUkk1cJCvF3idEd3vCKS4BZ6oIupepzDQtuC
 g0rb5kqJ1l7WJjOzyMqgGZt3leK/PtEyRlfpFcLobt/mOm6P05VuWt/XihTz65IaeENpK96ZCWt
 Rd1l9KalYQtwKEbUauxTAOvWpMyjPrxz1h4jYhOoj4iE7dSIvvppF
X-Gm-Gg: ASbGncvM1ERSKSCv9xWexJyss79InMkBPeC/9EadeI5mmf0fZB+nN9e7ojyt7mIDA/Y
 4asEw310DnRJxUExhmv7TeD/aNLsnA4sf7qhelzK4PBjhD4P1VXTDg/8Q0Y+ftlxT7PQzkgxvBj
 LrACU3F0SqGl3xx4J3HB4uzmvpQLODnVsr6rro6PjLS1R7Hzj1OWKNNk7yYV7llB8EbN21n4wLD
 fq/5VAd1o0xI4FVWSN9yE/8jiPE2ob1VyNuxspl/fejmS/7s0O08CHveS1KlSoFYQxxEwyAZezi
 lmBsx34=
X-Google-Smtp-Source: AGHT+IHj32EUe0DPXTrJw6gc1fccEkjFc08onpntnLN/ztdEO8OXcqaA+W0DC0ZIrICEFzGm47HEc5FCcdzBd9pzo/s=
X-Received: by 2002:a05:690e:4192:b0:636:1b01:63df with SMTP id
 956f58d0204a3-63e16168e5emr3252986d50.14.1760706724375; Fri, 17 Oct 2025
 06:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-8-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 14:11:51 +0100
X-Gm-Features: AS18NWBjL6FzFSgT8OsWQa2THimdmBQGVf5uXcNEKR8NsFgWUidraGP6nLrsSMg
Message-ID: <CAFEAcA-OoeSq9iOrtf_23-x8tZBCyZJ2wQ2ckrYo6tY8e2w9FQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/37] target/arm: Add read_raw_cp_reg128,
 write_raw_cp_reg128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 14 Oct 2025 at 21:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the functions and update raw_accessors_invalid to match.
> Add assertions for !ARM_CP_128BIT in read_raw_cp_reg and
> write_raw_cp_reg.
>

> +__attribute__((unused))
> +static void write_raw_cp_reg128(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                Int128 v)

Why does this one take an Int128 rather than a lo/hi pair?

> +{
> +    uint64_t lo = int128_getlo(v);
> +    uint64_t hi = int128_gethi(v);
> +
> +    assert(ri->type & ARM_CP_128BIT);
> +    if (ri->raw_write128fn) {
> +        ri->raw_write128fn(env, ri, lo, hi);
> +    } else if (ri->write128fn) {
> +        ri->write128fn(env, ri, lo, hi);
> +    } else {
> +        raw_write128(env, ri, lo, hi);
> +    }
> +}

thanks
-- PMM

