Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A563C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukM6c-0005Ny-Og; Fri, 08 Aug 2025 08:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ukM6Q-000580-Bq
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 08:21:46 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ukM6O-00025i-Fl
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 08:21:42 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e7311e66a8eso1851712276.2
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754655695; x=1755260495; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8F9FDswivwS1Mi8z9vaCJzGrmOPEYpSX6hOtic20iHM=;
 b=lssIg92eRMZczMS8QRdq8UnD1/rkrteo0OiISn0DSXgHxg0ngGNO1MwndXWjjs/Oyc
 vf+JcRbeMm97S8BSsoEPydYhrTH/Fy8o5aSGSQA/ym7+dbPMpH27jVJLjxL4bAn7Oc1R
 wUQ0LPu/ewpwWgfwgSAEOrrSRrtg7OvWfv/SQDmc5z0vBtMHUKSVK7dJqAZj7af5pIcV
 Bm2jvoa4+t6kmZsC88qeQkCCuCDwQDkwihct8oSyp8wtkflIZOeXVYVMchfWVV89d8LO
 JO3rvL/4ZdBBneerCTgZ4ygom5soUUs064KBPPTDDEu8UdmDKqa5VggzK5fWROIFayBY
 EgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754655695; x=1755260495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8F9FDswivwS1Mi8z9vaCJzGrmOPEYpSX6hOtic20iHM=;
 b=WD7rohNumcBMUDL0XHOUgz3yfR7oJP1Q7Pri+Y2mxSKsWKIZnN3jL3Q48Gy2QelSw1
 /TWAOMq0sheoGJzMcksgUJsguF4fq+ViJDNPZF/fDbKbL+hGPXynyK8sMICGx81Bej/m
 nvTa/9xGxh3H6Xuc1r5xg9yOkHLNGvXF/HlFBsoI6xfhNKkW5LQRXGoSZ7X9RGT2/Ns0
 1uNDYSl+MylA7x+mgLTdeKCSku3Kh0mpuPf8cz3YEW354OYcKpcfLMaEAsQFkBHMAU2K
 +dBRWMVsuEymy7vqzNDJ81Enxbuq/AZDWGBB0r5gh+W0TmbDw3UnMMsY94d4G5k17fFS
 ztIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULkRCAzuRN/g+qDXBjXPbWBrupJE7HX3EJHomfM+wMjfTEshgXmYFvQ/1Rif0QJL78CsapTVnKHg==@nongnu.org
X-Gm-Message-State: AOJu0Yxudohk+bktmYBdEH6H1GkaaJDUJfy7GL0FViz4Hew4aUEU6tYE
 Y0djVtCipyKEmeA0g71GCZb2MSnf4DxJyux+Yl49Vs6jEpjhGjoXPBPedUyAO9jXT/hoOX9iT7Z
 Q3g6s0pAglSdbwmps2WHeCCO6wRhT4hX3u4c+6JrrMQ==
X-Gm-Gg: ASbGncvp3tNQje5R+U9SUMZ7trt5EZChlOm4YfF70dFpcvPQQn5DlwJYkZ335wboDqW
 pvkQzry1u6w1to4/2fyHz/6lXF20nPDw70nkMzrxc3llJfTTncfgLXcT2h19QqL7sosMP1QC8dt
 RwfuolsoB+NlHl00zQnRVUvgR0nOLt4eQwQn/R3XOc0j92TmNXLQMH4LpRMX+ZesA3dL11WWw3g
 eT1LBQE
X-Google-Smtp-Source: AGHT+IFX9bd8QrjP0rnKXtwQbA1zirN/jJhEf5xEt8ztbTJ6iiY7kG6DC3II3kv/lVbxQvwseS7lwLcYQcGXbZ4OrV0=
X-Received: by 2002:a05:690c:4803:b0:71a:1f26:5d1a with SMTP id
 00721157ae682-71bf0d43708mr31205257b3.11.1754655694726; Fri, 08 Aug 2025
 05:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
 <20250808-gdbstub-aarch64-pstate-regs-v1-1-14ba70be1b3d@linaro.org>
In-Reply-To: <20250808-gdbstub-aarch64-pstate-regs-v1-1-14ba70be1b3d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Aug 2025 13:21:22 +0100
X-Gm-Features: Ac12FXzJETIc1VKPT2wtH5yDYjrceRr5w5RBhZbijP3oMufqLUQhi9JnkEODfjc
Message-ID: <CAFEAcA-2Zt7HTDX_bdBHjJyQS7o=csE1x6eDymyEPkV3K+pXrg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gdbstub/aarch64: add CurrentEL register
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Fri, 8 Aug 2025 at 12:30, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  gdb-xml/aarch64-core.xml | 5 +++++
>  target/arm/cpu.h         | 1 +
>  target/arm/gdbstub64.c   | 6 ++++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/gdb-xml/aarch64-core.xml b/gdb-xml/aarch64-core.xml
> index b8046510b9a085d30463d37b3ecc8d435f5fb7a4..19ad743dc5607b4021fb795bfb9b8e9cf0adef68 100644
> --- a/gdb-xml/aarch64-core.xml
> +++ b/gdb-xml/aarch64-core.xml
> @@ -91,4 +91,9 @@
>    </flags>
>    <reg name="cpsr" bitsize="32" type="cpsr_flags"/>
>
> +  <flags id="current_el_flags" size="8">
> +    <!-- Exception Level.  -->
> +    <field name="EL" start="2" end="3"/>
> +  </flags>
> +  <reg name="CurrentEL" bitsize="64" type="current_el"/>
>  </feature>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index dc9b6dce4c92297b2636d0d7c0dce580f1806d5b..c3070cd9863381fac40f5640e0a7a84dfa1c6e06 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1473,6 +1473,7 @@ void pmu_init(ARMCPU *cpu);
>   * AArch32 mode SPSRs are basically CPSR-format.
>   */
>  #define PSTATE_SP (1U)
> +#define PSTATE_EL (3U << 2)
>  #define PSTATE_M (0xFU)
>  #define PSTATE_nRW (1U << 4)
>  #define PSTATE_F (1U << 6)
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 08e28585396816ab90d6d8e460ff8171892fe8da..16b564e1a970cb5e854a705619f71ffc61545a73 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -48,6 +48,9 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>          return gdb_get_reg64(mem_buf, env->pc);
>      case 33:
>          return gdb_get_reg32(mem_buf, pstate_read(env));
> +    case 34:
> +        /* CurrentEL */
> +        return gdb_get_reg64(mem_buf, env->pstate & PSTATE_EL);
>      }

The debugger already has this information in the 'cpsr'
register, so it could implement convenience views of
the subfields itself if it liked.

If we're going to do this I would prefer it to be because
we've gained some consensus with e.g. the gdb maintainers
that this is the "preferred" way to expose the CPU state.
The XML config stuff lets us do it in our own way if we
want to, but I think there is value in consistency across
stubs here.

thanks
-- PMM

