Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE70FF493A
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 04:32:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w74IO-0002rx-T5; Mon, 30 Mar 2026 00:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w74IN-0002rG-H0
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 00:32:11 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w74IL-0005hv-UQ
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 00:32:11 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b93698bb57aso735240566b.0
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2026 21:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774845128; cv=none;
 d=google.com; s=arc-20240605;
 b=Kt/7xVLXZYl2xhfiRnOI8tpQKshWoYpHJPG56/F6S0INe/2EdN6U3OT3S2J4rOLk79
 6p0xmjVdj6V4cGrg6SLOuIUztRgXlQ4NYWwjuiL2eUeGFPgSRQZDR6V6mqbb3NQon/V9
 L1obUDuvdfeMN3rqMGnnJd93d8sr+4CDACfGcolfJYGgIPzTdq1vhVPHNX2T7IacIkSv
 K7MlppK0eiU6QuGTsrK4xgfQzvtiQzisaJaAClHNr9sQl+k2PrBV1DrDXEOBWCMp4vTb
 FSozPt/m5QqSZTbQYbwk6kGhnhTxlxnW72yct9IRjGPxwjaOjNb6CLtyItCsh0RnmtrR
 Ozxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HUxknrcLJxiaIaqDvu9lU6L2M21SLrou8EajFFXcWPQ=;
 fh=3Q0qFgRTCrHwamKh8WMoGJttjfCB3kxcEU5DSWM4Fq8=;
 b=BbNZn5d2usBKZKZRygNvCaMnyOMf5ZVysgOpouL9LZHzkVcTa++yggsR3BONs6dqsn
 HirMZP0kcA/SvbFMe8JrJ+xb4MnLbGEIctKivoHJQCEVoC1xvPh09U6GmHt1ybkBYf6M
 fSUcVByOzRHxfv4JoKIKx2UDYbJ/wUxJzABgny9aMF8HvLziERWp3Q7g/uvaRcfE66id
 5jRlz8Pkja6a/MioS6KWgo4/sVWKs6ZMfOdVvu8+EEsyfbjb9ZYvNfgmInM1nz+5SUVs
 ss2ORwx1a7kopLY+BpUig9A2Zcdz8dg6kfqir0q6oUJQLpjMkjBYNe9QyoXYdgzuJPGb
 GBZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774845128; x=1775449928; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUxknrcLJxiaIaqDvu9lU6L2M21SLrou8EajFFXcWPQ=;
 b=aYynbLEVX/F2hpqf8H/VlZuELvs1zli5pM/mfD0PkpR3gKTfe3sBeT5C24djLijJhJ
 +uTpLRLUolFMpuwNGGlznGzGrt76s6Tz0ZGfMA6ef1zwraD1nhti2ocCJaL/w1OQjPB3
 DQaj0CuWAkJ4LYv+hGNukwiWbn74aSR7LLwChhdB4iaOouqVYsLYXqUZDvp4ytuQMi1A
 VqJRQf+tIRnK3byGJpyeBN+XTGCbwXXufjg92YHJsX99fyJyjKSE2WSU5lZSkEXg9RN0
 IS/qXrSxZpXgmlSZidQtMw6LC0y/TYcPnoolNxJGd6K9lop3KFBilciu5RlmRodplhwS
 kkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774845128; x=1775449928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HUxknrcLJxiaIaqDvu9lU6L2M21SLrou8EajFFXcWPQ=;
 b=D1M086v4zFGusv+OvLXbDHCNLkRnf3ScQEWLxD0qfNMIYm7d5Wxaa9Fmhex/Ld/nIf
 RrG1LdhdFxdIMu4QGccp7ERq/Ok0GpCwrZaHELttFoUiWAmun0C8EaeJ1cr7QyMLoZRM
 DZUTlDdeYq0v1iuA/Jb3SeDKb9K0q4r5DWreFeekBb2yaxEWZ0EN+HR+TW4A4gY3bbY4
 oWZ8Adp5zysZHoScPmfgfHG2chHu0iZVfPeQHljFWHSDRF+bmlrblF+QIeoG64rY4DCK
 bb8qWY4shNwrf6EJlI+SIUj2LtdGbLl1gv+Sx+jLLlL+yPgM7VH8DSyBls3oh8U7SM1L
 yf+Q==
X-Gm-Message-State: AOJu0Ywn0MtPQWPUBjWyWMZKwa1of3Eb6RSNFUn25WHEdVljd5EZyhCn
 EZuVl1jQfgWLgPq6wWu9HXb1N5u1OsAP/jyfxPTdFAEnR2ZIEXFabPKgvbyY1wRt7POmwuRCp8A
 xMFpcxx1WVdLIHKYepBZX8PQe1SGWX3o=
X-Gm-Gg: ATEYQzzk+Z8xqlHJVw1EIb4o2YYWlm3z7i1okjUpQGklv3hwYXiqWUztW9GTcS9+2KD
 eHKjoqTTW71drTeMQrZt8vKAQ9PMDkVH5cI/VbNG1hN/FPXgp2vG6YKI7I+Z99F3gGTdK4RG38z
 D9IRlXzCzt1a+H5q1hVz3jXPsr+XkxebWLyEHs6UW722sVAb2nslnP5sl6W/cg0ewDm2tL8ahKp
 5o3A22UH0+tyCfAOlmSGqKWfVqJReb0yUbJzVkcYBWXIsrW3YAktNjtPKo2gKM7tlTPIx0acEdt
 jG7p7G5ahZj9Y6T8CS3ILcttGIESOKZjHWiILw==
X-Received: by 2002:a17:907:3dac:b0:b98:14e:32c0 with SMTP id
 a640c23a62f3a-b9b2e5e6da4mr780864766b.14.1774845127653; Sun, 29 Mar 2026
 21:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260327145012.907264-1-peter.maydell@linaro.org>
In-Reply-To: <20260327145012.907264-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Mar 2026 14:31:40 +1000
X-Gm-Features: AQROBzDHnQetwKvhJmhU56mAsxFqJ47B6DALJ8v3qewDB70SpyuLfbCm6tH3coQ
Message-ID: <CAKmqyKMUaHQ2uiqVnT7M98AFenmZOGJd5AAShgtKt5RgDo8APg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Use strcasecmp to parse boot-mode
 option values
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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

On Sat, Mar 28, 2026 at 12:51=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>
> In zynq_set_boot_mode() where we parse the string the user has set
> the boot-mode option to, we use strncasecmp(str, "qspi", 4) and so
> on.  This is wrong, because it means that we will ignore any trailing
> junk on the end of the option string, and handle
>  -machine boot-mode=3DsdXYZZY
> the same as
>  -machine boot-mode=3Dsd
>
> In the documentation we say:
>  Supported values are ``jtag``, ``sd``, ``qspi`` and ``nor``.
> and that's obviously what we meant to implement.
>
> The correct tool for this job is a simple strcasecmp operation.
> Switch to that.
>
> We use the g_ascii_strcasecmp() rather than plain strcasecmp()
> because we're comparing ASCII strings here and don't want the
> potentially locale-specific behaviour that strcasecmp() implies (and
> we're trying to standardize on the glib function for this kind of
> string comparison).
>
> Fixes: 7df3747c92d13 ("hw/arm/xilinx_zynq: Add boot-mode property")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Kostiantyn: I sent this patch out while it was on my mind, but
> don't worry about conflicts with your series -- assuming your
> patchset goes in first I'll fix this one up later.
> ---
>  hw/arm/xilinx_zynq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index d43f36b718..9dcded9219 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -186,13 +186,13 @@ static void zynq_set_boot_mode(Object *obj, const c=
har *str,
>      ZynqMachineState *m =3D ZYNQ_MACHINE(obj);
>      uint8_t mode =3D 0;
>
> -    if (!strncasecmp(str, "qspi", 4)) {
> +    if (!g_ascii_strcasecmp(str, "qspi")) {
>          mode =3D 1;
> -    } else if (!strncasecmp(str, "sd", 2)) {
> +    } else if (!g_ascii_strcasecmp(str, "sd")) {
>          mode =3D 5;
> -    } else if (!strncasecmp(str, "nor", 3)) {
> +    } else if (!g_ascii_strcasecmp(str, "nor")) {
>          mode =3D 2;
> -    } else if (!strncasecmp(str, "jtag", 4)) {
> +    } else if (!g_ascii_strcasecmp(str, "jtag")) {
>          mode =3D 0;
>      } else {
>          error_setg(errp, "%s boot mode not supported", str);
> --
> 2.43.0
>
>

