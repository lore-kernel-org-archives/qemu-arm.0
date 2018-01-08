Received: by 10.28.173.206 with SMTP id w197csp2952730wme;
        Mon, 8 Jan 2018 13:39:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBou0++fZis0M/QmqaJvWN9cAgKH9upPSE1NQAhJNqN2N3a6iQ1wU0pfF/0dA3F+0TEumqsZr
X-Received: by 10.37.35.141 with SMTP id j135mr2810313ybj.489.1515447552593;
        Mon, 08 Jan 2018 13:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515447552; cv=none;
        d=google.com; s=arc-20160816;
        b=ytcawMmmswE22Z2j1SugENliA9/Pueuyo+GngQqcpKe5j0obMcx7LvJ3/6tOyQDiTF
         8lfcLXSkmloc6HtnACtUnrihO/K92Li+LCp/OSdkR1a3tyy8KZzrvkATTL9sJaB5tGJM
         V5+yKJsRdaFrj5WyusqDDYSJWy/j3fZOMQ2UYDjkgKOm5fZ1Z4oxIPpvIHabVPLhOPw6
         ZRFd3XoAWgew27sWTEji5GHifh2x7z5vtxMYKYJH5GNCB4/2SDHD/e5juRyt/2zwdAX1
         ox9aikw4frhCBOaV7NEChTFm2JqnIiwbWljKQMVdyiDLh1pTCyxId+0oKfu5SpcRgywp
         JG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=IfWuSAvH/KICeM3hx6oxdfB07aUpwe6iP+GTaqzrJM4=;
        b=r3FC2G8y3KGLhNuYGVKvG8tqPNST1fpRobAwP/sLPhXSf9OhR1wJTKMw3FATYj4FGc
         vmxh9ow8VjeYT/YLa288MeXRchgPe1DgOqxOiytS2C+lPzc64+XkUkIs1FF6dt2HZ8OD
         kS+CS/eGw8iMkDnX39vga6BVH0md2Pl+XS9xV+2Wyta8lfkSvDl3MhncJS+50kOCwFRH
         Zn56ze9BtbaxIji2myzYUXXJPM/v5EtRYGwaCwGIz+iVZ5YdcabnMBwT0v62rirU1EgH
         1TkC9kae4fD3rsbUyKa7HSnW6vLIAbz7oTInn+XV7z87MAXERcE9CgTbdur9Z/IgjUhe
         TCzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dPYJQeeG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si2621806ybj.823.2018.01.08.13.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 13:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dPYJQeeG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYf8S-00087i-08
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 16:39:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYf81-0007zo-N9
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 16:38:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYf7z-0004nM-Fh
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 16:38:45 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:43413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYf7v-0004kG-Nu; Mon, 08 Jan 2018 16:38:39 -0500
Received: by mail-wm0-x242.google.com with SMTP id n138so16746811wmg.2;
	Mon, 08 Jan 2018 13:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=IfWuSAvH/KICeM3hx6oxdfB07aUpwe6iP+GTaqzrJM4=;
	b=dPYJQeeGRsyQ9TWtjY6ypgt1RIC+fi1YOYAOy4PS6WgYCNJS6+7HKCymaoqXhZZhtc
	35HTY5TkauGZTUbL3Rwr72YfoqtlSnW9b40K5/fyy8b6Pk7UKOj7BXOLHqfbu3MTqVuk
	Mk08Y6px08dYY8uoUEyAoKGl3O1AIvYYEksim8waRrF8JKbjhP+f4mualyCH4uK56+Ky
	Zd62kObnfsXcAomo+fdvXgoWbA/KRx47IBoIjBTqsJlMzIFnB5K2PHopDt9BbG+6PzgE
	VpJhY6eNns37vw8NxUDnCJ1nbvRZ7E3BTJY0eYkkTkQvq2Sy8jHBcj0wMCpqPNAM28Rg
	nisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=IfWuSAvH/KICeM3hx6oxdfB07aUpwe6iP+GTaqzrJM4=;
	b=UkJrsfcP8An+lUOkVKsK1m4hX5dwgEAfm+22HPf3l7R0XZfuxqk7N/UOR+Qj8Lu/b+
	cevmRjRR9SS6esjGkzsQ6DqCvmU1cqBHQMtXmBQJDFGHqXZS8bWKz/33wIb8z3ubZGCe
	ABUNSUcRCQeA85OgRzDX9ReYImVPxTLq8P6xBEFcpec0pNvYDT2bJN9+LgNlHiZ4S7uM
	37+NvRcPsFPQslXQYLPpaO+LwX0mEwOR/q360n+OQeh6TtfcZHH42JHFF+ngyHfwdBX7
	6RXVo4CKs01NdgN0yxc0Qm3yay+SOsoqUrBrIg1x2kEl73Q8uyzgwO51y7UrU89d6tab
	NzJA==
X-Gm-Message-State: AKGB3mLlk0uUJlQR9K3rWCkFhqarYRmO9y6iVDBEcZ1uSrJ8BBUAInEI
	ehKuOwUb9XahhAP44P4O7wvd5ov37OafweG5AjM=
X-Received: by 10.28.208.79 with SMTP id h76mr9247083wmg.77.1515447518635;
	Mon, 08 Jan 2018 13:38:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 13:38:08 -0800 (PST)
In-Reply-To: <20180103162400.10396-5-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 13:38:08 -0800
X-Google-Sender-Auth: OMoxDeZe9-CZ1ysuskqviPl7GHE
Message-ID: <CAKmqyKMUhOtyRtPwE0EJgbPG-X3_f_7xeXZWa6fV4B8Gxqx2qA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [PATCH 4/6] hw/sd/pl181: expose a SDBus and
 connect the SDCard to it
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3qSTxMW8SkI

On Wed, Jan 3, 2018 at 8:23 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> using the sdbus_*() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/pl181.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index 55c8098ecd..ce696c5d7d 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -33,6 +33,7 @@ typedef struct PL181State {
>      SysBusDevice parent_obj;
>
>      MemoryRegion iomem;
> +    SDBus sdbus;
>      SDState *card;
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
> @@ -498,14 +499,26 @@ static void pl181_init(Object *obj)
>  static void pl181_realize(DeviceState *dev, Error **errp)
>  {
>      PL181State *s =3D PL181(dev);
> +    DeviceState *carddev;
>      DriveInfo *dinfo;
> +    Error *err =3D NULL;
>
> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
> +                        dev, "sd-bus");
> +
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
