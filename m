Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0D5C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmsi-0005Rr-An; Thu, 09 Jul 2026 07:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmsg-0005QU-4p
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:25:26 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmse-0002Yq-B3
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:25:25 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6675db463b9so1485202d50.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783596322; cv=none;
 d=google.com; s=arc-20260327;
 b=TESiGrpYKPuZ0yTwf9vqOI7z/OFn6XKnowg+1QUeVP5AZRHl9BUDDV7RUFo/cRYRQ0
 UgoZC764k+X7jNrsa7NKDzSEH5SPAqyLgrC7jf1ZNk1+sRKZ8+3izFOxGgUEZ6MdOP81
 gmI+BzHlde8FX/l02yS52mzP7B7sBNc1WeLDpLoMGXVDeQwy2jmgy4T0QJyiVQdjTQ1l
 h/PC2ZWniNM5rz4T8glbnFlizoFRXhx0nJh8i+u9kVbEMVMu8JB1RVXN5bj+KYpTAUGr
 PlsNn41cNlN4Ixc5iPEb0/As/nKC8GONIkpMTXuNj5lv2t0v9vrBG+fIFpsLClp7kVz6
 xJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PUTt8gEXC3evuZEI4FrKnGNtcaVB1W0fSDTAWKQlAes=;
 fh=oR7TsPg3OTmNosGgopAXF0ZXV9nY+FQmXuneIKe+VyU=;
 b=h0GK+T2Ka7wDvsRaW6pmsWAY40jY0xffPfA3pWM4C1ONIwDF4mop05uWgfgx7KI7i6
 XiKNQcKwDJzUlwOQVFu7dl2btzFjiNiXubveUN0P6v9TjQqa+cB0YDi9eVDDbloVAeWu
 s0AMqOJGn9Gxo+Duio0fhxxC1KQDXjFkBREiuDuoOrDxyEjfDHi+MNHaniN2y0QFSUyl
 eLzUQSYXCuK4+BzKfsVjSalJrh1EB/6LLROd+0kP+P3G04aGw0Tz94UfpxphnQ6R3eMo
 /xIxVY6oVCtum3ohJqBn+RAnxJPTbcKU7kqJM5fqrHvbbBJ1M3kW+r3TcoD4pvQb0sLN
 CrXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783596322; x=1784201122; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PUTt8gEXC3evuZEI4FrKnGNtcaVB1W0fSDTAWKQlAes=;
 b=Bj81L+dInbXNf3tZOjlsiFAetK6uqe0sCRBO/tA7FCxcmIc7PhuS0LtYeu+s8l/QXW
 euHyEQoWgSsSwSsjm5uacCDXdup3c20WJB43/LaNfJQHl5u63iRB1lThRSD7GMQDgFtG
 G5UvlI0crNOz47nsyO2k6FfsSjBYpUkHz2Q9/d1P5fMrvMzA6YrixCYca11sg74J5DaD
 CBWk+YRvqLPynfovWWQyFojuqD/W1mnTvdR6Lr8tPtIrAPMhpHbd7dWVrmCGkDQ/LTx5
 KPJEsznKDSzWXEhGwLRPeqlgWwA9yzc30AgqobHGpuqYLD6RgdILkGvSQwLE3wrfm1sO
 NyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783596322; x=1784201122;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PUTt8gEXC3evuZEI4FrKnGNtcaVB1W0fSDTAWKQlAes=;
 b=EE5xESZFTeOrIZTXcgenxWFL9vtLXPgMlnfPpEVbYxk0OoV4nUogYHFG87NZabny7y
 rOYHG37v6bq70/mb7rp2X9AQltHDb+x5/zfqLN+t9lvnPfr68g6Ofy9iDVqutMBjpZr+
 6i/xlGxPrHEpU0TkxD3IztIKKqMAcDvql+Zbj6mgAAEPkvUzU9yuphupbElHd83Lwy9s
 1jHqJpOTVmdCQEX1XLeLTP4Pnffi/AgHjBfJG5R5BDdUK/hTuTjAgbCziWgrJf0bRQpD
 qkGFqLTxSA2UFTg4TPOTP6seizx1bkRSmAi/+H6+DLrKjbRWxGFwoeLqAQGZHFSHy2yP
 O5bw==
X-Gm-Message-State: AOJu0Yz19AJZJYLNoMEWuYAIH49CDNGGmPzi45CtoufzjmEISXIByX/Z
 QNNb4grlFRrTV3QYMzGyFMNMQy06vlTrahUsLAmI736C8oS6C9AtN0AXQ42p4RWx+VGI8xIfpK9
 Cwu7rZ4goJVrKZLFtWdETKUpH6Mcgb6+RCuq7lyruiA==
X-Gm-Gg: AfdE7cns1AkrgQ1k4mFBpLYpmQ7B8IKgrp13LUNfQphSsx0Adb/IQw+XX0ndwo558Cq
 jFzklnAqarXah5OX2ri881jm3VejdfHS6PnCqDzrG1YRHwC0JAKqxeARtVu9eTqUNIK84eXp332
 lCvMpQQIZ9u3dSN9EqgUaoYSlOaTNffB8yDoacKSPmYAnI77wKCIAl7NZaFv46bAzxGGdDHhcPj
 szq98zu9vuepyYPB9z7jHhhnTuUxp1zChI3I6LuuA7W3lo0Uz0rBfcaIJYDMc1N79KPsW3sgI1U
 0Qf7R2yGx1rBFFyDpcY6Lt2cxVOsIcL6KAHd5qYuUVWf8sZ9ExQ9uZxs
X-Received: by 2002:a05:690e:12c1:b0:667:a2e7:dd48 with SMTP id
 956f58d0204a3-667a2e7fb80mr3684954d50.32.1783596322185; Thu, 09 Jul 2026
 04:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260706230056.1888992-1-titusr@google.com>
 <20260706230056.1888992-5-titusr@google.com>
In-Reply-To: <20260706230056.1888992-5-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 12:25:10 +0100
X-Gm-Features: AVVi8Cf_Be_bnmnQbnlaVkotuW5EKAB1PTCmMyaCs_lGE0gdg-J6NeJ2ZHzZtGw
Message-ID: <CAFEAcA9vT6r_C9q9NKVTso1WCmHpozxa8thqC_v4R-Pj_hxU+A@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/i2c: smbus: increase MAX_DATA_LEN
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Tue, 7 Jul 2026 at 00:01, Titus Rwantare <titusr@google.com> wrote:
>
> From: titusr <titusr@google.com>
>
> The 32 byte payload was raised to 255 for block reads in the SMBus 3.0
> specification. SMBus does not provide a way for devices to declare which
> version of the spec they are designed to so we must allow newer devices
> to return as much data as they allow.
>
> Specification: https://smbus.org/specs/SMBus_3_3_20240512.pdf
>
> > 6.5.7 Block Write/Read
> The Block Write begins with a slave address and a write condition. After =
the command code the host issues a byte count which describes how many more=
 bytes will follow in the message. If a slave has 20 bytes to send, the byt=
e count field will have the value 20 (14h), followed by the 20 bytes of dat=
a. The byte count does not include the PEC byte. The byte count may be 0. A=
 Block Read or Block Write is allowed to transfer a maximum of 255 data byt=
es.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/i2c/smbus_slave.c         | 4 ++--
>  include/hw/i2c/smbus_slave.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
> index cfb61c879e..407a118d24 100644
> --- a/hw/i2c/smbus_slave.c
> +++ b/hw/i2c/smbus_slave.c
> @@ -217,8 +217,8 @@ bool smbus_vmstate_needed(SMBusDevice *dev)
>
>  const VMStateDescription vmstate_smbus_device =3D {
>      .name =3D TYPE_SMBUS_DEVICE,
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> +    .version_id =3D 2,
> +    .minimum_version_id =3D 2,
>      .fields =3D (const VMStateField[]) {
>          VMSTATE_I2C_SLAVE(i2c, SMBusDevice),
>          VMSTATE_INT32(mode, SMBusDevice),
> diff --git a/include/hw/i2c/smbus_slave.h b/include/hw/i2c/smbus_slave.h
> index 86bfe0a79e..59522ff1b1 100644
> --- a/include/hw/i2c/smbus_slave.h
> +++ b/include/hw/i2c/smbus_slave.h
> @@ -64,7 +64,7 @@ struct SMBusDeviceClass {
>      uint8_t (*receive_byte)(SMBusDevice *dev);
>  };
>
> -#define SMBUS_DATA_MAX_LEN 34  /* command + len + 32 bytes of data.  */
> +#define SMBUS_DATA_MAX_LEN 257  /* command + len + 255 bytes of data.  *=
/

This is a migration compatibility break, and you can use this with
machines like q35 where we care about migration compat (e.g. via
the smbus-impi device creatable on the command line), so we need
to do this in a way that maintains migration compat from older
versions of QEMU, I'm afraid.

thanks
-- PMM

