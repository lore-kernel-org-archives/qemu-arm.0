Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF41C61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 13:56:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzaZm-0004M1-OH; Thu, 27 Aug 2026 09:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzaZl-0004LM-Fp
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:55:29 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzaZj-0001Ey-Cv
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:55:29 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6a1a546a6bbso3454990a12.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 06:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787838925; cv=none;
 d=google.com; s=arc-20260327;
 b=HsovfOHAIOm4PI0GYltEGXvc/gt0VwLIlXyYWZqNytupGhXoWb4RcgIouLOf9kjqbP
 IDEebmYVmsvCu1llPSdSrWH2tpkLTXJQ704PSbhGVZErPYaDInbGsk5xa3GLJOqd4adu
 NzYGODvo5LpUmAhu1SDEsx0c7Ssq6G3xP/ZQgJVZJRH3edFCazAXW+DG/WG7QbInVPzz
 bRhcDKBwMl4qZxk5YTAeqGpkcetERMApOzmHbXBz4FNYY619GrEUb0uLztURTRmfe/ue
 rPLsKUeSKgjXqXa2qy5Ec6Lz7TyXCrvEDk81RCqQruxdA5VBxQ0e3D9ulWkUUn7ZfKFU
 S/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Z7iyjWDK1mAgB/lcxDDjJqAVJcg1hit6hAafcQvHTxQ=;
 fh=i/X6XS2ApjGOo0PFpxp827ZvT9GsQ0aP+RBmh+M4Xs4=;
 b=Pae5S4N9/etkDJOCwrpNMykcAxWGgV5FavQOOXEIIyZsq5MdVlFTvK7f4wp3/o1nFh
 l4JH+la9EbRJSZ/ldB7sv/hytEbDrfqvY1KExO7/7Zat9H7EVzCHIGs+B5i+rqlCwyzI
 H17bnXSPeY6/w/El2T7QERDh85opIexBBUq81k/cI4Nwg4O/SD0BOwVaCQKQ0UTmoh8P
 RR/Zf7KpD+Uq6IgTdkE3tbp3BzAeKQbxAvLD9TgLZVXZC6PL9EFwFWE3MfaLXfL0nNaO
 KzqUubWxcEF79gvULtaIGQRkedamuB1V7Apvsbi89bFMIjAq33yJHz0tKH+bWmnx6oi/
 84qA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787838925; x=1788443725; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Z7iyjWDK1mAgB/lcxDDjJqAVJcg1hit6hAafcQvHTxQ=;
 b=E0esFl3Jgnjxx6rFFFQn49s4oU8gPV84ltbRp5YBvshqRgWgzHAObiwdnRIJmZCl2O
 ecU03jfWlentzgxslAzywURU/Zh2Z6QmZpC0RNb6YDh3ogIHEomxrPwfaVxdRHHDK3O0
 R3wtduW4u/Vk+bYVTE2FAufTHfIVYk377stG93BXxFTwe7SUt6kHZ2RLm5f7gfQiIdnJ
 xe2v9lX718G8Em8B26dhF9AEkBNRzfJaUXkgGA6sRzvxLiEBNKBUL0ObVXGhKCt2Gxoj
 jp/wtjWQ6JFgAz2YJDSfuD2iHWAhF0yizBtZsfE9cQyzWHaVc8E5XXx/NY3mN85jhq4g
 sltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787838925; x=1788443725;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Z7iyjWDK1mAgB/lcxDDjJqAVJcg1hit6hAafcQvHTxQ=;
 b=hCyvjcYyDwzOojYQvhR3gFfTN30RcigWXCCzX1lvt3p5ksQfIkLkkFHLvvZLmZh3Ds
 uhxp2Ra1kf6227f1vDMz3NWj7wnBkf7I6wPr+F4IZLcdUEU//Ix57aNzCwroW0zdVa/u
 IYgMyPG+b+MtneC2sCCuN8C85UyhNTV0USG0Nz0V6G+GDXSojNhW8aIHx+g5/djgTXU3
 UweQ9wWaGB/2TbKwhcCqDkDMTqFIq1AFuXcoCBtLE7lgCtEj0QYURukcrYUOrR4ZPl68
 7wcmdlNU2jHiNiXQHvdViAuDf9TBJrYoCUg/cXZpgge/KHmlGdbn/3G4aPZlGBUe2OC3
 7JTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RodFu/IIYfuM0ANMWFmH3dL5nnKLKI35Pq0QgYjXdKeoId2Veq4d+iVG6+Iquj3NdtA50HLLhkoSA==@nongnu.org
X-Gm-Message-State: AFuF++kXAo2JXa5TIdnRj9aaVb30nmET9oiT9rP5ds87JtHryCs6nnU2
 Jek7vrY59Dj8D2+ki4qeWzRjtdE6oiIPZXAIISpTosxY/cR8cEaMWjZIgYwDMwF6dQCv5naPJPz
 CPvLMIgMe51J6xD+g6aR7lrCni9qrzC7JQAVd0xq0cQ==
X-Gm-Gg: AR+sD13yJCeFL6BTXSYcF6eM78mBaQR0uS41GH6qeV8YNaIvcU9KFNGib7Tt7NvAPMi
 1xJ9E6vZxdkzCZ4F/rVaAdIqK7wejoK08PazC+jj9/mOR6ofDkTEFSsIJSYG6rBtSk4/ECMRJhA
 r1OaPDiLiHmDzUCIGMwriEBcfrtao03OOQ09Avp6wwkPCLxcQhtMNJts47rXf+Hug8bUkAYYZdP
 NjtUGc236IlEP5/O+uncZooxmeg1o0n+ZB/4d9y+3S4BSyaZZm8qCeiWd5JNKVE/y2IiipmBlIs
 FVbmW6xDt8Do1oEet2VUdIJD1vlCLf2+QBJ85MBnhm0I1eQeLdsN/vq4HJk6twhDxonG9u/mm5d
 r4nhgmKz/K9JJt7R0ht16kyF+43SqObGHeJ3Hh/8=
X-Received: by 2002:a17:907:728e:b0:c20:53c7:488d with SMTP id
 a640c23a62f3a-c250bc2d085mr1208203166b.14.1787838925445; Thu, 27 Aug 2026
 06:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
 <20260818002629.172827-2-simonxhy0404@gmail.com>
In-Reply-To: <20260818002629.172827-2-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 14:55:11 +0100
X-Gm-Features: AcwNN1XwAno_RQlVog7vUGr6bLcpZM7nv0cCXnsG2FP_eXcxKsjFNYEpL3SA3cs
Message-ID: <CAFEAcA9Y-tzX_a=jwWEBJ6BivowF_=+D_RBmA92KKJ03QvVyzg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] target/arm/tcg/cpu-v7m.c: add cortex-m85 model
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>, Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Tue, 18 Aug 2026 at 01:26, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add Arm Cortex-M85 CPU, modeld after the existing M55 CPU.
> The new M85 feature PACBTI is not implemented in QEMU and the midr value
> is based off the r1p1 product revision identifier.
>
> Arm Cortex-M85 TRM:
> https://developer.arm.com/documentation/101924/0101/
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> Message-Id: <20260805153005.9989-2-simonxhy0404@gmail.com>
> ---
>  target/arm/tcg/cpu-v7m.c | 41 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> index dc249ce1f1..a1e62a20f8 100644
> --- a/target/arm/tcg/cpu-v7m.c
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -237,6 +237,45 @@ static void cortex_m55_initfn(Object *obj)
>      cpu->ctr = 0x8303c003;
>  }
>
> +static void cortex_m85_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
> +
> +    /* QEMU currently does not support the PACBTI feature */

Looking at the M85 TRM, PACBTI is a configurable feature there
(that is, you can have a real hardware M85 without it).
So I think we're OK to start with a Cortex-M85 which doesn't
implement PACBTI yet, and add that afterwards. We'll have to
add a note to the an555 docs that we don't implement it yet,
because the AN555 does configure its CPU to have PACBTI.

We can improve the comment about this:
+    /*
+     * Real Cortex-M85 CPUs can be configured with or without PACBTI.
+     * If PACBTI is present then ID_ISAR5[23:20] read as 0b0100,
+     * indicating that QARMA3 is used. QEMU does not yet implement
+     * PACBTI emulation for M-profile, so we report as a "no-PACBTI"
+     * CPU for now.
+     */
but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


On the Linaro side, Richard Henderson is planning to have a
look at emulation of PACBTI for M-profile, which should fill
in this missing piece.

thanks
-- PMM

