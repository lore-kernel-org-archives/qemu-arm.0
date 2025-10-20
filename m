Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D733ACCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 12:35:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAp6d-0006HU-CM; Mon, 20 Oct 2025 08:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAp6b-0006Db-Rr
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 08:35:18 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAp6S-0000R4-0X
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 08:35:17 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-73b4e3d0756so47808477b3.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760963705; x=1761568505; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aQAoilAjBcDCKGTGqZZ98OivUN223MWls7lmhQrOdTU=;
 b=OsFzUwBIw5od/CrES7nO85yi1w/BlKb3FqFUAKSNBVyv5/8leEDnsY05APlHIKK9zj
 5Zlq1DmZ3j2ONelB1PvvK7g1oQuhITfYKOBlQcbZhTjFC23O9eHt4Mr3tRbAgg20nhqR
 DCP7tIQbCnOFWxDZ1Da4Sm/fZqD+bZtkYhE2j5hHa0CFrRFW4f7cjbXtB0AkZV3pfbE6
 gvJpeVZasnV241Iwz79koIRgEiowHiJSDv8eRtqGWbhBeLGDbgbtYu1x4bgKA4AJ2wwi
 jE+zl1Xbpfd4EBFG0W1ZDmFuHXDxxrO7EVUkWnjmdCbacMgjdnjiCGOwiK4BmSC4nh2g
 V3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760963705; x=1761568505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQAoilAjBcDCKGTGqZZ98OivUN223MWls7lmhQrOdTU=;
 b=J4xab9QXY8mX6HJFhtvTJ0xW9sc7vvsskXLJqZuT5FffZlaZg0XUci1npkgQv8JLZA
 NBGCcDysl3IV3XfCLzx6Ja1TghZ+fFwiM8HRfCUHfoPNUuKLcjzsYvms76RT4kP3t0m3
 7FJI7gmteAlZP5JFKCXWr2MRZDg3WAHXGCu6RzPO5s6x4lRqz1eSAt52jAQAk6SRS3WV
 Gib/QbqJ0aJ9GAr9Hv1Z7JIdESusdQS8Hm/p1vdWMjWvdJXGkjDB/aWPGD3ic5E1/f0C
 mTBRXWu1hsb2H2JZKX8+UwiJpdc/ZRykd+j0albNyg8aJeoX7fXxdRugdzym3hAJ63nb
 WAvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPTJUjSFiRbsYPZvzRSxxarifCMkqqYQ6n4LmbTn7l2hFAF6oFJ8UzheQeuG1IDeJlcR61rkMWbg==@nongnu.org
X-Gm-Message-State: AOJu0YwICLt711bcm8jhO27UJdrRpfoZO9bJFMseWRrfpAjBkLGf9ndV
 9yUF6ghiOP+u2TptWN7SGtx0i8VQx6dqVI3OzPJmSXmDmfxhemc36ELQHPTyEvR8HLcey0dqidM
 0S4RqLiaHhQiFGyKsmXr1hvfsWwJRnNsq1Xj8EwoHyQ==
X-Gm-Gg: ASbGncscNH7s4IXAYFjZmXF6BK4ISDb7CIy7ZejPpc8YfeSC6EQreX9iEM3nPGom4Lk
 RNEn/m1xA7NUJ0DFPqqyKXSCyqUUUvxye3qW3Q5UZj474cI7xPUrIRajUFZyudLcTZVUFz8p5os
 LMTR/fCCrU+66ZUQqJMeHEkFJpcca6+rBHN/Xy2RZp44p4NYOGh40+v4JWpaggmFjTyx8xEOujk
 kHTPNsTePSUhUdP6nvottswfz5p3LlVVihzZTwCg3YkSFcxa0EzKK7gQOmVwhfCcUBVzeSC/SgK
 SsoQwtw=
X-Google-Smtp-Source: AGHT+IEUUUeUEHdTVFB6lvU+m/SZqyrx6pCsxthNvWu6aYke9ysuFNJFd2SX9Wr17H9IMIoVsimOtneycEDEQJWYrUc=
X-Received: by 2002:a05:690e:d56:b0:63b:47b3:4fef with SMTP id
 956f58d0204a3-63e160e9866mr10038577d50.14.1760963705406; Mon, 20 Oct 2025
 05:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-14-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 13:34:54 +0100
X-Gm-Features: AS18NWDYhpjchLWD1YLekr9vNDWMhc2yupizqFSTYU8-uVkWv7cRa0Xt3ycyGQs
Message-ID: <CAFEAcA8bB5jbc1bEd2zUJUDj8=q0jfWvfcUwdUPW0Upbr3u8_w@mail.gmail.com>
Subject: Re: [PATCH v2 13/37] target/arm/kvm: Assert no 128-bit sysregs in
 kvm_arm_init_cpreg_list
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Tue, 14 Oct 2025 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> KVM has not yet enabled 128-bit system registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/kvm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 4f769d69b3..3e7738592f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -804,6 +804,8 @@ static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
>          arraylen++;
>      }
>
> +    assert(cpu->cpreg128_array_len == 0);
> +
>      cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
>      cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, arraylen);
>      cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
> --


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

