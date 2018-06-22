Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp864364wrq;
        Fri, 22 Jun 2018 06:59:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf8zMz3BN2tg6FzIPyj26mmBV1xyZP3zHOdDEAsnt63rNt0JYRdsf1+5AD5+FSzM7wN/ewy
X-Received: by 2002:a0c:f905:: with SMTP id v5-v6mr1437832qvn.207.1529675948423;
        Fri, 22 Jun 2018 06:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675948; cv=none;
        d=google.com; s=arc-20160816;
        b=da8K3IE3vDFivoq+hmUndRH6FxORPDx+7TDM8FLoyhXyUXw/LlUPn9ubmGUYb1S8qr
         Uf4pSy2uV7z5HHnmRKAqlFS0f8yRPUoTQgbDKQ+IPDeNB+1Ll4WvH9mM/KM+tT0GS6UF
         eyrkLdehrUp70n0chr0zMtlPJHnQhYOIKU9yC66byfLqN3vPof5XiJu1UnOtQk2YKB/3
         uUUpR+IBUQKNS8TmxH0/DaTDL4/2oSHjAuWFFHBK1fk1ZOI6flvH0UoIvcS3L2dy+vX+
         xf4CHUWv7VyG4jSL6uGPqmDMdkCCY573kOL4Y/Vgkox0Lw/B//ci7tPPTgoQt9PlyV64
         saTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=IAp0MYpLqsB0xMs5MZAAj+IaZlWiyzJOjUkS3mqeJkg=;
        b=hG/NudEVqEmmtIunFme8XR8+5JoPVaVudYinQUIqyB4CRG8m/bL1zrpMN+UiJT9S56
         JtC6HMMU6uCpPf2F1pNfqILx4GwLNb4ZBNXq3aXuklct5jhGxUud8sgJIvbxiG/eI1IT
         Qlf8ooD8AZkjFtY2euoy5fFTaqwZnD526vlTfXmM0r/5A+9oyaEda7DiRFPLcAFpqfxb
         /DVj3VmsmFPbmdsLAv4m+VvHbwGY85FIrZ0/ohl+U/plno1pgN4Q4907smV8ydup9k0u
         zVqfKYXSpj0mCL/yQxbN+aeGF02pqG7hixrQtP8Vp/k91iSaqmkjP7F+mZvb3RrhUzJM
         ctHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=klyLefzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t25-v6si4038834qkl.362.2018.06.22.06.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=klyLefzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMah-000432-OH
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:59:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMQN-0003ot-LM
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:48:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMQJ-00077M-H4
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:48:27 -0400
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:40654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMQJ-00076F-Bq; Fri, 22 Jun 2018 09:48:23 -0400
Received: by mail-qk0-x234.google.com with SMTP id b129-v6so3673053qke.7;
	Fri, 22 Jun 2018 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IAp0MYpLqsB0xMs5MZAAj+IaZlWiyzJOjUkS3mqeJkg=;
	b=klyLefzsEl2HczT2VaEcWJng5F1Q5CgU+4V77mD0GXeaE7MNG8c7GCE5t8vBu6T5+z
	u5ymleO3HSpJrwEO5n6T40uvRx+P+/ecVIU/6ezvKy/MpPoZsm5znOyQ61CG7UHf4Rty
	tUrf9eo9pXWjC7vRfJd3WjrGKbyNX64PmEHloMly1gB4hMclNjSKAP0UuCgwJKFQUGej
	gTaGIXBWNxHOFD0VNlx44K/DGq/VTbe6z/2W/yjqspbXjxAcSXSs+CQlQ7Y5WEZGJ1cd
	OoGpTuZMv/CjQ4xnun7Ae70y3Pg9GB2mD2NfUxzuKpE2kitdOcNXeL2anAkKLASreCzw
	FEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=IAp0MYpLqsB0xMs5MZAAj+IaZlWiyzJOjUkS3mqeJkg=;
	b=aMMqAHM32wNdQuAaopejzLlgTSgzYSD1O9XKOzStk4ZR65B2RO2VtsW5CC7NurU6K8
	r3TpePxwny7Mlz8E0JQunoI9gicLPBBNpYsEEdi2lRlWZZPZCKzmw+bIJAu4hb+aoei0
	a8qZ85NmvcGbMpl4YdLMe9JEPF2FPSIlMmabjAe9ByXeDE/L9yVesE0xvcofKoCIMc1X
	t1p31J9/jczSkulmnm6wzvQZAgIndH3bg8fpLWix7yQ4zWQjpmgbCwbEW60IGZnivomR
	7HFxnuFToj1orPTKHmaqCbMwiQf/bYkGxdG0GOSNINeJCA/N4XyKJ6i1FlpQx1qUCtIi
	e6Xw==
X-Gm-Message-State: APt69E3Sy2nQ+rVODO4F+VEEMpoMTuqc4GMzOJsHsGCYAnPkapHvUx3w
	FdB+JDO65zqJdrjg6+SsOJGwE1iC
X-Received: by 2002:a37:9486:: with SMTP id
	w128-v6mr1360748qkd.119.1529675302601; 
	Fri, 22 Jun 2018 06:48:22 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm6157954qtm.69.2018.06.22.06.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:48:22 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-9-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <31db6cdd-48f6-746e-3c5d-38925b43f81b@amsat.org>
Date: Fri, 22 Jun 2018 10:48:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622134036.23182-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::234
Subject: Re: [Qemu-arm] [PATCH v2 08/14] hw/arm/omap1: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0Be6BYaBhtp

On 06/22/2018 10:40 AM, Philippe Mathieu-Daudé wrote:
> TCMI_VERBOSE is no more used, drop the OMAP_8/16/32B_REG macros.
> 

Oh and eventually:

Suggested-by: Thomas Huth <thuth@redhat.com>

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/omap.h | 18 ------------------
>  hw/arm/omap1.c        | 18 ++++++++++++------
>  2 files changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index b398607b06..39abba753d 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -993,24 +993,6 @@ enum {
>  #define OMAP_GPIOSW_INVERTED	0x0001
>  #define OMAP_GPIOSW_OUTPUT	0x0002
>  
> -# define TCMI_VERBOSE			1
> -
> -# ifdef TCMI_VERBOSE
> -#  define OMAP_8B_REG(paddr)		\
> -        fprintf(stderr, "%s: 8-bit register " OMAP_FMT_plx "\n",	\
> -                        __func__, paddr)
> -#  define OMAP_16B_REG(paddr)		\
> -        fprintf(stderr, "%s: 16-bit register " OMAP_FMT_plx "\n",	\
> -                        __func__, paddr)
> -#  define OMAP_32B_REG(paddr)		\
> -        fprintf(stderr, "%s: 32-bit register " OMAP_FMT_plx "\n",	\
> -                        __func__, paddr)
> -# else
> -#  define OMAP_8B_REG(paddr)
> -#  define OMAP_16B_REG(paddr)
> -#  define OMAP_32B_REG(paddr)
> -# endif
> -
>  # define OMAP_MPUI_REG_MASK		0x000007ff
>  
>  #endif /* hw_omap_h */
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 9af04728e3..539d29ef9c 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -34,12 +34,18 @@
>  #include "qemu/cutils.h"
>  #include "qemu/bcd.h"
>  
> +static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register %#08" HWADDR_PRIx "\n",
> +                  funcname, sz << 2, addr);
> +}
> +
>  /* Should signal the TCMI/GPMC */
>  uint32_t omap_badwidth_read8(void *opaque, hwaddr addr)
>  {
>      uint8_t ret;
>  
> -    OMAP_8B_REG(addr);
> +    omap_log_badwidth(__func__, addr, 1);
>      cpu_physical_memory_read(addr, &ret, 1);
>      return ret;
>  }
> @@ -49,7 +55,7 @@ void omap_badwidth_write8(void *opaque, hwaddr addr,
>  {
>      uint8_t val8 = value;
>  
> -    OMAP_8B_REG(addr);
> +    omap_log_badwidth(__func__, addr, 1);
>      cpu_physical_memory_write(addr, &val8, 1);
>  }
>  
> @@ -57,7 +63,7 @@ uint32_t omap_badwidth_read16(void *opaque, hwaddr addr)
>  {
>      uint16_t ret;
>  
> -    OMAP_16B_REG(addr);
> +    omap_log_badwidth(__func__, addr, 2);
>      cpu_physical_memory_read(addr, &ret, 2);
>      return ret;
>  }
> @@ -67,7 +73,7 @@ void omap_badwidth_write16(void *opaque, hwaddr addr,
>  {
>      uint16_t val16 = value;
>  
> -    OMAP_16B_REG(addr);
> +    omap_log_badwidth(__func__, addr, 2);
>      cpu_physical_memory_write(addr, &val16, 2);
>  }
>  
> @@ -75,7 +81,7 @@ uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
>  {
>      uint32_t ret;
>  
> -    OMAP_32B_REG(addr);
> +    omap_log_badwidth(__func__, addr, 4);
>      cpu_physical_memory_read(addr, &ret, 4);
>      return ret;
>  }
> @@ -83,7 +89,7 @@ uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
>  void omap_badwidth_write32(void *opaque, hwaddr addr,
>                  uint32_t value)
>  {
> -    OMAP_32B_REG(addr);
> +    omap_log_badwidth(__func__, addr, 4);
>      cpu_physical_memory_write(addr, &value, 4);
>  }
>  
> 
