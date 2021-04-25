Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp3171361lfb;
        Sun, 25 Apr 2021 11:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWqt+v0U+SyZ9ormgY10LHAj9V+hRJBF+9GEOW27icEibMkYqlkpfiq+oAtHkM3Oh94LrZ
X-Received: by 2002:a05:6e02:1a4b:: with SMTP id u11mr10801390ilv.258.1619375935223;
        Sun, 25 Apr 2021 11:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619375935; cv=none;
        d=google.com; s=arc-20160816;
        b=mpiAgG7gxep+1ix8WR1PeuAWjfoiAvtIdo8bNrppdM7TfPtLR7oqpwhiW7/nNaTmu3
         ZqiZ99iu6WCB83HiUe2ZWGC+S8Sanodkzz9kmPGjJ+g3WwAjlFySOT1Iz6VWZ3ubv3fY
         +WZWx6h2hKbsjNqH7drGIlQU8zl89JDHWypE2ED/GpPTWMR9LM0jozCX0EAA4DgXiVkx
         QyvPXg9JnHkegkt4TSZhy6GFq/QOJUdiMNDYSXt2blfJRmjfwHwFMyJ+c2nN/63/2XSH
         wcKKQQ4v0MbQhy2zAKM61JR40YNcVTF5/D+/T3w7DfbvEFNr4ndWamNlISuNOSjqXqr0
         OfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=a10iXpHggY1pPFPu4cpj6hoidaqPYdTsUtgMEkNcZZg=;
        b=oRyLlH+0S7H5PwovZUD4dzunXL+gvpqHC2RrDcl3D4r8eFheFe9/CI7eTOpLsr3iNx
         JRDT34yAxg9KhCsid3DO0NRdgghYbqhQ6mTyvyFtLYXKGfMsO47qq+53FV0nYlVuT1T/
         AQFkbIXksNB+twxGwuJfDVwUueGXrdyvmXzDtV32JwD2bxybe9qqIbhHJql448ibUslV
         nPbWKoQ+2uCkBxjNVRbOg+e0q0MLT+urCusidCVFLGRVcHBwJxSNS73t1K0o7FXrBhh7
         okxr07OVjiLsjzKOEi0m6N7uF0LIAg1mWQb95VjTArCkJb/WhiXwftvHzuV8tQxxbyYs
         wx6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YHMql7ai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si16218158ilk.9.2021.04.25.11.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Apr 2021 11:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YHMql7ai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lajeg-0006La-JT
	for alex.bennee@linaro.org; Sun, 25 Apr 2021 14:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lajd5-0005BQ-Ae
 for qemu-arm@nongnu.org; Sun, 25 Apr 2021 14:37:16 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lajd2-0001tF-9I
 for qemu-arm@nongnu.org; Sun, 25 Apr 2021 14:37:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id n21so4885538eji.1
 for <qemu-arm@nongnu.org>; Sun, 25 Apr 2021 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a10iXpHggY1pPFPu4cpj6hoidaqPYdTsUtgMEkNcZZg=;
 b=YHMql7aiYthLz3cXHenjBtJLYsUX71VLKWi9X2/EPYWSE9L9Y7x6sPJlZeHkOFMN+Y
 epAqzvoTKIp+kektTW6oY0/a1tS9D3PiRYgEB5+2cckv+mOtNH1IBfTn5+UkZ1tf3+Ag
 KfTt3YiGPuUoI7t+/g565y0mc3ExFgQ/2WjReTMabbZnfoHB3l+94ZT/L1QVNsEPfl1u
 nDxd+3mtQaI14PLUuiE+ACM1+6E1S/yfDaEq24KqM0kykrWg20t9EYWwI3uJaNUdgCTF
 VsCk3DASV3CLgpZgRxupSErXCczudI7Qveq/EhFyDlBkPoCqWb+xXeDEDgSEppdSSPa7
 n3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a10iXpHggY1pPFPu4cpj6hoidaqPYdTsUtgMEkNcZZg=;
 b=SDM4YuqrjBKAT83PGyCCOP9V+T3qSamPKPQnjvLjQvtRUf15udL5LVg2/DUak4WUeb
 w6MxT67GdPSzMJjR9xY+hPb5ZMAViiguhTtSTdGOZyqAUY6Z5gPqU8O0a89H/hl+AbKI
 Bh2n2sQh+kv13XMdyLAUFo9MUjet8ZPdpFloF27UfytudncYb9pRUTpP/nblymokdaWY
 SVXSt93x8+HVseNg3wg/66hScCMZo9XqEBQMR5w9CnqBlGJPR5mZmtBIIoBEP7w2lmXZ
 WbfcevZR2UU6U+8BtBrcxauXtVeARFo4V83q2dsCHvbtd/z4YbAnBT3GlO4UbcyKsnPS
 QpwA==
X-Gm-Message-State: AOAM5326zZS0nkBkzhAW5VvnjUk39WfiAUu3HJG2vnHDKR030HucJ2BP
 tJVJytUsSlFsQQ2PjaRCcU7wtOW6kgTPxEnX82z40Q==
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr15133614eje.250.1619375830691; 
 Sun, 25 Apr 2021 11:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-3-f4bug@amsat.org>
In-Reply-To: <20210424162229.3312116-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Apr 2021 19:36:13 +0100
Message-ID: <CAFEAcA8=YAABLQL+n1gDXafhoZeUo9emmjCmi_BTqvH=3NS6GA@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/pcmcia/microdrive: Register machine reset handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tvn92FsQJGuN

On Sat, 24 Apr 2021 at 17:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The abstract PCMCIA_CARD is a bus-less TYPE_DEVICE, so devices
> implementing it are not reset automatically.
> Register a reset handler so children get reset on machine reset.
>
> Note, the DSCM-1XXXX device (TYPE_DSCM1XXXX) which inherits
> TYPE_MICRODRIVE and PCMCIA_CARD reset itself when a disk is
> attached or detached, but was not resetting itself on machine
> reset.
>
> It doesn't seem to be an issue because it is that way since the
> device QDev'ifycation 8 years ago, in commit d1f2c96a81a
> ("pcmcia: QOM'ify PCMCIACardState and MicroDriveState").
> Still, correct to have a proper API usage.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pcmcia/pcmcia.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/hw/pcmcia/pcmcia.c b/hw/pcmcia/pcmcia.c
> index 03d13e7d670..73656257227 100644
> --- a/hw/pcmcia/pcmcia.c
> +++ b/hw/pcmcia/pcmcia.c
> @@ -6,14 +6,39 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
> +#include "sysemu/reset.h"
>  #include "hw/pcmcia.h"
>
> +static void pcmcia_card_reset_handler(void *dev)
> +{
> +    device_legacy_reset(DEVICE(dev));
> +}
> +
> +static void pcmcia_card_realize(DeviceState *dev, Error **errp)
> +{
> +    qemu_register_reset(pcmcia_card_reset_handler, dev);
> +}
> +
> +static void pcmcia_card_unrealize(DeviceState *dev)
> +{
> +    qemu_unregister_reset(pcmcia_card_reset_handler, dev);
> +}

Why isn't a pcmcia card something that plugs into a bus ?

-- PMM
