Received: by 10.28.173.206 with SMTP id w197csp2954738wme;
        Mon, 8 Jan 2018 13:41:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBotEEa2PLOVFq+CwlD1La/jt3x7+NIjus4HPuPcJxlxbdhNRi7k9Ok6d3cOQBtZwpysSDOuG
X-Received: by 10.37.130.142 with SMTP id r14mr12632815ybk.119.1515447696580;
        Mon, 08 Jan 2018 13:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515447696; cv=none;
        d=google.com; s=arc-20160816;
        b=hk/7tMwoj3K/4KdU5ejPsyAFtn69rxUusgXok1pvu+0NeM3Op7wm96AxT+OhuIdMeo
         8+0rSYDmGP6PxxWOdxNhEb/iTAfvsHMJTaYOBF4btokAzhgg4eL4Xx6/QBsH0SFPjbCv
         ATP3Zef6U4cB6nOSd5ezfftvMHK3B7jZn+ZZYW02eBAaFHD+vRY7Va36RkoaW9XHbQQ9
         s09LT1cw+AJvLqLxYySgU6nSsAo3MmvAKIQdAElGiR8w6xOIwtHvBtejmeLMSxaqsZvE
         cml4zJR4qr3pew0le4hy6WpXTt+enXtenZcYngZ/onXS22ZbCct2b91ifq0kILr42PHB
         GGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=MAFz8HG2d82dhbA+GKXVHzl1XJVX+fmfAwortvPbC78=;
        b=b9DJawW6N/BQfeKi/B7tqzIhLBZaQeqlAE7QNg9o+f6P920QYxutqGuppQz26/Ymuq
         Yit1FAqudfUUUXGtxrY3hVHyiIJu7Qg7g8dUkxkL/XCtaL3vFlOqDHCn5xImNjYeY1RN
         N6pEAaXJdPKfB6HwnZzRH6RlM6vzeTyA8qVRfHyZcLzsFrf5ikw3Hp7iPsQywVjoQUzw
         U5kcmrRZ/9QaNrPjWHuSBBDB5TUn9KI05t4+12ghG8SW/P5xYXRgPdybn9+JPfWHk1H/
         R//4tb4waQHD2TYakQBdEcVd3XvmtuIPbzUu94GH1BC5QrGlrjlLRdmRo212Hp1UWgZY
         OEug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UCOrxs5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d140si354518ybh.508.2018.01.08.13.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 13:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UCOrxs5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfAm-0006vb-0i
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 16:41:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYf96-0002Tg-7A
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 16:39:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYf95-0005Qc-7P
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 16:39:52 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:43011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYf95-0005Q3-09; Mon, 08 Jan 2018 16:39:51 -0500
Received: by mail-wr0-x242.google.com with SMTP id s13so9809024wra.10;
	Mon, 08 Jan 2018 13:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=MAFz8HG2d82dhbA+GKXVHzl1XJVX+fmfAwortvPbC78=;
	b=UCOrxs5hjemG6uF3iQZR3+F+FcyxsIpcrRRqegWmn6pmGZzU/39w/EFx82VBHdQlkW
	VdX3rNfbPaNQKGDGKwV1G1+iclEFxMxfEQKfCNJ89mIlZJaBLuhAltEzHH1cN3SQsc6o
	wUxxguDBBoD5V1gl6+1epbK0JI6HK6o+c8tcdT8Eli1Y3WQKXei6taLfBKeSRvCfYIWE
	a2oz4oNKzE6y2KWgt12zJwkQR8qlWFYbabr7YGfqGuHvky/Bf+F+PnWg0yrAgDPW9s+S
	XmDy0Riw+RRnJDRh4634zctv0gnA4PKNldn3jT3WuEhQiR35p7c0G8I1Qjh2+tJtxFbj
	yyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=MAFz8HG2d82dhbA+GKXVHzl1XJVX+fmfAwortvPbC78=;
	b=oGtz7mVbp8EBixm/jl0xFWojU9H/ziPxQyALaGOFCVaxH6ic+pdBhVLqx8bX0Es7Vt
	WgfqBaT7Xb1V3bhHQyeKSC2yK29rUIMcpzcDfHc6C1woQ9o9qnX3sf7L8dmRG/GZ8J8r
	Tl93IGLNMaIA4ohFPMukZ3fYOBB8KjjJ50XUawTKQWL/Pn/mSWCYLg1PdObV9WHlX5ry
	VJ6SM2jX2Sq0iHzImXMrQnmDsFCkBcW0zhRPUrHZJcWU7VIjT2Lswef0cY/vacmXETc4
	XODvlEuV1ZTm+GdSsK4QAx/ursFF4aoP0btnsZDD1az0ANHj26VdY0A3KcGztt/dsimc
	QBrg==
X-Gm-Message-State: AKGB3mJ1exRTmt80zF2waxLcYu3oSexHl6QDRatAyLHfEQ+UJFndmQmJ
	9KkwfUWhyrNYpOyl1FzNTqzWgYcy5h7cV5nVNrkI4A==
X-Received: by 10.223.132.165 with SMTP id 34mr6237753wrg.219.1515447589910;
	Mon, 08 Jan 2018 13:39:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 13:39:19 -0800 (PST)
In-Reply-To: <20180103162400.10396-6-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-6-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 13:39:19 -0800
X-Google-Sender-Auth: 6sOoimPSE20pHRAsNejT1fyFUb8
Message-ID: <CAKmqyKO9GmnFhqkj1N9zmz3tik45oebztW8VhECF-X+_imn4sg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] hw/sd/ssi-sd: expose a
 SDBus and connect the SDCard to it
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
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xEdr9FoUd4c+

On Wed, Jan 3, 2018 at 8:23 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> using the sdbus_*() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/ssi-sd.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 24001dc3e6..c8b27add84 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -47,7 +47,7 @@ typedef struct {
>      int32_t arglen;
>      int32_t response_pos;
>      int32_t stopping;
> -    SDState *sd;
> +    SDBus sdbus;
>  } ssi_sd_state;
>
>  /* State word bits.  */
> @@ -97,7 +97,7 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t=
 val)
>              request.arg =3D (s->cmdarg[0] << 24) | (s->cmdarg[1] << 16)
>                             | (s->cmdarg[2] << 8) | s->cmdarg[3];
>              DPRINTF("CMD%d arg 0x%08x\n", s->cmd, request.arg);
> -            s->arglen =3D sd_do_command(s->sd, &request, longresp);
> +            s->arglen =3D sdbus_do_command(&s->sdbus, &request, longresp=
);
>              if (s->arglen <=3D 0) {
>                  s->arglen =3D 1;
>                  s->response[0] =3D 4;
> @@ -174,7 +174,7 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32=
_t val)
>              DPRINTF("Response 0x%02x\n", s->response[s->response_pos]);
>              return s->response[s->response_pos++];
>          }
> -        if (sd_data_ready(s->sd)) {
> +        if (sdbus_data_ready(&s->sdbus)) {
>              DPRINTF("Data read\n");
>              s->mode =3D SSI_SD_DATA_START;
>          } else {
> @@ -187,8 +187,8 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32=
_t val)
>          s->mode =3D SSI_SD_DATA_READ;
>          return 0xfe;
>      case SSI_SD_DATA_READ:
> -        val =3D sd_read_data(s->sd);
> -        if (!sd_data_ready(s->sd)) {
> +        val =3D sdbus_read_data(&s->sdbus);
> +        if (!sdbus_data_ready(&s->sdbus)) {
>              DPRINTF("Data read end\n");
>              s->mode =3D SSI_SD_CMD;
>          }
> @@ -239,14 +239,25 @@ static const VMStateDescription vmstate_ssi_sd =3D =
{
>  static void ssi_sd_realize(SSISlave *d, Error **errp)
>  {
>      ssi_sd_state *s =3D FROM_SSI_SLAVE(ssi_sd_state, d);
> +    DeviceState *carddev;
>      DriveInfo *dinfo;
> +    Error *err =3D NULL;
>
>      s->mode =3D SSI_SD_CMD;
> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
> +                        DEVICE(d), "sd-bus");
> +
> +    /* Create and plug in the sd card */
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo =3D drive_get_next(IF_SD);
> -    s->sd =3D sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, true);
> -    if (s->sd =3D=3D NULL) {
> -        error_setg(errp, "Device initialization failed.");
> +    carddev =3D qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
> +    if (dinfo) {
> +        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo)=
, &err);
> +    }
> +    object_property_set_bool(OBJECT(carddev), true, "spi", &err);
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
> +    if (err) {
> +        error_setg(errp, "failed to init SD card: %s", error_get_pretty(=
err));
>          return;
>      }
>  }
> --
> 2.15.1
>
>
