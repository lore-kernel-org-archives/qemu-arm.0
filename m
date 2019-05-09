Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1236467wrh;
        Thu, 9 May 2019 13:58:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwx+5BTjXAZ+bglxmv4xAtR2KmekOclw/WBC7kxqwfNd4ipALK17chUKsM/6Wtym4KYJLBF
X-Received: by 2002:a1c:1903:: with SMTP id 3mr4276643wmz.103.1557435502089;
        Thu, 09 May 2019 13:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557435502; cv=none;
        d=google.com; s=arc-20160816;
        b=l9ht4vltN+zYcr62N+wqK95EYk86wbraSjDWYQPFxz5IF/1/1VszHpYwx9yHpIWAWA
         0jlZ1XoJ67rckL1RUgcJxaw4vMPbhsaxATBlcxWK6VTcURjNERFl5T5jqYz7nuJIycMu
         +vg/tTDFT3Y9a6rAKQjcukreRO44tliNITgXo+YR/2CrENrLccrvD84YKpfJU5wI+A7n
         7WINeDPeOk+n9fWfwoj9c+y65oe2NFAWcQAxoB5k9ZRXokJ2ht12c+a56zGB5WFn0r2R
         g0XkkTJ61MdLWYTlGncApXSj8Ebq9D6VPKApURVD9VB59eQGoluj3Qa9z1wQtEkL7Hi4
         U8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=1gUsH8RD9e4/YMZn7Mv0dErig9AgWg5mBmnpGnGRHKI=;
        b=BruiBjBeI78eMB5f3Lgasg6NmuNZ1pUhl4srYvpztO1kkcEk2z5Zbda0YadSNMtnkE
         Y1K7e6z2LLL0rc1rMt1eHWilH6PYmAhBDCarMKPMe+ytK4cMqieknOMCcGudcTn71hti
         iWltRa/LbDB8y1okF/FLTLTuTLOgxPtmkzPSzb6CSXshhSNId3eaUoTTudwMXkd7xIRd
         orQIs3YL/eBMxk5WaE/JqGmwOEcA76Z7t4WgeC0o59qxYJwlmSNQz7StvywONsZlu+3Z
         NxPOVbeQY4i1cv7DhBM8N/rx+oG/EJJWia3xYSwmHURVVhUwe/bJYzGwbLHcUlG7+wC9
         18IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U6dcIsiA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si2565871wrd.183.2019.05.09.13.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 13:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U6dcIsiA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:60879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOq7R-0001jS-49
	for alex.bennee@linaro.org; Thu, 09 May 2019 16:58:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hOq78-0001hT-N7
	for qemu-arm@nongnu.org; Thu, 09 May 2019 16:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hOq76-0002ND-UD
	for qemu-arm@nongnu.org; Thu, 09 May 2019 16:58:02 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:34770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hOq71-0002JW-DU; Thu, 09 May 2019 16:57:56 -0400
Received: by mail-lf1-x144.google.com with SMTP id v18so2588643lfi.1;
	Thu, 09 May 2019 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1gUsH8RD9e4/YMZn7Mv0dErig9AgWg5mBmnpGnGRHKI=;
	b=U6dcIsiAWIxN5BWKQfjVWH09XLFotGbw4ZijEh08TE0qr1hcW3so8k4ConStN07TJn
	1qJGxYq3eg9ZzbW/Q6awOlnd/yoIht9Qer0HymhCPLZ/xrdtkXMJKVXtRKG0cC2mshnK
	jzhOWg72JYxSv1d4Pc75otQfqAC1YTMIGS2m4g0dB/OWOPiXFbQrLJKsYavp3PxjgokN
	WpkNAeENQNfitL09VM01ulzOX+l0ZKH30BlZOgJ4y1HFKByAmH14bbl3IbSxWUZHt5yK
	S5lHLiAxEjLVZ96andYrN750VcCjSgzsBCzsmSng+Pub8ULYmjGyfYTHQv7gbIDvISr9
	K9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1gUsH8RD9e4/YMZn7Mv0dErig9AgWg5mBmnpGnGRHKI=;
	b=atFWgxgzEHY+tyrYXeQWMt7HTPTRtxD1eFtfFgSSbayAqAV54lDwcCnYa0AM9P62GE
	iWA8TFvjbK/Xd7Hb0S/a8bd97zWrD4eS3RvmT9MXaNNLjYROHeauu6681yhHMjEGKVDI
	yqPceOMWUrwaCZtSendQH/2uLsXKMxvHk9gBg+AXLU2zQ3HO9tIjNNtW6Gpq+A3DtIfk
	jNXERQ62D4N7n7uKFiYwsSnNCABPMNVmMbrHNObP3JN0r+wJA77YK9MOOMyOznSXFgYh
	iagsxzoNSbVNCR77GvfoyiVCUXLANHQRqtK39kgtYZzhGBETb1GnfJulBH4Ws23KHn7j
	RIPg==
X-Gm-Message-State: APjAAAVXjQBOCNrPImuTDtSirRRViUqyOtj3dKRJvptVLgsy+BlnvCHG
	RrsMUgKmy+0v2SGpeG2ycEaCOu2TLNjbX5/LXBg=
X-Received: by 2002:ac2:523a:: with SMTP id i26mr3634344lfl.118.1557435472816; 
	Thu, 09 May 2019 13:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-6-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 May 2019 13:55:45 -0700
Message-ID: <CAKmqyKO+drSjQ1x9J6HkjA0kJZ3qdq2TZnMvB7=5Gf+qAZ4Bsg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/16] hw/arm/bcm2835: Use
 object_initialize() on PL011State
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Paul Burton <pburton@wavecomp.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NGXAj5YSNrkz

On Tue, May 7, 2019 at 9:42 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> To be coherent with the other peripherals contained in the
> BCM2835PeripheralState structure, directly allocate the PL011State
> (instead of using the pl011 uart as a pointer to a SysBusDevice).
>
> Initialize the PL011State with object_initialize() instead of
> object_new().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/bcm2835_peripherals.c         | 14 +++++++-------
>  include/hw/arm/bcm2835_peripherals.h |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 7ffb51b6927..2931a82a25a 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -46,9 +46,9 @@ static void bcm2835_peripherals_init(Object *obj)
>      qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
>
>      /* UART0 */
> -    s->uart0 =3D SYS_BUS_DEVICE(object_new(TYPE_PL011));
> -    object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
> -    qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
> +    object_initialize(&s->uart0, sizeof(s->uart0), TYPE_PL011);
> +    object_property_add_child(obj, "uart0", OBJECT(&s->uart0), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->uart0), sysbus_get_default());
>
>      /* AUX / UART1 */
>      object_initialize(&s->aux, sizeof(s->aux), TYPE_BCM2835_AUX);
> @@ -166,16 +166,16 @@ static void bcm2835_peripherals_realize(DeviceState=
 *dev, Error **errp)
>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>
>      /* UART0 */
> -    qdev_prop_set_chr(DEVICE(s->uart0), "chardev", serial_hd(0));
> -    object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
> +    qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
> +    object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
>
>      memory_region_add_subregion(&s->peri_mr, UART0_OFFSET,
> -                                sysbus_mmio_get_region(s->uart0, 0));
> -    sysbus_connect_irq(s->uart0, 0,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart0), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart0), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>                                 INTERRUPT_UART));
>      /* AUX / UART1 */
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index 959508d57dd..e79c21771fe 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -38,7 +38,7 @@ typedef struct BCM2835PeripheralState {
>      MemoryRegion ram_alias[4];
>      qemu_irq irq, fiq;
>
> -    SysBusDevice *uart0;
> +    PL011State uart0;
>      BCM2835AuxState aux;
>      BCM2835FBState fb;
>      BCM2835DMAState dma;
> --
> 2.20.1
>
>
