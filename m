Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp289426wru;
        Thu, 26 Jul 2018 21:54:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfKbZWnOA06gvbHPtOVi6oYDlhR57v8lORTUD80+vcIFr8Yj77tyIS9bnux76d2Cx1xf9h7
X-Received: by 2002:ac8:17ee:: with SMTP id r43-v6mr4797692qtk.106.1532667245170;
        Thu, 26 Jul 2018 21:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532667245; cv=none;
        d=google.com; s=arc-20160816;
        b=cRM7O6dquqM1bNIb8lo9+w5X2WhD14vVH5DP25mdPSDO0CI9om1OarMmo70EKYUoyF
         wbhEh0IBkhQtPKaXqiUVWgaKejlDPNURFK5ZV1EO9n/wW4NGPtHNqKyNYfwn1boGlsaT
         MYK0lCffiWbQfdjlTqkajmZXIn8DGWuKqFHok9PZ/SBO6Ygj2gH2K/QmnHK/hbeOA9as
         0d6hRGVs1pQINEC1nibCflWXSiPJtHceNmFYZrVxDU8mNeyjDPYgCDSJR66B2bQpQjyE
         Fib8gxfNCUz+Qemw98+OG1dct30nhrDwoXLa0H7xUuXO5oBeiCPw/T1/KvZCaegzMnjF
         p5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=aulVOOK7CMRbfDB04ISKJYxTRfxcXn+pSc2WmMY+BlQ=;
        b=Ug8iUcgC7BaO9bl1ZXQLOfDKVXTNxNdjAYeZSTLvc3MTm9bKLimtdL5H78bt1KAgsC
         trPPKdXthx6wGc0rtu4mrbQ9+w0cdCuHpa5RBkZnAshXCgP06G4zk9HSOkRZ6MqVmn3Z
         z+YQ1hgV8Tk1U1Qa9G8I5OY9z40G9qDAqC46ehLVl1rYVUIrtiWrNDWnoUHIfNg37+cs
         /6Ws3aKbNpMcyzlJFCYw0sZZQlqFgfF0IMhA+8s5YO3J3nKKrNu2m0KcmHmu186YN1L1
         OBLFKl04beA7u5GKlwLIGw4rqc2Uc6v5YxnqPltnGr7CUDoEYi0bJSzRsJc+WWu6A71P
         K53g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KupCpMxq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f35-v6si682007qvf.94.2018.07.26.21.54.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jul 2018 21:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KupCpMxq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiulQ-00029V-Ks
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 00:54:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiuks-000265-VY
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 00:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiukp-00025Q-OM
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 00:53:31 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:40451)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiuki-00024b-KJ; Fri, 27 Jul 2018 00:53:20 -0400
Received: by mail-ua0-x242.google.com with SMTP id p22-v6so2565898uao.7;
	Thu, 26 Jul 2018 21:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aulVOOK7CMRbfDB04ISKJYxTRfxcXn+pSc2WmMY+BlQ=;
	b=KupCpMxqTs7w9Eb3HMFfNQFSi6xV7sW2MTnr4tYdf4ZEQ8vuRM5ju1qVcBHjF7TpiD
	EYD/LpYwAch3l6eqA0o28ecBCyAoCjr6aZzWlAlm0YUwkqsSMWvfCtzbluAV8Ee/q5l+
	r8kfZAKgCqurC5nRPF166X6S2n+qEBKnHIBiKXha5pfT0k0tU0MNUK5+XNSES7MEhAQm
	paACmQ7RLmyQa2WtbxQFScUWXi8RcGYlMHAO4Vqe/kF2QptibEtOef2KPQK7c8hi4n67
	ggU/tlGvdij11krYKbI7N+F7WWO98QNzUtN15wSOXXVondsSf/GO8Q+dD9UFoEvnL4SX
	v9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=aulVOOK7CMRbfDB04ISKJYxTRfxcXn+pSc2WmMY+BlQ=;
	b=AiyXGZZbETCx3Y3axWYaBrLSxNmk2j2/eSpEVuI7ChdWLrcF3MZuLYeZZIoObX0jGf
	Eari9B19oQaRBSZavNncl0cDBezWZu8YVwOH4VfhBp+M2njrmpTe9TAz+0nyKl4p33ai
	tQF6IRjR/WOd4kpRzfIJj2ai7flgczF3DA0CqNle0KqEMhCZspvdKOTBSzqEI5kl9QbX
	8jJgxOi1z1DAyLthDXLtH12kjyeZ5MBxtYe9qOnEXQrHKyHdrHVhaaHmgyherdS7tasY
	8z8yYKidkjBjhNvC9iZQpEU5BUEGB3g5eQ9FSZT43ApmIO5oe9ygx8vygooxOKfrt2/O
	fNHw==
X-Gm-Message-State: AOUpUlGFDpSNKJOkDhEeVu6di0+G8++mN/Qqnv5z3VS93XiwBTGYB2fd
	750uyFd41r7dHzU0ms404qI=
X-Received: by 2002:ab0:4364:: with SMTP id
	k91-v6mr3450323uak.46.1532667199747; 
	Thu, 26 Jul 2018 21:53:19 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	u22-v6sm920448vkb.0.2018.07.26.21.53.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 21:53:19 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-3-stefanha@redhat.com>
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
Message-ID: <63251874-7110-9870-76d0-cf729afe3416@amsat.org>
Date: Fri, 27 Jul 2018 01:53:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725085944.11856-3-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 2/7] hw/arm: rename
 TYPE_ARMV7M to TYPE_ARM_M_PROFILE
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BEqeO3RhV0O2

On 07/25/2018 05:59 AM, Stefan Hajnoczi wrote:
> The TYPE_ARMV7M class is really a container for an ARM M Profile CPU,
> NVIC, and related pieces.  It can also be used for ARMv6-M and ARMv8-M.
> Rename the class since it is not exclusive to ARMv7-M.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/Makefile.objs                         |   1 -
>  include/hw/arm/{armv7m.h => arm-m-profile.h} |  37 ++-
>  include/hw/arm/iotkit.h                      |   4 +-
>  include/hw/arm/msf2-soc.h                    |   4 +-
>  include/hw/arm/stm32f205_soc.h               |   4 +-
>  hw/arm/arm-m-profile.c                       | 271 +++++++++++++++++
>  hw/arm/armv7m.c                              | 290 -------------------
>  hw/arm/iotkit.c                              |   2 +-
>  hw/arm/mps2-tz.c                             |   1 -
>  hw/arm/mps2.c                                |   6 +-
>  hw/arm/msf2-soc.c                            |   2 +-
>  hw/arm/stellaris.c                           |   4 +-
>  hw/arm/stm32f205_soc.c                       |   2 +-
>  13 files changed, 313 insertions(+), 315 deletions(-)
>  rename include/hw/arm/{armv7m.h => arm-m-profile.h} (65%)
>  delete mode 100644 hw/arm/armv7m.c
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2c43d34c64..b1e4f8f006 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -17,7 +17,6 @@ obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
>  obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
>  
>  obj-$(CONFIG_ARM_M_PROFILE) += arm-m-profile.o
> -obj-$(CONFIG_ARM_V7M) += armv7m.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210.o
>  obj-$(CONFIG_PXA2XX) += pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>  obj-$(CONFIG_DIGIC) += digic.o
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/arm-m-profile.h
> similarity index 65%
> rename from include/hw/arm/armv7m.h
> rename to include/hw/arm/arm-m-profile.h
> index 78308d1484..ea496d9b88 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/arm-m-profile.h
> @@ -1,14 +1,16 @@
>  /*
> - * ARMv7M CPU object
> + * ARM M Profile CPU class
>   *
>   * Copyright (c) 2017 Linaro Ltd
>   * Written by Peter Maydell <peter.maydell@linaro.org>
>   *
> + * Copyright (C) 2018 Red Hat, Inc.
> + *
>   * This code is licensed under the GPL version 2 or later.
>   */
>  
> -#ifndef HW_ARM_ARMV7M_H
> -#define HW_ARM_ARMV7M_H
> +#ifndef HW_ARM_ARM_M_PROFILE_H
> +#define HW_ARM_ARM_M_PROFILE_H
>  
>  #include "hw/sysbus.h"
>  #include "hw/intc/armv7m_nvic.h"
> @@ -28,12 +30,17 @@ typedef struct {
>      MemoryRegion *source_memory;
>  } BitBandState;
>  
> -#define TYPE_ARMV7M "armv7m"
> -#define ARMV7M(obj) OBJECT_CHECK(ARMv7MState, (obj), TYPE_ARMV7M)
> -
>  #define ARMV7M_NUM_BITBANDS 2
>  
> -/* ARMv7M container object.
> +#define TYPE_ARM_M_PROFILE "arm-m-profile"
> +#define ARM_M_PROFILE(obj) OBJECT_CHECK(ARMMProfileState, (obj), \
> +                                        TYPE_ARM_M_PROFILE)
> +#define ARM_M_PROFILE_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(ARMMProfileClass, (klass), TYPE_ARM_M_PROFILE)
> +#define ARM_M_PROFILE_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(ARMMProfileClass, (obj), TYPE_ARM_M_PROFILE)
> +
> +/* ARM M Profile container object.
>   * + Unnamed GPIO input lines: external IRQ lines for the NVIC
>   * + Named GPIO output SYSRESETREQ: signalled for guest AIRCR.SYSRESETREQ
>   * + Property "cpu-type": CPU type to instantiate
> @@ -44,7 +51,7 @@ typedef struct {
>   * + Property "idau": IDAU interface (forwarded to CPU object)
>   * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
>   */
> -typedef struct ARMv7MState {
> +typedef struct {
>      /*< private >*/
>      SysBusDevice parent_obj;
>      /*< public >*/
> @@ -63,6 +70,18 @@ typedef struct ARMv7MState {
>      MemoryRegion *board_memory;
>      Object *idau;
>      uint32_t init_svtor;
> -} ARMv7MState;
> +} ARMMProfileState;
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDeviceClass parent_class;
> +
> +    /*< public >*/
> +    /**
> +     * Initialize the CPU object, for example by setting properties, before it
> +     * gets realized.  May be NULL.
> +     */
> +    void (*cpu_init)(ARMMProfileState *s, Error **errp);
> +} ARMMProfileClass;
>  
>  #endif
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 2cddde55dd..8b672c2b6c 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -51,7 +51,7 @@
>  #define IOTKIT_H
>  
>  #include "hw/sysbus.h"
> -#include "hw/arm/armv7m.h"
> +#include "hw/arm/arm-m-profile.h"
>  #include "hw/misc/iotkit-secctl.h"
>  #include "hw/misc/tz-ppc.h"
>  #include "hw/misc/tz-mpc.h"
> @@ -74,7 +74,7 @@ typedef struct IoTKit {
>      SysBusDevice parent_obj;
>  
>      /*< public >*/
> -    ARMv7MState armv7m;
> +    ARMMProfileState armv7m;
>      IoTKitSecCtl secctl;
>      TZPPC apb_ppc0;
>      TZPPC apb_ppc1;
> diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
> index 3cfe5c76ee..36d47db274 100644
> --- a/include/hw/arm/msf2-soc.h
> +++ b/include/hw/arm/msf2-soc.h
> @@ -25,7 +25,7 @@
>  #ifndef HW_ARM_MSF2_SOC_H
>  #define HW_ARM_MSF2_SOC_H
>  
> -#include "hw/arm/armv7m.h"
> +#include "hw/arm/arm-m-profile.h"
>  #include "hw/timer/mss-timer.h"
>  #include "hw/misc/msf2-sysreg.h"
>  #include "hw/ssi/mss-spi.h"
> @@ -48,7 +48,7 @@ typedef struct MSF2State {
>      SysBusDevice parent_obj;
>      /*< public >*/
>  
> -    ARMv7MState armv7m;
> +    ARMMProfileState armv7m;
>  
>      char *cpu_type;
>      char *part_name;
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
> index 922a733f88..03b2e0a79d 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -31,7 +31,7 @@
>  #include "hw/adc/stm32f2xx_adc.h"
>  #include "hw/or-irq.h"
>  #include "hw/ssi/stm32f2xx_spi.h"
> -#include "hw/arm/armv7m.h"
> +#include "hw/arm/arm-m-profile.h"
>  
>  #define TYPE_STM32F205_SOC "stm32f205-soc"
>  #define STM32F205_SOC(obj) \
> @@ -54,7 +54,7 @@ typedef struct STM32F205State {
>  
>      char *cpu_type;
>  
> -    ARMv7MState armv7m;
> +    ARMMProfileState armv7m;
>  
>      STM32F2XXSyscfgState syscfg;
>      STM32F2XXUsartState usart[STM_NUM_USARTS];
> diff --git a/hw/arm/arm-m-profile.c b/hw/arm/arm-m-profile.c
> index 262706ed62..b7dd2370d4 100644
> --- a/hw/arm/arm-m-profile.c
> +++ b/hw/arm/arm-m-profile.c
> @@ -10,6 +10,8 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/arm/arm-m-profile.h"
> +#include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
> @@ -20,6 +22,244 @@
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
>  
> +/* Bitbanded IO.  Each word corresponds to a single bit.  */
> +
> +/* Get the byte address of the real memory for a bitband access.  */
> +static inline hwaddr bitband_addr(BitBandState *s, hwaddr offset)
> +{
> +    return s->base | (offset & 0x1ffffff) >> 5;
> +}
> +
> +static MemTxResult bitband_read(void *opaque, hwaddr offset,
> +                                uint64_t *data, unsigned size, MemTxAttrs attrs)
> +{
> +    BitBandState *s = opaque;
> +    uint8_t buf[4];
> +    MemTxResult res;
> +    int bitpos, bit;
> +    hwaddr addr;
> +
> +    assert(size <= 4);
> +
> +    /* Find address in underlying memory and round down to multiple of size */
> +    addr = bitband_addr(s, offset) & (-size);
> +    res = address_space_read(&s->source_as, addr, attrs, buf, size);
> +    if (res) {
> +        return res;
> +    }
> +    /* Bit position in the N bytes read... */
> +    bitpos = (offset >> 2) & ((size * 8) - 1);
> +    /* ...converted to byte in buffer and bit in byte */
> +    bit = (buf[bitpos >> 3] >> (bitpos & 7)) & 1;
> +    *data = bit;
> +    return MEMTX_OK;
> +}
> +
> +static MemTxResult bitband_write(void *opaque, hwaddr offset, uint64_t value,
> +                                 unsigned size, MemTxAttrs attrs)
> +{
> +    BitBandState *s = opaque;
> +    uint8_t buf[4];
> +    MemTxResult res;
> +    int bitpos, bit;
> +    hwaddr addr;
> +
> +    assert(size <= 4);
> +
> +    /* Find address in underlying memory and round down to multiple of size */
> +    addr = bitband_addr(s, offset) & (-size);
> +    res = address_space_read(&s->source_as, addr, attrs, buf, size);
> +    if (res) {
> +        return res;
> +    }
> +    /* Bit position in the N bytes read... */
> +    bitpos = (offset >> 2) & ((size * 8) - 1);
> +    /* ...converted to byte in buffer and bit in byte */
> +    bit = 1 << (bitpos & 7);
> +    if (value & 1) {
> +        buf[bitpos >> 3] |= bit;
> +    } else {
> +        buf[bitpos >> 3] &= ~bit;
> +    }
> +    return address_space_write(&s->source_as, addr, attrs, buf, size);
> +}
> +
> +static const MemoryRegionOps bitband_ops = {
> +    .read_with_attrs = bitband_read,
> +    .write_with_attrs = bitband_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 4,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +};
> +
> +static void bitband_init(Object *obj)
> +{
> +    BitBandState *s = BITBAND(obj);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bitband_ops, s,
> +                          "bitband", 0x02000000);
> +    sysbus_init_mmio(dev, &s->iomem);
> +}
> +
> +static void bitband_realize(DeviceState *dev, Error **errp)
> +{
> +    BitBandState *s = BITBAND(dev);
> +
> +    if (!s->source_memory) {
> +        error_setg(errp, "source-memory property not set");
> +        return;
> +    }
> +
> +    address_space_init(&s->source_as, s->source_memory, "bitband-source");
> +}
> +
> +/* Board init.  */
> +
> +static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] = {
> +    0x20000000, 0x40000000
> +};
> +
> +static const hwaddr bitband_output_addr[ARMV7M_NUM_BITBANDS] = {
> +    0x22000000, 0x42000000
> +};
> +
> +static void arm_m_profile_instance_init(Object *obj)
> +{
> +    ARMMProfileState *s = ARM_M_PROFILE(obj);
> +    int i;
> +
> +    /* Can't init the cpu here, we don't yet know which model to use */
> +
> +    memory_region_init(&s->container, obj, "arm-m-profile-container", UINT64_MAX);
> +
> +    sysbus_init_child_obj(obj, "nvnic", &s->nvic, sizeof(s->nvic), TYPE_NVIC);
> +    object_property_add_alias(obj, "num-irq",
> +                              OBJECT(&s->nvic), "num-irq", &error_abort);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> +        sysbus_init_child_obj(obj, "bitband[*]", &s->bitband[i],
> +                              sizeof(s->bitband[i]), TYPE_BITBAND);
> +    }
> +}
> +
> +static void arm_m_profile_realize(DeviceState *dev, Error **errp)
> +{
> +    ARMMProfileState *s = ARM_M_PROFILE(dev);
> +    SysBusDevice *sbd;
> +    Error *err = NULL;
> +    int i;
> +
> +    if (!s->board_memory) {
> +        error_setg(errp, "memory property was not set");
> +        return;
> +    }
> +
> +    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
> +
> +    s->cpu = ARM_CPU(object_new(s->cpu_type));
> +
> +    object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
> +                             &error_abort);
> +    if (object_property_find(OBJECT(s->cpu), "idau", NULL)) {
> +        object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
> +    if (object_property_find(OBJECT(s->cpu), "init-svtor", NULL)) {
> +        object_property_set_uint(OBJECT(s->cpu), s->init_svtor,
> +                                 "init-svtor", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
> +
> +    /* Tell the CPU where the NVIC is; it will fail realize if it doesn't
> +     * have one.
> +     */
> +    s->cpu->env.nvic = &s->nvic;
> +
> +    object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* Note that we must realize the NVIC after the CPU */
> +    object_property_set_bool(OBJECT(&s->nvic), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* Alias the NVIC's input and output GPIOs as our own so the board
> +     * code can wire them up. (We do this in realize because the
> +     * NVIC doesn't create the input GPIO array until realize.)
> +     */
> +    qdev_pass_gpios(DEVICE(&s->nvic), dev, NULL);
> +    qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
> +
> +    /* Wire the NVIC up to the CPU */
> +    sbd = SYS_BUS_DEVICE(&s->nvic);
> +    sysbus_connect_irq(sbd, 0,
> +                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
> +
> +    memory_region_add_subregion(&s->container, 0xe000e000,
> +                                sysbus_mmio_get_region(sbd, 0));
> +
> +    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> +        Object *obj = OBJECT(&s->bitband[i]);
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
> +
> +        object_property_set_int(obj, bitband_input_addr[i], "base", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        object_property_set_link(obj, OBJECT(s->board_memory),
> +                                 "source-memory", &error_abort);
> +        object_property_set_bool(obj, true, "realized", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        memory_region_add_subregion(&s->container, bitband_output_addr[i],
> +                                    sysbus_mmio_get_region(sbd, 0));
> +    }
> +}
> +
> +static Property arm_m_profile_properties[] = {
> +    DEFINE_PROP_STRING("cpu-type", ARMMProfileState, cpu_type),
> +    DEFINE_PROP_LINK("memory", ARMMProfileState, board_memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_LINK("idau", ARMMProfileState, idau,
> +                     TYPE_IDAU_INTERFACE, Object *),
> +    DEFINE_PROP_UINT32("init-svtor", ARMMProfileState, init_svtor, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void arm_m_profile_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = arm_m_profile_realize;
> +    dc->props = arm_m_profile_properties;
> +}
> +
> +static const TypeInfo arm_m_profile_info = {
> +    .name = TYPE_ARM_M_PROFILE,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(ARMMProfileState),
> +    .instance_init = arm_m_profile_instance_init,
> +    .class_init = arm_m_profile_class_init,
> +};
> +
>  static void arm_m_profile_reset(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
> @@ -79,3 +319,34 @@ void arm_m_profile_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem
>       */
>      qemu_register_reset(arm_m_profile_reset, cpu);
>  }
> +
> +static Property bitband_properties[] = {
> +    DEFINE_PROP_UINT32("base", BitBandState, base, 0),
> +    DEFINE_PROP_LINK("source-memory", BitBandState, source_memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void bitband_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = bitband_realize;
> +    dc->props = bitband_properties;
> +}
> +
> +static const TypeInfo bitband_info = {
> +    .name          = TYPE_BITBAND,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BitBandState),
> +    .instance_init = bitband_init,
> +    .class_init    = bitband_class_init,
> +};
> +
> +static void arm_m_profile_register_types(void)
> +{
> +    type_register_static(&bitband_info);
> +    type_register_static(&arm_m_profile_info);
> +}
> +
> +type_init(arm_m_profile_register_types)
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> deleted file mode 100644
> index 7405a1ec69..0000000000
> --- a/hw/arm/armv7m.c
> +++ /dev/null
> @@ -1,290 +0,0 @@
> -/*
> - * ARMV7M System emulation.
> - *
> - * Copyright (c) 2006-2007 CodeSourcery.
> - * Written by Paul Brook
> - *
> - * This code is licensed under the GPL.
> - */
> -
> -#include "qemu/osdep.h"
> -#include "hw/arm/armv7m.h"
> -#include "qapi/error.h"
> -#include "qemu-common.h"
> -#include "cpu.h"
> -#include "hw/sysbus.h"
> -#include "hw/arm/arm.h"
> -#include "hw/loader.h"
> -#include "elf.h"
> -#include "sysemu/qtest.h"
> -#include "qemu/error-report.h"
> -#include "exec/address-spaces.h"
> -#include "target/arm/idau.h"
> -
> -/* Bitbanded IO.  Each word corresponds to a single bit.  */
> -
> -/* Get the byte address of the real memory for a bitband access.  */
> -static inline hwaddr bitband_addr(BitBandState *s, hwaddr offset)
> -{
> -    return s->base | (offset & 0x1ffffff) >> 5;
> -}
> -
> -static MemTxResult bitband_read(void *opaque, hwaddr offset,
> -                                uint64_t *data, unsigned size, MemTxAttrs attrs)
> -{
> -    BitBandState *s = opaque;
> -    uint8_t buf[4];
> -    MemTxResult res;
> -    int bitpos, bit;
> -    hwaddr addr;
> -
> -    assert(size <= 4);
> -
> -    /* Find address in underlying memory and round down to multiple of size */
> -    addr = bitband_addr(s, offset) & (-size);
> -    res = address_space_read(&s->source_as, addr, attrs, buf, size);
> -    if (res) {
> -        return res;
> -    }
> -    /* Bit position in the N bytes read... */
> -    bitpos = (offset >> 2) & ((size * 8) - 1);
> -    /* ...converted to byte in buffer and bit in byte */
> -    bit = (buf[bitpos >> 3] >> (bitpos & 7)) & 1;
> -    *data = bit;
> -    return MEMTX_OK;
> -}
> -
> -static MemTxResult bitband_write(void *opaque, hwaddr offset, uint64_t value,
> -                                 unsigned size, MemTxAttrs attrs)
> -{
> -    BitBandState *s = opaque;
> -    uint8_t buf[4];
> -    MemTxResult res;
> -    int bitpos, bit;
> -    hwaddr addr;
> -
> -    assert(size <= 4);
> -
> -    /* Find address in underlying memory and round down to multiple of size */
> -    addr = bitband_addr(s, offset) & (-size);
> -    res = address_space_read(&s->source_as, addr, attrs, buf, size);
> -    if (res) {
> -        return res;
> -    }
> -    /* Bit position in the N bytes read... */
> -    bitpos = (offset >> 2) & ((size * 8) - 1);
> -    /* ...converted to byte in buffer and bit in byte */
> -    bit = 1 << (bitpos & 7);
> -    if (value & 1) {
> -        buf[bitpos >> 3] |= bit;
> -    } else {
> -        buf[bitpos >> 3] &= ~bit;
> -    }
> -    return address_space_write(&s->source_as, addr, attrs, buf, size);
> -}
> -
> -static const MemoryRegionOps bitband_ops = {
> -    .read_with_attrs = bitband_read,
> -    .write_with_attrs = bitband_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -    .impl.min_access_size = 1,
> -    .impl.max_access_size = 4,
> -    .valid.min_access_size = 1,
> -    .valid.max_access_size = 4,
> -};
> -
> -static void bitband_init(Object *obj)
> -{
> -    BitBandState *s = BITBAND(obj);
> -    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> -
> -    memory_region_init_io(&s->iomem, obj, &bitband_ops, s,
> -                          "bitband", 0x02000000);
> -    sysbus_init_mmio(dev, &s->iomem);
> -}
> -
> -static void bitband_realize(DeviceState *dev, Error **errp)
> -{
> -    BitBandState *s = BITBAND(dev);
> -
> -    if (!s->source_memory) {
> -        error_setg(errp, "source-memory property not set");
> -        return;
> -    }
> -
> -    address_space_init(&s->source_as, s->source_memory, "bitband-source");
> -}
> -
> -/* Board init.  */
> -
> -static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] = {
> -    0x20000000, 0x40000000
> -};
> -
> -static const hwaddr bitband_output_addr[ARMV7M_NUM_BITBANDS] = {
> -    0x22000000, 0x42000000
> -};
> -
> -static void armv7m_instance_init(Object *obj)
> -{
> -    ARMv7MState *s = ARMV7M(obj);
> -    int i;
> -
> -    /* Can't init the cpu here, we don't yet know which model to use */
> -
> -    memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
> -
> -    sysbus_init_child_obj(obj, "nvnic", &s->nvic, sizeof(s->nvic), TYPE_NVIC);
> -    object_property_add_alias(obj, "num-irq",
> -                              OBJECT(&s->nvic), "num-irq", &error_abort);
> -
> -    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> -        sysbus_init_child_obj(obj, "bitband[*]", &s->bitband[i],
> -                              sizeof(s->bitband[i]), TYPE_BITBAND);
> -    }
> -}
> -
> -static void armv7m_realize(DeviceState *dev, Error **errp)
> -{
> -    ARMv7MState *s = ARMV7M(dev);
> -    SysBusDevice *sbd;
> -    Error *err = NULL;
> -    int i;
> -
> -    if (!s->board_memory) {
> -        error_setg(errp, "memory property was not set");
> -        return;
> -    }
> -
> -    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
> -
> -    s->cpu = ARM_CPU(object_new(s->cpu_type));
> -
> -    object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
> -                             &error_abort);
> -    if (object_property_find(OBJECT(s->cpu), "idau", NULL)) {
> -        object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
> -        if (err != NULL) {
> -            error_propagate(errp, err);
> -            return;
> -        }
> -    }
> -    if (object_property_find(OBJECT(s->cpu), "init-svtor", NULL)) {
> -        object_property_set_uint(OBJECT(s->cpu), s->init_svtor,
> -                                 "init-svtor", &err);
> -        if (err != NULL) {
> -            error_propagate(errp, err);
> -            return;
> -        }
> -    }
> -
> -    /* Tell the CPU where the NVIC is; it will fail realize if it doesn't
> -     * have one.
> -     */
> -    s->cpu->env.nvic = &s->nvic;
> -
> -    object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
> -    if (err != NULL) {
> -        error_propagate(errp, err);
> -        return;
> -    }
> -
> -    /* Note that we must realize the NVIC after the CPU */
> -    object_property_set_bool(OBJECT(&s->nvic), true, "realized", &err);
> -    if (err != NULL) {
> -        error_propagate(errp, err);
> -        return;
> -    }
> -
> -    /* Alias the NVIC's input and output GPIOs as our own so the board
> -     * code can wire them up. (We do this in realize because the
> -     * NVIC doesn't create the input GPIO array until realize.)
> -     */
> -    qdev_pass_gpios(DEVICE(&s->nvic), dev, NULL);
> -    qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
> -
> -    /* Wire the NVIC up to the CPU */
> -    sbd = SYS_BUS_DEVICE(&s->nvic);
> -    sysbus_connect_irq(sbd, 0,
> -                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
> -
> -    memory_region_add_subregion(&s->container, 0xe000e000,
> -                                sysbus_mmio_get_region(sbd, 0));
> -
> -    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> -        Object *obj = OBJECT(&s->bitband[i]);
> -        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
> -
> -        object_property_set_int(obj, bitband_input_addr[i], "base", &err);
> -        if (err != NULL) {
> -            error_propagate(errp, err);
> -            return;
> -        }
> -        object_property_set_link(obj, OBJECT(s->board_memory),
> -                                 "source-memory", &error_abort);
> -        object_property_set_bool(obj, true, "realized", &err);
> -        if (err != NULL) {
> -            error_propagate(errp, err);
> -            return;
> -        }
> -
> -        memory_region_add_subregion(&s->container, bitband_output_addr[i],
> -                                    sysbus_mmio_get_region(sbd, 0));
> -    }
> -}
> -
> -static Property armv7m_properties[] = {
> -    DEFINE_PROP_STRING("cpu-type", ARMv7MState, cpu_type),
> -    DEFINE_PROP_LINK("memory", ARMv7MState, board_memory, TYPE_MEMORY_REGION,
> -                     MemoryRegion *),
> -    DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Object *),
> -    DEFINE_PROP_UINT32("init-svtor", ARMv7MState, init_svtor, 0),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void armv7m_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    dc->realize = armv7m_realize;
> -    dc->props = armv7m_properties;
> -}
> -
> -static const TypeInfo armv7m_info = {
> -    .name = TYPE_ARMV7M,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(ARMv7MState),
> -    .instance_init = armv7m_instance_init,
> -    .class_init = armv7m_class_init,
> -};
> -
> -static Property bitband_properties[] = {
> -    DEFINE_PROP_UINT32("base", BitBandState, base, 0),
> -    DEFINE_PROP_LINK("source-memory", BitBandState, source_memory,
> -                     TYPE_MEMORY_REGION, MemoryRegion *),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void bitband_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    dc->realize = bitband_realize;
> -    dc->props = bitband_properties;
> -}
> -
> -static const TypeInfo bitband_info = {
> -    .name          = TYPE_BITBAND,
> -    .parent        = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(BitBandState),
> -    .instance_init = bitband_init,
> -    .class_init    = bitband_class_init,
> -};
> -
> -static void armv7m_register_types(void)
> -{
> -    type_register_static(&bitband_info);
> -    type_register_static(&armv7m_info);
> -}
> -
> -type_init(armv7m_register_types)
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index c76d3ed743..bdf854c8b2 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -111,7 +111,7 @@ static void iotkit_init(Object *obj)
>      memory_region_init(&s->container, obj, "iotkit-container", UINT64_MAX);
>  
>      sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> -                          TYPE_ARMV7M);
> +                          TYPE_ARM_M_PROFILE);
>      qdev_prop_set_string(DEVICE(&s->armv7m), "cpu-type",
>                           ARM_CPU_TYPE_NAME("cortex-m33"));
>  
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index af10ee0cc9..114632c94b 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -34,7 +34,6 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/arm.h"
> -#include "hw/arm/armv7m.h"
>  #include "hw/or-irq.h"
>  #include "hw/boards.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index bcc7070104..912e1297d5 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -26,7 +26,7 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/arm.h"
> -#include "hw/arm/armv7m.h"
> +#include "hw/arm/arm-m-profile.h"
>  #include "hw/or-irq.h"
>  #include "hw/boards.h"
>  #include "exec/address-spaces.h"
> @@ -52,7 +52,7 @@ typedef struct {
>  typedef struct {
>      MachineState parent;
>  
> -    ARMv7MState armv7m;
> +    ARMMProfileState armv7m;
>      MemoryRegion psram;
>      MemoryRegion ssram1;
>      MemoryRegion ssram1_m;
> @@ -172,7 +172,7 @@ static void mps2_common_init(MachineState *machine)
>          g_assert_not_reached();
>      }
>  
> -    object_initialize(&mms->armv7m, sizeof(mms->armv7m), TYPE_ARMV7M);
> +    object_initialize(&mms->armv7m, sizeof(mms->armv7m), TYPE_ARM_M_PROFILE);
>      armv7m = DEVICE(&mms->armv7m);
>      qdev_set_parent_bus(armv7m, sysbus_get_default());
>      switch (mmc->fpga_type) {
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index dbefade644..09cdc61f44 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -69,7 +69,7 @@ static void m2sxxx_soc_initfn(Object *obj)
>      int i;
>  
>      sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> -                          TYPE_ARMV7M);
> +                          TYPE_ARM_M_PROFILE);
>  
>      sysbus_init_child_obj(obj, "sysreg", &s->sysreg, sizeof(s->sysreg),
>                            TYPE_MSF2_SYSREG);
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 68e52367c0..42785f5bd1 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -20,7 +20,7 @@
>  #include "qemu/log.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> -#include "hw/arm/armv7m.h"
> +#include "hw/arm/arm-m-profile.h"
>  #include "hw/char/pl011.h"
>  #include "hw/misc/unimp.h"
>  #include "cpu.h"
> @@ -1301,7 +1301,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>                             &error_fatal);
>      memory_region_add_subregion(system_memory, 0x20000000, sram);
>  
> -    nvic = qdev_create(NULL, TYPE_ARMV7M);
> +    nvic = qdev_create(NULL, TYPE_ARM_M_PROFILE);
>      qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
>      qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
>      object_property_set_link(OBJECT(nvic), OBJECT(get_system_memory()),
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index c486d06a8b..7de1474ade 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -50,7 +50,7 @@ static void stm32f205_soc_initfn(Object *obj)
>      int i;
>  
>      sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> -                          TYPE_ARMV7M);
> +                          TYPE_ARM_M_PROFILE);
>  
>      sysbus_init_child_obj(obj, "syscfg", &s->syscfg, sizeof(s->syscfg),
>                            TYPE_STM32F2XX_SYSCFG);
> 
