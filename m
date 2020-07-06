Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp198844lfm;
        Mon, 6 Jul 2020 10:56:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBNNE9OcmqfAyzicQdNMvBcFAxLSns9LCu/H95vQT8ESVnilGm/m3CwQbDbF6YcNe3to12
X-Received: by 2002:a25:70c2:: with SMTP id l185mr18678283ybc.83.1594058175594;
        Mon, 06 Jul 2020 10:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594058175; cv=none;
        d=google.com; s=arc-20160816;
        b=SfhiQx1rNKWKaRkZfYYFcFrUmWhWMV9G42WbrmsIQ3u40rPhuAOPsiEQfx9xrx85i3
         vE/PjVelx2++leTZp1OQuFnZGFn48m6b9UmyIxneKKTWdGhsPx4f7bS4MUr8jNb1DSLa
         GilsuDKtYmJ73ucvgSUJyo6bAOBB7LE20cQ7mD0gzh3UJIyQwGnaR6uueu5mcYN+Ex2v
         W8JE7xur/e6CmUdcZVRuo+/Z1uca9C2H0L0Br6zcoP5oAzDW4uV1a2pWrH1udlyJXCjh
         aSBp57xGIZpjyFnm0aRcSCa9N9P/Kzqzb9OV78A+45srJg0bYMBuzxtWN8dfHMAMVYiC
         HEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mSCfOyGk5eR0zmUJmXHZ59WLz9pikUBhIKrsmcLRwKY=;
        b=Dsr4cdPtlmptjyavIIN9aWKU2+Ltb52E5CBjMJStC6sRVr87/YB2CXTLRCvfpjtvqG
         dvcbWhg9ZmEpnfOyg2uTs0Z/GphQJtm0W9/MmtNzAvhAWcpS6sLjjKhpgJxap8fJDqTB
         Hk3ZDjO3Sj+sEyknMuisgMJ+GDOGi016bD2LV5KrOjKSk8MQzdAaiTx3LSj/4shw0uRq
         ULX4q+HYK8YkqrmFSKMOXuzlgw43Vu8p3C2Gmo16K9FA97pjSBni1z0YImeRJNCijrlN
         Lb6UfDKPYRAowbKUbaE9eeFuhmnQ9RTvpw9puJYkzp4p8AfJwtDZmryaJD/zFrUvmvPJ
         qUZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8eXVMxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c77si12720815ybf.271.2020.07.06.10.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8eXVMxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsVLj-0008CP-0P
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsVLV-00089P-SV; Mon, 06 Jul 2020 13:56:02 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:43125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsVLS-0008Rr-So; Mon, 06 Jul 2020 13:56:01 -0400
Received: by mail-io1-xd42.google.com with SMTP id k23so40237213iom.10;
 Mon, 06 Jul 2020 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mSCfOyGk5eR0zmUJmXHZ59WLz9pikUBhIKrsmcLRwKY=;
 b=j8eXVMxaY8jrHLiJej23Zer/m3spONPlFZ4KX79ZeAzpTiTZv8QpRQThnjOB9bjZEz
 9XqRX+ZacKvhEpEkSiAFCBRMsBRSLouiILP7wtr57JI+XSK4o9JxmLpHI2oc0Q86y5LI
 gKZaeo5iEWUhOrVi4VXiejkfsAXXi1Jok0jj0Lf06WbI9xEOKdvw0l2w9Ddex+SQocdw
 XLAtjlWIGAf3HjvdQdebloODZ+hOYtihnQpNOqqLzXX50FzndxNMA7kTZPk8LHDy3Eqy
 yQzhSTGA0MNqrwk/qGgrvgHt1PhK5+f5Ta5eL+9/+kmDpG8FN1o8jhVPg/ep/hzRREdv
 u/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mSCfOyGk5eR0zmUJmXHZ59WLz9pikUBhIKrsmcLRwKY=;
 b=rVVrUlKzEDVe+9ttToJBQNzagehOtwNE5yaPObTstkCKYr27dtavvOSid39L+bmpGF
 Q6je64r72SC40iDNGnN38LcqPs/pfVLmlVzF/PODsSZfo2qT1Kx4FxghNlijPcMxnM8w
 6Xg8AfYpgtYqZy+3cPGIEL4uspPI0k+zi3KZUYCYxkKZde+xNaAuE4DRw2I+/ZWS5S3B
 YHrTlJjgrL2pVQ5eDyhc6e3rR13/rwzD3bEYJMcz07QgOkBw3YRdBTuzGpK5yuUgL7O2
 TDbsH0/5xyIjhDc1hknQaiTM6InX6B/nw77RGMxvpTXcwb56hkdH/gmb926O63Vmv1ea
 3wFg==
X-Gm-Message-State: AOAM530CxPDiPXzSd2QOkk+WWFnjMsO0gFoB8+S3gLXyMlqDIz2QEa7J
 lI3YGxEITzoSdveM+Cv7yOY2MGtQHDgU+/oirO0=
X-Received: by 2002:a5d:9ed0:: with SMTP id a16mr26452978ioe.176.1594058157255; 
 Mon, 06 Jul 2020 10:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-17-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-17-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:46:09 -0700
Message-ID: <CAKmqyKNj_iiadDJEYme-HWxSNm5y7cE=ESRtxxXd4XvToGsRHw@mail.gmail.com>
Subject: Re: [PATCH 16/26] hw/usb/bus: Simplify usb_get_dev_path()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 96QSLFAc73Wi

On Sat, Jul 4, 2020 at 8:00 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Simplify usb_get_dev_path() a bit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/bus.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index 111c3af7c1..f8901e822c 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -580,19 +580,18 @@ static void usb_bus_dev_print(Monitor *mon, DeviceS=
tate *qdev, int indent)
>  static char *usb_get_dev_path(DeviceState *qdev)
>  {
>      USBDevice *dev =3D USB_DEVICE(qdev);
> -    DeviceState *hcd =3D qdev->parent_bus->parent;
> -    char *id =3D NULL;
>
>      if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
> -        id =3D qdev_get_dev_path(hcd);
> -    }
> -    if (id) {
> -        char *ret =3D g_strdup_printf("%s/%s", id, dev->port->path);
> -        g_free(id);
> -        return ret;
> -    } else {
> -        return g_strdup(dev->port->path);
> +        DeviceState *hcd =3D qdev->parent_bus->parent;
> +        char *id =3D qdev_get_dev_path(hcd);
> +
> +        if (id) {
> +            char *ret =3D g_strdup_printf("%s/%s", id, dev->port->path);
> +            g_free(id);
> +            return ret;
> +        }
>      }
> +    return g_strdup(dev->port->path);
>  }
>
>  static char *usb_get_fw_dev_path(DeviceState *qdev)
> --
> 2.21.3
>
>
