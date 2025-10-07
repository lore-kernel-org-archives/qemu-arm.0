Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C509BCCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 10:18:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64ld-0007Bq-9n; Tue, 07 Oct 2025 06:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64lb-0007BN-S9
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:17:59 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64lZ-0006LU-Oe
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:17:59 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-71d603b60cbso63523937b3.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759832276; x=1760437076; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OWQ+uwBNoEiqE5jydiMZXoo6byrxmjspieSK53RFY4Y=;
 b=jbO/vv1Cgk5RdjpAAmCGw0LxwS6Er1Ug2ErEV482ZuuTvo/iqAxErxHQOhn/2TAtBK
 JFbF52Ja7+8A1L4wmwbsS+7p+lyq2BdMFfQ8uQHzgOp10fUJOfx9taAfTWhT9pe3QA3U
 bmK0Q/RhUbVgQ8Glb0Pur+8Wc2+cQVKigDwLTbD1BeLIEnz2e2DMlM1zP5RuRpqDGAnE
 Pt3Xyh6ERakbkVDC81dNufUVukcQRfjHB3qk/HUXvLZGeJwANW8Vy6eqWMPZRJakwzH9
 SdAwL6SwEH98zTHZ6HEmHwJqC3m67s2bI9VTubdXihslPX/G1ImJIHrZ4rwuS4PmRKU+
 OFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759832276; x=1760437076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OWQ+uwBNoEiqE5jydiMZXoo6byrxmjspieSK53RFY4Y=;
 b=M8zSTJscmZ7yqvyt+LA1H10VET3LBd4Cf4J9z9o6JIdGXXm/sFoNwxlXMnMIH+wG8R
 vzlGqVa7H+7JXd7X1WCEvtxnCdlM9sALsXtwKBniY1xZqT40Nxz2ath+LD9gKOmBTOtL
 xa341VL1jdxX4DV/Q/h5bpB7LmHTdqmCTUjo+O+UGtzf2o0G7KANw89DbR8HxiI8sCKj
 xZUjikDzqrLO8Oqru9lHMg9ZpUNSBB319Wp+h2LmsMpFYyZRWQBjVrxg9tAXangQW1SJ
 yWKiOb17aLGNwMQQSK5VGw0R9MQa6y/8Xnuyd3NHOVNySyzNhNeYZuJ50xk2ngf28TLS
 onjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+xbFtmtcNgJDyGd8LKLUhdf+lM+l3nj1i7qJW8CsGYw3YNXcMfQd6OFgt/yXyohYT5WZlKXziVQ==@nongnu.org
X-Gm-Message-State: AOJu0YxeB68v9//5cO3RE/YuEHv63tWVD93g3s+mCAwOBT9+1+62y88K
 FsH19yRr3OlxrEmLNVxdf3sgm8SSXM8/6AqsKyeYlELT1sSXIirHtZfduU6c86bSVFiCNb8+vbg
 iwui8vcZt1SMazL/Iw2D9T5SZrgU5qULbZWlK1Ac2Jw==
X-Gm-Gg: ASbGncttZdeqh1xVhDt5P2X6naB00lg3dclmRZpqRnVHabihPa1r6cIFywQWDq7vcrO
 pzoiQN9QMoadzLKiMSSV6EbrwrriqrmWKUh8zFXBhtQqww5bQ3/Mb69c1a1NaJFheNQ3IOEy36e
 X3ZonkVW6cjgZU0yo40u3arQG6dsbCLGQlS1kvRGHCIcrUzpY9SbuKl/INwuILXf8a1kKhG7UXo
 aT4BsxxGn7Xj0NuOp7QknIIT6fsb1O1xKND
X-Google-Smtp-Source: AGHT+IFifdlt9WqMCVFS//UYX3C0o2Z2i3NmyrDSOxVPxxQEIcW7cM2mSvcd669tQzzGxxVSx5B8dUvYDiXfgPluQfk=
X-Received: by 2002:a05:690e:d56:b0:635:4ecc:fc22 with SMTP id
 956f58d0204a3-63b9a0f2bf2mr16398397d50.42.1759832276175; Tue, 07 Oct 2025
 03:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-49-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 11:17:45 +0100
X-Gm-Features: AS18NWANxCA7g8HysTG5baBRYrhKwrkNhdHNIx5w5YquhQMYfBcHwrMUc1_gmIw
Message-ID: <CAFEAcA-WzWDem=u8w4sGB3aMHEBkUFo1PJztbwM+mqe+REzasA@mail.gmail.com>
Subject: Re: [PATCH v6 48/73] target/arm: Implement GCSPUSHM
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Fri, 3 Oct 2025 at 18:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h            |  3 +++
>  target/arm/cpregs-gcs.c        | 15 +++++++++++++++
>  target/arm/tcg/translate-a64.c | 29 +++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)


>  void define_gcs_cpregs(ARMCPU *cpu)
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 38a1f51ed5..4fb73f821b 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -26,6 +26,7 @@
>  #include "cpregs.h"
>
>  static TCGv_i64 cpu_X[32];
> +static TCGv_i64 cpu_gcspr[32];

32 ?

>  static TCGv_i64 cpu_pc;



> +    for (i = 0; i < 4; i++) {
> +        cpu_gcspr[i] =
> +            tcg_global_mem_new_i64(tcg_env,
> +                                   offsetof(CPUARMState, cp15.gcspr_el[i]),
> +                                   gcspr_names[i]);
> +    }
>  }


We only initialize 4, so I assume that the array size
should be 4 as well.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

