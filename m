Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1973061wru;
        Mon, 16 Jul 2018 15:09:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc+BYNLN+nExm+lQGBdW9GaFyfdLFDJHb9daFf2+nk+UfBIxnNKJ00ur1Bshr9teEYmeXOH
X-Received: by 2002:a37:1456:: with SMTP id e83-v6mr16202675qkh.69.1531778976050;
        Mon, 16 Jul 2018 15:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778976; cv=none;
        d=google.com; s=arc-20160816;
        b=RswOPOv2bG9UmPMceOvMTK71E8Ds3qOjI3LvvUdOSmP1iQBKnmae40DxL6DpnNw9aK
         r2LrHYxwM6hq9d7SHN7wzDe22war2xAxPSh9RJrg1TDGs46cLx9jtUNpqigLNQSuDFLI
         UWHFp2FWhPS5YdrMY4GSIsEZ4LwZ21lpZHeOCKPaJjFDQd8IMe/tnxaAsj7tO/H2KY64
         qrnGp1JjUx/zI1pwAE4Lut/F3bST06faIaFrnCy9KKPhjSyyY/nlsFoTKoyM5/O6P8Or
         kkPvo4o0hn7nTTWAtXR47xBbn79WX+HnQSWx/fZF5dJnUjaVVdu1tKNfWWCagwN4bFT8
         YPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7DjpfPWglpB8DbzUsbpzTH5FNAtotLDJk9cj+uM+j+A=;
        b=S+ND9ug3diHx04FslmrwDtCplJatekGtgczYtrDhSIK+HNlL6M/ksUOXzerG/6tkyt
         WYtSASKhgt3FF8pphp08JnTitgFGEaQ9ZlvYiPK4pi++auwQjv31Z+4hKNWRKnumWdwA
         n+OhwgxK64FuEZZM+C7oqQ9kXF4+xKQ0L9cEAm5Xkt5CMO56DpMupScMHSOpc9Y5uMZ1
         467yUzbWUDgBmFTrtXmXKm6PA1vwwkDfl3XVjKi1e5cWvXsleyfVccIXX+q34dnhxLfD
         0+dP1oOW65JVxFZSFMg11RjSlhVc2yr8CgCFbisZeAHprLH0t1bnBf2r0ucG85OPEwpj
         ZhUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZMavob4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75-v6si5497372qkg.314.2018.07.16.15.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 15:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZMavob4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBgV-0006t2-GJ
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 18:09:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBgL-0006rm-0f
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:09:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBgJ-0006lv-Lb
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:09:24 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:32891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBgG-0006h4-KE; Mon, 16 Jul 2018 18:09:20 -0400
Received: by mail-lf0-x241.google.com with SMTP id u14-v6so33364207lfu.0;
	Mon, 16 Jul 2018 15:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7DjpfPWglpB8DbzUsbpzTH5FNAtotLDJk9cj+uM+j+A=;
	b=ZMavob4vv9pzTNp84zIXShP/NIV3JccHMfpWNH/e3gzJdQpADWd/tP7kVZj89kcjW4
	pl/JmgSUyR25Af8cuKvYKnZkooxE4Bxfs+Jbgzd8LgrHHNtYeB8GKvI3yTB+Z2Ufgkn2
	J6p6YDb3gKPHEAj0cm/LIleNSR+2JUklelSg4gktjj65roQ6dfbq9jHugfNzts96M1kL
	YW18H+443571HtFtZxcBvoE5v16+k+v7fjw+WDTYll8mk+964AAfIao9WYsI/mnX0TtP
	qWESvbAga0hNSdx6UOD10fw8CMPvOOKToznutznqsPUA1oGiAeyvqdjr8dxm+qDKCwf4
	DJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7DjpfPWglpB8DbzUsbpzTH5FNAtotLDJk9cj+uM+j+A=;
	b=WjSlgJFyxaC4Xe3dTfm/OkvQhYd8uc4l3WmJJMUB7OL8ULa7woSnuJf9XQv4ImAcoi
	WzGosuuKU66PIQ1iMXc++Ncf3YqOhnoaUovSSViOmg5ufJgB4H/Sw2dKOrsgfklxxlm5
	M54iMLl1ZVcoYrVmK2CazEjwkWEvJCcKf2M6GL1cR6MiW+G0iXMuQjQPU5hy+zDrfXfE
	a6dkboT7liLVtWh7sa52bD7X4J8VzII/y2OIkcKttmwXk4Cw4BOyuQ2Qwi5UzHg04fux
	JupVRGu6qVDyZWM13W2LDYwTK9niWdSlRl/vDk100oAk8Dkc/LrIjmUXeK1ZFL1Dahy2
	trHA==
X-Gm-Message-State: AOUpUlGg9ewWiGKWWdoaZuHiHVwlwWROw4GTMYY1WLInk0SUuE6/V91B
	Lw0vZF+oToTG5s8oXdS1oEpEJ5PSk7DljrHOs/9AhA==
X-Received: by 2002:a19:4d0a:: with SMTP id
	a10-v6mr11881777lfb.5.1531778959503; 
	Mon, 16 Jul 2018 15:09:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 15:08:48
	-0700 (PDT)
In-Reply-To: <1531745974-17187-18-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-18-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 15:08:48 -0700
Message-ID: <CAKmqyKNK9y8h+AABTt-+qjy=npi_nFbSh36pM3oNL6AaJofKkg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 17/17] hw/arm/xlnx-zynqmp:
 Fix crash when introspecting the "xlnx, zynqmp" device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hzh1CDg3xFOm

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently crashes when e.g. doing something like this:
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'xlnx,zynqmp'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" \
>  |  aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
>
> Use the new object_initialize_child() and sysbus_init_child_obj()
> functions to get the refernce counting of the child objects right, so
> that they are properly cleaned up when the parent gets destroyed.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 61 ++++++++++++++++++++++++----------------------------
>  1 file changed, 28 insertions(+), 33 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 29df35f..8de4868 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -166,64 +166,59 @@ static void xlnx_zynqmp_init(Object *obj)
>      int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>
>      for (i = 0; i < num_apus; i++) {
> -        object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
> -                          "cortex-a53-" TYPE_ARM_CPU);
> -        object_property_add_child(obj, "apu-cpu[*]", OBJECT(&s->apu_cpu[i]),
> -                                  &error_abort);
> +        object_initialize_child(obj, "apu-cpu[*]", &s->apu_cpu[i],
> +                                sizeof(s->apu_cpu[i]),
> +                                "cortex-a53-" TYPE_ARM_CPU, &error_abort, NULL);
>      }
>
> -    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
> -    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> +                          gic_class_name());
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
> -        object_initialize(&s->gem[i], sizeof(s->gem[i]), TYPE_CADENCE_GEM);
> -        qdev_set_parent_bus(DEVICE(&s->gem[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "gem[*]", &s->gem[i], sizeof(s->gem[i]),
> +                              TYPE_CADENCE_GEM);
>      }
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
> -        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADENCE_UART);
> -        qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "uart[*]", &s->uart[i], sizeof(s->uart[i]),
> +                              TYPE_CADENCE_UART);
>      }
>
> -    object_initialize(&s->sata, sizeof(s->sata), TYPE_SYSBUS_AHCI);
> -    qdev_set_parent_bus(DEVICE(&s->sata), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
> +                          TYPE_SYSBUS_AHCI);
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> -        object_initialize(&s->sdhci[i], sizeof(s->sdhci[i]),
> -                          TYPE_SYSBUS_SDHCI);
> -        qdev_set_parent_bus(DEVICE(&s->sdhci[i]),
> -                            sysbus_get_default());
> +        sysbus_init_child_obj(obj, "sdhci[*]", &s->sdhci[i],
> +                              sizeof(s->sdhci[i]), TYPE_SYSBUS_SDHCI);
>      }
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
> -        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> -                          TYPE_XILINX_SPIPS);
> -        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
> +                              TYPE_XILINX_SPIPS);
>      }
>
> -    object_initialize(&s->qspi, sizeof(s->qspi), TYPE_XLNX_ZYNQMP_QSPIPS);
> -    qdev_set_parent_bus(DEVICE(&s->qspi), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "qspi", &s->qspi, sizeof(s->qspi),
> +                          TYPE_XLNX_ZYNQMP_QSPIPS);
>
> -    object_initialize(&s->dp, sizeof(s->dp), TYPE_XLNX_DP);
> -    qdev_set_parent_bus(DEVICE(&s->dp), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "xxxdp", &s->dp, sizeof(s->dp), TYPE_XLNX_DP);
>
> -    object_initialize(&s->dpdma, sizeof(s->dpdma), TYPE_XLNX_DPDMA);
> -    qdev_set_parent_bus(DEVICE(&s->dpdma), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "dp-dma", &s->dpdma, sizeof(s->dpdma),
> +                          TYPE_XLNX_DPDMA);
>
> -    object_initialize(&s->ipi, sizeof(s->ipi), TYPE_XLNX_ZYNQMP_IPI);
> -    qdev_set_parent_bus(DEVICE(&s->ipi), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "ipi", &s->ipi, sizeof(s->ipi),
> +                          TYPE_XLNX_ZYNQMP_IPI);
>
> -    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_XLNX_ZYNQMP_RTC);
> -    qdev_set_parent_bus(DEVICE(&s->rtc), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
> +                          TYPE_XLNX_ZYNQMP_RTC);
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> -        object_initialize(&s->gdma[i], sizeof(s->gdma[i]), TYPE_XLNX_ZDMA);
> -        qdev_set_parent_bus(DEVICE(&s->gdma[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "gdma[*]", &s->gdma[i], sizeof(s->gdma[i]),
> +                              TYPE_XLNX_ZDMA);
>      }
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
> -        object_initialize(&s->adma[i], sizeof(s->adma[i]), TYPE_XLNX_ZDMA);
> -        qdev_set_parent_bus(DEVICE(&s->adma[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "adma[*]", &s->adma[i], sizeof(s->adma[i]),
> +                              TYPE_XLNX_ZDMA);
>      }
>  }
>
> --
> 1.8.3.1
>
>
