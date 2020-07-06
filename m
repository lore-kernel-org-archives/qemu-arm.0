Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp199959lfm;
        Mon, 6 Jul 2020 10:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrTuF9WV6o5dG4Pu5UIRFNbslNqXDtC8wrNNnCRAdPkY7uCiYlKNlJ6Hsqe2qknfJwcOVy
X-Received: by 2002:a25:a226:: with SMTP id b35mr79383693ybi.356.1594058277392;
        Mon, 06 Jul 2020 10:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594058277; cv=none;
        d=google.com; s=arc-20160816;
        b=qe4kXBn9u3Kyg4mwLTkrbtOCFXNGzm1I0Asi/kGdPEMcazD8RCmlmCr7V53PZiX3K6
         aXdp42tLDR5MR1CPUV3ss3fSwdzyN+1QYeg+p8Ibdjay4FBRU4/Ct5hJq5TgDW3mLDQA
         tb9gZyKRSTmhj6ZAHWCK7CoohvSM82x8gsHkqQ+3ohbPEnc1Wqi07lFdU5DrmbmDzidv
         Zbne8Tc6/MXKJc2b6qlIH5HodyXF7hg7LBTSlv187XUkSIfnlJVIa/mDEHhDVSNLDOKl
         VAZL2u5Cq6KnBtD39uRAyn7fxGa6KyvmbuQogDfQD7UC5P23jS4lbarB9ctd+rScYa80
         OFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/6i6SzUyP91tXZAmPR05xH5j33bfBUucUM0URzPP61A=;
        b=qWqakyogNfeS9ujUFyOPhkx7Ic3mELd/TGnuzoQknPXBCybjWYYYow+JgRDtlrDDNy
         WYL79X15elE/cn7OUe0dedvGkbetHy+gF/ql1HkhMUYAnbI27EYE7ZMGDAJSbtTMMg8f
         w0l8HIO5NmHY51Ym+ploWsxoouyTF+2qVx0WVRsdzTYL1w0fmlbuALbdlm296PhEwCjC
         hbMFGtwQigUmk9PSDkcOYcvEhkeQm4KYnnJEZ8l9lm0E5Q0Wzy+6Pkys+G+K0WNK9RGY
         bdRwFP8mQLghhtvEmtBpbTRGVycW+3o9FCXZzGOkanhE63lXOrHXHB8gtMkPBoEhOMxK
         EgPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=boamkXe9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si19008687ybf.10.2020.07.06.10.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=boamkXe9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsVNM-0002qe-Pp
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsVM8-0000lI-L8; Mon, 06 Jul 2020 13:56:40 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:37287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsVM6-0000ED-Rm; Mon, 06 Jul 2020 13:56:40 -0400
Received: by mail-io1-xd41.google.com with SMTP id v6so26634570iob.4;
 Mon, 06 Jul 2020 10:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/6i6SzUyP91tXZAmPR05xH5j33bfBUucUM0URzPP61A=;
 b=boamkXe9J4H35VxNzJVu2sKkuqZ5atZU6A1A5XhvxgFGrzuqn6g5Q7BEAyZTMpUh8n
 XRbR8Zv3k0pfntdT7a07EFE6ygQpqlJVA3b21L/ZK7KeNdytEnvSULDnEbDknQCWxcgX
 8bbfye39D1BUQ1BAcIRGiuZaAl7MvRJXkFgyzJlB0nYJGuCrTzE1/V8GyGEUUtzXB8lM
 +2k1yGzCz+XgJBwBT+e0m0Q+bF9LqSXCkqqxeQqvPuvyliNqKuOjs+oMEntue55kn1mj
 5tVcq8YkluSFwe7RLw7lEjbqMwpHKUCokr6yZ39bWVzbROv/rIppb5UyQ6xsvhdvU64B
 V1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/6i6SzUyP91tXZAmPR05xH5j33bfBUucUM0URzPP61A=;
 b=XOIVeHjXdE3T0VgRWeJSD/IrVP1qXiTFt+dsSjNzRTGt/6g9d314uhg3I8J3lYzCNA
 2rSjLByy8+GF7vSLkHnjOY1ByZWAnVTaMEqDrrVLnSpcW2hhJsN3TVYtZo5I/QqCMlCb
 9bhBnD7fllGxZf7nlBnOO8D57rudmpJF6LwQD/AHBy4qCYPyh4HVNPyG6NEhV4sR7PI3
 kHHGws3yo+c/vLlvTrN9eI9rNCqkKB5wxq6cC+tIaHUp9/2FSA8w0Gv+ULzNweep9Xk/
 oSkdXb7+J4Msnz+NnSt/OqvNh9B7x5g5TBC0dPO+xHIz48OeVXWi7DQ2cAEpD19UD936
 ySrA==
X-Gm-Message-State: AOAM5317OiZWPuIyvic05lheNbGb7ohTD0l114qAZRix4VdL3Qx0NZod
 5j72jsuh5Ajbl6TBQuZQDcfJaVKw7E6dEA90Ufo=
X-Received: by 2002:a5d:9306:: with SMTP id l6mr27140837ion.105.1594058197170; 
 Mon, 06 Jul 2020 10:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-18-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-18-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:46:50 -0700
Message-ID: <CAKmqyKMk==4rbi4iqEuH1aYcUNE+zTbBst5gKp8NkePz6OmDNg@mail.gmail.com>
Subject: Re: [PATCH 17/26] hw/usb/bus: Rename usb_get_dev_path() as
 usb_get_full_dev_path()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /rsPOvM1zl6/

On Sat, Jul 4, 2020 at 7:58 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> If the device has USB_DEV_FLAG_FULL_PATH set, usb_get_dev_path()
> returns the full port path. Rename the function accordingly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index f8901e822c..fad8194bf5 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -13,7 +13,7 @@
>
>  static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int inden=
t);
>
> -static char *usb_get_dev_path(DeviceState *dev);
> +static char *usb_get_full_dev_path(DeviceState *dev);
>  static char *usb_get_fw_dev_path(DeviceState *qdev);
>  static void usb_qdev_unrealize(DeviceState *qdev);
>
> @@ -33,7 +33,7 @@ static void usb_bus_class_init(ObjectClass *klass, void=
 *data)
>      HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(klass);
>
>      k->print_dev =3D usb_bus_dev_print;
> -    k->get_dev_path =3D usb_get_dev_path;
> +    k->get_dev_path =3D usb_get_full_dev_path;
>      k->get_fw_dev_path =3D usb_get_fw_dev_path;
>      hc->unplug =3D qdev_simple_device_unplug_cb;
>  }
> @@ -577,7 +577,7 @@ static void usb_bus_dev_print(Monitor *mon, DeviceSta=
te *qdev, int indent)
>                     dev->attached ? ", attached" : "");
>  }
>
> -static char *usb_get_dev_path(DeviceState *qdev)
> +static char *usb_get_full_dev_path(DeviceState *qdev)
>  {
>      USBDevice *dev =3D USB_DEVICE(qdev);
>
> --
> 2.21.3
>
>
