Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2595572wru;
        Thu, 9 Aug 2018 20:32:05 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPy/c2ddwoZ/wvGMEwdiv1EcxyJXmG1k49eHDpLS/B+LHUMN/XHuIyZZEFFCuz7KH9zPwjjn
X-Received: by 2002:ac8:34c2:: with SMTP id x2-v6mr4948249qtb.112.1533871925815;
        Thu, 09 Aug 2018 20:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533871925; cv=none;
        d=google.com; s=arc-20160816;
        b=uqHtc+llBXp8Vq5dvHAGHeEYicBbXz0M5X4JSrTM8QeWcppJP6m0rnsFVQBRo3iWfl
         M6sn2kTdd1wmSLbNM+b/N3XYeSrDdiPLNh7dpnQKgNPIDpWZupu0BRQysH25QgV+RYWV
         IS0kVI4wVyE5kBvc54OaMxUdvk/t1SAmnQXFjXXYB7xk51kgkl9EzOWJ0mZ86I/iG54H
         5XLTkP96bEytwv+EEtZCMYA/VoggU1fftMHtAtWsHr/gv07oKwXEBkSAAztBfatgAfVm
         NqOVw8Reaf0CRCHBUDxvKJy57EbqGTIV+S0UA1mmsO/NRafzrkBFBEIwDZ6+Tc5tEh9+
         WoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=KNn7BJITRy+ikWeh9opAV4NNeTgVQJSS9ya+F3M4lvU=;
        b=kEhjcUx9d4wBsHOec6VDujJog7UMOYMAEjgMhhthtYRWrQ+zteml+99T9eTbh6e2WK
         ap8wK65didc7QTCFgKRxY3H5huiUDspfMnWav50EXa8TgeshQWci4GTGPOnHMAfTQvni
         p0j8a38MekbZNZZfBqZ+nVmVyhFk1kV2t8E386DSRA/5UG4pnBxZKDv9Az9CpRoPMAK7
         KvxI3KkX2lTvlM6LPblVt5bzr5vfJLZohElBZDgQ0GTKR3pS2Xv+g5qHZEzQT5CupYEv
         PH9otoDrv1XU/5/cfceBo9Keuf0JWBLfurA9PhC/6QJjf3qeT9+Grvi5BXa9wDAyVPe3
         JVlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R4iH8IKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f53-v6si2302600qta.336.2018.08.09.20.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 20:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R4iH8IKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fny9l-0003uW-50
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 23:32:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fny9Y-0003th-Gs
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fny9V-00076q-9Q
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:31:52 -0400
Received: from mail-yw1-xc35.google.com ([2607:f8b0:4864:20::c35]:44017)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fny9V-00076H-28; Thu, 09 Aug 2018 23:31:49 -0400
Received: by mail-yw1-xc35.google.com with SMTP id l189-v6so7567922ywb.10;
	Thu, 09 Aug 2018 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KNn7BJITRy+ikWeh9opAV4NNeTgVQJSS9ya+F3M4lvU=;
	b=R4iH8IKvlsn34WiR8JT6KHulUO8gtGWaIoS5UD2ZbHNRudQHZsNUoTG+aZEZnWXBcx
	xdZ22+uHociSt+HNMarZJtINOUCUUa+WaJdabMMAk1iccSvV/FIsT5Ey6coARkhxsW7k
	7KFOdUz/Ph5x7mzZSbDvi5ngOWejZsdD22WAZE8tO0UujozN1afhA2DgWlhrC5aMH44B
	8C5/IXaMmJrVgW3HVh4Vw9TT9e4KNu6Ybz0eh6LlTyTO/rc86GCS1CbtpB9EvHoaFzvg
	ceGDJCWPxMJImX09I/BoD1qiyEGRg+DOMjYD3NDxNi8FiBMHJntdhL6uxsIKlEgzQ4us
	q9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KNn7BJITRy+ikWeh9opAV4NNeTgVQJSS9ya+F3M4lvU=;
	b=n/vb7h1eaY3nj3PIUTr8SOOHv4xkVLD1DvPmgTIUSEGdQvymqF2y9rw0WOAk4sVXLF
	HIOYGtOPLmtNq2abcb9ECvuXotfCV6Vr8QH3lF8IKGog35o8xSYkEyCNxB3OHF4CozGI
	Gk2xAQFeFusa/e4hcB2w+wQQMSV3N9nEfCimV+6rjJxJNR6ntD85hIwOhMFqx5RpvD6K
	wlGJBZ0Z2K+LKe5/WhqJF0kyZuCfL+deXfUsR5QXSyvStRb2YRAWbm+H9sLkszdn2Rd+
	t2x7sGGDdM9IbdVc+DQJlq4wior+EQI61lIQtWke4ozlxdrXya6WDUFZ8o9pgQQRgLd1
	P2Dg==
X-Gm-Message-State: AOUpUlGaCyMQlKhb2ow1f82E2Hjtn46tddakfOvJPAROz2AJC/Clq1I0
	x65A7SjUPMuLTp79iyUgxQE=
X-Received: by 2002:a1f:5981:: with SMTP id
	n123-v6mr3121404vkb.43.1533871907524; 
	Thu, 09 Aug 2018 20:31:47 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm2690235vkj.24.2018.08.09.20.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 20:31:46 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-2-stefanha@redhat.com>
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
Message-ID: <e9ebeb9b-d72a-1bcd-09c2-c473861990c1@amsat.org>
Date: Fri, 10 Aug 2018 00:31:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180803144721.17036-2-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c35
Subject: Re: [Qemu-arm] [PATCH v4 1/6] hw/arm: make bitbanded IO optional on
 ARMv7-M
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
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QuKFZaXYKGer

On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> Some ARM CPUs have bitbanded IO, a memory region that allows convenient
> bit access via 32-bit memory loads/stores.  This eliminates the need for
> read-modify-update instruction sequences.
> 
> This patch makes this optional feature an ARMv7MState qdev property,
> allowing boards to choose whether they want bitbanding or not.
> 
> Status of boards:
>  * iotkit (Cortex M33), no bitband
>  * mps2 (Cortex M3), bitband
>  * msf2 (Cortex M3), bitband
>  * stellaris (Cortex M3), bitband
>  * stm32f205 (Cortex M3), bitband
> 
> As a side-effect of this patch, Peter Maydell noted that the Ethernet
> controller on mps2 board is now accessible.  Previously they were hidden
> by the bitband region (which does not exist on the real board).
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/armv7m.h |  2 ++
>  hw/arm/armv7m.c         | 37 ++++++++++++++++++++-----------------
>  hw/arm/mps2.c           |  1 +
>  hw/arm/msf2-soc.c       |  1 +
>  hw/arm/stellaris.c      |  1 +
>  hw/arm/stm32f205_soc.c  |  1 +
>  6 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index 78308d1484..2ba24953b6 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -43,6 +43,7 @@ typedef struct {
>   *   devices will be automatically layered on top of this view.)
>   * + Property "idau": IDAU interface (forwarded to CPU object)
>   * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
> + * + Property "enable-bitband": expose bitbanded IO
>   */
>  typedef struct ARMv7MState {
>      /*< private >*/
> @@ -63,6 +64,7 @@ typedef struct ARMv7MState {
>      MemoryRegion *board_memory;
>      Object *idau;
>      uint32_t init_svtor;
> +    bool enable_bitband;
>  } ARMv7MState;
>  
>  #endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 6b07666057..878613994d 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -211,25 +211,27 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&s->container, 0xe000e000,
>                                  sysbus_mmio_get_region(sbd, 0));
>  
> -    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> -        Object *obj = OBJECT(&s->bitband[i]);
> -        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
> +    if (s->enable_bitband) {
> +        for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> +            Object *obj = OBJECT(&s->bitband[i]);
> +            SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
>  
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
> +            object_property_set_int(obj, bitband_input_addr[i], "base", &err);
> +            if (err != NULL) {
> +                error_propagate(errp, err);
> +                return;
> +            }
> +            object_property_set_link(obj, OBJECT(s->board_memory),
> +                                     "source-memory", &error_abort);
> +            object_property_set_bool(obj, true, "realized", &err);
> +            if (err != NULL) {
> +                error_propagate(errp, err);
> +                return;
> +            }
>  
> -        memory_region_add_subregion(&s->container, bitband_output_addr[i],
> -                                    sysbus_mmio_get_region(sbd, 0));
> +            memory_region_add_subregion(&s->container, bitband_output_addr[i],
> +                                        sysbus_mmio_get_region(sbd, 0));
> +        }
>      }
>  }
>  
> @@ -239,6 +241,7 @@ static Property armv7m_properties[] = {
>                       MemoryRegion *),
>      DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Object *),
>      DEFINE_PROP_UINT32("init-svtor", ARMv7MState, init_svtor, 0),
> +    DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index c3946da317..0a0ae867d9 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -186,6 +186,7 @@ static void mps2_common_init(MachineState *machine)
>          g_assert_not_reached();
>      }
>      qdev_prop_set_string(armv7m, "cpu-type", machine->cpu_type);
> +    qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&mms->armv7m), OBJECT(system_memory),
>                               "memory", &error_abort);
>      object_property_set_bool(OBJECT(&mms->armv7m), true, "realized",
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index dbefade644..2702e90b45 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -117,6 +117,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
>      armv7m = DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 81);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> +    qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>                                       "memory", &error_abort);
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index dc521b4a5a..6c69ce79b2 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1304,6 +1304,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      nvic = qdev_create(NULL, TYPE_ARMV7M);
>      qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
>      qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
> +    qdev_prop_set_bit(nvic, "enable-bitband", true);
>      object_property_set_link(OBJECT(nvic), OBJECT(get_system_memory()),
>                                       "memory", &error_abort);
>      /* This will exit with an error if the user passed us a bad cpu_type */
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index c486d06a8b..980e5af13c 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -109,6 +109,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      armv7m = DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> +    qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>                                       "memory", &error_abort);
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> 
