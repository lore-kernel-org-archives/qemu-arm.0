Received: by 10.28.91.67 with SMTP id p64csp1291965wmb;
        Tue, 13 Mar 2018 16:37:29 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtlPGNkjkg+t8k0NMzGTzHnsasY0xl6VPNMf40khjZ8oE+X634NCo+rv8FJYK+LU7QfD4Dc
X-Received: by 10.200.82.6 with SMTP id r6mr4045849qtn.31.1520984248950;
        Tue, 13 Mar 2018 16:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984248; cv=none;
        d=google.com; s=arc-20160816;
        b=KJEI7ONupRfP3e5loJU/EmRDMBzpOJs6VZIgYKyln0BQhSdeyQ4HFMEL3Vvy1cmXtg
         SV9hdiFEdfh3hhChVtmf+fwHCeMNj54MDtBs2tvCy1EQurb0uzW9Jx0Zm23TM8brWXmQ
         YoOeUibVxO/3NVVzSWrGK2cxFuWWGC3Fd+X5W9nylUSAmJZ3YgYE5Pa0yzVpGpCwNhdT
         lWOqVGNkGFVDNWJy92dMLioy1wRk5SntpNeZ8nu6FaNeF/jR2V2W1ckVQbaHso7yy+7h
         30VHbAr90gnnLTP2rL8rrsqd6EiD6W0A6PODU++1Bg5ly0ctX9FwORw9ODtUsVmSULrh
         Eoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=mE66iRHi88berb+sS9bs06kQnu3I8dRwOWnnv+U7IDE=;
        b=R2rE3g3EyrSeqfmXb5G9Cl4N7PkVTJ4KPmzMJ6s3eH5tCH29oMZG+rojZhfWpKDJAv
         AGg4hIG+DWkuqJX7KxylECUfb5TJqKjL8wQQl+BNbxKy01bugGu9an2iwWQjHMpICqgo
         7mYNQYxoavnwm7XQz5galO8dWbUZt2c2vs92cwDZpLhHdt5LyBL3J36UEJcxd2h+xV4g
         tyLHXyvu3TjrJy59sn/dkm1iTbcKOS3DdvGeqc5FUl6Qcfqbts/U2kHKHFsKuclEW3Zc
         LVZZh6w63l6UQH+SyHN6Qx8ZaWABNVqHvKCMvADqkIzfrn1cKY1ycYlnEDZW62+DEQio
         z9aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rV5BU95l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y31si1428677qth.363.2018.03.13.16.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rV5BU95l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evtU0-0006La-Cl
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsrw-0006GO-RX
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 18:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsrs-0001zJ-QO
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 18:58:08 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:51163)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsrs-0001yl-GQ; Tue, 13 Mar 2018 18:58:04 -0400
Received: by mail-wm0-x244.google.com with SMTP id w128so899542wmw.0;
	Tue, 13 Mar 2018 15:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mE66iRHi88berb+sS9bs06kQnu3I8dRwOWnnv+U7IDE=;
	b=rV5BU95lewC9U5iVoRG//A69kXn2bLc9o1nY2dgfjnY398WiY+9djP0RF0ihZSyK28
	i+1NKm27rfgIRLLaeVMg5QTwr3Tm4RUtZPwGoclMq8ke5Nc13T0kydxxzy2I++ycaP0U
	h4VmQ+9ZWxLj7ozSo0YxGzTSCv2wfiLYqUmP9LDVtKE/we++lvBi3Nael8hNXauCzYS4
	2zuFOYvdYYYccCMJMoYmxsMGfyZdoGkNyL9DtPLDveJaFIn6NmlYzpf41gPJZ0kwpl8k
	Hc+Uzd2gNpP9fM0zzbo4HEZ12kVJfQDkzJwgzLe3bsqYi9fpN5ZePzZlRW977GD2Pl8z
	CsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=mE66iRHi88berb+sS9bs06kQnu3I8dRwOWnnv+U7IDE=;
	b=toYhfDQTQyoP4BMonmZFTZBi7Z4A23benvPyo4YgUmoC0KsDPnrnt8/S11QhN/xmZm
	4fEgkmuh1RGhpuFEnHdPTvMiOC7Z6ApJtb6yI0Jx62Ff2kouTx5XWB3WMKQByDwuLlyE
	5oe6muNNUi7XtW5O8WBoNadDXmRl3ni5zW42eAjPkiPERkdZaZ2oL+KB9TWp1S4FrxyS
	zJpJWlQkNR8HYwxyPw6Kk23kynKIP2CT5IeGJWRTQOZciziqcXWD13aZdanjSAUukGak
	rbzoNpC2Fv61O03GbZ1CsxVqAiEyxwy8dHVTiUV4pffMBX10QProCYShSKLDhOAPzwRK
	2yrA==
X-Gm-Message-State: AElRT7GB7fZFTeciujhJ1gyeW7NQEPNobMOQJGZ533U6yeOneEz3Oj4p
	4B3zx5nQbSakfao8iwEdTN0=
X-Received: by 10.28.111.19 with SMTP id k19mr1929674wmc.147.1520981883350;
	Tue, 13 Mar 2018 15:58:03 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65])
	by smtp.gmail.com with ESMTPSA id c17sm268193wrg.60.2018.03.13.15.58.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 15:58:02 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <85567144-145d-40ed-ce32-4b1a7606aeef@amsat.org>
Date: Tue, 13 Mar 2018 23:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-devel] [PATCH 5/9] hw/arm/bcm2836: Rename bcm2836
 type/struct to bcm283x
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V1j7RNi7xPyT

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> Our BCM2836 type is really a generic one that can be any of
> the bcm283x family. Rename it accordingly. We change only
> the names which are visible via the header file to the
> rest of the QEMU code, leaving private function names
> in bcm2836.c as they are.
> 
> This is a preliminary to making bcm283x be an abstract
> parent class to specific types for the bcm2836 and bcm2837.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/bcm2836.h | 12 ++++++------
>  hw/arm/bcm2836.c         | 17 +++++++++--------
>  hw/arm/raspi.c           | 16 ++++++++--------
>  3 files changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> index 4758b4ae54..9a10a76631 100644
> --- a/include/hw/arm/bcm2836.h
> +++ b/include/hw/arm/bcm2836.h
> @@ -15,12 +15,12 @@
>  #include "hw/arm/bcm2835_peripherals.h"
>  #include "hw/intc/bcm2836_control.h"
>  
> -#define TYPE_BCM2836 "bcm2836"
> -#define BCM2836(obj) OBJECT_CHECK(BCM2836State, (obj), TYPE_BCM2836)
> +#define TYPE_BCM283X "bcm283x"
> +#define BCM283X(obj) OBJECT_CHECK(BCM283XState, (obj), TYPE_BCM283X)
>  
> -#define BCM2836_NCPUS 4
> +#define BCM283X_NCPUS 4
>  
> -typedef struct BCM2836State {
> +typedef struct BCM283XState {
>      /*< private >*/
>      DeviceState parent_obj;
>      /*< public >*/
> @@ -28,9 +28,9 @@ typedef struct BCM2836State {
>      char *cpu_type;
>      uint32_t enabled_cpus;
>  
> -    ARMCPU cpus[BCM2836_NCPUS];
> +    ARMCPU cpus[BCM283X_NCPUS];
>      BCM2836ControlState control;
>      BCM2835PeripheralState peripherals;
> -} BCM2836State;
> +} BCM283XState;
>  
>  #endif /* BCM2836_H */
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 9266f27c14..1d1908654b 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,7 +25,7 @@
>  
>  static void bcm2836_init(Object *obj)
>  {
> -    BCM2836State *s = BCM2836(obj);
> +    BCM283XState *s = BCM283X(obj);
>  
>      object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
>      object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
> @@ -44,7 +44,7 @@ static void bcm2836_init(Object *obj)
>  
>  static void bcm2836_realize(DeviceState *dev, Error **errp)
>  {
> -    BCM2836State *s = BCM2836(dev);
> +    BCM283XState *s = BCM283X(dev);
>      Object *obj;
>      Error *err = NULL;
>      int n;
> @@ -52,7 +52,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
>      /* common peripherals from bcm2835 */
>  
>      obj = OBJECT(dev);
> -    for (n = 0; n < BCM2836_NCPUS; n++) {
> +    for (n = 0; n < BCM283X_NCPUS; n++) {
>          object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
>                            s->cpu_type);
>          object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> @@ -102,7 +102,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
>          qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
>  
> -    for (n = 0; n < BCM2836_NCPUS; n++) {
> +    for (n = 0; n < BCM283X_NCPUS; n++) {
>          /* Mirror bcm2836, which has clusterid set to 0xf
>           * TODO: this should be converted to a property of ARM_CPU
>           */
> @@ -150,8 +150,9 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
>  }
>  
>  static Property bcm2836_props[] = {
> -    DEFINE_PROP_STRING("cpu-type", BCM2836State, cpu_type),
> -    DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2836_NCPUS),
> +    DEFINE_PROP_STRING("cpu-type", BCM283XState, cpu_type),
> +    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
> +                       BCM283X_NCPUS),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> @@ -164,9 +165,9 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
>  }
>  
>  static const TypeInfo bcm2836_type_info = {
> -    .name = TYPE_BCM2836,
> +    .name = TYPE_BCM283X,
>      .parent = TYPE_DEVICE,
> -    .instance_size = sizeof(BCM2836State),
> +    .instance_size = sizeof(BCM283XState),
>      .instance_init = bcm2836_init,
>      .class_init = bcm2836_class_init,
>  };
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 1ac0737149..58c6e80a17 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -32,7 +32,7 @@
>  static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
>  
>  typedef struct RasPiState {
> -    BCM2836State soc;
> +    BCM283XState soc;
>      MemoryRegion ram;
>  } RasPiState;
>  
> @@ -136,7 +136,7 @@ static void raspi_init(MachineState *machine, int version)
>      BusState *bus;
>      DeviceState *carddev;
>  
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
> +    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM283X);
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
>                                &error_abort);
>  
> @@ -189,9 +189,9 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> -    mc->max_cpus = BCM2836_NCPUS;
> -    mc->min_cpus = BCM2836_NCPUS;
> -    mc->default_cpus = BCM2836_NCPUS;
> +    mc->max_cpus = BCM283X_NCPUS;
> +    mc->min_cpus = BCM283X_NCPUS;
> +    mc->default_cpus = BCM283X_NCPUS;
>      mc->default_ram_size = 1024 * 1024 * 1024;
>      mc->ignore_memory_transaction_failures = true;
>  };
> @@ -212,9 +212,9 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
> -    mc->max_cpus = BCM2836_NCPUS;
> -    mc->min_cpus = BCM2836_NCPUS;
> -    mc->default_cpus = BCM2836_NCPUS;
> +    mc->max_cpus = BCM283X_NCPUS;
> +    mc->min_cpus = BCM283X_NCPUS;
> +    mc->default_cpus = BCM283X_NCPUS;
>      mc->default_ram_size = 1024 * 1024 * 1024;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
> 
