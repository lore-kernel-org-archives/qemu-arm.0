Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp449920lfm;
        Mon, 6 Jul 2020 17:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK3HARAhlvVuwU1MdR62GLL/rVRQyiXALovnH22JpeT1DWwSicKbIATHDbFmTuN1xluubn
X-Received: by 2002:a25:b211:: with SMTP id i17mr72802285ybj.241.1594081108107;
        Mon, 06 Jul 2020 17:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594081108; cv=none;
        d=google.com; s=arc-20160816;
        b=wePd29cpc5mI8joQ0RgTVrvqrcrEWOqnuGqaWTX4TkLTK0rm2t110err5pMk3DbsrJ
         YKo05W3H3dS70azndZjrORJdVYeEZe0aMuI6H5PcgxAtKB7BsKqdZ9zlfN7jf7MxzOc0
         NVH6HCLELGtlvlE+5HTCA9nHcLYltWeL2jz8tcItQ4aP/0eqelY1wTKulprw0sVfsbwv
         Ik1yPlByjCndkjYxgD5MgY0CLCN5Y0twhuVaMp9MHjaViE6/OQh1TaDYg0EaH9efR0xD
         eo8okPmInh1ta0nopA3cKMFUXu7NmrygwA5CRo+egHqlEnOA5FB2l1GXL66cA0hEFVwH
         SemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oT6h3FPPrO2frJk8eR6JrALI5YXxXiAsbZ1+5VELi6s=;
        b=wSv8tfnmSwf/rUVKA//jdgL81bdU6mpfepUUbfOqLMaPJoe8/fdKF242MOefrqwjw5
         MZTayLHxxRC2SyLnPjKycLotA7mOH5eQHLBF91H7/qgJ4RXqttvpoMyHPSfE42nbeFha
         iahw4lFl+VAKIkIpIUzF6TNbBib/OpGrkr2deDc9H6x3loIo5i01Ev6LDkfxi2jt81cI
         gFe4Fpqsm8tnoABLR2z4dJBvrkUiKJfOkkLO8m2Km37+uxG9Vk4LdnF2Mt7ba/k8Yk52
         mCjvEtEL/HDGwXiywOTjQQ4MS1sduKdpNs6D4/XsUQq2afUOLVo+RlU730pfpzOhERWO
         IKjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IGZ7nFq1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l137si10611660ybf.346.2020.07.06.17.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 17:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IGZ7nFq1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsbJb-0002me-Bi
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 20:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsbIo-0001qK-Kn; Mon, 06 Jul 2020 20:17:38 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsbIn-0005Ub-1r; Mon, 06 Jul 2020 20:17:38 -0400
Received: by mail-il1-x142.google.com with SMTP id a11so26258779ilk.0;
 Mon, 06 Jul 2020 17:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oT6h3FPPrO2frJk8eR6JrALI5YXxXiAsbZ1+5VELi6s=;
 b=IGZ7nFq1jPrJASsShupXRZ987k64O5ZF1peALAk0W9yQa/epc+jZ7vJemnzFRm7qQ0
 XwUCGVF4g7dXUL32MNSRP5OIl5XaEN5kqPkXvDFiw/reJhMLCjqVVM3JcyDTXftTKGCv
 l6VDo3EsePWKMENABCDslc18HsS205LYm9FU8ogayVgsnxjJILxEIynzpk6/Y4tTZIXY
 wybT1mS6TNxf/py8eH90SCc/1SxghIT0cqTDZQfDr7lkBtsbfeh9HyTS8S44H1WgDtnY
 H3IkdCsGUXjn2fTUA3Rjd0Coqk2SxNNZqZqW15ZC3DY2I0HXIZiiII8qF6hnubRW5de6
 Pf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oT6h3FPPrO2frJk8eR6JrALI5YXxXiAsbZ1+5VELi6s=;
 b=duzrL2aJJXs98QLHRYlBJmGZzCLXi8sN85lebMzuvQPPGDIojgeKl+G/Ogn6QBsvX6
 ntQjTkMZOgHF88JpusCZqEIEwEFRpfo1YcEEHDMwpMDU/Iu/XM0jwFHb1LiQqwuaWrjg
 utv5eolOBJSdj81DHXbH3KuNZhNADKuLPNdrKf4mcZf67PnrgYpQV9FewnvYMp1K5lJR
 bHMWRn0RnG3MWPcAKI+d5zFc0phgujXX635iMAsurJnHsHYHZT7V/oLwVPoCbpkMg8h0
 7opIFQLdc7GnYANQRAP6sS/klG1VN1DHQTXHzxngu0PoHaVhur7uYp/dLSKI5+Jhoq1o
 IC7w==
X-Gm-Message-State: AOAM530bhGYv6MphXUFZLj/KorrvJzERQFnARgbp3OAPfpR7GEpWee0g
 Oz162P1DjReQ1lkffTNirrkG18jQnubMWwCQqqo=
X-Received: by 2002:a92:bb84:: with SMTP id x4mr34079638ilk.177.1594081055408; 
 Mon, 06 Jul 2020 17:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-20-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-20-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 17:07:47 -0700
Message-ID: <CAKmqyKNW1V_vOPw4AdBP5BpD2ueOT1NFz4hUON82VMyErLzgyw@mail.gmail.com>
Subject: Re: [PATCH 19/26] hw/ppc/spapr: Use usb_get_port_path()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
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
X-TUID: E2d1BqOreYCx

On Sat, Jul 4, 2020 at 7:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> To avoid to access the USBDevice internals, and use the
> recently added usb_get_port_path() helper instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ppc/spapr.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f6f034d039..221d3e7a8c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3121,7 +3121,8 @@ static char *spapr_get_fw_dev_path(FWPathProvider *=
p, BusState *bus,
>               * We use SRP luns of the form 01000000 | (usb-port << 16) |=
 lun
>               * in the top 32 bits of the 64-bit LUN
>               */
> -            unsigned usb_port =3D atoi(usb->port->path);
> +            g_autofree char *usb_port_path =3D usb_get_port_path(usb);
> +            unsigned usb_port =3D atoi(usb_port_path);
>              unsigned id =3D 0x1000000 | (usb_port << 16) | d->lun;
>              return g_strdup_printf("%s@%"PRIX64, qdev_fw_name(dev),
>                                     (uint64_t)id << 32);
> @@ -3137,7 +3138,8 @@ static char *spapr_get_fw_dev_path(FWPathProvider *=
p, BusState *bus,
>      if (strcmp("usb-host", qdev_fw_name(dev)) =3D=3D 0) {
>          USBDevice *usbdev =3D CAST(USBDevice, dev, TYPE_USB_DEVICE);
>          if (usb_host_dev_is_scsi_storage(usbdev)) {
> -            return g_strdup_printf("storage@%s/disk", usbdev->port->path=
);
> +            g_autofree char *usb_port_path =3D usb_get_port_path(usbdev)=
;
> +            return g_strdup_printf("storage@%s/disk", usb_port_path);
>          }
>      }
>
> --
> 2.21.3
>
>
