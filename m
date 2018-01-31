Received: by 10.28.71.27 with SMTP id u27csp2879691wma;
        Wed, 31 Jan 2018 08:42:45 -0800 (PST)
X-Google-Smtp-Source: AH8x226jfxA22X4KpRyTMzsUycjOk67cGNl7H63xJWOdRFMav2FPBWy3VRmyECCqVRkWePsizjEv
X-Received: by 10.37.11.3 with SMTP id 3mr3690161ybl.222.1517416965136;
        Wed, 31 Jan 2018 08:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517416965; cv=none;
        d=google.com; s=arc-20160816;
        b=FarbSWFAFvrLos343URmzr0YzSfnuj1MW1mnUG6o0tk5ZUr1e5g2ypncuolzUuTVfZ
         rJYDXq8TXaFovK0YxUDd1PjCD4EBEA+/KJ1/uPYLBTT+1ZCp1yGzGQLgQABvyCFPZZBt
         ucfxuJikM12FelP24187Ny7KJKB/Ame4kNUsqRvbB8Jv5pFpxfUz6/pYPTNfdDOXXvo6
         9+Co8CFVNPU/2x0tgSb3Zuy/JBZpG3NwiCG0ZbNjc8Q442jAYh1od/LKi7aA0BzDgTjN
         kOORjuB0OoNWUosLXrGCLY9BVhxXRMQs8xfDhm2xQW7xbOACkpPhQf9gTbxRmTu3yogH
         RLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=768s6q6IHkI608Uh386cDeaJASSd7bV4b/c1ri3idDo=;
        b=rYu7KePGM8Wn7N3MtoFJo6mORkorlM8ErwODSIhYa+lRRzmVaWRc0pDISnGj48wW78
         wn7wy8JADG/k42LI2GMgDPJOjHWfj6vJb7MnZcj9T8dM7qHndawy8YYXtCTg/v2ewv/B
         kM+2WLZa7mwCutwuNXSWG85hC6o3gY/mHVKZ9QZVCPxauVfw9+SO1Qe30eVVz9whNbcU
         M8dtl2LOYkCy/a3KiRciBbK3xjtUASXDk4cZnbLigLpOIYwaDY3hQd5n27UCFlO5I71l
         yzp9cBlpEgb4cK28MT2oAOQODvBrisTiTF53FYMCg4pbjnErGlZGOYpGDBo2QKafkSDX
         hPAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PTwkVXQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p10si3822860ybe.610.2018.01.31.08.42.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Jan 2018 08:42:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PTwkVXQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egvTA-0007Mk-FU
	for alex.bennee@linaro.org; Wed, 31 Jan 2018 11:42:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1egvSw-0007KO-Lo
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 11:42:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1egvSs-0000Jb-KO
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 11:42:30 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:45457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1egvSp-0000Ha-3O; Wed, 31 Jan 2018 11:42:23 -0500
Received: by mail-lf0-x241.google.com with SMTP id x196so21678473lfd.12;
	Wed, 31 Jan 2018 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=768s6q6IHkI608Uh386cDeaJASSd7bV4b/c1ri3idDo=;
	b=PTwkVXQ+wB9A8Zev962Gw7SSYXvZ8CfaaNd9aQxBfYxEEhb98PnXeuBD6al+gPcuC9
	YTyD5HjeUuyZPiWd0XchePfQioqoPL4vOV4SgErmJiWoGpu7ET9jRZNAwTn8PtQB4zLs
	dDt3Bc0bOTbaDdItMfVDFhXrxFUuXBiA5x8AK2GRMcNcQTos/aMeipsssdkhvGaeKz0D
	7UGECX+Zp1EHBZJSCUHdLzJd9zD6U36n4J4ZRhlZ0TGZtHYgxdBQoc6Tc6H2lhPz4IaH
	MJ2EK79KYcvz6pCQrWzL39FZPQrsV99RonLmyeX/Y+9A30nd0dBj7wvBO6WcuH9gwfb6
	J5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=768s6q6IHkI608Uh386cDeaJASSd7bV4b/c1ri3idDo=;
	b=R7VTiZJrbB2m+eZ3R+l/724bSVrWimnMwzG4hXt5Pqv4OyKq/QhhlnbY4Z3E57MJH2
	s/ok0HtAP0uusWhhhan1YjksLlxcMQ8wWKEvn/X38pSqrIWOeRre4c/Vg7cZ+yQRRAAY
	nfnfkVU1J+TEFV9h1JbQ3Hjdy8/FmtR7NRkleom0seGyy3NGDbecIbTG1uDvhsVKLvtC
	bxaUZybeObkZXELr7ElDJOMsytPI22wqrtflcOw2vNFLkQhwZakrJAfZEuUUZGr55Xgm
	GmowUO30cf21BjIeo1W4Y/rvbcayQk5IX9EmeutyZXz7ICLimJOL+E5NNhs1CkDEPSqV
	J7YQ==
X-Gm-Message-State: AKwxytegOFVufGkecjAnk6Y77ZyRLaJ5FCbEn/ue59+dF+ToCKdLmmV7
	iYTrtTce+ESsJdkC2akjS3SPkjDGxIwO5zY9+os=
X-Received: by 10.25.149.143 with SMTP id x137mr20906452lfd.119.1517416941575; 
	Wed, 31 Jan 2018 08:42:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Wed, 31 Jan 2018 08:41:51 -0800 (PST)
In-Reply-To: <20180123035837.16578-5-f4bug@amsat.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
	<20180123035837.16578-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 31 Jan 2018 08:41:51 -0800
X-Google-Sender-Auth: mhXjO4X9MSMPWGb33WaC2b4XINU
Message-ID: <CAKmqyKMoUcPhkr8bM1DU1QeBaRbJ9kAfOp_j-vFxf1y8p=1AbA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] hw/sd/pl181: expose a
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
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QUpnFxwE5MyD

On Mon, Jan 22, 2018 at 7:58 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> using the sdbus_*() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/pl181.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index 3ba1f7dd23..ce696c5d7d 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -33,6 +33,7 @@ typedef struct PL181State {
>      SysBusDevice parent_obj;
>
>      MemoryRegion iomem;
> +    SDBus sdbus;
>      SDState *card;

Shouludn't card be removed?

Alistair

>      uint32_t clock;
>      uint32_t power;
> @@ -179,7 +180,7 @@ static void pl181_send_command(PL181State *s)
>      request.cmd =3D s->cmd & PL181_CMD_INDEX;
>      request.arg =3D s->cmdarg;
>      DPRINTF("Command %d %08x\n", request.cmd, request.arg);
> -    rlen =3D sd_do_command(s->card, &request, response);
> +    rlen =3D sdbus_do_command(&s->sdbus, &request, response);
>      if (rlen < 0)
>          goto error;
>      if (s->cmd & PL181_CMD_RESPONSE) {
> @@ -223,12 +224,12 @@ static void pl181_fifo_run(PL181State *s)
>      int is_read;
>
>      is_read =3D (s->datactrl & PL181_DATA_DIRECTION) !=3D 0;
> -    if (s->datacnt !=3D 0 && (!is_read || sd_data_ready(s->card))
> +    if (s->datacnt !=3D 0 && (!is_read || sdbus_data_ready(&s->sdbus))
>              && !s->linux_hack) {
>          if (is_read) {
>              n =3D 0;
>              while (s->datacnt && s->fifo_len < PL181_FIFO_LEN) {
> -                value |=3D (uint32_t)sd_read_data(s->card) << (n * 8);
> +                value |=3D (uint32_t)sdbus_read_data(&s->sdbus) << (n * =
8);
>                  s->datacnt--;
>                  n++;
>                  if (n =3D=3D 4) {
> @@ -249,7 +250,7 @@ static void pl181_fifo_run(PL181State *s)
>                  }
>                  n--;
>                  s->datacnt--;
> -                sd_write_data(s->card, value & 0xff);
> +                sdbus_write_data(&s->sdbus, value & 0xff);
>                  value >>=3D 8;
>              }
>          }
> @@ -480,10 +481,6 @@ static void pl181_reset(DeviceState *d)
>
>      /* We can assume our GPIO outputs have been wired up now */
>      sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
> -    /* Since we're still using the legacy SD API the card is not plugged
> -     * into any bus, and we must reset it manually.
> -     */
> -    device_reset(DEVICE(s->card));
>  }
>
>  static void pl181_init(Object *obj)
> @@ -502,14 +499,26 @@ static void pl181_init(Object *obj)
>  static void pl181_realize(DeviceState *dev, Error **errp)
>  {
>      PL181State *s =3D PL181(dev);
> +    DeviceState *carddev;
>      DriveInfo *dinfo;
> +    Error *err =3D NULL;
> +
> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
> +                        dev, "sd-bus");
>
> +    /* Create and plug in the sd card */
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo =3D drive_get_next(IF_SD);
> -    s->card =3D sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, false=
);
> -    if (s->card =3D=3D NULL) {
> -        error_setg(errp, "sd_init failed");
> +    carddev =3D qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
> +    if (dinfo) {
> +        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo)=
, &err);
> +    }
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
> +    if (err) {
> +        error_setg(errp, "failed to init SD card: %s", error_get_pretty(=
err));
> +        return;
>      }
> +    s->card =3D SD_CARD(carddev);
>  }
>
>  static void pl181_class_init(ObjectClass *klass, void *data)
> --
> 2.15.1
>
>
