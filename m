Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2092190lfg;
        Sun, 2 May 2021 13:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpYhuS1jhEMd0b0Z+fXYVjYX5B4E3a+18w7T+0lTXBgVX7i/Vd/+MH8C4/c99tp8Evu8Yd
X-Received: by 2002:a05:6638:2505:: with SMTP id v5mr15636448jat.120.1619988457552;
        Sun, 02 May 2021 13:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619988457; cv=none;
        d=google.com; s=arc-20160816;
        b=i3SqYL26J/IKOGuOZxvlwAvUVfu/IrT15m0Y9vFXDvsTxXqZqKA+JlSsqDyNubfi3Z
         34TwjQKWURYAc+uVlmwHx6IXTw9YT+q9UGo23y6e4X9w563FiKTf0dfJZwCQk+4PTGgJ
         ycuKGdlKb6Ju2e3EUzcptJxbajCrBjT55htDlaS4RkfQ5nhVW6do00Yi7i6qzi1pT5Aw
         GwTcdUxeAsRiClN8fOJPHJieuTJW1PdmlobeWIDAcXqSZZOr5UbQYhYmvT/U/jr4mnfp
         0SaG3MQSon2716HrrxU1YWwgJxVShL/8tjktk41QDopekAhCNSpS6mz2eDOAnkLZjwlW
         ONQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IZpRMhYriCArTic1oG4iRqGc+5388FGmmHJoIBEzmMA=;
        b=NOqAx6kcRKuQbW1EH7Mukr3JHzsOCFdvap/HeHyLbjWsfxdGoEqaIWoy6TJOgJNeQa
         kRzOjAVAOBWFoOaH0/CS8YkcRWb3qwMjpEawqNcjMeD8hrin21Nyq+EWK/uE9fWiNe8e
         5r1Ihkv9HhkUxfL/KpY1ESGBjUOGkRmDItBGepqXehRAbkwCPcNI9g79l6W7fC804YRd
         2S5aeQYMUQPnuwCCsGVmFt7/PwXFfetTG01ceR7L0vM2Vk9788d7fPCFxLmAwWDFtk6W
         fWN8L7JEto7XtYcVQnd8WDJAeVwo2YZATsMuvSYRAScalYE1oahy5UXlpEu+ipgV3nBJ
         h9LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BEFfzu9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23si1926576ioo.31.2021.05.02.13.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 13:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BEFfzu9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldJ04-0001xF-Tj
	for alex.bennee@linaro.org; Sun, 02 May 2021 16:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIzc-0001ws-NE
 for qemu-arm@nongnu.org; Sun, 02 May 2021 16:47:08 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIzS-0008Re-Jc
 for qemu-arm@nongnu.org; Sun, 02 May 2021 16:47:08 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so4895708ejc.10
 for <qemu-arm@nongnu.org>; Sun, 02 May 2021 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IZpRMhYriCArTic1oG4iRqGc+5388FGmmHJoIBEzmMA=;
 b=BEFfzu9XBymiw7DElN+jrP9/BXWaBHeTF2dCgOp4RcthLwpUXkRj2cYW0gRY65cT6u
 QhyuiXU00Fj9s46wtsukfc9urmIoI57JWq/h5k7lX5fRsS0gU3sN5vc57fezIjqIm+xo
 IAG5q+vruOOWT0yL7NSZubm6fy6Kfh6SKbLsIgDv5OViTbdX+pJN/jvEsH2kQk0EV56e
 8dyz0L5DH+LCApFEu1vz29MFyWYkI/d/nJiJYkS5wOvKSMDbGDDp6ZNmaoWFaVd2jCbL
 hb6o9EnfUahQirl98PWmkUKKcyAJPbdUVpWLOcwgVo2avxUtSnKStn+07b9SVXCYStp5
 rFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IZpRMhYriCArTic1oG4iRqGc+5388FGmmHJoIBEzmMA=;
 b=qhsic/pDvsUnBK1enC/tEgBoC/HKbx6YNlpbu2T8lpvVs9u9QY94a+SKaXzQXB/5ei
 6F6vZ7yZhbf1hxnkW6RQ0S+yfuZ9eJLyfQkrYICvMojDdLjVkjhnJNPJ3SWT1WMrtr2s
 lAPEdpt+OD5xfQiuGCCjel5IYwRiqxtYGSnLDq+in5l/Rn5whYXs1JFyGIb7npjGCOFp
 v+48oIsvsSx9Zcy/dxVKHHHFddXcX/toSgNqXC2MkKX3nq+8pXh304qhfZIxpS8DLsws
 ENP7jkxejjod6O19YfBnV5ILtlcRpjXwrhwTgr1jkIIxuGZJjz6LZ9MUuOYFhMUQusIT
 eAuw==
X-Gm-Message-State: AOAM5332oHsg4n4yF6pfaM2u0pLfT9LqD4Wy6tEnxZI9Qj/mcAGRyqtb
 k+3v0gGRIL657s1uy38UXJGHfyOl3UcmD1JNtIcYdg==
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr13908931ejd.56.1619988412098; 
 Sun, 02 May 2021 13:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-3-f4bug@amsat.org>
In-Reply-To: <20210502203121.630944-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 May 2021 21:45:47 +0100
Message-ID: <CAFEAcA_V6bM-UtEmF1a7_7Jad88aZ2J-dGpSs=cs+smvYEaV3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/pci-host/raven: Manually reset the OR_IRQ device
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pkF7rQgfvKuq

On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The OR_IRQ device is bus-less, thus isn't reset automatically.
> Add the raven_pcihost_reset() handler to manually reset the OR IRQ.
>
> Fixes: f40b83a4e31 ("40p: use OR gate to wire up raven PCI interrupts")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/prep.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 0a9162fba97..7481bbf99d4 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -230,6 +230,15 @@ static void raven_change_gpio(void *opaque, int n, i=
nt level)
>      s->contiguous_map =3D level;
>  }
>
> +static void raven_pcihost_reset_enter(Object *obj, ResetType type)
> +{
> +    PREPPCIState *s =3D RAVEN_PCI_HOST_BRIDGE(obj);
> +
> +    if (!s->is_legacy_prep) {
> +        device_cold_reset(DEVICE(&s->or_irq));
> +    }
> +}
> +
>  static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
>  {
>      SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
> @@ -419,11 +428,13 @@ static Property raven_pcihost_properties[] =3D {
>  static void raven_pcihost_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
>
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->realize =3D raven_pcihost_realizefn;
>      device_class_set_props(dc, raven_pcihost_properties);
>      dc->fw_name =3D "pci";
> +    rc->phases.enter =3D raven_pcihost_reset_enter;
>  }

Why does this device have an OR gate rather than having its
map_irq function say "all PCI IRQs go to interrupt 0" ?
(The PCI core code provides you the "OR" functionality for
free, because it has to do that anyway for when multiple PCI
cards share a PCI IRQ -- see pci_change_irq_level() and
pci_bus_change_irq_level().

Supplementary question: why does the legacy_prep setup create 4
outbound sysbus IRQs when the map_irq function can only ever
return 0 or 1 ?

thanks
-- PMM
