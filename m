Received: by 10.223.159.74 with SMTP id f10csp6610850wrg;
        Thu, 14 Dec 2017 10:00:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBouzszhpeAZeCCV3HSSkDCN7QeZdnEEspOQTq2ofs3DjplNu3eTJfO136doIiDClNE4bDGcq
X-Received: by 10.129.90.194 with SMTP id o185mr4952363ywb.274.1513274453853;
        Thu, 14 Dec 2017 10:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513274453; cv=none;
        d=google.com; s=arc-20160816;
        b=iGHVVs2TcPpfS4IZ8FCgQbhwVgw7SbbjbxeGNf1vwdNk9aG9HJ0Uri5jt75FMB5Iti
         uJnqYwnejLuLGlnB/p6jc5tlPm79/0hJzucZnJk7fwUpkoQbSxTOl/qYX5qJWl3Bhd0h
         ZvAje8lgKoOOYZfEW3mYrKi17reszN3WwkPl2ZaZVFHY8I31k5el8KSdSuN5TrjmICSt
         BmWUZiKHKpgQMLr5s6bkrGphc3UWgyiY8VTNtSxpAwj9ZMg2ogGOlE21PcLtM0sz0JGi
         SIwhGazFXL2ELdwSYtSTtBm0GbbeD0PRBSOWKxw4ApN9rq826Ov5XTw5Bt2gJPEUPOpV
         Ps7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=LF0DMraeRaSPX9iSrbGoIhZqYp4iFBLhryCQGxAf/dk=;
        b=0jOu+j8RgDx/+vfeKOjcVg3RZN5VNiX5zlya0WGscHkJxtOkyN0lse9bq1h1ima1ne
         xUdYsKcBMNIKqcu1dTBGhLeeLR1QlqNduf3nrMV28ZEU4fHxZAMltALj4EqD33aMA++W
         +H6+mw2hNXlLQbLrRWDjeb6R1qsFe/av0/lNgUKWTG6DNUDmwf3bHFBHYQkgwhvIo6El
         LZpKyjEiVTEM4Kq5As5OikiVyNmzV/Bj2iILeG90Esy86W+jak/Y+Qo182iAnBgDEguY
         XatapHmBIeGoUb3nq0S/K88JeeTXEK75LdhKJWWVRT557qQCpl99NDk2iYSyXn+90WBJ
         dPEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DtWvg+zp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q6si923470ywi.152.2017.12.14.10.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 10:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DtWvg+zp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePXoT-0008Oz-4p
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 13:00:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePXfD-0000UT-HA
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 12:51:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePXfB-00029Z-Dy
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 12:51:19 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:40142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePXf6-0001w3-AL; Thu, 14 Dec 2017 12:51:12 -0500
Received: by mail-wm0-x242.google.com with SMTP id f206so12961973wmf.5;
	Thu, 14 Dec 2017 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=LF0DMraeRaSPX9iSrbGoIhZqYp4iFBLhryCQGxAf/dk=;
	b=DtWvg+zpct7gIgE55hUWTiNaN7fmAurZnowUbzuNIoBoF612So3SVQogJhTyuU5MuN
	Q9uoGgqBWjKRMdIaJ1zuktV2vuAKRIQSLrCmPzxl0yyfHe8fVQ6+XzO+p146jZc6qCep
	iIt7+2JoqixW+kTkYXDpzIZtP8OwusE47DQlb+hw82D0IDRce8Nagw6PvgW8Dhq+MQu1
	0JzwWuOJhG//0HBIXgSrF4LjaGT3GRUymY2iglfdTglharhlVPmSH/jhkfHkO9X4qK4X
	E678c6VQkFvYtpAvEiXwd9HhtctxAj0ZK0euUbxn0gOTQfNokYJAUdj5G/bFQUjCSlO9
	883Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=LF0DMraeRaSPX9iSrbGoIhZqYp4iFBLhryCQGxAf/dk=;
	b=AxjF5AGGAIsXBpXf74dSN18vAXtKeKJ83YzCft0j09Aaurx1hnxmjRknW67gLhh49u
	v9HZczBU3k58T3jeIgen113raZXVHzpNwOavb+1GWVTUZyOs9cHCwaG99se8OYbAkBVo
	rF1vNKHz9zCpQj+WH6L4l5v+scVMrmWLH03a/VgFHw/TZiNZIerJcZspiEyUy3GNJ+7d
	sZ31X02pjWBHhH9Efe9OPerkaewz9DIrTBXEW6uVIhiI/5JldekM2J3ueuv8vhPqL5aw
	oPgHbZJvm0BdGjZ04FILARRLujjedqllwVyEW/80H5nQxtH/xYCdY9La7kcYCoi6kwSM
	PGsA==
X-Gm-Message-State: AKGB3mKn6SLzl3l7D9Qn9qMpvvpamTkbjG5BnM+bu1eWFEpkLNuEi8+e
	72y3YOF+w0YKKrFEYrSpjpad9BwgswQ6bVeF1vg=
X-Received: by 10.28.136.66 with SMTP id k63mr3090938wmd.50.1513273871030;
	Thu, 14 Dec 2017 09:51:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Thu, 14 Dec 2017 09:50:40 -0800 (PST)
In-Reply-To: <20171213195852.30439-2-f4bug@amsat.org>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-2-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Dec 2017 09:50:40 -0800
X-Google-Sender-Auth: HR-nvDPA6DXjYp9Akm9n-AkL22o
Message-ID: <CAKmqyKNSGCndaHmpGPOYGX7jrVbse-ahT=dEdY9XQVm43=AYZg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [PATCH 01/14] sd: split "sd-internal.h" of
 "hw/sd/sd.h"
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
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i4ipJ79uXYTC

On Wed, Dec 13, 2017 at 11:58 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Now only SD 'producers' are able to use the "sd-internal.h" API,
> while SD 'consumers' are restricted to the "hw/sd/sd.h" 'public' API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I don't see what this gets us. Why bother moving this code into an
internal header?

Alistair

> ---
>  hw/sd/sd-internal.h       | 119 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/sd/sd.h        |  95 +++---------------------------------
>  hw/sd/core.c              |   3 +-
>  hw/sd/milkymist-memcard.c |   2 +-
>  hw/sd/omap_mmc.c          |   1 +
>  hw/sd/pl181.c             |   2 +-
>  hw/sd/pxa2xx_mmci.c       |   1 +
>  hw/sd/sd.c                |   6 +--
>  hw/sd/sdhci.c             |   2 +-
>  hw/sd/ssi-sd.c            |   2 +-
>  10 files changed, 135 insertions(+), 98 deletions(-)
>  create mode 100644 hw/sd/sd-internal.h
>
> diff --git a/hw/sd/sd-internal.h b/hw/sd/sd-internal.h
> new file mode 100644
> index 0000000000..afd5dbf194
> --- /dev/null
> +++ b/hw/sd/sd-internal.h
> @@ -0,0 +1,119 @@
> +/*
> + * SD Memory Card emulation.
> + *
> + * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in
> + *    the documentation and/or other materials provided with the
> + *    distribution.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> + * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> + * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
> + * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> + * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> + * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> + * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
> + * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> + * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +#ifndef SD_INTERNAL_H
> +#define SD_INTERNAL_H
> +
> +#include "hw/qdev.h"
> +#include "sysemu/block-backend.h"
> +
> +#define OUT_OF_RANGE        (1 << 31)
> +#define ADDRESS_ERROR       (1 << 30)
> +#define BLOCK_LEN_ERROR     (1 << 29)
> +#define ERASE_SEQ_ERROR     (1 << 28)
> +#define ERASE_PARAM         (1 << 27)
> +#define WP_VIOLATION        (1 << 26)
> +#define CARD_IS_LOCKED      (1 << 25)
> +#define LOCK_UNLOCK_FAILED  (1 << 24)
> +#define COM_CRC_ERROR       (1 << 23)
> +#define ILLEGAL_COMMAND     (1 << 22)
> +#define CARD_ECC_FAILED     (1 << 21)
> +#define CC_ERROR            (1 << 20)
> +#define SD_ERROR            (1 << 19)
> +#define CID_CSD_OVERWRITE   (1 << 16)
> +#define WP_ERASE_SKIP       (1 << 15)
> +#define CARD_ECC_DISABLED   (1 << 14)
> +#define ERASE_RESET         (1 << 13)
> +#define CURRENT_STATE       (7 << 9)
> +#define READY_FOR_DATA      (1 << 8)
> +#define APP_CMD             (1 << 5)
> +#define AKE_SEQ_ERROR       (1 << 3)
> +
> +#define OCR_CCS_BITN        30
> +
> +typedef enum {
> +    sd_none =3D -1,
> +    sd_bc =3D 0,      /* broadcast -- no response */
> +    sd_bcr,         /* broadcast with response */
> +    sd_ac,          /* addressed -- no data transfer */
> +    sd_adtc,        /* addressed with data transfer */
> +} sd_cmd_type_t;
> +
> +typedef struct SDState SDState;
> +
> +#define SD_CARD_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
> +#define SD_CARD_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
> +
> +typedef struct {
> +    /*< private >*/
> +    DeviceClass parent_class;
> +    /*< public >*/
> +
> +    int (*do_command)(SDState *sd, SDRequest *req, uint8_t *response);
> +    void (*write_data)(SDState *sd, uint8_t value);
> +    uint8_t (*read_data)(SDState *sd);
> +    bool (*data_ready)(SDState *sd);
> +    void (*enable)(SDState *sd, bool enable);
> +    bool (*get_inserted)(SDState *sd);
> +    bool (*get_readonly)(SDState *sd);
> +} SDCardClass;
> +
> +#define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE=
_SD_BUS)
> +#define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_S=
D_BUS)
> +
> +typedef struct {
> +    /*< private >*/
> +    BusClass parent_class;
> +    /*< public >*/
> +
> +    /* These methods are called by the SD device to notify the controlle=
r
> +     * when the card insertion or readonly status changes
> +     */
> +    void (*set_inserted)(DeviceState *dev, bool inserted);
> +    void (*set_readonly)(DeviceState *dev, bool readonly);
> +} SDBusClass;
> +
> +/* Legacy functions to be used only by non-qdevified callers */
> +SDState *sd_init(BlockBackend *bs, bool is_spi);
> +int sd_do_command(SDState *sd, SDRequest *req, uint8_t *response);
> +void sd_write_data(SDState *sd, uint8_t value);
> +uint8_t sd_read_data(SDState *sd);
> +void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
> +bool sd_data_ready(SDState *sd);
> +/* sd_enable should not be used -- it is only used on the nseries boards=
,
> + * where it is part of a broken implementation of the MMC card slot swit=
ch
> + * (there should be two card slots which are multiplexed to a single MMC
> + * controller, but instead we model it with one card and controller and
> + * disable the card when the second slot is selected, so it looks like t=
he
> + * second slot is always empty).
> + */
> +void sd_enable(SDState *sd, bool enable);
> +
> +#endif
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 96caefe373..f6994e61f2 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -32,108 +32,25 @@
>
>  #include "hw/qdev.h"
>
> -#define OUT_OF_RANGE           (1 << 31)
> -#define ADDRESS_ERROR          (1 << 30)
> -#define BLOCK_LEN_ERROR                (1 << 29)
> -#define ERASE_SEQ_ERROR                (1 << 28)
> -#define ERASE_PARAM            (1 << 27)
> -#define WP_VIOLATION           (1 << 26)
> -#define CARD_IS_LOCKED         (1 << 25)
> -#define LOCK_UNLOCK_FAILED     (1 << 24)
> -#define COM_CRC_ERROR          (1 << 23)
> -#define ILLEGAL_COMMAND                (1 << 22)
> -#define CARD_ECC_FAILED                (1 << 21)
> -#define CC_ERROR               (1 << 20)
> -#define SD_ERROR               (1 << 19)
> -#define CID_CSD_OVERWRITE      (1 << 16)
> -#define WP_ERASE_SKIP          (1 << 15)
> -#define CARD_ECC_DISABLED      (1 << 14)
> -#define ERASE_RESET            (1 << 13)
> -#define CURRENT_STATE          (7 << 9)
> -#define READY_FOR_DATA         (1 << 8)
> -#define APP_CMD                        (1 << 5)
> -#define AKE_SEQ_ERROR          (1 << 3)
> -#define OCR_CCS_BITN        30
> -
> -typedef enum {
> -    sd_none =3D -1,
> -    sd_bc =3D 0, /* broadcast -- no response */
> -    sd_bcr,    /* broadcast with response */
> -    sd_ac,     /* addressed -- no data transfer */
> -    sd_adtc,   /* addressed with data transfer */
> -} sd_cmd_type_t;
> -
>  typedef struct {
> -    uint8_t cmd;
> -    uint32_t arg;
> -    uint8_t crc;
> -} SDRequest;
> +    uint8_t cmd;        /*  6 bits */
> +    uint32_t arg;       /* 32 bits */
> +    uint8_t crc;        /*  7 bits */
> +} SDRequest;     /* total: 48 bits shifted */
>
> -typedef struct SDState SDState;
>  typedef struct SDBus SDBus;
>
>  #define TYPE_SD_CARD "sd-card"
>  #define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
> -#define SD_CARD_CLASS(klass) \
> -    OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
> -#define SD_CARD_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
> -
> -typedef struct {
> -    /*< private >*/
> -    DeviceClass parent_class;
> -    /*< public >*/
> -
> -    int (*do_command)(SDState *sd, SDRequest *req, uint8_t *response);
> -    void (*write_data)(SDState *sd, uint8_t value);
> -    uint8_t (*read_data)(SDState *sd);
> -    bool (*data_ready)(SDState *sd);
> -    void (*enable)(SDState *sd, bool enable);
> -    bool (*get_inserted)(SDState *sd);
> -    bool (*get_readonly)(SDState *sd);
> -} SDCardClass;
>
>  #define TYPE_SD_BUS "sd-bus"
>  #define SD_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SD_BUS)
> -#define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE=
_SD_BUS)
> -#define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_S=
D_BUS)
>
>  struct SDBus {
>      BusState qbus;
>  };
>
> -typedef struct {
> -    /*< private >*/
> -    BusClass parent_class;
> -    /*< public >*/
> -
> -    /* These methods are called by the SD device to notify the controlle=
r
> -     * when the card insertion or readonly status changes
> -     */
> -    void (*set_inserted)(DeviceState *dev, bool inserted);
> -    void (*set_readonly)(DeviceState *dev, bool readonly);
> -} SDBusClass;
> -
> -/* Legacy functions to be used only by non-qdevified callers */
> -SDState *sd_init(BlockBackend *bs, bool is_spi);
> -int sd_do_command(SDState *sd, SDRequest *req,
> -                  uint8_t *response);
> -void sd_write_data(SDState *sd, uint8_t value);
> -uint8_t sd_read_data(SDState *sd);
> -void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
> -bool sd_data_ready(SDState *sd);
> -/* sd_enable should not be used -- it is only used on the nseries boards=
,
> - * where it is part of a broken implementation of the MMC card slot swit=
ch
> - * (there should be two card slots which are multiplexed to a single MMC
> - * controller, but instead we model it with one card and controller and
> - * disable the card when the second slot is selected, so it looks like t=
he
> - * second slot is always empty).
> - */
> -void sd_enable(SDState *sd, bool enable);
> -
> -/* Functions to be used by qdevified callers (working via
> - * an SDBus rather than directly with SDState)
> - */
> +/* Functions to be used by qdevified callers */
>  int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
>  void sdbus_write_data(SDBus *sd, uint8_t value);
>  uint8_t sdbus_read_data(SDBus *sd);
> @@ -154,6 +71,6 @@ void sdbus_reparent_card(SDBus *from, SDBus *to);
>
>  /* Functions to be used by SD devices to report back to qdevified contro=
llers */
>  void sdbus_set_inserted(SDBus *sd, bool inserted);
> -void sdbus_set_readonly(SDBus *sd, bool inserted);
> +void sdbus_set_readonly(SDBus *sd, bool readonly);
>
>  #endif /* HW_SD_H */
> diff --git a/hw/sd/core.c b/hw/sd/core.c
> index 295dc44ab7..bd9350d21c 100644
> --- a/hw/sd/core.c
> +++ b/hw/sd/core.c
> @@ -20,9 +20,8 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "hw/qdev-core.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
> +#include "sd-internal.h"
>
>  static SDState *get_card(SDBus *sdbus)
>  {
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 4008c81002..8c9bb27229 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -27,9 +27,9 @@
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "hw/sd/sd.h"
> +#include "sd-internal.h"
>
>  enum {
>      ENABLE_CMD_TX   =3D (1<<0),
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index e934cd3656..f7e42b3525 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -20,6 +20,7 @@
>  #include "hw/hw.h"
>  #include "hw/arm/omap.h"
>  #include "hw/sd/sd.h"
> +#include "sd-internal.h"
>
>  struct omap_mmc_s {
>      qemu_irq irq;
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index 55c8098ecd..d568b12818 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -8,10 +8,10 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "hw/sysbus.h"
>  #include "hw/sd/sd.h"
> +#include "sd-internal.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 3deccf02c9..f34951e1d1 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -16,6 +16,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/pxa.h"
>  #include "hw/sd/sd.h"
> +#include "sd-internal.h"
>  #include "hw/qdev.h"
>  #include "hw/qdev-properties.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 35347a5bbc..9b7dee2ec4 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -32,7 +32,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/qdev.h"
>  #include "hw/hw.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
>  #include "qapi/error.h"
>  #include "qemu/bitmap.h"
> @@ -40,6 +39,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
> +#include "sd-internal.h"
>
>  //#define DEBUG_SD 1
>
> @@ -1466,8 +1466,8 @@ static int cmd_valid_while_locked(SDState *sd, SDRe=
quest *req)
>              || sd_cmd_class[req->cmd & 0x3F] =3D=3D 7;
>  }
>
> -int sd_do_command(SDState *sd, SDRequest *req,
> -                  uint8_t *response) {
> +int sd_do_command(SDState *sd, SDRequest *req, uint8_t *response)
> +{
>      int last_state;
>      sd_rsp_type_t rtype;
>      int rsplen;
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index b064a087c9..e7cd3258a3 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -24,12 +24,12 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "sysemu/dma.h"
>  #include "qemu/timer.h"
>  #include "qemu/bitops.h"
>  #include "sdhci-internal.h"
> +#include "sd-internal.h"
>  #include "qemu/log.h"
>
>  /* host controller debug messages */
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 24001dc3e6..bd0b593b6e 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -11,11 +11,11 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "hw/ssi/ssi.h"
>  #include "hw/sd/sd.h"
>  #include "qapi/error.h"
> +#include "sd-internal.h"
>
>  //#define DEBUG_SSI_SD 1
>
> --
> 2.15.1
>
>
