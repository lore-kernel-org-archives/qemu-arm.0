Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp630578lfb;
        Fri, 22 Jan 2021 00:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+aZvpe276g049aR1ixpDc2z/AX0xL/bcLVSMXmVBCASGfN7r9k5ATkobGWSJqIjv4zDbm
X-Received: by 2002:a25:addf:: with SMTP id d31mr4733853ybe.473.1611302857950;
        Fri, 22 Jan 2021 00:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611302857; cv=none;
        d=google.com; s=arc-20160816;
        b=p5lUHm5KkqKgpntTV1ntr/feQkvW/tV+I69Nu2MUJ6dqomqH5avU9ooeqtlcV+kHhi
         yC+45zA8UqNMeW3XuWvSfdyf11tgvZ5sMeVzTJxr5dnQQZP2so+/E4hULNL4gRP3mtGu
         t7cLEnqoaKZOY5plUwmt3yyO9r9nLdQQ5sPt01tg8lS/wzbqynA2aVueSPhK7cBT0y1k
         WGRiGE0UqC5u3HwpS22IALPl0RaXUAwuL+rTJGRdb/9goa0oUflr7XX73EGcBAMfMe8O
         Fq2wE08oz28GLb1auuu7ECiLzbWORwinRNC6Rpb0eDtqY9oWdcdSKw7cu3miAdeSYiF8
         ltAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wceigeWi447uFqqOJBTYIF2O1oO/W+rRjQCaPdz1EqM=;
        b=DLh/lMUUD6Xrbul1bT6D3Mt3u0e0TR68mkFTQU3mFwTFTGzAB570SOzpSm6rPHhllx
         Ex97D5zlQj4KR8Gz+wJx9MalabDD/EZO2Pqvx+L7DwlMIklK4bzvJUNUIiYUwZPrXgKe
         ChhpOIbgMkirJPbwGTKMANbXk4WkvW6Oa4PkjBxKRvQ3zz+/i6gwoCLspizJIjp39NQf
         sTHIL6EpTow20eri1dNj02WDlt4i1XmAefqCbcPm9LVm2c4tA1Iak5I3xhB2iGhGBG+t
         j3IQg5eQBd3VHURyRdERQoTom2g4ef8tAWJWvryK3RdC0bLuzzBteT53hbHRs56Af+m8
         WCtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fW7GrR+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h203si6937751ybc.199.2021.01.22.00.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 00:07:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fW7GrR+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2rTl-0007kX-Aq
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 03:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l2rTZ-0007kM-SO
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 03:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l2rTX-0001AE-C1
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 03:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611302842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wceigeWi447uFqqOJBTYIF2O1oO/W+rRjQCaPdz1EqM=;
 b=fW7GrR+6C4YVWeIqdKqCgj55ZujYSUB/+tl640rS8WOwvvOLzRo0R2ZHxUPxbiZZNkBcZS
 9P67KxMtGm/f1nMQJRyfPM6nnYLfDjJShT91MLrBVUij/EZ9DfQJ9wAXBLOnvLyEqrqjke
 hgywAiHn29dsk6qGIUT9nHmqqvtcL7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-pqCwM7fwNsuwkhRTXI3Ppg-1; Fri, 22 Jan 2021 03:07:18 -0500
X-MC-Unique: pqCwM7fwNsuwkhRTXI3Ppg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 353AC15725;
 Fri, 22 Jan 2021 08:07:17 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E430A2C6BF;
 Fri, 22 Jan 2021 08:07:14 +0000 (UTC)
Date: Fri, 22 Jan 2021 09:07:12 +0100
From: Andrew Jones <drjones@redhat.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: Re: [PATCHv8 2/3] arm-virt: refactor gpios creation
Message-ID: <20210122080712.bwkjyyanwdv22eqd@kamzik.brq.redhat.com>
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-3-maxim.uvarov@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210120092748.14789-3-maxim.uvarov@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Jose.Marinho@arm.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, tf-a@lists.trustedfirmware.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6+1wqOR4j6Hp

On Wed, Jan 20, 2021 at 12:27:47PM +0300, Maxim Uvarov wrote:
> No functional change. Just refactor code to better
> support secure and normal world gpios.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/arm/virt.c | 64 ++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 96985917d3..c427ce5f81 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -820,17 +820,43 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      }
>  }
>  
> -static void create_gpio(const VirtMachineState *vms)
> +static void create_gpio_keys(const VirtMachineState *vms,
> +                             DeviceState *pl061_dev,
> +                             uint32_t phandle)
> +{
> +    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
> +                                        qdev_get_gpio_in(pl061_dev, 3));
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
> +                            "label", "GPIO Key Poweroff");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
> +                          KEY_POWER);
> +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
> +                           "gpios", phandle, 3, 0);
> +}
> +
> +static void create_gpio_devices(const VirtMachineState *vms, int gpio,
> +                                MemoryRegion *mem)
>  {
>      char *nodename;
>      DeviceState *pl061_dev;
> -    hwaddr base = vms->memmap[VIRT_GPIO].base;
> -    hwaddr size = vms->memmap[VIRT_GPIO].size;
> -    int irq = vms->irqmap[VIRT_GPIO];
> +    hwaddr base = vms->memmap[gpio].base;
> +    hwaddr size = vms->memmap[gpio].size;
> +    int irq = vms->irqmap[gpio];
>      const char compat[] = "arm,pl061\0arm,primecell";
> +    SysBusDevice *s;
>  
> -    pl061_dev = sysbus_create_simple("pl061", base,
> -                                     qdev_get_gpio_in(vms->gic, irq));
> +    pl061_dev = qdev_new("pl061");
> +    s = SYS_BUS_DEVICE(pl061_dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
>  
>      uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
>      nodename = g_strdup_printf("/pl061@%" PRIx64, base);
> @@ -847,21 +873,17 @@ static void create_gpio(const VirtMachineState *vms)
>      qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
>      qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
>  
> -    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
> -                                        qdev_get_gpio_in(pl061_dev, 3));
> -    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
> -    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
> -    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
> -    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
> -
> -    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
> -    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
> -                            "label", "GPIO Key Poweroff");
> -    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
> -                          KEY_POWER);
> -    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
> -                           "gpios", phandle, 3, 0);
> +    if (gpio != VIRT_GPIO) {
> +        /* Mark as not usable by the normal world */
> +        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
> +        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
> +    }

nit: The above if-block could/should have waited until the next patch to
be added.

>      g_free(nodename);
> +
> +    /* Child gpio devices */
> +    if (gpio == VIRT_GPIO) {

Same nit as above, the next patch is where we should start conditionally
doing stuff based on the gpio type.

> +        create_gpio_keys(vms, pl061_dev, phandle);
> +    }
>  }
>  
>  static void create_virtio_devices(const VirtMachineState *vms)
> @@ -1990,7 +2012,7 @@ static void machvirt_init(MachineState *machine)
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
>      } else {
> -        create_gpio(vms);
> +        create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
>  
>       /* connect powerdown request */
> -- 
> 2.17.1
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

