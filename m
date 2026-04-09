Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16007F364D6
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAyWu-0004yl-QS; Thu, 09 Apr 2026 19:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wAyWs-0004yM-5d
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 19:11:18 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wAyWm-00062w-4X
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 19:11:13 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6634bb959a2so2029287a12.1
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 16:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775776268; cv=none;
 d=google.com; s=arc-20240605;
 b=IMUf26DPPi1MOJy6sy6NaKPn9ciNgtBx5PH5ej/jTVTNbbb0ck5gmLak3Pi9/FvcFk
 ObEmIWWLNbKBN+8ksU4+7QBiOQSzMJ4HXvKjfHIo+llN10OXLVqW9KiJROW78XiaJMXF
 8nAZH+GsFIfpSBV/Xb3ngV3940+qiOiktm9ax5GrSb7uC0Ibs0QBoh2jtNQ0mmJ1N1dF
 XwwBduiZhuEcC6RtBbpsZgTO+BMDdh6/RxCuwyUUs8eVHGd2S0MbxIHWB55CJJ+yz05D
 Hv+fnDc3lQwHOtlvtfnPKyjYgh3p4Rw6WPDqBwkSmN6xB8k5Ho8Xp3ryys0NCbIwBrsZ
 O33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/KR+60lP4zq7vXYcivRUWvNT63Pne3rX1vPM0BghTmw=;
 fh=EQKtci4z7MwQbP/H4kIaFMVMfrJZp/ye+BHS9lMHvzQ=;
 b=bP8aLZ7x94WymqaT/U2kAM3vbnjV8xKPXaKxK2avov2Ma15zbi2gPHMEjRRPcjwqnX
 Dq1BGbtcqJ/qgfBS1+40BEqWA+oXhjOfwh+DAYR9OSvZaNdQit24jnVt0xGNAVd2dZUH
 Lp5fRIpJi4OaBA3OGuQX9QlupOeFWfarqGeRAizKnGAukjYMQY0UjT1DqeXYOJLRkDx0
 DNAAQGztkuop+j55K+dhyFM0K3ARKJ0hvgcFDErLfp8zVW7/87FzRMVFFLgW+7jkwair
 JdxCIn4zvjzJla0YX/N+vLRibqQ//ir8jdA61fg+PJeHsWBiR6XLapfP33lfHrKNAFMw
 VAjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775776268; x=1776381068; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KR+60lP4zq7vXYcivRUWvNT63Pne3rX1vPM0BghTmw=;
 b=Tu289g1wHpKBb6ioud9lBSN3QscAeQIbvYXx6Qe1Tzsd/LHsTpLcsFDJDO/VoImLJU
 u8oINkN6JWRrbA8w4vCIyxO5eHMO5UBk+dxPIWwXjL/jE9LX30fPyFgeDNJrhAhdlNa8
 l/vlZSOLl+8kh80Cif7exJ2OPSbePgzU/Ujm4p9ol7DAIMCkgCJFXyd8C/AjvUSpuIIu
 iZQpEcj1ns+Yj0KHQe/gfYDmb9l7HTs3Z3K6Jl4ZLBJgE8BjxgS+jmWeljJSejZq0nYK
 KM46FpST7BtHfxbiDt1C8Z/92yL6CIGOzX62mMQ6uaU0kF1t42q0BZ0WOHXSKtA86N7P
 ggJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775776268; x=1776381068;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/KR+60lP4zq7vXYcivRUWvNT63Pne3rX1vPM0BghTmw=;
 b=G1vdXkHvm5u3wRIteHY2vXD9X+g3HwnpzjSsHyafh5AqJZVg7I+31jcgnY3YNFAjuY
 ESK911kAoJgTslojf1gP6RyxNVc5SrImKEc52QQVBd0xsiId8gyZO6DimBpFQef1ZS7b
 xMqiD1e/QIT66TidlkGtu44mHiOlg6Ze7BcBiBBww6eHpoS4YaPal+W9HN0yDQpY+RVN
 UtkuvuTJs9LGGKXEFixzTuESq5P0ilVBRAFOhmlTlTF0Y5794Fj6xhsfjkbOR5rBSSce
 HW42nnQHC5eKNN1h04wBvZ63nrAaIf8vPKdNPGDokN7gUOdDiPilDfpkG+yYd3raMZn+
 0VKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz8xabrAngE/rjsQqEznIQSVATUgs0SAh04BZABfRBqTzor3D6xzhQdmAAAmBNNeHu4h7l+hhdsw==@nongnu.org
X-Gm-Message-State: AOJu0Yw+oHs/Sww1om2dBI7w84YpORFAdZcAGE4GWY7O8WjjfR3t7vld
 bblbj2WftHac+xmG4GIakyH1Kw7wM23CLy8mHrZ1sCNvJLuI9Zh+0S+Wy5nlTJ0C5pXydCC4rl+
 9qR2CPpq9RxznYFfzddc1DvcU71c6aI8=
X-Gm-Gg: AeBDiesN9Zk6xBrBy+agYyYAv9/EsWTSUQMItsw9OGVeDPe0otCggz2cqSglhcpUelY
 Us7ZBhHLNfVJ3OFOSPrRzn4QZPIniHafAFNve7ahoFJSuqNT7eT87LFoHxQA3/Q/2sCbjLYpnoO
 EkrS7FtVYCvYLo8h79NOZLF2DLwcp+tvKK+HcLNmhaY++Haem7rDwySJo3JPqflDKjnY5v9l8/j
 L4mHczeimwnRdDyk2PDhopu6Ge2nZ1J/DXD6bWoMd4A442i5LL2OuZtcncN2xnPKcVGPDLNcNTE
 vSWvp2SON6tbu1OlAb0=
X-Received: by 2002:a17:907:9608:b0:b9c:b88c:6364 with SMTP id
 a640c23a62f3a-b9d7249921cmr61420666b.22.1775776267420; Thu, 09 Apr 2026
 16:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
 <20260409-fix-unit-address-v1-5-946840930af2@iscas.ac.cn>
In-Reply-To: <20260409-fix-unit-address-v1-5-946840930af2@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Apr 2026 09:10:40 +1000
X-Gm-Features: AQROBzDXAHNGs9bJ86tYCUcUqXcY2fo0XK7RCn50bqQwvzx_rhA2w66un2AP4tE
Message-ID: <CAKmqyKPO8HjaoLdC61rTiNkawFfwb6e9YtAq0c2YBcA-fTtXjQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/riscv: Use hex unit addresses in FDT CPU nodes
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

On Thu, Apr 9, 2026 at 4:42=E2=80=AFPM Vivian Wang <wangruikang@iscas.ac.cn=
> wrote:
>
> These unit addresses should have been in hex, not decimal, as per de
> facto convention [1]. Fix them.
>
> Link: https://lore.kernel.org/devicetree-spec/CAL_JsqJFv3+UJ-bjLGk0i7Wc+s=
psowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com/ # [1]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 9 +++++----
>  hw/riscv/spike.c    | 4 ++--
>  hw/riscv/virt.c     | 4 ++--
>  3 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7ec67b2565..54f3bcc3b2 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -168,8 +168,9 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>
>      for (cpu =3D ms->smp.cpus - 1; cpu >=3D 0; cpu--) {
>          int cpu_phandle =3D phandle++;
> -        nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
> -        char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
> +        nodename =3D g_strdup_printf("/cpus/cpu@%x", (unsigned)cpu);
> +        char *intc =3D g_strdup_printf("/cpus/cpu@%x/interrupt-controlle=
r",
> +                                     (unsigned)cpu);
>          qemu_fdt_add_subnode(fdt, nodename);
>          /* cpu 0 is the management hart that does not have mmu */
>          if (cpu !=3D 0) {
> @@ -198,7 +199,7 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>      cells =3D  g_new0(uint32_t, ms->smp.cpus * 4);
>      for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
>          nodename =3D
> -            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> +            g_strdup_printf("/cpus/cpu@%x/interrupt-controller", (unsign=
ed)cpu);
>          uint32_t intc_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
>          cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandle);
>          cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> @@ -249,7 +250,7 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>      cells =3D  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
>      for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
>          nodename =3D
> -            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> +            g_strdup_printf("/cpus/cpu@%x/interrupt-controller", (unsign=
ed)cpu);
>          uint32_t intc_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
>          /* cpu 0 is the management hart that does not have S-mode */
>          if (cpu =3D=3D 0) {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 35c696f891..cac01ea1ff 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -105,8 +105,8 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
>          for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
>              cpu_phandle =3D phandle++;
>
> -            cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
> -                s->soc[socket].hartid_base + cpu);
> +            cpu_name =3D g_strdup_printf("/cpus/cpu@%" PRIx32,
> +                s->soc[socket].hartid_base + (uint32_t)cpu);
>              qemu_fdt_add_subnode(fdt, cpu_name);
>              if (is_32_bit) {
>                  qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv32");
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a1c323e66d..42a83dd829 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -248,8 +248,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
>
>          cpu_phandle =3D (*phandle)++;
>
> -        cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
> -            s->soc[socket].hartid_base + cpu);
> +        cpu_name =3D g_strdup_printf("/cpus/cpu@%" PRIx32,
> +            s->soc[socket].hartid_base + (uint32_t)cpu);
>          qemu_fdt_add_subnode(ms->fdt, cpu_name);
>
>          if (satp_mode_max !=3D -1) {
>
> --
> 2.53.0
>
>

