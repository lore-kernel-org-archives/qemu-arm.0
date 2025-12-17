Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19B4D6554E
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:11:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsEi-0003GG-I4; Wed, 17 Dec 2025 09:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vVsEh-0003FO-Cu
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:10:39 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vVsEf-0008Q6-Hh
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:10:39 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso109002966b.3
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765980635; x=1766585435; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EmwGnLOQObF/7cxus/deBZ8zEsUnVmeldhCqCAi8uU=;
 b=UheMls4OuLXS/dkuTEtnCrHQsUFOPNM2pHnPFiTzvOCseMM997jI3kkqeWbIhgrkb0
 Wgy7BtP1ZUJy4XQLZAA5qt3PGObuC2uOfrmkZeFNeEJsJ3S2KcWRydjUOJ2/JV+O8oun
 LX5qgx1cY+yNtz7MZIujo0p5WojWmxhoJ+d9hrhBeSPnrJ+DFaJX21JjpOQj+mfw+w4N
 pQ8+F2MtnexrUrfFY+n/qcTpnHxeGO5RtHCffSUJMqrq67WrGkV0x6vNEiVrVHNrP7EB
 sc0fWrdfwnW8WRzE77io0bsIcX3szgpLpqiH1E9CkRyFP2TdfxrggDNqbeO79UG/PTRu
 zJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765980635; x=1766585435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0EmwGnLOQObF/7cxus/deBZ8zEsUnVmeldhCqCAi8uU=;
 b=mg7Mv9gB0MqvP5qekzGG4j9KPqHDVrYzrzIN1GFhev1IJOqFq7n2rjE8/y+nwNWOly
 lhv+/5/rKnmii2nckMHXC9UacmmKgI+/4yN2qdvJtTy2LHxJ30VTQAN0pWUExVG0fHcr
 3+92/3pnzUMlaRt8nSz+5+HyiDUGhe1w+vbwhffN0uftTl36bjsKMd6m9JxDE5Ff9nPH
 AuERgeMUPCd6Wq+ZuM9mn5nmM1R+jJb0Zva6N4GcfKgyxzQw/BTiPHr/H5cPShpzEKeD
 xdO5XJVOXtKtkP5fsJvRzLxp8DAUtWT6fVSMtlLieJEL1r6lKx9Pvrk8mIJ7a+e7+7zD
 hpMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvvfeEtb00M3DN4t2B+2ksID4/LSjBtEW11YtgIyG3sZWXrz+i1JLlmGx0e1uT1NYof3FpJhEDmA==@nongnu.org
X-Gm-Message-State: AOJu0YxONrM3I4ODoelud01052FEidi5Eu0nMwMEDzgqTjKONGsFM3o8
 OoGmW81f0JYYU8rO0rGEsxDD6UBdx2LCMuLUH0cxr4TNFwOpjxjPyxFam0/uv/lALz5TgS1fR5o
 e1tS54KHjQFcx8wRkiBnA8SFgUDEOSc2b2YGrzXk82A==
X-Gm-Gg: AY/fxX6k0TOgWM1CYVouv3ReU1i2uKO18tqh7khIol+9d6yZH2ejewxUVziPaeLOgYa
 Dhi438/1Y0o66gknvg0xSCEuWDE5E9t98vaCKbWARUBJ1Od0TF63zsO2UecofZZKZW4ubCTNMOo
 6VcSD5CxKcD94sKRfag7rCx/t01mgUte7/BoTRvADFhSISst5HyWtl3Q3+rEM/bwX61cc+ozO9k
 NqOhH5RGKwYkTuFeWyQHta19Sl5OH8+0RZ5G6NjNQgvwlvOIHxGJRR5J4fkY0EcGdoZdg==
X-Google-Smtp-Source: AGHT+IFcCV5jgSV+sa++oChVfaZaUoq0xMDTrVY4XZWNS7xuGa6adOONrmvml1MBtD2IJMCM9hYfL3Rfu7TEmDDzzJE=
X-Received: by 2002:a17:907:5c8:b0:b73:5936:77fc with SMTP id
 a640c23a62f3a-b7d235c7f43mr1947663066b.13.1765980635197; Wed, 17 Dec 2025
 06:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20251217140658.89715-1-philmd@linaro.org>
In-Reply-To: <20251217140658.89715-1-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 17 Dec 2025 16:10:09 +0200
X-Gm-Features: AQt7F2q5NoR8ZXjDb2BjmIEXWIc0iQ_gqkjXsKVoCLmyPG4HVnk8qpXb1gbHMM4
Message-ID: <CAAjaMXYeJjenZ8tWd0q72hy2uqNYg1XsYv1FJkk04wmT51uKvA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Deprecate legacy VirtIO devices on big-endian
 guests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, devel@lists.libvirt.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62a.google.com
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

On Wed, Dec 17, 2025 at 4:07=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> We couldn't find a way (guest OS with VirtIO drivers) to test
> a legacy VirtIO device on a ARM vCPU running in big-endian.
>
> Deprecate for the v11.0 release, giving 1 year to users who
> really care to contribute functional tests.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  docs/about/deprecated.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index ac31a2bce42..3a69facb0f1 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -515,6 +515,17 @@ It was implemented as a no-op instruction in TCG up =
to QEMU 9.0, but
>  only with ``-cpu max`` (which does not guarantee migration compatibility
>  across versions).
>
> +VirtIO devices
> +''''''''''''''
> +
> +Legacy VirtIO devices on Big-Endian ARM architecture (since 11.0)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +There are no functional tests for legacy virtio devices used by ARM
> +machines running in big-endian order, which makes harder to maintain

Nit: s/makes/makes it/

> +the code path while the code base evolve.

s/evolve/evolves

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


> +
> +
>  Backwards compatibility
>  -----------------------
>
> --
> 2.52.0
>

