Received: by 10.28.173.206 with SMTP id w197csp2951394wme;
        Mon, 8 Jan 2018 13:37:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBotL+6H2M7nAuxcmqEpYh3qcDzz6jsYnleZ7P7DylTLYYdP2Z2xkV3JdCPbJRl+Iaf4ZqzyF
X-Received: by 10.37.230.141 with SMTP id d135mr8323804ybh.326.1515447446165;
        Mon, 08 Jan 2018 13:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515447446; cv=none;
        d=google.com; s=arc-20160816;
        b=LlMCZiOqRBZUYLpCEsV8txzJyjL6syzjVP7jl+UmcjqIpRCBB306vvB1d4KK3S7sxX
         uMpb8cXh1WCf30gCYCWYm81LQM4LnqsBDG/PAfHEQjvCkRebQiZ+Jr9+iV+RWegTolie
         wk78uqOT2EUBfzfe9nNvmCdIXB9CZFeywgUXhNP84QqVZQxec+XTvsr2CbSrdjDULZh8
         eQViOsirA8oVgNjESumJLwb/gT/NvAihEA4clochZVakLTTghq1gKOarjafAXGD1qCJP
         3TjVKQA5dEXWmw1SpG/6HEqAVLgGHK9PukNRvCZwgkEaKwYGwGPT8GRkGyMwj9T130B/
         p2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=O1oWIIOFpW0Y2kR/XQqjNdnApCdM9FcvxCaFTFPvh8A=;
        b=RcieLtsTfee7e/mKNsKyxfpHytRVIWc/L6nZWv1mrHfMi7/Ro95urZOBAfB3Smupo6
         YtLmn0G1IGLI2VmKAsRxsYWW2lvXGHjlfuKFO3PBNIyO77n16lTdXLH7xO3G7MsLrLjB
         V8SSrQq1zoBwObnjhvpXVPeFMUGw+bbRaq7GAajr2K1eB94KOdefQyU0WnJkpHpzOpYF
         HTqc+vRGf4cWelEPZBzfe8YjOv9Qa6bIREgUsSXI9YzCe+kQCS1sG7KgQJCmHJcZWQw2
         /kOaOvZ+bhPA2c8VqvtqkXPyoHn3Xb6sZwZYfh7bQGRrLE48yT8cXu8qP1dAu6ekQyHv
         EprQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OqksCn/4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w128si440500ywa.97.2018.01.08.13.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 13:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OqksCn/4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYf6j-0004NK-Cq
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 16:37:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYf6I-0003as-GK
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 16:36:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYf6G-0003Qw-1A
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 16:36:57 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:44159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYf6F-0003OZ-PW; Mon, 08 Jan 2018 16:36:55 -0500
Received: by mail-wr0-x241.google.com with SMTP id w50so2990955wrc.11;
	Mon, 08 Jan 2018 13:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=O1oWIIOFpW0Y2kR/XQqjNdnApCdM9FcvxCaFTFPvh8A=;
	b=OqksCn/4/++PR3iSeVzqm4y29T4ym6pSmGs2vfWbLw43JLULoZZtTVM6XMEgs47AVu
	mrXiGwPD33vkWY5Om9XivrSgJn0paSSyX86VCbP5AFEOaBON7iHJFc+BG1OTId6OEvVi
	1jiNfTIU+thXgeNLCPGuSt3sDzWXZ98q6SrfFhuG5CMo0QtTa1DnCaFMhCdNAD96Niuq
	wXKB+lzV6Q8id4kzfpufTrKegaqwfUP83wsmL9kdZbsU+SOWKlBf9Ar/SuZH6yeRadV1
	v4l3CB9MRPHbhuIop6OR8ypJBloW54cv5iV6PxX3M1mCAOszHuNO4uLm64Usj6xyj7et
	oseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=O1oWIIOFpW0Y2kR/XQqjNdnApCdM9FcvxCaFTFPvh8A=;
	b=Mpk2xB1bkroZcw0In1wMA55Rl91iekhiJRoGNnaIR7ozmVmxQtEQvZLQPcvT2dgg7w
	1d9O3W1LJGLVdFwl0/B6bvWu7BMwbKkQxmGbyioWoM/OHWSKHz/+gAhPKs1E9WDjB/Y7
	VFDV0LRrmihPaUNCa9Sxr2+uZYW6P4uSeYN6/099I1DpqpxRA97fkketnQBYpKkYzGAY
	gELchQKmFtWdfTjv3m3WGbtwwZRyVKjpYjBlrd0Fy7mbpgthll5E8VYYJ79A3c7sXXmM
	yJOegWteR+LeAsYA9r6OJcNhQ07K4zAw7/SjVxijHh6gxTtim6qcxKmM7BHxC6cAICRn
	DJFA==
X-Gm-Message-State: AKGB3mLdqWaAArLhTuVvb6NR43eKnXp/2vpDfjXDk7BgGFoKbOXZMYR6
	/Upl6u32w9SsV/Dzqkyr4JtzSIlENuxq+Od9+GU=
X-Received: by 10.223.132.165 with SMTP id 34mr6233732wrg.219.1515447414341;
	Mon, 08 Jan 2018 13:36:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 13:36:23 -0800 (PST)
In-Reply-To: <20180103162400.10396-4-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-4-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 13:36:23 -0800
X-Google-Sender-Auth: mbkgKrEYc8Tb8ZmYMNAwippNRvI
Message-ID: <CAKmqyKOBG7dKx+kDd9fSR6W5st7S1JPV=u66ZkigUjw3dyoCpg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/6] hw/sd/milkymist-memcard:
 expose a SDBus and connect the SDCard to it
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bg1YeCEERlS8

On Wed, Jan 3, 2018 at 8:23 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> using the sdbus_*() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/milkymist-memcard.c | 34 +++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 5df3a0f815..9f4c7dad63 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -68,7 +68,7 @@ struct MilkymistMemcardState {
>      SysBusDevice parent_obj;
>
>      MemoryRegion regs_region;
> -    SDState *card;
> +    SDBus sdbus;
>
>      int command_write_ptr;
>      int response_read_ptr;
> @@ -104,7 +104,7 @@ static void memcard_sd_command(MilkymistMemcardState =
*s)
>      req.crc =3D s->command[5];
>
>      s->response[0] =3D req.cmd;
> -    s->response_len =3D sd_do_command(s->card, &req, s->response+1);
> +    s->response_len =3D sdbus_do_command(&s->sdbus, &req, s->response + =
1);
>      s->response_read_ptr =3D 0;
>
>      if (s->response_len =3D=3D 16) {
> @@ -149,10 +149,10 @@ static uint64_t memcard_read(void *opaque, hwaddr a=
ddr,
>              r =3D 0xffffffff;
>          } else {
>              r =3D 0;
> -            r |=3D sd_read_data(s->card) << 24;
> -            r |=3D sd_read_data(s->card) << 16;
> -            r |=3D sd_read_data(s->card) << 8;
> -            r |=3D sd_read_data(s->card);
> +            r |=3D sdbus_read_data(&s->sdbus) << 24;
> +            r |=3D sdbus_read_data(&s->sdbus) << 16;
> +            r |=3D sdbus_read_data(&s->sdbus) << 8;
> +            r |=3D sdbus_read_data(&s->sdbus);
>          }
>          break;
>      case R_CLK2XDIV:
> @@ -206,10 +206,10 @@ static void memcard_write(void *opaque, hwaddr addr=
, uint64_t value,
>          if (!s->enabled) {
>              break;
>          }
> -        sd_write_data(s->card, (value >> 24) & 0xff);
> -        sd_write_data(s->card, (value >> 16) & 0xff);
> -        sd_write_data(s->card, (value >> 8) & 0xff);
> -        sd_write_data(s->card, value & 0xff);
> +        sdbus_write_data(&s->sdbus, (value >> 24) & 0xff);
> +        sdbus_write_data(&s->sdbus, (value >> 16) & 0xff);
> +        sdbus_write_data(&s->sdbus, (value >> 8) & 0xff);
> +        sdbus_write_data(&s->sdbus, value & 0xff);
>          break;
>      case R_ENABLE:
>          s->regs[addr] =3D value;
> @@ -266,15 +266,23 @@ static int milkymist_memcard_init(SysBusDevice *dev=
)
>  static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
>  {
>      MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
> +    DeviceState *carddev;
>      BlockBackend *blk;
>      DriveInfo *dinfo;
> +    Error *err =3D NULL;
>
> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
> +                        dev, "sd-bus");
> +
> +    /* Create and plug in the sd card */
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo =3D drive_get_next(IF_SD);
>      blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> -    s->card =3D sd_init(blk, false);
> -    if (s->card =3D=3D NULL) {
> -        error_setg(errp, "failed to init SD card");
> +    carddev =3D qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
> +    qdev_prop_set_drive(carddev, "drive", blk, &err);
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
> +    if (err) {
> +        error_setg(errp, "failed to init SD card: %s", error_get_pretty(=
err));
>          return;
>      }
>      s->enabled =3D blk && blk_is_inserted(blk);
> --
> 2.15.1
>
>
