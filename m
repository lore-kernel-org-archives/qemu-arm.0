Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1041619ejo;
        Tue, 12 Dec 2023 08:56:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfaEPt/+3dl/D55n6kuwMb8rEyVwCfkrhKbNKB+EuM/c+lBFxB2w2uuybTgTt1nosPojCe
X-Received: by 2002:a05:622a:491:b0:423:711f:9813 with SMTP id p17-20020a05622a049100b00423711f9813mr7611527qtx.62.1702400178601;
        Tue, 12 Dec 2023 08:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702400178; cv=none;
        d=google.com; s=arc-20160816;
        b=0Xqg6MgpVN1EJ66BRCUWvUE9opoVDKAaGLjJWCSL+dMJL6M4I9AR1VtGAnDIHOVVti
         z4r7qZb5uwtYlrLUKhoej3A1Fxm0aMP3XkXCriCdYRXnz1IWxTOh/gzlUcNsvssm1lCA
         bzeJ57e6t51qhFDz/4Xo02W5oZWJSSaswCArK1iCbM/JtlAdHGESqFHz1ssicpXnLaYN
         /ITCLwRA/2qSobU8yCKyC1t7xsOEAq6pF6aBQo2PUkW0vOeStXIqAh6TgdQUY7mh1w8S
         aybpRiGOp3lPffFOV+ImHex7MF/OGNGYDJbfCehWIEFtq10rZQQ0SKFcbWgAB8s3u0yI
         DCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NBWDk8DZrRUrfIj/FZi1QqGD/m54M27q/X3YkMT5U0I=;
        fh=oSak0SfGtiLsfNmzdEAK2zLhe/BB9IXTK0i2wATuAS4=;
        b=xZiFWMpKMtNMqC3JdIeBkXUEMjleDGzpSDrOgV3tSEdyDRGJsZRx1iQiO8IKSrT3yK
         Hi/GEB9Bo/kTnF4aULAJtvZtXFWCy1DzTe5+FYyrcPQZGywT0RX0YnhJSUaQXKZbUc26
         wyJ7MWH/Qoq7/q+uiI2EvqXJW0LKCLRMzGDCtcs4tRrosGqcAQR2NCAA+B/x8Wp3YxIN
         FLIwoQ6XfLyL1q7776p15KA7ntZKSlVD8aEXqy/OwhxTqD8amdWOLnGNZWtKmXNyfCaR
         rbu/VG9C0rAMUYo2eR/ZJEsQr/xN5dV9SFhWuuiZYdnW+z/yalgKDXKGLtLXzUavrQi4
         JWqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZHsil0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020ac8070b000000b00417f76c422fsi804354qth.380.2023.12.12.08.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 08:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZHsil0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD63K-0000oY-MK; Tue, 12 Dec 2023 11:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD63J-0000o0-G0
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:56:13 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD63G-0001n3-Of
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:56:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3362216835eso1773716f8f.3
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 08:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702400169; x=1703004969; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBWDk8DZrRUrfIj/FZi1QqGD/m54M27q/X3YkMT5U0I=;
 b=mZHsil0TIkXfwjubgh6RqFgfE25BYaePuXkh3vN35Ii9D/1M/m2tw8CnSp1sCTReUe
 agQseOsmJDftcnMMyIXVAERPdQGItHxypuCW1RPJQy15bmb6KhsrG8gDMQcSfaa3w74/
 skjVL40LRoY/PM4/NUuXvro9+LexV5HD/oRAMsrB/0wtd5X9wErVsJPHBqUySInO5Y9s
 MIaZaU/VEktFrHFPLbRFFwPLYWQpxE7Of/2fSQYMQUy/0FS+vUO8TcthWPOO0/UM00qS
 4SbqdkQLPa04aiD7SO6n6UzNpjpRvVo1aSh2rfjN3zDBNwD3h6NIkay04XLbzS2gMWUn
 xEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702400169; x=1703004969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBWDk8DZrRUrfIj/FZi1QqGD/m54M27q/X3YkMT5U0I=;
 b=cish4WaU94JHuSUGrFVfb1KFzhPk3wtleNC96wbt75DZzwvCrzkuiySYEezMgf3Wvv
 ITscxLsdr+gE/Le7vGEGc8UMKWR2alkyLQ93YpvYBz9fIoVhcMtjkVLhI3uIKxXenTbH
 f3eQ4A61G6UfCECyLZGpbk2fSAXKT/dVrbjt/gH/MsnyOEF0AhrI2VpxOFD1mdtfLIlu
 7uK1TXvxinRLpLlm8u88ZYBaXXTLBi/Dy3CdVavE1Vl8l05wDl0rYL90Odcs03J0jG8/
 skYECVjIp3DbCNc9kh0aguS/S/P3OPT0DUAbmFHycytKjhWrMcOQcO5VkETRp2BoYxEO
 DGqQ==
X-Gm-Message-State: AOJu0YzqAyV04EWAi8I/OW7TR3NcC547/8sM7BeuP3Z117khyEi1BT9J
 wFnvJR/WgP2AEX3Hjvjk/hWP+KBmxXhj8Oq8C28dgFUzXDdc2s95
X-Received: by 2002:a05:651c:1606:b0:2cc:1ec1:93e2 with SMTP id
 f6-20020a05651c160600b002cc1ec193e2mr3241898ljq.52.1702400148268; Tue, 12 Dec
 2023 08:55:48 -0800 (PST)
MIME-Version: 1.0
References: <20231123143813.42632-1-philmd@linaro.org>
 <20231123143813.42632-6-philmd@linaro.org>
In-Reply-To: <20231123143813.42632-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 16:55:37 +0000
Message-ID: <CAFEAcA_tzL5Z4QOWCPKMyJ2XCQ0HgkR-_Ji=vC+zEECF0yRqAQ@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 5/8] hw: Prefer qdev_prop_set_bit over
 object_property_set_bool for QDev
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 qemu-ppc@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZU/biLgZz9hy

On Thu, 23 Nov 2023 at 14:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The QOM API is lower level than the QDev one. When an instance is
> QDev and setting the property can not fail (using &error_abort),
> prefer qdev_prop_set_bit() over object_property_set_bool().
>
> Mechanical transformation using the following coccinelle patch:
>
>   @@
>   expression o, p, v;
>   @@
>   -            object_property_set_bool(OBJECT(o), p, v, &error_abort)
>   +            qdev_prop_set_bit(DEVICE(o), p, v)
>   @@@@
>   -            object_property_set_bool(o, p, v, &error_abort)
>   +            qdev_prop_set_bit(DEVICE(o), p, v)
>
> manually adding the missing "hw/qdev-properties.h" header.
>
> In hw/arm/armsse.c we use the available 'cpudev' instead of 'cpuobj'.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

> @@ -1287,8 +1288,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms,=
 struct arm_boot_info *info)
>               * CPU.
>               */
>              if (cs !=3D first_cpu) {
> -                object_property_set_bool(cpuobj, "start-powered-off", tr=
ue,
> -                                         &error_abort);
> +                qdev_prop_set_bit(DEVICE(cpuobj), "start-powered-off", t=
rue);
>              }
>          }
>      }

This makes this code look a bit weird. Currently we have a loop
which has an "Object *cpuobj" which it uses to set properties,
in both cases using the object_property_* APIs. With this change,
we do half the job using a QOM API and the other half using
a qdev API. It would be good to follow up by converting the
other property-set so we can have a local Device * instead of
the Object *.


> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index eace854335..6733652120 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -263,20 +263,13 @@ static void pc_init1(MachineState *machine,
>          size_t i;
>
>          pci_dev =3D pci_new_multifunction(-1, pcms->south_bridge);
> -        object_property_set_bool(OBJECT(pci_dev), "has-usb",
> -                                 machine_usb(machine), &error_abort);
> -        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> -                                 x86_machine_is_acpi_enabled(x86ms),
> -                                 &error_abort);
> -        object_property_set_bool(OBJECT(pci_dev), "has-pic", false,
> -                                 &error_abort);
> -        object_property_set_bool(OBJECT(pci_dev), "has-pit", false,
> -                                 &error_abort);
> -        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
> -        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
> -                                 x86_machine_is_smm_enabled(x86ms),
> -                                 &error_abort);
>          dev =3D DEVICE(pci_dev);
> +        qdev_prop_set_bit(dev, "has-usb", machine_usb(machine));
> +        qdev_prop_set_bit(dev, "has-acpi", x86_machine_is_acpi_enabled(x=
86ms));
> +        qdev_prop_set_bit(dev, "has-pic", false);
> +        qdev_prop_set_bit(dev, "has-pit", false);
> +        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);

This line also can just use "dev".

> +        qdev_prop_set_bit(dev, "smm-enabled", x86_machine_is_smm_enabled=
(x86ms));
>          for (i =3D 0; i < ISA_NUM_IRQS; i++) {
>              qdev_connect_gpio_out_named(dev, "isa-irqs", i, x86ms->gsi[i=
]);
>          }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
