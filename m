Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0CAFF8850
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Apr 2026 00:14:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGQej-0006GG-Ex; Fri, 24 Apr 2026 20:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wGQei-0006Ft-4Y
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 20:13:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wGQeg-0003cE-5J
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 20:13:55 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so1499301866b.3
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 17:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777076032; cv=none;
 d=google.com; s=arc-20240605;
 b=JudJIgwODnEEu3TaeUruWAJTUamuVQKIcELHP97+mzvil92A/4BZ1T6BWQqQCaxIha
 OL/wvgJ+ZkqNFDzqIDVOsBaakWzD+FevIkySimYTlgRWB8AtczRMfM5s5DWOCMnwyheN
 RWMJR9U2gCvGByWQh2zgGoHRKdJ0RokVNwWQ/8haN2GopVKNdW9UskBDzsK9TayRXP9p
 c/Lk6a8htN5Ci4g0Z/xOa4Z1mqKw5+O2bmFZAlV5dXDxECxY/4wO1WWpUJO04tlezqIp
 Hg+E/gKSRyqmrOU693qvZJg0C4a1Upx7GcJ0SbgbMf8uSSCcHKIKBPktIzaiAMi+hxHZ
 f/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=m3wMEMa5c5ReChl1GLvrs3VS+RI2A4zI4ZRvGS0z4UY=;
 fh=ElMSfzoUB3ZJHF2KnIxf1yKqay44x6onTZu4XeytoVE=;
 b=EjBk7CWIcvu/10FJEFWAw+r3s5SrzdhCSucMctJ19GPrgf5HCbCkxhGQWBIK4CPwy/
 CSLx6E9FR0Mmg51rsoU4V8GtGZYGOvidr1MzkGhUZjBb8kXhIZSrR3qviIpzlqVKTh2d
 291G71RcjhVqcJidCmUj3pFqaBIYWerDM6C21b3AajgnLqc8B3ZPnGhXnCxaTgzRIZEm
 ZdugUiI21b/kYTbJdNmFyFqu7d0JJ+deUrTm/8XoEV6MphUXYqOU3GSEa/WeAXz0UicM
 aEAJMdZE0WcpHlMmpKoOCF8lFaA4wm3IPVybM7e9gZLZUrq7wY8DT7yIqoP+NzwrmhkH
 rt5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777076032; x=1777680832; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m3wMEMa5c5ReChl1GLvrs3VS+RI2A4zI4ZRvGS0z4UY=;
 b=WiBP7/0DfQAhDpjd86lRA3dI/jvhQoHjqSSgSngtY3GQ/44/wDhuF1uvQHNvful9u4
 1BQq4Oi3GZs5tES8rH4TTzRgd7wbkcZilkzSXcDwEtQV9pK0+42yT6qYafUhDfHvEZnW
 2KZLloDuslu3ybzxWqMUH70AdO5KRo2GqHBa2SruexlNmCfbtGG3o+tcd2hwbnCKAniq
 F710Ku3HU2yrhivgjNpwbAgwM8ISkqGtoAV3xB0kGxAwAWipbvXTIsQK7GrDi4eneGP6
 8NtytwAj6p5x9ILIOOmjMnBkdFI5EgPkE00l4aRicxZYcm0KF+9/l+frGoqybAI9Yp+f
 GbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777076032; x=1777680832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m3wMEMa5c5ReChl1GLvrs3VS+RI2A4zI4ZRvGS0z4UY=;
 b=DzxvgalAph1FNtn3hm5jeFvRGouT4abZqlXVOfOkMfLfRLqCVs3uSKy3ventwvbKOc
 9onCexLLXFB97L2BNf+o52hmG4z8C27AROTAD+zpbie4BjNZtyX8Dz9JPWo1GcTNpS1i
 AafPV/qhFbcHmO2xWmj0oKLaYqDilWXRNPOnkL5DAqMrGJvbTTp6zUk7QHdC1HKwEq26
 NrXjJVUWiAP4Zpoos1z1XAxEl6yRE5+PtJbhUmzNU0e92tjUGNDiHYknw8EzTuWBa/4Y
 aXn/E3aYQk4fObu4rNyKb5no8K7MpoF642cFGMyKXpWIRC+SWNtyyphRPvDCmDLY76Qe
 0Teg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KFu79WCpGAr8QJhU7XzSoLKVJJ2nicORZWstevae3hZmtWxES5Iw4TGNlc5Rd9g/tkFAKj21Cgg==@nongnu.org
X-Gm-Message-State: AOJu0YyXrwpSxmoRLCBQkK/2PDpU6bK6OzM902X2qf4YA+2P/kr1Lunx
 ZvJbr/oojEJ4kDKtvWLiSylAFDHPOqnRk1dw3i0lzwFoA5BFkvtnXTVb/QejszAtqiUVQ/exZD6
 xGJ6Rn+TPBIWFsoJ7K9uY3BsXwKYOUs0=
X-Gm-Gg: AeBDievUmBiJFOgkJFoO6S1jhaMNAxNhky7z0rMVNomMo605Jn9SitzcHV+fqgTAM4j
 KCRkEeIfOakBQGRHGYEqD4mQKtggTZN6wr7W7eIItmB+rdStXOniB7/fYxZ4W6gOdID2niASGZ3
 aogAJKLqNDTqGES/aXnsi7+JwIf4iiIDGaKEVCn+MJx7bY7HWfAzeShvEczvmJ9jlBJjk/IX9hr
 ooPVmqfgdFds7Qlj+BeKD2vJj3cEGA9Th895c200hbqZ6ldcHcx8Rrul4xP1OkShQRGLZ66k1QI
 KhyC+Vg96qYxHS6pINI=
X-Received: by 2002:a17:906:794a:b0:bae:642a:8712 with SMTP id
 a640c23a62f3a-bae642a8acamr191160166b.26.1777076031668; Fri, 24 Apr 2026
 17:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260424155646.533334-1-luc.michel@amd.com>
In-Reply-To: <20260424155646.533334-1-luc.michel@amd.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 25 Apr 2026 10:13:23 +1000
X-Gm-Features: AQROBzAFJiI4nyra7qV9fRvrp2aQ5CV4VgAc0Nn9rNmV2XrktoEuooJ8d28RF1A
Message-ID: <CAKmqyKMCrzq0nsW1Sp79Cg6NbzKWuU5k++T5Z--Oc0SHqV9CbA@mail.gmail.com>
Subject: Re: [PATCH] hw/core/register: add register_array_get_owner
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>, 
 Frederic Konrad <frederic.konrad@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Apr 25, 2026 at 1:59=E2=80=AFAM Luc Michel <luc.michel@amd.com> wro=
te:
>
> Add the register_array_get_owner function to the register API. This
> function can be used to retrieve the device owning the given
> RegisterInfoArray.
>
> This was previously done inline by some devices.
> 5c6367bc1c8850f74812eeaaf87cff9911be58de modified the way register
> blocks are created and parented to the device. Since this is an
> implementation detail of the register API, it makes sense to have a
> function for this.
>
> Use it in the Versal OSPI and Versal/ZynqMP eFuse models instead of
> tinkering with the API internals.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3421
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3422
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3423
> Signed-off-by: Luc Michel <luc.michel@amd.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/register.h        | 11 +++++++++++
>  hw/core/register.c                |  5 +++++
>  hw/nvram/xlnx-versal-efuse-ctrl.c |  4 ++--
>  hw/nvram/xlnx-zynqmp-efuse.c      |  4 ++--
>  hw/ssi/xlnx-versal-ospi.c         | 10 +++-------
>  5 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/include/hw/core/register.h b/include/hw/core/register.h
> index 1f265f4ed71..c6f648fe95e 100644
> --- a/include/hw/core/register.h
> +++ b/include/hw/core/register.h
> @@ -207,6 +207,17 @@ RegisterInfoArray *register_init_block64(DeviceState=
 *owner,
>                                           uint64_t *data,
>                                           const MemoryRegionOps *ops,
>                                           bool debug_enabled,
>                                           uint64_t memory_size);
>
> +/**
> + * register_array_get_owner
> + *
> + * Retrieve the device owning the register info array @reg_array.
> + *
> + * @reg_array The register info array to retrieve the owner from
> + *
> + * Returns: the device owning @reg_array
> + */
> +DeviceState *register_array_get_owner(const RegisterInfoArray *reg_array=
);
> +
>  #endif
> diff --git a/hw/core/register.c b/hw/core/register.c
> index c3f3c936e70..99ca5e17758 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -320,10 +320,15 @@ static void register_array_finalize(Object *obj)
>      RegisterInfoArray *r_array =3D REGISTER_ARRAY(obj);
>
>      g_free(r_array->r);
>  }
>
> +DeviceState *register_array_get_owner(const RegisterInfoArray *reg_array=
)
> +{
> +    return DEVICE(OBJECT(reg_array)->parent);
> +}
> +
>  static const TypeInfo register_array_info =3D {
>      .name  =3D TYPE_REGISTER_ARRAY,
>      .parent =3D TYPE_OBJECT,
>      .instance_size =3D sizeof(RegisterInfoArray),
>      .instance_finalize =3D register_array_finalize,
> diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efu=
se-ctrl.c
> index 69acdfa3047..f5d5587cb65 100644
> --- a/hw/nvram/xlnx-versal-efuse-ctrl.c
> +++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
> @@ -617,15 +617,15 @@ static const RegisterAccessInfo efuse_ctrl_regs_inf=
o[] =3D {
>  static void efuse_ctrl_reg_write(void *opaque, hwaddr addr,
>                                   uint64_t data, unsigned size)
>  {
>      RegisterInfoArray *reg_array =3D opaque;
>      XlnxVersalEFuseCtrl *s;
> -    Object *dev;
> +    DeviceState *dev;
>
>      assert(reg_array !=3D NULL);
>
> -    dev =3D reg_array->mem.owner;
> +    dev =3D register_array_get_owner(reg_array);
>      assert(dev);
>
>      s =3D XLNX_VERSAL_EFUSE_CTRL(dev);
>
>      if (addr !=3D A_WR_LOCK && s->regs[R_WR_LOCK]) {
> diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
> index e6bc54fc6bd..028120f824d 100644
> --- a/hw/nvram/xlnx-zynqmp-efuse.c
> +++ b/hw/nvram/xlnx-zynqmp-efuse.c
> @@ -722,15 +722,15 @@ static RegisterAccessInfo zynqmp_efuse_regs_info[] =
=3D {
>  static void zynqmp_efuse_reg_write(void *opaque, hwaddr addr,
>                                     uint64_t data, unsigned size)
>  {
>      RegisterInfoArray *reg_array =3D opaque;
>      XlnxZynqMPEFuse *s;
> -    Object *dev;
> +    DeviceState *dev;
>
>      assert(reg_array !=3D NULL);
>
> -    dev =3D reg_array->mem.owner;
> +    dev =3D register_array_get_owner(reg_array);
>      assert(dev);
>
>      s =3D XLNX_ZYNQMP_EFUSE(dev);
>
>      if (addr !=3D A_WR_LOCK && s->regs[R_WR_LOCK]) {
> diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
> index 467f0ce7033..e25e4c26c2e 100644
> --- a/hw/ssi/xlnx-versal-ospi.c
> +++ b/hw/ssi/xlnx-versal-ospi.c
> @@ -1567,19 +1567,15 @@ static RegisterAccessInfo ospi_regs_info[] =3D {
>          .ro =3D 0xffffffff,
>      }
>  };
>
>  /* Return dev-obj from reg-region created by register_init_block32 */
> -static XlnxVersalOspi *xilinx_ospi_of_mr(void *mr_accessor)
> +static XlnxVersalOspi *xilinx_ospi_of_mr(void *opaque)
>  {
> -    RegisterInfoArray *reg_array =3D mr_accessor;
> -    Object *dev;
> +    RegisterInfoArray *reg_array =3D REGISTER_ARRAY(opaque);
>
> -    dev =3D reg_array->mem.owner;
> -    assert(dev);
> -
> -    return XILINX_VERSAL_OSPI(dev);
> +    return XILINX_VERSAL_OSPI(register_array_get_owner(reg_array));
>  }
>
>  static void ospi_write(void *opaque, hwaddr addr, uint64_t value,
>          unsigned int size)
>  {
> --
> 2.53.0
>
>

