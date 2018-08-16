Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2020908wru;
        Thu, 16 Aug 2018 09:05:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyFX99obp/cRSZUP2slfSUA1kiAifU9KUoDo8NG5HLZtd5Zeo6C4xKvRugd9amQ1YNArGNm
X-Received: by 2002:a0c:9002:: with SMTP id o2-v6mr27665323qvo.173.1534435542928;
        Thu, 16 Aug 2018 09:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534435542; cv=none;
        d=google.com; s=arc-20160816;
        b=Imjr0Wi0r6s75vsCa0gc9zGKnjX6ztpWn5tKR+HmKAtFfC2wj8ZpUpstg60dclI853
         QaZEtXvt0ifPe14jZcWgU6pkM69XaepqTRMhovoGmfO8gldpBSDHnbr8XfP/EkJP/89M
         DsABy8r76cUZEYVt1kGv1EMAN+cBIY8iCF3OvpegPdVk1ZzSIYSzIgMMRXz8G2Sv/1/L
         45brLBN4f/I5otc9D6n9tW71/jsp0/skeT0nh2pPQ9/33oq2EtCQaLJPmlOOssofjOQN
         EU+BmtZEj5/ZNAbguI4Ix8UU1QLmS2MMyO+DmyrUiDlU/7UG3N8k3u+wo/F9OVZRKsk5
         hQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Un6adedQixuWxtxqc5FbOsMHu5LaPmRkVvU9AWe7PiM=;
        b=NTOMnPFP3XSM6pQ0Ms+/UQ0C7/UUwvdYitgmoh4m+CZRKlWgCjtxjRe45wGvJrFUA7
         E7zgE8fFIpfp/sQ/WT0tc5gjhBEnPd97EJJjtThyX/6AtLE0DGQFF7kzy9bcLsQiKI5j
         NmH2fbb7QPp0k3kYtVhTYCS6kmA0lzt/bJM+B1vI4dtwUaBOBk1u2DUtMkV0wbK879oa
         zemeWxFFMr/59/2nNLyq6oAwtKnP/QuhOfmhtFJ8Icc6BqLGItGdFgz+56FT/JmJtXvD
         8XKeedid92ySdLVAuyd39ePHMjonyqLiAJItAGEZMswlM8dCs9LaenvQf0wiSQlodv1q
         HXBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nal7S/25";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r24-v6si998189qkk.207.2018.08.16.09.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nal7S/25";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqKmM-0000Q8-Cv
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:05:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJrd-0006rI-2o
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJrZ-0005CB-Pw
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:07:05 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:39439)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJrZ-0005Bg-40
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:07:01 -0400
Received: by mail-oi0-x244.google.com with SMTP id d189-v6so8585938oib.6
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Un6adedQixuWxtxqc5FbOsMHu5LaPmRkVvU9AWe7PiM=;
	b=Nal7S/25pbnhckXwrvGWyS25IoT2rgqwCrpW7mygCvVG/owFck0RzvLzUK0ICDg+SA
	W9dz6a+wwA/4SdkoaumvScR/HWUh1Gzk/+gBTvlz2Z7jrAk8N5HtXRs/1ur8mXarlMqa
	mdWn/dbUVnMDwBIOCroGzjvqy97aYTvo0ijcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Un6adedQixuWxtxqc5FbOsMHu5LaPmRkVvU9AWe7PiM=;
	b=r2RHVYG07bU1rPkN+I26E8spKhY1rwGd92lLj+irnUpr490i5B3SiUFboLDLnwVwSG
	/ojj/jf5X4y3nUzvoILSFnQC8C3XZ3N3Zyf9Kwfy9zgj4sXCQIPeb9Q4qKmi4uV9l+nq
	5OP2xs5b/z6vJS61MpiQAKLrnpHOirE9xUQoL73EK4D0qRRehffY/8I+SPR6INzyImGN
	A3OoYTygJrE0Q2lC3q0+JuxjtS9QPUecZOQmEL9XQzJdtR3x0vbCIIE+YDKIdk/Irjfs
	nWfzKEfcWPS3nJanx5YZySYfE4eauGtGTtzxBCeJvNtaPjkkN6vcyLuuCqJxpvRIAKPc
	4S7w==
X-Gm-Message-State: AOUpUlH89/2G7A1tOon87MIZD/kaZioB1f7AbKYiMNl84bkAQBRlnTEx
	/PHyiyUEyKr/uAveR9howxQSXDJuuxyf3XeW6d7I3g==
X-Received: by 2002:aca:ac54:: with SMTP id
	v81-v6mr29858057oie.1.1534432020260; 
	Thu, 16 Aug 2018 08:07:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 08:06:39
	-0700 (PDT)
In-Reply-To: <20180811090836.4024-4-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-4-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 16:06:39 +0100
Message-ID: <CAFEAcA-vtLpt-ScYpYPFqtQAnECuVqCW-DhKqVgoh6mAG=KfQw@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 3/7] arm: Add chip variant property to nRF51
 SoC
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o4EW5FFOVM0o

On 11 August 2018 at 10:08, Steffen G=C3=B6rtz <contrib@steffen-goertz.de> =
wrote:
> Nordic Semiconductor nRF51 SOCs are available
> in different "variants" which differ in available memory.
> This patchs adds a "variant" attribute to the SOC
> so that the user can choose between different variants and
> thus memory sizes.
>
> See product specification http://infocenter.nordicsemi.com/pdf/nRF51822_P=
S_v3.1.pdf
> section 10.6
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/microbit.c          |  4 ++--
>  hw/arm/nrf51_soc.c         | 40 +++++++++++++++++++++++++++-----------
>  include/hw/arm/nrf51_soc.h | 15 +++++++++++---
>  3 files changed, 43 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index 8f3c446f52..d6776dea0a 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -27,11 +27,11 @@ static void microbit_init(MachineState *machine)
>      object_property_add_child(OBJECT(machine), "nrf51", soc, &error_fata=
l);
>      object_property_set_link(soc, OBJECT(system_memory),
>                               "memory", &error_abort);
> +    qdev_prop_set_uint32(DEVICE(soc), "variant", NRF51_VARIANT_AA);
>
>      object_property_set_bool(soc, true, "realized", &error_abort);
>
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -            NRF51_SOC(soc)->flash_size);
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x0=
0);

Hmm. Using 0x00 here doesn't seem ideal.

>  }
>
>
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 441d05e1ef..85bce2c1e0 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -32,15 +32,21 @@
>  #define FLASH_BASE      0x00000000
>  #define SRAM_BASE       0x20000000
>
> -/* The size and base is for the NRF51822 part. If other parts
> - * are supported in the future, add a sub-class of NRF51SoC for
> - * the specific variants */
> -#define NRF51822_FLASH_SIZE     (256 * 1024)
> -#define NRF51822_SRAM_SIZE      (16 * 1024)
> +#define PAGE_SIZE       1024

Page size isn't really an obvious concept for M profile.

You might find the KiB macro in qemu/units.h useful ?

>
>  /* IRQ lines can be derived from peripheral base addresses */
>  #define BASE_TO_IRQ(base) (((base) >> 12) & 0x1F)
>
> +/* RAM and CODE size in number of pages for different NRF51Variants vari=
ants */
> +struct {
> +  hwaddr ram_size;
> +  hwaddr flash_size;
> +} NRF51VariantAttributes[] =3D {
> +        [NRF51_VARIANT_AA] =3D {.ram_size =3D 16, .flash_size =3D 256 },
> +        [NRF51_VARIANT_AB] =3D {.ram_size =3D 16, .flash_size =3D 128 },
> +        [NRF51_VARIANT_AC] =3D {.ram_size =3D 32, .flash_size =3D 256 },
> +};
> +
>  static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      NRF51State *s =3D NRF51_SOC(dev_soc);
> @@ -51,13 +57,21 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
>          return;
>      }
>
> +    if (!(s->part_variant > NRF51_VARIANT_INVALID
> +            && s->part_variant < NRF51_VARIANT_MAX)) {
> +        error_setg(errp, "VARIANT not set or invalid");
> +        return;
> +    }
> +
>      object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "me=
mory",
>              &err);
>      object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
>
>      memory_region_add_subregion_overlap(&s->container, 0, s->board_memor=
y, -1);
>
> -    memory_region_init_ram(&s->flash, OBJECT(s), "nrf51.flash", s->flash=
_size,
> +    /* FLASH */
> +    memory_region_init_ram(&s->flash, NULL, "nrf51_soc.flash",
> +            NRF51VariantAttributes[s->part_variant].flash_size * PAGE_SI=
ZE,
>              &err);
>      if (err) {
>          error_propagate(errp, err);
> @@ -66,7 +80,9 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
>      memory_region_set_readonly(&s->flash, true);
>      memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
>
> -    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &=
err);
> +    /* SRAM */
> +    memory_region_init_ram(&s->sram, NULL, "nrf51_soc.sram",
> +            NRF51VariantAttributes[s->part_variant].ram_size * PAGE_SIZE=
, &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
> @@ -85,17 +101,19 @@ static void nrf51_soc_init(Object *obj)
>      memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX=
);
>
>      object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARMV7M);
> -    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu), &err=
or_abort);
> +    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu),
> +                              &error_abort);
>      qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());
> -    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type", ARM_CPU_TYPE_NAME(=
"cortex-m0"));
> +    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type",
> +                         ARM_CPU_TYPE_NAME("cortex-m0"));

Why have these lines been changed? (Rule of thumb: don't include code
reformatting or style cleanups in the same patch as substantive changes.)

thanks
-- PMM
