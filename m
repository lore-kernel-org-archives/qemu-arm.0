Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp289036wru;
        Thu, 26 Jul 2018 21:53:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdxba/D9I1Vfsxu+AACnKiYx+mHENFlq7oVI56a25cm+G+FEZgD5s4ObEtFXpKoo30N/ZoC
X-Received: by 2002:a0c:85a3:: with SMTP id o32-v6mr4341025qva.62.1532667202637;
        Thu, 26 Jul 2018 21:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532667202; cv=none;
        d=google.com; s=arc-20160816;
        b=sueR7P//qlLzkTUTjIW7Qjd7bWUxiJKu2WJSytPNwc0faWWjwn48yyGRMORIMrHBQ8
         5TKlJ63JczogXd3wibkuJyil3BhKrhvYkRKavAsxKzwOWF0kJPKtfmx0dmpBPJsjMgbu
         SuUFL8hp6x/8zJ+hpP5R2M2y5HlAEHhjRnaTZoSqz2XMBzzEkG22os9GHauFEOv61zgr
         KeLVvXBCRFSmzmOrcT9bmDN2UISremaPGx4orlXsQfS3X0yQqzksInrgXSl4nErwFLR6
         3hQ4CCMZqRi9tJlWwxma149jLtWJQ2tbRKuV6G306kIkkSbhFlCfIXX7hJjSyks8TbeG
         BvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=eKmv+TfA7z9jxnr81jGTH3o25snvPWuAR1SAHLJujQw=;
        b=w7W2qGB6mx8UdHQahAzGWIEzq8zBcAQkXQzs5DkwcfOh708mHZQwcP7ARPX0XoFCAH
         k4VthEoxRGntySUwZ4vqLJ4NglLbp1nWyYzRAjm7B98YqY9NA7DndzG3sBHxWBOY430J
         GH+9dylTwsoGaGZ35TJ1ObIZ2pFp/BvVxzSmy7DvaFyw1amxvuGPvUPbfIzZl4A9PMSW
         1Sc8R4x3eVC42gvT+NdLcgVF2u4X3Iau9Z3EQOGvBsZF9OxNU0pAzRx8T8diACO09vlq
         pfTaIrVfcxHo9kOZCgie/8+0BKXNr0+xTwVVEy3JUV1PS1nfy4M68vadglhk7Tdr+iTe
         DaSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ltCuy6HC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w38-v6si3178417qtk.68.2018.07.26.21.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jul 2018 21:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ltCuy6HC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiukk-0001q8-3W
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 00:53:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiukW-0001nL-1R
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 00:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiukS-0001wI-Uo
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 00:53:08 -0400
Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243]:39551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiukS-0001w9-Np; Fri, 27 Jul 2018 00:53:04 -0400
Received: by mail-ua0-x243.google.com with SMTP id g18-v6so2565426uam.6;
	Thu, 26 Jul 2018 21:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eKmv+TfA7z9jxnr81jGTH3o25snvPWuAR1SAHLJujQw=;
	b=ltCuy6HCeQrpCoixtXle2swQa3u5wMx+BjekuQpfz9xrnp1KzpnSQGqxCsZhsdeMAs
	SRi3MNHLx+i2+/gcWIrmRIrHAceki5liCLDCV4QZZYjhYqGBFvivZaNbaASnqboz6DIB
	8WEhAOT2mShaVwzbS4YBE87w/XLM/Yd3tPAg6fx6V7x9sGPtSDAWSd0l4C5CrhtqPzXl
	3OZjxvo2UEi3WT1z0O3uNZ4VKQZ325Ierlf/VYDKaebgf/u/kAJ+BAj9v1phWahBf3Av
	wuDfbCxOSOEXmQqUDVCB+GHuwnJfe2qj9sy3zGTeKjDCre8Zt4RjS+1/rUb2vFW9ZeIp
	4qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=eKmv+TfA7z9jxnr81jGTH3o25snvPWuAR1SAHLJujQw=;
	b=Xef2+2rNKovnCFrdbza0Kq9h5v7uK7sFTCkRipA3KzCfLfE0ZRoYKxoOWJg3Fw4601
	RsAva3clFrhl7elEVIGvzzTdaiOtsKz7ZqqT3NZgUXr/1qv9ZG3ZJ3Oa1dSdSu/IYM1g
	1Drm/HEk3VfbGHjgK8LPP3j7oryAhyFb/kqfT5TT33WHcfeZhomi79iCG1EEBUt+wtTY
	9AaSTkvE8rfW0wdKs6lPrZxHzMbdU0E7W4f9sKm9veQBY2J4g3skdYkQgWjcbozmsa7a
	a905lit0fajZOfAbGB5iEwDGgUK3256XIyDGqB5zYariiMmQXCFGkQlNqu2fSjhrSc2g
	nshg==
X-Gm-Message-State: AOUpUlGGB0gep+D+WyTeBbwywpbo2SU/uPH5RstvW9jXVddTZpI4HxL6
	kP/QTMgqI7RMYKmM3sx4HnY=
X-Received: by 2002:ab0:3141:: with SMTP id
	e1-v6mr3165521uam.121.1532667183989; 
	Thu, 26 Jul 2018 21:53:03 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e185-v6sm921784vkd.15.2018.07.26.21.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 21:53:03 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <2b05f695-385f-3631-4735-b5f015540abd@amsat.org>
Date: Fri, 27 Jul 2018 01:52:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725085944.11856-2-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::243
Subject: Re: [Qemu-arm] [PATCH v3 1/7] hw/arm: rename armv7m_load_kernel()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fsPMVRKoVY72

On 07/25/2018 05:59 AM, Stefan Hajnoczi wrote:
> ARMv6-M and ARMv8-M need the same kernel loading functionality as
> ARMv7-M.  Rename armv7m_load_kernel() to arm_m_profile_load_kernel() so
> it's clear that this function isn't specific to ARMv7-M.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/Makefile.objs            |  1 +
>  include/hw/arm/arm.h            | 11 +++--
>  hw/arm/arm-m-profile.c          | 81 +++++++++++++++++++++++++++++++++
>  hw/arm/armv7m.c                 | 60 ------------------------
>  hw/arm/mps2-tz.c                |  3 +-
>  hw/arm/mps2.c                   |  4 +-
>  hw/arm/msf2-som.c               |  4 +-
>  hw/arm/netduino2.c              |  4 +-
>  hw/arm/stellaris.c              |  3 +-
>  default-configs/arm-softmmu.mak |  1 +
>  10 files changed, 99 insertions(+), 73 deletions(-)
>  create mode 100644 hw/arm/arm-m-profile.c
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index d51fcecaf2..2c43d34c64 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -16,6 +16,7 @@ obj-$(CONFIG_STRONGARM) += collie.o
>  obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
>  obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
>  
> +obj-$(CONFIG_ARM_M_PROFILE) += arm-m-profile.o
>  obj-$(CONFIG_ARM_V7M) += armv7m.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210.o
>  obj-$(CONFIG_PXA2XX) += pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index ffed39252d..2b919e57ee 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -24,16 +24,17 @@ typedef enum {
>  } arm_endianness;
>  
>  /**
> - * armv7m_load_kernel:
> + * arm_m_profile_load_kernel:
>   * @cpu: CPU
>   * @kernel_filename: file to load
> - * @mem_size: mem_size: maximum image size to load
> + * @mem_size: maximum image size to load
>   *
> - * Load the guest image for an ARMv7M system. This must be called by
> - * any ARMv7M board. (This is necessary to ensure that the CPU resets
> + * Load the guest image for an ARM M Profile system. This must be called by
> + * any ARM M Profile board. (This is necessary to ensure that the CPU resets
>   * correctly on system reset, as well as for kernel loading.)
>   */
> -void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
> +void arm_m_profile_load_kernel(ARMCPU *cpu, const char *kernel_filename,
> +                               int mem_size);
>  
>  /* arm_boot.c */
>  struct arm_boot_info {
> diff --git a/hw/arm/arm-m-profile.c b/hw/arm/arm-m-profile.c
> new file mode 100644
> index 0000000000..262706ed62
> --- /dev/null
> +++ b/hw/arm/arm-m-profile.c
> @@ -0,0 +1,81 @@
> +/*
> + * ARM M Profile System emulation.
> + *
> + * Copyright (C) 2018 Red Hat, Inc.
> + *
> + * Copyright (c) 2006-2007 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GPL.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "cpu.h"
> +#include "hw/sysbus.h"
> +#include "hw/arm/arm.h"
> +#include "hw/loader.h"
> +#include "elf.h"
> +#include "sysemu/qtest.h"
> +#include "qemu/error-report.h"
> +#include "exec/address-spaces.h"
> +
> +static void arm_m_profile_reset(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +
> +    cpu_reset(CPU(cpu));
> +}
> +
> +void arm_m_profile_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
> +{
> +    int image_size;
> +    uint64_t entry;
> +    uint64_t lowaddr;
> +    int big_endian;
> +    AddressSpace *as;
> +    int asidx;
> +    CPUState *cs = CPU(cpu);
> +
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    big_endian = 1;
> +#else
> +    big_endian = 0;
> +#endif
> +
> +    if (!kernel_filename && !qtest_enabled()) {
> +        error_report("Guest image must be specified (using -kernel)");
> +        exit(1);
> +    }
> +
> +    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
> +        asidx = ARMASIdx_S;
> +    } else {
> +        asidx = ARMASIdx_NS;
> +    }
> +    as = cpu_get_address_space(cs, asidx);
> +
> +    if (kernel_filename) {
> +        image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
> +                                 NULL, big_endian, EM_ARM, 1, 0, as);
> +        if (image_size < 0) {
> +            image_size = load_image_targphys_as(kernel_filename, 0,
> +                                                mem_size, as);
> +            lowaddr = 0;
> +        }
> +        if (image_size < 0) {
> +            error_report("Could not load kernel '%s'", kernel_filename);
> +            exit(1);
> +        }
> +    }
> +
> +    /* CPU objects (unlike devices) are not automatically reset on system
> +     * reset, so we must always register a handler to do so. Unlike
> +     * A-profile CPUs, we don't need to do anything special in the
> +     * handler to arrange that it starts correctly.
> +     * This is arguably the wrong place to do this, but it matches the
> +     * way A-profile does it. Note that this means that every M profile
> +     * board must call this function!
> +     */
> +    qemu_register_reset(arm_m_profile_reset, cpu);
> +}
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 6b07666057..7405a1ec69 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -258,66 +258,6 @@ static const TypeInfo armv7m_info = {
>      .class_init = armv7m_class_init,
>  };
>  
> -static void armv7m_reset(void *opaque)
> -{
> -    ARMCPU *cpu = opaque;
> -
> -    cpu_reset(CPU(cpu));
> -}
> -
> -void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
> -{
> -    int image_size;
> -    uint64_t entry;
> -    uint64_t lowaddr;
> -    int big_endian;
> -    AddressSpace *as;
> -    int asidx;
> -    CPUState *cs = CPU(cpu);
> -
> -#ifdef TARGET_WORDS_BIGENDIAN
> -    big_endian = 1;
> -#else
> -    big_endian = 0;
> -#endif
> -
> -    if (!kernel_filename && !qtest_enabled()) {
> -        error_report("Guest image must be specified (using -kernel)");
> -        exit(1);
> -    }
> -
> -    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
> -        asidx = ARMASIdx_S;
> -    } else {
> -        asidx = ARMASIdx_NS;
> -    }
> -    as = cpu_get_address_space(cs, asidx);
> -
> -    if (kernel_filename) {
> -        image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
> -                                 NULL, big_endian, EM_ARM, 1, 0, as);
> -        if (image_size < 0) {
> -            image_size = load_image_targphys_as(kernel_filename, 0,
> -                                                mem_size, as);
> -            lowaddr = 0;
> -        }
> -        if (image_size < 0) {
> -            error_report("Could not load kernel '%s'", kernel_filename);
> -            exit(1);
> -        }
> -    }
> -
> -    /* CPU objects (unlike devices) are not automatically reset on system
> -     * reset, so we must always register a handler to do so. Unlike
> -     * A-profile CPUs, we don't need to do anything special in the
> -     * handler to arrange that it starts correctly.
> -     * This is arguably the wrong place to do this, but it matches the
> -     * way A-profile does it. Note that this means that every M profile
> -     * board must call this function!
> -     */
> -    qemu_register_reset(armv7m_reset, cpu);
> -}
> -
>  static Property bitband_properties[] = {
>      DEFINE_PROP_UINT32("base", BitBandState, base, 0),
>      DEFINE_PROP_LINK("source-memory", BitBandState, source_memory,
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 22180c56fb..af10ee0cc9 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -487,7 +487,8 @@ static void mps2tz_common_init(MachineState *machine)
>  
>      create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
>  
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                              0x400000);
>  }
>  
>  static void mps2tz_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index c3946da317..bcc7070104 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -315,8 +315,8 @@ static void mps2_common_init(MachineState *machine)
>  
>      system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>  
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       0x400000);
> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                              0x400000);
>  }
>  
>  static void mps2_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index 2432b5e935..cb21ced472 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -91,8 +91,8 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
>      cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
>  
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       soc->envm_size);
> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                              soc->envm_size);
>  }
>  
>  static void emcraft_sf2_machine_init(MachineClass *mc)
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index f936017d4a..e18d377f94 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -37,8 +37,8 @@ static void netduino2_init(MachineState *machine)
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
>      object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
>  
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       FLASH_SIZE);
> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                              FLASH_SIZE);
>  }
>  
>  static void netduino2_machine_init(MachineClass *mc)
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index dc521b4a5a..68e52367c0 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1440,7 +1440,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
>      create_unimplemented_device("flash-control", 0x400fd000, 0x1000);
>  
> -    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, flash_size);
> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename,
> +                              flash_size);
>  }
>  
>  /* FIXME: Figure out how to generate these from stellaris_boards.  */
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 834d45cfaf..e704cb6e34 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -48,6 +48,7 @@ CONFIG_ARM11MPCORE=y
>  CONFIG_A9MPCORE=y
>  CONFIG_A15MPCORE=y
>  
> +CONFIG_ARM_M_PROFILE=y
>  CONFIG_ARM_V7M=y
>  CONFIG_NETDUINO2=y
>  
> 
