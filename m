Received: by 10.25.30.65 with SMTP id e62csp1297080lfe;
        Wed, 25 May 2016 06:01:55 -0700 (PDT)
X-Received: by 10.200.35.4 with SMTP id a4mr1821111qta.17.1464181315466;
        Wed, 25 May 2016 06:01:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d143si5016533qhc.106.2016.05.25.06.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 06:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5YRe-0003yq-Td
	for alex.bennee@linaro.org; Wed, 25 May 2016 09:01:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5YRW-0003tQ-03
	for qemu-arm@nongnu.org; Wed, 25 May 2016 09:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5YRQ-0000rn-Dc
	for qemu-arm@nongnu.org; Wed, 25 May 2016 09:01:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b5YRQ-0000rY-8H; Wed, 25 May 2016 09:01:40 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90902C0A805D;
	Wed, 25 May 2016 13:01:39 +0000 (UTC)
Received: from [10.36.112.49] (ovpn-112-49.ams2.redhat.com [10.36.112.49])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4PD1YI4008420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 May 2016 09:01:36 -0400
To: xiaoqiang zhao <zxq_yx_007@163.com>, qemu-devel@nongnu.org
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e012c6b0-f847-57f8-d323-c2bc85ceccb5@redhat.com>
Date: Wed, 25 May 2016 15:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 25 May 2016 13:01:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: peter.maydell@linaro.org, robh@kernel.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dCvs6hPucyHs



On 25/05/2016 12:58, xiaoqiang zhao wrote:
>  #define BCM2835_VC_PERI_BASE 0x7e000000
> @@ -106,7 +107,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *ram;
>      Error *err = NULL;
>      uint32_t ram_size, vcram_size;
> -    CharDriverState *chr;
>      int n;
>  
>      obj = object_property_get_link(OBJECT(dev), "ram", &err);
> @@ -147,6 +147,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>  
>      /* UART0 */
> +    qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hds[0]);
>      object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> @@ -158,17 +159,8 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(s->uart0, 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>                                 INTERRUPT_UART));
> -
>      /* AUX / UART1 */
> -    /* TODO: don't call qemu_char_get_next_serial() here, instead set
> -     * chardev properties for each uart at the board level, once pl011
> -     * (uart0) has been updated to avoid qemu_char_get_next_serial()
> -     */
> -    chr = qemu_char_get_next_serial();
> -    if (chr == NULL) {
> -        chr = qemu_chr_new("bcm2835.uart1", "null", NULL);
> -    }
> -    qdev_prop_set_chr(DEVICE(&s->aux), "chardev", chr);
> +    qdev_prop_set_chr(DEVICE(&s->aux), "chardev", serial_hds[1]);
>  
>      object_property_set_bool(OBJECT(&s->aux), true, "realized", &err);
>      if (err) {
> @@ -292,8 +284,6 @@ static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>  
>      dc->realize = bcm2835_peripherals_realize;
> -    /* Reason: realize() method uses qemu_char_get_next_serial() */
> -    dc->cannot_instantiate_with_device_add_yet = true;

This must remain, though the reason is now "realize() method uses
serial_hds[]".

Otherwise, looks good.

Thanks,

Paolo

>  }
