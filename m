Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2498910lfq;
        Sun, 17 Nov 2019 23:15:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+84gTYsL18laqy3PCt755p2aY0prQq9jJc3DA3eYVP3jiOdmTA5cGEOtM4dXCkGssbiNh
X-Received: by 2002:a37:47c4:: with SMTP id u187mr21924550qka.174.1574061350732;
        Sun, 17 Nov 2019 23:15:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574061350; cv=none;
        d=google.com; s=arc-20160816;
        b=mTgkRrDqf1mAaTVR05gXVupSrxT7s+4bnmKSI4l4bF/PdUlcpT/6CH376QALCUjSe2
         tGCggNljVNbKVaQ1wS13paqQ8fC68XlbPLDgAfmKYOtHk5BZiGpG0mrToDiKL9iuj/OG
         bJ1yxh673o2biZmaYnAoaPJKVN3QHVXq+Q1jMskbt4MDxanOcyXK+NQaz9DvbNp//tmh
         2xTZuhZ+NspFZ/KTDGcPwtHiD67pmYCfJ+7RN0OHmSefBXty73SXaPvYhs/cNi6d9z/V
         6J3lkXuynIOaehhISGcBG9VPLxYLl4wxsWG+PB5g1lsZp8g1SohYajSkacj9zjTGzHtA
         uOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Q5sp6VNx9wexE8ZcBy7gIVJOZHvmfhANEpomWVTrTsg=;
        b=n25np53kaCwPJxEPmGh7YJvqCGuVDKOYwYOoSfS1u0dOBt1MbyKp55tuNDCyO51of9
         bs/mRwG6ESNvpuRd8eoKQxFL+/rKmKkFGQ1xR61Sev5gVVJjg1q6j4Cr//7IzbPKz54x
         nCjlXJRj/uAPw2f+ICuGWUOQntzr01M4i21PgdVTDk8beS5I28SMX/5x7vgfwNK5xmKB
         5LLvIEw8ZCIqgMvaz06oNWcCI1IZRhNU66X6tGuxXRwWF/9hi9igp7t+hEpwayU9fmSC
         0Y2yk3d+rFZRBLptnMWf/cb+H6+DRkyJ5+xT+Drvjczb5zbtf1hqad0B5vophVSdUfLM
         B5Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cedjCcfH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si10287186qtb.39.2019.11.17.23.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 23:15:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cedjCcfH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWbGH-0000yr-LD
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 02:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iWbFu-0000xm-V9
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 02:15:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iWbFt-0000C3-Br
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 02:15:26 -0500
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:36957)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iWbFt-0000Bk-82; Mon, 18 Nov 2019 02:15:25 -0500
Received: by mail-qv1-xf42.google.com with SMTP id s18so6122990qvr.4;
 Sun, 17 Nov 2019 23:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q5sp6VNx9wexE8ZcBy7gIVJOZHvmfhANEpomWVTrTsg=;
 b=cedjCcfHC7l/FovxBLXLSGPYV4U+5jMSMeLadvqPMmqVo5cI1wyH1p+YWJrmp72fa7
 y0bEUPh6H2U0GZ2bgLR8KovtxPUuk0Xs8XA74zy98u9fpyyd7IqbKbT5K7xcgfn1aIR5
 6K6kJGojYgYn5kW1Z7th4WldQZzwpgX31K8sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q5sp6VNx9wexE8ZcBy7gIVJOZHvmfhANEpomWVTrTsg=;
 b=iATEMpdL+okGcReu9pZdhzgieTFFfgsAOiOFkXY/cyntH6Be699GJwbXsxGDi4jfi5
 mRnNEue+V/hzoMTOQ5AhtHhJAsyn8USeBRr0qXfGoPk355lXnd5gkL7hwyo/WToT+QpR
 W/6fkwBxIQCykYiUqXrORk6Kzl8DK15QFHnhSKsR53H/pl/2nybkhnIAdM+6a2F2NwEC
 w5lPjmdUEDtEij348kjimvY5dRBhzTenouFhhowGix6ILi31bNSPVjJEf5cDoEiBESUZ
 EOE+olDRYfSrua40z6OpTTpUcJJ+PeG0ooJtZUEr8N0KCkqie4jSBXaA88CyMboehiZq
 hASA==
X-Gm-Message-State: APjAAAVhal0sj8RhQmWHHOV0tV5WUxVUZ1uBr7vOLc7p36OLqCtMr4NE
 IsnZju4IBjJ0fENAzKCH5EoloacuJQtW85rXeXw=
X-Received: by 2002:a05:6214:2c2:: with SMTP id
 g2mr23856072qvu.210.1574061324137; 
 Sun, 17 Nov 2019 23:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20191114094544.30114-1-clg@kaod.org>
 <20191114094544.30114-4-clg@kaod.org>
In-Reply-To: <20191114094544.30114-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Nov 2019 07:15:12 +0000
Message-ID: <CACPK8XcXAYkanw2+fxVh9y+PnQEgrX64PkYYFpxQ5i4B1YgZOQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] aspeed/smc: Add AST2600 timings registers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f42
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HylwVrAEFE/Z

On Thu, 14 Nov 2019 at 09:46, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Each CS has its own Read Timing Compensation Register on newer SoCs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/ssi/aspeed_smc.h |  1 +
>  hw/ssi/aspeed_smc.c         | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 684d16e33613..6fbbb238f158 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -40,6 +40,7 @@ typedef struct AspeedSMCController {
>      uint8_t r_ce_ctrl;
>      uint8_t r_ctrl0;
>      uint8_t r_timings;
> +    uint8_t nregs_timings;
>      uint8_t conf_enable_w0;
>      uint8_t max_slaves;
>      const AspeedSegments *segments;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 86cadbe4cc00..7755eca34976 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -137,7 +137,7 @@
>  /* Checksum Calculation Result */
>  #define R_DMA_CHECKSUM    (0x90 / 4)
>
> -/* Misc Control Register #2 */
> +/* Read Timing Compensation Register */
>  #define R_TIMINGS         (0x94 / 4)
>
>  /* SPI controller registers and bits (AST2400) */
> @@ -256,6 +256,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 5,
>          .segments          =3D aspeed_segments_legacy,
> @@ -271,6 +272,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 5,
>          .segments          =3D aspeed_segments_fmc,
> @@ -288,6 +290,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D 0xff,
>          .r_ctrl0           =3D R_SPI_CTRL0,
>          .r_timings         =3D R_SPI_TIMINGS,
> +        .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D SPI_CONF_ENABLE_W0,
>          .max_slaves        =3D 1,
>          .segments          =3D aspeed_segments_spi,
> @@ -303,6 +306,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 3,
>          .segments          =3D aspeed_segments_ast2500_fmc,
> @@ -320,6 +324,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 2,
>          .segments          =3D aspeed_segments_ast2500_spi1,
> @@ -335,6 +340,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 2,
>          .segments          =3D aspeed_segments_ast2500_spi2,
> @@ -350,6 +356,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 3,
>          .segments          =3D aspeed_segments_ast2600_fmc,
> @@ -365,6 +372,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 2,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 2,
>          .segments          =3D aspeed_segments_ast2600_spi1,
> @@ -380,6 +388,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_ce_ctrl         =3D R_CE_CTRL,
>          .r_ctrl0           =3D R_CTRL0,
>          .r_timings         =3D R_TIMINGS,
> +        .nregs_timings     =3D 3,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
>          .max_slaves        =3D 3,
>          .segments          =3D aspeed_segments_ast2600_spi2,
> @@ -951,7 +960,8 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
>      addr >>=3D 2;
>
>      if (addr =3D=3D s->r_conf ||
> -        addr =3D=3D s->r_timings ||
> +        (addr >=3D s->r_timings &&
> +         addr < s->r_timings + s->ctrl->nregs_timings) ||
>          addr =3D=3D s->r_ce_ctrl ||
>          addr =3D=3D R_INTR_CTRL ||
>          addr =3D=3D R_DUMMY_DATA ||
> @@ -1216,7 +1226,8 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
>      addr >>=3D 2;
>
>      if (addr =3D=3D s->r_conf ||
> -        addr =3D=3D s->r_timings ||
> +        (addr >=3D s->r_timings &&
> +         addr < s->r_timings + s->ctrl->nregs_timings) ||
>          addr =3D=3D s->r_ce_ctrl) {
>          s->regs[addr] =3D value;
>      } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
> --
> 2.21.0
>
