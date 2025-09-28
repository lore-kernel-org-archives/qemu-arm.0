Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F84CAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun, 28 Sep 2025 23:35:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v30uy-0002Lv-G2; Sun, 28 Sep 2025 19:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v30uw-0002Ln-Gr
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 19:34:58 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v30up-00069E-4c
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 19:34:58 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b30ead58e0cso746190066b.0
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 16:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759102480; x=1759707280; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8WmmeDeDoONnFHi1ByGVfDBiZFbMtQVsSiRfjLQszM=;
 b=ZZHN2qMnaVz3xWEum7r1/mNZGSaiyUF1yPVTJadUcP7GENHbuKQMMlITrI8ORk2kNR
 jxRnFj9oU3zi+4ooGooF9y0hZrT4CwJFeSf+HlicN0Xq4xgI23O24iQqPIuH1cHjANs/
 OCxRSDIHGWU+KwjIioLM/GaBv0hssvZsPzHjq2+6KHogZCQ9lM8bolq9WZbpWNqAwHII
 lpZyFN8m24oUNDC9gtGgaiO7Z48Do2xqMT8xeTp6WQ5hy7Zkbwj0Oyymb0idU4dXjsuI
 +QJFu6O6xcbwWX9ssc5IyaydNmItg3t1P1QOmteQgeE6yvsjMbumunRlLTEV8f1mzEy6
 GJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759102480; x=1759707280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8WmmeDeDoONnFHi1ByGVfDBiZFbMtQVsSiRfjLQszM=;
 b=Cjqgm+FI82Jo0i/rwN2+ZlHVfF8njySQRnUDn+N+iHrLH/FGZfxnGY9tuVjKJQdqGB
 8i/K9o6BEn7xSGcBc+MBRqBbVApCaHpfTKhV39kJ5MZGyiBDtRKT7yeWCU434KK5J9S0
 5mils0DNlXcndU5c4dgvBY72U2gzMYGZp77AfmNU9nlaadk2LFeO0oCCrd2U24uW763M
 BaaJx5ONqyOR8AQi1u74LrbqUayLyVyAepi2Hu05O5D+Z97N6qbACZFhtCsjDgt96gVb
 KkcKNRpMq7hX8oetNg7PF2Szapcwrc9g5bj0UuMRAVKwHASU+9rjv6uFocDhHwxe+fYd
 QwRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvgufAPNuXduACCUVrfeZf7nBLHrYQpvmA2pv5V9FlUNHQZM89I2iAci1IQMjL4/c5oJpKp+W39Q==@nongnu.org
X-Gm-Message-State: AOJu0YxWmemydFU2fha/UZrMV3+LVocwwJvzR0D7/wQM90FpHesVm9l7
 ZUtPvoebzR3DzMVPGgw7BEySNmM5wkin3xZptH/iU6Pn2zZkymk6KCPp75jsue7Mi51m3phYqva
 S3n8vyC8TeYz58hOQon5eeJZcjMW4Hwc=
X-Gm-Gg: ASbGnctFdeaE8WN7hS/2jb3wr8eVk23pjPB3XnqoVSSHu6GxuXTI41QbIA4U2g2omvF
 f5Wg8ojV5zY9tpo12Qk9vp2LfO+KQ78Z18yY2BIpQiRNsTW9CoT2FLmEVYXP76B0JUA71IYqZoz
 r6TL5ZIlj6x6VUa6yPfTZjwycNWQp5zg47XMOwZTylPM69MO94MvX/AbKhe48Mh+/geGlG7YZJO
 LVwqOVOkhQMehZiPjXD3B7Qk2hL5qG+vZ0SI0GAAwEf5Pt0
X-Google-Smtp-Source: AGHT+IGuN6TnogZqbKHMychFVgXtv5rkVd+8FcBZFBtQRxS3dnKOVwO4UBDLO4yL5cC+z9VPespeF17PrSyg9SPwRBQ=
X-Received: by 2002:a17:907:d93:b0:b3f:cc6d:e0a8 with SMTP id
 a640c23a62f3a-b3fcc7d24f9mr34315866b.17.1759102479800; Sun, 28 Sep 2025
 16:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250917114450.175892-1-luc.michel@amd.com>
 <20250917114450.175892-3-luc.michel@amd.com>
In-Reply-To: <20250917114450.175892-3-luc.michel@amd.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 09:34:12 +1000
X-Gm-Features: AS18NWDAVFp9EkW51ZKQ5tTgQOSPEEbtItwqmPq8mODLyAVaHuw9ceZO6D2U8q0
Message-ID: <CAKmqyKMTO3-6zdJMp8RuP1LpvNDcJYbz+0bJma52qDjQA-vpWg@mail.gmail.com>
Subject: Re: [PATCH 2/7] hw/core/register: add the REGISTER_ARRAY type
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Sep 17, 2025 at 9:51=E2=80=AFPM Luc Michel <luc.michel@amd.com> wro=
te:
>
> Introduce the REGISTER_ARRAY QOM type. This type reuses the existing
> RegisterInfoArray struct. When `register_init_block' is called, it create=
s
> a REGISTER_ARRAY object and parents it to the calling device. This way
> it gets finalized when the device is.
>
> The finalize function of the REGISTER_ARRAY type performs the necessary
> cleaning that used to be done by `register_finalize_block'. The latter
> is left empty and will be removed when all the register API users have
> been refactored.
>
> Signed-off-by: Luc Michel <luc.michel@amd.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/register.h |  4 ++++
>  hw/core/register.c    | 24 +++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/register.h b/include/hw/register.h
> index 4d13ea183c7..65c82600e06 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -81,10 +81,12 @@ struct RegisterInfo {
>      const RegisterAccessInfo *access;
>
>      void *opaque;
>  };
>
> +#define TYPE_REGISTER_ARRAY "qemu-register-array"
> +OBJECT_DECLARE_SIMPLE_TYPE(RegisterInfoArray, REGISTER_ARRAY)
>
>  /**
>   * This structure is used to group all of the individual registers which=
 are
>   * modeled using the RegisterInfo structure.
>   *
> @@ -94,10 +96,12 @@ struct RegisterInfo {
>   *
>   * @mem: optional Memory region for the register
>   */
>
>  struct RegisterInfoArray {
> +    Object parent_obj;
> +
>      MemoryRegion mem;
>
>      int num_elements;
>      RegisterInfo **r;
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 57dde29710c..4d1cce02a55 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -243,14 +243,20 @@ static RegisterInfoArray *register_init_block(Devic=
eState *owner,
>                                                bool debug_enabled,
>                                                uint64_t memory_size,
>                                                size_t data_size_bits)
>  {
>      const char *device_prefix =3D object_get_typename(OBJECT(owner));
> -    RegisterInfoArray *r_array =3D g_new0(RegisterInfoArray, 1);
> +    Object *obj;
> +    RegisterInfoArray *r_array;
>      int data_size =3D data_size_bits >> 3;
>      int i;
>
> +    obj =3D object_new(TYPE_REGISTER_ARRAY);
> +    object_property_add_child(OBJECT(owner), "reg-array[*]", obj);
> +    object_unref(obj);
> +
> +    r_array =3D REGISTER_ARRAY(obj);
>      r_array->r =3D g_new0(RegisterInfo *, num);
>      r_array->num_elements =3D num;
>      r_array->debug =3D debug_enabled;
>      r_array->prefix =3D device_prefix;
>
> @@ -307,18 +313,30 @@ RegisterInfoArray *register_init_block64(DeviceStat=
e *owner,
>  {
>      return register_init_block(owner, rae, num, ri, (void *)
>                                 data, ops, debug_enabled, memory_size, 64=
);
>  }
>
> -void register_finalize_block(RegisterInfoArray *r_array)
> +static void register_array_finalize(Object *obj)
>  {
> +    RegisterInfoArray *r_array =3D REGISTER_ARRAY(obj);
> +
>      object_unparent(OBJECT(&r_array->mem));
>      g_free(r_array->r);
> -    g_free(r_array);
>  }
>
> +void register_finalize_block(RegisterInfoArray *r_array)
> +{
> +}
> +
> +static const TypeInfo register_array_info =3D {
> +    .name  =3D TYPE_REGISTER_ARRAY,
> +    .parent =3D TYPE_OBJECT,
> +    .instance_size =3D sizeof(RegisterInfoArray),
> +    .instance_finalize =3D register_array_finalize,
> +};
>
>  static void register_register_types(void)
>  {
> +    type_register_static(&register_array_info);
>  }
>
>  type_init(register_register_types)
> --
> 2.50.1
>
>

