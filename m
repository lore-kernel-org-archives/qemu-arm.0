Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2755632wrx;
        Mon, 18 Feb 2019 14:19:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia1q8lQdjEPZRbxcgVn4TG9eJeLVFtV/hUyRCU+sDzatFCh0DgmcQjTtmdA6QJNaeNtuEvm
X-Received: by 2002:a5b:348:: with SMTP id q8mr20444136ybp.479.1550528382062;
        Mon, 18 Feb 2019 14:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550528382; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2UZKkhMcrZ82wvsf1LG3tb5T4Eyo8i7HFHTxDnYRLiT/W5AAA7IKU+N18FocGRTsh
         Qor8NYJVnfEe9IHddreZI7nlG7df8gT2a8wZXyGTJUOU/YA5bkEE4R3q8MdEdDVbc5CL
         A8r3H3rux3uUT+4nqNOVpSSUn45GSN5xDUUNds3tD9rXJw1W5aUKUkop4sbLflWvi+GZ
         ppto86saOX3axgICgI4/dGXwUJaqlOwSeYnV47bHPIvYUg1MVLHV7q72+khWrOeTYav2
         8/AZmyUYtcXInR3M0DGT/KpjCT+SG/o/dJCLbfbgGzCGnSpRp+1DZZJ2sqeWbPv6/J+H
         Skkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=LBPUtfzp7lI/RX8zVvxuYb/3Jz+CROc6OKnQs7VUkNc=;
        b=JuIwk6eSNIY449t3sEe2XtC5Ftjs2j4gwNVHIHPs3gKwMxs51sL6vXePEbgrslOpN/
         e13yX0KUAgNl7hvpDJDwZh4Vkz4aoGODHmnCYTl8fHWGSR/qUnmOg0w+LaJ57j4unijg
         /69VnEZRqCtgFcVF21bepw+N4IB6FI9xurqeXXzrNRJGFCtNWoZtXxIQqgRdzAYtYaA2
         k7C+3v36gzUK0x7GYd+iRhRyoUAE76JgHXo/1bBibCiVHIth0oeQPGEg8qyJwP3uhz4f
         2t+aL5clFQEmBBpQxGfXB/9215LRQPSoZrGLALmaxzQbPvD13pTNZjHHCjaxifYNWu++
         hijw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d184si7896570ybf.417.2019.02.18.14.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 14:19:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvrGH-0000Ro-7U
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 17:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvrBC-0005eE-EO
	for qemu-devel@nongnu.org; Mon, 18 Feb 2019 17:14:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvqx7-00054a-Nm
	for qemu-devel@nongnu.org; Mon, 18 Feb 2019 16:59:54 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51193)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gvqx7-00054B-Gq
	for qemu-devel@nongnu.org; Mon, 18 Feb 2019 16:59:53 -0500
Received: by mail-wm1-f66.google.com with SMTP id x7so565758wmj.0
	for <qemu-devel@nongnu.org>; Mon, 18 Feb 2019 13:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LBPUtfzp7lI/RX8zVvxuYb/3Jz+CROc6OKnQs7VUkNc=;
	b=nA4M4q6H56Dg+KZHFScseF1jSn/ODsLcz1BGPEvWl9a1xngxYa2O67MuB/gElxk0g9
	zYzv/ypu1Z9+quWMIlbGdG8ZVOsG2KSc1DHYS5jEJ6YIr6iVc2AC/grhxn13zF6MACq2
	+QVIwiObJpF33K3M+HMe8UuEC//3WF7ZDvsmTP9WfoyWlmuGtOSswsWqSXiON5CFoNJr
	FQjePGacX35iYP5G3sOADKFIEHyMjDFkfikiWz0fKPdtiy0YicsyhVyWXMGWvU+imVEw
	epbNNxhrUOZ93+6xM0PiLNZlbrC/eWNBa/RdXFbEDU6mUImQMnCwYMF62TVhHG19FhYE
	BvLQ==
X-Gm-Message-State: AHQUAuYMOgK/ciJHJ9jRh2bxCNamTQmm3uArFx1JydJX7i9yc+utPV/B
	Cu8oDnBSMVOuMpzbfrzXIqZ+XQ==
X-Received: by 2002:a1c:b40b:: with SMTP id d11mr600379wmf.80.1550527192499;
	Mon, 18 Feb 2019 13:59:52 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109])
	by smtp.gmail.com with ESMTPSA id c2sm8422723wrt.93.2019.02.18.13.59.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 13:59:51 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2dc24df3-80d4-99ca-891f-31e2f96e5e85@redhat.com>
Date: Mon, 18 Feb 2019 22:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 05/14] hw/char/pl011: Allow use as an
 embedded-struct device
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nOH+4k7jl39E

On 2/14/19 1:50 PM, Peter Maydell wrote:
> Create a new include file for the pl011's device struct,
> type macros, etc, so that it can be instantiated using
> the "embedded struct" coding style.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  include/hw/char/pl011.h | 34 ++++++++++++++++++++++++++++++++++
>  hw/char/pl011.c         | 31 ++-----------------------------
>  2 files changed, 36 insertions(+), 29 deletions(-)
> 
> diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
> index 83649324b6a..1b52bfd5c90 100644
> --- a/include/hw/char/pl011.h
> +++ b/include/hw/char/pl011.h
> @@ -15,6 +15,40 @@
>  #ifndef HW_PL011_H
>  #define HW_PL011_H
>  
> +#include "hw/sysbus.h"
> +#include "chardev/char-fe.h"
> +
> +#define TYPE_PL011 "pl011"
> +#define PL011(obj) OBJECT_CHECK(PL011State, (obj), TYPE_PL011)
> +
> +/* This shares the same struct (and cast macro) as the base pl011 device */
> +#define TYPE_PL011_LUMINARY "pl011_luminary"
> +
> +typedef struct PL011State {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    uint32_t readbuff;
> +    uint32_t flags;
> +    uint32_t lcr;
> +    uint32_t rsr;
> +    uint32_t cr;
> +    uint32_t dmacr;
> +    uint32_t int_enabled;
> +    uint32_t int_level;
> +    uint32_t read_fifo[16];
> +    uint32_t ilpr;
> +    uint32_t ibrd;
> +    uint32_t fbrd;
> +    uint32_t ifl;
> +    int read_pos;
> +    int read_count;
> +    int read_trigger;
> +    CharBackend chr;
> +    qemu_irq irq;
> +    const unsigned char *id;
> +} PL011State;
> +
>  static inline DeviceState *pl011_create(hwaddr addr,
>                                          qemu_irq irq,
>                                          Chardev *chr)
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 2aa277fc4f2..0c4711e4027 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -8,39 +8,12 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/char/pl011.h"
>  #include "hw/sysbus.h"
>  #include "chardev/char-fe.h"
>  #include "qemu/log.h"
>  #include "trace.h"
>  
> -#define TYPE_PL011 "pl011"
> -#define PL011(obj) OBJECT_CHECK(PL011State, (obj), TYPE_PL011)
> -
> -typedef struct PL011State {
> -    SysBusDevice parent_obj;
> -
> -    MemoryRegion iomem;
> -    uint32_t readbuff;
> -    uint32_t flags;
> -    uint32_t lcr;
> -    uint32_t rsr;
> -    uint32_t cr;
> -    uint32_t dmacr;
> -    uint32_t int_enabled;
> -    uint32_t int_level;
> -    uint32_t read_fifo[16];
> -    uint32_t ilpr;
> -    uint32_t ibrd;
> -    uint32_t fbrd;
> -    uint32_t ifl;
> -    int read_pos;
> -    int read_count;
> -    int read_trigger;
> -    CharBackend chr;
> -    qemu_irq irq;
> -    const unsigned char *id;
> -} PL011State;
> -
>  #define PL011_INT_TX 0x20
>  #define PL011_INT_RX 0x10
>  
> @@ -357,7 +330,7 @@ static void pl011_luminary_init(Object *obj)
>  }
>  
>  static const TypeInfo pl011_luminary_info = {
> -    .name          = "pl011_luminary",
> +    .name          = TYPE_PL011_LUMINARY,
>      .parent        = TYPE_PL011,
>      .instance_init = pl011_luminary_init,
>  };
> 
