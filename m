Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9962DCA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 13:02:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut4B8-0000MX-RQ; Mon, 01 Sep 2025 09:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ut4Az-0000G5-0D
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 09:02:28 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ut4Au-0005qs-Pc
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 09:02:23 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b00a9989633so369792866b.0
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756731736; x=1757336536; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w61tivpJM1n82io8BL4sIp/rVwFVKvLE+WQ0/TgDtOc=;
 b=Aq6sT7SlkO5JKSmVJbBgW1d+ePR/qvzFvFTarscQgBAh3b6kMATDAKc1AzTKRpBkMk
 TBS17LovbehQpg8QrPiHOKezFcOwgWzGi7vn18zyrnI0BuxSCFWzPGkMavgNIuPtNgGQ
 AIARXyyOdRZFMUV5UNIaXajDziCt25bwBaVTqhE5CZOPrwBGD7a5ugv7CaLnODM7NZY9
 B+qVo4eCSDMyPl19EBozBjubemsiqqJ2nIVJvao5uF1CcV+4EB1727rhCtZ/ETt6quCr
 rK6UUrx3EsAXjPMW2ewJygv68Divu4xycoQSgTMtbYmpQtrbtUmBR07sh2/GwKuVIBSQ
 Ix5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756731736; x=1757336536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w61tivpJM1n82io8BL4sIp/rVwFVKvLE+WQ0/TgDtOc=;
 b=JvkK9PLBrTF2X0WfDtnK0zk7O7ZV54mStS/5zEPP5mh0RxeSIExh5qO3h3y53qfHCn
 hzAOXT4UqSFvfqvQwZcDmeDeWxfer4M5wPxLTOIvO68Vssk5sXe24XDvSQaP/brGYz5F
 I83ltWhmVkjR2lLqlB3v3589SvKHCwsa/e32NDtulCxNauPMwmoxZvpYcwdvgp/DAI8u
 LkI15rfYgokxGiZ0zK+k1fcRl75gQm51R1tzKp3/12yunnR6n/41JEutl5nDMh8loNy7
 x0GMQnW6yMX97UDtQjpRB5Qba4uPtEc0MO59HhtrwtjTORHEAX0zRvR92TPq6e6IqK2B
 UA3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzU77CtcWCRGdm05SBygDB1q9f+VexWPUdOQYgydnl96yK/vvuLnOSJhaaD683m3hczBp0zW4ygQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyks/xquage04U9HrvHKOFOYi8z5kK/UNLWdfdAM8SNsHHKHHeB
 dTZc4NJnI45jIyHUMaOZAIBzejI1ESxH4FA+wiRPIFH8Aa14tHPFlHcc4K0h1/bHKQ7LsrA3iu9
 kg1pWwPHrqiw8go5Oa1bMIGQWMtoX5oQiBrw3M5qMekoOWMuKDQUw12U=
X-Gm-Gg: ASbGnctfGPtucKyZHfESRtCR6eyq2KHj0gfKIYgdqGVsHNFg5/ApL3MwoiZMCD1l4ZY
 w5SR+IJJvj0dfK7qN3aFF41N3AjvVw/jDNl9zrfALJfhI1RNcpEdmEEkZz86UXzQ39lDQ7gNJ+Z
 yzfNaoq0jZMcsDiJynv6VkJG8WCXnWf8Qoe1j3PtAKjmVDBu2/9xF4v3i/teFDlhRYMmAJ8ia8T
 ODuqJ0dds8ld5wTNcg=
X-Google-Smtp-Source: AGHT+IE3V/7jbCANXhLJu088f4gEA2SXFvRzhezzMhRlZrqnnfSYeTIgyrvcLU/HfxJwrklwOiBAIoq0shMDUhA2g+0=
X-Received: by 2002:a17:907:745:b0:afe:ed05:2e44 with SMTP id
 a640c23a62f3a-b01081b3f3fmr686304966b.14.1756731725392; Mon, 01 Sep 2025
 06:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250901125304.1047624-1-alex.bennee@linaro.org>
 <20250901125304.1047624-3-alex.bennee@linaro.org>
In-Reply-To: <20250901125304.1047624-3-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 1 Sep 2025 16:01:39 +0300
X-Gm-Features: Ac12FXy1jHBCAGP3vfBUGaPzX_PFEiuprLC_A2nr1xHSHpy6ytej_zLs8lRfkp0
Message-ID: <CAAjaMXZXNgu9ONiWM+4B-p6XtcDMTzROin4dkDvwhZjpjQZs2w@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/arm: use g_autofree for fdt in arm_load_dtb
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x630.google.com
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

On Mon, Sep 1, 2025 at 3:53=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> With the fdt being protected by g_autofree we can skip the goto fail
> and bail out straight away. The only thing we must take care of is
> stealing the pointer in the one case when we do need it to survive.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


>  hw/arm/boot.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 56fd13b9f7c..749f2d08341 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -519,7 +519,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>                   hwaddr addr_limit, AddressSpace *as, MachineState *ms,
>                   ARMCPU *cpu)
>  {
> -    void *fdt =3D NULL;
> +    g_autofree void *fdt =3D NULL;
>      int size, rc, n =3D 0;
>      uint32_t acells, scells;
>      unsigned int i;
> @@ -538,13 +538,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>          fdt =3D load_device_tree(filename, &size);
>          if (!fdt) {
>              fprintf(stderr, "Couldn't open dtb file %s\n", filename);
> -            goto fail;
> +            return -1;
>          }
>      } else {
>          fdt =3D binfo->get_dtb(binfo, &size);
>          if (!fdt) {
>              fprintf(stderr, "Board was unable to create a dtb blob\n");
> -            goto fail;
> +            return -1;
>          }
>      }
>
> @@ -553,7 +553,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>           * Whether this constitutes failure is up to the caller to decid=
e,
>           * so just return 0 as size, i.e., no error.
>           */
> -        g_free(fdt);
>          return 0;
>      }
>
> @@ -563,7 +562,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>                                     NULL, &error_fatal);
>      if (acells =3D=3D 0 || scells =3D=3D 0) {
>          fprintf(stderr, "dtb file invalid (#address-cells or #size-cells=
 0)\n");
> -        goto fail;
> +        return -1;
>      }
>
>      if (scells < 2 && binfo->ram_size >=3D 4 * GiB) {
> @@ -572,14 +571,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>           */
>          fprintf(stderr, "qemu: dtb file not compatible with "
>                  "RAM size > 4GB\n");
> -        goto fail;
> +        return -1;
>      }
>
>      /* nop all root nodes matching /memory or /memory@unit-address */
>      node_path =3D qemu_fdt_node_unit_path(fdt, "memory", &err);
>      if (err) {
>          error_report_err(err);
> -        goto fail;
> +        return -1;
>      }
>      while (node_path[n]) {
>          if (g_str_has_prefix(node_path[n], "/memory")) {
> @@ -611,7 +610,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>              if (rc < 0) {
>                  fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
>                          mem_base);
> -                goto fail;
> +                return -1;
>              }
>
>              mem_base +=3D mem_len;
> @@ -622,7 +621,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>          if (rc < 0) {
>              fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
>                      binfo->loader_start);
> -            goto fail;
> +            return -1;
>          }
>      }
>
> @@ -636,7 +635,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>                                       ms->kernel_cmdline);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/bootargs\n");
> -            goto fail;
> +            return -1;
>          }
>      }
>
> @@ -645,7 +644,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>                                            acells, binfo->initrd_start);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n")=
;
> -            goto fail;
> +            return -1;
>          }
>
>          rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initr=
d-end",
> @@ -654,7 +653,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>                                            binfo->initrd_size);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
> -            goto fail;
> +            return -1;
>          }
>      }
>
> @@ -673,14 +672,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>
>      if (fdt !=3D ms->fdt) {
>          g_free(ms->fdt);
> -        ms->fdt =3D fdt;
> +        ms->fdt =3D g_steal_pointer(&fdt);
>      }
>
>      return size;
> -
> -fail:
> -    g_free(fdt);
> -    return -1;
>  }
>
>  static void do_cpu_reset(void *opaque)
> --
> 2.47.2
>
>

