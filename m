Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1047833ejo;
        Tue, 12 Dec 2023 09:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt4AsoP/+6Cj82XbqqAAEmBNVh7uZZgB3Q6qnLgjiiTMNlCIKFGWLdjPFmWlDzaNNGPw82
X-Received: by 2002:a05:6214:1110:b0:67a:aa87:7ae2 with SMTP id e16-20020a056214111000b0067aaa877ae2mr9180818qvs.40.1702400638769;
        Tue, 12 Dec 2023 09:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702400638; cv=none;
        d=google.com; s=arc-20160816;
        b=jAdXqP0feLnvQYNl9Unm5weNvpkj0FUgdJalLOzx3thcUxcodjqKJEw5E//zqBls2y
         aICdC+CYaUO0rc29TXZnzYFqtJGpgQ6pUWAAdJVZQg/wXLh7M54ee8VEjOj4jA8FPNoG
         jM3lKN0HUuRPdDtNEWKmzWLMao+kSLKubzzEm6cXgN0h9sa1NV2gxvkDuaDGpvQAvDcK
         3EoowD479kwLtu9MWbhL5RDwIZRtomISgV/n8T6L2xxlp5tWRL+yMm92B7ZYK/U7a9rU
         VD8dV3DLDviXLRulFdXRHc3UZ99n3nDasB8CISdOpts0DCfuVjt8NmLfaa6M+gKmliMD
         bwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bqEohpn65OtyUXLlXMPdQICP6Ozkd4Jm1At+Kp9oMm8=;
        fh=oSak0SfGtiLsfNmzdEAK2zLhe/BB9IXTK0i2wATuAS4=;
        b=VHTEH3fUwLGcJQ8rg9z5ncAlPSewalsUfVAkdoxwU7mI4RMMTP7h924P/IpuFIVk/W
         8o/jCbEhs7nrJw/tvvZ5jAmexCqU5DEAmzn43PqVZWAeKxwaYfJGldGn2eB9WbtSqaaG
         5NkKLfc2x9N3P507JOhCxmW66qxWk+fbIRWvcYCWEwVwZctZNDRV1/JM/64+ImCBXLXC
         LedisqT2Sl4EMPvlWqMFC4Fe+KC5B8pBRIYztwJvNN2PmXYISBxgtlrlY1tdmCCV5PRS
         BXnLRWZNk8LviyftpyYocfWMkGC3LjJfTD8hldXIiK+kxSpK8Efswf0Lq2o4OetP0fwO
         cHRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6nu3HH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020a0cf094000000b0067ef2ba6f6esi373823qvk.492.2023.12.12.09.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 09:03:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6nu3HH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD6AW-00069k-FI; Tue, 12 Dec 2023 12:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD69b-0005Aw-Iy
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 12:02:49 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD69X-0004iu-GN
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 12:02:43 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54c70c70952so8358577a12.3
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 09:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702400557; x=1703005357; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqEohpn65OtyUXLlXMPdQICP6Ozkd4Jm1At+Kp9oMm8=;
 b=k6nu3HH6qv86k7sptDkLgilAe567BWfROVkE8zhkmEnJeIAHxuz2JihTyx+CPyh3uE
 +BpZiHMP9iMG27kmfJsTRSQhRd9Hcq81SMjS6xq7zdRdW2SdG+h/D5nuK2RkFqAXwfZ/
 3RBns+zu8U+yyz3SHslcHkRd6thVKCAEbbudgS1WW4LvfSc60IaAGtyGrkT+7CWxzyGe
 Ey/ehNRADRLOGYQzLJMjSTc/CJNUjNBtSrvPD7pXBjRHwgmJnBYAIFWuKR2Ou9ah45gF
 uhh6ZENRQrthiMawAIzDoDbl3WVgvI6SSeJdnHJcqWCUiYnwMJ8kqTbg/WIMSIGUd+xR
 pGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702400557; x=1703005357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqEohpn65OtyUXLlXMPdQICP6Ozkd4Jm1At+Kp9oMm8=;
 b=PeMBPrsZpP6tDvdett9CjTICbDVVpbQfFfbK5bPWDu2lnHUJqW02XQ0oCBU9+0KmyH
 Zup/4oKLd4HibkvR5kulyYBJQFwtFmmAO41VEbteOFH7mU5yfelK5Anp7R8vDq7GoXth
 7PE5Op95Sbpk/1e1lrT70fkfG/Tnllopt3sIhjLJ3J8lchNGC2SpBBzvFGYkgRk19EnT
 zcapCDNEFQIe+eIbuvoxojdENUvz0jPCISMl3ZKxwc40iKdbAv0cJowq4ZU6UieSEE/1
 tIAgOgTZQjeTO/AbIQD0vOIUTQ/M1EmmWJFfRHGZT2uL337joVKFMJgd4gKQ3w93sa2S
 hJtg==
X-Gm-Message-State: AOJu0YxHigRkTf54+Xuyd8MUY2vi96/UUm4wWaGsTxADr5fZrYjK0sgI
 KNmRpV0czSVKcM0/mbQsuNliIoOif7ldEdVz71rtUQ==
X-Received: by 2002:a50:99cf:0:b0:54c:d3cd:c831 with SMTP id
 n15-20020a5099cf000000b0054cd3cdc831mr2581017edb.47.1702400557059; Tue, 12
 Dec 2023 09:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20231123143813.42632-1-philmd@linaro.org>
 <20231123143813.42632-8-philmd@linaro.org>
In-Reply-To: <20231123143813.42632-8-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 17:02:24 +0000
Message-ID: <CAFEAcA_Y9UCakRg0rhH_pL_xvGWCd47gjgufA4QjDHtf20tspA@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 7/8] hw/arm/bcm2836: Move code after error
 checks
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: hPRRyeLjbvae

On Thu, 23 Nov 2023 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> First run the code that can return errors, then on success
> run what alters the instance state.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/bcm2836.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 03e6eb2fb2..e56935f3e5 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -119,13 +119,6 @@ static void bcm2836_realize(DeviceState *dev, Error =
**errp)
>          return;
>      }
>
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, bc->ctrl_base);
> -
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
> -        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
> -        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
> -
>      for (n =3D 0; n < BCM283X_NCPUS; n++) {
>          object_property_set_int(OBJECT(&s->cpu[n].core), "mp-affinity",
>                                  (bc->clusterid << 8) | n, &error_abort);
> @@ -158,6 +151,13 @@ static void bcm2836_realize(DeviceState *dev, Error =
**errp)
>          qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_SEC,
>                  qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", =
n));
>      }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, bc->ctrl_base);
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
> +                    qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq=
", 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
> +                    qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq=
", 0));
>  }
>

There's no particular harm in moving the code, but given the loop
we are already doing some IRQ-connection work before doing some
things which might fail.

We don't in general do a particularly consistent job with
tidying up in realize methods that fail halfway through, but
in general "connect an IRQ between two devices both of which
are owned by this container device" and "map an MR of this device
we own into a container region we also own" are not things
which affect the overall simulation, and in theory should
be cleanup-able later (maybe even automatically by refcount
if we're really lucky).

-- PMM
