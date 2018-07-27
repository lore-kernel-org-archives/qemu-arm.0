Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp290002wru;
        Thu, 26 Jul 2018 21:55:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgperic4bC+xnrjJ5JKknNkrokaQv0RY6K1sQxGshH4f0yyMcGxZ5ctJvTv+Q24A0JqVwx4t6
X-Received: by 2002:a0c:9088:: with SMTP id p8-v6mr4305860qvp.136.1532667303956;
        Thu, 26 Jul 2018 21:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532667303; cv=none;
        d=google.com; s=arc-20160816;
        b=H161wfWRRYnljOfPRSBRXgPKQnt5z/It8ICJ2QcqWNsNQ2yzLyOWc3D0VfT1Xn40RF
         Z/mPGZ2P6iFVzBAz3jw/yPQacJlYPlvbGC6EVq+x1B/MJvR5qHq7JGHl4+3f+NATSiop
         C/qbCcZrqO0wkqJ23BAkKAH1twIPQlcu2NkpYHPWt32+jWc4AEz6wjH5pHejTDzvTMn4
         Jw4gIgpypKv/ql9gbAk57uuM/Yi8+dxZC7Jr9sTsI0UBw+SbnzCnumtHampJNKI5SWgH
         JL6WujpI8hmVpk6qIYJTrAy6c4r3bZyjZGCUctvpTmsEjVPvJxVcxN76KhZPTZQxOdtT
         hR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=aGw5Uf08IXupjzl49TG1mBsFiJASz+TpuS1AZoINMbM=;
        b=sEUoi+XfKoQv4BSU6rJ4nXZo8XBMqkvotlDrywP+IG0fdXq0N5Vct6CIUN61a4C4jY
         jwWA2FBlo4EMG8bBnyqApN0J2nZHkmMAxdFEo5bXgFmyEjqiiFyQjnsFRSXxmW+TWGAU
         ZBCToe871pWt0fXWxUMOJEu4vlzBHVgHj7H6nPx6HdQrP3EtgOFAAYEYM2JpbJ8lCN3r
         OaJd1ssVCECFbXYznWBYWi3dPYX4WuKCMBUAAZ8g3nlTq2/i1ZV694D51mXGwD8zGYq3
         vACPcyOsS1VWtFkV0WkLoZhI6OhzB4yx0xgxHw9XeKwrnYBd/VzxgN0g1Fw2owkwfIhU
         oChg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t8FhEgqs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g26-v6si3132296qtf.118.2018.07.26.21.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jul 2018 21:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t8FhEgqs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiumN-0002vR-FI
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 00:55:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiul6-0002Eg-NG
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 00:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiul5-0002Fv-BZ
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 00:53:44 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33175)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiul0-0002BC-8J; Fri, 27 Jul 2018 00:53:38 -0400
Received: by mail-vk0-x22a.google.com with SMTP id y70-v6so1883269vkc.0;
	Thu, 26 Jul 2018 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aGw5Uf08IXupjzl49TG1mBsFiJASz+TpuS1AZoINMbM=;
	b=t8FhEgqsRSmImISXv2SL0fS5T5OMLpYJw3G5ApCRbeEIdrr0cQ2psEkg7qay1lpIUW
	V6E/4yK4aOrY0usPL4RW8nmq64utvZSURF19IyS5/fGBeuwyepX2GBKA7ptqZ/9uWdQR
	VEMCUnXjJlMtZLsgFSryTAQUyOGv17zlzpgwaKH6G/agZ5lqEbxwQqbAJl3THQNuPNWj
	ICtmLYTxAuzRIu9GluOdyoOYYkZUXmdszedW4xGa8tSItxOQnl4ujrutVsbMk/rfODgV
	xjD54JkVJR7Pv/Zmkwg43C8Wn8vKjWJ0FtdfXowYU4ynycVjNqxFw8DxFSnZKmjmTmwo
	FpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=aGw5Uf08IXupjzl49TG1mBsFiJASz+TpuS1AZoINMbM=;
	b=bzJBsHUg6CF1MO+m5008FoOWc9VFloS8oUnU3776G+snmD7GkICAgGtg5KfpvsvL6I
	fqp0bSbcjW03JLjTMLkPTrtmzL0QMrCzzcOxEybISAxUPt7RWQOquoaD2wse9wKAFz+Y
	kHc+B4uk1SQHUZzoYOvPm+O5cwctvi+6syed81f/9HUN2ND6xD/GDXvE/nExF4mEZPv0
	idGlIxXPwTChSqOwnKLbufkqMLsGBrm8bfX4Pbwh4NYTQVvaKNEakELIi1AZtxzZJa8f
	QKuI+7kgk0syRd4uJmQCVfgipbZxbRITKeoEE9H0UAQ+dI5I1kGFtq3AgkZnKakeSmYl
	MIzg==
X-Gm-Message-State: AOUpUlGp2bDgs65Nd3pR/nY7SqfrDXtF+M1DmNUyMOIKhjBvJBmrBApb
	yAxMgoyOZBa5boJM8wcVVTw=
X-Received: by 2002:a1f:9cc4:: with SMTP id
	f187-v6mr2935699vke.87.1532667217550; 
	Thu, 26 Jul 2018 21:53:37 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	z14-v6sm643927uao.16.2018.07.26.21.53.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 21:53:36 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-4-stefanha@redhat.com>
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
Message-ID: <d3b4e258-369e-c769-55c1-3b62be174979@amsat.org>
Date: Fri, 27 Jul 2018 01:53:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725085944.11856-4-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 3/7] hw/arm: make bitbanded
 IO optional on ARM M Profile
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
X-TUID: 7bYlq3qzLcyh

On 07/25/2018 05:59 AM, Stefan Hajnoczi wrote:
> Some ARM CPUs have bitbanded IO, a memory region that allows convenient
> bit access via 32-bit memory loads/stores.  This eliminates the need for
> read-modify-update instruction sequences.
> 
> This patch makes this optional feature a ARMMProfile qdev property,
> allowing boards to choose whether they want bitbanding or not.
> 
> Status of boards:
>  * iotkit (Cortex M33), no bitband
>  * mps2 (Cortex M3), bitband
>  * msf2 (Cortex M3), bitband
>  * stellaris (Cortex M3), bitband
>  * stm32f205 (Cortex M3), bitband
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/arm-m-profile.h |  2 ++
>  hw/arm/arm-m-profile.c         | 38 +++++++++++++++++++---------------
>  hw/arm/mps2.c                  |  1 +
>  hw/arm/msf2-soc.c              |  1 +
>  hw/arm/stellaris.c             |  1 +
>  hw/arm/stm32f205_soc.c         |  1 +
>  6 files changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/arm/arm-m-profile.h b/include/hw/arm/arm-m-profile.h
> index ea496d9b88..1eb7a5c328 100644
> --- a/include/hw/arm/arm-m-profile.h
> +++ b/include/hw/arm/arm-m-profile.h
> @@ -50,6 +50,7 @@ typedef struct {
>   *   devices will be automatically layered on top of this view.)
>   * + Property "idau": IDAU interface (forwarded to CPU object)
>   * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
> + * + Property "enable-bitband": expose bitbanded IO
>   */
>  typedef struct {
>      /*< private >*/
> @@ -70,6 +71,7 @@ typedef struct {
>      MemoryRegion *board_memory;
>      Object *idau;
>      uint32_t init_svtor;
> +    bool enable_bitband;
>  } ARMMProfileState;
>  
>  typedef struct {
> diff --git a/hw/arm/arm-m-profile.c b/hw/arm/arm-m-profile.c
> index b7dd2370d4..8bafd6602d 100644
> --- a/hw/arm/arm-m-profile.c
> +++ b/hw/arm/arm-m-profile.c
> @@ -212,25 +212,27 @@ static void arm_m_profile_realize(DeviceState *dev, Error **errp)
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
> @@ -241,6 +243,8 @@ static Property arm_m_profile_properties[] = {
>      DEFINE_PROP_LINK("idau", ARMMProfileState, idau,
>                       TYPE_IDAU_INTERFACE, Object *),
>      DEFINE_PROP_UINT32("init-svtor", ARMMProfileState, init_svtor, 0),
> +    DEFINE_PROP_BOOL("enable-bitband", ARMMProfileState,
> +                     enable_bitband, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 912e1297d5..b232162dbd 100644
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
> index 09cdc61f44..fb5d16338f 100644
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
> index 42785f5bd1..cb22684ffe 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1304,6 +1304,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      nvic = qdev_create(NULL, TYPE_ARM_M_PROFILE);
>      qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
>      qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
> +    qdev_prop_set_bit(nvic, "enable-bitband", true);
>      object_property_set_link(OBJECT(nvic), OBJECT(get_system_memory()),
>                                       "memory", &error_abort);
>      /* This will exit with an error if the user passed us a bad cpu_type */
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 7de1474ade..f78b89d205 100644
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
