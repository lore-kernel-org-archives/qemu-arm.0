Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACCBCAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun, 28 Sep 2025 23:36:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v30wa-0003I9-W7; Sun, 28 Sep 2025 19:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v30wY-0003Fj-Ar
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 19:36:38 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v30w8-0006iB-K6
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 19:36:34 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-628f29d68ecso8269650a12.3
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759102565; x=1759707365; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HD2+rEol+zuesGa48FK5nOsi28dpTeYz0uRTWXah58A=;
 b=J8jgtEMdwJbFpyOsL/4tClnR3/G+oYKk7sGtuabTJMa/y5FzfJD6pPjvgaD2mVPx4p
 jpiQwwhD4CMTUJ2umuEQsdEXnKGnMRt9fm04Q0rnfmPrmdVEv6WcuKDiDvbDKFoDN6dZ
 99M9Z1ZwMPwKanoBphaXrhjdKt4Hu42COmXRPVuzdtmsYNPnoRxcry4BNTYJDutR+XFA
 DfZw+OQB7DjKxKafYiUNQrlph52LV/hvmazK8j0vGmSMXDoxf8Xep9rrP0Pmu3SDiG6O
 EkvCstaaNsuOu0ZKRqwTN+J1L/8q0LiGKzXD2Uch6T2cP0WhndwoC2lR0vO3dCLJptOi
 dQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759102565; x=1759707365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HD2+rEol+zuesGa48FK5nOsi28dpTeYz0uRTWXah58A=;
 b=EeqwDpJyZSv9gGmHekezh3cPtCr0wrDG9I1sY4lROqSbQDaGhdrwH1LqsV87ar0O+W
 zYtBnPw0z/vEiSuRbPTI0VKUjJ0PUdVpJo46aLNMYjE9ZtHXvUKfARTuZzI4QC2oA0hD
 Ciqn5KetDWegXqt/kW7oDUTtrLIfLXQTYsN8wLIQvXECriF+jHATIwthve9ZH7zZRB6O
 UFEkJV+/OmSTiMTuoGnZ31jSxgCqsLB66kpTEBreU+TIC7Q2f/8MDEPITqPDyjappLE3
 +OIKNNCSAhywAnwVOPG9/Upv0+vkkAwCViJL4tiJtxr27QmYfOVGQdLbwnkyVCXa36vR
 tDoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwpLyry9Md1xpmzR5z0SXG3ZH65DWjm0gUDn2nJbpJ6DyuadonX/RkbNaBat9mSe/jPpnctoWZRA==@nongnu.org
X-Gm-Message-State: AOJu0YxesSLblIfbSxLHjQPrQnUCVFTWYjzvfDB66hyY4Ll3ulErW0wc
 goGUsGGj/LPqZPUPtr18DdcZTmeBubmMxF9FCe1zwaNkUggu/YIdpuQtx0j6aqfC4DrnEJvfzIk
 aniLxlOlF0hw2JBp+cq6Oqp0V7DW8ssY=
X-Gm-Gg: ASbGncugxNv4p0+DkoR5ul9ibNTujTYNK9iOhqG6a4FDX8qDMOOTCWiJXc3C/XG5N1R
 M4W1gW+cOoefZqC87CNyniHK0q2H5cb8JuriMd5P6WR6FYN5ihvTSLCc5VM/2WwBnW0bF8R7H2g
 tqCzbE6bKiSrL1IFLC11pckbpZGU62SE6YFza+BdQDQAfGTP6f5pI4MjKxkN+I0cEdoa9qT96y0
 hXHQTa+SIdnmy7xazk8+tB+s1Rd+4Eg4xrcZA==
X-Google-Smtp-Source: AGHT+IG8UmC1JtVGPuq3Q8HeKWf6Y11YOD0ghCL4E9Q2pPwtej86heMuMRvNkad3LwexQgQ79wF50vyjYW+7LQAZcmc=
X-Received: by 2002:a17:906:f586:b0:b3d:d6be:4cbe with SMTP id
 a640c23a62f3a-b3dd6be501fmr327735266b.18.1759102565288; Sun, 28 Sep 2025
 16:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250917114450.175892-1-luc.michel@amd.com>
 <20250917114450.175892-5-luc.michel@amd.com>
In-Reply-To: <20250917114450.175892-5-luc.michel@amd.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 09:35:38 +1000
X-Gm-Features: AS18NWCd7M3pY-ULQbN3tNzSPRcE3-9A3kwkHeA_qnAcH8LlwzizUQDKmAdm8SQ
Message-ID: <CAKmqyKMY3p=5RzeYRjF_twtE6p2yeahJPBoqcFW4ZHsVaRYZYg@mail.gmail.com>
Subject: Re: [PATCH 4/7] hw/core/register: remove the `register_finalize_block'
 function
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Sep 17, 2025 at 9:50=E2=80=AFPM Luc Michel <luc.michel@amd.com> wro=
te:
>
> This function is now unused. Drop it.
>
> Signed-off-by: Luc Michel <luc.michel@amd.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/register.h | 14 --------------
>  hw/core/register.c    |  4 ----
>  2 files changed, 18 deletions(-)
>
> diff --git a/include/hw/register.h b/include/hw/register.h
> index 65c82600e06..7b0f4c8b7a6 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -207,20 +207,6 @@ RegisterInfoArray *register_init_block64(DeviceState=
 *owner,
>                                           uint64_t *data,
>                                           const MemoryRegionOps *ops,
>                                           bool debug_enabled,
>                                           uint64_t memory_size);
>
> -/**
> - * This function should be called to cleanup the registers that were ini=
tialized
> - * when calling register_init_block32(). This function should only be ca=
lled
> - * from the device's instance_finalize function.
> - *
> - * Any memory operations that the device performed that require cleanup =
(such
> - * as creating subregions) need to be called before calling this functio=
n.
> - *
> - * @r_array: A structure containing all of the registers, as returned by
> - *           register_init_block32()
> - */
> -
> -void register_finalize_block(RegisterInfoArray *r_array);
> -
>  #endif
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 4d1cce02a55..6cfcfcd2b14 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -321,14 +321,10 @@ static void register_array_finalize(Object *obj)
>
>      object_unparent(OBJECT(&r_array->mem));
>      g_free(r_array->r);
>  }
>
> -void register_finalize_block(RegisterInfoArray *r_array)
> -{
> -}
> -
>  static const TypeInfo register_array_info =3D {
>      .name  =3D TYPE_REGISTER_ARRAY,
>      .parent =3D TYPE_OBJECT,
>      .instance_size =3D sizeof(RegisterInfoArray),
>      .instance_finalize =3D register_array_finalize,
> --
> 2.50.1
>
>

